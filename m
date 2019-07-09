Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AA632D1
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 10:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 096CD15E5;
	Tue,  9 Jul 2019 10:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 096CD15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562660645;
	bh=VbbvOH6c9xshK0tcEOT8gfXLD+6sdgybHE03AwEo2FY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ip3Y38g9EKfPb+RZo79BxTHnXifh4MTOCg2FuTsGQ1YYN4/ccupPOuBDk0dUxGtAs
	 /c9deppiwLnSbNBUrNWMZf2jdCvYojDCzmZ+DkCq2AeCrlAwYCSuf1+1jLIHWDX6di
	 8W/mRN4bdxi/BuuCu8OjuyNV9XXIn/MZAji33z7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8574F802BE;
	Tue,  9 Jul 2019 10:21:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564C0F80274; Tue,  9 Jul 2019 10:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F31B3F800E0
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 10:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F31B3F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="9AI4/Iq+"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x698J5tB025568; Tue, 9 Jul 2019 04:21:24 -0400
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2052.outbound.protection.outlook.com [104.47.45.52])
 by mx0b-00128a01.pphosted.com with ESMTP id 2tmkar8eyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2019 04:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+XSYvyDW/6LNC684dwO5kP/7Og1UsXSrr6729zlUJk=;
 b=9AI4/Iq+aFVacJvHwWs09elnU2F+Qwg4+7ZR/Syj6wL5X/IMVaLmSSlZPXrZBAiCOu8D5RDTgmlH57L7KCdk0B2TOZdGmtSJh87g1M24ZmaaFfOr76AMx7F9LuofuzW9ggNeul/9K/h5YX29n+hqZ/R9fla0N8wp6lJ6bdBjbyM=
Received: from BN6PR03CA0065.namprd03.prod.outlook.com (2603:10b6:404:4c::27)
 by DM6PR03MB4715.namprd03.prod.outlook.com (2603:10b6:5:181::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Tue, 9 Jul
 2019 08:21:21 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::204) by BN6PR03CA0065.outlook.office365.com
 (2603:10b6:404:4c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 08:21:20 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
 via Frontend Transport; Tue, 9 Jul 2019 08:21:19 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x698LI9Z007511
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 9 Jul 2019 01:21:18 -0700
Received: from saturn.ad.analog.com (10.48.65.145) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 9 Jul 2019 04:21:17 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <alsa-devel@alsa-project.org>
Date: Tue, 9 Jul 2019 11:21:10 +0300
Message-ID: <20190709082111.27221-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614105513.6894-1-alexandru.ardelean@analog.com>
References: <20190614105513.6894-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(189003)(199004)(478600001)(47776003)(8676002)(6666004)(356004)(14444005)(2351001)(246002)(2906002)(305945005)(70206006)(7636002)(70586007)(336012)(107886003)(4326008)(5660300002)(50466002)(50226002)(426003)(48376002)(36756003)(1076003)(77096007)(6916009)(106002)(54906003)(2616005)(26005)(486006)(51416003)(2870700001)(44832011)(446003)(11346002)(186003)(476003)(86362001)(8936002)(126002)(7696005)(316002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB4715; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68abd5b3-76a1-4882-4351-08d704466b9b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:DM6PR03MB4715; 
X-MS-TrafficTypeDiagnostic: DM6PR03MB4715:
X-Microsoft-Antispam-PRVS: <DM6PR03MB471553BDF239A2A69B476416F9F10@DM6PR03MB4715.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rkVCMuSb6HiBldnyH1Mlx19dbCjvBigXffSg+r2vXH6nnAjq+640T0MHOn5cws9sO8zWaXxmYeVw6GyGzXeIZGJPnK0okFwhLhTKwiUT+IR0V2vgHWdqY2b8QdYkZjZHEpm7oIAay8tK1YFZb3n55dhqRHBmHxiZGYglCu3RkM/UofylfguAxIq6Huf6RGcTtvE+NTO2T9izaVBTeOZ8NXuPQl5TeNVzDsNy1Jof2isOh6aJW+LJM+3Hl3OVPwQ/psmVb5SdhtHPQd3GRFXSiPWGADRNdWndKEC0f8vdmSIbWjCvwKQd+uxHPjzbNM2E0E2kewx4aJX/cj7xCdQar/yUpTgnCkuFklMZeDx44OZHjmW23AS+6xrL474rzZDG2pIpJhvt5+mjK2Sy5TKM/2KSIwPu3vWUTZJ/r8BFf3E=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 08:21:19.3441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68abd5b3-76a1-4882-4351-08d704466b9b
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4715
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090101
Cc: Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: [alsa-devel] [PATCH 1/2][RESEND] ASoC: adau1761: Add PGA Slew time
	control
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

The PGA Slew Time control allows to configure the rate with which the PGA
gain control ramps up/down to the target setting.

The PGA slew control is done via the ALC Control 0 register. There are 2
bits on that reg, that control PGA slew time, while the other bits control
parts of the ALC (automatic level control) block.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 sound/soc/codecs/adau1761.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index 977f5a63be3f..a9ef735f8b4e 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -28,6 +28,7 @@
 #define ADAU1761_REC_MIXER_RIGHT1	0x400d
 #define ADAU1761_LEFT_DIFF_INPUT_VOL	0x400e
 #define ADAU1761_RIGHT_DIFF_INPUT_VOL	0x400f
+#define ADAU1761_ALC_CTRL0		0x4011
 #define ADAU1761_PLAY_LR_MIXER_LEFT	0x4020
 #define ADAU1761_PLAY_MIXER_LEFT0	0x401c
 #define ADAU1761_PLAY_MIXER_LEFT1	0x401d
@@ -71,6 +72,7 @@ static const struct reg_default adau1761_reg_defaults[] = {
 	{ ADAU1761_REC_MIXER_RIGHT0,		0x00 },
 	{ ADAU1761_REC_MIXER_RIGHT1,		0x00 },
 	{ ADAU1761_LEFT_DIFF_INPUT_VOL,		0x00 },
+	{ ADAU1761_ALC_CTRL0,			0x00 },
 	{ ADAU1761_RIGHT_DIFF_INPUT_VOL,	0x00 },
 	{ ADAU1761_PLAY_LR_MIXER_LEFT,		0x00 },
 	{ ADAU1761_PLAY_MIXER_LEFT0,		0x00 },
@@ -147,6 +149,21 @@ static SOC_VALUE_ENUM_SINGLE_DECL(adau1761_capture_bias_enum,
 		ADAU17X1_REC_POWER_MGMT, 1, 0x3, adau1761_bias_select_text,
 		adau1761_bias_select_values);
 
+static const unsigned int adau1761_pga_slew_time_values[] = {
+	3, 0, 1, 2,
+};
+
+static const char * const adau1761_pga_slew_time_text[] = {
+	"Off",
+	"24 ms",
+	"48 ms",
+	"96 ms",
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(adau1761_pga_slew_time_enum,
+		ADAU1761_ALC_CTRL0, 6, 0x3, adau1761_pga_slew_time_text,
+		adau1761_pga_slew_time_values);
+
 static const struct snd_kcontrol_new adau1761_jack_detect_controls[] = {
 	SOC_SINGLE("Speaker Auto-mute Switch", ADAU1761_DIGMIC_JACKDETECT,
 		4, 1, 0),
@@ -161,6 +178,8 @@ static const struct snd_kcontrol_new adau1761_differential_mode_controls[] = {
 
 	SOC_DOUBLE_R_TLV("PGA Boost Capture Volume", ADAU1761_REC_MIXER_LEFT1,
 		ADAU1761_REC_MIXER_RIGHT1, 3, 2, 0, adau1761_pga_boost_tlv),
+
+	SOC_ENUM("PGA Capture Slew Time", adau1761_pga_slew_time_enum),
 };
 
 static const struct snd_kcontrol_new adau1761_single_mode_controls[] = {
@@ -632,6 +651,7 @@ static bool adau1761_readable_register(struct device *dev, unsigned int reg)
 	case ADAU1761_DEJITTER:
 	case ADAU1761_CLK_ENABLE0:
 	case ADAU1761_CLK_ENABLE1:
+	case ADAU1761_ALC_CTRL0:
 		return true;
 	default:
 		break;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
