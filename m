Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F3C97CB88
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 17:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC48B65;
	Thu, 19 Sep 2024 17:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC48B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726759113;
	bh=ba2TAi2tR0SuQFs7sr43Bx+L6d2cJFSg4rHFf0Q/4DU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qZfOLTtcbbqT+1pi7KvQNyrv4Kb71Fq047izfGS2t2h3ldYDllWwTEs521itQFFIm
	 HZLZFG+c8yOo5635bRHfB5jq1djlo1GQ2kn0KwB0cVE2lsJBqmavOM6yBMxjCzZHdv
	 oG7bN9VPE+uY/yLJE/DCjgXIGeACwJ/tekzwvkV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33868F805B5; Thu, 19 Sep 2024 17:18:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C775F805B0;
	Thu, 19 Sep 2024 17:18:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFA99F8020D; Thu, 19 Sep 2024 17:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2394DF800D0
	for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2024 17:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2394DF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=j0YoRPa8
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48JEPQHB023219;
	Thu, 19 Sep 2024 10:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=baelYAyAIIoXLLAW
	vPDu8R5un3ZAOjFgdb44s4mMjx8=; b=j0YoRPa8011hGxzhRx0CLDYtFeNYNrka
	Xx7CofxzE91mIHpl6r+jfRpyQYqaGN4jCvGozFYo37NR3rXU4wPyfZ4Egl1z9k3w
	2qY8IqKS2K3gFsetwCoax3S7ErR2JfsqVT+2PswMqp2MqsMaf192mEnqSaXXrmcE
	W0q32om6T7l/6rA6kc3s+8UBJEayhdVQDk52atXz4fHzr/SJPOcxcffrejzdnML0
	uVSTPMOjLIDRi3NM6uKbjgRwYSdYGEY3qKd2/heOiSUDHIYblDmgF2cjDKWGkjME
	AB/xByMCwa9/+KfUCzGRisDbpdrElySJgYIuip6jQV8AF6ZDMl8VCA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41n7vy6bjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 10:17:07 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 16:17:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 19 Sep 2024 16:17:05 +0100
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com
 [141.131.145.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 216D2820248;
	Thu, 19 Sep 2024 15:17:04 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Ricardo Rivera-Matos
	<rriveram@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l45: Corrects cs35l45_get_clk_freq_id function data
 type
Date: Thu, 19 Sep 2024 15:16:52 +0000
Message-ID: <20240919151654.197337-1-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Z4Iae62f-M4zJT7xEVGP1D4UYNnxK-yC
X-Proofpoint-GUID: Z4Iae62f-M4zJT7xEVGP1D4UYNnxK-yC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: K7LJL2RCGMC7IN6PSFU27SYBH3WE6JOM
X-Message-ID-Hash: K7LJL2RCGMC7IN6PSFU27SYBH3WE6JOM
X-MailFrom: prvs=6992697473=rriveram@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7LJL2RCGMC7IN6PSFU27SYBH3WE6JOM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Changes cs35l45_get_clk_freq_id() function data type from unsigned int
to int. This function is returns a positive index value if successful
or a negative error code if unsuccessful.

Functionally there should be no difference as long as the unsigned int
return is interpreted as an int, however it should be corrected for
readability.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-tables.c | 2 +-
 sound/soc/codecs/cs35l45.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index e1cebb9e4dc6..405dab137b3b 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -315,7 +315,7 @@ static const struct {
 	{ 0x3B, 24576000 },
 };
 
-unsigned int cs35l45_get_clk_freq_id(unsigned int freq)
+int cs35l45_get_clk_freq_id(unsigned int freq)
 {
 	int i;
 
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index e2ebcf58d7e0..7a790d2acac7 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -507,7 +507,7 @@ extern const struct dev_pm_ops cs35l45_pm_ops;
 extern const struct regmap_config cs35l45_i2c_regmap;
 extern const struct regmap_config cs35l45_spi_regmap;
 int cs35l45_apply_patch(struct cs35l45_private *cs35l45);
-unsigned int cs35l45_get_clk_freq_id(unsigned int freq);
+int cs35l45_get_clk_freq_id(unsigned int freq);
 int cs35l45_probe(struct cs35l45_private *cs35l45);
 void cs35l45_remove(struct cs35l45_private *cs35l45);
 
-- 
2.43.0

