Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 395144F7BE4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 11:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C67C517C9;
	Thu,  7 Apr 2022 11:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C67C517C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649324443;
	bh=q6HaN3d0Wc4BX8ScAWKhh8emcIaugeEwIsXTjJpawCQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5MmWklED33pdc6l6PCHLDQF6hXkz1lRLq48MD1+rjITFP0i3etLSSzRDV+h2egWS
	 YU3r7o0KxeXMx6/FIawXAFWl+8tdKe/ak5d/DPBX/XymRBjhs0ooq6ep0oG4JAzSSo
	 d3G0j4rAekq4BmV974OK4Z9zWfT6exT0rKPlQh0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 681FEF80534;
	Thu,  7 Apr 2022 11:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D778F8052D; Thu,  7 Apr 2022 11:38:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D005AF80524
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 11:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D005AF80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jDs25bbn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCCF2B826EB;
 Thu,  7 Apr 2022 09:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1C8C385A8;
 Thu,  7 Apr 2022 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649324307;
 bh=q6HaN3d0Wc4BX8ScAWKhh8emcIaugeEwIsXTjJpawCQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jDs25bbn3/0QsT4YpXsLyKfbVWolN6z7t2NW5wae9Xx7AbvyoCskY4Gki2pAChFJh
 fxrPJTgP2NS2nU1lm9L+pHXj39Qf4lOZ9N7ohio9BBUbZpE7fInyEkJGOGbp/7L88v
 F9dRCwftYPgfY5XFZGfNOLUaV0ZJ9ACI1+3s6uTvEqnt3ld5/xMbmhvbRIuyVH+vnC
 ocUdo9UYJztl6mtBhYhhLtxSgNiKRjC+JSpDz/i8AalrcdBH2Nge4JvGcZqzeZzRUt
 3CVTb/XNaOEUrj1OHBDXgYaxVyw/ZiWzIP3bOsTvqJookhEHQwYE9bJictLCSj2Heg
 VN2Be9RiddtWg==
From: Mark Brown <broonie@kernel.org>
To: viorel.suman@nxp.com, shengjiu.wang@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>,
 a.fatoum@pengutronix.de, Xiubo.Lee@gmail.com, festevam@gmail.com
In-Reply-To: <20220405155731.745413-1-a.fatoum@pengutronix.de>
References: <20220405155731.745413-1-a.fatoum@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
Message-Id: <164932430460.3844153.13561902931852849107.b4-ty@kernel.org>
Date: Thu, 07 Apr 2022 10:38:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de,
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

On Tue, 5 Apr 2022 17:57:31 +0200, Ahmad Fatoum wrote:
> Refactoring in commit a50b7926d015 ("ASoC: fsl_sai: implement 1:1
> bclk:mclk ratio support") led to the bypass never happening
> as (ratio = 1) was caught in the existing if (ratio & 1) continue;
> check. The correct check sequence instead is:
> 
>  - skip all ratios lower than one and higher than 512
>  - skip all odd ratios except for 1:1
>  - skip 1:1 ratio if and only if !support_1_1_ratio
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
      commit: d00887c106dac47b9af6ed70e8d5c45b69c4bd52

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
