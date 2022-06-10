Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3F546A09
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4305518F6;
	Fri, 10 Jun 2022 18:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4305518F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654876862;
	bh=rzSH/RSyuG4CWrd4Hatex8pHH2v31xWjR6/WgpyRVyo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAqoAW7m/t3D1F7z78Dwj8gXvK45U4KGcDAmSzlsMwaO4fokxgwsMpG/IpzyUjQi/
	 f2hn29Ns+hdXidUAPMelM0N5V4ynsThNw3Jbmp/FNApm2MxvMKpEWtRJqKyybgTloq
	 hjPLxnrsKVgsBmalhp4lRJuZuHljffS6k1O30ew8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B50BF80537;
	Fri, 10 Jun 2022 17:59:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44B2F80515; Fri, 10 Jun 2022 17:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D15E8F804D8
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 17:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D15E8F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mmYi3XaT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 955AFB83634;
 Fri, 10 Jun 2022 15:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B3EC3411B;
 Fri, 10 Jun 2022 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654876735;
 bh=rzSH/RSyuG4CWrd4Hatex8pHH2v31xWjR6/WgpyRVyo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mmYi3XaT24Whre/dR0dLpUupQD6pU/v/PsljYUiX3kxJm4RuLBVGO9425ULgs/lvi
 sF9xoVJgx0Du1f/KtQcmudgSvlKTSMIDe/WvTRSqd5dgbU/5OBaQBpiS3C73/OKmbJ
 FNMyVXsOf+8Ynfdp+hWvzIROrxLd1oMqdl3fU4yj1pcMouTpnvTJ7iXPfWd2xp7zF0
 x6fvi+aAXiq1HuNxQiq2BL3EDMGJKfB8iGEzfAGtVdoVARKLUah0VGqV67c1UIbMOT
 saKLuEor0td4Wm7g8xISabqCIZWWg8ojncPVsD1qO56eUaEZ0OiwglrCQk3k+ctM0D
 W2hYHVLN3NYZg==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
In-Reply-To: <20220609111901.318047-1-srinivas.kandagatla@linaro.org>
References: <20220609111901.318047-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: qualcomm move gain to S8_TLV
Message-Id: <165487673382.1755957.2629868931367227265.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 16:58:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

On Thu, 9 Jun 2022 12:18:59 +0100, Srinivas Kandagatla wrote:
> Move all the digital and IIR gains form using SX_TLV to S8_TLV,
> these gains are actually 8 bit gains with 7th signed bit and
> ranges from -84dB to +40dB
> 
> Tested on DB410c with Headset playback
> 
> Thanks,
> Srini
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
      commit: 5babb012c847beb6c8c7108fd78f650b7a2c6054
[2/2] ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
      commit: 2fbe0953732e06b471cdedbf6f615b84235580d8

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
