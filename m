Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE0B011BC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jul 2025 05:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D104601FC;
	Fri, 11 Jul 2025 05:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D104601FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752205765;
	bh=fZn1g+ihhpy2vlHflSPcOL1EA3Kp3JEsRyEMaaqHwxw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m+XFgpJMKeA1B13bcmaOZOLV5akufsvOrCIHCR/A1sWK7vfmfr5ctdHf0ollQEI1M
	 457J+Gym7r41sN7N4QikUCfjemvC+93+AZeWcCj2vYbv4ZF3ygN7R/mMhQLu7F4rwr
	 IBmqxd7SO33hEMDY2O1leyWGD3NY6R3euVq/f9OM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 944F0F805D5; Fri, 11 Jul 2025 05:48:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DA85F805C4;
	Fri, 11 Jul 2025 05:48:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BFC4F8052D; Fri, 11 Jul 2025 05:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56699F8025F
	for <alsa-devel@alsa-project.org>; Fri, 11 Jul 2025 05:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56699F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=FQFqzjdR
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 56B3mMUK1368711,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1752205702; bh=5QrPpkWZN5CcgFGnYsQKqUnVnC1YJGEeq3p/71oyRGM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=FQFqzjdRA07Dv+JfcKdbYrC/fsNNf9IWUQxFT8fjlJms2ZBJARrVgfr9oeOC0u469
	 RmqrwL67/F2XZy9epPIUPW42kXwXttq+g/LGd5B3areF7cjstC8ESSulzTw7jumPEU
	 6m0nQZc+/PYx23p6VoJ0QesnBCh0WYYwqmCpnpY8oC4XTVWLZU9pRT12YdaTtVKAdD
	 EY2diiPUC5OD8KE7p6z+E9fa/YDo5B9qSHTjxKs9vh3zB0AK26wrjPC3LARG0Yq39v
	 DrxlOgEhPm3eZup9ufxz3qRXjMCLy1tfohyBvh/695g4RxTU2K1pKNul/mUl8F7V08
	 PzNZv/3aYKDXg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 56B3mMUK1368711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 11:48:22 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Jul 2025 11:48:23 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 11 Jul 2025 11:48:22 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <flove@realtek.com>,
 <shumingf@realtek.com>,
        <jack.yu@realtek.com>, <derek.fang@realtek.com>,
        Oder
 Chiou <oder_chiou@realtek.com>
Subject: [PATCH] ASoC: rt5660: Fix the dmic data source from GPIO2
Date: Fri, 11 Jul 2025 11:48:13 +0800
Message-ID: <20250711034813.3278989-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.34.1
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
Message-ID-Hash: JUPJCKVC23JDMKJJFUQSOH2QKJXJK2DZ
X-Message-ID-Hash: JUPJCKVC23JDMKJJFUQSOH2QKJXJK2DZ
X-MailFrom: oder_chiou@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUPJCKVC23JDMKJJFUQSOH2QKJXJK2DZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch fixes an issue with the dmic data pin connected to GPIO2.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt5660.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 82b92e83be4c..44c3a3b92f98 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1315,14 +1315,17 @@ static int rt5660_i2c_probe(struct i2c_client *i2c)
 		regmap_update_bits(rt5660->regmap, RT5660_GPIO_CTRL1,
 			RT5660_GP1_PIN_MASK, RT5660_GP1_PIN_DMIC1_SCL);
 
-		if (rt5660->pdata.dmic1_data_pin == RT5660_DMIC1_DATA_GPIO2)
+		if (rt5660->pdata.dmic1_data_pin == RT5660_DMIC1_DATA_GPIO2) {
 			regmap_update_bits(rt5660->regmap, RT5660_DMIC_CTRL1,
 				RT5660_SEL_DMIC_DATA_MASK,
 				RT5660_SEL_DMIC_DATA_GPIO2);
-		else if (rt5660->pdata.dmic1_data_pin == RT5660_DMIC1_DATA_IN1P)
+			regmap_update_bits(rt5660->regmap, RT5660_GPIO_CTRL1,
+				RT5660_GP2_PIN_MASK, RT5660_GP2_PIN_DMIC1_SDA);
+		} else if (rt5660->pdata.dmic1_data_pin == RT5660_DMIC1_DATA_IN1P) {
 			regmap_update_bits(rt5660->regmap, RT5660_DMIC_CTRL1,
 				RT5660_SEL_DMIC_DATA_MASK,
 				RT5660_SEL_DMIC_DATA_IN1P);
+		}
 	}
 
 	return devm_snd_soc_register_component(&i2c->dev,
-- 
2.34.1

