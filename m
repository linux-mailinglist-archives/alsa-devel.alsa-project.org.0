Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4D32A765
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:09:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B7D1827;
	Tue,  2 Mar 2021 18:08:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B7D1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614704963;
	bh=DkBaU7RZcLD9H61QaaaXvDyixRcKMX7EPmnfgt+c+cY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YFxw7jPJWG3pDTkH6Ez62NRCAS4MpQsBwUf4OIzAwCUAnlZbjMFtPbbeCDM4CioNX
	 Sp78/7QhqQgy12uup6h5vOBeyEvCdp7K67+cRqG4zWYh2namOUpX7spERFmaLHav/7
	 obfnGgo+UugXlTXg2qPyUuv/nIiKD4wv2cu4l348=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C4CEF804BD;
	Tue,  2 Mar 2021 18:05:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF42FF804AB; Tue,  2 Mar 2021 18:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F11F80271
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F11F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cbz5lxO4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1q3I022910; Tue, 2 Mar 2021 11:05:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fbaXXrCWSEwKc2VncIQf9I1NN+n7V/J3WuSHX2/J8cw=;
 b=cbz5lxO4+rmCfn81gGpPrfbPtoYgCpPJ2eAKUpjZnURdzKD6Plynr17KExnEqr4euRXk
 wotdLWBhi5Q3h+M6nDz+rEQ7WcZcXctN/+4AY+sSxMtC42EZbueVfalf1XNukedhD0cl
 p81OXPPmY4dxbN70BIrPbluIObAmQuq4znB5pqdi7eA/uvuCwi8cfyda5Jt/+ReWSdhw
 8JK+7miQF7mFNfkjSH9hoREV6V/6AKjex7Q5/qKVhi+yNSmfzMtqvox1EIq7WKfWXcuU
 F3GuigjhK6Acp1WW/hxHxgSn37sigJD9HHEdgyR8s4zL8lGgE+cJDMdgsjclbJqnjjZA dQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6usg9-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 11:05:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 17:05:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 17:05:00 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4896811D5;
 Tue,  2 Mar 2021 17:05:00 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>
Subject: [PATCH 05/15] ASoC: cs42l42: Fix Bitclock polarity inversion
Date: Tue, 2 Mar 2021 17:04:44 +0000
Message-ID: <20210302170454.39679-6-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020131
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The driver was setting bit clock polarity opposite to intended polarity.
Also simplify the code by grouping ADC and DAC clock configurations into
a single field.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 20 ++++++++------------
 sound/soc/codecs/cs42l42.h | 11 ++++++-----
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a567d38af8d3f..834b702fe4297 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -759,27 +759,23 @@ static int cs42l42_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	/* Bitclock/frame inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
+		asp_cfg_val |= CS42L42_ASP_SCPOL_NOR << CS42L42_ASP_SCPOL_SHIFT;
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_LCPOL_IN_SHIFT;
+		asp_cfg_val |= CS42L42_ASP_SCPOL_NOR << CS42L42_ASP_SCPOL_SHIFT;
+		asp_cfg_val |= CS42L42_ASP_LCPOL_INV << CS42L42_ASP_LCPOL_SHIFT;
 		break;
 	case SND_SOC_DAIFMT_IB_NF:
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_SCPOL_IN_DAC_SHIFT;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_LCPOL_IN_SHIFT;
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_SCPOL_IN_DAC_SHIFT;
+		asp_cfg_val |= CS42L42_ASP_LCPOL_INV << CS42L42_ASP_LCPOL_SHIFT;
 		break;
 	}
 
-	snd_soc_component_update_bits(component, CS42L42_ASP_CLK_CFG,
-				CS42L42_ASP_MODE_MASK |
-				CS42L42_ASP_SCPOL_IN_DAC_MASK |
-				CS42L42_ASP_LCPOL_IN_MASK, asp_cfg_val);
+	snd_soc_component_update_bits(component, CS42L42_ASP_CLK_CFG, CS42L42_ASP_MODE_MASK |
+								      CS42L42_ASP_SCPOL_MASK |
+								      CS42L42_ASP_LCPOL_MASK,
+								      asp_cfg_val);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 6a500d0146a28..2bd370b184e1d 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -258,11 +258,12 @@
 #define CS42L42_ASP_SLAVE_MODE		0x00
 #define CS42L42_ASP_MODE_SHIFT		4
 #define CS42L42_ASP_MODE_MASK		(1 << CS42L42_ASP_MODE_SHIFT)
-#define CS42L42_ASP_SCPOL_IN_DAC_SHIFT	2
-#define CS42L42_ASP_SCPOL_IN_DAC_MASK	(1 << CS42L42_ASP_SCPOL_IN_DAC_SHIFT)
-#define CS42L42_ASP_LCPOL_IN_SHIFT	0
-#define CS42L42_ASP_LCPOL_IN_MASK	(1 << CS42L42_ASP_LCPOL_IN_SHIFT)
-#define CS42L42_ASP_POL_INV		1
+#define CS42L42_ASP_SCPOL_SHIFT		2
+#define CS42L42_ASP_SCPOL_MASK		(3 << CS42L42_ASP_SCPOL_SHIFT)
+#define CS42L42_ASP_SCPOL_NOR		3
+#define CS42L42_ASP_LCPOL_SHIFT		0
+#define CS42L42_ASP_LCPOL_MASK		(3 << CS42L42_ASP_LCPOL_SHIFT)
+#define CS42L42_ASP_LCPOL_INV		3
 
 #define CS42L42_ASP_FRM_CFG		(CS42L42_PAGE_12 + 0x08)
 #define CS42L42_ASP_STP_SHIFT		4
-- 
2.30.1

