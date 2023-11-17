Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C90997EF442
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 15:16:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BE1A4C;
	Fri, 17 Nov 2023 15:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BE1A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700230593;
	bh=DP9rtR2NnfQdLpn2ciM7P3EbdUVTo2eu8B1kq47NCWw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=osh+yVe77Cd5z7jtx3Al5ht7VnpaGxaqEShq4vFfzJ75NqShj7QfQrQ8d4Gtf+Tf9
	 p/qCiUYYNes/APekvUJRKYifTgbSP09NU2ls1F5Sok7ybDq/JNuOum5z8ga6ts/3Yr
	 3dFMF3vBN/EhAnzgzsagBvZ68KyePSxUbIUEIC+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D32AF805BA; Fri, 17 Nov 2023 15:14:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B3FF805B1;
	Fri, 17 Nov 2023 15:14:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 116E5F80563; Fri, 17 Nov 2023 15:14:02 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A657F8016E
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 15:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A657F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Q+vz0Z0s
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AH8IefO017599;
	Fri, 17 Nov 2023 08:13:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=M6W+QVktOBh17HSN1EqFh0hC5Sn5ODIVhO8qEILw3CI=; b=
	Q+vz0Z0sPPk3Oq84zc6ryjNjyQ9+dNZ20e35fOfvatApQXucmpa4hFn59rDoMdwa
	sUru9OKW/aAMa5iNlfUGfSZzbu0CaFfi2q2jgcYjoWSW1zq0SwSTZt74kgEXLYmO
	fWY6KpzUkViYRzXKmt4Cm/LbXuLPA/iDqUATGzQTO/DVDu2UndM4dK8CXXGNl1ai
	ZDnXMyOGpHQMsi1+mF/mK+6eswRIBIS7crFOJ8IIta2q65gFY9zkRGTttqfxbMhr
	1yD1UsLLfXg1t4JRDUsoABOllzA+t7LdFsctoD3DZIwQdDRB8iaHiFv1Y+b+rPbK
	W7WsgVdQAbFnVN1n4/BH0Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ua7w2qj86-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:13:54 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 14:13:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Fri, 17 Nov 2023 14:13:47 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 21C3E15B9;
	Fri, 17 Nov 2023 14:13:47 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH 7/7] ASoC:cs43130: Add switch to control normal and alt hp
 inputs
Date: Fri, 17 Nov 2023 14:13:44 +0000
Message-ID: <20231117141344.64320-8-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HHy7PmnneZgXiJqVC4NCra9DsHWE9Gp0
X-Proofpoint-GUID: HHy7PmnneZgXiJqVC4NCra9DsHWE9Gp0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VYWSSCCR5JSF6PYVX3X72JGKW6CSA2VL
X-Message-ID-Hash: VYWSSCCR5JSF6PYVX3X72JGKW6CSA2VL
X-MailFrom: prvs=668552b693=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYWSSCCR5JSF6PYVX3X72JGKW6CSA2VL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make sure these inputs are mutually exclusive as recommended by the
datasheet

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/codecs/cs43130.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 1e7c32eedc7b..8b77bd7fa907 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1419,7 +1419,15 @@ static int cs43130_hpin_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static const char * const bypass_mux_text[] = {
+	"Internal",
+	"Alternative",
+};
+static SOC_ENUM_SINGLE_DECL(bypass_enum, SND_SOC_NOPM, 0, bypass_mux_text);
+static const struct snd_kcontrol_new bypass_ctrl = SOC_DAPM_ENUM("Switch", bypass_enum);
+
 static const struct snd_soc_dapm_widget digital_hp_widgets[] = {
+	SND_SOC_DAPM_MUX("Bypass Switch", SND_SOC_NOPM, 0, 0, &bypass_ctrl),
 	SND_SOC_DAPM_OUTPUT("HPOUTA"),
 	SND_SOC_DAPM_OUTPUT("HPOUTB"),
 
@@ -1472,13 +1480,13 @@ static const struct snd_soc_dapm_route digital_hp_routes[] = {
 	{"DSD", NULL, "XSPIN DSD"},
 	{"HiFi DAC", NULL, "ASPIN PCM"},
 	{"HiFi DAC", NULL, "DSD"},
-	{"HPOUTA", NULL, "HiFi DAC"},
-	{"HPOUTB", NULL, "HiFi DAC"},
+	{"Bypass Switch", "Internal", "HiFi DAC"},
+	{"HPOUTA", NULL, "Bypass Switch"},
+	{"HPOUTB", NULL, "Bypass Switch"},
 };
 
 static const struct snd_soc_dapm_route analog_hp_routes[] = {
-	{"HPOUTA", NULL, "Analog Playback"},
-	{"HPOUTB", NULL, "Analog Playback"},
+	{"Bypass Switch", "Alternative", "Analog Playback"},
 };
 
 static struct snd_soc_dapm_route all_hp_routes[
-- 
2.34.1

