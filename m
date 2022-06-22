Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE7E554FAA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:43:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4CC2838;
	Wed, 22 Jun 2022 17:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4CC2838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912629;
	bh=74OTJmsDUnJ8Yy67wCt0W4gdTWxoxbdt0Ekwa+iJXlw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SzN46z1141xYDBd+vYZXHb0RFeoUd99drlc0bmzusAz8d3t33y5zu8FPEQKAagSXF
	 ZDDzdTn5neOmKAMVnR/QUYHTRtALSMvEjZlLlSILjPHb4VHdCQWBj4zOmtvJmn7zju
	 TaBJSfj76+sKP+KFPx8cW3h8FEOmpDbNDDz7AtQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0CF6F80791;
	Wed, 22 Jun 2022 17:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B47CF802D2; Wed, 22 Jun 2022 17:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4A21F800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 17:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4A21F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wd3MRhoZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4D6C9CE20E9;
 Wed, 22 Jun 2022 15:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821F2C34114;
 Wed, 22 Jun 2022 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655911005;
 bh=74OTJmsDUnJ8Yy67wCt0W4gdTWxoxbdt0Ekwa+iJXlw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Wd3MRhoZEa6qShbmTQ//LXyurzxGZedShHyF58V4d/EgvL0X0NAU6WbQjTyrsDCFy
 9o6DzQBjeTAVrFaODUGwNzjWaoCZaomicw4Yz0hU37Q4HtmjEPKP5QpbzZxh61TIle
 VNaUfM6ZI3D7gX/pX/Dt07tQc3sTOG1abvL6llR/iSnNhsy6lnNJoXQH0yB1zO8Rs4
 ryl2ehKgtUYQJ99Okc2O5QWFF377RFC9m7TA/ATUZN8TQEPq/lcfeBPoMAeCCHwYHX
 frMeOdV7fGBnNCxVvKViwd/uGsp9eLgSEEcYIEfWvDGpUE8Lpe6VfYddUCmnYj/OMD
 bT9FlVvImCbeg==
From: Mark Brown <broonie@kernel.org>
To: aidanmacdonald.0x0@gmail.com
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: (subset) [PATCH 00/49] regmap-irq cleanups and refactoring
Message-Id: <165591099823.672192.3312043171342090457.b4-ty@kernel.org>
Date: Wed, 22 Jun 2022 16:16:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:19 +0200
Cc: alsa-devel@alsa-project.org, rafael@kernel.org, linus.walleij@linaro.org,
 tiwai@suse.com, cristian.ciocaltea@gmail.com, mani@kernel.org,
 lee.jones@linaro.org, samuel@sholland.org, zhang.lyra@gmail.com, brgl@bgdev.pl,
 mazziesaccount@gmail.com, michael@walle.cc, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, myungjoo.ham@samsung.com,
 agross@kernel.org, orsonzhai@gmail.com, linux-sunxi@lists.linux.dev,
 b.zolnierkie@samsung.com, linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 tglx@linutronix.de, bjorn.andersson@linaro.org,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, maz@kernel.org, baolin.wang7@gmail.com,
 srinivas.kandagatla@linaro.org
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

On Mon, 20 Jun 2022 21:05:55 +0100, Aidan MacDonald wrote:
> Here's a bunch of cleanups for regmap-irq focused on simplifying the API
> and generalizing it a bit. It's broken up into three refactors, focusing
> on one area at a time.
> 
> * Patches 01 and 02 are straightforward bugfixes, independent of the
>   rest of the series. Neither of the bugs are triggered by in-tree
>   drivers but they might be worth picking up early anyhow.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[01/49] regmap-irq: Fix a bug in regmap_irq_enable() for type_in_mask chips
        commit: 485037ae9a095491beb7f893c909a76cc4f9d1e7
[02/49] regmap-irq: Fix offset/index mismatch in read_sub_irq_data()
        commit: 3f05010f243be06478a9b11cfce0ce994f5a0890

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
