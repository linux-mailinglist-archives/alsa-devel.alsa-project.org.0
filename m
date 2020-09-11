Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9221265BBC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 10:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B10167A;
	Fri, 11 Sep 2020 10:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B10167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599813362;
	bh=nZVOiy7Jkpb3YGPsDcJQHyiMzn8pBQySSkhMQUk5lLQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nD5HT5AjJ9dn8jUCBv8mwgxNfMlQLQ0zsU0askIX5Swh6aif3SxhgWPZ4ZlA0CHVG
	 cBGLMcqJvFcz1cN/SoH9sbX72KhKkbflrxL4LObk55mmEHXTQt539WaD4bYH+9zieA
	 o4s+KOUcJmZk8RSBHrkRnlhui6Vy9s3MTcH4KTTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58903F800E9;
	Fri, 11 Sep 2020 10:34:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F7DF80227; Fri, 11 Sep 2020 10:34:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78419F800E9
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 10:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78419F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="maNLhgJf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYnLoqlwx9M8/qOsbz2kdKZcjSEtCcGMvmL4jecqEx5IIC5TEjCXXH7H0FLdbHEtOLmPm7n4KL2RLpoHQ3VtbTucVdCTI1u8EuLdKHeA9rqNv5fcB2hSTtB+uIB6VEprM1nw4hzXXfonpQyOcWjK5tgGkRaL3kVUvn9RTOfMHFj+uA+EI6sddM1LZqpgkuwZIbfM9RcWkJ//df9ewa1Dl0LGafygSK/FmXYyhNg83l/394+DG25PJ2QP8a3504qvAev+vIFMqudSimaTUeupULtW9NznZcM+8kkr2WeRTJvJZWnS6ED371nRz/XAt1flYaQvS7rVkYb5xSoIwfyB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WpMFKzIf8eypW4THpWFWPvSQRwdR37wuN20gmUCai8=;
 b=EVwIN2haUTeWOygiZ8MbrN4qXnP83t7yGbdYkcJeoR4wcsAD+ys4U8AA5UJR40ogoPGlBQVBvJnawXaF/8RJUeV1Q5iUaYT8i6c5IBKooYPwHXi8VM3Fij74GMnm2xI6g4y+8oap1vLO2Z4KYMRGYkdZQ1rF7ouiLaqKtwaZlSZ9vXcFga0hHqic67rIekZ7T/eq/oDmjMatwxD/D+Kux9X22xTdsxcf/ewcn1AG9Z4jUExxcdXtAA0aNzWloefkbFr3Sx68IPJPYCmRo/JmWcDwJZYXYefszFhGIee+fa6J8OIYLnHmE0abPdQ/cTSv90k57XlA25k2jMzmdjgaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WpMFKzIf8eypW4THpWFWPvSQRwdR37wuN20gmUCai8=;
 b=maNLhgJfERYlfsYbcbM/DmPaTb+jdZZagaOMDHkzlzCh7W2Yo0tD9vFECOsPV9/3O79wKUsQWesabwdu448EzSEQUw6EHUnmLl83d8tXuaAV+zbAEAzHZyYWh8k3B2yANr/SyjYaFK9gBK4No/+O0if6l3IiyesyesR985EbCko=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VI1PR04MB5950.eurprd04.prod.outlook.com
 (2603:10a6:803:cd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 08:34:07 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f%7]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 08:34:07 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: ak4458: Add DSD support for ak4458 and ak4497
Date: Fri, 11 Sep 2020 16:30:48 +0800
Message-Id: <20200911083048.29055-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from audiosh1.ap.freescale.net (119.31.174.66) by
 SG2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:3:18::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 08:34:05 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 243da6a2-b96a-4371-1411-08d8562d72ea
X-MS-TrafficTypeDiagnostic: VI1PR04MB5950:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5950A4FAEB4E9423BF9A19FFE3240@VI1PR04MB5950.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jb/4ZXQKzc/r286KQTIVLF0wi5zGtx2C+1PaQjBp5N6qoWgyW4TCgTZs+9ius036ZNE1Cb+GYvr7j25M7Q2qPBv7dnD5qlrOJOc2W90Mz8ATtinw8kbpkOotSOltWuijBRqL9wshR3sQdZK6CaF6y6kQqJwBeGoMp9WGUx6ajzeDoha1UFXo6SH4lHYgjKjBNiIqEIS9JgkSuN3KgrAhWQtehVoNSE3RGlFmg8IxDBvJxTwener1Z3OquCSZngWvuJ5oXkZBeLkmwoT+/6BiWxktQOLLnEgXE3BbGQW19UCp2FdZbHLy3Pe5kNkdg55B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(8936002)(6506007)(6666004)(316002)(1076003)(26005)(478600001)(66946007)(66556008)(66476007)(36756003)(5660300002)(8676002)(52116002)(956004)(6512007)(44832011)(86362001)(2616005)(83380400001)(16526019)(186003)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aAf2Gtb9F51qRDe4iM86L8/B+jya4rS6OynEgVekwHDCHlNnzx6phE1m0r0VWRAsgnJ1r+BlZpuRghJEhOTyrmEYmcqZ1v9uILlx53ArKKBfv+25KCMHLQFwQL0Rw0eZXPC6hgJf+CGDqZaGQAhuuflE/DvsQiyBazVL/o4j+tznHPtXJXmkPt60YD+BhBXfnsyDGcKS1gJ6IzqX7KdSFqaX0aKnI+dkOewoIog6UIjXMyWWTst1VhGfsPcjZtoPRQcKDBqTt64606DQOE/5wHonfi1xAmqXwUkrRqTcfKB/AUN67NYcngXvcmY0LWygkDP7Z5jp5y3M4VCJ+Z/1VgQcJZm5vnpK080Yl0e6FE0lxS/LSqljkwL/LlXgNuRBp9aiskpPz1fpvtQMl/8KxD9tzDZCdWHBkKGCrbUih5iMgTiOGmiL+S9jyKnmrRL3X2FIg35rE5gB9nRd1365FgOP8QLfl8NMIYKyV6ZXggEbW+4G7HSS3A7U80kFQXgtLpEyPWkIPuTE7Eq+GqSw0Xp/I5mzn368FKBOK9noY+IDtoHz2Sbq1+ZO4QEbhY7uLVeet2/9kn8+F/8Ii2U9Vjg1yZ+rVZ3CICVWhe2HZi68HtyArGOFTPpzuDIi7FF2g+z6lF27ka/5T90u/pL/+A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243da6a2-b96a-4371-1411-08d8562d72ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3342.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 08:34:07.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDdBFqjufS5QQi9bxEhFBBUlz9toFhKAQKbsMPYEY2WcistqFaHuMHGXbeV1bBe+1Ewi8KPS9K+kR4atQlFMCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5950
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

ak4458 can't support DSD512 format, but ak4497 can, so add
a new variable (dsd512) in ak4458_drvdata to distinguish these
two platforms.

Add a new kcontrol for ak4497 codec for ak4497 has a specific
pin selection.

In hw_params(), calculate bit clock according to different DSD
format and configure DSD registers.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- add more commit description.

 sound/soc/codecs/ak4458.c | 82 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/ak4458.h |  5 ++-
 2 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 763e6839428f..2ef8b591eb79 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -31,11 +31,13 @@ static const char *ak4458_supply_names[AK4458_NUM_SUPPLIES] = {
 struct ak4458_drvdata {
 	struct snd_soc_dai_driver *dai_drv;
 	const struct snd_soc_component_driver *comp_drv;
+	bool  dsd512;	/* DSD512 is supported or not */
 };
 
 /* AK4458 Codec Private Data */
 struct ak4458_priv {
 	struct regulator_bulk_data supplies[AK4458_NUM_SUPPLIES];
+	const struct ak4458_drvdata *drvdata;
 	struct device *dev;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpiod;
@@ -136,6 +138,10 @@ static const char * const ak4458_ats_select_texts[] = {
 /* DIF2 bit Audio Interface Format Setting(BICK fs) */
 static const char * const ak4458_dif_select_texts[] = {"32fs,48fs", "64fs",};
 
+/* DSD input pin select */
+static const char * const ak4497_dsd_input_pin_select[] = {
+	"16_17_19pin", "3_4_5pin"};
+
 static const struct soc_enum ak4458_dac1_dem_enum =
 	SOC_ENUM_SINGLE(AK4458_01_CONTROL2, 1,
 			ARRAY_SIZE(ak4458_dem_select_texts),
@@ -175,6 +181,10 @@ static const struct soc_enum ak4458_dif_enum =
 	SOC_ENUM_SINGLE(AK4458_00_CONTROL1, 3,
 			ARRAY_SIZE(ak4458_dif_select_texts),
 			ak4458_dif_select_texts);
+static const struct soc_enum ak4497_dsdp_enum =
+	SOC_ENUM_SINGLE(AK4458_09_DSD2, 2,
+			ARRAY_SIZE(ak4497_dsd_input_pin_select),
+			ak4497_dsd_input_pin_select);
 
 static int get_digfil(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
@@ -282,6 +292,7 @@ static const struct snd_kcontrol_new ak4497_snd_controls[] = {
 	SOC_ENUM("AK4497 Sound Mode", ak4458_sm_enum),
 	SOC_ENUM("AK4497 Attenuation transition Time Setting",
 		 ak4458_ats_enum),
+	SOC_ENUM("AK4497 DSD Data Input Pin", ak4497_dsdp_enum),
 };
 
 /* ak4497 dapm widgets */
@@ -325,12 +336,54 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 	int pcm_width = max(params_physical_width(params), ak4458->slot_width);
-	int nfs1;
-	u8 format;
+	u8 format, dsdsel0, dsdsel1;
+	int nfs1, dsd_bclk;
 
 	nfs1 = params_rate(params);
 	ak4458->fs = nfs1;
 
+	/* calculate bit clock */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_DSD_U8:
+	case SNDRV_PCM_FORMAT_DSD_U16_LE:
+	case SNDRV_PCM_FORMAT_DSD_U16_BE:
+	case SNDRV_PCM_FORMAT_DSD_U32_LE:
+	case SNDRV_PCM_FORMAT_DSD_U32_BE:
+		dsd_bclk = nfs1 * params_physical_width(params);
+		switch (dsd_bclk) {
+		case 2822400:
+			dsdsel0 = 0;
+			dsdsel1 = 0;
+			break;
+		case 5644800:
+			dsdsel0 = 1;
+			dsdsel1 = 0;
+			break;
+		case 11289600:
+			dsdsel0 = 0;
+			dsdsel1 = 1;
+			break;
+		case 22579200:
+			if (ak4458->drvdata->dsd512) {
+				dsdsel0 = 1;
+				dsdsel1 = 1;
+			} else {
+				dev_err(dai->dev, "DSD512 not supported.\n");
+				return -EINVAL;
+			}
+			break;
+		default:
+			dev_err(dai->dev, "Unsupported dsd bclk.\n");
+			return -EINVAL;
+		}
+
+		snd_soc_component_update_bits(component, AK4458_06_DSD1,
+					      AK4458_DSDSEL_MASK, dsdsel0);
+		snd_soc_component_update_bits(component, AK4458_09_DSD2,
+					      AK4458_DSDSEL_MASK, dsdsel1);
+		break;
+	}
+
 	/* Master Clock Frequency Auto Setting Mode Enable */
 	snd_soc_component_update_bits(component, AK4458_00_CONTROL1, 0x80, 0x80);
 
@@ -355,6 +408,9 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 		case SND_SOC_DAIFMT_DSP_B:
 			format = AK4458_DIF_32BIT_MSB;
 			break;
+		case SND_SOC_DAIFMT_PDM:
+			format = AK4458_DIF_32BIT_MSB;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -393,6 +449,7 @@ static int ak4458_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
+	case SND_SOC_DAIFMT_PDM:
 		ak4458->fmt = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 		break;
 	default:
@@ -401,6 +458,12 @@ static int ak4458_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
+	/* DSD mode */
+	snd_soc_component_update_bits(component, AK4458_02_CONTROL3,
+				      AK4458_DP_MASK,
+				      ak4458->fmt == SND_SOC_DAIFMT_PDM ?
+				      AK4458_DP_MASK : 0);
+
 	ak4458_rstn_control(component, 0);
 	ak4458_rstn_control(component, 1);
 
@@ -472,7 +535,10 @@ static int ak4458_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 
 #define AK4458_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE |\
-			 SNDRV_PCM_FMTBIT_S32_LE)
+			 SNDRV_PCM_FMTBIT_S32_LE |\
+			 SNDRV_PCM_FMTBIT_DSD_U8 |\
+			 SNDRV_PCM_FMTBIT_DSD_U16_LE |\
+			 SNDRV_PCM_FMTBIT_DSD_U32_LE)
 
 static const unsigned int ak4458_rates[] = {
 	8000, 11025,  16000, 22050,
@@ -668,11 +734,13 @@ static const struct regmap_config ak4458_regmap = {
 static const struct ak4458_drvdata ak4458_drvdata = {
 	.dai_drv = &ak4458_dai,
 	.comp_drv = &soc_codec_dev_ak4458,
+	.dsd512 = false,
 };
 
 static const struct ak4458_drvdata ak4497_drvdata = {
 	.dai_drv = &ak4497_dai,
 	.comp_drv = &soc_codec_dev_ak4497,
+	.dsd512 = true,
 };
 
 static const struct dev_pm_ops ak4458_pm = {
@@ -684,7 +752,6 @@ static const struct dev_pm_ops ak4458_pm = {
 static int ak4458_i2c_probe(struct i2c_client *i2c)
 {
 	struct ak4458_priv *ak4458;
-	const struct ak4458_drvdata *drvdata;
 	int ret, i;
 
 	ak4458 = devm_kzalloc(&i2c->dev, sizeof(*ak4458), GFP_KERNEL);
@@ -698,7 +765,7 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 	i2c_set_clientdata(i2c, ak4458);
 	ak4458->dev = &i2c->dev;
 
-	drvdata = of_device_get_match_data(&i2c->dev);
+	ak4458->drvdata = of_device_get_match_data(&i2c->dev);
 
 	ak4458->reset_gpiod = devm_gpiod_get_optional(ak4458->dev, "reset",
 						      GPIOD_OUT_LOW);
@@ -720,8 +787,9 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	ret = devm_snd_soc_register_component(ak4458->dev, drvdata->comp_drv,
-					      drvdata->dai_drv, 1);
+	ret = devm_snd_soc_register_component(ak4458->dev,
+					      ak4458->drvdata->comp_drv,
+					      ak4458->drvdata->dai_drv, 1);
 	if (ret < 0) {
 		dev_err(ak4458->dev, "Failed to register CODEC: %d\n", ret);
 		return ret;
diff --git a/sound/soc/codecs/ak4458.h b/sound/soc/codecs/ak4458.h
index f906215f7e4e..9548c5d78621 100644
--- a/sound/soc/codecs/ak4458.h
+++ b/sound/soc/codecs/ak4458.h
@@ -83,4 +83,7 @@
 #define AK4458_ATS_SHIFT	6
 #define AK4458_ATS_MASK		GENMASK(7, 6)
 
-#endif /* _AK4458_H */
+#define AK4458_DSDSEL_MASK		(0x1 << 0)
+#define AK4458_DP_MASK			(0x1 << 7)
+
+#endif
-- 
2.27.0

