Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070383BED8
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 11:32:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71C4210;
	Thu, 25 Jan 2024 11:32:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71C4210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706178751;
	bh=mcO1kO6Eusffstk0a+UN48hUNihoWe2RVTyOdQQQLSc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFDDO4b+PI5T4v24HzQU19/TA1skpKfzoj0x2iS3v2yYKEjO5eqnw4m3Ml563ST5r
	 uCDo3jOm/SfGBQU5aE39W8RG1vovGnL4aCKmuKgFDzH1BstbvryYNwCQoj+W+PkARy
	 CLipPyT4iNUW6Yt3f8cNXf+EbbvzAYc7vhWId238=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4BE2F805AA; Thu, 25 Jan 2024 11:31:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 418ADF805BB;
	Thu, 25 Jan 2024 11:31:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B52AF804F1; Thu, 25 Jan 2024 11:31:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E018AF8028D
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 11:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E018AF8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Qu4YdkA0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P6oFQ3010841;
	Thu, 25 Jan 2024 04:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=6rjHj7YqFV202SVDxF4wuFl4W48j8/J0dMPI7OQKbSM=; b=
	Qu4YdkA0IJS3AdWIFjIkddN49LUy7HOCJknUW3P9F6ZjExqtrFvIh1sJwgEbiDko
	qTzNVpfvfKfI46aJWFg1UxsQF9JoAK+THNuHFG7Pu1Auekqg8h31g3z0z6sD+Oe/
	uJ19jE9R/PNNe8n7K4LUB/CNsabGNsoRTxDrnqNdNQybBpaViQWogLx4vLGr9UdQ
	mHm0jcWw+itUPPYO/CQ9IKKke2xmAK14pZNXKaSyEBYujqaKrRAXwWtadECn3540
	HbItKRPq7pAK4rbHOJNvHDY5aefZrXvNToKecg1BrJlZcXGXESkpZNGYG1AnjP9f
	Tw8kpmNJ0Xsf3eAjbY8N1g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 75972820247;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 2/7] ASoC: cs42l43: Minor code tidy ups
Date: Thu, 25 Jan 2024 10:31:12 +0000
Message-ID: <20240125103117.2622095-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Y8ct22JkvgvxYLPfMkDowfVIWHa1qeeh
X-Proofpoint-GUID: Y8ct22JkvgvxYLPfMkDowfVIWHa1qeeh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CELMHSUOOTZ3BCJLNSTP4R7KYZKP7CST
X-Message-ID-Hash: CELMHSUOOTZ3BCJLNSTP4R7KYZKP7CST
X-MailFrom: prvs=8754d201d6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CELMHSUOOTZ3BCJLNSTP4R7KYZKP7CST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add some missing commas, refactor a couple small bits of code.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Move static assert

Thanks,
Charles

 sound/soc/codecs/cs42l43-jack.c | 10 +++++-----
 sound/soc/codecs/cs42l43.c      | 12 ++++--------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 1d8d7bf0a6b0d..4f7a405b7e06a 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -29,11 +29,11 @@
 #include "cs42l43.h"
 
 static const unsigned int cs42l43_accdet_us[] = {
-	20, 100, 1000, 10000, 50000, 75000, 100000, 200000
+	20, 100, 1000, 10000, 50000, 75000, 100000, 200000,
 };
 
 static const unsigned int cs42l43_accdet_db_ms[] = {
-	0, 125, 250, 500, 750, 1000, 1250, 1500
+	0, 125, 250, 500, 750, 1000, 1250, 1500,
 };
 
 static const unsigned int cs42l43_accdet_ramp_ms[] = { 10, 40, 90, 170 };
@@ -851,6 +851,9 @@ static const char * const cs42l43_jack_text[] = {
 	"Line-In", "Microphone", "Optical",
 };
 
+static_assert(ARRAY_SIZE(cs42l43_jack_override_modes) ==
+	      ARRAY_SIZE(cs42l43_jack_text) - 1);
+
 SOC_ENUM_SINGLE_VIRT_DECL(cs42l43_jack_enum, cs42l43_jack_text);
 
 int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
@@ -873,9 +876,6 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int override = ucontrol->value.integer.value[0];
 
-	BUILD_BUG_ON(ARRAY_SIZE(cs42l43_jack_override_modes) !=
-		     ARRAY_SIZE(cs42l43_jack_text) - 1);
-
 	if (override >= e->items)
 		return -EINVAL;
 
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f2332f90f8337..d418c0b0ce9aa 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1059,12 +1059,10 @@ static int cs42l43_decim_get(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	ret = cs42l43_shutter_get(priv, CS42L43_STATUS_MIC_SHUTTER_MUTE_SHIFT);
-	if (ret < 0)
-		return ret;
+	if (ret > 0)
+		ret = cs42l43_dapm_get_volsw(kcontrol, ucontrol);
 	else if (!ret)
 		ucontrol->value.integer.value[0] = ret;
-	else
-		ret = cs42l43_dapm_get_volsw(kcontrol, ucontrol);
 
 	return ret;
 }
@@ -1077,12 +1075,10 @@ static int cs42l43_spk_get(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	ret = cs42l43_shutter_get(priv, CS42L43_STATUS_SPK_SHUTTER_MUTE_SHIFT);
-	if (ret < 0)
-		return ret;
+	if (ret > 0)
+		ret = snd_soc_get_volsw(kcontrol, ucontrol);
 	else if (!ret)
 		ucontrol->value.integer.value[0] = ret;
-	else
-		ret = snd_soc_get_volsw(kcontrol, ucontrol);
 
 	return ret;
 }
-- 
2.30.2

