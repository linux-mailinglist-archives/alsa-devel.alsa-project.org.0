Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9D94B8FD
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 10:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC201FE;
	Thu,  8 Aug 2024 10:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC201FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723105669;
	bh=jgHwr9Okfk2sRqCjWHFXlZf9bF+lKonWrMQM1FrvR+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m7QY4qCoF87CiMocMLIoQ88SrmF0kUBsFB1wIxnY7sHXJKXogr3oOD8ZLoQCG+nWV
	 wMCquf1bgn3IAsJ4daaETGcIR/LE6P5t88lIEdXbSdONkH7bf8bTl+mD6LSMFZvrHN
	 XUrdmCwmAVMaakiBU6dVgDuy2vbJ7gruHiRbc79I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC8DF8059F; Thu,  8 Aug 2024 10:27:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40689F805AE;
	Thu,  8 Aug 2024 10:27:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E52EBF802DB; Thu,  8 Aug 2024 10:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,
	TIME_LIMIT_EXCEEDED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0107F80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 10:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0107F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s+OsZ9bY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38E99CE134D;
	Thu,  8 Aug 2024 08:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9DEC32782;
	Thu,  8 Aug 2024 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723104755;
	bh=jgHwr9Okfk2sRqCjWHFXlZf9bF+lKonWrMQM1FrvR+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s+OsZ9bYS+ihavXQiZLf9Dc+jQe+TFXhg36/Z/BdFzPerYG9dsNFHpRVAUwNK3c8O
	 Up91Xv3MoIAU/RsSrv/5HIEc+BFYn6hHDfgZPC/V0iiMRFWOWF4DddfGhprZtd0K3q
	 ZyUeZj61C9NgEwjCDSf9u1GUu6VjxJJwr3CVSSXtPIzsv+4s/CWJnJTrBTEn2wkhHP
	 0mt4lg38vrfBpw4RabhJ/Xoe6Ko/IIlpc7wF8SXALAkzBnZAitzbvtsDdcshy8+A2K
	 UJCDVEpVu6AUcryzzd6Ze6BlYFCiDo5jS4GtJG40kkjP+bMS2Y1DB8kZfxNY4E+mfm
	 ZbPS3ExzlQ0Qw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org
In-Reply-To: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC/SOF/PCI/Intel: add PantherLake support
Message-Id: <172310475315.457425.16058679808608700383.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 09:12:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 3LMEDGPYVYOQPCEVQVYVMBIFUHHB4NXC
X-Message-ID-Hash: 3LMEDGPYVYOQPCEVQVYVMBIFUHHB4NXC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LMEDGPYVYOQPCEVQVYVMBIFUHHB4NXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jun 2024 08:58:53 +0200, Pierre-Louis Bossart wrote:
> Add initial support for the PantherLake platform, and initial ACPI
> configurations.
> 
> This patchset depends on the first patch of "[PATCH 0/3] ALSA/PCI: add
> PantherLake audio support"
> 
> Bard Liao (2):
>   ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca table
>   ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: Intel: add PTL specific power control register
      commit: 42b4763ab301c5604343aa49774426d5005711a3
[2/5] ASoC: SOF: Intel: add initial support for PTL
      commit: 3f8c8027775901c13d1289b4c54e024d3d5d982a
[3/5] ASoC: Intel: soc-acpi: add PTL match tables
      commit: 6a965fbaac461564ae74dbfe6d9c9e9de65ea67a
[4/5] ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca table
      commit: 77a6869afbbfad0db297e9e4b9233aac209d5385
[5/5] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support
      commit: 2786d3f4943c472c10dd630ec3e0a1a892181562

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

