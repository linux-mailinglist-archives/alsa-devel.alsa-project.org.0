Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A9BF223
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 13:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E41A1746;
	Thu, 26 Sep 2019 13:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E41A1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569498709;
	bh=VbbvOH6c9xshK0tcEOT8gfXLD+6sdgybHE03AwEo2FY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fI1M2vWYEBm5J9CR8FbAmWqz0byTLzTo9A0R7uZr2McG+ZSNiO7lXSOMaTgLki+97
	 pRXZEkxQGq+IeX8GN/GL3BPhUmXKVd5VxmPMoOYdAEFZAWlyJmNuSj8ptio/CqsRMG
	 u0GU1xcnMvqGWlYD6RyQBDJGmL+t2uFTX7c73bLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18279F804FD;
	Thu, 26 Sep 2019 13:50:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EABFF804FD; Thu, 26 Sep 2019 13:50:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7F3CF80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 13:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F3CF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="dUnMZfXP"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8QBgw7H032134; Thu, 26 Sep 2019 07:50:19 -0400
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2058.outbound.protection.outlook.com [104.47.41.58])
 by mx0b-00128a01.pphosted.com with ESMTP id 2v6hku7g5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 07:50:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtHDye95xjt486tdVTkv9U+JQPT05eejWFOTfCWh6I/dYR0CYilfeKIZdekDprSf4ZopdhrkEPf7piDF6RChYUd125SLyV9I2znKHXlusYIjFRokEbcmT0rUvz9rlV33e9UIVa/mVmSpFOTAh3hYRhXTYA6gABuRF/JcbXWaTRJ4moYNBVVFmenoBq4SvWW5hV2tNDBU/MNT+kYHBtWnA8bhXaEF/AqLhNTlWXC1HsfhQ6PZK1+AGMtHfEpdVrbvtT0QCifF5i5I6Xg+x6Vn04QSbOfvD9/avJtEn7USgjZTmI1UZyIPW9OJr4bKONVs+fz6GpcB+mYHr43w5jqILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+XSYvyDW/6LNC684dwO5kP/7Og1UsXSrr6729zlUJk=;
 b=nlaAUWLmtcwkhPflIOA7LhAL6ZHEYInBgutlA7XtReUcYfnGP9xC/k1Mf6KQCZ7ZOumNXGvWc6mXT6eK1VMVSqwv53qmgvAd6kEwYPGg7IExvTQEaM/9QNcu0vqT4Dz/BN3IIYsISAsTMRWSGEpEN+623EP8AB1B3OVYHYi6xouL47SdVlhFjkbhIPRFwLi5E7jGmDFDnOa+Ny6eijMwrHnyQ9O0oqB1L6Rl7opLJF1a08sywNermVS8+j/QUj0Gf1zpVNAIkaVCD9BIWJ5U/d5wChp+ziAT5TBQ6PqeZWliAQpMcYivv9rjFdOgswEyLsncRdIeNzWhoXRkjmBUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=suse.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+XSYvyDW/6LNC684dwO5kP/7Og1UsXSrr6729zlUJk=;
 b=dUnMZfXP2HQ8pbn6G/YoHoQSBH0x87/7mBbbH/NOSni6Bd2Gr7+U/TZvgxiUeSoKI6tCnOM/0cMdr3sBJfKVxADDsHrUYkin0kOhn7VLZMZ4Jjv1HSBpoARIk1iV797QmeNo9TCXpyFon8LWLaemwwz6erhK0gO9MI7W08dOO1g=
Received: from CY1PR03CA0001.namprd03.prod.outlook.com (2603:10b6:600::11) by
 DM5PR03MB3402.namprd03.prod.outlook.com (2603:10b6:4:3d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 26 Sep 2019 11:50:18 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by CY1PR03CA0001.outlook.office365.com
 (2603:10b6:600::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 26 Sep 2019 11:50:17 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2284.25
 via Frontend Transport; Thu, 26 Sep 2019 11:50:17 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x8QBoAiS010404
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 26 Sep 2019 04:50:10 -0700
Received: from saturn.ad.analog.com (10.48.65.123) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Thu, 26 Sep 2019 07:50:15 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 26 Sep 2019 14:50:11 +0300
Message-ID: <20190926115012.24049-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709082111.27221-1-alexandru.ardelean@analog.com>
References: <20190709082111.27221-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(110136005)(356004)(6666004)(2906002)(486006)(126002)(5660300002)(4326008)(476003)(8676002)(47776003)(70586007)(86362001)(44832011)(1076003)(426003)(50226002)(36756003)(50466002)(186003)(51416003)(76176011)(478600001)(7696005)(107886003)(26005)(2870700001)(2616005)(11346002)(48376002)(106002)(70206006)(246002)(336012)(446003)(14444005)(305945005)(54906003)(7636002)(8936002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR03MB3402; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f333806-c913-424d-8e43-08d74277b395
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR03MB3402; 
X-MS-TrafficTypeDiagnostic: DM5PR03MB3402:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3402AB7DE7742323BBCD0336F9860@DM5PR03MB3402.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YNxv9FN+rB5y41rNoyiTQv0jjWVKaaagjVLvBksqNb6QMiUY99Q1M+j/0d1yM5Q2ZDWPCi3QPGk5uPCcjwM3Q9XXJKxHZLOT6kGe1yf+kqsuKnoopj0qleMIaPsls+zTVvoSt+iQq3mtnR+HEFJ3ajokLnIpSakR4PrPF0PQ3SvsRdQedgEDfFAE/r+wgeuJ4LcT0C6c7Lsnk1kN0/QNdi05kr3R/StC+MtC7YcArwZmC8IgikTVONWT6ZNyzyJf/CeJY3N9UQ+ozTnLRYBq4emRnmgOy2ScoLvrhXgW29sXXk8+Ogn1S8zS67ny5YjLXvLKgnO5jMNZho0jrb2gtq2Bu6O6Ee+j/tjED7IVwgWWwspR2t7GdkTyx7L2Sew2V5jDPzmi7rxxFHRnSdDNEmRmjzdeXnJfFYBnDe/xZl8=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 11:50:17.6397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f333806-c913-424d-8e43-08d74277b395
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3402
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_05:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1011
 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909260113
Cc: lars@metafoo.de, lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>
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
