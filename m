Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB30145B01
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4975C1871;
	Fri, 14 Jun 2019 12:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4975C1871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560509837;
	bh=3IWZkBUvswWqWhKpRGRsKAPh5UrlZ/nhdidP6DYKYMk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RrPUHAEztwkQIgS2axz/4oUoAWH6meBgRHC0RFRtn2DhiZB2xtNHQo9sRFC6g8WFe
	 LoGC/EAc140TmLO9lrQ0XtMa9ciNwf3BM+zlccus2YV/qZ9eNBFZr8l1CbwzRIzphu
	 ClUovmdJdoT2J4tKvAL9XbIAhw5h8YcfbxAI2GNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0B3F896E0;
	Fri, 14 Jun 2019 12:55:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35D96F80764; Fri, 14 Jun 2019 12:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740074.outbound.protection.outlook.com [40.107.74.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58BD4F80764
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58BD4F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="lejCkFFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dtJ6Dys5SPaz/9sOvxK9Y7huAdoVL9Yn6N8a+sjAb8=;
 b=lejCkFFqySBLpe4/8z1VHah5teSaGQmyUaWjd9aN6TBcA/8UWKUSptXDAMXc8QK53a0jH++u+0qDBgNcZBC8x6ElTvJKEM5TSjGojJqM05IOJnB6dobkhJb1w2juLrJcJb8vadRF40jZm6TGgzWxfVE8wzibaVZmYTXMJYiNIf0=
Received: from BN6PR03CA0097.namprd03.prod.outlook.com (2603:10b6:404:10::11)
 by DM5PR03MB3130.namprd03.prod.outlook.com (2603:10b6:4:3c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.11; Fri, 14 Jun
 2019 10:55:22 +0000
Received: from CY1NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::207) by BN6PR03CA0097.outlook.office365.com
 (2603:10b6:404:10::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12 via Frontend
 Transport; Fri, 14 Jun 2019 10:55:21 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.57)
 smtp.mailfrom=analog.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT045.mail.protection.outlook.com (10.152.75.111) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
 via Frontend Transport; Fri, 14 Jun 2019 10:55:20 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x5EAtJcq010080
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 14 Jun 2019 03:55:19 -0700
Received: from saturn.ad.analog.com (10.48.65.129) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 14 Jun 2019 06:55:19 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <alsa-devel@alsa-project.org>
Date: Fri, 14 Jun 2019 13:55:13 +0300
Message-ID: <20190614105513.6894-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614105513.6894-1-alexandru.ardelean@analog.com>
References: <20190614105513.6894-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(189003)(199004)(54906003)(47776003)(2870700001)(1076003)(8676002)(8936002)(6666004)(356004)(50226002)(36756003)(246002)(107886003)(14444005)(305945005)(106002)(7636002)(6916009)(70586007)(26005)(11346002)(2351001)(476003)(126002)(77096007)(51416003)(2616005)(5660300002)(336012)(4326008)(7696005)(48376002)(50466002)(186003)(426003)(86362001)(44832011)(486006)(446003)(316002)(2906002)(70206006)(478600001)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR03MB3130; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5dd1cf3-a80c-45dd-7eed-08d6f0b6cb7e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:DM5PR03MB3130; 
X-MS-TrafficTypeDiagnostic: DM5PR03MB3130:
X-Microsoft-Antispam-PRVS: <DM5PR03MB31307A979D052CC9D442276DF9EE0@DM5PR03MB3130.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-Forefront-PRVS: 0068C7E410
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rwwTqQqmj4EGWx4pZv+CYq259i1W2W/vvufwxGZr54/oUMNpfyww/ZUH2+W0+QjrmXKOwRjH2P2wJ0bstg67fNZCiQlzfQ6r0vFl5HMeqI/7fAsqz3+O2ShGfSrOa5QajacJ6HsclPezkhkGgU02sX6bGTHjzIXUtyWIbnfO4XvVevW2BCgTWxq9Io6TZVHyBcBtdb5jMsCIrXke3cWPvISzDsbbpbRceG17ATDpQ9S+RhhTZJMh/w0wJFDxI8FQ33dfSmjf+onm4KAhw6Y8ng9oHZR3veRrRVxWAx7Sbqq5tsVL8feapmN84tQRDcibAxMIGwHaApZlU1G0u7bsDlPBN86D20/C1MIgcMlzODw+2ZmiZErKFClFmilhWqrCYuy8wmG6bCWnXGsmcTQfKCr5XeUu7iScJZHXoDy/USc=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2019 10:55:20.5380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dd1cf3-a80c-45dd-7eed-08d6f0b6cb7e
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3130
Cc: Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: [alsa-devel] [PATCH 2/2] ASoC: adau1761: Add ALC controls
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Lars-Peter Clausen <lars@metafoo.de>

The adau1761 has a automatic level control block that can adjust the gain
for the differential input PGA. This patch adds ALSA controls for enabling
and changing the parameter settings for the ALC.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 sound/soc/codecs/adau1761.c | 109 ++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index 428bf95ea648..133d32dd913a 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -30,6 +30,9 @@
 #define ADAU1761_LEFT_DIFF_INPUT_VOL	0x400e
 #define ADAU1761_RIGHT_DIFF_INPUT_VOL	0x400f
 #define ADAU1761_ALC_CTRL0		0x4011
+#define ADAU1761_ALC_CTRL1		0x4012
+#define ADAU1761_ALC_CTRL2		0x4013
+#define ADAU1761_ALC_CTRL3		0x4014
 #define ADAU1761_PLAY_LR_MIXER_LEFT	0x4020
 #define ADAU1761_PLAY_MIXER_LEFT0	0x401c
 #define ADAU1761_PLAY_MIXER_LEFT1	0x401d
@@ -74,6 +77,9 @@ static const struct reg_default adau1761_reg_defaults[] = {
 	{ ADAU1761_REC_MIXER_RIGHT1,		0x00 },
 	{ ADAU1761_LEFT_DIFF_INPUT_VOL,		0x00 },
 	{ ADAU1761_ALC_CTRL0,			0x00 },
+	{ ADAU1761_ALC_CTRL1,			0x00 },
+	{ ADAU1761_ALC_CTRL2,			0x00 },
+	{ ADAU1761_ALC_CTRL3,			0x00 },
 	{ ADAU1761_RIGHT_DIFF_INPUT_VOL,	0x00 },
 	{ ADAU1761_PLAY_LR_MIXER_LEFT,		0x00 },
 	{ ADAU1761_PLAY_MIXER_LEFT0,		0x00 },
@@ -124,6 +130,10 @@ static const DECLARE_TLV_DB_SCALE(adau1761_sidetone_tlv, -1800, 300, 1);
 static const DECLARE_TLV_DB_SCALE(adau1761_boost_tlv, -600, 600, 1);
 static const DECLARE_TLV_DB_SCALE(adau1761_pga_boost_tlv, -2000, 2000, 1);
 
+static const DECLARE_TLV_DB_SCALE(adau1761_alc_max_gain_tlv, -1200, 600, 0);
+static const DECLARE_TLV_DB_SCALE(adau1761_alc_target_tlv, -2850, 150, 0);
+static const DECLARE_TLV_DB_SCALE(adau1761_alc_ng_threshold_tlv, -7650, 150, 0);
+
 static const unsigned int adau1761_bias_select_values[] = {
 	0, 2, 3,
 };
@@ -161,9 +171,91 @@ static const char * const adau1761_pga_slew_time_text[] = {
 	"96 ms",
 };
 
+static const char * const adau1761_alc_function_text[] = {
+	"Off",
+	"Right",
+	"Left",
+	"Stereo",
+	"DSP control",
+};
+
+static const char * const adau1761_alc_hold_time_text[] = {
+	"2.67 ms",
+	"5.34 ms",
+	"10.68 ms",
+	"21.36 ms",
+	"42.72 ms",
+	"85.44 ms",
+	"170.88 ms",
+	"341.76 ms",
+	"683.52 ms",
+	"1367 ms",
+	"2734.1 ms",
+	"5468.2 ms",
+	"10936 ms",
+	"21873 ms",
+	"43745 ms",
+	"87491 ms",
+};
+
+static const char * const adau1761_alc_attack_time_text[] = {
+	"6 ms",
+	"12 ms",
+	"24 ms",
+	"48 ms",
+	"96 ms",
+	"192 ms",
+	"384 ms",
+	"768 ms",
+	"1540 ms",
+	"3070 ms",
+	"6140 ms",
+	"12290 ms",
+	"24580 ms",
+	"49150 ms",
+	"98300 ms",
+	"196610 ms",
+};
+
+static const char * const adau1761_alc_decay_time_text[] = {
+	"24 ms",
+	"48 ms",
+	"96 ms",
+	"192 ms",
+	"384 ms",
+	"768 ms",
+	"15400 ms",
+	"30700 ms",
+	"61400 ms",
+	"12290 ms",
+	"24580 ms",
+	"49150 ms",
+	"98300 ms",
+	"196610 ms",
+	"393220 ms",
+	"786430 ms",
+};
+
+static const char * const adau1761_alc_ng_type_text[] = {
+	"Hold",
+	"Mute",
+	"Fade",
+	"Fade + Mute",
+};
+
 static SOC_VALUE_ENUM_SINGLE_DECL(adau1761_pga_slew_time_enum,
 		ADAU1761_ALC_CTRL0, 6, 0x3, adau1761_pga_slew_time_text,
 		adau1761_pga_slew_time_values);
+static SOC_ENUM_SINGLE_DECL(adau1761_alc_function_enum,
+		ADAU1761_ALC_CTRL0, 0, adau1761_alc_function_text);
+static SOC_ENUM_SINGLE_DECL(adau1761_alc_hold_time_enum,
+		ADAU1761_ALC_CTRL1, 4, adau1761_alc_hold_time_text);
+static SOC_ENUM_SINGLE_DECL(adau1761_alc_attack_time_enum,
+		ADAU1761_ALC_CTRL2, 4, adau1761_alc_attack_time_text);
+static SOC_ENUM_SINGLE_DECL(adau1761_alc_decay_time_enum,
+		ADAU1761_ALC_CTRL2, 0, adau1761_alc_decay_time_text);
+static SOC_ENUM_SINGLE_DECL(adau1761_alc_ng_type_enum,
+		ADAU1761_ALC_CTRL3, 6, adau1761_alc_ng_type_text);
 
 static const struct snd_kcontrol_new adau1761_jack_detect_controls[] = {
 	SOC_SINGLE("Speaker Auto-mute Switch", ADAU1761_DIGMIC_JACKDETECT,
@@ -181,6 +273,20 @@ static const struct snd_kcontrol_new adau1761_differential_mode_controls[] = {
 		ADAU1761_REC_MIXER_RIGHT1, 3, 2, 0, adau1761_pga_boost_tlv),
 
 	SOC_ENUM("PGA Capture Slew Time", adau1761_pga_slew_time_enum),
+
+	SOC_SINGLE_TLV("ALC Capture Max Gain Volume", ADAU1761_ALC_CTRL0,
+		3, 7, 0, adau1761_alc_max_gain_tlv),
+	SOC_ENUM("ALC Capture Function", adau1761_alc_function_enum),
+	SOC_ENUM("ALC Capture Hold Time", adau1761_alc_hold_time_enum),
+	SOC_SINGLE_TLV("ALC Capture Target Volume", ADAU1761_ALC_CTRL1,
+		0, 15, 0, adau1761_alc_target_tlv),
+	SOC_ENUM("ALC Capture Attack Time", adau1761_alc_decay_time_enum),
+	SOC_ENUM("ALC Capture Decay Time", adau1761_alc_attack_time_enum),
+	SOC_ENUM("ALC Capture Noise Gate Type", adau1761_alc_ng_type_enum),
+	SOC_SINGLE("ALC Capture Noise Gate Switch",
+		ADAU1761_ALC_CTRL3, 5, 1, 0),
+	SOC_SINGLE_TLV("ALC Capture Noise Gate Threshold Volume",
+		ADAU1761_ALC_CTRL3, 0, 31, 0, adau1761_alc_ng_threshold_tlv),
 };
 
 static const struct snd_kcontrol_new adau1761_single_mode_controls[] = {
@@ -653,6 +759,9 @@ static bool adau1761_readable_register(struct device *dev, unsigned int reg)
 	case ADAU1761_CLK_ENABLE0:
 	case ADAU1761_CLK_ENABLE1:
 	case ADAU1761_ALC_CTRL0:
+	case ADAU1761_ALC_CTRL1:
+	case ADAU1761_ALC_CTRL2:
+	case ADAU1761_ALC_CTRL3:
 		return true;
 	default:
 		break;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
