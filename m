Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66608228D58
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 03:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E9B1687;
	Wed, 22 Jul 2020 02:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E9B1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595379628;
	bh=ixbCeX47fIGI9Saa2Wc+hbWi7zHZVD3equCOUqRHMbI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K6tx9ct99wlnSWaaEHoZZBAfm/mOhgluQp5zRhOXIofa2EHJxYj/yLqCIimPfcBar
	 6pQMEpxbiRlXkno5pllO3c8gu3UCKd0uXhsgVhgxnCR4q8GWP8sLo5YRrNqWNZijXG
	 jlxaEL1v5QiZ8mhF/HRGK3olNsCX2EFM3Dozf2Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C70F802C3;
	Wed, 22 Jul 2020 02:57:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DE17F802C2; Wed, 22 Jul 2020 02:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB688F80290
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB688F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Iejbyqoi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F243D20792;
 Wed, 22 Jul 2020 00:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595379432;
 bh=ixbCeX47fIGI9Saa2Wc+hbWi7zHZVD3equCOUqRHMbI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=IejbyqoiNK7Luy4TAyeeNNy7rPXl8xiL0ZdWgT1hijD3gJTwstjjH5P78lak6wDZS
 Fu8wufz5ryTGUOOyWf9zraOO3TI2ICHYjVQmflFC/uvRmll/wyjDaEdiZvPvIGcC93
 xQD4+WuhqBY2X0HBtP8FRpD1LiQFMe8u1GZJhpVI=
Date: Wed, 22 Jul 2020 01:56:59 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, Dan Murphy <dmurphy@ti.com>,
 lgirdwood@gmail.com
In-Reply-To: <20200720181202.31000-1-dmurphy@ti.com>
References: <20200720181202.31000-1-dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: tas2770: Convert tas2770 binding to
 yaml
Message-Id: <159537940424.49432.10532525399520468723.b4-ty@kernel.org>
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Mon, 20 Jul 2020 13:12:01 -0500, Dan Murphy wrote:
> Convert the tas2770 binding to yaml format.
> Add in the reset-gpio to the binding as it is in the code but not
> documented in the binding.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas2770: Convert tas2770 binding to yaml
      commit: ad0ddbb9ba3d5216bf3035db6684c1507c90b93b
[2/2] ASoC: tas2770: Fix reset gpio property name
      commit: 58b868f51d6e38146e44cb09fcd92b5fc35d83bc

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
