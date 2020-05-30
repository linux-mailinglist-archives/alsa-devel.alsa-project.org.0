Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159F1E9055
	for <lists+alsa-devel@lfdr.de>; Sat, 30 May 2020 11:58:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD72B16FF;
	Sat, 30 May 2020 11:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD72B16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590832681;
	bh=OaTL199Iq+bUXZdJrH3gJi0biXLxJpkr4G3tsMZ2XMc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HD4I/K29UUPQ+smUQc7o+5p6VkhNlKAC1xB1qoWacb4SZHG6HEDljuZyXFLtLHQG5
	 PTLyZjViypZ7/Y8N18649+swCw8kTv173u0bSGiSHl//hZAI7fpnnCVDZE4wFoWL8b
	 37me7+9UkGPGCx/+R5eha2znKIlH+bmm+pmtTKfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 085E9F80130;
	Sat, 30 May 2020 11:56:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5BADF8014A; Sat, 30 May 2020 11:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750074.outbound.protection.outlook.com [40.107.75.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A843F80130
 for <alsa-devel@alsa-project.org>; Sat, 30 May 2020 11:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A843F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="XHf2SQyy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIJOATr6hLov9lU+qs7xTel/285V5bjsUmypwqS0Q8+JUQcsHRp3csZ2eYEDRt3Es/2CjnCmANnfQYsBn5e7/Dy6T2exAhvSbfIiYSkVG0DQ7yiTFv7aLKWvcUvtc+AixNp6uxcPKkmCdnkLcG8pgRYSBqyRu7CreRvZX5yHykYA9UMLbnmRznbusAm++aNteZ9pfAWq0DTcpM9Ahre1DjSEz0BWoWfc/QPnArk1RSmPMek5TK0E+uYgbJr8qlGqqRtttWNzFT/e1pkhHVqoQfnVZPd0nZ7AIj3G5XQZFo1m/4w55yAz7hYc1PP2BoVG8zW7rVgZd9CwQEX/xkbHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzXGt3Xfl1NAPn54lr88VqscXYwrQKq5RtVaKyYaKcc=;
 b=k5rdJ4quuFhyy5BX0PR19efboTWLx2uFXK7BEbYHOPLz/aHWY7aK0DgrPy6sOvejrX14ZwJKSNUOuDWs5ubM0qtmijjVeXtY65Q3jhEI5RCpS7B4GgFMoBV4LHEzGF5yXufXueZlJGSbKo3lSoY51glv2g+fEPyFPzLtqpV4B3V33KIf0OEnlVnL857tooXNcjaaoYgBP9wjfb605/Uhce92l+dV/g1ube94AV7SZ9j5y8hc2BE8jdlPE7k6BoXy6fcDElGEALpPHar1jxPwhRAAwtUMv0CERS0ThLuI6Uhoz+WIbdW8inL/HaSMybu53AcysE936oreg7RYpp79Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzXGt3Xfl1NAPn54lr88VqscXYwrQKq5RtVaKyYaKcc=;
 b=XHf2SQyySEv+T8bRChrrJcmfVztBIsGt70N4C743Vq7ypXP+r+5oFQ83hVloGm4v/PEZCUrOoJ3o6rHXgDC7aRuCTx/HsIWjC+Q4vJNeQaLh45RVtqeZKIHOzQVqLk5l1jHSp9FQl+svVZEv9W5PnMcqpFqSq2aUmFVfKIcUeIY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1855.namprd12.prod.outlook.com (2603:10b6:300:10e::23)
 by MWHPR12MB1933.namprd12.prod.outlook.com (2603:10b6:300:10b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 09:56:02 +0000
Received: from MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::25ab:aac8:ecf3:59a0]) by MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::25ab:aac8:ecf3:59a0%5]) with mapi id 15.20.3045.018; Sat, 30 May 2020
 09:56:02 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [v3] ASoC: AMD: Use mixer control to switch between DMICs
Date: Sat, 30 May 2020 15:25:06 +0530
Message-Id: <20200530095519.24324-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::18) To MWHPR12MB1855.namprd12.prod.outlook.com
 (2603:10b6:300:10e::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from akshu-HP-EliteBook-745-G4.dlink.router (122.171.58.15) by
 MAXPR0101CA0032.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 09:55:52 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [122.171.58.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 129375e5-3f8b-4388-0fa5-08d8047fa951
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1933D87A48EC071116A93597F88C0@MWHPR12MB1933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 041963B986
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZWU+3yCy77/cYOO7gJ5TAktD1779HslHSpXUVCpSXtg3LaTDbcslfHSK2Ig/Mz9H35sgp2/5OTgSUBK0phTfK8tt6kVsAI0/aU7qMzBfNMSIFwjvOc6W1ZAU2PutglLkz+6ytOnqW7XfJafW4XG+2DGg4SmPVCwRK0HDaXyRtFPpYTQu+Q7MhyC16grDhVezBzFeNhwPXTohHObLqDLcVcKcCdUbqAZVSS6ppfmDecRCrAGi+uXIyf8ov39r0lv6q/rfQqKVaWN47Kdq5I89/AYQ+X5o9vthelMPNc0r+JLUTVGEzouHz+PLTdGg0tuwVxRYH5/1stxr/rAmBuJTVGBQ/m/QsU68otdMYcZDBFHbbesL7Cg9PA66kNKiBsdr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1855.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(36756003)(4326008)(109986005)(44832011)(8936002)(956004)(66476007)(66946007)(66556008)(6486002)(8676002)(2616005)(86362001)(6512007)(6506007)(1076003)(478600001)(316002)(6666004)(54906003)(2906002)(26005)(5660300002)(186003)(83380400001)(16526019)(52116002)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: R2obk1I+Bi6JQzV0nCkf34Beqc57vubg30q0yStSddIUUkCvvdusopYWcRwYxOawnMP7K+MykJ0Wa5THNeHoCl5eLS/ebrd6g62vBcglB0otc2ETJ+tWZwRBs3q6SUCvtkVL2EBqlrmB3dx7Va82OD2fralT6excxlCrF0szTnsyjYIuL7NZXB8NEV8rLsF+6MoLNUhs+g6yKkLmW3hq2/HhKUiWO/+b7lv2aMJTr34+bXiRGk0PZsOnxtFRR8ikXw+NxGf8f+e1PxlIwBHXPi7XYcmcULMN03NJwW18zvqpOlGUI6MIl/aUvAXJwTyUC+v4kEcKmBaeD1PRJ67J+PtWb+25qv/pWtefJQYLs6/2rtFFN7vw8yVvaxCVHrP7NzObPihRo73KPuyFEO1vox+gW5452Pl3buSx8tMdMqBZJvVu5ZMebvPNWqHDf6ZBBrvsz9HwGbgp+jP+CsFgE09fDCic3UZI4Sgj4rifqb8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129375e5-3f8b-4388-0fa5-08d8047fa951
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 09:56:02.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IbRy67xXBvQrKEN+4G4q9/av3YNe2PjBlh69wolqcudNVG/0v62m84/+nODGfRxXN/ku+gEjHz5o0i7IHYuHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, akshu.agrawal@amd.com, yuhsuan@chromium.org
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

Having mixer control to switch between DMICs prevents user to
initiate capture simultaneously on both the DMIcs.
Earlier 2 separate devices, one for each DMIC, gave an option of
using them simultaneously, which is not supported.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
v2: Modified "Front Mic" to "DMIC Switch"
v3: Changed to using of Mux

 sound/soc/amd/acp3x-rt5682-max9836.c | 58 +++++++++++++++-------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index e499c00e0c66..f745b42dfd23 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -188,25 +188,27 @@ static int acp3x_ec_dmic0_startup(struct snd_pcm_substream *substream)
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
 	snd_soc_dai_set_bclk_ratio(codec_dai, 64);
-	if (dmic_sel)
-		gpiod_set_value(dmic_sel, 0);
 
 	return rt5682_clk_enable(substream);
 }
 
-static int acp3x_ec_dmic1_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+static int dmic_switch;
 
-	machine->cap_i2s_instance = I2S_BT_INSTANCE;
-	snd_soc_dai_set_bclk_ratio(codec_dai, 64);
-	if (dmic_sel)
-		gpiod_set_value(dmic_sel, 1);
+static int dmic_get(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] = dmic_switch;
+	return 0;
+}
 
-	return rt5682_clk_enable(substream);
+static int dmic_set(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	if (dmic_sel) {
+		dmic_switch = ucontrol->value.integer.value[0];
+		gpiod_set_value(dmic_sel, dmic_switch);
+	}
+	return 0;
 }
 
 static void rt5682_shutdown(struct snd_pcm_substream *substream)
@@ -229,11 +231,6 @@ static const struct snd_soc_ops acp3x_ec_cap0_ops = {
 	.shutdown = rt5682_shutdown,
 };
 
-static const struct snd_soc_ops acp3x_ec_cap1_ops = {
-	.startup = acp3x_ec_dmic1_startup,
-	.shutdown = rt5682_shutdown,
-};
-
 SND_SOC_DAILINK_DEF(acp3x_i2s,
 	DAILINK_COMP_ARRAY(COMP_CPU("acp3x_i2s_playcap.0")));
 SND_SOC_DAILINK_DEF(acp3x_bt,
@@ -279,21 +276,26 @@ static struct snd_soc_dai_link acp3x_dai_5682_98357[] = {
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
-	{
-		.name = "acp3x-ec-dmic1-capture",
-		.stream_name = "Capture DMIC1",
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_capture = 1,
-		.ops = &acp3x_ec_cap1_ops,
-		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
-	},
 };
 
+static const char * const dmic_mux_text[] = {
+	"Front Mic",
+	"Rear Mic",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+		acp3x_dmic_enum, SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new acp3x_dmic_mux_control =
+	SOC_DAPM_ENUM_EXT("DMIC Select Mux", acp3x_dmic_enum,
+			  dmic_get, dmic_set);
+
 static const struct snd_soc_dapm_widget acp3x_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_SPK("Spk", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0,
+			 &acp3x_dmic_mux_control),
 };
 
 static const struct snd_soc_dapm_route acp3x_audio_route[] = {
@@ -301,6 +303,8 @@ static const struct snd_soc_dapm_route acp3x_audio_route[] = {
 	{"Headphone Jack", NULL, "HPOR"},
 	{"IN1P", NULL, "Headset Mic"},
 	{"Spk", NULL, "Speaker"},
+	{"Dmic Mux", "Front Mic", "DMIC"},
+	{"Dmic Mux", "Rear Mic", "DMIC"},
 };
 
 static const struct snd_kcontrol_new acp3x_mc_controls[] = {
-- 
2.20.1

