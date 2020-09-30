Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81A27EC1C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 17:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1276C1825;
	Wed, 30 Sep 2020 17:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1276C1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601478947;
	bh=MNR+bUtMZLuLBJt10auA5jj1QkNQ9OW5xWDqLbXoQoo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8ejAzfhjirh1uUUXvgoL4TCcWP1DH6I+iCjTrRoq1ZSW4Pd4IWzAvLAyPlLvxdHm
	 t1UiFnGZLvtNPjGFmC6XiT7hLSwrnw1aKhWWhF7KAED32fIe5/gYIn3A4JR20hkkAZ
	 tQT7gCx9dBNgQXxLqCcBLiyX4RlLoSzIv2+nuDEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C224F801D8;
	Wed, 30 Sep 2020 17:14:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C91BF801ED; Wed, 30 Sep 2020 17:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53289F800DF
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 17:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53289F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bd6wn1wS"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E0E520657;
 Wed, 30 Sep 2020 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601478837;
 bh=MNR+bUtMZLuLBJt10auA5jj1QkNQ9OW5xWDqLbXoQoo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bd6wn1wSr1CgjWh0B12Y+pmZmxywyjyGRDedju7a/xvFqeSWuGplDGRs0wPWo2DmC
 f8Ig0/dfOIQXMP3bFWDSmFF8hnIftY6ouoY0MPOurr/DbG1tau32qWfRVsv0ExL9Pn
 IHERdr1XXHoQpeSJ2eOMqOfnjduQm6ZVf6qmPnmg=
Date: Wed, 30 Sep 2020 16:12:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20200930145330.3043528-1-alexandre.belloni@bootlin.com>
References: <20200930145330.3043528-1-alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ASoC: atmel-pcm: remove unnecessary include
Message-Id: <160147877281.10117.14415421643228167921.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 30 Sep 2020 16:53:30 +0200, Alexandre Belloni wrote:
> Since commit 95e0e07e710e ("ASoC: atmel-pcm: use generic dmaengine
> framework"), the driver is using dmaengine and is not using any definition
> from include/linux/platform_data/dma-atmel.h, stop including it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel-pcm: remove unnecessary include
      commit: 62e5d7774629aac671c8c56a0ba016dbffb6dff2

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
