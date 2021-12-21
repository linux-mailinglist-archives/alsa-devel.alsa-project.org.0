Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24147B899
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:53:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3DF31759;
	Tue, 21 Dec 2021 03:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3DF31759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055205;
	bh=mvEojcUWmeF/XgClC/l0wa0ZWQbLxSl4Nckgl7WD3B0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RfPxPdvh4rFIYsz0gThujMhVJJYF0/J6IUgI05QW3CPhVn2Ukv3rMnNNDV2sYEszr
	 7tupKm/tX8cEevQ3WCIp/trzfITjRuAAuIKS4FYVnnLFoSIwrn6rfuRhwjHuVy4dMA
	 /a2Xsn1yRdnIoU805bpazzxkXzI80ZBQZP9NPvZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6EE7F80516;
	Tue, 21 Dec 2021 03:51:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 142EDF8051B; Tue, 21 Dec 2021 03:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BEA2F8032B
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BEA2F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ea6D9+18"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2CF7B81113;
 Tue, 21 Dec 2021 02:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080BFC36AE5;
 Tue, 21 Dec 2021 02:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055044;
 bh=mvEojcUWmeF/XgClC/l0wa0ZWQbLxSl4Nckgl7WD3B0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ea6D9+18w0l+ASV2A+wDCnyRxj0pLvmNXxzKC7VT6xHE8L0P6Km/c6jgbBFhfax8v
 KelL392IvmDW3V999vWxX0K+ZslNLfpkq1BixA4o/5Z2Ff9AkUYP55vMUDUz+egR+E
 q0FhCOLCOK+YJjkKQ94SA9OLzPrY1V111Yjpki5UnWSSwAvOgdpSs7fpG3fDG1aOKj
 Tjomm9WsDH6fPr8Fh71z8g6B+sSpnHb3iNz0Aet5KdfPph1O0PWykP52sD3WFN1z9Z
 BHiQSbzzQlBzq/YMXwOGuXo9tQD4Gr+D0COUnJcrkvr7sLVt2zEs6KyOxR0h2lcNu8
 e+yWngGK7quwg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211216230350.343857-1-pierre-louis.bossart@linux.intel.com>
References: <20211216230350.343857-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Kconfig: Make the SOF_DEVELOPER_SUPPORT depend
 on SND_SOC_SOF
Message-Id: <164005504275.2647792.11495830390115564090.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Paul Olaru <paul.olaru@oss.nxp.com>
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

On Thu, 16 Dec 2021 17:03:50 -0600, Pierre-Louis Bossart wrote:
> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> SND_SOC_SOF_DEVELOPER_SUPPORT contains options affecting how the built
> SOF driver stack will behave, enables debug options and other features.
> 
> These options have no meaning if the SND_SOC_SOF is not even enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Kconfig: Make the SOF_DEVELOPER_SUPPORT depend on SND_SOC_SOF
      commit: 4941cd7cc845ae0a5317b1462e1b11bab4c023c0

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
