Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A20E1B0E5A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 16:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF0D1690;
	Mon, 20 Apr 2020 16:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF0D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587392947;
	bh=iHr1Cn1jxEVva69HoDHFKc/6TcVS4pEiRER0S2RgaRg=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAsNry9Grqn8N1/a2Vo8prpgdpy2MmctlzV4blC70LDbZ/rTdzPHyANcd+bvferPR
	 C8dNldcREjaqYqgh04pC1Sl1tugyuHpFBhUREosTvHMv349DG02mPLPcPAG9NNnBGM
	 g8hCPccVM2AonKKVlOglOWc3GnQDa6kixyoxzTjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E19ADF800E7;
	Mon, 20 Apr 2020 16:27:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F33F801D9; Mon, 20 Apr 2020 16:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 574D2F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 16:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574D2F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yN4WOCrp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBD25206DD;
 Mon, 20 Apr 2020 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587392840;
 bh=iHr1Cn1jxEVva69HoDHFKc/6TcVS4pEiRER0S2RgaRg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yN4WOCrpgTKIeQzG9EZzX1QBBpnnaUJpzjI9jAPMJPHEkDmuniO0zx7hFkhKMpzeY
 efH+aDy3yze63LTFbBY13mL4d0mJENhNQnbeDHVYzP2aXKtQqyQs+NLxZS5canCOzU
 IEXHqG3qX0g+DQmpxZ/wiS1+5DItg6NUbmxkvjNw=
Date: Mon, 20 Apr 2020 15:27:17 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, linux-kernel@vger.kernel.org,
 Jason Yan <yanaijie@huawei.com>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20200420042847.19206-1-yanaijie@huawei.com>
References: <20200420042847.19206-1-yanaijie@huawei.com>
Subject: Re: [PATCH] ASoC: wcd9335: remove unneeded semicolon
Message-Id: <158739283776.7647.16702267883187620715.b4-ty@kernel.org>
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

On Mon, 20 Apr 2020 12:28:47 +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> sound/soc/codecs/wcd9335.c:2606:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3619:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:2849:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:2955:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:2988:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3960:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3776:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3924:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3355:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3832:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3079:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3089:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3232:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3878:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3578:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3728:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:1922:3-4: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:1938:3-4: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:1944:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:3144:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:2568:2-3: Unneeded semicolon
> sound/soc/codecs/wcd9335.c:2219:2-3: Unneeded semicolon
> 
> [...]

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: wcd9335: remove unneeded semicolon
      commit: 6b6d5043621fff6e71b7501018a4d58a59cf9527

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
