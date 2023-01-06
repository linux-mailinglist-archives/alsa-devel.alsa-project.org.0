Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE965FD94
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:21:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3E0819F;
	Fri,  6 Jan 2023 10:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3E0819F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996882;
	bh=e2LnDPucXIAz9UG8dv/JMM1/wmxUtrEG5J7Cloc8y9I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G0snT5O51EArjp+N+a1ys1+pO7NpSKMvhNsVuiGcmNA4ejuMin5tnJtKK2lMIibxr
	 oeOGq9D7nJGsd/cFhLFvCzIsE+FOs8CRAZupiPU8f61/u3VMDlHXDFWo8GPECcZf4g
	 thEv/KvAxWxr2mfjgBuD3g75Ix/3L8XMoYBAzahs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4B7F805EC;
	Fri,  6 Jan 2023 10:16:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0018DF805AC; Fri,  6 Jan 2023 10:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2082.outbound.protection.outlook.com [40.107.129.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE46BF805AA
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE46BF805AA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moW00HfHw1cXZMcLV/CQ2V1jkMM3g6x+GtzwNDn1oQaX2DKMr+XYzszCCD6shgpL85B10TPzOg3n/dfoe0gC1VcLa1PFLw/ekzb38pfvFohNrOeUBvQnBUnQuugcjcTHdeSo1DMztlfs2hC5hgtTwXV0B1sDnq/atY5LS/1WWsQhs+4czb4NP2aW60HoQqBqba5VcONeRmt1yn5UFZkkaVr5h7AGD7coztxePmDdMi2/vi8b/lVDcNPbbde4Lm6Qn7BfEibi1wcwdiWSEkDdnY+zlxc+03RvPy1wOGhxnwyIxmAG9lEOgPgUmf1TtcGken0mhsJ2VNmxhfRdTg50kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+fRSzAEoaxv5XIxLX8kbHJUDvoxR5QZuWktaypOXTc=;
 b=gPfQEnr2BeWW1YsiQQ42keDRJOfc95G7dMwhAVuCIZ0sQOkF93RY7umVLfku4L/P32sCKDvOkqekQGWwm5l+5WDqV+tcHHznfru7YUsRseMCyIJjZIrPcgt/KHUSffsbLQWsbQZSLDEmU1Eznyup1N8HLwxOVy0446d9GCjDKPfGTJSz2owoP+VNKCXWW8zCMX3BOzBBcVGWY+BoizrTpWH5rRWKYKb5PQOYzTYYwSjWLu036vj3UTjoBotDTZ+IiU0pBNsCACR1ox6Hqy6fHs/udj1IV2hHPq8qD+cf+WIUIr3WOUq3chEounFhUYZ0fFnT9yRzz3f7D/YvOk2DsQ==
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
 09:16:01 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 13/14] Move the initial settings to i2c driver probe
Date: Fri,  6 Jan 2023 18:15:42 +0900
Message-Id: <20230106091543.2440-14-kiseok.jo@irondevice.com>
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
X-MS-Office365-Filtering-Correlation-Id: 66da9304-da90-4c70-d9d3-08daefc6a149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xr+hyP2OscDTqowOLRLYyZy8OIckHoxj2R52OHhKlDm1CuN2etdgmguGzos90ZuKTuIipR9XtCUNmwtPorlf9NS3kpv1BGk99c75FWOI7jtqI5VTE+qakaOZK+R11QURIflAwyHwVyDVH+m9aSpBStZkryhMQMr40E0a6DrKjYi61M5Al2AijrRLMmXbpAqbVns8vSRoUcULZqJHUk6SyeLzCG1qIVqbK7l8EcJBvKTwzaeJwGN5YrwBZm2SJGHZXID67M0wfg7SQzftJrC+eDt3YKvS2ns9eVA1j5AjvRrZKcriZuMu9Z0X0Y7/X0Bn6DeqdP5iposvtmRmsitxs/XVgZtpp0YCMz30bMHdoP8sKJ5/IC86seZFSJWl78xSL6NooxoO9+W+m5ZZqLlDUnB+lk7WQC3Z46iucNKHYMnegA5qMsAZMj8vqS+NngzHq9rH4iK/1bxaE8YaYd1JbhoDXKCdWDCkCenC9gBXg5H2r1U3JYw9V/HjZb7f3wmJv+mL58h0bgaAfZh8Lpl2lGjdByld3LxOouILBiL4XRwk1Uv0ZFjijwIrvycmuwLnluTQm55aVvBA9scZ9p2ed1QkK7GL6KSoQwAiGqhWjHUI8dSXY5wwFDYDDdddMJxy0Gz64t0+EVrc5YhTlZ8PXbgBt5lCzIMb59KAS7Xecu2anCTzIS4KwSt+b1MdoENO2ASA0ElGDgaK9jca2hoKJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MDpAuFX7uicm7g0KVdweMJ70YEWWKNwgXuU5mErU90h0ZN52s4Keq9l0zbtx?=
 =?us-ascii?Q?F/QXmgTAKppxYRnLp3YczHvH/iG7JInTUAfbf7suaV6VKmFYacqT6tIzoRYd?=
 =?us-ascii?Q?5sOI07XeLOo/cBQ6aZ0v7EEVWjPsSdiGqUe5z89Qj+/nLrlj7c+pXHyuShM6?=
 =?us-ascii?Q?1H5iv8/xbBG1/c6kCwJ/ZccHYE3di2Cmb1lI+nPhYRFL0dEu3pEUqYXUMVrV?=
 =?us-ascii?Q?mT9JzMUNaHO/0f91Mskr0opR4Dib93ae9MW4yjNbCVxqgLOcuZLXJQCYdDzs?=
 =?us-ascii?Q?G9HfFTEKRkRqlNXBjJEhCW2YVyZ50sXhA7tkW+BqwQMkvGpsXV5zfZn/gqi1?=
 =?us-ascii?Q?Y8myGeKyqHWuE+UNNxEs+cN3WoY//dTAskZTk6xShKSJRKvmNf0z4mwjzSc3?=
 =?us-ascii?Q?S846scCHqBuMOymbpsxFbIDzrsI368gq+d4o8rmg1ky+NLtCno1nW1+MXXjc?=
 =?us-ascii?Q?u48s9qngFCu/kSZcL+yYGEi/PFu6G3fgxU1TWLd5MCRx05F371RWLomFrnhS?=
 =?us-ascii?Q?MS87FNx49ZgLPk9OoBE56TFII9ucmt8LO6vW8wwm6c35w01BptBqu0ulXPPL?=
 =?us-ascii?Q?/Ku2YJOmMHMNaAvrDsK1RV0bF+zbOfZPqs7xHLd+FXom76XjORLr1vlRJ87P?=
 =?us-ascii?Q?WVF0exXYbpUqTvZ3fI7y9Z3ZuthV7Utq9MCJJxiLsBVTyHlqiEN6EKU+3S+V?=
 =?us-ascii?Q?ziGymUdDXK2GzcwObGtEb4NKkt/EM8skhE2VVQ+79K71OSFVb10fWzn4yzP/?=
 =?us-ascii?Q?5XH7jHQvTBSE/z41zrR7sN408Yrn/jbxG7PFY/hVZFdtrqxHUfhXUCWA+1Gr?=
 =?us-ascii?Q?u9oV39+XE04VZw8pKRotKe3/SHv0v0YIHAtfHdKdM10bkeOJl2cpJIDDKdBV?=
 =?us-ascii?Q?+4+wEvC1/8LcgxmZbZ1fQxHADX1CVDhQprBWAToFmbXZV8+OEpRtqhO3Uc2I?=
 =?us-ascii?Q?mTMwn21Shys0MPEOaU+ok0WZmlQB3wSn3ie3pEKOzvfHRuAyteWeVi2U51XX?=
 =?us-ascii?Q?tdKMYYvnmXOEcYNcu8SqjnsqjppiqwOwa2Asm5AOhGOGqkcTL1EuKHQURWPw?=
 =?us-ascii?Q?1ieVJs3PM/IQkscMEodu8ctIIBzEgAyvWRqbr2vUNNhpdiwLDhY4MwvJlW3e?=
 =?us-ascii?Q?XcxqH292pGCDZgoTs4yHslimtu3Pq3+KPTnSyoyjognO9MnoZDdJsKoXGhel?=
 =?us-ascii?Q?D5IrgKkBz2wu6h2LgVLY3N9MOxfBB5ELYoMKQjTnQLOzywo4h7BSkeCZL6kT?=
 =?us-ascii?Q?TknLzqxhUrBUOW2VbKF5F2lTzRNAUc9C3RTrcKH7pdT9F0A2swGaMD5uSBn9?=
 =?us-ascii?Q?GPZxF+XPtJmaCXxcAZgDtJXS/xxEXYFaI4oVFRBf7ydtAt2XBXSKEgsLeUzY?=
 =?us-ascii?Q?dJPMNFxvMVYwVNkkkTAsKP/EtaSMO2Jnvtwuops+cHxoT7dPUG6ohcs0Pbqx?=
 =?us-ascii?Q?wz8B6BTO9LizDcUt+35iC2Z6UjlJy4s7Spa+6C9ZFWAld8eKXdBaBfSbP5o2?=
 =?us-ascii?Q?eS2W7dC4Dq3eBPBud0q8FMxFbtnOclFnYQufNpMxCAJd29n+1kgpbrP2lMwL?=
 =?us-ascii?Q?Rh9+otdaBRJ0/Te9EKmCD32lUA6NogLxwcXxsDkNKaB2NUp2UdCIrb0YdBYI?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66da9304-da90-4c70-d9d3-08daefc6a149
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:16:01.9412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1CZjvTudNHewxu7rREElVtlxzigRp06fzRneZuw56GSGONKVyEIKRSxk92FZXtNCNZKzKZZmrqx0EZFDYvFyOdaGEU85eIWrRbhGbbTTt4=
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
Reported-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sma1303.c | 106 +++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 58 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 08f5054fde1d..1a5d992bf3db 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1416,49 +1416,12 @@ static int sma1303_probe(struct snd_soc_component *component)
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
-	int ret = 0, i = 0;
-	unsigned int status, otp_stat;
+	int ret = 0;
 
 	ret += sma1303_add_component_controls(component);
 
 	snd_soc_dapm_sync(dapm);
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_00_SYSTEM_CTRL,
-			SMA1303_RESETBYI2C_MASK, SMA1303_RESETBYI2C_RESET);
-
-	ret += sma1303_regmap_read(sma1303, SMA1303_FF_DEVICE_INDEX, &status);
-	if (ret < 0) {
-		dev_err(sma1303->dev,
-			"failed to read, register: %02X, ret: %d\n",
-				SMA1303_FF_DEVICE_INDEX, ret);
-		return ret;
-	}
-	sma1303->rev_num = status & SMA1303_REV_NUM_STATUS;
-	if (sma1303->rev_num == SMA1303_REV_NUM_TV0)
-		dev_info(component->dev, "SMA1303 Trimming Version 0\n");
-	else if (sma1303->rev_num == SMA1303_REV_NUM_TV1)
-		dev_info(component->dev, "SMA1303 Trimming Version 1\n");
-
-	ret += sma1303_regmap_read(sma1303, SMA1303_FB_STATUS2, &otp_stat);
-	if (ret < 0)
-		dev_err(sma1303->dev,
-			"failed to read, register: %02X, ret: %d\n",
-				SMA1303_FF_DEVICE_INDEX, ret);
-
-	if (((sma1303->rev_num == SMA1303_REV_NUM_TV0) &&
-		((otp_stat & 0x0E) == SMA1303_OTP_STAT_OK_0)) ||
-		((sma1303->rev_num != SMA1303_REV_NUM_TV0) &&
-		((otp_stat & 0x0C) == SMA1303_OTP_STAT_OK_1)))
-		dev_info(component->dev, "SMA1303 OTP Status Successful\n");
-	else
-		dev_info(component->dev, "SMA1303 OTP Status Fail\n");
-
-	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1303_reg_def); i++)
-		ret += sma1303_regmap_write(sma1303,
-				sma1303_reg_def[i].reg,
-				sma1303_reg_def[i].def);
-
 	ret += sma1303_regmap_write(sma1303,
 			SMA1303_0A_SPK_VOL, sma1303->init_vol);
 
@@ -1580,18 +1543,17 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 {
 	struct sma1303_priv *sma1303;
 	struct device_node *np = client->dev.of_node;
-	int ret;
+	int ret, i = 0;
 	u32 value;
-	unsigned int device_info;
-
-	sma1303 = devm_kzalloc(&client->dev, sizeof(struct sma1303_priv),
-							GFP_KERNEL);
+	unsigned int device_info, status, otp_stat;
 
+	sma1303 = devm_kzalloc(&client->dev,
+				sizeof(struct sma1303_priv), GFP_KERNEL);
 	if (!sma1303)
 		return -ENOMEM;
+	sma1303->dev = &client->dev;
 
 	sma1303->regmap = devm_regmap_init_i2c(client, &sma_i2c_regmap);
-
 	if (IS_ERR(sma1303->regmap)) {
 		ret = PTR_ERR(sma1303->regmap);
 		dev_err(&client->dev,
@@ -1671,35 +1633,64 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	}
 	dev_info(&client->dev, "chip version 0x%02X\n", device_info);
 
-	sma1303->last_over_temp = 0xC0;
-	sma1303->last_ocp_val = 0x08;
-	sma1303->tsdw_cnt = 0;
+	ret += sma1303_regmap_update_bits(sma1303,
+			SMA1303_00_SYSTEM_CTRL,
+			SMA1303_RESETBYI2C_MASK, SMA1303_RESETBYI2C_RESET);
+
+	ret += sma1303_regmap_read(sma1303, SMA1303_FF_DEVICE_INDEX, &status);
+	sma1303->rev_num = status & SMA1303_REV_NUM_STATUS;
+	if (sma1303->rev_num == SMA1303_REV_NUM_TV0)
+		dev_info(&client->dev, "SMA1303 Trimming Version 0\n");
+	else if (sma1303->rev_num == SMA1303_REV_NUM_TV1)
+		dev_info(&client->dev, "SMA1303 Trimming Version 1\n");
+
+	ret += sma1303_regmap_read(sma1303, SMA1303_FB_STATUS2, &otp_stat);
+	if (ret < 0)
+		dev_err(&client->dev,
+			"failed to read, register: %02X, ret: %d\n",
+				SMA1303_FF_DEVICE_INDEX, ret);
+
+	if (((sma1303->rev_num == SMA1303_REV_NUM_TV0) &&
+		((otp_stat & 0x0E) == SMA1303_OTP_STAT_OK_0)) ||
+		((sma1303->rev_num != SMA1303_REV_NUM_TV0) &&
+		((otp_stat & 0x0C) == SMA1303_OTP_STAT_OK_1)))
+		dev_info(&client->dev, "SMA1303 OTP Status Successful\n");
+	else
+		dev_info(&client->dev, "SMA1303 OTP Status Fail\n");
+
+	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1303_reg_def); i++)
+		ret += sma1303_regmap_write(sma1303,
+				sma1303_reg_def[i].reg,
+				sma1303_reg_def[i].def);
+
+	sma1303->amp_mode = SMA1303_MONO;
+	sma1303->amp_power_status = false;
+	sma1303->check_fault_period = CHECK_PERIOD_TIME;
+	sma1303->check_fault_status = true;
+	sma1303->force_mute_status = false;
 	sma1303->init_vol = 0x31;
 	sma1303->cur_vol = sma1303->init_vol;
 	sma1303->last_bclk = 0;
+	sma1303->last_ocp_val = 0x08;
+	sma1303->last_over_temp = 0xC0;
+	sma1303->tsdw_cnt = 0;
 
-	INIT_DELAYED_WORK(&sma1303->check_fault_work,
-		sma1303_check_fault_worker);
+	sma1303->dev = &client->dev;
+	sma1303->kobj = &client->dev.kobj;
 
 	mutex_init(&sma1303->lock);
-	sma1303->check_fault_period = CHECK_PERIOD_TIME;
 
-	sma1303->dev = &client->dev;
-	sma1303->kobj = &client->dev.kobj;
+	INIT_DELAYED_WORK(&sma1303->check_fault_work,
+		sma1303_check_fault_worker);
 
 	i2c_set_clientdata(client, sma1303);
 
-	sma1303->amp_mode = SMA1303_MONO;
-	sma1303->amp_power_status = false;
-	sma1303->force_mute_status = false;
-	sma1303->check_fault_status = true;
 	sma1303->pll_matches = sma1303_pll_matches;
 	sma1303->num_of_pll_matches =
 		ARRAY_SIZE(sma1303_pll_matches);
 
 	ret = devm_snd_soc_register_component(&client->dev,
 			&sma1303_component, sma1303_dai, 1);
-
 	if (ret) {
 		dev_err(&client->dev, "Failed to register component");
 
@@ -1708,7 +1699,6 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 
 	sma1303->attr_grp = &sma1303_attr_group;
 	ret = sysfs_create_group(sma1303->kobj, sma1303->attr_grp);
-
 	if (ret) {
 		dev_err(&client->dev,
 			"failed to create attribute group [%d]\n", ret);
-- 
2.30.2

