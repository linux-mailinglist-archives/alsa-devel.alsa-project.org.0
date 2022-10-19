Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BA604562
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51F53B96;
	Wed, 19 Oct 2022 14:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51F53B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666182876;
	bh=o/UtyFjGrXucSKT7ap4G1SuW/Z9Tvzc8HO0i7bfhpEA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/7Te2WVy9P8CEXEWP/yzTbEMy4YkGf4f73NeAH9xAECAFY9BKNHQCCrNQxMQpeU5
	 tm9IeLGvdtuxIeRtqY4PEPZtggakM8+ahLF6xMzfyn7pJRm8gyls5q8hw8BUJoTsA9
	 RXAtwra9dEhJ7bVEMrGmybMP4B1fn9FgOaogxIBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACAFAF8055B;
	Wed, 19 Oct 2022 14:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DD1F804CB; Wed, 19 Oct 2022 14:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB5CF804CB
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB5CF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dcd76hTr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0BF3B823B4;
 Wed, 19 Oct 2022 12:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534BAC433D7;
 Wed, 19 Oct 2022 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666182744;
 bh=o/UtyFjGrXucSKT7ap4G1SuW/Z9Tvzc8HO0i7bfhpEA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Dcd76hTrOB0+Bc8GhFPW7E9/AWH7EA1zMgC9NHTnutJdppbwEp2WmBoX9QQXeEtsa
 gEOaGOtKzGTvmOqzlESwL8v5WtJVxOQcMxX5XxxKO/gfvKdStci+fx7aGXYLOV98qc
 pXaX1emuDDxeaUkCHFgk878zHQaYIxTs/AnNUMSTNWRKdfneIcsUGLB8Vgezh8tK53
 +2WgAGv22arye0CLurRoPtX/5zPdYFDnJePIC4LI9yHyh+X7JgsEmxgylrc55mSfn1
 YwXUgYgECEUTFSoOs5dlRPcwSmCp/cfXFJP6McrTFHFubKUGHZRtAd3llz0S1Fc2dH
 hMoIxUzdIEcVw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221017205728.210813-1-pierre-louis.bossart@linux.intel.com>
References: <20221017205728.210813-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_rt5682: Add quirk for Rex board
Message-Id: <166618274307.118898.13405823402694326089.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 13:32:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

On Mon, 17 Oct 2022 15:57:28 -0500, Pierre-Louis Bossart wrote:
> From: Yong Zhi <yong.zhi@intel.com>
> 
> Add mtl_mx98357_rt5682 driver data for Chrome Rex board support.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Add quirk for Rex board
      commit: b4dd2e3758709aa8a2abd1ac34c56bd09b980039

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
