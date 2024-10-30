Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDCB9B6451
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2024 14:39:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8026DE5;
	Wed, 30 Oct 2024 14:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8026DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730295544;
	bh=k30kmsCWpODfnqP0hSv6V6AkWO0J+rpHxysAf3Zxd1M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c6yVHdmQiV7Y6d9/q2B8vj3T12fBTsscnvHPQdQXriLf16npV9p51TEHe5/DdoQVk
	 VqUJchcJribLreToiSMfH4Lpe6e4m5zedZNfe4YcZp0EvWFIvVdUTHfGCsrhLdWVzg
	 AC15e+oVQsmQBphz3srV7kbr6H+ZWtP56gqZ3FtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6061AF805BB; Wed, 30 Oct 2024 14:38:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF3CF805B0;
	Wed, 30 Oct 2024 14:38:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77EF5F80269; Wed, 30 Oct 2024 14:38:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D87BF80104
	for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2024 14:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D87BF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gTpWIyPz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5508A40708;
	Wed, 30 Oct 2024 13:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFFCC4CEE3;
	Wed, 30 Oct 2024 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730295503;
	bh=k30kmsCWpODfnqP0hSv6V6AkWO0J+rpHxysAf3Zxd1M=;
	h=From:To:Cc:Subject:Date:From;
	b=gTpWIyPzwgLDxclJHSiiLCsYEFs+fb9XsOc+XKFarG44DxdIDBjidooa9xJBrfRBx
	 Wxqr6LxHI0HKrv3XJMCclS3ArWWl8rnhEwFI0Orn3P6m/CuRVZrd/F2zboIB3cuGNc
	 rezhkFAP0RszOCFbr7mxJIQjrs3Pb5IojCIwIUDsd19+ltpSOlT/o0h5M3PlgqUh3+
	 GFZzZ3wzAubIizAO3bbM81KsCNTyT0oQbHamIc8OXYsLOFeXx7L964apo5/RRs40HA
	 5anjCmWYH/mnzVxM1Yp0MQrjJAxJBi6R589fOhquFBDTFNOezuTMo1HEamKDEbaaYu
	 K6wR7U5ZCyNmQ==
Message-ID: <4326ff8a13b27d320ea10dcbe8eafc15.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.12-rc5
Date: Wed, 30 Oct 2024 13:38:14 +0000
Message-ID-Hash: IQFIBJWRII42UP3GBKMV4JR3B3S3QHCY
X-Message-ID-Hash: IQFIBJWRII42UP3GBKMV4JR3B3S3QHCY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQFIBJWRII42UP3GBKMV4JR3B3S3QHCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit db7e59e6a39a4d3d54ca8197c796557e6d480b0d:

  ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc (2024-10-22 21:00:38 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc5

for you to fetch changes up to 2db63e92186d7201ee1cb2f5af11757c5e5a1020:

  wcd937x codec fixes (2024-10-29 19:18:48 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.12

The biggest set of changes here is Hans' fixes and quirks for various
Baytrail based platforms with RT5640 CODECs, and there's one core fix
for a missed length assignment for __counted_by() checking.  Otherwise
it's small device specific fixes, several of them in the DT bindings.

----------------------------------------------------------------
Aleksei Vetrov (1):
      ASoC: dapm: fix bounds checker error in dapm_widget_list_create

Alexey Klimov (2):
      ASoC: codecs: wcd937x: add missing LO Switch control
      ASoC: codecs: wcd937x: relax the AUX PDM watchdog

Christophe JAILLET (1):
      ASoC: cs42l51: Fix some error handling paths in cs42l51_probe()

Dmitry Yashin (1):
      ASoC: dt-bindings: rockchip,rk3308-codec: add port property

Hans de Goede (5):
      ASoC: codecs: rt5640: Always disable IRQs from rt5640_cancel_work()
      ASoC: Intel: bytcr_rt5640: Add support for non ACPI instantiated codec
      ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet
      ASoC: Intel: sst: Support LPE0F28 ACPI HID
      ASoC: Intel: sst: Fix used of uninitialized ctx to log an error

Mark Brown (1):
      wcd937x codec fixes

 .../bindings/sound/rockchip,rk3308-codec.yaml      |  4 ++
 sound/hda/intel-dsp-config.c                       |  4 ++
 sound/soc/codecs/cs42l51.c                         |  7 ++-
 sound/soc/codecs/rt5640.c                          | 27 +++++----
 sound/soc/codecs/wcd937x.c                         | 12 +++-
 sound/soc/codecs/wcd937x.h                         |  4 ++
 sound/soc/intel/atom/sst/sst_acpi.c                | 64 +++++++++++++++++++---
 sound/soc/intel/boards/bytcr_rt5640.c              | 48 +++++++++++++++-
 sound/soc/soc-dapm.c                               |  2 +
 9 files changed, 144 insertions(+), 28 deletions(-)
