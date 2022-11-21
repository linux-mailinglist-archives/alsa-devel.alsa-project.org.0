Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE62633876
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB49D1640;
	Tue, 22 Nov 2022 10:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB49D1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109430;
	bh=m9yZHwnTEqGasYZNomMe1mRJHVzf8B7M3LDSNHYcXeA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psJmfO6WC0ydG/+vNhV3hjMH1Bw0bZcFYfrUuoIIeIZjwH/ouEPx3eoEZd1RaLlAb
	 lQSHXFKlyUvDU9lPUGVqG8SS+gs4hHZDjXjqc2udvYnxg7bURK+ENdMGb7ocpq/qr4
	 vqhEFtxxMXABe5KXCzJOBXeRkhIdKEOD0vP7SlMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A758EF80589;
	Tue, 22 Nov 2022 10:27:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA4C8F8028D; Mon, 21 Nov 2022 10:53:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48943F80115
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 10:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48943F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Opj/itLb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8EB560F97;
 Mon, 21 Nov 2022 09:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F83C433C1;
 Mon, 21 Nov 2022 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669024397;
 bh=m9yZHwnTEqGasYZNomMe1mRJHVzf8B7M3LDSNHYcXeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Opj/itLbJtFE0syJxd+qkemdvm+GfbfZ1pccF1SGR++3DJnkeyD3YQtGhN+blIjub
 US8fX8iushvScwunkPr7LKirCchaNKKAU/twl0oVnqHEwdHsHxi0M0d/wgtlpEZqG7
 k4ovt/Znm0DICj47Y+N6I+Yw47E1MyyiN0e/92S2h9qHrb149jszKe3FalK/2rVJQ+
 ZppAyMp4v8rjq+XBX9JSBl1ysXWpcIvX0EVYeK13kfbg9IEzo070nVbf9UiCPP9DpS
 bXABnzNPLB0lPKqHS3KQR0EQyUsQW7BynY23b8Z2+QTbLFxJQgHRN0fjhkCpVJB9+z
 k93zjyweI0uEQ==
Date: Mon, 21 Nov 2022 09:53:05 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <Y3tKgXPJP7S48i3j@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:18 +0100
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 18 Nov 2022, Uwe Kleine-König wrote:

> Hello,
> 
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.

Oh yeah, this!  Thanks for picking this up Uwe, I guess I've been
distracted for the past 6 years or so. :)

> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_device_id_helper-immutable
> 
> I don't think it's feasable to apply this series in one go, so I ask the
> maintainers of the changed files to apply via their tree. I guess it
> will take a few kernel release iterations until all patch are in, but I
> think a single tree creates too much conflicts.
> 
> The last patch changes i2c_driver::probe, all non-converted drivers will
> fail to compile then. So I hope the build bots will tell me about any
> driver I missed to convert. This patch is obviously not for application
> now.
> 
> I dropped most individuals from the recipents of this mail to not
> challenge the mail servers and mailing list filters too much. Sorry if
> you had extra efforts to find this mail.

[...]

>  drivers/mfd/88pm800.c                            |  5 ++---
>  drivers/mfd/88pm805.c                            |  5 ++---
>  drivers/mfd/aat2870-core.c                       |  5 ++---
>  drivers/mfd/act8945a.c                           |  5 ++---
>  drivers/mfd/adp5520.c                            |  6 +++---
>  drivers/mfd/arizona-i2c.c                        |  6 +++---
>  drivers/mfd/as3711.c                             |  5 ++---
>  drivers/mfd/as3722.c                             |  5 ++---
>  drivers/mfd/atc260x-i2c.c                        |  5 ++---
>  drivers/mfd/axp20x-i2c.c                         |  5 ++---
>  drivers/mfd/bcm590xx.c                           |  5 ++---
>  drivers/mfd/bd9571mwv.c                          |  5 ++---
>  drivers/mfd/da903x.c                             |  6 +++---
>  drivers/mfd/da9052-i2c.c                         |  6 +++---
>  drivers/mfd/da9055-i2c.c                         |  5 ++---
>  drivers/mfd/da9062-core.c                        |  6 +++---
>  drivers/mfd/da9063-i2c.c                         |  6 +++---
>  drivers/mfd/da9150-core.c                        |  5 ++---
>  drivers/mfd/khadas-mcu.c                         |  5 ++---
>  drivers/mfd/lm3533-core.c                        |  5 ++---
>  drivers/mfd/lp3943.c                             |  4 ++--
>  drivers/mfd/lp873x.c                             |  5 ++---
>  drivers/mfd/lp87565.c                            |  5 ++---
>  drivers/mfd/lp8788.c                             |  4 ++--
>  drivers/mfd/madera-i2c.c                         |  6 +++---
>  drivers/mfd/max14577.c                           |  6 +++---
>  drivers/mfd/max77620.c                           |  6 +++---
>  drivers/mfd/max77693.c                           |  6 +++---
>  drivers/mfd/max77843.c                           |  6 +++---
>  drivers/mfd/max8907.c                            |  5 ++---
>  drivers/mfd/max8925-i2c.c                        |  5 ++---
>  drivers/mfd/max8997.c                            |  6 +++---
>  drivers/mfd/max8998.c                            |  6 +++---
>  drivers/mfd/mc13xxx-i2c.c                        |  6 +++---
>  drivers/mfd/menelaus.c                           |  5 ++---
>  drivers/mfd/menf21bmc.c                          |  4 ++--
>  drivers/mfd/palmas.c                             |  5 ++---
>  drivers/mfd/pcf50633-core.c                      |  5 ++---
>  drivers/mfd/rc5t583.c                            |  5 ++---
>  drivers/mfd/retu-mfd.c                           |  4 ++--
>  drivers/mfd/rk808.c                              |  5 ++---
>  drivers/mfd/rohm-bd718x7.c                       |  5 ++---
>  drivers/mfd/rsmu_i2c.c                           |  6 +++---
>  drivers/mfd/rt5033.c                             |  5 ++---
>  drivers/mfd/sec-core.c                           |  5 ++---
>  drivers/mfd/si476x-i2c.c                         |  6 +++---
>  drivers/mfd/sky81452.c                           |  5 ++---
>  drivers/mfd/stmfx.c                              |  5 ++---
>  drivers/mfd/stmpe-i2c.c                          |  5 +++--
>  drivers/mfd/stpmic1.c                            |  5 ++---
>  drivers/mfd/stw481x.c                            |  5 ++---
>  drivers/mfd/tc3589x.c                            |  6 +++---
>  drivers/mfd/ti-lmu.c                             |  5 +++--
>  drivers/mfd/tps6105x.c                           |  5 ++---
>  drivers/mfd/tps65010.c                           |  6 +++---
>  drivers/mfd/tps6507x.c                           |  5 ++---
>  drivers/mfd/tps65086.c                           |  5 ++---
>  drivers/mfd/tps65090.c                           |  5 ++---
>  drivers/mfd/tps65218.c                           |  5 ++---
>  drivers/mfd/tps6586x.c                           |  5 ++---
>  drivers/mfd/tps65910.c                           |  6 +++---
>  drivers/mfd/tps65912-i2c.c                       |  5 ++---
>  drivers/mfd/twl-core.c                           |  5 +++--
>  drivers/mfd/twl6040.c                            |  5 ++---
>  drivers/mfd/wl1273-core.c                        |  5 ++---
>  drivers/mfd/wm831x-i2c.c                         |  6 +++---
>  drivers/mfd/wm8350-i2c.c                         |  5 ++---
>  drivers/mfd/wm8400-core.c                        |  5 ++---
>  drivers/mfd/wm8994-core.c                        |  6 +++---

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee@kernel.org>

>  drivers/video/backlight/adp8860_bl.c             |  6 +++---
>  drivers/video/backlight/adp8870_bl.c             |  6 +++---
>  drivers/video/backlight/arcxcnn_bl.c             |  4 ++--
>  drivers/video/backlight/bd6107.c                 |  5 ++---
>  drivers/video/backlight/lm3630a_bl.c             |  5 ++---
>  drivers/video/backlight/lm3639_bl.c              |  5 ++---
>  drivers/video/backlight/lp855x_bl.c              |  5 +++--
>  drivers/video/backlight/lv5207lp.c               |  5 ++---
>  drivers/video/backlight/tosa_bl.c                |  5 ++---
>  drivers/video/fbdev/matrox/matroxfb_maven.c      |  5 ++---

For my own reference (apply this as-is to your sign-off block):

  Acked-for-Backlight-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
