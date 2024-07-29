Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837F93FAC6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 18:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C74C852;
	Mon, 29 Jul 2024 18:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C74C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722270293;
	bh=e25RnGm3UUfzN+5y7ZyHo2fNUQbHueNz+JQ13IN92Q8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ciIqz+KV0h9MgrxvjU1TUUXLn+iv/o8yMLGJExYg5/xklOnt3+hvYNJpPzqijp633
	 G5QUkrOwlP/Rft5qh4zvC04bVzxYRPONkRlRlv8HqSY6W5V9EYNR4+CiX+XOiELfiU
	 MVuHaDOlPSmnsuAwTnf/jYXOPy2a/iMeEhTYyBQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15221F805BD; Mon, 29 Jul 2024 18:24:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E07F805AF;
	Mon, 29 Jul 2024 18:24:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B414FF802DB; Mon, 29 Jul 2024 18:16:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7464DF8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 18:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7464DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nFLP2IPC
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46TFGMTM019487;
	Mon, 29 Jul 2024 11:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qRzBBbqoXOWQyyYO
	JMgkXOAR8+qV4bh0yhqqlwUEGVA=; b=nFLP2IPC2OwvDdvbC44c7L85phYx/Lz+
	aavMdD6RmN/mkSRX9N/a/bUz9SiEI/Gg8FU/yEC6Wer/XZhFH5B2HaG6h13TIlK9
	Hv5PxrNsPRikZ1+KD9tvgX/KSBLh6ELrdJRQKEXU2Kj6yT3HUfpvTrNxgGh3GSZf
	sxAV7mvY8g9GK1CcwAPM9r1bb2+ELpuCFgPBy4m9IKu0GMHQu2GmBXFm6V320GBr
	9Qnl33OzKSErJRGAIJgtqS0bISnI/eeCT3IcnMJBvSmY53ae1ZrIVyviFifosaju
	0So/5sAQVTNF0KRbzZz88NWQvW0/PlFQzjFKjwzafkvbi0xuW4KZLQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40mwajtbgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 11:15:36 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 17:15:34 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 29 Jul 2024 17:15:34 +0100
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com
 [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3E6F6820244;
	Mon, 29 Jul 2024 16:15:34 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Stop creating ALSA controls for firmware
 coefficients
Date: Mon, 29 Jul 2024 16:15:32 +0000
Message-ID: <20240729161532.147893-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JDXsPmEN9C12lN1Lyq9L7W6c4TiV9wzo
X-Proofpoint-ORIG-GUID: JDXsPmEN9C12lN1Lyq9L7W6c4TiV9wzo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IFFYP2ANW4NDKCFHMCOJAZY6W6JDU2JH
X-Message-ID-Hash: IFFYP2ANW4NDKCFHMCOJAZY6W6JDU2JH
X-MailFrom: prvs=5940d8ee55=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFFYP2ANW4NDKCFHMCOJAZY6W6JDU2JH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A number of laptops have gone to market with old firmware versions that
export controls that have since been hidden, but we can't just install a
newer firmware because the firmware for each product is customized and
qualified by the OEM. The issue is that alsactl save and restore has no
idea what controls are good to persist which can lead to
misconfiguration.

As the ALSA controls for the firmware coefficients are not used in
normal operation they can all be hidden, but add a kernel parameter so
that they can be re-enabled for debugging.

Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 96d3f13c5abf..1494383b22c9 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -23,6 +23,10 @@
 #include "hda_cs_dsp_ctl.h"
 #include "hda_generic.h"
 
+static bool expose_dsp_controls;
+module_param(expose_dsp_controls, bool, 0444);
+MODULE_PARM_DESC(expose_dsp_controls, "Expose firmware controls as ALSA controls 0=no (default), 1=yes");
+
  /*
   * The cs35l56_hda_dai_config[] reg sequence configures the device as
   *  ASP1_BCLK_FREQ = 3.072 MHz
@@ -758,6 +762,9 @@ static int cs35l56_hda_bind(struct device *dev, struct device *master, void *mas
 
 	cs35l56_hda_create_controls(cs35l56);
 
+	if (expose_dsp_controls)
+		cs35l56_hda_add_dsp_controls(cs35l56);
+
 #if IS_ENABLED(CONFIG_SND_DEBUG)
 	cs35l56->debugfs_root = debugfs_create_dir(dev_name(cs35l56->base.dev), sound_debugfs_root);
 	cs_dsp_init_debugfs(&cs35l56->cs_dsp, cs35l56->debugfs_root);
-- 
2.43.0

