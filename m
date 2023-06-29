Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5AF7427FD
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 16:11:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745781E0;
	Thu, 29 Jun 2023 16:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745781E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688047917;
	bh=98Ef0iDprs+c+UWxgJj39cnFe3uQAe5+Z70lzUVkUk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HzSS6/5qEkPxbHcOPdn89Io0AArlOLT+7B1RLM3cjfq88mwIeLZF1bFYxmEfIEkYi
	 0YO0/rylr4yoqv39l24gwf5nwtRx89ZQx2iuroyEA+SJZfraOGlPYTARGABPZ3BGeE
	 MLZ3msxOH5YUZsYijOvrKds6t7b7oFqoeNaDoy68=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E786CF8053B; Thu, 29 Jun 2023 16:10:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D084F80212;
	Thu, 29 Jun 2023 16:10:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFFD3F80431; Thu, 29 Jun 2023 16:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DA0EF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 16:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA0EF80169
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsM0-0004bf-I3; Thu, 29 Jun 2023 16:10:36 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsLz-00AvCu-T9; Thu, 29 Jun 2023 16:10:35 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsLy-00BC2i-V2; Thu, 29 Jun 2023 16:10:34 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 1/2] ASoC: fsl_sai: refactor TDM slots calculation into
 helper function
Date: Thu, 29 Jun 2023 16:10:33 +0200
Message-Id: <20230629141034.2659669-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629141034.2659669-1-s.hauer@pengutronix.de>
References: <20230629141034.2659669-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: CNGETTPTHEQQODWUNHZC4B4HA45MXH7W
X-Message-ID-Hash: CNGETTPTHEQQODWUNHZC4B4HA45MXH7W
X-MailFrom: sha@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNGETTPTHEQQODWUNHZC4B4HA45MXH7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

Splitting the calculation between the initializer and later on makes it
harder to follow. A follow-up commit will also need to do this calculation,
so move it into a helper function. No functional change.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v1:
    - Add missing Signed-off-by

 sound/soc/fsl/fsl_sai.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index e3105d48fb651..36f6115469843 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -516,6 +516,19 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	return 0;
 }
 
+static unsigned int fsl_sai_get_tdm_slots(struct fsl_sai *sai,
+					  unsigned int channels,
+					  unsigned int slot_width)
+{
+	if (sai->slots)
+		return sai->slots;
+
+	if (sai->bclk_ratio)
+		return sai->bclk_ratio / slot_width;
+
+	return channels == 1 ? 2 : channels;
+}
+
 static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params,
 		struct snd_soc_dai *cpu_dai)
@@ -531,7 +544,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	int dl_cfg_cnt = sai->dl_cfg_cnt;
 	u32 dl_type = FSL_SAI_DL_I2S;
 	u32 val_cr4 = 0, val_cr5 = 0;
-	u32 slots = (channels == 1) ? 2 : channels;
+	u32 slots;
 	u32 slot_width = word_width;
 	int adir = tx ? RX : TX;
 	u32 pins, bclk;
@@ -541,10 +554,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	if (sai->slot_width)
 		slot_width = sai->slot_width;
 
-	if (sai->slots)
-		slots = sai->slots;
-	else if (sai->bclk_ratio)
-		slots = sai->bclk_ratio / slot_width;
+	slots = fsl_sai_get_tdm_slots(sai, channels, slot_width);
 
 	pins = DIV_ROUND_UP(channels, slots);
 
-- 
2.39.2

