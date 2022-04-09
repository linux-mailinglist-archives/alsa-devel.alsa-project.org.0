Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB64FA640
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 11:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BAB01878;
	Sat,  9 Apr 2022 11:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BAB01878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649495805;
	bh=u9SKefDaUbQXKzKyOx1sw/ZJj1GD6ClH59P9LsZbSYU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IHiwbxb3ihGjU2Ok22NAlnJjxYDsjTLXpK4DO93ZBWJT9oanyllwDwX2CZ/MDLsCP
	 dQiJ+nBrp3w7+HWMCviNpS4xKBXrepCYe4Y62Nxp71tJm/FWNyrrf/iRLj9bVFWy8j
	 l+TeIUfdQ2NyTqIs1wAWQmD2Qf7zdNB8jhAvQhKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4DACF80557;
	Sat,  9 Apr 2022 11:13:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CEDAF80548; Sat,  9 Apr 2022 11:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A10A4F80518
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 11:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A10A4F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="F5C1M4j1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.16.1.2) with ESMTP id 239919ov003576;
 Sat, 9 Apr 2022 04:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=pvLoPUP+zOIjxi5uLkLGyB32oVCSgHxrfK1CCMsoqYA=;
 b=F5C1M4j1DxkcJkQRwNeTvFrX5jLUU1+4mVuK6/lTE/bftdZ1sc9fW75yDOTYY9Vdr6eC
 e3VguWZJ0ox0fljjwzM9z1gnK8H3UFyUrBCcdLYy79Rh/qqmL6iTDF8+NiyMO7CoZ+nr
 kp2ndM7wbMfZktVl/Iub00RQp0VSyz3JsOfPavS1KwHK+BklBm2HRWtEzzHA0cK1lj9f
 gZkKYBsdSRX87wEH5hhDSOLjinmb3ZN9Iv5WCVweKFlAhgk8iw9rhQpMfBaItKcdoqj0
 hR89pLyXd1s5HNV24VPhYBbUxQX/tCUsQzBIAAZETc+ehWg8FI+8DQUqCHqR+Z4UOOHs mQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fb6py80wr-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 09 Apr 2022 04:13:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 9 Apr
 2022 10:13:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Sat, 9 Apr 2022 10:13:19 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.156])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9C18846C;
 Sat,  9 Apr 2022 09:13:19 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 08/16] ALSA: hda: cs35l41: Mute the device before shutdown
Date: Sat, 9 Apr 2022 10:13:07 +0100
Message-ID: <20220409091315.1663410-9-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409091315.1663410-1-tanureal@opensource.cirrus.com>
References: <20220409091315.1663410-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: E39D9FTgbmLfn2y3FpzMNsNqBqbPiUUj
X-Proofpoint-GUID: E39D9FTgbmLfn2y3FpzMNsNqBqbPiUUj
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Mute the device before shutdown to avoid pops and clicks for all types
of boost.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 46e920ec3000..0709d09f4e13 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -28,6 +28,11 @@ static const struct reg_sequence cs35l41_hda_config[] = {
 	{ CS35L41_PWR_CTRL2,		0x00000001 }, // AMP_EN = 1
 };
 
+static const struct reg_sequence cs35l41_hda_mute[] = {
+	{ CS35L41_AMP_GAIN_CTRL,	0x00000000 }, // AMP_GAIN_PCM 0.5 dB
+	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, // AMP_VOL_PCM Mute
+};
+
 static const struct reg_sequence cs35l41_hda_start_bst[] = {
 	{ CS35L41_PWR_CTRL2,		0x00000021 }, // BST_EN = 10, AMP_EN = 1
 	{ CS35L41_PWR_CTRL1,		0x00000001, 3000}, // set GLOBAL_EN = 1
@@ -89,7 +94,6 @@ static const struct reg_sequence cs35l41_active_to_safe[] = {
 	{ 0x00000040,			0x00000055 },
 	{ 0x00000040,			0x000000AA },
 	{ 0x00007438,			0x00585941 },
-	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, // AMP_VOL_PCM Mute
 	{ CS35L41_PWR_CTRL2,		0x00000000 }, // AMP_EN = 0
 	{ CS35L41_PWR_CTRL1,		0x00000000 },
 	{ 0x0000742C,			0x00000009, 2000 },
@@ -146,6 +150,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 			ret = regmap_multi_reg_write(reg, reg_seq->prepare, reg_seq->num_prepare);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
+		regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
 		if (reg_seq->cleanup)
 			ret = regmap_multi_reg_write(reg, reg_seq->cleanup, reg_seq->num_cleanup);
 		break;
-- 
2.35.1

