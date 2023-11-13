Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 509797EA0C6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 17:00:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFAAE3E;
	Mon, 13 Nov 2023 16:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFAAE3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699891223;
	bh=0OTj/VKF1lvo/657Cu6puu8RMPav05W2vubsKOrjVdc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vrvKno0lNSOxRr27JEpjbtRe6LT9QLxAm14a9UAMgN6LM860df2zgVUfbOPEDidOX
	 0jcpHOGcT922AZTFj2ZS9MbsUd2BkVMSoRP8UJ9WNa1LBE4+UeKvu8CXDQ8pSF22lZ
	 xFQTcyT/1iyFIAiq2+fEahwCKEqf58sum8zCyswY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 387E7F80249; Mon, 13 Nov 2023 16:59:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9263F8016E;
	Mon, 13 Nov 2023 16:59:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0C01F801D5; Mon, 13 Nov 2023 16:59:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84965F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 16:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84965F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JlF7Fp1f
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ADFO6LP007624;
	Mon, 13 Nov 2023 09:59:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=7
	WAaHo9vN3n8olVjTbIuMzYwpBu53QT8nvGk21L3UEE=; b=JlF7Fp1fubS98zGOE
	U6NbfYaQ3RIoGf06uB61HU75cL6ZPORXopuM+dDq5iEihTe68qUkRXJ9oF0aZYQ4
	F2w1F2JIn0AkBwsDGmYLNvnsKOMJ+R2ujpXu3dw+FrrpFNVdD2O6idwHVWt87BgN
	9iamgOa3X1G/BXEXF9uQUzb6PFSPXmuqvxS/teoXLGYBIJDCYWgfYEhoQJzHEDHm
	+/qRBiCohfW+0c7Glc/7YpLyn7cI2yaB9C7wygmfMx90KH68kP+o7ryKi1qJseR8
	l9FVeGFmD6ZWK3ugt+G02x9SkSxfd6gmiBplsPtt/EEuqUtmp5FtbrWl+fNGuzmZ
	dRQmQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ua6wpa2bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 09:59:17 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 15:59:16 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Mon, 13 Nov 2023 15:59:16 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 532ED11A8;
	Mon, 13 Nov 2023 15:59:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm8974: Correct boost mixer inputs
Date: Mon, 13 Nov 2023 15:59:16 +0000
Message-ID: <20231113155916.1741027-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QQKbc8KYmHi3UNbWS8YBUxMqYo8Nty_I
X-Proofpoint-ORIG-GUID: QQKbc8KYmHi3UNbWS8YBUxMqYo8Nty_I
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N2MPSPO54OBRQ6HKJKSIHV3PFV2XEFRK
X-Message-ID-Hash: N2MPSPO54OBRQ6HKJKSIHV3PFV2XEFRK
X-MailFrom: prvs=6681151699=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2MPSPO54OBRQ6HKJKSIHV3PFV2XEFRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Bit 6 of INPPGA (INPPGAMUTE) does not control the Aux path, it controls
the input PGA path, as can been seen from Figure 8 Input Boost Stage in
the datasheet. Update the naming of things in the driver to match this
and update the routing to also reflect this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm8974.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index 044b6f604c090..260bac695b20a 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -186,7 +186,7 @@ SOC_DAPM_SINGLE("PCM Playback Switch", WM8974_MONOMIX, 0, 1, 0),
 
 /* Boost mixer */
 static const struct snd_kcontrol_new wm8974_boost_mixer[] = {
-SOC_DAPM_SINGLE("Aux Switch", WM8974_INPPGA, 6, 1, 1),
+SOC_DAPM_SINGLE("PGA Switch", WM8974_INPPGA, 6, 1, 1),
 };
 
 /* Input PGA */
@@ -246,8 +246,8 @@ static const struct snd_soc_dapm_route wm8974_dapm_routes[] = {
 
 	/* Boost Mixer */
 	{"ADC", NULL, "Boost Mixer"},
-	{"Boost Mixer", "Aux Switch", "Aux Input"},
-	{"Boost Mixer", NULL, "Input PGA"},
+	{"Boost Mixer", NULL, "Aux Input"},
+	{"Boost Mixer", "PGA Switch", "Input PGA"},
 	{"Boost Mixer", NULL, "MICP"},
 
 	/* Input PGA */
-- 
2.39.2

