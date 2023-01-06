Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF61E65FD7F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00EB14124;
	Fri,  6 Jan 2023 10:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00EB14124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996813;
	bh=o04pX3TGsVB93aOnSoaf9/zAG+6cQL/MNgVp5I+lUWA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rfdyqznh6mf2EE5uwJAMkoK5nCUfmoB2YhOtDWwbXorre/umBtn4yEpGTU/VDeRGA
	 mse9pptGsQfLBSGSQbQXcgadmgJ3EmaGu4V7pTnSqNnOugN8jvvCEqxtzGey8xXr0y
	 sZlfVgKIJSR/4+r4kwJ0W+B/Z9e4d1rLc923wwHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D81E5F805C3;
	Fri,  6 Jan 2023 10:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51327F805AF; Fri,  6 Jan 2023 10:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2082.outbound.protection.outlook.com [40.107.129.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2041CF805AA
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2041CF805AA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUxbT0CcEs+a5xfloQIbfdOKWcCzXQfmsBIia7LpJ/0qJn6OwE1D1OGVS0zyYud2wgDGZu/QUJDnn7X4maKnknDPEWUfCW35pC2jJw4fZdIEvpiotHesX6uleRlpjtKsi6KhvWlSGrHvKEeu0UEp/tbFLRNGXMVFXkpC7ZoZztdIETWno0awtKIT1Kf8kisuqHuLMiiq2DJ7v67DiarF1CQdr3SiiWr6zzQo0KjItpTbCaFRfQQGQt+bKSufDVoQsaLCUYbq656upeuzcB/mY1PvD/+hUjY9e1cMpZW6P7OYn2g89NyEctqi7nFAYV0xCQOHKKVfrogC1QQ4/3GwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys9mlSw79gkSTaf9AVbduCIMCM8PhB3fTz7OZTMqnb0=;
 b=meAMk7PSIIHCZhcElCC2XUgvrPZLmQ/mkkkW0WHYnZK65pNG93ENEcr7p86gGJ3XkwUUld7fxxrZTYnaIh9Ew070tWHspxrxlOi8OR4M5ZV7c9XBZAz6sXBJct02cW6+v3oxt2TIqqN779oMwxQWKGcnXgTQTPgdRYlNzVD3k2CcoTitN99msnVX8jSVJWRmqn3ApVpMAygjjc9qaS2ZZp+8rjusaUDs773ULzSZ8Bxgw9ZDcJSXTamHCk2RKeDwa66QZ+sZoucUJVWZbFVx/j6ejJAHpBdApQcD6CnyzjE77/sleiyiks1FCrX1uIC+InQH0LzpRGcs8yZAVWSfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:16:01 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:16:01 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 12/14] Add the postscaler's switch in DAPM manage.
Date: Fri,  6 Jan 2023 18:15:41 +0900
Message-Id: <20230106091543.2440-13-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106091543.2440-1-kiseok.jo@irondevice.com>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: 2844ff41-e16e-4904-1924-08daefc6a107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ImrwZXt1D9vG560HerNQLaa8nNAMOprmgkp7ejwyWK5Eax9ecuwQcNlZtK95jpZp+aPTD2fzO+oCHPNnYibfQl8ccGYk7AD1UnaJrCa4TqvZdjk7UgdiK5in8xPnCkTbr56iUQoBUkbF+xhNc4MQKz5AwTxfUJR73V1x4iFywfEHfBj8K6arx+14MMFIZoBC+Z0jFPaPUKxXOTj0JgBk1F0bfIg2po+UDbtoOqqTKcRwlCBIF9p7nqij28rtDyGOR8fWuCIfEpOtf0BeVzCWoGEfjgIoPyy3482ErFMrAWYgWjENNBd5bL6ZtH3wrmxlVHDdF5ajLpe4aNjFNhv4OaHidpR8h+oY8Y7L2tC0IDEIuGsclnfwtg75m5bb2QMjpIx0OgluRQ6AgP1/2s186P51hPMhcFiKbIB+tFrcffJS4l7FJhTW43phCe+MFAoDv0PXoODuyF8CD8YZz9HfE4qBZ49VfFumGj1tCmIqGlx2JGHBxHQ9uCLlWi1f267JVyMkr7ydg0mKpLrSotskXk5fUN5QsQkjH3vcJvwH2r7MS40aD5oZIWfciYiJoADgQhxOURPJFh2jhGM54/vxqpJJ2EkTjzWSQ0hO46Akh58xgc/87Zn2gS4RqQH5QpaFY+e9kD8PU1G8qJT9zNesb36ONAjNxKJprXekK+ebBDnOYN4SNtf6Af/x1ysA3pD9aiASqfAy0XqexgWdHLyN7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xZvH62feDxtUsT+FBQJhihPqA+eE/kUOrDvtUvzPLKxM3a9OQFF9xJNxyVx0?=
 =?us-ascii?Q?xjD+koxuKV8evrK1xi+NiHHlcYFBPJE6uT8teJtmGI1bgSqpeOMoOtijKfJq?=
 =?us-ascii?Q?bZyy7OBzoV9VF9Q2XGJmMyeZcyHRV0EavQnxk0anYqdVZelBABE7TASYIJc2?=
 =?us-ascii?Q?vtFTY+Ucw/Ss9Zfh6+aYWDrobu1lWNl5ji5Zqoj+DPJpG4i8+fmNlhRPYoxm?=
 =?us-ascii?Q?SXTrbel21+KN5AicNDgKTlNKfNJZcDAJ7E6kCq04fedurlOcOK3Ws1OGy1Rz?=
 =?us-ascii?Q?wuAy3tCHQ6VLuxcpWavCOF9OFmuW5SJ1DnXeh6dOJIKU2ACXmnPo9+7rBPUy?=
 =?us-ascii?Q?4gpPDVixxuEt9On1Co5FOZCNd8+d+diVY1Z+mcR0kfHFUbVJGrQGrGlWTY/X?=
 =?us-ascii?Q?tGAHJdVkgWMyHUN7xwN+OX3vDoeVdBFzse+Z1jQn0kHvuKZMRuL9foOMFGbQ?=
 =?us-ascii?Q?UBAufbO7+qaExYIfXlIAN+q6gVnef6fjBEkfCJdb27uEy9kG4bjltq7pCxb1?=
 =?us-ascii?Q?YSXo8I38oIsM9JrlC+O10M6hwZmtzOcsb3FHmhgeD0+U6VAjuExoY0XSIfn4?=
 =?us-ascii?Q?+LC6KnbtMrYN0UXgBOO/tqzUWjLdalTykM6urM1FlH2S9KOO/kUQCFW6EcAL?=
 =?us-ascii?Q?NMrJ/o5w51fwcZLjgqOO3wu5AWoAXbLQoWf41/JJVvF1E36+wfx+ogj4JoVY?=
 =?us-ascii?Q?FGFG9Qmzk9JthMC8wBWpIjuFGKhoImbGnTDXh8YNcvHKT2wwuXTxBbxXfIkX?=
 =?us-ascii?Q?l5w3GX3O8dKTYDDWMMUGlt4OnSEvxcTWI8KRrf10kU6mVPo85iN6M1oQyjzT?=
 =?us-ascii?Q?+5Bb5WsQtBEuaSLb7gBcz3BI8icMQ/RB+JmNWJIVIK/0epZWKVAjXErGbOVf?=
 =?us-ascii?Q?1Wt5D0eA64yBNZF6UdFmxnJ7WNB44mv6e1blqLT102YQbBL6M+7Vl/0L1Ui/?=
 =?us-ascii?Q?+woBvAo/elicOebzBPWz04gs9KtZOmqBVoGjyl/SU/xlmKt/NGG/zwaG3Uur?=
 =?us-ascii?Q?CCQKSMHa337xWhYZx1z2xSEJSmVHszVv/Q18m4sRz8BEoL3KXqzmTpZHAjgZ?=
 =?us-ascii?Q?zIaGLD1JMEGTm7AURwSPx6P/hxiz38dJMoBCtALJDu2A4O22+ycikxHHrJFx?=
 =?us-ascii?Q?x2hGappOvy/eZCx1KC/joi5na149gPAbCBx7Y5Wrkr/I6m44UioTOlls5L1D?=
 =?us-ascii?Q?7L4fK4/zh/qe56WE2SPdgfBrEPsxbpvtNIRorrlnaH0a+YoNdg+JZya1LRE3?=
 =?us-ascii?Q?40gV5gSc+1i999nUEB60WCs8/Daqx7Zb7oYUivOtQMnH9XGhCat2yF03RnaK?=
 =?us-ascii?Q?gPM/q6XZVLtxKmtIZqzWZ7OPtKiVOrT06I3EO5q3zLSjPGW76okQ0CpWYBRV?=
 =?us-ascii?Q?mGGq2ejQd9CjjAQ6AJ26avIlL24SeSq6d3q/vBWaFd9UHEdTOz6jzIoj0nar?=
 =?us-ascii?Q?1RXp2M9pmDAnVjpP5fmUOAo23gOMsKg+Cvtmmqh/XvI4zRb2B4fJSJSkwkOl?=
 =?us-ascii?Q?X4OW55YppRVsXk8C8tR+yqYRoKQfLkni2cvnLyEg+tLgJRxb2aMiJ4MOMa0S?=
 =?us-ascii?Q?DjBnAonR4RktxiEblz13IKcrV52wr+2r0jOPUIiMBz5Pjp+KO0kjlarW32gg?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2844ff41-e16e-4904-1924-08daefc6a107
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:16:01.3318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r528a6N5MHy3fa4tF3Ko7PELmWPDHra4KmkE42FB28Xu9jEj6z4d/iaSRHxCezgYsMtW5EYLRfws4no4jHhMppZZadV6RhQzGyYSukBWvAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 196 +++++++++++++------------------------
 1 file changed, 66 insertions(+), 130 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index ea4356233c2f..08f5054fde1d 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -301,132 +301,6 @@ static int sma1303_regmap_read(struct sma1303_priv *sma1303,
 	return ret;
 }
 
-static int bytes_ext_get(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol, int reg)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
-	unsigned int i, reg_val;
-	u8 *val;
-	int ret;
-
-	val = (u8 *)ucontrol->value.bytes.data;
-	for (i = 0; i < params->max; i++) {
-		ret = sma1303_regmap_read(sma1303, reg + i, &reg_val);
-		if (sizeof(reg_val) > 2)
-			reg_val = cpu_to_le32(reg_val);
-		else
-			reg_val = cpu_to_le16(reg_val);
-		memcpy(val + i, &reg_val, sizeof(u8));
-	}
-
-	return ret;
-}
-
-static int bytes_ext_put(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol, int reg)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
-	void *data;
-	u8 *val;
-	int i, ret;
-
-	data = kmemdup(ucontrol->value.bytes.data,
-			params->max, GFP_KERNEL | GFP_DMA);
-	if (!data)
-		return -ENOMEM;
-
-	val = (u8 *)data;
-	for (i = 0; i < params->max; i++) {
-		ret = sma1303_regmap_write(sma1303, reg + i, *(val + i));
-		if (ret < 0) {
-			kfree(data);
-			return ret;
-		}
-	}
-	kfree(data);
-
-	return 0;
-}
-
-static int postscaler_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
-}
-
-static int postscaler_put(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
-}
-
-static const char * const sma1303_postscaler_config_text[] = {
-	"Enable", "Disable"};
-
-static const struct soc_enum sma1303_postscaler_config_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_postscaler_config_text),
-			sma1303_postscaler_config_text);
-
-static int sma1303_postscaler_config_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret, data, val;
-
-	ret = sma1303_regmap_read(sma1303, SMA1303_90_POSTSCALER, &data);
-	val = data & SMA1303_BYP_POST_MASK;
-	switch (val) {
-	case SMA1303_BYP_POST_SCALER:
-		ucontrol->value.integer.value[0] = 1;
-		break;
-	case SMA1303_EN_POST_SCALER:
-		ucontrol->value.integer.value[0] = 0;
-		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x value: %d\n",
-					SMA1303_90_POSTSCALER, val);
-		return -EINVAL;
-	}
-
-	return ret;
-}
-
-static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int val;
-
-	switch (sel) {
-	case 0:
-		val = SMA1303_EN_POST_SCALER;
-		break;
-	case 1:
-		val = SMA1303_BYP_POST_SCALER;
-		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_90_POSTSCALER);
-		return -EINVAL;
-	}
-
-	return sma1303_regmap_update_bits(sma1303,
-			SMA1303_90_POSTSCALER, SMA1303_BYP_POST_MASK, val);
-}
-
 static const char * const sma1303_aif_in_source_text[] = {
 	"Mono", "Left", "Right"};
 static const char * const sma1303_aif_out_source_text[] = {
@@ -468,6 +342,34 @@ static int sma1303_force_mute_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int sma1303_postscaler_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int val, ret;
+
+	ret = sma1303_regmap_read(sma1303, SMA1303_90_POSTSCALER, &val);
+	ucontrol->value.integer.value[0] = (val & 0x7E) >> 1;
+
+	return ret;
+}
+
+static int sma1303_postscaler_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret, sel = (int)ucontrol->value.integer.value[0];
+
+	ret = sma1303_regmap_update_bits(sma1303,
+			SMA1303_90_POSTSCALER, 0x70, (sel << 1));
+
+	return ret;
+}
+
 static int sma1303_startup(struct snd_soc_component *component)
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
@@ -727,6 +629,34 @@ static int sma1303_sdo_event(struct snd_soc_dapm_widget *w,
 	return ret;
 }
 
+static int sma1303_post_scaler_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_info(sma1303->dev,
+				"%s : SND_SOC_DAPM_PRE_PMU\n", __func__);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_90_POSTSCALER,
+				SMA1303_BYP_POST_MASK,
+				SMA1303_EN_POST_SCALER);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_info(sma1303->dev,
+				"%s : SND_SOC_DAPM_POST_PMD\n", __func__);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_90_POSTSCALER,
+				SMA1303_BYP_POST_MASK,
+				SMA1303_BYP_POST_SCALER);
+		break;
+	}
+	return 0;
+}
+
 static int sma1303_power_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
@@ -756,18 +686,18 @@ static const struct snd_kcontrol_new sma1303_aif_out_source_control =
 	SOC_DAPM_ENUM("AIF OUT Source", sma1303_aif_out_source_enum);
 static const struct snd_kcontrol_new sma1303_sdo_control =
 	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+static const struct snd_kcontrol_new sma1303_post_scaler_control =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
 static const struct snd_kcontrol_new sma1303_enable_control =
 	SOC_DAPM_SINGLE_VIRT("Switch", 1);
 
 static const struct snd_kcontrol_new sma1303_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
 		0, 167, 1, sma1303_spk_tlv),
-	SND_SOC_BYTES_EXT("Postscaler Set", 1,
-		postscaler_get, postscaler_put),
-	SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
-		sma1303_postscaler_config_get, sma1303_postscaler_config_put),
 	SOC_SINGLE_BOOL_EXT("Force Mute", 0,
 		sma1303_force_mute_get, sma1303_force_mute_put),
+	SOC_SINGLE_EXT("Postscaler Gain", SMA1303_90_POSTSCALER, 1, 0x30, 0,
+		sma1303_postscaler_get, sma1303_postscaler_put),
 };
 
 static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
@@ -789,6 +719,10 @@ static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
 			sma1303_sdo_event,
 			SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MIXER("Entry", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SWITCH_E("Post Scaler", SND_SOC_NOPM, 0, 1,
+			&sma1303_post_scaler_control,
+			sma1303_post_scaler_event,
+			SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_OUT_DRV_E("AMP Power", SND_SOC_NOPM, 0, 0, NULL, 0,
 			sma1303_power_event,
 			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
@@ -818,6 +752,8 @@ static const struct snd_soc_dapm_route sma1303_audio_map[] = {
 	{"Entry", NULL, "AIF OUT Source"},
 	{"Entry", NULL, "AIF IN Source"},
 
+	{"Post Scaler", "Switch", "Entry"},
+	{"AMP Power", NULL, "Entry"},
 	{"AMP Power", NULL, "Entry"},
 
 	{"AMP Enable", "Switch", "AMP Power"},
-- 
2.30.2

