Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D128D549D94
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 21:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A5811756;
	Mon, 13 Jun 2022 21:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A5811756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655148264;
	bh=97cXsGu+NFaNuKXYcN5wTr3b87rhiZDax4keDRCEy7E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4V3AiI600Mtwkjq/nxfa5V4nZs7F8+3h8bnQF5kUaYkd8ygRxsUZDY9HFh8pqhwn
	 Q+q8OnngtpWYBPw2NbdKohk3D7034gspOZzcoBVv5RcFnVFEyGpyatHa6HuucN7BTx
	 sm0PnsFJub0+7G4uq0/4PGJY50FBsNM2Dqfh/ElQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89BE5F8051F;
	Mon, 13 Jun 2022 21:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8146F804CC; Mon, 13 Jun 2022 21:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90CA2F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 21:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90CA2F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bFYTh0y/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4885B81259;
 Mon, 13 Jun 2022 19:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E736EC34114;
 Mon, 13 Jun 2022 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655148160;
 bh=97cXsGu+NFaNuKXYcN5wTr3b87rhiZDax4keDRCEy7E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bFYTh0y/kKFCsJB9xVMb5LUsOmkmX/Zrh9ZV8dAHRWN42myyL0UsGiSrbUhT37VjI
 mRKJGbQsyzytB/ZsR/zTTBpQxITm9GZ+xCc8LaGYfJWKXn0urS58/kmhhSNSIYFAwA
 88FlFLw1gj+UpYWF/CpKAj+yxQGSUfJ6PbNjVcQden6x7qbB+LgH/ZKdPIx7lOyv6o
 d3NMxDSkM01U88iATcf76Ta80zPlwSJoUwNx6sBAbUr8iFZpY6I+Mp78Xw+NQs7Pvs
 iqMeSgH3egUfjnPYth6Ew1VUxXWhBAZX9fjKM5Wjp7kWB9vT8znCe/qDtbCo7uN8Ci
 kSmMl5wxqzZUw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220610214313.42903-1-pierre-louis.bossart@linux.intel.com>
References: <20220610214313.42903-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: update ASoC/Intel/SOF maintainers
Message-Id: <165514815866.744585.16333475009396328731.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 20:22:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com, tiwai@suse.de,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com
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

On Fri, 10 Jun 2022 16:43:13 -0500, Pierre-Louis Bossart wrote:
> Keyon Jie was a key contributor to the Intel ASoC and SOF Intel
> drivers, but he's moved on to a different role within Intel. We wish
> him all the best in his new endeavors.
> 
> Bard Liao, Kai Vehmanen, Ranjani Sridharan and Peter Ujfalusi have
> been involved in the Intel multi-maintainer team, it's time to update
> the MAINTAINERS entry to reflect their contributions and clarify their
> role.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: update ASoC/Intel/SOF maintainers
      commit: 3729928137c74fe9079f51d8f0348ab588a247ae

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
