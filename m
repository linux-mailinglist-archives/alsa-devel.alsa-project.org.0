Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682E33217A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 10:00:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9B7170D;
	Tue,  9 Mar 2021 09:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9B7170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615280423;
	bh=ripNf3au9s3gESAL9eDP/4d9bRiZtw3O86/jTXmt3r8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HHPVh6pv0NsAIkxuPI8JqymXvtg7e44J/TVeMsArHdFwIyvM1b9roU50+EVsVngUE
	 NR1jrEkPERSVIMOG78R9XgEJ6GxVxA1JcaSmVcURkzaUXSEp+eBbHJxDg8g2YU8Br9
	 NKQq4N60/XJfJ7Rrr9fLl+/X9fG4CsPPRDdof4do=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C064F80256;
	Tue,  9 Mar 2021 09:58:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F78F80227; Tue,  9 Mar 2021 09:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC9B2F80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 09:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC9B2F80166
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1298wX6C1008133,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 1298wX6C1008133
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 9 Mar 2021 16:58:33 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 16:58:33 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 16:58:32 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: add delay time of workqueue to control next IRQ
 event
Date: Tue, 9 Mar 2021 16:58:27 +0800
Message-ID: <20210309085827.32032-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXDAG01.realtek.com.tw (172.21.6.100)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cujomalainey@google.com, jairaj.arava@intel.com,
 derek.fang@realtek.com, sathyanarayana.nujella@intel.com,
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

This patch keeps the delay time (50 ms) for jack detection and zero delay time for the button press.
This patch improves the reaction of the button press.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682-i2c.c | 2 +-
 sound/soc/codecs/rt5682-sdw.c | 2 +-
 sound/soc/codecs/rt5682.c     | 2 ++
 sound/soc/codecs/rt5682.h     | 1 +
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 93c1603b42f1..8ea9f1d9fec0 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -78,7 +78,7 @@ static irqreturn_t rt5682_irq(int irq, void *data)
 	struct rt5682_priv *rt5682 = data;
 
 	mod_delayed_work(system_power_efficient_wq,
-		&rt5682->jack_detect_work, msecs_to_jiffies(250));
+		&rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
 
 	return IRQ_HANDLED;
 }
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 5e097f776561..fed80c8f994f 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -677,7 +677,7 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
 
 	if (status->control_port & 0x4) {
 		mod_delayed_work(system_power_efficient_wq,
-			&rt5682->jack_detect_work, msecs_to_jiffies(250));
+			&rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
 	}
 
 	return 0;
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 559dc6db1f7c..0e2a10ed11da 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1094,6 +1094,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 			/* jack was out, report jack type */
 			rt5682->jack_type =
 				rt5682_headset_detect(rt5682->component, 1);
+			rt5682->irq_work_delay_time = 0;
 		} else if ((rt5682->jack_type & SND_JACK_HEADSET) ==
 			SND_JACK_HEADSET) {
 			/* jack is already in, report button event */
@@ -1139,6 +1140,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 	} else {
 		/* jack out */
 		rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
+		rt5682->irq_work_delay_time = 50;
 	}
 
 	snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 1f9c51a5b9bf..74ff66767016 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1439,6 +1439,7 @@ struct rt5682_priv {
 	int pll_out[RT5682_PLLS];
 
 	int jack_type;
+	int irq_work_delay_time;
 };
 
 extern const char *rt5682_supply_names[RT5682_NUM_SUPPLIES];
-- 
2.29.0

