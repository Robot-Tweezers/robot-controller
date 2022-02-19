#include <Arduino.h>
#include <unity.h>
#include <actuator.hpp>

using namespace RobotTweezers;

extern void unittest_skew3(void);
extern void unittest_xRotation(void);
extern void unittest_zRotation(void);
extern void unittest_Kahan_problem1(void);
extern void unittest_Kahan_problem2(void);
extern void unittest_Kahan_problem3(void);
extern void unittest_Kahan_problem4(void);
extern void unittest_setCoordinates(void);

extern void unittest_StepperControl(void);

void (*unittests[])(void) = {
    unittest_StepperControl
};

void setup()
{
    // NOTE!!! Wait for >2 secs
    // if board doesn't support software reset via Serial.DTR/RTS
    delay(2000);
    UNITY_BEGIN();

    for (auto func : unittests)
    {
        RUN_TEST(func);
    }
}

void loop()
{
    UNITY_END();
}