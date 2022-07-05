Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 230B6566784
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 12:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F9C16E6;
	Tue,  5 Jul 2022 12:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F9C16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657016014;
	bh=2IpA+mS2hO6QoqYe8JugUQfsqD0rlYH08DgozQ+nm7E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HYXpg+tA/PWKGJSv3GMFsPlUHHRULsT0CBdfxIIS9oYN6LGSqDXe740w5FRgmh8at
	 ylOzImQmhgLon+aupF4Iw7b/XfjUbbw14qGVbTMPgcOVSwadfll5JPN8MHH/ZJNaQ/
	 jhnPfIQXW/DcmA/QM/8usDJq5nIvZpXNM9mN5HQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91161F80104;
	Tue,  5 Jul 2022 12:12:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44DC4F80515; Tue,  5 Jul 2022 12:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 05684F80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 12:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05684F80104
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 265ABfS82024365,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 265ABfS82024365
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Tue, 5 Jul 2022 18:11:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 5 Jul 2022 18:11:41 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 18:11:41 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt5640: Fix the wrong state of JD1 and JD2
Date: Tue, 5 Jul 2022 18:11:33 +0800
Message-ID: <20220705101134.16792-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.37.0
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
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

The patch fixes the wrong state of JD1 and JD2 while the bst1 or bst2 is
power on in the HDA JD using.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Reported-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/rt5640.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 56008e4518f3..19bdb6d0f5a9 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1984,7 +1984,12 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component, RT5640_PWR_DIG2, 0x0000);
 		snd_soc_component_write(component, RT5640_PWR_VOL, 0x0000);
 		snd_soc_component_write(component, RT5640_PWR_MIXER, 0x0000);
-		snd_soc_component_write(component, RT5640_PWR_ANLG1, 0x0000);
+		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
+			snd_soc_component_write(component, RT5640_PWR_ANLG1,
+				0x0018);
+		else
+			snd_soc_component_write(component, RT5640_PWR_ANLG1,
+				0x0000);
 		snd_soc_component_write(component, RT5640_PWR_ANLG2, 0x0000);
 		break;
 
@@ -2393,9 +2398,15 @@ static void rt5640_jack_work(struct work_struct *work)
 static irqreturn_t rt5640_irq(int irq, void *data)
 {
 	struct rt5640_priv *rt5640 = data;
+	int delay = 0;
+
+	if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
+		cancel_delayed_work_sync(&rt5640->jack_work);
+		delay = 100;
+	}
 
 	if (rt5640->jack)
-		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
+		queue_delayed_work(system_long_wq, &rt5640->jack_work, delay);
 
 	return IRQ_HANDLED;
 }
@@ -2580,6 +2591,12 @@ static void rt5640_enable_hda_jack_detect(
 
 	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x400, 0x0);
 
+	snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
+		RT5640_PWR_VREF2, RT5640_PWR_VREF2);
+	usleep_range(10000, 15000);
+	snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
+		RT5640_PWR_FV2, RT5640_PWR_FV2);
+
 	rt5640->jack = jack;
 
 	ret = request_irq(rt5640->irq, rt5640_irq,
@@ -2696,16 +2713,13 @@ static int rt5640_probe(struct snd_soc_component *component)
 
 	if (device_property_read_u32(component->dev,
 				     "realtek,jack-detect-source", &val) == 0) {
-		if (val <= RT5640_JD_SRC_GPIO4) {
+		if (val <= RT5640_JD_SRC_GPIO4)
 			rt5640->jd_src = val << RT5640_JD_SFT;
-		} else if (val == RT5640_JD_SRC_HDA_HEADER) {
+		else if (val == RT5640_JD_SRC_HDA_HEADER)
 			rt5640->jd_src = RT5640_JD_SRC_HDA_HEADER;
-			snd_soc_component_update_bits(component, RT5640_DUMMY1,
-				0x0300, 0x0);
-		} else {
+		else
 			dev_warn(component->dev, "Warning: Invalid jack-detect-source value: %d, leaving jack-detect disabled\n",
 				 val);
-		}
 	}
 
 	if (!device_property_read_bool(component->dev, "realtek,jack-detect-not-inverted"))
-- 
2.37.0

