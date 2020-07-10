Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AA21B9B4
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 17:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91FD01663;
	Fri, 10 Jul 2020 17:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91FD01663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594395742;
	bh=yFPT4h/KMgvzJQDGMmQZ0nn6DIAU8lqRuotl4oUgUFU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQ3U4ZOfX3mt5FuNGmU9j+t3yy69khAFT8m2T2OqHC4WJOO1qj7fPTZ8QoQXExba3
	 k/3M5kWq+7VA0zIrJ+SepFCitCYNXXyAWbSR9WKqzkfq4sWBmjpfJI1vynOD5G8Lpt
	 1ycJohzQcg3DBqYLKiJk8mTsUuFB2wXT8u/3JWqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D6C1F80258;
	Fri, 10 Jul 2020 17:40:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C2FBF80258; Fri, 10 Jul 2020 17:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS,
 SUBJECT_NEEDS_ENCODING,SUBJ_ILLEGAL_CHARS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4051F8015A
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 17:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4051F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NBWuq7fz"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 294822078B;
 Fri, 10 Jul 2020 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594395589;
 bh=yFPT4h/KMgvzJQDGMmQZ0nn6DIAU8lqRuotl4oUgUFU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=NBWuq7fzCYj25mKzhn4FyAAA3LIXke7Qcw6CqIj3dQOTDdIGFbB1pZz5Wu3Bq7rtG
 gJ8XFMG5B2mf/l1t/Dump1DTqv22IwBcqDfUD3cqowc86NoDoiWWnaOo7WeTaz7qdf
 w0ieZrvJ9U90qcQ4hRC0rYQ2j9a14GAASNsjs4Oc=
Date: Fri, 10 Jul 2020 16:39:43 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
References: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4 00/10] ASoC: Clean-up W=1 build warnings​ - part2
Message-Id: <159439557864.48910.8925222039037389087.b4-ty@kernel.org>
Cc: tiwai@suse.de, Lee Jones <lee.jones@linaro.org>
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

On Thu, 9 Jul 2020 11:23:17 -0500, Pierre-Louis Bossart wrote:
> Both Lee Jones and I submitted separate series, this is the second
> part of the merged result, for which no feedback was provided.
> 
> I picked Lee's patches for rt5659 and ak4458 and added the pxa and
> ux500 that I didn't fix. The rest is largely identical between our
> respective series, with the exception of the sunxi which I documented
> and Lee removed. I don't have any specific preference and will go with
> the flow on this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: sti: uniperif: fix 'defined by not used' warning
        commit: 97d73032a89d85437d6be354ef1cfde7dd97a24a
[02/10] ASoC: qcom: qdsp6: q6asm: Provide documentation for 'codec_profile'
        commit: d4633504213eff9913f722da7320e23eecd48b59
[03/10] ASoC: sunxi: sun4i-i2s: add missing clock and format arguments in kernel-doc
        commit: 643e305e9b2c42800fe73ac0e23bd02ba87fe202
[04/10] ASoC: sunxi: sun4i-spdif: Fix misspelling of 'reg_dac_txdata' in kernel-doc
        commit: c7202a19cf838d2a999e554cffa552bf7f480fde
[05/10] ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
        commit: 701f4727f7bb35e9dca7e2c65f44af0608ef3d6b
[06/10] ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and 'reg_val_TSTDR'
        commit: 79b094c9dcd70123f51e4039ea9a29ebbd073edd
[07/10] ASoC: codecs: rt5631: fix spurious kernel-doc start and missing arguments
        commit: 762a3d4313aa44a2158c95fbc6e95ec19b7add4a
[08/10] ASoC: codecs: rt5659: Remove many unused const variables
        commit: e57f0e4d4a836e37c5af7ddf1a2c3e09c7970239
[09/10] ASoC: codecs: tlv320aic26: Demote seemingly unintentional kerneldoc header
        commit: c90a67458ee158ba770d656ec66abca81e23f53a
[10/10] ASoC: codecs: ak4458: Remove set but never checked variable 'ret'
        commit: cc3cceedcb7e92ad0a43e5a4a42e653e9d919109

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
