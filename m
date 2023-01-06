Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02465FD80
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAF3F14126;
	Fri,  6 Jan 2023 10:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAF3F14126
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996828;
	bh=zbfqZTEVmoWiRxl4QzK981QevqrE79UgpYIuwIZOnL4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uzuFevMKIbcs08QS1fB91aW0QSyC8BchjnJ56scK/ySS5LOu9rQlJMeIVa60s/vUB
	 ugwbol9vLHlWZOmXiySSWTuiy+dRnI8is41+xT60vlhfFqTtmMWzJwqGjrr2edoWtj
	 fInjrCGHgXXiTfX1iU4W+bI0OSlWaDT35WYzTVic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB8CF805C4;
	Fri,  6 Jan 2023 10:16:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C89EAF805AC; Fri,  6 Jan 2023 10:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2040.outbound.protection.outlook.com [40.107.129.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A545F805AC
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A545F805AC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DF0xpFwc60atifLLMGrhb3OnB7XDZGujWO/FJ72Z8u7to5puWXFgmJW4PSx3OpO3P6o9j4Ne+vtwZprAzBw1kjqi8c3Px9MRWW089jjP+DQ1Rt2gQXyfm35J0dLMrNmyWVMfdYSLqNX93oJNR0XOD0j/zLF1SaNW+2iGjifyOWBOp7TKUnadPDKVHQXwC62MpKcbT29/w2FDW2FTIo2NOrkoqv5WfuUG0Z/m9k57fQAL2vekiPfRKjAOarfMHfnxWRpnRBr5EnrRHejcz9Ixs+b5EK5s0Qo4RsF2+tg2RBqfxVMkbRLNVdS3oxkpGZsAhDTSiQsZjmSE/DhLUX/PYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XKTGBLkjHgnny5QSJtsB+4tYdvlTD4AOZSqOHdGbDc=;
 b=jlIOqoGcUmYofL/0dyMMQ5KwNmgb0kbrg6CcTmG9E8+Dc5C4Y40K+Qxrgvv/C+9LxE7CjcqbaR3LFYFxfy4fjcJq3G2BEkOiYrTrlS/tOE7vydAaQXnQ/VNb7MdOV0f86Vg3p/bciwQxuJyQ7HsoTam5TrQqA7fZizH7lZYGUsy6Kme3Sg+GNERJnC4mxhM23LjCQFbdhqXNn40ZZ0KCGJ8BotuagcViKZK/IkElivgbYwSgyloxbnzhgtRmznZqwlmMVyDugPpfjAt8c/QCz8ZLn2n/uKCMC7vuUIwr1ogFT/nkFPSsjI5IldbAxTJJfiwv0/u8BudJUHUDXUFxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:16:02 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:16:02 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Date: Fri,  6 Jan 2023 18:15:43 +0900
Message-Id: <20230106091543.2440-15-kiseok.jo@irondevice.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9c131779-4d0e-4236-d3e5-08daefc6a1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4rSAN80306hVIHwxvWTBlFmCtiEIACVP5XEvjOMYeWw1O5W5qzYiWl3xM4BqvOKaSMRtgUoHd1tTkJLyfHFsFLdeat7niFSDkWffyxJWDVJ4uuzfBnIL+j6634VOWnzutUNUBvUXWKy20xoNR9FDKJKZcyketKWrE4ua8KjyYneUxGMMPsA1k7gkeGDPnfMPJ0dVGAgXG0mRH9xkD7ZmZDYc95jAqv57hB9xu/k50cbMK6Jzvy35kp/azOHyGDjPJ4PKJpKDl6Snj0Z/MPzr5+zvE5XFFjtoPEVYcwXkiLWZ1TkFrV2fFNX4fYKhrnPr6UD6wThId7i/139VfN5QQkVnjE3lpfA/z1R60mqrwdalWeAdcf2vkYavT7GP6sbwfwgcm5lZHFdj81EiJwkbEcYc8ieX8wFqWA8g8o3aPpvS96VkmCnz6hlGytOXcTmV6glkLHS/ZQ69vnCeqcjrIdpGGNnQyAAWfkLmG+lYO5wv0262Xv0LSMmEuHXEuL8WlR4L4XP/PbWZCuMGmNtFPZjpbGojR2RD+SruOLw42ZxhaAlt8Wo5PgPplu7htB/YrPcyklQd+bclj8nseKV/tijiP6PWDNR4dHYty4kj6xJ9eJ7Y6KwCiVy7oK78G23qg3BUelEdt+VB0ctA59qc8p1xYG/57hR5gf5ZPYnQUosMHDGX9Bnf0k/djib2Z/iklZQtBnXAueph7mLF4VdxcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(54906003)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sICLrdm3WjNORlPv3KsfNOVHWmBuMTslgwO7jeRJOYHXTrh5+MP9I194tOkX?=
 =?us-ascii?Q?D6S8Bcr2tdM0rGgMxna8eYkVOXInUhk2z7N5rErhDryUyEikHQsIGCr01TOk?=
 =?us-ascii?Q?E6FjPApglpnd5Gn/+3j7cX6diS3P2kE0G0Rz22cXzj6VmYa2c8VUSFybdsSQ?=
 =?us-ascii?Q?4/dGAZx6EIzj5Abn92QK+5DffURGsGc6IYhOH8EnGdat/bIcmJ5ihfjx83n+?=
 =?us-ascii?Q?E5HSRjQpaxXNVvsgCpdu3lHKGnsKbU+x79dvfJ6ngIfJCoTNAbyOCOnVW+bB?=
 =?us-ascii?Q?huTWILvCWGKKaPlGt/S+RGUrKXx+4MZ7YgftGdic+AYIrq6dD/7uUdRZ6Ywq?=
 =?us-ascii?Q?Ak4j1gPBLsbiy6NkMD2MC570DApGOhXbYAPEQLXXdHHNXfvo3XTXIXNcwHih?=
 =?us-ascii?Q?0cZ4Jq0NTMJ8LM4h0/i/vt4yUptk1XewQAp7FAXmMUhtVd89lZSKk9P6PyL5?=
 =?us-ascii?Q?tdlBxfVoWSnHmlrJ8GeHrQuoeQ65FPcLjKK6gExNi3gaW/LLD88qNDQFjJj4?=
 =?us-ascii?Q?9PhFxCBjGj6tclDyeuC3s30X411Zo3Lt+hTJGUbr6wHgHTLBF9ByyQ/IfJf3?=
 =?us-ascii?Q?ZkgrBlRHRudYdcmqDuruKL+HF7/jcIBJObMGHJx9h38AO4EbwjQb+9RDHQa/?=
 =?us-ascii?Q?TzDNBbNoT5T5yejQ8FsG3zljTir883s54+wlBeMDCEC+XPjulX+6esGdDnoO?=
 =?us-ascii?Q?vrtRJgFdM+3X2VmWzY3G5xc8ZnDPCNzkF6l2xYX3IZGBUOiW/LYfuWqLVtd7?=
 =?us-ascii?Q?44gxJ5ZYAaJP+eugSLKAWfksloxKdamkCEW/rYuAD4f5BvmgqI+RMNAnKMCt?=
 =?us-ascii?Q?IrtwvXfD6YTohVyUUKaoyEEj9Zgc4M8Z0sXAdpy1T3spVBURHHOEn3LxUQGS?=
 =?us-ascii?Q?QkYJL9BUlqdO3MXhA29d3eeNQgts9j+z9u83oQ1bgd01ZM4i0Sluo4aqPvJ2?=
 =?us-ascii?Q?GHJUnQMcFHErOBwTGyctMFgDI5ElBB6DXYnnzf3xFlb2ifnPER0UMVjNyZ/Y?=
 =?us-ascii?Q?6/GrW92jnFxZmvWqXuBi1PdeguqgA/41Jl5Tf0bsU3H+Jl5YEG47FMyYiwpY?=
 =?us-ascii?Q?5c+JTHV8pzzwduCbNMANXSOwLUf+tXlygsgjbQGZDw4k9v2T3rJPeUToexqX?=
 =?us-ascii?Q?7Ilb40kEqwaB5o7QkFhR/l6Ye+DcjOTBGk/wFBOHaq1bm8yM7levQvN2+mOI?=
 =?us-ascii?Q?RU80gFLS0kGsDIooBxfplZ3UqCqNmTOFinjDomWqLW55Cm/Eh3mD/nB5WFS5?=
 =?us-ascii?Q?cYxAUQ6tecEvz2pnWKsFVA4EbwSyb6YxP+5XL2TtJSFfBO7XPRLV3BqHoKez?=
 =?us-ascii?Q?OSe0xzhFqqfWjUnfiIAKy1XNs1rA8zbfo73tua2+VwwX42rpvAk93nGD3dKA?=
 =?us-ascii?Q?t9v/Ampfe4qQGAbpI4hE9siVgG2uRyH8zHyHA3cV+g2nYDmrlpyH8Lc5BLAV?=
 =?us-ascii?Q?Qjtx+w6Zw/HuetYPzjAsZU5a9MwewxJfnl77yw/8eF5q1nxw5NchBe/LUjW9?=
 =?us-ascii?Q?XbuEdil1EWMDF+ktd0WCBZdfY6+E3DHe+u6ttvGkPkDUXECUoofL0pjFdaMP?=
 =?us-ascii?Q?DoD8FdhcnUoEnRBjrIDt9tEsgohQMGgjresMIeCAIvOgxj/j8TlOPp2PE/w2?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c131779-4d0e-4236-d3e5-08daefc6a1a6
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:16:02.5505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSU8TrLuxHsU9rsHT5TlVeeSuo+6mtETlsePzec6clL1NQHKrOrLHNlSnYW8ocvVKN0rDJtjELyBMTFBS+shC5CzqIhdxVHCVTmauT2nn0w=
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
Cc: alsa-devel@alsa-project.org, Dan Carpenter <error27@gmail.com>,
 application@irondevice.com, Kiseok Jo <kiseok.jo@irondevice.com>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/codecs/sma1303.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 1a5d992bf3db..4f9dab5d1613 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -247,7 +247,7 @@ EXPORT_SYMBOL(sma1303_set_callback_func);
 static int sma1303_regmap_write(struct sma1303_priv *sma1303,
 				unsigned int reg, unsigned int val)
 {
-	int ret;
+	int ret = 0;
 	int cnt = sma1303->retry_cnt;
 
 	while (cnt--) {
@@ -266,7 +266,7 @@ static int sma1303_regmap_write(struct sma1303_priv *sma1303,
 static int sma1303_regmap_update_bits(struct sma1303_priv *sma1303,
 		unsigned int reg, unsigned int mask, unsigned int val)
 {
-	int ret;
+	int ret = 0;
 	int cnt = sma1303->retry_cnt;
 
 	while (cnt--) {
@@ -285,7 +285,7 @@ static int sma1303_regmap_update_bits(struct sma1303_priv *sma1303,
 static int sma1303_regmap_read(struct sma1303_priv *sma1303,
 			unsigned int reg, unsigned int *val)
 {
-	int ret;
+	int ret = 0;
 	int cnt = sma1303->retry_cnt;
 
 	while (cnt--) {
@@ -772,12 +772,13 @@ static int sma1303_add_component_controls(struct snd_soc_component *component)
 	sma1303_controls = devm_kzalloc(sma1303->dev,
 			sizeof(sma1303_snd_controls), GFP_KERNEL);
 	name = devm_kzalloc(sma1303->dev,
-			ARRAY_SIZE(sma1303_snd_controls), GFP_KERNEL);
+			ARRAY_SIZE(sma1303_snd_controls)*sizeof(char *),
+			GFP_KERNEL);
 
 	for (index = 0; index < ARRAY_SIZE(sma1303_snd_controls); index++) {
 		sma1303_controls[index] = sma1303_snd_controls[index];
 		name[index] = devm_kzalloc(sma1303->dev,
-				MAX_CONTROL_NAME, GFP_KERNEL);
+				MAX_CONTROL_NAME*sizeof(char), GFP_KERNEL);
 		size = strlen(sma1303_snd_controls[index].name)
 			+ strlen(sma1303->dev->driver->name);
 		if (!name[index] || size > MAX_CONTROL_NAME) {
@@ -1544,7 +1545,7 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	struct sma1303_priv *sma1303;
 	struct device_node *np = client->dev.of_node;
 	int ret, i = 0;
-	u32 value;
+	u32 value = 0;
 	unsigned int device_info, status, otp_stat;
 
 	sma1303 = devm_kzalloc(&client->dev,
@@ -1564,13 +1565,13 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 
 	if (np) {
 		if (!of_property_read_u32(np, "i2c-retry", &value)) {
-			if (value > 50 || value < 0) {
+			if (value > 50 || value <= 0) {
 				sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
 				dev_info(&client->dev, "%s : %s\n", __func__,
 					"i2c-retry out of range (up to 50)");
 			} else {
 				sma1303->retry_cnt = value;
-				dev_info(&client->dev, "%s : %s = %d\n",
+				dev_info(&client->dev, "%s : %s = %u\n",
 					__func__, "i2c-retry count", value);
 			}
 		} else {
@@ -1589,7 +1590,7 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 		}
 		if (!of_property_read_u32(np, "tdm-slot-tx", &value)) {
 			dev_info(&client->dev,
-				"tdm slot tx is '%d' from DT\n", value);
+				"tdm slot tx is '%u' from DT\n", value);
 			sma1303->tdm_slot_tx = value;
 		} else {
 			dev_info(&client->dev,
@@ -1609,7 +1610,7 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 				break;
 			default:
 				dev_err(&client->dev,
-					"Invalid sys-clk-id: %d\n", value);
+					"Invalid sys-clk-id: %u\n", value);
 				return -EINVAL;
 			}
 			sma1303->sys_clk_id = value;
-- 
2.30.2

