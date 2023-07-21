Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F775C7A8
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A5B1F7;
	Fri, 21 Jul 2023 15:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A5B1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689945752;
	bh=+lq1OhJyw1576Y0nULsTD/Wfga/Rzc0qKKFVw/lQ/lU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m9qPCKvb69AO41VgMDZBg7H9EpNFKvLreH8rPJC7exNqWg1VG2aoWcIeqgHhsKhcX
	 SPne28/k3ST7S0EHe4/T4lRWQdpCzYA9MS3lEsETcT/qkhYLI33RZ3QnhM/ahdZh4+
	 vTgHHhSyKi8Fl3qhgrWnYoqnaPqNIckuE3M/zWL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 033F9F8055C; Fri, 21 Jul 2023 15:21:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 716C2F8053B;
	Fri, 21 Jul 2023 15:21:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69B5AF8027B; Fri, 21 Jul 2023 15:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9344CF8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9344CF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TCui+azW
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36L5i7DV017256;
	Fri, 21 Jul 2023 08:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=S
	ras6w/5Pr5D4kJH/bAiUrfrDmtF07M5UZBHB6Cobro=; b=TCui+azW+AqYraJY4
	j6d1ZwkdaM7PMgxz4NsPuXxg7KQfmgSk71q4MC3cU3bo9SefvZxCL0b+mBfNmOb7
	Ff9O4Wy0qiIXTxiB9WflHEK7Q97YehrL/0BItUl3bPKx6GmPZpLX+HUrzErHEyxH
	vK3pVogaSuw3PvJGy8IGh6p0mRz3YBIe16r7WK21MT9oWz/GdP39oET6YhBTzonS
	kXE2rXoWc9Bqs9yiYl+5VcQMD0OTmTwRpLYMulk9onLr602wNm3Tb4ZjIVZwJeMm
	xKBBAcs2XCMkr9Kkx9mB2IZTWWp6ZIztHGhdE9W+XcemGduYsXJSdKNUOhti9ye8
	cWNPA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gyj2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 08:21:24 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 14:21:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 14:21:23 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.172])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CF2146B;
	Fri, 21 Jul 2023 13:21:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v5 00/11] ALSA: hda: Adding support for CS35L56 on HDA systems
Date: Fri, 21 Jul 2023 14:21:09 +0100
Message-ID: <20230721132120.5523-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HXrFS9q7grFIGNA6t1h9R1RCJh0569vT
X-Proofpoint-GUID: HXrFS9q7grFIGNA6t1h9R1RCJh0569vT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YOPNFTENFAXT2UZHIQY2S2Q3NRFMQTTL
X-Message-ID-Hash: YOPNFTENFAXT2UZHIQY2S2Q3NRFMQTTL
X-MailFrom: prvs=25664d1566=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOPNFTENFAXT2UZHIQY2S2Q3NRFMQTTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This set of patches adds support for using the CS35L56 boosted smart
amplifier on HDA systems. In these systems the CS35L56 audio is
routed through a HDA-to-I2S bridge codec.

This doesn't include the changes to the Realtek driver to actually hook
up the CS35L56 driver, because we don't yet have the QUIRK IDs to
associate it with. But we want to publish the driver now so that it is
available for bringing up hardware with the CS35L56.

The first 9 patches are moving code out of the ASoC driver and into the
shared library so that it can be shared with the HDA driver.

Patch #10 fixes missing #includes in the HDA headers so that the CS35L56
driver doesn't have to #include headers that it doesn't use.

CHANGES SINCE V5
The series has been rebased onto commit df4167d658d4
("ASoC: cs35l56: Patch soft registers to defaults"), which removes
cs35l56_reread_firmware_registers() and adds cs35l56_set_patch().

Changes are trivial so I have carried forward Mark's and Takashi's acks.

Patch 01:
- Also changes cs35l56_set_patch() argument to new struct cs35l56_base.

Patch 11:
- Remove call to cs35l56_reread_firmware_registers()
- Add call to cs35l56_set_patch() in cs35l56_hda_common_probe()
- Do not add mute_hook to struct hda_component. This was for use with
  CS8409 as an HDA bridge, but production systems will use Realtek,
  which has its own mute control.
- Use strscpy() instead of strcpy() in cs35l56_hda_mixer_info()
- Fix missing word in Kconfig option title

Richard Fitzgerald (4):
  ASoC: cs35l56: Move runtime suspend/resume to shared library
  ASoC: cs35l56: Move cs_dsp init into shared library
  ASoC: cs35l56: Move part of cs35l56_init() to shared library
  ALSA: hda: Fix missing header dependencies

Simon Trimmer (7):
  ASoC: cs35l56: Move shared data into a common data structure
  ASoC: cs35l56: Make cs35l56_system_reset() code more generic
  ASoC: cs35l56: Convert utility functions to use common data structure
  ASoC: cs35l56: Move utility functions to shared file
  ASoC: cs35l56: Make common function for control port wait
  ASoC: cs35l56: Make a common function to shutdown the DSP
  ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier

 include/sound/cs35l56.h           |  29 +-
 sound/pci/hda/Kconfig             |  31 +
 sound/pci/hda/Makefile            |   6 +
 sound/pci/hda/cs35l56_hda.c       | 995 ++++++++++++++++++++++++++++++
 sound/pci/hda/cs35l56_hda.h       |  48 ++
 sound/pci/hda/cs35l56_hda_i2c.c   |  69 +++
 sound/pci/hda/cs35l56_hda_spi.c   |  68 ++
 sound/pci/hda/hda_auto_parser.h   |   2 +
 sound/pci/hda/hda_generic.h       |   3 +
 sound/soc/codecs/cs35l56-i2c.c    |  14 +-
 sound/soc/codecs/cs35l56-sdw.c    |  72 +--
 sound/soc/codecs/cs35l56-shared.c | 458 +++++++++++++-
 sound/soc/codecs/cs35l56-spi.c    |  10 +-
 sound/soc/codecs/cs35l56.c        | 648 ++++---------------
 sound/soc/codecs/cs35l56.h        |  15 +-
 15 files changed, 1877 insertions(+), 591 deletions(-)
 create mode 100644 sound/pci/hda/cs35l56_hda.c
 create mode 100644 sound/pci/hda/cs35l56_hda.h
 create mode 100644 sound/pci/hda/cs35l56_hda_i2c.c
 create mode 100644 sound/pci/hda/cs35l56_hda_spi.c

-- 
2.30.2

