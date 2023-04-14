Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD9E6E26EE
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 17:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAFEE76;
	Fri, 14 Apr 2023 17:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAFEE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681486024;
	bh=IMJGoWV/h2zznnnpWLatVajCasMGruRwlT0SUhiXkc0=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=vHnh3NBdQWU0xJbTrxwSA+CkkOz+/FvdNi+d8JOUIVDaL3r54y51uzj7o+TGwBGXH
	 ReCzb5uZJrukaYVoRFeTVOY0HCYHn/mnBfr/f8v+55rXcdTWvsiK6KSxXYjIrTsNic
	 /rOJp2AhEgXBn+iXbTa2bI/tClovC+1HJ6ewt11Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E14EFF8032B;
	Fri, 14 Apr 2023 17:26:13 +0200 (CEST)
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
Subject: [PATCH v1 3/4] ALSA: cs35l41: Fix default regmap values for some
 registers
Date: Fri, 14 Apr 2023 16:25:51 +0100
In-Reply-To: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
References: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYV5MZ33GMHJ5KDKCXLQIMHHOQ4UTR4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168148597269.26.1569480749441489052@mailman-core.alsa-project.org>
From: Stefan Binding via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E4A2F8051F; Fri, 14 Apr 2023 17:26:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 943CDF8023A
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 17:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 943CDF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VtmhZIrD
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33E7k6Wl003961;
	Fri, 14 Apr 2023 10:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fjFs/7f3dFz2OTkn4kKsaTBEamc34d9Tzg4y7U6KXUM=;
 b=VtmhZIrD6mNr91Sr6u02L2CkY8drI77l1O/CeKzpMPLfJmBOtX37Q63ea6B8yMpPVo+s
 DjdSvpJM/s4ghTWL/gJmlDjNCJ0nnJB4jSHJPlRa9JwtMQHWt5gRayF8K9hP3DUXZS3n
 7jxfpkdv42fsrHc03WHT7OlAysLx76ODc4Pp6iWn7eY6x66LZHn89rzA0GSqvGHf4dWn
 AI51zD14+CrBJlpvesyokbaJ4ga3d9YfFCYH7dr57malXyJyGf8O1EsWAk1gVuwfuEEH
 COWJl1D9HimtXUImDDvxtakmsf6js3U6l2X0BYy667NLd3edUqVHQW8itvdZ6wdaDVdp +Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pxm3qa2sv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 10:26:01 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 14 Apr
 2023 10:26:00 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Apr 2023 10:26:00 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C6B2511C6;
	Fri, 14 Apr 2023 15:25:59 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
Subject: [PATCH v1 3/4] ALSA: cs35l41: Fix default regmap values for some
 registers
Date: Fri, 14 Apr 2023 16:25:51 +0100
Message-ID: <20230414152552.574502-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
References: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mmGkCZSi7rCS15raiHdKCPZq_Ps-Hxj1
X-Proofpoint-GUID: mmGkCZSi7rCS15raiHdKCPZq_Ps-Hxj1
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FYV5MZ33GMHJ5KDKCXLQIMHHOQ4UTR4T
X-Message-ID-Hash: FYV5MZ33GMHJ5KDKCXLQIMHHOQ4UTR4T
X-MailFrom: prvs=9468da70c5=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYV5MZ33GMHJ5KDKCXLQIMHHOQ4UTR4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several values do not match the defaults of CS35L41, fix them.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 8538e2871c5fa..1e4205295a0de 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -46,7 +46,7 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_DSP1_RX5_SRC,			0x00000020 },
 	{ CS35L41_DSP1_RX6_SRC,			0x00000021 },
 	{ CS35L41_DSP1_RX7_SRC,			0x0000003A },
-	{ CS35L41_DSP1_RX8_SRC,			0x00000001 },
+	{ CS35L41_DSP1_RX8_SRC,			0x0000003B },
 	{ CS35L41_NGATE1_SRC,			0x00000008 },
 	{ CS35L41_NGATE2_SRC,			0x00000009 },
 	{ CS35L41_AMP_DIG_VOL_CTRL,		0x00008000 },
@@ -58,8 +58,8 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_IRQ1_MASK2,			0xFFFFFFFF },
 	{ CS35L41_IRQ1_MASK3,			0xFFFF87FF },
 	{ CS35L41_IRQ1_MASK4,			0xFEFFFFFF },
-	{ CS35L41_GPIO1_CTRL1,			0xE1000001 },
-	{ CS35L41_GPIO2_CTRL1,			0xE1000001 },
+	{ CS35L41_GPIO1_CTRL1,			0x81000001 },
+	{ CS35L41_GPIO2_CTRL1,			0x81000001 },
 	{ CS35L41_MIXER_NGATE_CFG,		0x00000000 },
 	{ CS35L41_MIXER_NGATE_CH1_CFG,		0x00000303 },
 	{ CS35L41_MIXER_NGATE_CH2_CFG,		0x00000303 },
-- 
2.34.1

