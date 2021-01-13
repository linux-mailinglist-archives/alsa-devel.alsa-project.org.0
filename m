Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D5A2F4E97
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:29:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D08B172D;
	Wed, 13 Jan 2021 16:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D08B172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551752;
	bh=eEcbkRzk8bWXVOlfj158dOfEWwEYLSTHoyanoSEtP88=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aIH5lqSNqjor1cJfcn1RiJh744PCTBcjaJ9nrzbTJsSPsg086C5SCb6Vc3JItsbBm
	 04LJSUnq/B4ZAX9krV4AExPim0JXVGjliM6iCjjiKshGFIgdS74JN5tfEc6vc8iPn7
	 8fEm7CsWGzMIsSaBZLhTVOI7fKlyO+j4cmSdPZZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A80AEF8025F;
	Wed, 13 Jan 2021 16:27:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93A8FF8026D; Wed, 13 Jan 2021 16:27:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE65EF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE65EF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NAsT1SH6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9CF623382;
 Wed, 13 Jan 2021 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610551648;
 bh=eEcbkRzk8bWXVOlfj158dOfEWwEYLSTHoyanoSEtP88=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NAsT1SH66xRMBLoY2fCXoXUlEgYlBdXlnSUSTKi8lj90ogVFla84CXJvXZ/e0YzI2
 eHYqSv5t1g3w1KMaf39U78W78Euq1cNAZgTpuglx1L60QuXtthy+10du1YDt80dDW6
 bfbQTt16wCkz9o7o3o6O30dsMPj6uUBLwVDVDANZP9rh+1y7QDphoRnTnZoDn+nng3
 QDZ5wVscedLusUInZH2OhG2q56PzLnPDExq8REsPkKWgoc7uiUReR90LnZ/I4qW1oG
 Hc0CpO5gka6n/cdiDndvF1tnGRC4FmBQGYcMNh2S3cIM/83ykLLW94yV1UE0GvM1VJ
 hX204D/7fjs5g==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20201211203255.148246-1-stephan@gerhold.net>
References: <20201211203255.148246-1-stephan@gerhold.net>
Subject: Re: [PATCH] ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai
Message-Id: <161055160365.21623.6334522297634428774.b4-ty@kernel.org>
Date: Wed, 13 Jan 2021 15:26:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
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

On Fri, 11 Dec 2020 21:32:55 +0100, Stephan Gerhold wrote:
> At the moment it is necessary to set up the DAPM routes between
> front-end AIF<->DAI explicitly in the device tree, e.g. using
> 
> 	audio-routing =
> 		"MM_DL1", "MultiMedia1 Playback",
> 		"MM_DL3", "MultiMedia3 Playback",
> 		"MM_DL4", "MultiMedia4 Playback",
> 		"MultiMedia2 Capture", "MM_UL2";
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai
      commit: 6fd8d2d275f74baa7ac17b2656da1235f56dab99

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
