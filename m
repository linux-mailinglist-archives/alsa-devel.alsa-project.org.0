Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410671E897F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 23:07:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8423179D;
	Fri, 29 May 2020 23:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8423179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590786461;
	bh=ZhoPxZNiXL+AQDGrZ56/Eh1rqFwGtkwqOoMFHEMEkjo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hHvY9lMKx0IjGenevXoq/D+tfXpHC7OzYmfV52EEEloRK8acR1kWmht64VjAt+B+v
	 yknlnxho3XEdvlI2YBaG8I+aX0Dve48GnaiYArWt86H729MZz6gw8mVeriwdlrC/NI
	 ShedTSpKYmZpJvpJQsU9QYbIC8M2KtMN3qgzRlIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8911F80149;
	Fri, 29 May 2020 23:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3DD3F8014E; Fri, 29 May 2020 23:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED6ABF80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 23:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6ABF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QUwlPBQf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E0012071A;
 Fri, 29 May 2020 21:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590786351;
 bh=ZhoPxZNiXL+AQDGrZ56/Eh1rqFwGtkwqOoMFHEMEkjo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QUwlPBQfvcFrzT/A63LczRwP7Xe0q/CKz5jMrl6dWlQSDO9cYiVS9X6CUTE57f1nn
 N3QbZgaW1U+NuyyBOBJ+BC7FjSQe8gy0tm52j3mv3gAhNJUbDPX9bm7nVxGWiY3yb5
 K9cJP9uCYr3YJTGU/akpfQbrqJInTcG8ehkykDRo=
Date: Fri, 29 May 2020 22:05:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200529193547.6077-1-pierre-louis.bossart@linux.intel.com>
References: <20200529193547.6077-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/3] Kconfig updates for DMIC and SOF HDMI support
Message-Id: <159078634846.20958.15437315861391675834.b4-ty@kernel.org>
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

On Fri, 29 May 2020 14:35:44 -0500, Pierre-Louis Bossart wrote:
> This series provides the following updates to the Intel machine driver
> Kconfig:
> 
> 1. The first patch adds the explicit dependency on GPIOLIB when
> SND_SOC_DMIC is selected.
> 
> 2. SND_SOC_SOF_HDA_AUDIO_CODEC is required for using the legacy
> HDA codec driver for HDMI support in SOF. The last 3 three patches
> make the required changes to account for this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: intel: add depends on SND_SOC_SOF_HDA_AUDIO_CODEC for common hdmi
      commit: 8f529f0175aa02266542714a569b885dd145b61c
[2/3] ASoC: sof-sdw: remove CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC condition
      commit: 38acab2d61073ed4a684533d46505feba3eecf67
[3/3] ASoC: sof_pcm512x: remove CONFIG_SND_HDA_CODEC_HDMI condition
      commit: 1e7cb64b0ab5a810b05ed49dd263605add41ac5d

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
