Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A87110EE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 18:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501B7200;
	Thu, 25 May 2023 18:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501B7200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685032049;
	bh=qMVDbGPqje9bK5/6L4M068WHXwpN/xzZ8F/nRhBHw0o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fBO3qG4Avq01XIyEFlJW+XPYpRDMjuv5/q/W4h4yAxmowBuRDjxbBXs0wDjJeFh2u
	 1sxDi+Jo0CVMTngLZ0OOdGa/9C9iZ6Pboa7UIBAeyeILpTeAJFk70mepkOV2XdzYH5
	 N4NxZzJ8wRU5Ls+ppxL/+KVcI8uZm0SEITZ4bqs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C491DF80553; Thu, 25 May 2023 18:26:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D7FDF80553;
	Thu, 25 May 2023 18:26:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C59D8F80557; Thu, 25 May 2023 18:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89E3AF800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 18:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89E3AF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ob09asmR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PEDsKd007206;
	Thu, 25 May 2023 11:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=C+T9AdQHTyKPLCfGUavCqh8ysrmUdzqZXnPiTNqPsGs=;
 b=ob09asmRQy4okE/4HkihIz9be7c24JdvzHhM4U6fWNYDh/WAupQpDUp5pYbTtrhzINvz
 e47B1iZ048v3xPTfcnFAioouLfLqBSirJcesnOAY5bmHKYpC7lcBedHWAIx5qwKjNfSd
 r7K4JRjuWARaZIuP6u2V6TAadfOKY3sFN9G10zfMeWSmD0MTImmlycJrSKhIL2/FLJfq
 2zIEaWGSOi5y8rhFu1fAyrlzODUFMCBQwiPjKW+sSENgJ7NetjfY4r4ARkjtpoTEBoDL
 /z4AYV5vPunjxmT0JxSbIj9sSJL0zPiuF7W97QkvDIWGzhj2irHPjjbr3llcVOp3/8iV 6g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qsde8j0yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 11:26:24 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 11:26:22 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 11:26:22 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1805A11D4;
	Thu, 25 May 2023 16:26:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v2 00/12] ALSA: hda: Adding support for CS35L56 on HDA systems
Date: Thu, 25 May 2023 17:26:06 +0100
Message-ID: <20230525162618.20146-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pZgHlPgAosz1ZHhc11e-jhpuVJDPpy8c
X-Proofpoint-GUID: pZgHlPgAosz1ZHhc11e-jhpuVJDPpy8c
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SBQ2MAZBQ5FTTUS3POWY56MIH2K7AAJ6
X-Message-ID-Hash: SBQ2MAZBQ5FTTUS3POWY56MIH2K7AAJ6
X-MailFrom: prvs=050971c6a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBQ2MAZBQ5FTTUS3POWY56MIH2K7AAJ6/>
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

Finally, #11 and #12 actually add the support for CS35L56 on HDA.

CHANGES SINCE V1
Squash the fix for passing the correct pointer to cs35l56_irq() into
patch #1, where the pointer change to cs35l56_irq() was made.

Richard Fitzgerald (4):
  ASoC: cs35l56: Move runtime suspend/resume to shared library
  ASoC: cs35l56: Move cs_dsp init into shared library
  ASoC: cs35l56: Move part of cs35l56_init() to shared library
  ALSA: hda: Fix missing header dependencies

Simon Trimmer (8):
  ASoC: cs35l56: Move shared data into a common data structure
  ASoC: cs35l56: Make cs35l56_system_reset() code more generic
  ASoC: cs35l56: Convert utility functions to use common data structure
  ASoC: cs35l56: Move utility functions to shared file
  ASoC: cs35l56: Make common function for control port wait
  ASoC: cs35l56: Make a common function to shutdown the DSP
  ALSA: hda: Add mute_hook to hda_component
  ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier

 include/sound/cs35l56.h           |  29 +-
 sound/pci/hda/Kconfig             |  31 +
 sound/pci/hda/Makefile            |   6 +
 sound/pci/hda/cs35l56_hda.c       | 995 ++++++++++++++++++++++++++++++
 sound/pci/hda/cs35l56_hda.h       |  48 ++
 sound/pci/hda/cs35l56_hda_i2c.c   |  69 +++
 sound/pci/hda/cs35l56_hda_spi.c   |  68 ++
 sound/pci/hda/hda_auto_parser.h   |   2 +
 sound/pci/hda/hda_component.h     |   1 +
 sound/pci/hda/hda_generic.h       |   3 +
 sound/soc/codecs/cs35l56-i2c.c    |  14 +-
 sound/soc/codecs/cs35l56-sdw.c    |  72 +--
 sound/soc/codecs/cs35l56-shared.c | 459 +++++++++++++-
 sound/soc/codecs/cs35l56-spi.c    |  10 +-
 sound/soc/codecs/cs35l56.c        | 648 ++++---------------
 sound/soc/codecs/cs35l56.h        |  15 +-
 16 files changed, 1878 insertions(+), 592 deletions(-)
 create mode 100644 sound/pci/hda/cs35l56_hda.c
 create mode 100644 sound/pci/hda/cs35l56_hda.h
 create mode 100644 sound/pci/hda/cs35l56_hda_i2c.c
 create mode 100644 sound/pci/hda/cs35l56_hda_spi.c

-- 
2.30.2

