Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0F5E6A01
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 19:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCBA11EF;
	Thu, 22 Sep 2022 19:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCBA11EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663869328;
	bh=ZiN26jIhpDcjUuX8OzBCi6FQJAgejvV8LF/d8rTxbmE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvoikMZ2rm02By5gWQMvfxg2+W9IN83JUzJWtaSwcsODV+vefRdnD8/ruu5URH4cG
	 kXW3BYhbYZ1q7pbn3UREJ23jN6wyfiuzijpKlwi3CfUVjRrPpb4knJMkNtNAk1+HLI
	 7zatsDLKf7PWvb85YPq3Qx+ZeDnZdNJXmLuEX/kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1469CF804E7;
	Thu, 22 Sep 2022 19:54:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28DF9F804E7; Thu, 22 Sep 2022 19:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE247F80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 19:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE247F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nRTG7xrv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDD37B819F6;
 Thu, 22 Sep 2022 17:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74708C433D7;
 Thu, 22 Sep 2022 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663869239;
 bh=ZiN26jIhpDcjUuX8OzBCi6FQJAgejvV8LF/d8rTxbmE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nRTG7xrvW/TV6MHjXfX6AdY3kP4D45MhEpf2vLD1809I98HGcow0HnH3z14Avh5Vh
 Svc1X+9DpqdJAa5mUYgzr/8J9jvHGFzk4+WnpNNddoFo5zXRA/Fr6BO1MmXVe/8X6c
 9cq0Jd8639dd3unZ5VpgRka0jV++bc7htlXIWEJCgJ9bq1AyaoWOk+7sYXU6vl3fVk
 5ECegpdN9cPy582s4RaIoxUqPy92muHEuRT5dSgZ/AoHI6MdNPvyLc0/o06XotJywA
 bVpnNb/9XejjpjeT+HZdnR2s0b1+fsi+4+aQbUhzTHaBPLI71bGVGdSQ9DQ9wD4wpm
 6kp3K+m7N9tXw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220922100254.27159-1-pierre-louis.bossart@linux.intel.com>
References: <20220922100254.27159-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: add missing PCI IDs
Message-Id: <166386923746.727733.12788369378822193217.b4-ty@kernel.org>
Date: Thu, 22 Sep 2022 18:53:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de
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

On Thu, 22 Sep 2022 12:02:52 +0200, Pierre-Louis Bossart wrote:
> Two missing PCI IDs already added to hda_intel.c and missed in SOF.
> 
> Pierre-Louis Bossart (2):
>   ASoC: SOF: Intel: pci-tgl: reorder PCI IDs
>   ASoC: SOF: pci-tgl: add missing PCI IDs for RPL
> 
> sound/soc/sof/intel/pci-tgl.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: pci-tgl: reorder PCI IDs
      commit: 1c9a057eb7f45f8d233ae847d1e9fd64d163bd1c
[2/2] ASoC: SOF: pci-tgl: add missing PCI IDs for RPL
      commit: e2f0b9277810685f6a67201847082ec9852853bd

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
