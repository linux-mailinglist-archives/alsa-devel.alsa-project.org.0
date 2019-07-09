Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 865D7632D0
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 10:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E621663;
	Tue,  9 Jul 2019 10:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E621663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562660599;
	bh=9Vk6R2m7OC7Jo6PpMMiEeF6KvNbZ8snI1ktiSvJFZKE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LCM810+BqMAkkKldYNZbhLr2tRO9JsXrT9ZBJcpiGRMdhXe0MgVuDaOaCZ2owrMKI
	 3cLnf+Rvfb3UzRr5YIKNTh47q9CAD7ANwNq5jx5pOu1PcUg1jFQtMqfL8CnBFcTshR
	 o0RgmpKcDIe1j0es6LEQ+zf4HXZfhuFhYEThgKp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7311F80273;
	Tue,  9 Jul 2019 10:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD132F80274; Tue,  9 Jul 2019 10:21:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BEA6F801A4
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 10:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BEA6F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="UsCgcoKz"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x698JCcA000684; Tue, 9 Jul 2019 04:21:23 -0400
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2055.outbound.protection.outlook.com [104.47.44.55])
 by mx0b-00128a01.pphosted.com with ESMTP id 2tmkra0e9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2019 04:21:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnQxTfn8WUjt44AhkTzT9QH/XnBEcU93qpeAqKkaYgBsQVpYFVjXmLYLD62SlJJq1urLFvume493L966MIYG5E8t69HQ8wu+qZiTKot3z/oljZtROdqlH8cJEF3lU8CbY71wHNkVRHTJ+mQtOcgWg+0VB1K9ks8qQiRaHVGTcL3zhHc9bPywjp7x6pX/nnUNmwnIoF5qLN+vT14ISzOQ14LDLAAYepa/Oxk0QoCir8qBX6UoJnGuT8WvFfT1ru0rlVgp5XdqBcICONw5WS3b45d8O6GqTQZ77jPfXxUs1+jT3YmkyeYE9f4HMPizA+d6ancRMiRMucM3aSqb/GL1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkbl8teCMQ8vSxltg0l1JMy8QEuHaJb9gCj//VWn0Qk=;
 b=oHmyE0s9rwki+wo9S0HyKrcIew1OSMZUnTS35XGQvk36I3zi6Ingq1jnMsgJTftWo1rqrP21FbPPH2NOdRp1bAsWVLqz4q0ChTBW7aJDwhc7wNBXpjnOzwLM49ar9MaIAAGpvmxzaG3Od37zx2+Rmotc0WICIy2pBiFiWDNMrWLXXx0iVZQnQA6/cMSKRWqnmejcz/GoECs9JavKaW5sfm79U9mrbvcrH7T/RTKQrZsuFKwZXodQUhWoBC8XU4EopN/Ybq36qAjzr9HTMk036jSfdYl6GEV/6mZQxCFR4IP+iyF6TK16PIDDaldU6kAkqEsNb3dXh8Vh9RmjgliPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkbl8teCMQ8vSxltg0l1JMy8QEuHaJb9gCj//VWn0Qk=;
 b=UsCgcoKzhjnGqbQza2SqvIczU3W/ZVGToxlX4NTdeYUBuGrsEPxcFJD7TGCfcPli//srEvVmxM9R5PpRP6N+DH0KX6lVkYP7K4ZyBjjKcFnTeyOyGIo1MscJAluEuJqZW681jS8hD1rZ2jDP5lVu2PvsDkz/Mp3ViU9qZJ/nhMU=
Received: from BN3PR03CA0059.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::19) by BYAPR03MB3830.namprd03.prod.outlook.com
 (2603:10b6:a03:6e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Tue, 9 Jul
 2019 08:21:21 +0000
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::201) by BN3PR03CA0059.outlook.office365.com
 (2a01:111:e400:7a4d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 08:21:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
 via Frontend Transport; Tue, 9 Jul 2019 08:21:20 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x698LJT5007518
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 9 Jul 2019 01:21:19 -0700
Received: from saturn.ad.analog.com (10.48.65.145) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 9 Jul 2019 04:21:19 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <alsa-devel@alsa-project.org>
Date: Tue, 9 Jul 2019 11:21:11 +0300
Message-ID: <20190709082111.27221-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709082111.27221-1-alexandru.ardelean@analog.com>
References: <20190614105513.6894-1-alexandru.ardelean@analog.com>
 <20190709082111.27221-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(199004)(189003)(476003)(486006)(2616005)(446003)(11346002)(2351001)(126002)(14444005)(6916009)(305945005)(4326008)(70206006)(70586007)(44832011)(8676002)(47776003)(54906003)(246002)(36756003)(77096007)(26005)(186003)(356004)(2906002)(316002)(6666004)(426003)(48376002)(50466002)(336012)(107886003)(106002)(5660300002)(478600001)(76176011)(50226002)(8936002)(7636002)(86362001)(1076003)(2870700001)(7696005)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB3830; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1988c110-5ea2-4e68-25eb-08d704466c41
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:BYAPR03MB3830; 
X-MS-TrafficTypeDiagnostic: BYAPR03MB3830:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3830D70790AFC6DFA76827FAF9F10@BYAPR03MB3830.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: N9lRrw5SxiyYTTbf4H4l5HaLSwgHJGeqP4PKOTtBAe76hQIIxljrvZn+An5WwDtOVE1n2gLmMh+Y++wcm2wcNAC33qmqa6RvS0GZTgyJxzyFR3ADacUGsEK8f5H96MQh9KrpgY+fY3FBfZr+3gfgLsk3efiugFphrtO+Q4X1sAzivuccw1VCZeqsVSjq3TvPdL7DMWPyO+kaMUVsy4fuoXWtdfdaD2tq4rep4pSBhokb0lyl3tokn+p3YTyw279XhnbQFBD2O8ODGa0dojvt3j46bpt6ABGjL7EHEcXXIRugLvk3rVOkwM7g/duDpyLlE9uv7YRUHtORWt86J2oU/wZCKfPcm+yuVsyvQhV5O+tfyVMXk5zCnd5D/sof6EOuIASAbd+l4E+KNgXsLdgZ/GA1phWtuLIQvKmiWci76Lc=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 08:21:20.4433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1988c110-5ea2-4e68-25eb-08d704466c41
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3830
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090101
Cc: Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>
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
