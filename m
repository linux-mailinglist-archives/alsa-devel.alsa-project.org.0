Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C795AF5C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 09:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9B78843;
	Thu, 22 Aug 2024 09:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9B78843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724312008;
	bh=SQkqoBKvU+aRtrqUw/uCMiX+22wVRYDVIAcM73b2/sQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMyJT0jPwxAcyvQWn3ekJQKEF83IOv0Bg0zdj0Vcuzxh5FzJG3XsguzjDz+SOalwa
	 3o43dur3yR7UUJrkJCW7r3HZbHbQAsid9eTL3H9MRqITZC89owV+4jdqLG/y60EQ+1
	 aqZuXFubZ3tHnRk4rUtroF+MboahcasIQ4uqaD4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B86AF806B9; Thu, 22 Aug 2024 09:31:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E711F80630;
	Thu, 22 Aug 2024 09:31:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AC2AF805A1; Wed, 21 Aug 2024 09:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D178CF8049C
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 09:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D178CF8049C
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WpcYd2jgfz5y94;
	Wed, 21 Aug 2024 14:56:05 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D5CB18006C;
	Wed, 21 Aug 2024 15:00:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 15:00:47 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <peter.ujfalusi@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next 1/5] sound/soc: fix macro definition on
 TWL4030_OUTPUT_PGA
Date: Wed, 21 Aug 2024 15:08:11 +0800
Message-ID: <20240821070815.2326534-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-MailFrom: lihongbo22@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XLZ6PJHWLJ7C4LNRVNSJBUO6OKKQBFPK
X-Message-ID-Hash: XLZ6PJHWLJ7C4LNRVNSJBUO6OKKQBFPK
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:28:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLZ6PJHWLJ7C4LNRVNSJBUO6OKKQBFPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The @mask is not used in TWL4030_OUTPUT_PGA, so we can remove
it and simplify its usage.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/codecs/twl4030.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9c50ac356c89..e3782762139f 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -555,7 +555,7 @@ static const struct snd_kcontrol_new twl4030_dapm_dbypassv_control =
  * On unmute: restore the register content from the reg_cache
  * Outputs handled in this way:  Earpiece, PreDrivL/R, CarkitL/R
  */
-#define TWL4030_OUTPUT_PGA(pin_name, reg, mask)				\
+#define TWL4030_OUTPUT_PGA(pin_name, reg)				\
 static int pin_name##pga_event(struct snd_soc_dapm_widget *w,		\
 			       struct snd_kcontrol *kcontrol, int event) \
 {									\
@@ -575,11 +575,11 @@ static int pin_name##pga_event(struct snd_soc_dapm_widget *w,		\
 	return 0;							\
 }
 
-TWL4030_OUTPUT_PGA(earpiece, TWL4030_REG_EAR_CTL, TWL4030_EAR_GAIN);
-TWL4030_OUTPUT_PGA(predrivel, TWL4030_REG_PREDL_CTL, TWL4030_PREDL_GAIN);
-TWL4030_OUTPUT_PGA(predriver, TWL4030_REG_PREDR_CTL, TWL4030_PREDR_GAIN);
-TWL4030_OUTPUT_PGA(carkitl, TWL4030_REG_PRECKL_CTL, TWL4030_PRECKL_GAIN);
-TWL4030_OUTPUT_PGA(carkitr, TWL4030_REG_PRECKR_CTL, TWL4030_PRECKR_GAIN);
+TWL4030_OUTPUT_PGA(earpiece, TWL4030_REG_EAR_CTL);
+TWL4030_OUTPUT_PGA(predrivel, TWL4030_REG_PREDL_CTL);
+TWL4030_OUTPUT_PGA(predriver, TWL4030_REG_PREDR_CTL);
+TWL4030_OUTPUT_PGA(carkitl, TWL4030_REG_PRECKL_CTL);
+TWL4030_OUTPUT_PGA(carkitr, TWL4030_REG_PRECKR_CTL);
 
 static void handsfree_ramp(struct snd_soc_component *component, int reg, int ramp)
 {
-- 
2.34.1

