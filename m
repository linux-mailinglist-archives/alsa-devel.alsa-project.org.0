Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 365846E2124
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 12:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE32E75;
	Fri, 14 Apr 2023 12:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE32E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681468937;
	bh=a99wbugV+OPxvG4i0eGVs1720qITlMQKO8W3ZffQvZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/DPn+dR9gExxFHMy7rEzQQwnW9bHLqpNeF5BhvcZqrkqwz0hehKGHhfcy4xqLjMO
	 sMHty15CDfylUbhiqo02hiPI76daaJq6xkY8G0Kjb930S++XyJmTSBmwayO5YYIyCs
	 rRKhf0bz3CH8yetghvEHQc43ZoNk47AxucSLlSWo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D812AF804F2;
	Fri, 14 Apr 2023 12:40:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3F75F8051F; Fri, 14 Apr 2023 12:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 886DCF80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 12:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 886DCF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=DcL6sL+0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogobYW3V/P5YgGfTpdwlkP371ahI/V5iarMmiGiZY1Ye6XQyWAX4Zu/oai7/ZD2y9kyNwwgpffqxe8Wyni4QThUhsVrxyT9NIyx7zJHfAqomM4exJ7N8SqdTYjHJPa0Nu6vEB+x/lFoxvfFNtaVVc1m6YTVrPOhV0U3B8Ve0L2prpXojTz+NUjxFMeM3axgxkKS7q7+lwMq4XMVp5NehEFiNPTqy0pEjIsDN5+5ES7wcxPyi6vOs1tvtzAWphAcCFYDax3yr8B0qrHotG3zb0hVSQKqO+C/nrru7ce1Kr0KXhKW3Ie7B1h2t9NUbytVuO7HBOHU454F7QbDSCA2b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBFMSTu0cyWX6TC2m482mptqNTRm5pErZHbsoqX6u80=;
 b=YN7iDUrkjMTpWG/3YEKkMewucufLr2A/Ry2gHOi6SzV2k+ViuucDSsJsGwxbyRmypvGA9FXjLVbxAwqiy+hiwBrqZhsEeaHZN3gptLCBXSqwkaBEwG5WhIAbx6D1so3yOCq9P8bOc8v7OHdp4PnFZoHSvmXYnj+bHzntFuQT1zmtCCuqB7HurOOjtmteqcPDcZo/ShFrDKB9//z2anxYLeOHqp4bVrEqq4iP51BvG3DhoDaDoEkBjfSV3Vqf4PCVd3riqNaRLu5ajkqYbFIiftVF1LVIGPmhTYsIZU4mc5ZkyxGexYO38xQtIEcdCkxHDROQVrIFwIkSIaRsUWV8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBFMSTu0cyWX6TC2m482mptqNTRm5pErZHbsoqX6u80=;
 b=DcL6sL+0g2DhoXI1idyls1K9346m0pxKVJC0HuzQmCqgYdYOJMk9eQp3vfPMibTvOISVUh80MJOgjfkEdxqRjuJHwcm2qRjSlAY0nUIDpkwFX2Vwjyalv/BA4oREkWlDOvUxSabApo8wyVlbbfDbak86pCHwL+KLeNezpKHBI5A=
Received: from PS2PR03CA0016.apcprd03.prod.outlook.com (2603:1096:300:5b::28)
 by PUZPR03MB5850.apcprd03.prod.outlook.com (2603:1096:301:a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:40:23 +0000
Received: from PSAAPC01FT064.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:5b:cafe::b1) by PS2PR03CA0016.outlook.office365.com
 (2603:1096:300:5b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.7 via Frontend
 Transport; Fri, 14 Apr 2023 10:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 PSAAPC01FT064.mail.protection.outlook.com (10.13.38.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Fri, 14 Apr 2023 10:40:23 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 14 Apr
 2023 18:40:21 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 14 Apr
 2023 18:40:20 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.7 via Frontend Transport;
 Fri, 14 Apr 2023 18:40:20 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: nau8825: Add delay control for input path
Date: Fri, 14 Apr 2023 18:39:44 +0800
Message-ID: <20230414103941.39566-2-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414103941.39566-1-CTLIN0@nuvoton.com>
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT064:EE_|PUZPR03MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a19c0d-24b4-4b61-1d63-08db3cd4a6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DgyZllzqf818t/Fog2r84i4ViicHi7X066nCN8UeLykR5fqDXf/wSVAKwA9jEmg5ffyCIyY16Yfvrwjo0sOwpygBQEJOBhh/zJTskyGlzZYl5NmrddsiefUS02o8/3OKdBPgSpUggKwL7UnXhnBeNO94Pp0KBg8T/DdPM0Ah0aC3tf0DYhmY2e8m3iLrXY/h/8p84b8HjKK1gANuQiNdwx6Z4m7KHNRqrAEPG6N7ViaDH8NDfuRYV0/MC/jL4S7Fu2CEHDU1+LTXijNqBWt2paHass3bfFNmcjbaugc/pa7vtWX0sZeN9fSaLn5uWtbna58JMLuyFSRPLurXeKlHwfP5h3cLjbjcbG80WS3yPOGIcWHYsoAsbQDQOOGgEv7lbzz645UgRI2Dv8ssRBzOXcBkeZWCJcPoshtWUgzpWXIwcSEzpkaTtPcy1IisTDH9Oacm4SALnyltqV/Ogc+plnYsTSaI2LPbpxhMoRoX6Z5Ht6j5x9X4ew+OFB9A55dHouH82Kx9SOjkAimZPAPDAg1yY22xYOvJbMOlza/Eidr0UHkhDsvZeNMm0ckwWYQ0zprSxI4b74D7Pzb7qydqnaYi3VZClLP4Yg1TxevmWrFaSBCC72fqA6LVw04OkczPTdAXbfizZ8mpGg0H/gxfPrC+oDts0xfbSUhRjP8Aioc3tFs5y28gnYNlom0fpI8FB/okPgonDgPHGnzIC0GpRQ==
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(8676002)(8936002)(186003)(26005)(1076003)(40460700003)(82310400005)(316002)(478600001)(33656002)(70586007)(86362001)(54906003)(70206006)(6666004)(4326008)(6916009)(36756003)(40480700001)(356005)(81166007)(41300700001)(82740400003)(2616005)(83380400001)(36860700001)(426003)(336012)(47076005)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:40:23.1681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78a19c0d-24b4-4b61-1d63-08db3cd4a6d5
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	PSAAPC01FT064.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB5850
Message-ID-Hash: KXYGO64UK34UQH6JGAQFKWJZFSYDS2SJ
X-Message-ID-Hash: KXYGO64UK34UQH6JGAQFKWJZFSYDS2SJ
X-MailFrom: CTLIN0@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, SJLIN0@nuvoton.com, WTLI@nuvoton.com, CTLIN0@nuvoton.com,
 ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXYGO64UK34UQH6JGAQFKWJZFSYDS2SJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the original fixed delay to the assignment from property. It will make
more flexible to different platforms for avoiding pop noise at the beginning
of recording.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 8 +++++++-
 sound/soc/codecs/nau8825.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 4bffa9c20f2b..c4389f5fe603 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -919,7 +919,7 @@ static int nau8825_adc_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		msleep(125);
+		msleep(nau8825->adc_delay);
 		regmap_update_bits(nau8825->regmap, NAU8825_REG_ENA_CTRL,
 			NAU8825_ENABLE_ADC, NAU8825_ENABLE_ADC);
 		break;
@@ -2752,6 +2752,7 @@ static void nau8825_print_device_properties(struct nau8825 *nau8825)
 	dev_dbg(dev, "crosstalk-enable:     %d\n",
 			nau8825->xtalk_enable);
 	dev_dbg(dev, "adcout-drive-strong:  %d\n", nau8825->adcout_ds);
+	dev_dbg(dev, "adc-delay-ms:         %d\n", nau8825->adc_delay);
 }
 
 static int nau8825_read_device_properties(struct device *dev,
@@ -2819,6 +2820,11 @@ static int nau8825_read_device_properties(struct device *dev,
 	nau8825->xtalk_enable = device_property_read_bool(dev,
 		"nuvoton,crosstalk-enable");
 	nau8825->adcout_ds = device_property_read_bool(dev, "nuvoton,adcout-drive-strong");
+	ret = device_property_read_u32(dev, "nuvoton,adc-delay-ms", &nau8825->adc_delay);
+	if (ret)
+		nau8825->adc_delay = 125;
+	if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
+		dev_warn(dev, "Please set the suitable delay time!\n");
 
 	nau8825->mclk = devm_clk_get(dev, "mclk");
 	if (PTR_ERR(nau8825->mclk) == -EPROBE_DEFER) {
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index 0c3a446e0e1a..44b62bc3880f 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -517,6 +517,7 @@ struct nau8825 {
 	int xtalk_enable;
 	bool xtalk_baktab_initialized; /* True if initialized. */
 	bool adcout_ds;
+	int adc_delay;
 };
 
 int nau8825_enable_jack_detect(struct snd_soc_component *component,
-- 
2.25.1

