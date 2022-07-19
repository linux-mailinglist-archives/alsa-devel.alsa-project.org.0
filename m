Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5AC57A5AA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 19:45:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D230916D9;
	Tue, 19 Jul 2022 19:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D230916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658252740;
	bh=nbqyGCAfbWdBgH3KjeM3ncHngyCr2dRP+WHtvKQxuDw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcz5BOlLni5C1lJbyUZNUQsQc3osMOtJ8zyjkrtBsYRy9msmpBM1yEiFDDyff3ldW
	 Ix4HoBE3MjUkhuZVOeSvJAlPXeZPaXu58WYl/72ayMZ9yoQ0TyTckqJ0JEyEiqCwnj
	 O0AyetyRMGpbvxvXwb8oOCSRxHl1c2C27ce9Cdf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A01F8028B;
	Tue, 19 Jul 2022 19:44:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94AEAF804B1; Tue, 19 Jul 2022 19:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F1C4F80224
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 19:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F1C4F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q2ZyF8bq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7531B81C87;
 Tue, 19 Jul 2022 17:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FC2C341CB;
 Tue, 19 Jul 2022 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658252647;
 bh=nbqyGCAfbWdBgH3KjeM3ncHngyCr2dRP+WHtvKQxuDw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q2ZyF8bqml9iRc7znNKWqSTMK5hM7t1G4+nrdHnwtY69qQQoDZn4IlhYGpxGRggDn
 DBiOVMfBgnWac9TipfdYY9Hl42czm6+luhwGYgMvMgB9Pew07ICaax8OWu0/tK7ELD
 hVHW9lMGfuv/xmHegnQiQRxFnFBPIK6Rx11K0/7cUPPSOOM7AtxKO32P/XoD14ruhp
 dTPlfjK7ZzMr4QZ3YWpQCFX4a1II/G8wb2ykABElFnv2KdgT6r5qROfEuiMe/wLpMt
 5EPdiI+wINOWhr6bkrbZ8DfxjmFrZ0ebk7eDr6Mr8uzMAcX0LRxynvDOgmdoO6rSXX
 0xtfQDNRsPzlA==
From: Mark Brown <broonie@kernel.org>
To: savagecin@gmail.com
In-Reply-To: <20220719084047.11572-1-savagecin@gmail.com>
References: <20220719084047.11572-1-savagecin@gmail.com>
Subject: Re: [PATCH] ASOC: nau8821: add new widget to control system clock
Message-Id: <165825264493.406155.16880542366945069939.b4-ty@kernel.org>
Date: Tue, 19 Jul 2022 18:44:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, WTLI@nuvoton.com,
 sjlin0@nuvoton.com, KCHSU0@nuvoton.com, savagecin0@gmail.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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

On Tue, 19 Jul 2022 16:40:47 +0800, Wallace Lin wrote:
> From: Wallace Lin <savagecin0@gmail.com>
> 
> Add new widget to control system clock for power saving.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASOC: nau8821: add new widget to control system clock
      commit: 0cf470c08319d9aa13e8fb3a26e44b5687bca56e

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
