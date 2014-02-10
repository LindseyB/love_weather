function love.load()
	particle = love.graphics.newImage("snow.png")

	rain_system = love.graphics.newParticleSystem(particle, 1000)
	snow_system = love.graphics.newParticleSystem(particle, 1000)


	rain_system:setEmissionRate(100)

	rain_system:setSpeed(1,3)

	-- gravity, xmin ymix xmax ymax
	rain_system:setLinearAcceleration( 1, 500, 1, 600)

	-- starting size to ending size
	rain_system:setSizes(0.5,0.4,0.3)

	-- location of the emitter (x,y)
	rain_system:setPosition(400, 0)

	-- how long the emitter lasts, -1 is infinite
	rain_system:setEmitterLifetime(-1)

	-- how long the particles last min, max in seconds
	rain_system:setParticleLifetime(2,3.5)

	-- sets the direction in radians
	rain_system:setDirection(.45)

	-- maximum distance from emitter (distributon, x, y)
	rain_system:setAreaSpread("normal",300,0)

	-- colors for the particles, can have many
	rain_system:setColors(0,0,255,200, 0,0,255,250, 0,0,255,255)

	rain_system:start()

	-- starting snow system info

	snow_system:setEmissionRate(100)
	snow_system:setSpeed(1,3)
	snow_system:setLinearAcceleration(-20, 50, 20, 100)
	snow_system:setSizes(0.7,0.6,0.5)
	snow_system:setPosition(400,0)
	snow_system:setEmitterLifetime(-1)
	snow_system:setParticleLifetime(3,5.5)
	snow_system:setDirection(.45)
	snow_system:setAreaSpread("normal",300,0)
	snow_system:setColors(255,255,255,200)
	snow_system:stop()

	rain = true

end


function love.update(dt)
	if rain then
		rain_system:update(dt)
	else
		snow_system:update(dt)
	end
end

function love.draw()
	if rain then
		love.graphics.setBackgroundColor(255,255,255)
		love.graphics.draw(rain_system)
	else
		love.graphics.setBackgroundColor(0,0,0)
		love.graphics.draw(snow_system)
	end
end

function love.keyreleased(key)
   if key == "return" then
		if rain then
			rain_system:stop()
			snow_system:start()
		else
			snow_system:stop()
			rain_system:start()
		end
		rain = not rain
   end
end