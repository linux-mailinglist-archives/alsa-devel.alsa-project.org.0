Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392B2616FC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A43915E4;
	Tue,  8 Sep 2020 19:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A43915E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599585821;
	bh=Ja9hL6KF26G2I1GvZlGJGPbFxGYhbjPc5NzEgAnOSfU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zh7V6UzVgrHmiSrhf9uSYgGenCgPzF3GFbSDHR5ZT3LFsMRW6OfL3P+q9rxI2y2+7
	 X+7hRqpdm//qS3wwMnkmyt/ZV0hY3otzn8S96ru3UlFmbTm/xk7xDlbucGMfAcyQVO
	 CNJyrqUFUti0KUNW3abGmXXvOWrqGaPhE6s9IZ+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C12C0F8015F;
	Tue,  8 Sep 2020 19:21:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D956DF80264; Tue,  8 Sep 2020 19:21:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4707F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4707F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="11JAGinw"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53DF8206B5;
 Tue,  8 Sep 2020 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599585664;
 bh=Ja9hL6KF26G2I1GvZlGJGPbFxGYhbjPc5NzEgAnOSfU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=11JAGinwUI6ZZ8FvZzaS1tGG+gQBE+k1ZhDNyE/n1ots5Wq3+3T2GJ0Kx7/eRikzG
 63b4w5c2R85aI3LbkUfXHehRLL47tQQS6gAroQhXL+LQtFzIWuKarfG+Q9XCxmv97X
 IVT03qfQQIp6VtlW9jUbmbLy+5F+he+Xpfm9pagM=
Date: Tue, 08 Sep 2020 18:20:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200826095141.94017-1-stephan@gerhold.net>
References: <20200826095141.94017-1-stephan@gerhold.net>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: common: Parse auxiliary devices from
 device tree
Message-Id: <159958562064.16576.531530312246805516.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Wed, 26 Aug 2020 11:51:39 +0200, Stephan Gerhold wrote:
> In some cases we need to probe additional audio components that do
> not appear as part of the DAI links specified in the device tree.
> Examples for this are auxiliary devices such as analog amplifiers
> or codecs.
> 
> The ASoC core provides a way to probe these components by adding
> them to snd_soc_card->aux_dev.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
      commit: cdd3b8daf26e5eb2e97b6a37dfdb83597bcbdc52
[2/2] ASoC: qcom: common: Parse auxiliary devices from device tree
      commit: 1b839d3e15fd48e4278c83190725467713a5b3c6

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
