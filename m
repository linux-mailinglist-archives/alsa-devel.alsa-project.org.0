Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104CC747C0E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 06:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4681E7F1;
	Wed,  5 Jul 2023 06:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4681E7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688531599;
	bh=OPXW71t+UlX9wI3Ra7jN5UtWGMe6GcPocc2XrFHBy5o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L7cb0Wib+cBB7tW5Q6/Gi7E9MbU6JZ7MHCaeZgf9/xpa/ozzeN8G6clMYF1AaTzIa
	 t83PfRBAJqfr/RAqwsXt6lGTkstuvaOw01zjrcRUAwI7FG7w6UcB9tfY62uQFgGyHO
	 9VXeKCmenM/2n8Yig/el7bA4tzLQg8RGtmjoRVe8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B881F80272; Wed,  5 Jul 2023 06:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B15F80124;
	Wed,  5 Jul 2023 06:32:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9331CF80125; Wed,  5 Jul 2023 06:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id C06B5F80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 06:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C06B5F80100
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3654T09y8000721,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3654T09y8000721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 5 Jul 2023 12:29:00 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 5 Jul 2023 12:29:03 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 5 Jul 2023 12:29:03 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <brent.lu@intel.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/3] ASoC: rt5645: implement set_jack callback
Date: Wed, 5 Jul 2023 12:23:48 +0800
Message-ID: <20230705042349.24905-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 2SQ7PSEBEJG5XRSSZW7JOGXAPXJQTTN5
X-Message-ID-Hash: 2SQ7PSEBEJG5XRSSZW7JOGXAPXJQTTN5
X-MailFrom: shumingf@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SQ7PSEBEJG5XRSSZW7JOGXAPXJQTTN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

Add a wrapper function to support set_jack component driver callback.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5645.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index acc7fb1581b2..c0d56a8f7f47 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3258,6 +3258,22 @@ int rt5645_set_jack_detect(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(rt5645_set_jack_detect);
 
+static int rt5645_component_set_jack(struct snd_soc_component *component,
+	struct snd_soc_jack *hs_jack, void *data)
+{
+	struct snd_soc_jack *mic_jack = NULL;
+	struct snd_soc_jack *btn_jack = NULL;
+	int *type = (int *)data;
+
+	if (*type & SND_JACK_MICROPHONE)
+		mic_jack = hs_jack;
+	if (*type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+		SND_JACK_BTN_2 | SND_JACK_BTN_3))
+		btn_jack = hs_jack;
+
+	return rt5645_set_jack_detect(component, hs_jack, mic_jack, btn_jack);
+}
+
 static void rt5645_jack_detect_work(struct work_struct *work)
 {
 	struct rt5645_priv *rt5645 =
@@ -3532,6 +3548,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt5645 = {
 	.num_dapm_widgets	= ARRAY_SIZE(rt5645_dapm_widgets),
 	.dapm_routes		= rt5645_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(rt5645_dapm_routes),
+	.set_jack		= rt5645_component_set_jack,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
 };
-- 
2.41.0

