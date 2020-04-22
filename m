Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26D01B445C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 14:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720FE16A9;
	Wed, 22 Apr 2020 14:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720FE16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587557954;
	bh=bpPKxpz11SYhWTfv22owZ65XOFKOg9Ieo8uSb/AaLe0=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPS5TRnbNNiCcxyzZEnRGf8BEbwfLRu8LpCtfR4fWpJvgwCy6AKbHb3ldJZoEZGuW
	 JuVEisjXngiW4uMvXdSJYZzVKACx4ab5nRPTpeJZ+2vX7W83youP3DNE9Q1Ecn5Oxy
	 CAQAQC7ffH3n2MjqcRZ7csF+KazKrZBpRAFtt0Xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E62A8F8023F;
	Wed, 22 Apr 2020 14:16:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE82F8028B; Wed, 22 Apr 2020 14:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C07F8023F
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C07F8023F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ugD+hpZb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85DF12084D;
 Wed, 22 Apr 2020 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587557809;
 bh=bpPKxpz11SYhWTfv22owZ65XOFKOg9Ieo8uSb/AaLe0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ugD+hpZba41YUQEYft7ycbxY5cw+ZUyZyoif61nM8mIjsVWMyUf1xOq09wLS60oAF
 yjmoNypbAy2wl/aTxpYKUeZcEcqMNZ0H2uek1f61MbSiUj0Gre0Un+lt3U/IOSj13I
 pnKA93yWW+8QDlCTxqjuE9vG46S7WLGB4P/qid6A=
Date: Wed, 22 Apr 2020 13:16:46 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, kuninori.morimoto.gx@renesas.com,
 Jason Yan <yanaijie@huawei.com>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com
In-Reply-To: <20200422071805.48793-1-yanaijie@huawei.com>
References: <20200422071805.48793-1-yanaijie@huawei.com>
Subject: Re: [PATCH] ASoC: soc-core: return true,
 false in snd_soc_volsw_is_stereo()
Message-Id: <158755779483.28370.5663062095876370884.b4-ty@kernel.org>
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

On Wed, 22 Apr 2020 15:18:05 +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> include/sound/soc.h:1271:9-10: WARNING: return of 0/1 in function
> 'snd_soc_volsw_is_stereo' with return type bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: soc-core: return true, false in snd_soc_volsw_is_stereo()
      commit: 4aa86e05be84b0692846799fce16c233a170c559

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
