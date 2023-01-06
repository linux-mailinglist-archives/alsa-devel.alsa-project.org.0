Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE13565FD72
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:18:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A56214112;
	Fri,  6 Jan 2023 10:17:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A56214112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996715;
	bh=8hSvwR7F10Dti0GCoev+eDLhFjeJbs/HzoOEtb/QgKA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aMH2a5DIuN67Kk1wdY/LpfeMlu3N+L5PdcCiKy4wQgEl6hV7q0jQOWSa38krtE7es
	 lqNDxPzzFGD6vE/UC5DvBnZ2k6IYPefLAYWJC023RFSvrIlv0DqvcF3LJubzsMD2Ct
	 04Jftz7LcO7XRGeqmCzW1rv3oFSsLCQpJneDzZRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C5A0F8057F;
	Fri,  6 Jan 2023 10:16:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4D34F80551; Fri,  6 Jan 2023 10:16:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2040.outbound.protection.outlook.com [40.107.129.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCF79F80551
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF79F80551
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYH9fKbBNEI4WBwKJZRTJGxbNqk1UaELWS33v+/EFhz1tdCL9X847GCGi8OgZlZb7hRFvpy/TGJQDEEtQPBbFzgAI6HGYbDB3VVYWrTRFVAg45X9qZ9jTVl6N6/KTaVA1fPzUNEJQrXzmtPnq+yX7uAVfvrHKG6R+5rYGu5Bfifse8GYCpl7GQtjFx8HpmJyRT3yQ9fbF2/W1ZJuD8QRJCGIDzOVuKW/6d/SE/OK0wuOLmnbikhjtoHY0Nlt0AbwPFx9nd78eCJ0KfBh4myko6/B7rphNjCYBuRRaB/6IUqEcU8kEQsQrZ2fLz/8q2pSC3lSaMp8GHhzi34zqcibLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdjKX6lbmDe4pHB4cptxTdKwkv08k/VoXzofZnpw+aw=;
 b=g13KgTlchW5OS8y+tSxHd18mPQdAasvl0OrX+xHtW622r9lspv0NgpAqtGokNRe9vxU7jRZ/VAU1mg3Y6luZSCqxIgtPXtrpoEo81zyrzon0Wz64shKwV9TPC0foCKrw/W0520KE2ZYo8y0GG1HbFp7pBLDlrJJRuSq3SUpzoqfBnzAfCe5KgLIs62tFSlgnd/zL8844M2OCuyZR27E0rbG2+3VVFm4m+XnAFufp1Y4mioCxx65bbdtlctlsGI806PXM/15wSXnrLQiWX/PxzpZjGXVBM8g3wb7GuywVwtsdlaDiJAzUiBcsyJYR1EcQwDX4v3bEHzd5lae8i5ltlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:58 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:58 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 07/14] Remove the control of output format
Date: Fri,  6 Jan 2023 18:15:36 +0900
Message-Id: <20230106091543.2440-8-kiseok.jo@irondevice.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6b3e4090-9e58-4216-a996-08daefc69f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8MDZv/ZsFWoY8Yq7Qi0jyLjjzF+tgXtvSV0XQ+uXIbBhApbYgJ02oYSi2JHdJdQKr4dNaxabYaXXA5+U3wH2gI+179pAbOwd2xmP3IjpRt3e41HI8kST+aXuzfQEBbMKadraJuqfDVLvZB2PXb0OTCxvdJnrawFp09kJWb92cGeT+0Y7eXZtZJQcU0MRwUtvWlCp66LRxqqGxbPGQZgHZoqOS+Xb4HeVwoFlNOaZliNj+ChsM1f1upkV+KsF3QxxEU2UYkoHBQzl7kvjmkDfd/ZX/HV3fleu5STHM5Y1Aj6aNrYaoDEkTK5RIy2pQikVmQv2Amgh3N5Eno2U/3I+UKpJSIERLYN6HRUcPG9LyYT+UDn5vSpAWMEie/TWX+P2Ald03I4XIs8hK4rRdBJ8PDYdfPsZVg4jBULJlTIlZMucqtskboMZl60sWA7+EDcBjmNl8Cx+wOL/ExjUqbA1lC+vXvqea3uIllFb0EOsRVzjOLxcfKsN2KS6YYdzWarKRgaDHFI/848beBU8KPnD76mXm8XrI1rtPaUmLEaDz27lgsGb8njMjxVpNybNhak4rkMQVkcde8E1htjjUFFH9A76wgB//MOtjuXLom4ZUPUXGvlrYEOvJ1yvrK48OrG5wiiXln+TwskX5rbO6O7I45ig8ZKFXPao8dA7JBpzdq/rebzWuVxMyAGUIbCDunW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xLBQlaIqMi601FRoRUZF72HMUlRU01fRLUQtfi+7KnSjKzC9W0zACmgG7Mqm?=
 =?us-ascii?Q?N48G2a8ejQQSF2GP9WlIplz/X7Bp6oSuLk9Brvbfz4LAbHBj3j7odrsC4ykZ?=
 =?us-ascii?Q?kNFhya/6BE1mUDiWpPK5CmDWhHdYVip285sxH6idRekWmt+xumuVFfNx5oI7?=
 =?us-ascii?Q?TcyaqGwarf1NO4+HTvdrnM9Pl5z7QPtxUrFNfw8VSx4tKCpk2LL0YdJvW/iO?=
 =?us-ascii?Q?MFgudmz15xm/gSTiKWW77jJKK7+1v9CqHYF5iW1gXdjCAEvX+SToF9qX3bZM?=
 =?us-ascii?Q?XHgLZx2oTbJxWJ8Py9i62T02wDWXzQTIo+7N8ptanKnoI/I+bs4IhdlnYtOc?=
 =?us-ascii?Q?zel8latOecm1BwG6N4ul7MM6Zedobvv87j9nDCsP1WdvjiSyeYjvWAowuy+H?=
 =?us-ascii?Q?LM1mfoB/6WZbNUyr4OWTR1LZf4CEwSyTE3hDDJS9OJ+oid03zH25iK/P4E9F?=
 =?us-ascii?Q?WdKoCo1TcQ5FSFPFYAM9RJsVBioynCenMVoA7Pbjt2awQoiOIlnfRP6CKnpM?=
 =?us-ascii?Q?otygGRNyMmG5qC02jydzS5ttn38isB1uYLTa6A+AR7ujJgV5C3//zXFhDPcC?=
 =?us-ascii?Q?+EElI7iu9ZqPWoE9GGClqACvJOu5FhuuGXNMkvtkcnBI6Lia0Ju/Dguxz/sq?=
 =?us-ascii?Q?HwhqPdqP5ixR+dApg4NBvjWwcKdRBV0wYCspN4xuIB+G2Ixqp2ZqBRaZafqm?=
 =?us-ascii?Q?XG/bUT/v4rF1oz/1h4UJ6vjp6q0aBol/ZgrsqrKXELPGvcQSiWGv9LbduBKO?=
 =?us-ascii?Q?Yo9wbMkUS2Ie5x4lETkuiPwxWPmKGQy/MCWVs83cSGCvihkGx6TW3Q9z3S3N?=
 =?us-ascii?Q?sV6Zw1UFy48oRZDmWthrHH8OVaaI6ZH2KyMRivBhYV+/pLoU9AASvdsEBiRN?=
 =?us-ascii?Q?QWJmSpv9mRw9xyhXuoipRudVchqbs4OCFkpMrvlTas52yc/2l2k7r+cpQm0o?=
 =?us-ascii?Q?QudOLiMucLd3T0UJThB45xLMfPCHocESU+IDDaRGaV281212Ha2AKwwqz0Db?=
 =?us-ascii?Q?+MP0ZWMcBar1e6mMrU2efY3h82CCGQ5wJ05U5vsxge6MKOJvzwKcR9Po7Xp/?=
 =?us-ascii?Q?FSjKZXi9CLbB9tRgk/DPpC100DY073frjNR2o93kvJHWdifLL/nJAWyewUQj?=
 =?us-ascii?Q?bITorYhkHe/EqzV4/1VMXzeiyPgYTs+UKWo3omTkhhfoH13SurL+7/u3LM7u?=
 =?us-ascii?Q?Oe0lnH5yebvimc75LtX4aiHUUOLhJwTy2/iN3VSK4Sv7AWbpqencpykSeuTu?=
 =?us-ascii?Q?Uzd1bGFzinS8thyDI2wkyL74MrQ97BQTd9M9s/9PmyGzjUWt1BXwNx7y+YkQ?=
 =?us-ascii?Q?F6htOxOnDDYxiKidcWqRrREKQqzcXEV317R7uwktx8ZMmDYcCCigireYYm/i?=
 =?us-ascii?Q?baP/HHQI+0E1m71uWKhC8/Q9Zx52oSMc8nFr6y1XEI8Tx6XOMhe/euxZ2GLB?=
 =?us-ascii?Q?TsoIuhodo9rK8n2Ec9XD03RJ1VxqgDikW4GDu8LYIDqWJBsj6lSGi1sY78X3?=
 =?us-ascii?Q?IUcoEx88RlBYyPrciH5SAVUMRDN+OhqycckxaGvR4NnKNDVa+hKAGmuMORoP?=
 =?us-ascii?Q?T7zbu23dKu50yS88sgiK6P3YgdGKGc8yLN1DTy0S?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3e4090-9e58-4216-a996-08daefc69f6a
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:58.8789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je5aloetQD0VGwFR22jz8yAQHki0Wj7yOBzONrVSOTCZoCtoHZtANMjqecEiBgr8IBkwERb+s4M06gUf+mhkQ0INayIdjSFppIlA200/DWk=
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

Remove output format like I2S, left justifed.
And then it add in hw_params.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sma1303.c | 141 +++++++++++++------------------------
 1 file changed, 48 insertions(+), 93 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 42352fa6de56..1199302af01d 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -432,71 +432,6 @@ static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
 			SMA1303_90_POSTSCALER, SMA1303_BYP_POST_MASK, val);
 }
 
-static const char * const sma1303_o_format_text[] = {
-	"LJ", "I2S", "TDM"};
-
-static const struct soc_enum sma1303_o_format_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_o_format_text), sma1303_o_format_text);
-
-static int sma1303_o_format_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val, data, ret;
-
-	ret = sma1303_regmap_read(sma1303, SMA1303_A4_TOP_MAN3, &data);
-	val = data & SMA1303_O_FORMAT_MASK;
-	switch (val) {
-	case SMA1303_O_FMT_LJ:
-		ucontrol->value.integer.value[0] = 0;
-		break;
-	case SMA1303_O_FMT_I2S:
-		ucontrol->value.integer.value[0] = 1;
-		break;
-	case SMA1303_O_FMT_TDM:
-		ucontrol->value.integer.value[0] = 2;
-		break;
-	default:
-		dev_err(component->dev,
-			"Invalid value, register: %x\n",
-				SMA1303_A4_TOP_MAN3);
-		return -EINVAL;
-	}
-
-	return ret;
-}
-static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
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
-		val = SMA1303_O_FMT_LJ;
-		break;
-	case 1:
-		val = SMA1303_O_FMT_I2S;
-		break;
-	case 2:
-		val = SMA1303_O_FMT_TDM;
-		break;
-	default:
-		dev_err(component->dev,
-			"Invalid value, register: %x\n",
-				SMA1303_A4_TOP_MAN3);
-		return -EINVAL;
-	}
-
-	return sma1303_regmap_update_bits(sma1303,
-			SMA1303_A4_TOP_MAN3, SMA1303_O_FORMAT_MASK, val);
-}
-
 static const char * const sma1303_aif_in_source_text[] = {
 	"Mono", "Left", "Right"};
 static const char * const sma1303_aif_out_source_text[] = {
@@ -815,8 +750,6 @@ SND_SOC_BYTES_EXT("Postscaler Set", 1,
 		postscaler_get, postscaler_put),
 SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
 	sma1303_postscaler_config_get, sma1303_postscaler_config_put),
-SOC_ENUM_EXT("Output Format", sma1303_o_format_enum,
-	sma1303_o_format_get, sma1303_o_format_put),
 };
 
 static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
@@ -930,7 +863,6 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	unsigned int input_format = 0;
 	unsigned int bclk = 0;
 	int ret = 0;
 
@@ -1041,35 +973,61 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		}
 	}
 
-	switch (params_width(params)) {
-	case 16:
-		switch (sma1303->format) {
-		case SND_SOC_DAIFMT_I2S:
-			input_format |= SMA1303_STANDARD_I2S;
-			break;
-		case SND_SOC_DAIFMT_LEFT_J:
-			input_format |= SMA1303_LJ;
+	switch (sma1303->format) {
+	case SND_SOC_DAIFMT_I2S:
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_01_INPUT1_CTRL1,
+				SMA1303_I2S_MODE_MASK,
+				SMA1303_STANDARD_I2S);
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_A4_TOP_MAN3,
+				SMA1303_O_FORMAT_MASK,
+				SMA1303_O_FMT_I2S);
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_01_INPUT1_CTRL1,
+				SMA1303_I2S_MODE_MASK,
+				SMA1303_LJ);
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_A4_TOP_MAN3,
+				SMA1303_O_FORMAT_MASK,
+				SMA1303_O_FMT_LJ);
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		switch (params_width(params)) {
+		case 16:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_01_INPUT1_CTRL1,
+					SMA1303_I2S_MODE_MASK,
+					SMA1303_RJ_16BIT);
 			break;
-		case SND_SOC_DAIFMT_RIGHT_J:
-			input_format |= SMA1303_RJ_16BIT;
+		case 24:
+		case 32:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_01_INPUT1_CTRL1,
+					SMA1303_I2S_MODE_MASK,
+					SMA1303_RJ_24BIT);
 			break;
 		}
 		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_01_INPUT1_CTRL1,
+				SMA1303_I2S_MODE_MASK,
+				SMA1303_STANDARD_I2S);
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_A4_TOP_MAN3,
+				SMA1303_O_FORMAT_MASK,
+				SMA1303_O_FMT_TDM);
+		break;
+	}
+
+	switch (params_width(params)) {
+	case 16:
 	case 24:
 	case 32:
-		switch (sma1303->format) {
-		case SND_SOC_DAIFMT_I2S:
-			input_format |= SMA1303_STANDARD_I2S;
-			break;
-		case SND_SOC_DAIFMT_LEFT_J:
-			input_format |= SMA1303_LJ;
-			break;
-		case SND_SOC_DAIFMT_RIGHT_J:
-			input_format |= SMA1303_RJ_24BIT;
-			break;
-		}
 		break;
-
 	default:
 		dev_err(component->dev,
 			"%s not support data bit : %d\n", __func__,
@@ -1077,9 +1035,6 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_01_INPUT1_CTRL1,
-			SMA1303_I2S_MODE_MASK, input_format);
 	return ret;
 }
 
-- 
2.30.2

