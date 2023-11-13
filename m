Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7057EA164
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 17:41:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25D28829;
	Mon, 13 Nov 2023 17:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25D28829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699893704;
	bh=0ukNua8ATcr87S7Mj/tfUq8qS5fWkkUOik0pOHeRlEQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HeKjOPSxve0g5lIhxt9dYiQryoIetRYam4p2l+qCX0VLYEy5tJuECmTJKkQDlcKrS
	 Kf1iD6CKBZ5jywO2UGZ9zuy7ulqK0dt4AqekmT14Ln6GE0WU65h07rVdb8dRVM6qGI
	 WI0y2bzmiXjTug0G3jB5WTOoh1Jd0soyjk9bSzx0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC83F802E8; Mon, 13 Nov 2023 17:40:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0774CF8016E;
	Mon, 13 Nov 2023 17:40:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458F8F801D5; Mon, 13 Nov 2023 17:40:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C584DF800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 17:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C584DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jLartDMU
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ADFOIcM019092;
	Mon, 13 Nov 2023 10:40:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=b
	77U65NzPhkgOKHWlwkTamYPj/TOXrDCPIuZPvkXAr8=; b=jLartDMUDTXTK7sS6
	fm93omS1OhekimiXA5nCpAISjucg604mgvCK7ZUyEgE+px2ai6Isel7PrisQD8pt
	kMil41eUS964EUu3Tpc9H+qjiv4yBawG+A6/8qkHnB/MQ87FX6N2ua9kHmu/dj6D
	aqS18dGmHS4KRoJIFuR5/h6DUMUcczU26kkoobzUTxTZ1wiurGUxGqNg2XG0eMQ9
	5DqHlTNyOzO7qgv4P7hblv0wKTIho5RUlpBcQR8TExESMPJLeZ2m27WgLadx3Vbu
	M9lABrTWY8nrma+MFsslZe/gn5681QUrMiZ6sk8WJ5u3mmJagtvhXHRLsDz+zz8y
	gswyg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ua7w2j53c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 10:40:36 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 16:40:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Mon, 13 Nov 2023 16:40:29 +0000
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4F98811A8;
	Mon, 13 Nov 2023 16:40:29 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH RESEND] ALSA: hda: cs35l56: Enable low-power hibernation mode
 on i2c
Date: Mon, 13 Nov 2023 16:40:29 +0000
Message-ID: <20231113164029.1156669-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xPkX2Qqns_D4KVv73hnt8y1Hn9SBru9-
X-Proofpoint-GUID: xPkX2Qqns_D4KVv73hnt8y1Hn9SBru9-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HJPVN5CUMNPBSY4ZKGESLPEDTDWETA22
X-Message-ID-Hash: HJPVN5CUMNPBSY4ZKGESLPEDTDWETA22
X-MailFrom: prvs=6681475e03=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJPVN5CUMNPBSY4ZKGESLPEDTDWETA22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

This can now be re-enabled as the sequence to reliably wake the device
has been implemented in the shared ASoC code.

This has a functional dependency on commit 3df761bdbc8b
("ASoC: cs35l56: Wake transactions need to be issued twice")

To protect against this, enabling hibernation is conditional on
CS35L56_WAKE_HOLD_TIME_US being defined, which indicates that the new
hibernation sequences are available.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda_i2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index 757a4d193e0f..a9ef6d86de83 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -21,6 +21,10 @@ static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
 		return -ENOMEM;
 
 	cs35l56->base.dev = &clt->dev;
+
+#ifdef CS35L56_WAKE_HOLD_TIME_US
+	cs35l56->base.can_hibernate = true;
+#endif
 	cs35l56->base.regmap = devm_regmap_init_i2c(clt, &cs35l56_regmap_i2c);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
-- 
2.30.2

