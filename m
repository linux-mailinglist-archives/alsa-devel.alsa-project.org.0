Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0122F0F12
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 10:27:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3680A16BB;
	Mon, 11 Jan 2021 10:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3680A16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610357274;
	bh=heIGWgd7WdGSAwTGIy58vjzqVvXKYXU7wvAyYOEx7oo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tDfXmP4ciyIJnCyRB8js0ss86NUXFgC5i7ESggGwca13rxhEMqxTtBs20klfwLnKR
	 WRC/rslaas6bJfhIdi1xKCA3y7wZ5WF412QzIo50HFlN03RN4yIfg470R9ikwsELYh
	 2d6uOSUZw8sug3yHj8PacdF+9AtZI9dKZkGldpFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E32BF80254;
	Mon, 11 Jan 2021 10:26:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAA95F8016D; Mon, 11 Jan 2021 10:26:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26C26F80113
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 10:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26C26F80113
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 10B9PpxX6021630,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 10B9PpxX6021630
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 11 Jan 2021 17:25:51 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 11 Jan 2021 17:25:51 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt5682: enable fast discharge for headset unplugging
Date: Mon, 11 Jan 2021 17:25:44 +0800
Message-ID: <20210111092544.9064-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
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

From: Shuming Fan <shumingf@realtek.com>

To avoid the pop noise, this patch enables the feature of fast discharge.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4d865edadd7e..42ad5bea86b5 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -953,6 +953,8 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		case 0x1:
 		case 0x2:
 			rt5682->jack_type = SND_JACK_HEADSET;
+			snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
+				RT5682_FAST_OFF_MASK, RT5682_FAST_OFF_EN);
 			rt5682_enable_push_button_irq(component, true);
 			break;
 		default:
@@ -982,6 +984,8 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		snd_soc_component_update_bits(component, RT5682_MICBIAS_2,
 			RT5682_PWR_CLK25M_MASK | RT5682_PWR_CLK1M_MASK,
 			RT5682_PWR_CLK25M_PD | RT5682_PWR_CLK1M_PD);
+		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
+			RT5682_FAST_OFF_MASK, RT5682_FAST_OFF_DIS);
 
 		rt5682->jack_type = 0;
 	}
@@ -1011,11 +1015,13 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 	if (!rt5682->is_sdw) {
 		switch (rt5682->pdata.jd_src) {
 		case RT5682_JD1:
+			snd_soc_component_update_bits(component,
+				RT5682_CBJ_CTRL_5, 0x0700, 0x0600);
 			snd_soc_component_update_bits(component,
 				RT5682_CBJ_CTRL_2, RT5682_EXT_JD_SRC,
 				RT5682_EXT_JD_SRC_MANUAL);
 			snd_soc_component_write(component, RT5682_CBJ_CTRL_1,
-				0xd042);
+				0xd142);
 			snd_soc_component_update_bits(component,
 				RT5682_CBJ_CTRL_3, RT5682_CBJ_IN_BUF_EN,
 				RT5682_CBJ_IN_BUF_EN);
-- 
2.29.0

