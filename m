Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 839BB8B5E1A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 17:50:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF981E3;
	Mon, 29 Apr 2024 17:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF981E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714405818;
	bh=3mw6rtABDCZZ+y8mq0TqU78G9uRbAoqq1Ix7EHzSQT0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iiLFVe4UEuXkMXN+bKX623ovHdMkf2FcADYd8zYbnOqcCpCFEReKVZGOkvtIL27Wj
	 NqSol2J6G7reUccILiEmvpOePIJ86SzJMyVmomPxiSP9Qe3HBHfy1rQsPH3FVUrZ8b
	 z0HmOtekMsKHOtE1tWUeFfWLNt2dLa5RWqC3E8eU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1682F805F0; Mon, 29 Apr 2024 17:49:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D55BF805E8;
	Mon, 29 Apr 2024 17:49:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECB8BF805B0; Mon, 29 Apr 2024 17:49:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B69C8F8028D
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 17:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B69C8F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nxHjhMN+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43T6vDHR000342;
	Mon, 29 Apr 2024 10:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Xot4qV+EwjLjF2ltygsOgaGZdZnQADQAtNMb0oSFwo4=; b=
	nxHjhMN+eqtpnZqB3EJkceqYil1wTKeWZVzPkut1SwSaYFLL3Es7s8+lh8EhPlvz
	PWxKEj9WIK13vreK8SdYdcX0O5DJt5vK4geXXpbBdauuBgzt4pfyBBTlLQ8lmJ2l
	kkPYMDRL2x+3G7rWsCkcWypTxGyk1TWuCb9ptPix4VvtJne5HNW8HN7HpyDJayQQ
	TNNIdNVzSybWCbvx7sATyRvM/u9hRkSshj3Io3Hml8hKZ44ZDZKuaaRA3hX6DADK
	7IVqhUtQ3zDpHebDQoczeCo27fMSjcQGJSbvoCBCpPQCKhtAqQh5akpTiDMJaF8N
	1NHyXQiY1jzgzDGWteWEJw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xrxry21tq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 10:48:59 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 16:48:56 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 29 Apr 2024 16:48:56 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.105])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3C65082024A;
	Mon, 29 Apr 2024 15:48:56 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ALSA: hda: cs35l41: Add support for ASUS ROG 2024
 Laptops
Date: Mon, 29 Apr 2024 16:48:53 +0100
Message-ID: <20240429154853.9393-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429154853.9393-1-sbinding@opensource.cirrus.com>
References: <20240429154853.9393-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UO_VahBEfXpKyROk5vZ0g2k_jZWlAJE8
X-Proofpoint-GUID: UO_VahBEfXpKyROk5vZ0g2k_jZWlAJE8
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OJWVPOINNM5VICTPRENL4NLYTYU5HSQ7
X-Message-ID-Hash: OJWVPOINNM5VICTPRENL4NLYTYU5HSQ7
X-MailFrom: prvs=284996dae7=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJWVPOINNM5VICTPRENL4NLYTYU5HSQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All of these laptops do not have _DSD, so need to be added to the
configuration table.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index be97e973accb..ad9b6abdf269 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -97,6 +97,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431863", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "104318D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "10431A83", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
+	{ "10431B93", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431C9F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CAF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CCF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
@@ -110,6 +111,10 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "10433A20", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
+	{ "10433A30", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
+	{ "10433A40", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
+	{ "10433A50", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10433A60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "17AA3865", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA3866", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
@@ -492,6 +497,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431863", generic_dsd_config },
 	{ "CSC3551", "104318D3", generic_dsd_config },
 	{ "CSC3551", "10431A83", generic_dsd_config },
+	{ "CSC3551", "10431B93", generic_dsd_config },
 	{ "CSC3551", "10431C9F", generic_dsd_config },
 	{ "CSC3551", "10431CAF", generic_dsd_config },
 	{ "CSC3551", "10431CCF", generic_dsd_config },
@@ -505,6 +511,10 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431F12", generic_dsd_config },
 	{ "CSC3551", "10431F1F", generic_dsd_config },
 	{ "CSC3551", "10431F62", generic_dsd_config },
+	{ "CSC3551", "10433A20", generic_dsd_config },
+	{ "CSC3551", "10433A30", generic_dsd_config },
+	{ "CSC3551", "10433A40", generic_dsd_config },
+	{ "CSC3551", "10433A50", generic_dsd_config },
 	{ "CSC3551", "10433A60", generic_dsd_config },
 	{ "CSC3551", "17AA3865", generic_dsd_config },
 	{ "CSC3551", "17AA3866", generic_dsd_config },
-- 
2.34.1

