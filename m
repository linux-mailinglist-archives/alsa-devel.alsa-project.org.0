Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E856677F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 12:13:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A777616F3;
	Tue,  5 Jul 2022 12:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A777616F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657015980;
	bh=4MQqUXwQ/gPnCm5Qh436mIFFVbaEebP+Nu2/p5LIQhs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PZV7Ux2FFHR3hSrgVk866en5UB6b9nT64YQ/wDvOjpD4ulCoXKuWGUrxayZYI1L2h
	 6uHjAaOmOQMUuNNx7TQF+TtyWQ8RMOjlq6SHecZNpRdbBlUnfu8WKBwT54HuOsJJWF
	 3de1j7o1dZNK4wEGtQlTa7YZEarycggDslmvItCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09E75F804B2;
	Tue,  5 Jul 2022 12:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D66F7F8015B; Tue,  5 Jul 2022 12:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id AB53FF8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 12:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB53FF8012A
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 265ABiET2024370,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 265ABiET2024370
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Tue, 5 Jul 2022 18:11:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 5 Jul 2022 18:11:45 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 18:11:44 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5640: Add the MICBIAS1 to the dapm routing
Date: Tue, 5 Jul 2022 18:11:34 +0800
Message-ID: <20220705101134.16792-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705101134.16792-1-oder_chiou@realtek.com>
References: <20220705101134.16792-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/05/2022 09:56:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzcvNSCkV6TIIDA3OjA5OjAw?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

The patch adds the MICBIAS1 to the dapm routing while the HDA header used.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Reported-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/rt5640.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 19bdb6d0f5a9..38ab8d4291c2 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2567,10 +2567,18 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 }
 
+static const struct snd_soc_dapm_route rt5640_hda_jack_dapm_routes[] = {
+	{"IN1P", NULL, "MICBIAS1"},
+	{"IN2P", NULL, "MICBIAS1"},
+	{"IN3P", NULL, "MICBIAS1"},
+};
+
 static void rt5640_enable_hda_jack_detect(
 	struct snd_soc_component *component, struct snd_soc_jack *jack)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
 	int ret;
 
 	/* Select JD1 for Mic */
@@ -2609,6 +2617,9 @@ static void rt5640_enable_hda_jack_detect(
 
 	/* sync initial jack state */
 	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
+
+	snd_soc_dapm_add_routes(dapm, rt5640_hda_jack_dapm_routes,
+		ARRAY_SIZE(rt5640_hda_jack_dapm_routes));
 }
 
 static int rt5640_set_jack(struct snd_soc_component *component,
-- 
2.37.0

