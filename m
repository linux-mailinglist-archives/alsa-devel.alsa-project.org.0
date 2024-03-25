Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B4D889D11
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 12:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A3D14E7;
	Mon, 25 Mar 2024 12:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A3D14E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711366541;
	bh=zmwpU7zhfw8O1UTOk5P7IsqdbKBMPEewor0lPLRRAe8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bXsb73F2zDHsTiwbV+5vE4E8cTMXXvkHNnqsGVvDEeJjHfk1yutvrk19y5HmubVkE
	 nLPUIu5zw2HfwisRkL8hN+kxodmYX9tddLYJKgl/ywtXY81Zg1T4MxL4bJrQJqccNn
	 FP0OOFZqacGbgs72lS4qRN1zfFUpMEFX6cWi/wxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 690BEF8063A; Mon, 25 Mar 2024 12:34:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65674F805F5;
	Mon, 25 Mar 2024 12:34:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99E3BF801EB; Mon, 25 Mar 2024 12:33:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87089F802DB
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 12:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87089F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NashjA8/
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P4qkf6007553;
	Mon, 25 Mar 2024 06:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=siE7HV2Pcf2Dad5MeeLwU/Yn1sAi4q9OlYqKhgzd2rk=; b=
	NashjA8/Q6yMq0d0V5XiRUMLbsmsBR+X5iYlJsguj8r7kCVgGQedcEb1s+eBTQZ4
	eKrkPRVJNmRy6L3ucPqBf03oj+pbguD4A+14zCAYLoWX7G+RHnlqGVAfplOHLWcA
	Zmh8oFgA5/bMnYXvfTQubNFV8KKGQU25I5pGd2PULacF9zJ4U9AF7V7Cpz8CID0Y
	c7dFUvH3DOck9t0LkrfHTBbTS74q80zOcvdURlhywP0wDbLPCNjy6HFV6kCr8l40
	e8BZkAtxavmFfcdPMHCEUB9x1C5NxUaxoLbSlc9AumuwAz5BQfmqROgLaT1qkcxQ
	QnypmRPWiTKliVUCE/Xk4w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyb6v0-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:31:32 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 11:31:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 25 Mar 2024 11:31:27 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5553E820259;
	Mon, 25 Mar 2024 11:31:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 5/5] ALSA: hda: hda_cs_dsp_ctl: Remove notification of driver
 write
Date: Mon, 25 Mar 2024 11:31:27 +0000
Message-ID: <20240325113127.112783-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325113127.112783-1-rf@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: F0iH18PgYYJ0Qf-2-ARpnSRL4tt02OfD
X-Proofpoint-GUID: F0iH18PgYYJ0Qf-2-ARpnSRL4tt02OfD
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BYAA5NGPCBCTZLBWVH7NTQILIE3WD3A7
X-Message-ID-Hash: BYAA5NGPCBCTZLBWVH7NTQILIE3WD3A7
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYAA5NGPCBCTZLBWVH7NTQILIE3WD3A7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Any control that the driver is updating should be marked as SYSTEM and
therefore will not have an ALSA control to notify.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 725544d81941..7f2d35cf245b 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -201,7 +201,6 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 			 unsigned int alg, const void *buf, size_t len)
 {
 	struct cs_dsp_coeff_ctl *cs_ctl;
-	struct hda_cs_dsp_coeff_ctl *ctl;
 	int ret;
 
 	mutex_lock(&dsp->pwr_lock);
@@ -211,13 +210,6 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 	if (ret < 0)
 		return ret;
 
-	if (ret == 0 || (cs_ctl->flags & WMFW_CTL_FLAG_SYS))
-		return 0;
-
-	ctl = cs_ctl->priv;
-
-	snd_ctl_notify(ctl->card, SNDRV_CTL_EVENT_MASK_VALUE, &ctl->kctl->id);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_ctl, SND_HDA_CS_DSP_CONTROLS);
-- 
2.39.2

