Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A031AF9644
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jul 2025 17:07:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 922BB6020A;
	Fri,  4 Jul 2025 17:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 922BB6020A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751641663;
	bh=mhV9A4sMdW94j1CEcO8lDT7nj2gYsRWWKgOpfJCh9CA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cUyE+Fx4D+NQEosBOiXUj+sLEmJrj0ZVy9zKP3vOdUZ4j8zbiP0p+uYqejMdMrZnp
	 UTBeN8qy4I/rWIZM34sJ52Gkzo5DXpRZ2lRt45Fu50bQzPFHJTjV01SiK/sSDVEyJZ
	 6IwdiT0DoDD9FS/F7or1NMz+FsV0Zr+k3dhLhu4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA689F805C5; Fri,  4 Jul 2025 17:07:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A34D0F805C6;
	Fri,  4 Jul 2025 17:07:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A12B6F804E5; Fri,  4 Jul 2025 17:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D555EF800F8
	for <alsa-devel@alsa-project.org>; Fri,  4 Jul 2025 17:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D555EF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n6NvlwgY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35AE960EDF;
	Fri,  4 Jul 2025 15:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90126C4CEE3;
	Fri,  4 Jul 2025 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751641615;
	bh=mhV9A4sMdW94j1CEcO8lDT7nj2gYsRWWKgOpfJCh9CA=;
	h=From:To:Cc:Subject:Date:From;
	b=n6NvlwgY2M8eF8LBoQHEf+4Kh4q4lxfGr2LYMvgiZS6Pzc2NOfoV5fqe+IRWtovoq
	 TJ62hGnVZ+2brBGOP8yMz5PeQw36+UHakDWSXb+0h0NsoD1muZmRK9EY0Q0DRCaDP2
	 MhqpH/cLRkUIGnLsh0Ah839UplsshuYpTgHuqE5DqPWpUgTJ47Qxl0w9iDQ0wqB77G
	 gl2Jbyqdo2lrs9MpS6vU1298fIChJmOrhCFVXPGFLCFZx7F39BtUYdyftn1DmmQ273
	 hYFXpTGvQjwTgqL3qYauNVOkOoWxniWYSFI1O+QjfDfug9iFdcpDGG2cL30RC8seAk
	 vgB5KetjRcTjw==
Message-ID: <899a3ae90cddad5bfe1de7f228960674.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc4
Date: Fri, 04 Jul 2025 16:06:42 +0100
Message-ID-Hash: Q4WQFSJA57Y3XD2IBJW4LPPX7PZSNKYZ
X-Message-ID-Hash: Q4WQFSJA57Y3XD2IBJW4LPPX7PZSNKYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4WQFSJA57Y3XD2IBJW4LPPX7PZSNKYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc4

for you to fetch changes up to 3b3312f28ee2d9c386602f8521e419cfc69f4823:

  ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

An update for the MAINTAINERS file, plus a number of small driver
specific fixes and device quirks.

----------------------------------------------------------------
Arun Raghavan (1):
      ASoC: fsl_sai: Force a software reset when starting in consumer mode

Bard Liao (1):
      ASoC: Intel: SND_SOC_INTEL_SOF_BOARD_HELPERS select SND_SOC_ACPI_INTEL_MATCH

Charles Keepax (1):
      ASoC: Intel: soc-acpi: arl: Correct order of cs42l43 matches

Richard Fitzgerald (1):
      ASoC: cs35l56: probe() should fail if the device ID is not recognized

Shengjiu Wang (1):
      ASoC: fsl_asrc: use internal measured ratio for non-ideal ratio mode

Simon Trimmer (1):
      ASoC: Intel: sof_sdw: Add quirks for Lenovo P1 and P16

Srinivas Kandagatla (1):
      MAINTAINERS: update Qualcomm audio codec drivers list

 MAINTAINERS                                       | 16 +++++-----------
 sound/soc/codecs/cs35l56-shared.c                 |  2 +-
 sound/soc/fsl/fsl_asrc.c                          |  3 ++-
 sound/soc/fsl/fsl_sai.c                           | 14 ++++++++------
 sound/soc/intel/boards/Kconfig                    |  1 +
 sound/soc/intel/boards/sof_sdw.c                  |  3 +++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 12 ++++++------
 7 files changed, 26 insertions(+), 25 deletions(-)
