Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79567223520
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 225691678;
	Fri, 17 Jul 2020 09:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 225691678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969522;
	bh=tt3hv2dcwY7hgzN9S2UPxDmTmMmUppakdHOlLrEEeVw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V8LBKx/dGBdZTwAa/z4jF7D082TUYabhUK/Y+V6YYWy1CO1MKWpiLzo9Y5XawbHT+
	 /Nn8woRi/gT1myz+HAjJcTLgX6VAA/FjPTQYf+TM6FRvpvKh2x+MvzK6CKAftyb+pV
	 NpN9G0v7Ohk3cDWAWOoduhqsWvBLi3ZGcmoptBkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A178F80217;
	Fri, 17 Jul 2020 09:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72CEDF80217; Fri, 17 Jul 2020 09:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AFF6F80217
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 09:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AFF6F80217
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06H731bM4032045,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06H731bM4032045
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Jul 2020 15:03:01 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 17 Jul 2020 15:03:01 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 17 Jul
 2020 15:03:01 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5682: disable MICBIAS and Vref2 widget in default
Date: Fri, 17 Jul 2020 15:02:56 +0800
Message-ID: <20200717070256.28712-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 sathyanarayana.nujella@intel.com, Shuming Fan <shumingf@realtek.com>,
 flove@realtek.com
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

The pin status of the widget was connected after the sound card registered.
The rt5682_headset_detect function will use the pin status of these two widgets
to decide the certain register setting on/off.
Therefore this patch disables the pin of these two widgets in the codec probe.
This patch could avoid the misjudgment.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index c06f5763573c..a4713bd6508d 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2847,6 +2847,7 @@ static int rt5682_probe(struct snd_soc_component *component)
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct sdw_slave *slave;
 	unsigned long time;
+	struct snd_soc_dapm_context *dapm = &component->dapm;
 
 #ifdef CONFIG_COMMON_CLK
 	int ret;
@@ -2884,6 +2885,9 @@ static int rt5682_probe(struct snd_soc_component *component)
 #endif
 	}
 
+	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+	snd_soc_dapm_disable_pin(dapm, "Vref2");
+	snd_soc_dapm_sync(dapm);
 	return 0;
 }
 
-- 
2.27.0

