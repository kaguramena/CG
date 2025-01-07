#version 330 core
in vec3 Col;         // 传入的颜色
out vec4 FragColor;  // 输出的片段颜色

void main()
{
    // 定义圆心位置
    vec2 center = vec2(1200.0f,600.0f);  // 假设屏幕大小为 800x600，圆心在屏幕中心

    // 圆的半径
    float r = 100.0f;

    // 计算当前片段位置和圆心的距离
    float dist = distance(gl_FragCoord.xy, center);

    // 如果片段离圆心的距离大于半径，丢弃该片段
    if (dist > r)
    {
        FragColor = vec4(1.0f);
    }
    else{
        // 否则，绘制圆的内部颜色
        FragColor = vec4(Col, 1.0f);  // 圆内片段的颜色，alpha 为 1.0（不透明）
    }

}