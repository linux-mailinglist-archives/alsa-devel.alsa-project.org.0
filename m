Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E68941953
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 18:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B044985D;
	Tue, 30 Jul 2024 18:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B044985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722357099;
	bh=VlviwKtHP665YGCmI0bZGZDw7hxPytqD75fhyDynpxM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Vnz4ZEzXqhpQ2k2Xw1RT5pRL0j9goX0F32MGLYGGLwv3D5FohIWggLlYYB5LkZJ7I
	 ISWtN8M5lh9pIOSoSbH4vEcoVw+nv2UEHgvNLqz/KSPlvKGUJss2BSCKAF8ttZsnQm
	 rMZJk3M16EwNWKecY98KsvEDTvS+YYvwv3EJkUAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47B44F805BD; Tue, 30 Jul 2024 18:31:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92503F80579;
	Tue, 30 Jul 2024 18:31:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E8D4F802DB; Tue, 30 Jul 2024 18:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A487F8007E
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 18:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A487F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DDWUlSQZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46UFVqWH031765;
	Tue, 30 Jul 2024 11:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=u1uco8dY1nLjJCL5
	MRzVa0owg84ItQ/f5cnVxKxZ2bA=; b=DDWUlSQZyvwsTXbUbXAxP8/uZ17K70YL
	G4UpuIX8udTkAt/uqA8L+B6WYySWRKQSNlQz86+twVh1s3/37mMmGzSIwIYFIS24
	0G1eBZaC9CX/48DDaOoQyPkWpQsbCibmq9/+foMEhKqKfcyWUmmLHUDQYPtWnzQ4
	8cFzj3nazD4bF0L04m2JuqnmizdjBmzUC7vsj14v36pj5XCUMgIL7l3QeJOR8i7q
	C31AkjYOXIW7BSPduI+qaRdUAmuinWYL0riGYsOoOlfn+/U8gAwidbWFUDrxHjGG
	GrE1rsopz6F7Fy8EHeB21LkQC5uEc47+Tl50W6JB3bWUTYlgj+DkRQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9yknva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 11:29:16 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 17:29:13 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 30 Jul 2024 17:29:13 +0100
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com
 [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6E219820244;
	Tue, 30 Jul 2024 16:29:13 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH v2] ALSA: hda: cs35l56: Stop creating ALSA controls for
 firmware coefficients
Date: Tue, 30 Jul 2024 16:29:07 +0000
Message-ID: <20240730162907.300046-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BG-5tlWomrq32wMWkNjD7FexXkw-8csm
X-Proofpoint-ORIG-GUID: BG-5tlWomrq32wMWkNjD7FexXkw-8csm
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5AVMCPAWEB35DMRQF5WEGVR5YOA464S2
X-Message-ID-Hash: 5AVMCPAWEB35DMRQF5WEGVR5YOA464S2
X-MailFrom: prvs=5941a4037b=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5AVMCPAWEB35DMRQF5WEGVR5YOA464S2/>
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

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
Changes in v2:
- v1 was accidentally the backport version for older kernels instead of
  the one for v6.11

 sound/pci/hda/cs35l56_hda.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 96d3f13c5abf..f2f623f713d1 100644
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
@@ -613,7 +617,7 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	 */
 	if (cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
-	else
+	else if (expose_dsp_controls)
 		add_dsp_controls_required = true;
 
 	cs35l56->base.fw_patched = false;
-- 
2.43.0

