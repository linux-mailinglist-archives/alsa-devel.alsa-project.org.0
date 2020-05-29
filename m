Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E851E841E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 18:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01AC4178C;
	Fri, 29 May 2020 18:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01AC4178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590771233;
	bh=DUpSlodiCek+IFu2lfLMiyY7cn5djVeyVK00k2rzt30=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ffhk2fJAOHQIO+8sHh7dZpDDsUd69K1rOgRXAwx4DX/mPpUepwwdw8ZFAv17JSPvI
	 qV43wt7WOhMqqZAhHllSkDrVPMM0iGXo3Ty8wG9g2s9dGLAuZ7ykA2q07v9zd82z5Z
	 fBHPJZ6eZC/KGcNRxFdbw/4Z83HiwMvlodTdd+sE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7CDF80290;
	Fri, 29 May 2020 18:51:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65946F80227; Fri, 29 May 2020 18:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE0EF80149
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 18:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE0EF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qT5Gp919"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C70FC2075A;
 Fri, 29 May 2020 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771062;
 bh=DUpSlodiCek+IFu2lfLMiyY7cn5djVeyVK00k2rzt30=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qT5Gp919zUayt1SVjJ4xEZP3b2Wg/BxW/OyAP8sHbym4irQJat+XIhnpKpcQA6mW2
 o2STtyPK85NpdYQ8k9HNpW/NVps29EtCqvyFkgwsSZHId4huQ5XDpqd0CXIvJQZE5Y
 s1Am/l4kRpX0yHNX5Kq2PNHQCn0hprUj1MIBq5no=
Date: Fri, 29 May 2020 17:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "derek.fang@realtek.com" <derek.fang@realtek.com>
In-Reply-To: <1590750310-30085-1-git-send-email-derek.fang@realtek.com>
References: <1590750310-30085-1-git-send-email-derek.fang@realtek.com>
Subject: Re: [PATCH] Enable class-D silence and clock detections
Message-Id: <159077105220.28617.12455282675668619906.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Fri, 29 May 2020 19:05:10 +0800, derek.fang@realtek.com wrote:
> Avoid noise under bypass boost mode.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: Enable class-D silence and clock detections
      commit: 2aec8ccc1a814ca41b70710e1960afd034d1e3ab

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
