Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38D1755FA
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 09:26:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1C416B2;
	Mon,  2 Mar 2020 09:26:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1C416B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583137619;
	bh=IBKE56JEm78rqWUG2gel4QkeunHL4Qg1G5yynLNN73k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tPocvx54ofcXoU9L/ZBRWB7hdWx++5NbdiPjFjL/ma26wW4v/z8qBOHp+GTNUDf2l
	 qnnMm8kKdkcAEQFaYEuv7/REeMcKhYv6YFsxvwF8VthY4AWXYMlue9CqA2nFpwy9+M
	 amrHI3KA/vz99gurrdlP+xQ487sP94RgzJFCIEVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D19CF801F5;
	Mon,  2 Mar 2020 09:25:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46FF8F801ED; Mon,  2 Mar 2020 09:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECECFF80131
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 09:25:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECECFF80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="12Iq2DK4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcoDUaAeg9VEBYQTXRIeEGa/cpFdYTtJ0SIKol4tv1PvEnjn48GCMTAydqmtRIQjworWy6g+uaepbdsIXOYGnOg2Vy9p8oWfR9DZWeRbC+5lgUT9LnzzCmVZyBEVxRjQaXrbKf1+tZ3qtTupTzDsRt7AbLh/ma/lDPrLpzzlnMpKf3DJe9R+hT1CJoFzC7GiWE8QM98znowDB8zbVFPdyGecsR/DNeVTvRyAcjR/tIQCBiL0KISrw1WVhnAkUOCOV0Gx+bsyfZtIFipUwUb2D3Vn0ieJLGrKBO+kbpaYkwMoOlW/tDFbo80qtoLVyHuefMqiusAyqwJWctDW+mvDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k4MeTQqSnuAL9OxSvKCcY7NndVY6mhe4iddeTQXzFk=;
 b=D+Z29B5uNvaopOPqOxpIAMnCVxzslVY2ENZp0my0iUToqMoL0MxPg4ORFTEOrwFBuQA5ZRkk6kITmKj3oRPBz0BrE9QfZGqSKxzCR9226eMHjIHUlRS6ZNDxxsZqub6H9wbdj7JwT0qrfH+ydOf0870f0377MdOel45uVghT+TRTiXp5s8tsZ1x9Zfyg/bnwI9OsPrblNBBp1CrDnCxOJn5//3n8fNFr6BnhxCkum4umkhgqeaQXPu2fEBSTiI3qQIse2qYn9Zq+lQKhBHQRjNxHckPQXMicdUvB3FsSLPPjPP+sQCF1HclzBgrH36favPDDZJAbGPuVn2pQJ9bNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k4MeTQqSnuAL9OxSvKCcY7NndVY6mhe4iddeTQXzFk=;
 b=12Iq2DK4p43IwNhwqXAn/fGZ+ipilgVTX/b+cpw/lS8D24kcSSTVH5xWE4itP07TQWEvIywWIJ7BuAxG7kA8BqBvhzFl3tMtJuxUPykVyz6VhKIlkkeV+foBC9InIsS5UIYm1NxeRkVS9U6+YN3aeE5Yt3SmWOY5wDH1hFhaDpo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15)
 by MN2PR12MB4271.namprd12.prod.outlook.com (2603:10b6:208:1d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Mon, 2 Mar
 2020 08:25:09 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c3:c235:f1b0:50cc]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c3:c235:f1b0:50cc%6]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 08:25:09 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoc: amd: Add DMIC switch capability to machine driver
Date: Mon,  2 Mar 2020 13:54:36 +0530
Message-Id: <20200302082443.51587-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::34) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MA1PR0101CA0048.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18 via Frontend
 Transport; Mon, 2 Mar 2020 08:25:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2529c90e-1b8b-461e-8723-08d7be833810
X-MS-TrafficTypeDiagnostic: MN2PR12MB4271:|MN2PR12MB4271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4271DFD9E819E2B7A6FC5AD9F8E70@MN2PR12MB4271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 033054F29A
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(199004)(189003)(44832011)(956004)(186003)(16526019)(26005)(2616005)(5660300002)(66556008)(66476007)(66946007)(6666004)(8936002)(8676002)(81166006)(1076003)(6486002)(36756003)(81156014)(2906002)(109986005)(478600001)(4326008)(316002)(54906003)(7696005)(52116002)(86362001)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4271;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L+E9/1sZ6RvU7N2k5O43twLDcAZmZOQ5MVx/V0CFjuB/7glXjeoNhp143wtZ13dqOO18VRQLE8eLMNKPqiO44HaLMz56CTLIcfJ5flLco1OY1lniyKZIGDHzEvQPj5bF+6DymuguhW7ZlHyLshLGy2E+6H6XaaOcr234Uuo1MiupOpap7w4pAvsg7CYOEgSzTKAeLLBTMg5OkbhDasJRlEQjrplNy6dxKH40vFKf9rimp4VGYN3XPXI7LvMJet2flRQt2EkjgLsP/uvbJ9RW/bWiwmEfW2AzkiAurwzMj+fepnRun3kUskdfb0J+U8dA816m0AVmgGA/QsoYkp+83KOlbS+OnVyeTo7cyj6hiFMU9qmcpSCnZzKZgI1VOBUEMKObNyyNypU9x1YNsix0xyWB/FqBpniWms3xAWuQmR0Gs0EX/jDyld+vd3rl0B7jSQGFVeakqcVefnOEl3X1dU82TJnv52O65tN6mwW60jg=
X-MS-Exchange-AntiSpam-MessageData: xEyJaOa2tBir4eLwS21vS98uQrRlU1vKTm7flxtDaXI2LYV8UkuI/wKfpG2WN4CcfAJAI0FVZe2bfmFd4fUNAk8zNB9EF1Num0GTHAlVyXZuIJHguYf/PHrOVddghydk7JB3PLDqadTntZ49gnXeBw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2529c90e-1b8b-461e-8723-08d7be833810
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2020 08:25:08.8933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uxt+esqEfanyHHb1ZVTRT/VixV/dLvU66ooDrpyzantqFd9rhFsbngUbMeLanrd3Mb7HR1NPsstI6SbKBQg41Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4271
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, akshu.agrawal@amd.com
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

Switch between DMIC0 and DMIC1 based on recording device selected.
This is done by toggling the dmic select gpio.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 53 ++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 96fbcd29e3ed..511b8b1722aa 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -12,6 +12,7 @@
 #include <sound/jack.h>
 #include <linux/clk.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
@@ -27,6 +28,7 @@
 static struct snd_soc_jack pco_jack;
 static struct clk *rt5682_dai_wclk;
 static struct clk *rt5682_dai_bclk;
+static struct gpio_desc *dmic_sel;
 
 static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -176,7 +178,7 @@ static int acp3x_max_startup(struct snd_pcm_substream *substream)
 	return rt5682_clk_enable(substream);
 }
 
-static int acp3x_ec_startup(struct snd_pcm_substream *substream)
+static int acp3x_ec_dmic0_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
@@ -185,6 +187,23 @@ static int acp3x_ec_startup(struct snd_pcm_substream *substream)
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
 	snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+	if (dmic_sel)
+		gpiod_set_value(dmic_sel, 0);
+
+	return rt5682_clk_enable(substream);
+}
+
+static int acp3x_ec_dmic1_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->cap_i2s_instance = I2S_BT_INSTANCE;
+	snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+	if (dmic_sel)
+		gpiod_set_value(dmic_sel, 1);
 
 	return rt5682_clk_enable(substream);
 }
@@ -204,8 +223,13 @@ static const struct snd_soc_ops acp3x_max_play_ops = {
 	.shutdown = rt5682_shutdown,
 };
 
-static const struct snd_soc_ops acp3x_ec_cap_ops = {
-	.startup = acp3x_ec_startup,
+static const struct snd_soc_ops acp3x_ec_cap0_ops = {
+	.startup = acp3x_ec_dmic0_startup,
+	.shutdown = rt5682_shutdown,
+};
+
+static const struct snd_soc_ops acp3x_ec_cap1_ops = {
+	.startup = acp3x_ec_dmic1_startup,
 	.shutdown = rt5682_shutdown,
 };
 
@@ -246,12 +270,21 @@ static struct snd_soc_dai_link acp3x_dai_5682_98357[] = {
 		SND_SOC_DAILINK_REG(acp3x_bt, max, platform),
 	},
 	{
-		.name = "acp3x-ec-capture",
-		.stream_name = "Capture",
+		.name = "acp3x-ec-dmic0-capture",
+		.stream_name = "Capture DMIC0",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		.ops = &acp3x_ec_cap0_ops,
+		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
+	},
+	{
+		.name = "acp3x-ec-dmic1-capture",
+		.stream_name = "Capture DMIC1",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_capture = 1,
-		.ops = &acp3x_ec_cap_ops,
+		.ops = &acp3x_ec_cap1_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
 };
@@ -302,6 +335,14 @@ static int acp3x_probe(struct platform_device *pdev)
 	acp3x_card.dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
+
+	dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
+	if (IS_ERR(dmic_sel)) {
+		dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
+			PTR_ERR(dmic_sel));
+		return PTR_ERR(dmic_sel);
+	}
+
 	ret = devm_snd_soc_register_card(&pdev->dev, &acp3x_card);
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
2.17.1

