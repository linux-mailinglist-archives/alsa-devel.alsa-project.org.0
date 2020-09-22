Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D0274501
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 17:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D3C1732;
	Tue, 22 Sep 2020 17:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D3C1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600787312;
	bh=hI0rf/8J5dklPjDD41Q/MFWpGh4T4WCJvt1mUDThuhs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJJnW1/g+FbkTQaDWD/YYkkC6Zi+MU+MRBKgUX3diQCoc18yyHcYYHLzgsQqsY7ks
	 8uu4ULBpiTn+kRj0XFfKe57qncORnM41BbWpnulIk4S6pceFtcyMxMdCxz1oqDrXRk
	 HYkKWkfr6TcSyYrdKpDTb9BnDMEZ405KxmX0keYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 597E0F80259;
	Tue, 22 Sep 2020 17:06:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFBD9F80229; Tue, 22 Sep 2020 17:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E454F80229
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 17:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E454F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cxnxD86z"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47F9920715;
 Tue, 22 Sep 2020 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600787158;
 bh=hI0rf/8J5dklPjDD41Q/MFWpGh4T4WCJvt1mUDThuhs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cxnxD86z9Z4WSM957gzJNXxd59ai0RPgqLMfMwiuKLx4SpOMoct4JCAKEKkg+pnY+
 x6QckJdiYStVL1T8oLdwsxMSUqDPgTxR9XqV/AjoLUKpuz7YWW1MxM5K/5mYdPmI2I
 iaoikPkeILaTVjYcjtd1yHE3y+/Udm6wjyyGb+u0=
Date: Tue, 22 Sep 2020 16:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20200922142411.10364-1-dmurphy@ti.com>
References: <20200922142411.10364-1-dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tas2562: Remove duplicate code for I/V sense
Message-Id: <160078710095.52882.10146545480873734232.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Tue, 22 Sep 2020 09:24:11 -0500, Dan Murphy wrote:
> Remove duplicate code for programming the I/V sense the call to update
> the register was duplicated in commit 09ed395b05feb ("ASoC: tas2562:
> Add voltage sense slot configuration").

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2562: Remove duplicate code for I/V sense
      commit: 90e2a588c9e743f104849fb2da4c121e1a487201

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
