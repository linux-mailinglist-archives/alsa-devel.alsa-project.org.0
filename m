Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEBD747C10
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 06:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C1183B;
	Wed,  5 Jul 2023 06:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C1183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688531655;
	bh=tXKrNKH8J0qT7zI+Vu7JCr557uiXB2/4eee34Gzku5Y=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VM+JYg9qbcawoE0q2Ps5VxMQA+aNuvriENT+p7uib7GK1wKtU/HYdllWpOFtNPnxj
	 aAnNpsukrwnorIT36l4UiNzP8MSkKC7ncDGIHBbIDJFIDqAffvPHH6PN8YQYYfCi2o
	 DuTjV3TXNb8+IpuMUZWs8syYIDuSE/klKGgRn0qU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A478F80571; Wed,  5 Jul 2023 06:32:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD2BDF8055C;
	Wed,  5 Jul 2023 06:32:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EF46F80125; Wed,  5 Jul 2023 06:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE23F80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 06:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE23F80100
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3654TWf04002990,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3654TWf04002990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 5 Jul 2023 12:29:32 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 5 Jul 2023 12:29:36 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 5 Jul 2023 12:29:35 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <brent.lu@intel.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 3/3] ASoC: rt5645: add the system level suspend-resume
 callback
Date: Wed, 5 Jul 2023 12:29:31 +0800
Message-ID: <20230705042931.24950-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: MP27HR2RWCUAVXJSCOMOJI64D4YTOWXS
X-Message-ID-Hash: MP27HR2RWCUAVXJSCOMOJI64D4YTOWXS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MP27HR2RWCUAVXJSCOMOJI64D4YTOWXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch handles the regmap settings and re-detects the jack when the system level
suspend/resume.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5645.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index b0953e9bcaf9..5be5ec0260e9 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4199,11 +4199,44 @@ static void rt5645_i2c_shutdown(struct i2c_client *i2c)
 	regmap_write(rt5645->regmap, RT5645_RESET, 0);
 }
 
+static int __maybe_unused rt5645_sys_suspend(struct device *dev)
+{
+	struct rt5645_priv *rt5645 = dev_get_drvdata(dev);
+
+	del_timer_sync(&rt5645->btn_check_timer);
+	cancel_delayed_work_sync(&rt5645->jack_detect_work);
+	cancel_delayed_work_sync(&rt5645->rcclock_work);
+
+	regcache_cache_only(rt5645->regmap, true);
+	regcache_mark_dirty(rt5645->regmap);
+	return 0;
+}
+
+static int __maybe_unused rt5645_sys_resume(struct device *dev)
+{
+	struct rt5645_priv *rt5645 = dev_get_drvdata(dev);
+
+	regcache_cache_only(rt5645->regmap, false);
+	regcache_sync(rt5645->regmap);
+
+	if (rt5645->hp_jack) {
+		rt5645->jack_type = 0;
+		queue_delayed_work(system_power_efficient_wq,
+			&rt5645->jack_detect_work, msecs_to_jiffies(0));
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops rt5645_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(rt5645_sys_suspend, rt5645_sys_resume)
+};
+
 static struct i2c_driver rt5645_i2c_driver = {
 	.driver = {
 		.name = "rt5645",
 		.of_match_table = of_match_ptr(rt5645_of_match),
 		.acpi_match_table = ACPI_PTR(rt5645_acpi_match),
+		.pm = &rt5645_pm,
 	},
 	.probe = rt5645_i2c_probe,
 	.remove = rt5645_i2c_remove,
-- 
2.41.0

