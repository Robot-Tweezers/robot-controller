function [end_eff_frame, end_eff_origin] = direct_kinematics(theta, parameters)
%DIRECT_KINEMATICS Computes the 6 DOF position of a spherical wrist end-effector given
%joint states.
%   Detailed explanation goes here

DH_parameters = [
    [theta(1), parameters('LENGTH1'), 0, pi / 2 ];
    [theta(2), 0,                     0, -pi / 2];
    [theta(3), parameters('LENGTH2'), 0, 0      ];
];
end_effector = eye(4);

for i=1:size(DH_parameters, 1)
    d = DH_parameters(i, 2);
    a = DH_parameters(i, 3);
    alpha = DH_parameters(i, 4);
    end_effector = end_effector * denavit_hartenberg_transform(theta(i), d, a, alpha);
end

end_eff_frame = round(end_effector(1:3, 1:3), 6);
end_eff_origin = round(end_effector(1:3, 4), 6);

end
