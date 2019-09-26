Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7784EBF225
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 13:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1FB173D;
	Thu, 26 Sep 2019 13:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1FB173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569498736;
	bh=9Vk6R2m7OC7Jo6PpMMiEeF6KvNbZ8snI1ktiSvJFZKE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wa0gjqK6sea6PFToYc4S3d+izNvJYjSvdzNkofQTg5FfX+vJbHM4KoNrJkxZmZd+h
	 +DJJd9jWrbAcg3zcb9v/LbAv8Sh+VJ3oGTxaVdr/tRGwXeziZTzj146n288mMSmKbw
	 EyO/irGVmGtb9JUMkQ/WIoLxjXVL0OuN38JBg5gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6282AF805FA;
	Thu, 26 Sep 2019 13:50:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29036F8048D; Thu, 26 Sep 2019 13:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFA15F80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 13:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA15F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="MCdZ+WpP"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8QBgwt9006665; Thu, 26 Sep 2019 07:50:22 -0400
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2056.outbound.protection.outlook.com [104.47.41.56])
 by mx0b-00128a01.pphosted.com with ESMTP id 2v6hkcq7u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 07:50:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcmcna2FAMU00eayxhhn/5Pmn4Yl/6IqThBXkqJ2biamXXsKnWOVrjRZEsQJaBWHf91294Xq4qRN1z+b6WOvKsTQNdrXE9MurspqlnqPoMaEPpbH91OwdxXFgLn2gltdBSAmtL10YQgSD25RMFXzmtHpLFXF5PYby+IuqOzr8QVd6q7iqJDaUF+btc9uwePWSehvTE4UGoktFg21Pm7Uyn0mBzGWdw/m7tLW/lq2F1vtn55Orej4sK+qcwep03jifAYwrnBOzyLLFRtWzper/u8RlEIC82D8M4uFv/lVS9WShMH3+6ZIiQkxpTOB4SwI/g5glDHaNNlxJseNxVNgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkbl8teCMQ8vSxltg0l1JMy8QEuHaJb9gCj//VWn0Qk=;
 b=QjGJJE0rnp+LS4IqCZcKh8Jguz0Zwkn55QFzk2C42Rt80bm8NmPVp4gBHvc+X2A1+1WKpR56X+EgQyZGLmFr8oGxjnEIUGQS1OHxHtnB5YA11m7+jVMwBh0bKDe7nLaK14yxOQJ8eE7CocFOV9f3lWuidnANIJYIHOIeQeKoLMldIYU68HqheHgUiXIowvCPDGC6of5mucvGlZvL8sAATEAICO1YsCrl54sBKc4i8giD3NhIRB2oXWnrfyw3mqQXsFS+P4dKomdEHAAgd4Ic2fSZ6aKPH/zGJRHoBi/ZwUXggf4LylZyMg5ysLEKlbzkOQmxfV3tNEF6+rGfKjXWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=suse.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkbl8teCMQ8vSxltg0l1JMy8QEuHaJb9gCj//VWn0Qk=;
 b=MCdZ+WpPR0xeYH+s6dml2pvlEi1y4lbeW8R2AkkswheE6v8Nk/I5GHWDknUG9hFQztt5u3kVQZ5Zcgogobuzrxo1Uz3hw6743lihtuQrqciQboqPZzWUxGTAPsr8gWeuEvKFs72NT7lERAwIeT8kIpISptiK5Zwalw1YVMhBukk=
Received: from CY4PR03CA0004.namprd03.prod.outlook.com (2603:10b6:903:33::14)
 by CO2PR03MB2216.namprd03.prod.outlook.com (2603:10b6:102:9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Thu, 26 Sep
 2019 11:50:20 +0000
Received: from CY1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::202) by CY4PR03CA0004.outlook.office365.com
 (2603:10b6:903:33::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.16 via Frontend
 Transport; Thu, 26 Sep 2019 11:50:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT029.mail.protection.outlook.com (10.152.75.143) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2284.20
 via Frontend Transport; Thu, 26 Sep 2019 11:50:19 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x8QBoDLK010413
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 26 Sep 2019 04:50:13 -0700
Received: from saturn.ad.analog.com (10.48.65.123) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Thu, 26 Sep 2019 07:50:18 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 26 Sep 2019 14:50:12 +0300
Message-ID: <20190926115012.24049-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926115012.24049-1-alexandru.ardelean@analog.com>
References: <20190709082111.27221-1-alexandru.ardelean@analog.com>
 <20190926115012.24049-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(48376002)(305945005)(246002)(50226002)(51416003)(2870700001)(2906002)(7696005)(76176011)(186003)(26005)(4326008)(7636002)(107886003)(1076003)(47776003)(14444005)(8676002)(8936002)(356004)(6666004)(446003)(336012)(54906003)(126002)(476003)(2616005)(486006)(11346002)(44832011)(316002)(426003)(106002)(110136005)(70586007)(70206006)(478600001)(50466002)(5660300002)(86362001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR03MB2216; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0631c9d8-cc71-464c-2afa-08d74277b4bb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CO2PR03MB2216; 
X-MS-TrafficTypeDiagnostic: CO2PR03MB2216:
X-Microsoft-Antispam-PRVS: <CO2PR03MB2216FF30C60A4F54C4A3804DF9860@CO2PR03MB2216.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: c7gxQAO8Dc1SHuspJArr/qX0TKpbxWtkUn+T0acHfSN+1I3KLVrA8CVqSYVZR0C2r9GvM8bj85hFcb/5IKEBWNWLyikcPlpsZo9TDj8pf11nQihTptAHYb9+JQgxx2SHzZPEfP/B/Lf5Ozsgft7OYNKSS9xsHQBKMO44T6Y4s+prYFsyeu3y5mpMaJ9Wbz1EBiLAoiyMu0h/ISS4cYOgQ433vCrnL5mpCJT+8JbJmPWyR8sQNp4k/emYKFb3HWo7i0TcOwD1VIStgiOSKGMwO63ZnzdgAoLYLQqPSoL5/GTplSgqifSn168Dempu7VD+DzEVxv6RRauydJSzTMDS5iWgTpTKjigBsOG5ab/3jZhrJ+OZYPXYivdZSHoyYccX43unNKqebWJTxG6pJlYrOeLICUeHBf23X+QEBlDmarI=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 11:50:19.5549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0631c9d8-cc71-464c-2afa-08d74277b4bb
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2216
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_05:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909260113
Cc: lars@metafoo.de, lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [alsa-devel] [PATCH 2/2][RESEND] ASoC: adau1761: Add ALC controls
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
index a9ef735f8b4e..5ca9b744b7d8 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -29,6 +29,9 @@
 #define ADAU1761_LEFT_DIFF_INPUT_VOL	0x400e
 #define ADAU1761_RIGHT_DIFF_INPUT_VOL	0x400f
 #define ADAU1761_ALC_CTRL0		0x4011
+#define ADAU1761_ALC_CTRL1		0x4012
+#define ADAU1761_ALC_CTRL2		0x4013
+#define ADAU1761_ALC_CTRL3		0x4014
 #define ADAU1761_PLAY_LR_MIXER_LEFT	0x4020
 #define ADAU1761_PLAY_MIXER_LEFT0	0x401c
 #define ADAU1761_PLAY_MIXER_LEFT1	0x401d
@@ -73,6 +76,9 @@ static const struct reg_default adau1761_reg_defaults[] = {
 	{ ADAU1761_REC_MIXER_RIGHT1,		0x00 },
 	{ ADAU1761_LEFT_DIFF_INPUT_VOL,		0x00 },
 	{ ADAU1761_ALC_CTRL0,			0x00 },
+	{ ADAU1761_ALC_CTRL1,			0x00 },
+	{ ADAU1761_ALC_CTRL2,			0x00 },
+	{ ADAU1761_ALC_CTRL3,			0x00 },
 	{ ADAU1761_RIGHT_DIFF_INPUT_VOL,	0x00 },
 	{ ADAU1761_PLAY_LR_MIXER_LEFT,		0x00 },
 	{ ADAU1761_PLAY_MIXER_LEFT0,		0x00 },
@@ -123,6 +129,10 @@ static const DECLARE_TLV_DB_SCALE(adau1761_sidetone_tlv, -1800, 300, 1);
 static const DECLARE_TLV_DB_SCALE(adau1761_boost_tlv, -600, 600, 1);
 static const DECLARE_TLV_DB_SCALE(adau1761_pga_boost_tlv, -2000, 2000, 1);
 
+static const DECLARE_TLV_DB_SCALE(adau1761_alc_max_gain_tlv, -1200, 600, 0);
+static const DECLARE_TLV_DB_SCALE(adau1761_alc_target_tlv, -2850, 150, 0);
+static const DECLARE_TLV_DB_SCALE(adau1761_alc_ng_threshold_tlv, -7650, 150, 0);
+
 static const unsigned int adau1761_bias_select_values[] = {
 	0, 2, 3,
 };
@@ -160,9 +170,91 @@ static const char * const adau1761_pga_slew_time_text[] = {
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
@@ -180,6 +272,20 @@ static const struct snd_kcontrol_new adau1761_differential_mode_controls[] = {
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
@@ -652,6 +758,9 @@ static bool adau1761_readable_register(struct device *dev, unsigned int reg)
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
