Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB063949B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:18:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323711831;
	Sat, 26 Nov 2022 09:17:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323711831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450715;
	bh=flrWhKxQcLgnkz5HWwKc3eGDBXHd2DZVGZMjdcPc5hY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjIo5Fo31ZOgIxopDkKJnA5U+tqEdpK6FkT101DJQvd4a50XjeI2EmMCyFW5+PMrl
	 QJGRG0OtoKx2+l5Fc967DK4vsFxS/OWA7uDelUhjWxF/k3rj9WgODebwn7/A3wOC0T
	 HS9Cs1JyQzMh4NI58tYb+fSFj2OgrqQyeLWYU3xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA6D3F807DE;
	Sat, 26 Nov 2022 09:00:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE92F805AB; Fri, 25 Nov 2022 15:27:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66263F805A1
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66263F805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CyHabUYc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 168EEB82B02;
 Fri, 25 Nov 2022 14:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59CBC433D6;
 Fri, 25 Nov 2022 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386434;
 bh=flrWhKxQcLgnkz5HWwKc3eGDBXHd2DZVGZMjdcPc5hY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CyHabUYcBi83iBg+IXQCXTmWKh/Vsse6jNqtBrOcjWNjpEEPUkYxmD/0nZ5c5ugKO
 jo6Z8/gl+MgvM2sAwEq6RdlT5vgN1k6ZJ+hqcP93CQj09ymCKeE30N8oa3t0Dyb2ta
 8+lhrsfn7LySe/twThGMfi4tdsvHPQplnQuaeGcZds17fbxEN/133XbiwZ446jPLS9
 1J6PAAF8g/44RhMnx0oz0XFgtuVlOhD80/f7Dhydm3vHtZMKjn7bF0j0c8/R2UsycZ
 cywT0qiXBo9L2PFUprEkr+T5u7/lhadYuK2q+CTR0j12IAxjD6y0soSJBSn9D8biJo
 PV6iVB08gZr+A==
From: Mark Brown <broonie@kernel.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166938642447.506633.10798171870515262916.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:27:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
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

On Fri, 18 Nov 2022 23:35:34 +0100, Uwe Kleine-König wrote:
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
> 
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[601/606] ASoC: codecs: es8326: Convert to i2c's .probe_new()
          commit: 784252bac835c831e10c48be633cd1ff0d697326
[602/606] ASoC: max98396: Convert to i2c's .probe_new()
          commit: 2ff85020ec5db4af3b55d35f5b8385e830c39fdd
[603/606] ASoC: codecs: src4xxx-i2c: Convert to i2c's .probe_new()
          commit: 830a35aa2121258d0c8283abe45ebb5c3d2fd791
[604/606] ASoC: codecs: tas2780: Convert to i2c's .probe_new()
          commit: 88ade2abba1e46fe581610911240054538f8db88

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
