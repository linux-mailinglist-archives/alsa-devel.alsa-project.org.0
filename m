Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3846559E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:36:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC3126DC;
	Wed,  1 Dec 2021 19:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC3126DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383795;
	bh=fWvG71pD8oadnbBLQeeoXl9vzAqZt35exs1CishJxHo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HwGmYRSOyCpNPiHn4OWlFc5bMMewVAjZWzXncPi3T85rXh0G6DGdB1qlBlX85FM1T
	 UtcBute7SeQ6XWHZko/QF2AB3n3IPeZH2/7EP9fQ11LfvAHPxqSbX5u7x7AcBMcgOe
	 voCFlGG6AFnCU51bv05OZZTUzXGsxIl9J3rpjTuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 787B6F80537;
	Wed,  1 Dec 2021 19:32:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6829F8052E; Wed,  1 Dec 2021 19:32:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71477F80520
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71477F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oqO5mrI3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EEAB0B820D0;
 Wed,  1 Dec 2021 18:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D53BC53FAD;
 Wed,  1 Dec 2021 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383540;
 bh=fWvG71pD8oadnbBLQeeoXl9vzAqZt35exs1CishJxHo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oqO5mrI3CiZ7c63j77VJCn2+M4FVBmZVce1GZ9s6Qm+kBDrgo7qsqOJ9VpMCOByrK
 169KZpYmYohv5P5SK2Rgy0NN2oTtkY91S68Q9gci8GGvq5rfjfEM2ZEEJgfBmbVa6i
 UVBCIA8nzBttm9By+gS1rRlt54gCaRZP+Ete6mHnOBqofUqkPissjcKca53ah0ZVxr
 24uv9StnmcOV6uqMgNL9o8b1q75ykdY35ykm0Ue8pHVJREuX+HHalbAloR2YkRtfrJ
 7ErYFQlmyWAcaYdD0Whcy0IyBg+7axhgnm/lf4osp9jAAC4RTEOhPG5i82rxyip+Uq
 053G2pY2M76Mg==
From: Mark Brown <broonie@kernel.org>
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20211125030453.4382-1-mac.chiang@intel.com>
References: <20211125030453.4382-1-mac.chiang@intel.com>
Subject: Re: [PATCH v4] ASoC: Intel: boards: add max98390 2/4 speakers support
Message-Id: <163838353903.2179787.8500449898797810104.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 bard.liao@intel.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
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

On Wed, 24 Nov 2021 22:04:53 -0500, Mac Chiang wrote:
> support 2 hw boards.
> 1. SSP2 connects max98390, 2 speakers.
> 2. SSP1 connects max98390, 2/4 speakers.
> 
> 2 or 4 speakers playback
> add echo reference capture
> add bt offload support
> add DMI_OEM_STRING for board variants
> add ALC5682I-VS support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: boards: add max98390 2/4 speakers support
      commit: f316c9d9ba8ea08d6994bc5ba8fa276eab186208

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
