Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FB72794F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 09:56:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD5C1E0;
	Thu,  8 Jun 2023 09:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD5C1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686211018;
	bh=flkwd+cS1UFdA2LPg5OR/SxECia5Ev31svFTfct7CA0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZgAAoTgcgv7hDHBm8QMDkf1FtHjzhOGkHHUqxXTxATXGMtm27vfUtq5ruS0h96j0D
	 ZOQatWyQmnVUocDJMrFgrf+EVgpATBqdKQGES/qW+8EEF8CRHK+HUejTPt0AUiTtsn
	 2BsOvY0gxcIrlMMOOjiKxcjYJbn0l5zhfxdAk/78=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74873F80155; Thu,  8 Jun 2023 09:56:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26988F8016C;
	Thu,  8 Jun 2023 09:56:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E61F80199; Thu,  8 Jun 2023 09:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCFBFF80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 09:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCFBFF80130
X-Alimail-AntiSpam: 
 AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VkdWBH-_1686210941;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VkdWBH-_1686210941)
          by smtp.aliyun-inc.com;
          Thu, 08 Jun 2023 15:55:53 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] ASoC: max98088: clean up some inconsistent indenting
Date: Thu,  8 Jun 2023 15:55:40 +0800
Message-Id: <20230608075540.61575-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CSPOTBRREKAEJ5WF27ATYBAZSB56CZA6
X-Message-ID-Hash: CSPOTBRREKAEJ5WF27ATYBAZSB56CZA6
X-MailFrom: jiapeng.chong@linux.alibaba.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSPOTBRREKAEJ5WF27ATYBAZSB56CZA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No functional modification involved.

sound/soc/codecs/max98088.c:316 m98088_eq_band() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5461
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/max98088.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index fb136e2b849b..8b56ee550c09 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -310,24 +310,24 @@ static const struct regmap_config max98088_regmap = {
 static void m98088_eq_band(struct snd_soc_component *component, unsigned int dai,
                    unsigned int band, u16 *coefs)
 {
-       unsigned int eq_reg;
-       unsigned int i;
+	unsigned int eq_reg;
+	unsigned int i;
 
 	if (WARN_ON(band > 4) ||
 	    WARN_ON(dai > 1))
 		return;
 
-       /* Load the base register address */
-       eq_reg = dai ? M98088_REG_84_DAI2_EQ_BASE : M98088_REG_52_DAI1_EQ_BASE;
+	/* Load the base register address */
+	eq_reg = dai ? M98088_REG_84_DAI2_EQ_BASE : M98088_REG_52_DAI1_EQ_BASE;
 
-       /* Add the band address offset, note adjustment for word address */
-       eq_reg += band * (M98088_COEFS_PER_BAND << 1);
+	/* Add the band address offset, note adjustment for word address */
+	eq_reg += band * (M98088_COEFS_PER_BAND << 1);
 
-       /* Step through the registers and coefs */
-       for (i = 0; i < M98088_COEFS_PER_BAND; i++) {
-               snd_soc_component_write(component, eq_reg++, M98088_BYTE1(coefs[i]));
-               snd_soc_component_write(component, eq_reg++, M98088_BYTE0(coefs[i]));
-       }
+	/* Step through the registers and coefs */
+	for (i = 0; i < M98088_COEFS_PER_BAND; i++) {
+		snd_soc_component_write(component, eq_reg++, M98088_BYTE1(coefs[i]));
+		snd_soc_component_write(component, eq_reg++, M98088_BYTE0(coefs[i]));
+	}
 }
 
 /*
-- 
2.20.1.7.g153144c

