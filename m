Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1534D08A8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 219BE1788;
	Mon,  7 Mar 2022 21:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 219BE1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685770;
	bh=0Cv5vxXicRFXtF41SUF86JorRsvlrBPG16Z1OipQCFY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1b8pYuB9PAau8wg7xEDT+FvGHSS/97y43XHwDHREptL2DEUcIF6gbl0/gnF02mjd
	 Mv0t0LPdGwNX6I8I9QwNPORT1XmVWRo6IbA/A2CYgOvhmSTL6AVoPPayys5miKFvTY
	 5k576pQJ7N2YfY/D6jfBzvqtzmzYCrsbxgbBMbh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92ECF80544;
	Mon,  7 Mar 2022 21:39:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C858F8053B; Mon,  7 Mar 2022 21:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B84B1F80534
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B84B1F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GXICFvko"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A318614C1;
 Mon,  7 Mar 2022 20:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015F6C36AEB;
 Mon,  7 Mar 2022 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685556;
 bh=0Cv5vxXicRFXtF41SUF86JorRsvlrBPG16Z1OipQCFY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GXICFvko+7lCN6j/JEWFGf/TCOSFpNoXmvZFEL4W8HNoeng2ozIrEjxEOzpgBKAmZ
 SYnEaNSHfOtfw8nitbgpigzL6rQWb/CMHG8RHxX2K6XLKNtCMNEmubD5by/K6RFlJQ
 lPKTDiXx0spXrhKYUvjP2UrOheNacI7Po4C9p9cxZGCB0HEFV1kRyj9xYpyFM+Zp1i
 63ySRHC3bMDqwSviMmNe85L5QdMkmJl9+2vakW1441KUh7q1IBHksx6ucgUnnQPBr3
 S0L2ii6LG83hQNlBUshk785Y7A6Lsam20y3Gv6DcuNZzDcS59VtzxRJzAP/HVAxgne
 fbDXz0mfflt5g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220304144015.398656-1-rf@opensource.cirrus.com>
References: <20220304144015.398656-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Add warnings about DETECT_MODE and
 PLL_START
Message-Id: <164668555573.3137316.14425492431771518376.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 4 Mar 2022 14:40:15 +0000, Richard Fitzgerald wrote:
> DETECT_MODE and PLL_START must be zero while HP_PDN and ADC_PDN are
> both 1. If this condition is broken it can discharge FILT+ and it
> can then take up to 1 second for FILT+ to recharge.
> 
> There is no workaround required for this, simply avoiding settings
> and sequences that would break the requirement. The driver already
> meets the requirement.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Add warnings about DETECT_MODE and PLL_START
      commit: 71a6254c8b8aa3dcac3a5cb1d1cc2a2d3a840bfb

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
