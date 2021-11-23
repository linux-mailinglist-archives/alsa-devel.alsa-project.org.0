Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCE845B4F0
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:08:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00B7E16BC;
	Wed, 24 Nov 2021 08:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00B7E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737738;
	bh=eR9VBQ1o61QlGdhpbHOSP9v+TKTTclczLWzRQG7T7Ek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crltOUYE/moEHWarPErWRK4Zq9FyE8OsFiLSUuJ/jGTkSOUliChfWRGWcTQBVPtFC
	 NxcUaB74b0bmfZFM96IjpWyIdH1HHee2xoCRPMc+9xrt9c0ENOPWYC09Dc8oz9odvp
	 whK+q5Cg+75nMHeuWVQ/Er1qZcyhi3dTKUMZIlHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08912F80506;
	Wed, 24 Nov 2021 08:06:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFB82F804FD; Tue, 23 Nov 2021 17:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E390F804F2
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E390F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aS0EZ2Vj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ANCeXB9012277;
 Tue, 23 Nov 2021 10:31:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=3brB89ZjjL1+5gZabDKcSweNLeFIOFiD2/pzoTpGB34=;
 b=aS0EZ2Vju2RGGYiKQ/QPUiq5bMS3CShN71QKpNQd47oAq+Y4P/VVCd/YapN18CUJGmU7
 1iKKOgvXCLPMJvhK3K8YnMxBWnXX3DpRgymWKiaIvagVz78Dtz57OiDxgDM8QNrP/pCt
 n3X8aVZlG2oLZYPA8tgOtQmL3ODtFmMdieXJsa9vRW29ppJYr+L6gROTOJ3eN6VQMTAO
 CNtLMrW8O2osht8cgmVodhRqq2n0SjFb0HSHZyp3I6C/mWHZudwggKm+cG+fhcKG6ije
 aU8Ve3bjEerPCMsLbvfe8I9HAjHt7I6Uy3zLLb/2SD9v3TLB2ufEbj1f7+fJttome0k3 qA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cg5ms21ng-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 10:31:56 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 16:31:55 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 16:31:55 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.11])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1766C2A1;
 Tue, 23 Nov 2021 16:31:55 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, David Rhodes
 <david.rhodes@cirrus.com>, Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PATCH 06/11] ASoC: cs35l41: Move power initializations to
 reg_sequence
Date: Tue, 23 Nov 2021 16:31:44 +0000
Message-ID: <20211123163149.1530535-7-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: F5c1oj581rDWt8ngW0Q1II8UAmHOrnin
X-Proofpoint-ORIG-GUID: F5c1oj581rDWt8ngW0Q1II8UAmHOrnin
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Jack Yu <jack.yu@realtek.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, Arnd
 Bergmann <arnd@arndb.de>, Jeremy Szu <jeremy.szu@canonical.com>,
 patches@opensource.cirrus.com, Elia Devito <eliadevito@gmail.com>,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-acpi@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 linux-kernel@vger.kernel.org
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

ASoC and HDA systems for all revisions of CS35L41 will benefit
from having this initialization, so add it to reg_sequence of
each revision

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c |  2 +-
 sound/soc/codecs/cs35l41.c     | 29 +++++++++--------------------
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index a13c5313f4e5..cd9be6fbf910 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -43,7 +43,7 @@ const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_CLASSH_CFG,			0x000B0405 },
 	{ CS35L41_WKFET_CFG,			0x00000111 },
 	{ CS35L41_NG_CFG,			0x00000033 },
-	{ CS35L41_AMP_GAIN_CTRL,		0x00000273 },
+	{ CS35L41_AMP_GAIN_CTRL,		0x00000000 },
 	{ CS35L41_GPIO1_CTRL1,			0xE1000001 },
 	{ CS35L41_GPIO2_CTRL1,			0xE1000001 },
 	{ CS35L41_MIXER_NGATE_CFG,		0x00000000 },
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 0a88c2f164d1..20edc40b2fab 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1267,6 +1267,9 @@ static int cs35l41_handle_pdata(struct device *dev,
 }
 
 static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
+	{ CS35L41_DSP1_CCM_CORE_CTRL,	 0x00000000 },
+	{ CS35L41_PWR_CTRL2,		 0x00000000 },
+	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
 	{ 0x00000040,			 0x00005555 },
 	{ 0x00000040,			 0x0000AAAA },
 	{ 0x00003854,			 0x05180240 },
@@ -1286,6 +1289,9 @@ static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
 };
 
 static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
+	{ CS35L41_DSP1_CCM_CORE_CTRL,	 0x00000000 },
+	{ CS35L41_PWR_CTRL2,		 0x00000000 },
+	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
 	{ 0x00000040,			 0x00005555 },
 	{ 0x00000040,			 0x0000AAAA },
 	{ CS35L41_VIMON_SPKMON_RESYNC,	 0x00000000 },
@@ -1299,6 +1305,9 @@ static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
 };
 
 static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
+	{ CS35L41_DSP1_CCM_CORE_CTRL,	 0x00000000 },
+	{ CS35L41_PWR_CTRL2,		 0x00000000 },
+	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
 	{ 0x00000040,			 0x00005555 },
 	{ 0x00000040,			 0x0000AAAA },
 	{ CS35L41_VIMON_SPKMON_RESYNC,	 0x00000000 },
@@ -1533,26 +1542,6 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 		goto err;
 	}
 
-	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_CCM_CORE_CTRL, 0);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write CCM_CORE_CTRL failed: %d\n", ret);
-		goto err;
-	}
-
-	ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				 CS35L41_AMP_EN_MASK, 0);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write CS35L41_PWR_CTRL2 failed: %d\n", ret);
-		goto err;
-	}
-
-	ret = regmap_update_bits(cs35l41->regmap, CS35L41_AMP_GAIN_CTRL,
-				 CS35L41_AMP_GAIN_PCM_MASK, 0);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write CS35L41_AMP_GAIN_CTRL failed: %d\n", ret);
-		goto err;
-	}
-
 	ret = cs35l41_set_pdata(cs35l41);
 	if (ret < 0) {
 		dev_err(cs35l41->dev, "Set pdata failed: %d\n", ret);
-- 
2.34.0

