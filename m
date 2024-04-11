Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 039248A128F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 13:09:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6432BBD;
	Thu, 11 Apr 2024 13:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6432BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712833776;
	bh=XyTyh+E1UlS4JdlwwhhbntVL91jfQIUuQ1Mtn/NrsdU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iRy9vvZL6Tg7LffjCKbrzHyQYkqytAzCc/THaOvIiDyFCnL7IKUyhOYC+Bt817q6Y
	 /M5fMcp+wDQFbw6GLh9CWBwi9xyenICbeVZj88yWZlrYKnakZKOnosdXVZ1xUc0gsO
	 aAy9+4hkYb4Wc34Nf+9LcoGJASMpd3laqvAJXkVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14267F805F0; Thu, 11 Apr 2024 13:08:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D14DDF805F4;
	Thu, 11 Apr 2024 13:08:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1CCDF805B3; Thu, 11 Apr 2024 13:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B67EF80238
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 13:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B67EF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=S37KW6N5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43B5naK0004518;
	Thu, 11 Apr 2024 06:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=PF4nkE9+JPkNNlQSTlgjGViKbcCsRBPb9MnofVi+A34=; b=
	S37KW6N5OA9dXs9wUnJ+OBnN0PWHes4OWoJXqZeUsQKCpvY7TwhXB+/wvD2L8ph4
	bVmjQD6gY1wSQQC53/T/n7KxjsMIcZ2ncXYvKUJEw6hpYOyV/Tu/VFgsCuTSwFXC
	GEwjkhU5+APunReh02VmXNUZQR+DaUlckgt/TccbZ2DY4VpamiRpMWtXU7NBuil4
	Sp6uPCitq1kKheDRhnCA8U241MunzEHU6rc97jSN+ObPOU+wTZ8gyRKfVHt37aAm
	nLNdgU8Qki4xednqQrBiyc2c8/oadpwBFwt6aKAqVPnE3nKGQ03U0tzykf5Org4e
	J/Lc3gc4thMqVzXgqxB0AQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xb2tjq7m4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 06:08:18 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 12:08:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 11 Apr 2024 12:08:15 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.64.140])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A204E820243;
	Thu, 11 Apr 2024 11:08:15 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 2/7] ALSA: hda: cs35l41: Support HP Omen models without
 _DSD
Date: Thu, 11 Apr 2024 12:08:08 +0100
Message-ID: <20240411110813.330483-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411110813.330483-1-sbinding@opensource.cirrus.com>
References: <20240411110813.330483-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YNqGmAeW3gqEOLfmY_35RaWJzGI_8Q4o
X-Proofpoint-GUID: YNqGmAeW3gqEOLfmY_35RaWJzGI_8Q4o
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PYUI5IQVEMMM7MP5MV3KSOMSZRBGV3E4
X-Message-ID-Hash: PYUI5IQVEMMM7MP5MV3KSOMSZRBGV3E4
X-MailFrom: prvs=1831d0461d=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYUI5IQVEMMM7MP5MV3KSOMSZRBGV3E4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for 2 new HP Omen models without _DSD into configuration
table.
These laptops use the PCM Gain setting for the tuning setting file.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 8fb688e41414..efa62e99d330 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -70,6 +70,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C15", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8C16", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8C17", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8C4D", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8C4E", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8C4F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8C50", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
@@ -457,6 +459,8 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C15", generic_dsd_config },
 	{ "CSC3551", "103C8C16", generic_dsd_config },
 	{ "CSC3551", "103C8C17", generic_dsd_config },
+	{ "CSC3551", "103C8C4D", generic_dsd_config },
+	{ "CSC3551", "103C8C4E", generic_dsd_config },
 	{ "CSC3551", "103C8C4F", generic_dsd_config },
 	{ "CSC3551", "103C8C50", generic_dsd_config },
 	{ "CSC3551", "103C8C51", generic_dsd_config },
-- 
2.34.1

