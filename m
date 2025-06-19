Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EACAE1015
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jun 2025 01:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A6F3601BC;
	Fri, 20 Jun 2025 01:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A6F3601BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750376277;
	bh=mH12jWWluXRRwZD7QEzNZHCQHjLlIjgmw0TrxfS7y9A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YTOH95iT/P0ocPwFo7aogpxFgfVP+mcIPK1d6xCsEaGAriRI8aj3IiK42M/+EdzrR
	 VKwOz83h/nZ4jAvqohQx+m2sGsEe6R8iqNxLQ4sXrjCg12j9vrY5OxGoMRof5W7KyF
	 6Vbgv1DmRURAqmmm0RTX9OMkcCrqvj0R39aLnDgg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC96F800D2; Fri, 20 Jun 2025 01:37:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE9EF805C5;
	Fri, 20 Jun 2025 01:37:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EC1AF804B2; Fri, 20 Jun 2025 01:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70AA7F800D2
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 01:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70AA7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fII+UbVH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28FCB5C6575;
	Thu, 19 Jun 2025 23:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB2DC4CEEA;
	Thu, 19 Jun 2025 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750376236;
	bh=mH12jWWluXRRwZD7QEzNZHCQHjLlIjgmw0TrxfS7y9A=;
	h=From:To:Cc:Subject:Date:From;
	b=fII+UbVHZtW0TzCFiR+Kj0iR36Ax3dhnc9BYh02cYhmH9RisqVCDxdZR7+KxlVlwK
	 ShWmx4LKjfpdXLMcxWaWLLeXnuC+pDUALSRwa56nJHd/UNmWgyX5kvQQ0ZPyBUzO/f
	 9AaCl3g6wUhkcwQ07ty9MQMmrFxvQSbH5spEzjEIW06F1SwmescAFf6amCRhc2W0G3
	 ODvU2PqCSc/iu5OJ3xhQo+1/bEDNpYR5An2wvEINsXfL+ymoGGTfT8u3DdXq/Uf1Nv
	 kppx+ty0dsnvts/iCM4hdhTBlMDmoif2HB7g8VHV7QSXoQTpnEph5jdMCtRdMPtrTL
	 pU1qNOzdSiFIg==
Message-ID: <fc4f65933b6ff395ce609f920dab47fc.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc2
Date: Fri, 20 Jun 2025 00:37:07 +0100
Message-ID-Hash: R5HDSH6ATAHEJFY63SZ2RX4HDFRRMSKO
X-Message-ID-Hash: R5HDSH6ATAHEJFY63SZ2RX4HDFRRMSKO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5HDSH6ATAHEJFY63SZ2RX4HDFRRMSKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc2

for you to fetch changes up to 16ea4666bbb7f5bd1130fa2d75631ccf8b62362e:

  ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count (2025-06-19 15:44:42 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A relatively large collection of fixes and updates that came in since
the merge window.  Of note are a couple of Cirrus ones which change the
firmware naming for some newly added devices, and a fix from Laurentiu
for issues booting firmwares on the DSPs on i.MX8 SoCs.

----------------------------------------------------------------
Gabriel Santese (1):
      ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic

Harshit Mogalapalli (1):
      ASoC: cs48l32: Fix a signedness bug in cs48l32_hw_params()

Huacai Chen (1):
      ASoC: loongson: Fix build warnings about export.h

Laurentiu Mihalcea (1):
      ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x

Mark Brown (1):
      ASoC: cs35l56: Change firmware filenames for SoundWire

Peter Ujfalusi (1):
      ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count

Raven Black (1):
      ASoC: amd: yc: update quirk data for HP Victus

Richard Fitzgerald (4):
      ASoC: cs35l56: Use SoundWire address as firmware name suffix for new silicon
      ASoC: cs35l56: Use SoundWire address as alternate firmware suffix on L56 B0
      ASoC: doc: cs35l56: Update to add new SoundWire firmware filename suffix
      ASoC: doc: cs35l56: Add CS35L63 to the list of supported devices

Sven Peter (1):
      ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig

Thorsten Blum (1):
      ASoC: sdw_utils: Fix potential NULL pointer deref in is_sdca_endpoint_present()

Zhang Yi (1):
      ASoC: codecs: ES8326: Modify initialization configuration

 Documentation/sound/codecs/cs35l56.rst             | 24 ++++++--
 sound/soc/amd/yc/acp6x-mach.c                      | 14 +++++
 sound/soc/apple/Kconfig                            |  1 -
 sound/soc/codecs/cs35l56-sdw.c                     | 18 +++---
 sound/soc/codecs/cs35l56.c                         | 72 +++++++++++++++++++---
 sound/soc/codecs/cs35l56.h                         |  3 +
 sound/soc/codecs/cs48l32.c                         |  4 ++
 sound/soc/codecs/es8326.c                          |  3 +-
 sound/soc/codecs/wm_adsp.c                         | 27 +++++---
 sound/soc/codecs/wm_adsp.h                         |  2 +
 sound/soc/intel/common/sof-function-topology-lib.c |  3 +-
 sound/soc/loongson/loongson_i2s.c                  |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |  2 +
 sound/soc/sof/imx/imx8.c                           | 15 +++++
 14 files changed, 154 insertions(+), 35 deletions(-)
