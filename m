Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9133624FB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9CBB16C3;
	Fri, 16 Apr 2021 18:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9CBB16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618589095;
	bh=lqk2/4ODLgpOMwOXLEA3kp2LxI7Ol+AC/xUze64+xGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rHrGip3EjQryH2fSq8v+GDno/4aqaaK31DTZSkSYdMUXWvfvtMpYfuhdgiv6N87Zw
	 nMDa3AkFw4h6G/7qw5ugX/bkVI8hbJ1HvJuVvzgr9z8xTc9kbuAoVjmzUTEK63HzMv
	 E96B6wN+BkL4NtglC5AsF7h6LWL63M8ng9p6xREY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9640F80423;
	Fri, 16 Apr 2021 18:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62239F8032C; Fri, 16 Apr 2021 18:02:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17CAEF80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17CAEF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UgU1hp6u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2B2C613A9;
 Fri, 16 Apr 2021 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618588954;
 bh=lqk2/4ODLgpOMwOXLEA3kp2LxI7Ol+AC/xUze64+xGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UgU1hp6uVfzbPBd5Hh024MZYFEI/DhLEJxNbZNjERpL/HrIocKi9ebyEJy6rP9+Xe
 J8BpV/HboQPwBIm31+ZDJ900MnY62QiTrgfDoAXaGmZmDjlZ9xFxd9NhVngkap2YAy
 Ew9xi5b0sgM/L9EiLpYwgQAp7rUiwf7/v4MxkFdF7/+fmEybhpmJc2yS+QmdpbRwg9
 Oqy+QT/nuBzGhHF7DIMPIAcz6LEwQcEfLxHQNh6rOie8APbxO/HNKSz8quqNucU/3R
 2GAOPQKjwVHWSX+Tv3KNPrGhB2RsSI5yiVpm9dH8rC9b80H4A5liX0roHfUU4OjE08
 1yHGz/BbAFA+g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: Intel: add new TGL/ADL configurations
Date: Fri, 16 Apr 2021 17:01:49 +0100
Message-Id: <161858869852.28833.4104992497142755503.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Thu, 15 Apr 2021 12:50:04 -0500, Pierre-Louis Bossart wrote:
> Very little code but quite a few descriptors to add TigerLake (TGL)
> /AlderLake (ADL) ACPI match tables for I2S and SoundWire devices, new
> dailinks for Bluetooth offload. Some day this will be read from
> platform firmware.
> 
> Also clarify how microphones are handled for SoundWire devices, and
> create modules to avoid linking the same code multiple times.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: Intel: soc-acpi: add ADL SoundWire base configurations
      commit: 093b9dcb597611ce65f8c5610ee446616c0be304
[2/9] ASoC: Intel: soc-acpi: add ADL jack-less SoundWire configurations
      commit: 870dc42fe8311ef5b291ccb21eda3f7069b6f599
[5/9] ASoC: Intel: sof_sdw: add quirk for new ADL-P Rvp
      commit: d25bbe80485f8bcbbeb91a2a6cd8798c124b27b7

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
