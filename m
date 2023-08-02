Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 675AF76CC69
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 14:13:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E1F2DE;
	Wed,  2 Aug 2023 14:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E1F2DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690978430;
	bh=zfCJvd/Tmz3+6MxDSZeiYm/108T6+YpXxE/pYfkuzyU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oaFfwIKiQLFSvpBPPYkIrQ0gaAiLVSb6J/E6O1azIdeeJN5YKbWJ6imIe79+yGJVy
	 /3RYt0/Mnp9E9NxHFGu8ubStQGqCFDRbj++vaNKvP6YmfxhwtBeyHQHPEUiI5sz0tw
	 L60En+aiouTcvPOxW/lpPN5dg4qDi2JTTA7lgAoI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE81F80087; Wed,  2 Aug 2023 14:12:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 020EEF801D5;
	Wed,  2 Aug 2023 14:12:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B2C8F8025A; Wed,  2 Aug 2023 14:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2762BF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 14:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2762BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IJkEkMCZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 372AfO5i009394;
	Wed, 2 Aug 2023 07:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=8
	rBFF1JOEa2gQYBCopxKQOjevDVf2/rhuHmRPELguQI=; b=IJkEkMCZ5iseNP5OK
	aU/VSrAKi/w8tIinONgl9K2AARoLDPAs/bdZddf1zQlPGFKdBamC/VdI16kKazek
	eraGMvZ3GRRS5GDPYfm1d3DtTC8MqICb1jju0s3mI/bBN6gY3g2TO02vcPAZCUa4
	ByswCblnRk+AithPxdPKyzzD+1rEV0gijj4jf+kxNXxkmoIGKBKtdSaKyD3gu4jU
	YRBjFZ/8W1EXthOECHk0N3IjDQio1Xn7FwEhsUY+4jmwDpS3Bu1gUaLV1bitgvoC
	F/zBu3Wo9xBnJjslrheyDvl1LDQw8TbRjnT6DqxhdC6rWLZyEzoqLO7P1c4Y1n8X
	+sbUg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s4y6juqs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 07:12:44 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 13:12:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 2 Aug 2023 13:12:43 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.244])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F89A15B4;
	Wed,  2 Aug 2023 12:12:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda: cs35l41: Print amp configuration after bind
Date: Wed, 2 Aug 2023 13:12:35 +0100
Message-ID: <20230802121235.467358-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NEwOoSa2ppwufrcOLRYWrooU3qswq85R
X-Proofpoint-ORIG-GUID: NEwOoSa2ppwufrcOLRYWrooU3qswq85R
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: K2UKZ3CWK4D3DU7KYS5MGOSJ2QTY22JV
X-Message-ID-Hash: K2UKZ3CWK4D3DU7KYS5MGOSJ2QTY22JV
X-MailFrom: prvs=35788967b4=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2UKZ3CWK4D3DU7KYS5MGOSJ2QTY22JV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Print amp configuration information to be able to confirm ACPI
_DSD information (and other useful info) for each amp on each
system using CS35L41, without having to get the acpidump.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 98feb5ccd5866..825e551be9bb8 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1124,6 +1124,13 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
+	dev_info(cs35l41->dev,
+		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
+		 cs35l41->acpi_subsystem_id, cs35l41->hw_cfg.bst_type,
+		 cs35l41->hw_cfg.gpio1.func == CS35l41_VSPK_SWITCH,
+		 cs35l41->hw_cfg.spk_pos ? 'R' : 'L',
+		 cs35l41->firmware_running, cs35l41->speaker_id);
+
 	return ret;
 }
 
-- 
2.34.1

