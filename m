Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205F747C0F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 06:34:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFC4783E;
	Wed,  5 Jul 2023 06:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFC4783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688531649;
	bh=iTYqiQuzL03Hm58isodC5yUyIxVw9EmnyEO0dgLpmRQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XL2FeMNLq0UszuU0GgNx5SKxvkFiLfDMl75d4AgvM9aD8vts5mGH0KzgFTVD9KaRr
	 lVZXcHRT87Eif/H9HDndt5shGzP8WszCqfKF5KNyhS1Hnh3eWhr2ncebzv3x+9fjXb
	 oXL9Nkc1sYU7ftFj2zGDmV8auYM/7Hy/WoztPUHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C63FF80535; Wed,  5 Jul 2023 06:32:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F0A4F80548;
	Wed,  5 Jul 2023 06:32:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89275F80125; Wed,  5 Jul 2023 06:29:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id A3C75F80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 06:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C75F80100
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3654TGAU0001907,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3654TGAU0001907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 5 Jul 2023 12:29:16 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 5 Jul 2023 12:29:19 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 5 Jul 2023 12:29:19 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <cychiang@google.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/3] ASoC: rt5645: check return value after reading device id
Date: Wed, 5 Jul 2023 12:29:14 +0800
Message-ID: <20230705042915.24932-1-shumingf@realtek.com>
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: H35LRFQH3ZWVUV35SZZPDUI445BISU3L
X-Message-ID-Hash: H35LRFQH3ZWVUV35SZZPDUI445BISU3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H35LRFQH3ZWVUV35SZZPDUI445BISU3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

If the I2C controller encounters some problems like timed-out, the codec
driver will report the error code for the first read.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5645.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index c0d56a8f7f47..b0953e9bcaf9 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3967,7 +3967,11 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 	 * read and power On.
 	 */
 	msleep(TIME_TO_POWER_MS);
-	regmap_read(regmap, RT5645_VENDOR_ID2, &val);
+	ret = regmap_read(regmap, RT5645_VENDOR_ID2, &val);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "Failed to read: 0x%02X\n, ret = %d", RT5645_VENDOR_ID2, ret);
+		goto err_enable;
+	}
 
 	switch (val) {
 	case RT5645_DEVICE_ID:
-- 
2.41.0

