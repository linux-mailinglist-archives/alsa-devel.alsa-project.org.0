Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF4553FC1B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF061A23;
	Tue,  7 Jun 2022 12:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF061A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599029;
	bh=L5UprDm+eFlKd0eGBmXLIaDF8ATDo8XW9lH/TYTLBUc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aUs8FCqFoCHp4CRG9wi/5Pa4LfX9iWfkfnEyIl0JEB84IKCkIzAttIKivxD+P1a+j
	 IdneX+vDZraBlVcmLNMwAGhp1m2VWdt8zCH095dNJ8B+bJuMTKkMLnZirIuec9FQjG
	 oMqkCo7lbl71BruDQirmx3WSp8dR5Gnco3VA53rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF8DF805B2;
	Tue,  7 Jun 2022 12:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B316F805A9; Tue,  7 Jun 2022 12:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8847EF80588
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8847EF80588
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U7ZorcJL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88909B81EEF;
 Tue,  7 Jun 2022 10:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A813C385A5;
 Tue,  7 Jun 2022 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598750;
 bh=L5UprDm+eFlKd0eGBmXLIaDF8ATDo8XW9lH/TYTLBUc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=U7ZorcJLYtG28or0KrIhV9ZevaqjS5ymiucoZSkHfYPcE3YjOmj0B/QVxKNkj3da8
 f+kCqKjDbZSmZtpqK8bYzAcqF+3cPgA67OdHbz08NByI37/CipYjTroKGhS37O26Mz
 hr5E7cTIpc7LLBrmkE+6fm6SD255/oI2Avclic0U7T/a+B8BEr0qWrDMkX32lisIme
 1ZMc1qfOgErzEpLbmr90uMNlcVHXuVJqkNqSdW2usEdvoLF00xRJRkbCz58RngY0i+
 nB4JLb0O1eTfMhmF5sHNDXfyANzPSJcsnd+aLDSFx4RMOrcnC/YIIGw4tUxzPeVLmJ
 aPG5K1EM/a9Yg==
From: Mark Brown <broonie@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht, amartinz@shiftphones.com
In-Reply-To: <20220602164504.261361-1-amartinz@shiftphones.com>
References: <20220602164504.261361-1-amartinz@shiftphones.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: tfa989x: Add support for tfa9890
Message-Id: <165459874728.301808.2918260334640693383.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: me@dylanvanassche.be, alsa-devel@alsa-project.org, stephan@gerhold.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 caleb@connolly.tech, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, phone-devel@vger.kernel.org
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

On Thu, 2 Jun 2022 18:45:03 +0200, Alexander Martinz wrote:
> The initialization sequence is taken from the version provided
> by the supplier [1].
> 
> This allows speakers using the TFA9890 amplifier to work, which are
> used by various mobile phones such as the SHIFT6mq.
> 
> [1]: https://source.codeaurora.org/external/mas/tfa98xx/tree/src/tfa_init.c?id=d2cd12931fbc48df988b62931fb9960d4e9dc05d#n1827
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: tfa989x: Add support for tfa9890
      commit: ef6c320942a2f057204702d769d507186fd7f0b7
[2/2] ASoC: dt-bindings: nxp,tfa989x: Add tfa9890 support
      commit: d0da7c8668dc19df157d927a67721ca00e29ff2b

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
