Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E86268E74
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 16:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BA0C169F;
	Mon, 14 Sep 2020 16:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BA0C169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600095321;
	bh=kCXyTf1F7Hpnepe9H5+3ZGjjOSqK9omemapi+1z8niw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lAb1nGNDBUQyiSw3CawphNyatIrVpkLaamFI9k/Hi9O1TmgCpP1WqfqewWLDgWU4I
	 q52kkiaEeD0ccryqCLXV9BDiBqiEmKRfJ0o9r3nWbkvqBuwNNzx8jHCCBzjmSbuAM4
	 ydt133plr6O2pw5l4sFNt5fWRVZn8bLd1zJwzmMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D08F802DB;
	Mon, 14 Sep 2020 16:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 286DBF802DB; Mon, 14 Sep 2020 16:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0164F8015D
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 16:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0164F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HQ+mmVTd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01AF3206BE;
 Mon, 14 Sep 2020 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600095128;
 bh=kCXyTf1F7Hpnepe9H5+3ZGjjOSqK9omemapi+1z8niw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HQ+mmVTd/Cmn8rjCBgAGHyPV4yGPcho6YAR4+viBxQ8bRlaBaAiGbkCElS+fi/Xcb
 RqJhUJeotTCUpxgJQBLUYSLflaw8/deEksAfxkKKyVDJ+UXTgCUSfGDhTB5vm/BstA
 YOhbKgm8cRPpvO3SwZPObPgpXdUQb2lA+ykO2QZA=
Date: Mon, 14 Sep 2020 15:51:20 +0100
From: Mark Brown <broonie@kernel.org>
To: "derek.fang@realtek.com" <derek.fang@realtek.com>, lgirdwood@gmail.com
In-Reply-To: <1600073839-6762-1-git-send-email-derek.fang@realtek.com>
References: <1600073839-6762-1-git-send-email-derek.fang@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt1015: Fix DC calibration on bypass boost mode
Message-Id: <160009506912.439.3488273269065935384.b4-ty@kernel.org>
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

On Mon, 14 Sep 2020 16:57:18 +0800, derek.fang@realtek.com wrote:
> Fix the DC calibration unsuccessful issue on rt1015
> bypass boost mode.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt1015: Fix DC calibration on bypass boost mode
      commit: da145172b236b1ac322fa81f6250aa59074eba68
[2/2] ASoC: rt1015: Fix the failure to flush DAC data before playback
      commit: 8d9a14fc7371a18d54226bf2542f77b11e5a7101

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
