Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C68439BF4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8671A16E5;
	Mon, 25 Oct 2021 18:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8671A16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635180229;
	bh=UVa8mcC1T1uq8wTq8Zf9Ga1vu6jyFkHWhopPaZoEcUY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ue6c75kusqrkFxQ5+q9XEN65p0AgqETT6FVI/sLE0JrJ6KTCYU18lG/VRFd4m0/1R
	 5peTjr58jv1HsfcG9+TtLORpDdtaKJq0l8f8FT6Nx4tQSv9d9R77MDszOCfniLYyLb
	 GGVjaBhZITOLo1cWwnDlQK3R4H0wLcBoz42VouDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26205F8051E;
	Mon, 25 Oct 2021 18:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B69EF8051E; Mon, 25 Oct 2021 18:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78154F80518
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78154F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s02xi/8A"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C07660EB9;
 Mon, 25 Oct 2021 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635179993;
 bh=UVa8mcC1T1uq8wTq8Zf9Ga1vu6jyFkHWhopPaZoEcUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s02xi/8A6AwRVsntBYMQe1zS/U5Hkuap5wxkL1IlxU3PTlnK2rzVjWQMiFzK073nw
 GMIzZvQHcZZIqvO+0okNAig8sQHsYIGjlPCdUEsbp191/jGkiNqC1tlAuCuC5Co5p6
 CzXV3hKI2l8CPASfVAad6ylnoOHbP+9UxR+VHNDNAyiQBhGU9cClldHl27Ajzb3/E/
 9betUhY9j+5rBWixzoH5gqEzu8Psc4U33olRP1zCqpxGG3kR7Ag6+ngEsbEJXcVOUy
 yX5bfoGXje9boU6xNCH4LLfH/2gHXvYgTDyGQ5h3ONpXXLevNMIKY3a5fcdpLfFT0k
 YU6xPH647asrQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, Julian Braha <julianbraha@gmail.com>,
 yang.jie@linux.intel.com, liam.r.girdwood@linux.intel.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com
Subject: Re: [PATCH] ASoC: fix unmet dependency on GPIOLIB for
 SND_SOC_MAX98357A
Date: Mon, 25 Oct 2021 17:39:27 +0100
Message-Id: <163517996155.3558038.1204649439375343197.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025010615.10070-1-julianbraha@gmail.com>
References: <20211025010615.10070-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Sun, 24 Oct 2021 21:06:15 -0400, Julian Braha wrote:
> When SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH is selected,
> and GPIOLIB is not selected, Kbuild gives the
> following warnings:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - SND_SOC_INTEL_DA7219_MAX98357A_GENERIC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fix unmet dependency on GPIOLIB for SND_SOC_MAX98357A
      commit: 3e701151feefc58c5194e1d9eb5af98568574f2d

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
