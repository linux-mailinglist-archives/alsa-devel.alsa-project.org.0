Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B90158174EA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 16:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526CCE86;
	Mon, 18 Dec 2023 16:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526CCE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702912458;
	bh=rGcIu7AZNagZ9U/Vb6lsXjp1KWmkQxiFV/HwYmiLBH0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=COVgxRGgz/bfxAVWnjpUG4PVP+KpIoRVKXxU2irHm6Rx7FQkM0dXg9NQ/OFC+s4Cm
	 /KtgcXcF8v93q+vFHYkddKOLi8nRYgsgIOvDbkDGa/HtYuINuZD7tg3h/mdJsgYpFh
	 wk79APqCSFdTezWzG/v83e7sJ6Ak77q9aRE/GhME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5256F805E4; Mon, 18 Dec 2023 16:13:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D2DF805EF;
	Mon, 18 Dec 2023 16:13:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D13CF8055C; Mon, 18 Dec 2023 16:13:10 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 18076F80425
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 16:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18076F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c+0/cAvR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BI5gNV5015248;
	Mon, 18 Dec 2023 09:12:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=5uCZuNm6fqqAvQVXFBBbV28goTCBorkO1dPizFuHNsQ=; b=
	c+0/cAvRm0/ZR+luGffszhLt4Q/XBJfPkjzGkejW6Lvz0ZaG9wTikrZy+FIG9mbx
	WlCdfrdY/drTGPNiLnQ7AAq573KhdozqQkOnfpHAKqJoc0yip2EBUG5NfzyKZqqb
	Ytce1hFN5mMrGiLQv6KPHyjubKsdwJ40i0QEAe/+Ux5DXZr6UeMlpwdcKEQyulF1
	4iNHKwHiBwxTBp8XdYSH2pEgZ7jyLCgrKeYtbeBXxw0qkPRuaTOO1F99lM9IGdZL
	h/z1/O1mHVXJi/itIwvlOA43udIbfPqwkfXxeB8BoLdf1ojw1ZkncJdixIh3euKJ
	R0LD7dL5NdNiLohfHNWW3g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a622ub0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 09:12:51 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 15:12:48 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Mon, 18 Dec 2023 15:12:48 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.77])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D735A15B9;
	Mon, 18 Dec 2023 15:12:47 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 4/7] ALSA: hda: cs35l41: Support additional ASUS Zenbook
 2022 Models
Date: Mon, 18 Dec 2023 15:12:18 +0000
Message-ID: <20231218151221.388745-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218151221.388745-1-sbinding@opensource.cirrus.com>
References: <20231218151221.388745-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D_Mo1Vlq9YGbsE27llwoSqix7duLUowU
X-Proofpoint-ORIG-GUID: D_Mo1Vlq9YGbsE27llwoSqix7duLUowU
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 47AZDMZPHJ4W427PN5SBHA6A2CI7FVUY
X-Message-ID-Hash: 47AZDMZPHJ4W427PN5SBHA6A2CI7FVUY
X-MailFrom: prvs=7716b2c674=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47AZDMZPHJ4W427PN5SBHA6A2CI7FVUY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new model entries into configuration table.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index a0d808ed640a..07fe72bb128a 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -42,6 +42,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
  * in the ACPI. The Reset GPIO is also valid, so we can use the Reset defined in _DSD.
  */
 	{ "103C89C6", SPI, 2, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, -1, -1, -1, 1000, 4500, 24 },
+	{ "104312AF", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431473", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 1000, 4500, 24 },
@@ -60,6 +61,11 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431CDF", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CEF", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431D1F", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
+	{ "10431DA2", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "10431E02", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "10431EE2", I2C, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "10431F12", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
+	{ "10431F62", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{}
 };
 
@@ -334,6 +340,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
 	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
 	{ "CSC3551", "103C89C6", generic_dsd_config },
+	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
 	{ "CSC3551", "10431473", generic_dsd_config },
@@ -352,6 +359,11 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431CDF", generic_dsd_config },
 	{ "CSC3551", "10431CEF", generic_dsd_config },
 	{ "CSC3551", "10431D1F", generic_dsd_config },
+	{ "CSC3551", "10431DA2", generic_dsd_config },
+	{ "CSC3551", "10431E02", generic_dsd_config },
+	{ "CSC3551", "10431EE2", generic_dsd_config },
+	{ "CSC3551", "10431F12", generic_dsd_config },
+	{ "CSC3551", "10431F62", generic_dsd_config },
 	{}
 };
 
-- 
2.34.1

