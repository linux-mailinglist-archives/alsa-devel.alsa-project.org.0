Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC165FD6A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:17:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5322A1411E;
	Fri,  6 Jan 2023 10:16:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5322A1411E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996648;
	bh=Fmo8oFqw0cD3FSNuTWr51NQS06foqERLa8iCGUV7F5g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Kw5gRbUifsWCe/VCxO72ADNK3wKBSrJBhGKIpHUy1DHzIaNnJdgFBdXPIRs3kFtUh
	 rqN4e5FKHY2Jaj6U/GmXb4uy9w1hLsArC2Hd2X9wffOwBarWd2gyXViabbxY0FJXpl
	 DxsUrnsbE/G3EbKjj/zctMTijpm6YCYrANTo3vmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78824F804CB;
	Fri,  6 Jan 2023 10:16:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DEBFF8025A; Fri,  6 Jan 2023 10:16:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2059.outbound.protection.outlook.com [40.107.129.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A988F80217
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A988F80217
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOBbPKpk+pDDo/BmLshiqxBrx0YOFU48SF+9tryQ5r234OJodDa/2Z47nnfEb6yfoGJ8vxJCN5fTZbliIZfFKxEigcwLD9F47uC6TObfZKIIFpXLlSj6wuWs1UrZzStwngGOfUD7mUceaOwDZkqbJ7GDCQVY96cyAh4lqmiQN7qoY1kUp+Vz9VprOC61xrZgBzDEZYNYS9mf12vy61YCSEXS4Tyt9Vk2aC1E0V54QJesurI65WEScQAHZH5b5z27GpC+GeNGIrvI8XCXsD+US7NaWCip+ZYe+whNoCQch19xrLB84nZ/UUFCfY5zBgksHtzmjbgrjlptQdJyoXyThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8lU592bRchRfZZ8/8ztJ09tqoCoLHzsDqN/cE2ldWE=;
 b=ZC586MD2W7+x4C/3wB5ubV+VuPU3zhgQ4/+xwMnFrk06SEamA3zNWUFy0srnKjtO5d+bbvkAhJqwtxNzQcQ7xqRKOg4ePrtwO3EhZPhtKkUGtSSrKk3x9G8VxhADAdX5jmM9/IGxmrfAJYxyThv0vhQT/xhK6VYqgcMuMQDX6++twO60l4w8EGD4TTjqVZLDl33S+CdJTrEoy6ty6H8nZgA+0kID9DZonUOmUFFfv2fDqeSeNap2oN5Kms5YY6sbqt9eWHyCRtiioe+FDu5YcjapgVum/qlmsT8ne5z2TlJswmVknjF1yfSDwrDUmqd9Rww6R6fRNiFgTenrbD1Nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:56 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:56 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/14] Add the i2c-retry count and callback function in regmap
 function.
Date: Fri,  6 Jan 2023 18:15:32 +0900
Message-Id: <20230106091543.2440-4-kiseok.jo@irondevice.com>
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
X-MS-Office365-Filtering-Correlation-Id: b138784d-95c9-4764-aad4-08daefc69e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EO4mKrmOCinRAUb0UAWHQFjwb2nia0fCgsMkDeSrhxoVsOvE2BpsQCdAn8H71O57YSi8rHgjljkURTGigLQcZT5HwSBPhIed1+/t93iIBSUbrqJG0yo4oUtXzW2ZYcCC50TD+RNQinGm/vhZ4dK56bj3we9YILTUBK1UxGEr0/cQXS9LVMKRlcfoGr4rVnDEM/L46MZ+lLyeGN/nzLxT5mhz5I1YzX4taWi4s/KnhdgpD6OxKfZCMu7z+4D+YfKvK3vZDzYYSVDnp0uCFjQcje9Xa9qELxpygiMi0elg6looXSckeNBuJBdfXTN3shsuamzq/2vb56KDrKAC60juGWIf59ai+OqUIrYvvEBaK3OMHqmvr3pTRz6DBYKn1FpZXHdXFJF2hLz6WEQL2Wc7hGlFUc4tpgIjOGELM8ZcAgFOD8lXDcNPEwAXBu/RA7Ob3FDTp5Wa55LjvLJxE47pKFgr/AIXtk1/CX3FZ1t3gHkbxc1Gwcb/I+Snm3dys1Ee95pgEfo7A6YadLJEIRBbUTbiCZmkyHQ1x14AH521NwCjLXOVsQnTynyWsCchlplbPT724338AoKUAaeCftRra+2MVz3mEYsqAd0gfImaKOwTpg8DNZhdI1u8c4xauXUkphzvwVBDsCoaIi7+XKxIRluVF4qOs0QQoHkB6oxqBzjvcFa1cFduT5/peRY+eo73
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(30864003)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40qMGHXD36cdBIkpBoEcLPHo613VQmcZQLTRuC7gccdCFniAjgOiUS+vCnps?=
 =?us-ascii?Q?DU6NQVbGcwr6aaU2JX00/dwunaItr3GrUk4RpFgyEvXOB+4+8K2I2Lrg5uZF?=
 =?us-ascii?Q?DRcXLgUphm8UuCrHPhcRn018I/4l+e3LimNkuBeX50rfsE/hf5nG/byFhck0?=
 =?us-ascii?Q?NI3iHhcL3Va0oBgTRoFJLrspAvlNF63olV/noUTzrBn8GyvMY5QthppCXTHg?=
 =?us-ascii?Q?v+/IuOPst2bM1ZfOnfVQMT9LX1ARa4mX8QFrqmUy3V3RP0skSRoPVxUM4DCg?=
 =?us-ascii?Q?Ha1YeMj4hdW9rYMrKZHg1YYfZzt+MMI93kDyTHNDprejxNOswF/n+6khKghi?=
 =?us-ascii?Q?XbEM924uHuojSlLUTjnUy9/im1DKMTzXEM2ZTJudwhr0w7opbhgkVps/aZjw?=
 =?us-ascii?Q?+A+3FwfC2pALBTTDaILPQ/QoXRYpsDXDreEKsu3g4APNx56CTL36p/uYktIX?=
 =?us-ascii?Q?soW0dOp0W1t+/bgj9a5Yc3T7thc1FOZIOKOS3RFxU7oJfo0YL0WQwtYzkdcM?=
 =?us-ascii?Q?y79nZar+v8aRrmyU5c2wb+gSRyl/2CpW5HeXM3Uk7uzMWwaMomHym1b/e9u6?=
 =?us-ascii?Q?Tl03shtRI2TP11QWdF9QdBdk+VAT98mGNOMib8DJR6abgRWeKWgshi6XYc70?=
 =?us-ascii?Q?2PCoHOW98pQdHowj+Q2mSmUQQFIioVJOiscFcbiejHTid9qA8nkEFdIeas2y?=
 =?us-ascii?Q?CZRIuygPqmYw1VPcgU0qb698bOfaBL56c0Cdb6v9CJvlrHkjvHGiYiNBle+y?=
 =?us-ascii?Q?DTfxV7ZN6HOMNZWNZltrOhk9+rWBuKxaJYt9Pv7zLi570g6qc7HrxdsYx6pE?=
 =?us-ascii?Q?TRHZfYNbGJ2v504/D9n7l5FxPHHrMJxf2PVSz+09hKvo3D1ThoTpvhEs+9Yh?=
 =?us-ascii?Q?DzfcYbr26oixVm8RLdWkXTfQCaAlvKrDB/x4vlYGUJJIdcGvV6pgQdiiCV23?=
 =?us-ascii?Q?RyvVYQZkNd2K0UySi6x+PSfu57wSW9nX/vzxb69inYV1nkaYBIVbvASoitVh?=
 =?us-ascii?Q?m8y63TNv/EmnHCouZME105qmDXlxscYTm7kqUlsWOrnhfWdPxVxSubeLSBKX?=
 =?us-ascii?Q?pY/TCveg55RR/+uWCNHCjS5yKhbJ6SrqVQF2dKBMR/0r2pSMByM+jOM2pSsW?=
 =?us-ascii?Q?NkWKFdM6Bw9g+BN/4+/b5vD6w9izC/NfxibcbspVMNZr7l1RWlVxbNum2Z99?=
 =?us-ascii?Q?Xh2ssVmKQnMVhoPcg4J6dNKzYTbdtKbVuqP32Mwoc++Deb88tcsSY8lAqaEN?=
 =?us-ascii?Q?vPWXGMUSYZLf3djsxhabwelTSwFTT+a0HW7Xy770DpeS4CgT+jlpICwIfJXc?=
 =?us-ascii?Q?r4Tm54z4yDLq5IIZCKCkNNyYiFxZ+hGhrmAAZiIYcytr5+eaKXLDX5aPL2X+?=
 =?us-ascii?Q?IVfTRhjFNqrbgt2cLKxIoAW7OZytshKffG2r/eao5H11RRDRnHPpzZBCeZG6?=
 =?us-ascii?Q?bwpKq/cdzhhgIMknB9XISXloiq8gcHP1dlEt81ep/uGNdjujYaBC2tJe2Q+A?=
 =?us-ascii?Q?Ahfnrn9WKFEB4oKWrHDHih4IBracgEhPS2CzZ5cqZ/gbDEEdq08NR2xF6ycQ?=
 =?us-ascii?Q?tioMJCKkQfqFvs86XljQ5OnaU7CXK6OA1FbVF0Dc?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b138784d-95c9-4764-aad4-08daefc69e21
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:56.5353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FoUThxie7ln2T0Hcz4Ehq87xhTS+oDln6pHQ1vxq8I+jfNGhq+aA5YWZOZHR7PVUgZgInoOfJ1HsiGfxoEAm40TZnhjTdulmwM/dTkt2TLU=
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
 sound/soc/codecs/sma1303.c | 261 ++++++++++++++++++++-----------------
 sound/soc/codecs/sma1303.h |   9 ++
 2 files changed, 147 insertions(+), 123 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 50b471920fc8..8bd59a481f2d 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -47,6 +47,8 @@ enum sma1303_type {
 	SMA1303,
 };
 
+struct callback_ops gCallback;
+
 struct sma1303_pll_match {
 	char *input_clk_name;
 	char *output_clk_name;
@@ -69,6 +71,7 @@ struct sma1303_priv {
 	bool amp_power_status;
 	bool usage_status;
 	int num_of_pll_matches;
+	int retry_cnt;
 	unsigned int sys_clk_id;
 	unsigned int init_vol;
 	unsigned int cur_vol;
@@ -233,28 +236,66 @@ static bool sma1303_volatile_register(struct device *dev, unsigned int reg)
 
 static const DECLARE_TLV_DB_SCALE(sma1303_spk_tlv, -6000, 50, 0);
 
-static int sma1303_regmap_write(struct regmap *map, struct device *dev,
+void sma1303_set_callback_func(struct callback_ops ops)
+{
+	if (ops.set_i2c_err)
+		gCallback.set_i2c_err = ops.set_i2c_err;
+}
+EXPORT_SYMBOL(sma1303_set_callback_func);
+
+static int sma1303_regmap_write(struct sma1303_priv *sma1303,
 				unsigned int reg, unsigned int val)
 {
 	int ret = 0;
+	int cnt = sma1303->retry_cnt;
 
-	ret = regmap_write(map, reg, val);
-	if (ret < 0) {
-		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
-			       reg, ret);
+	while (cnt--) {
+		ret = regmap_write(sma1303->regmap, reg, val);
+		if (ret < 0) {
+			dev_err(sma1303->dev,
+					"Failed to write [0x%02X]\n", reg);
+			if (gCallback.set_i2c_err)
+				gCallback.set_i2c_err(sma1303->dev, ret);
+		} else
+			break;
 	}
 	return ret;
 }
 
-static int sma1303_regmap_update_bits(struct regmap *map, struct device *dev,
+static int sma1303_regmap_update_bits(struct sma1303_priv *sma1303,
 		unsigned int reg, unsigned int mask, unsigned int val)
 {
 	int ret = 0;
+	int cnt = sma1303->retry_cnt;
 
-	ret = regmap_update_bits(map, reg, mask, val);
-	if (ret < 0) {
-		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
-			       reg, ret);
+	while (cnt--) {
+		ret = regmap_update_bits(sma1303->regmap, reg, mask, val);
+		if (ret < 0) {
+			dev_err(sma1303->dev,
+					"Failed to update [0x%02X]\n", reg);
+			if (gCallback.set_i2c_err)
+				gCallback.set_i2c_err(sma1303->dev, ret);
+		} else
+			break;
+	}
+	return ret;
+}
+
+static int sma1303_regmap_read(struct sma1303_priv *sma1303,
+			unsigned int reg, unsigned int *val)
+{
+	int ret;
+	int cnt = sma1303->retry_cnt;
+
+	while (cnt--) {
+		ret = regmap_read(sma1303->regmap, reg, val);
+		if (ret < 0) {
+			dev_err(sma1303->dev,
+					"Failed to read [0x%02X]\n", reg);
+			if (gCallback.set_i2c_err)
+				gCallback.set_i2c_err(sma1303->dev, ret);
+		} else
+			break;
 	}
 	return ret;
 }
@@ -280,7 +321,7 @@ static int bytes_ext_get(struct snd_kcontrol *kcontrol,
 	}
 	val = (u8 *)ucontrol->value.bytes.data;
 	for (i = 0; i < params->max; i++) {
-		ret = regmap_read(sma1303->regmap, reg + i, &reg_val);
+		ret = sma1303_regmap_read(sma1303, reg + i, &reg_val);
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to read, register: %x ret: %d\n",
@@ -323,9 +364,7 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 
 	val = (u8 *)data;
 	for (i = 0; i < params->max; i++) {
-		ret = sma1303_regmap_write(
-				sma1303->regmap, component->dev,
-				reg + i, *(val + i));
+		ret = sma1303_regmap_write(sma1303, reg + i, *(val + i));
 		if (ret < 0) {
 			kfree(data);
 			return ret;
@@ -463,32 +502,26 @@ static int sma1303_amp_mode_put(struct snd_kcontrol *kcontrol,
 	switch (sma1303->amp_mode) {
 	case ONE_CHIP_SOLUTION:
 	case MONO_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_11_SYSTEM_CTRL2,
 				MONOMIX_MASK, MONOMIX_ON);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_11_SYSTEM_CTRL2,
 				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
 		break;
 	case LEFT_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_11_SYSTEM_CTRL2,
 				MONOMIX_MASK, MONOMIX_OFF);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_11_SYSTEM_CTRL2,
 				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
 		break;
 	case RIGHT_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_11_SYSTEM_CTRL2,
 				MONOMIX_MASK, MONOMIX_OFF);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_11_SYSTEM_CTRL2,
 				LR_DATA_SW_MASK, LR_DATA_SW_SWAP);
 		break;
@@ -524,7 +557,7 @@ static int sma1303_outport_config_get(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_09_OUTPUT_CTRL, &data);
+	ret = sma1303_regmap_read(sma1303, SMA1303_09_OUTPUT_CTRL, &data);
 	if (ret < 0) {
 		dev_err(component->dev,
 			"Failed to read, register: %x ret: %d\n",
@@ -582,7 +615,7 @@ static int sma1303_outport_config_put(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	return sma1303_regmap_update_bits(sma1303,
 			SMA1303_09_OUTPUT_CTRL, PORT_CONFIG_MASK, val);
 }
 
@@ -618,7 +651,7 @@ static int sma1303_spkmode_get(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1, &data);
+	ret = sma1303_regmap_read(sma1303, SMA1303_10_SYSTEM_CTRL1, &data);
 	if (ret < 0) {
 		dev_err(component->dev,
 			"Failed to read, register: %x ret: %d\n",
@@ -695,7 +728,7 @@ static int sma1303_spkmode_put(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	return sma1303_regmap_update_bits(sma1303,
 			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, val);
 }
 
@@ -735,7 +768,7 @@ static int sma1303_postscaler_config_get(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_90_POSTSCALER, &data);
+	ret = sma1303_regmap_read(sma1303, SMA1303_90_POSTSCALER, &data);
 	if (ret < 0) {
 		dev_err(component->dev,
 			"Failed to read, register: %x ret: %d\n",
@@ -793,7 +826,7 @@ static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	return sma1303_regmap_update_bits(sma1303,
 			SMA1303_90_POSTSCALER, BYP_POST_MASK, val);
 }
 
@@ -820,7 +853,7 @@ static int sma1303_o_format_get(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_A4_TOP_MAN3, &data);
+	ret = sma1303_regmap_read(sma1303, SMA1303_A4_TOP_MAN3, &data);
 	val = data & O_FORMAT_MASK;
 	switch (val) {
 	case O_FMT_LJ:
@@ -876,7 +909,7 @@ static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	return sma1303_regmap_update_bits(sma1303,
 			SMA1303_A4_TOP_MAN3, O_FORMAT_MASK, val);
 }
 
@@ -927,17 +960,17 @@ static int sma1303_startup(struct snd_soc_component *component)
 		return ret;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_OPERATION2);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_ON);
 
 	if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
-		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_MONO);
 	else
-		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_STEREO);
 
 	if (sma1303->check_fault_status) {
@@ -951,7 +984,7 @@ static int sma1303_startup(struct snd_soc_component *component)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_UNMUTE);
 
 	sma1303->amp_power_status = true;
@@ -970,20 +1003,20 @@ static int sma1303_shutdown(struct snd_soc_component *component)
 		return ret;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_MUTE);
 
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
 
 	msleep(55);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_OFF);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_OFF);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_PD2);
 
 	sma1303->amp_power_status = false;
@@ -1059,14 +1092,12 @@ static int sma1303_dac_feedback_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_PRE_PMU:
 		dev_info(component->dev,
 				"%s : DAC feedback ON\n", __func__);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_09_OUTPUT_CTRL,
 				PORT_CONFIG_MASK|PORT_OUT_SEL_MASK,
 				OUTPUT_PORT_ENABLE|SPEAKER_PATH);
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A3_TOP_MAN2,
 				SDO_OUTPUT_MASK, NORMAL_OUT);
 		break;
@@ -1074,13 +1105,11 @@ static int sma1303_dac_feedback_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_PRE_PMD:
 		dev_info(component->dev,
 				"%s : DAC feedback OFF\n", __func__);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_09_OUTPUT_CTRL,
 				PORT_OUT_SEL_MASK, OUT_SEL_DISABLE);
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A3_TOP_MAN2, SDO_OUTPUT_MASK,
 				HIGH_Z_OUT);
 		break;
@@ -1138,26 +1167,25 @@ static int sma1303_setup_pll(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A2_TOP_MAN1,
 				PLL_PD_MASK|PLL_REF_CLK_MASK,
 				PLL_OPERATION|PLL_SCK);
 	}
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_write(sma1303,
 			SMA1303_8B_PLL_POST_N,
 			sma1303->pll_matches[i].post_n);
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_write(sma1303,
 			SMA1303_8C_PLL_N,
 			sma1303->pll_matches[i].n);
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_write(sma1303,
 			SMA1303_8D_PLL_A_SETTING,
 			sma1303->pll_matches[i].vco);
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_write(sma1303,
 			SMA1303_8F_PLL_P_CP,
 			sma1303->pll_matches[i].p_cp);
 
@@ -1211,25 +1239,21 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		case 44100:
 		case 48000:
 		case 96000:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A2_TOP_MAN1,
 				DAC_DN_CONV_MASK, DAC_DN_CONV_DISABLE);
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
 				LEFTPOL_MASK, LOW_FIRST_CH);
 		break;
 
 		case 192000:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A2_TOP_MAN1,
 				DAC_DN_CONV_MASK, DAC_DN_CONV_ENABLE);
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
 				LEFTPOL_MASK, HIGH_FIRST_CH);
 		break;
@@ -1249,8 +1273,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			dev_info(component->dev,
 				"%s set format SNDRV_PCM_FORMAT_S16_LE\n",
 				__func__);
-			ret += sma1303_regmap_update_bits(
-					sma1303->regmap, component->dev,
+			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A4_TOP_MAN3,
 					SCK_RATE_MASK, SCK_32FS);
 			break;
@@ -1259,8 +1282,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			dev_info(component->dev,
 				"%s set format SNDRV_PCM_FORMAT_S24_LE\n",
 				__func__);
-			ret += sma1303_regmap_update_bits(
-					sma1303->regmap, component->dev,
+			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A4_TOP_MAN3,
 					SCK_RATE_MASK, SCK_64FS);
 			break;
@@ -1268,8 +1290,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			dev_info(component->dev,
 				"%s set format SNDRV_PCM_FORMAT_S32_LE\n",
 				__func__);
-			ret += sma1303_regmap_update_bits(
-					sma1303->regmap, component->dev,
+			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A4_TOP_MAN3,
 					SCK_RATE_MASK, SCK_64FS);
 			break;
@@ -1317,8 +1338,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_01_INPUT1_CTRL1,
 			I2S_MODE_MASK, input_format);
 	return ret;
@@ -1365,15 +1385,13 @@ static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 	if (mute) {
 		dev_info(component->dev, "%s : %s\n", __func__, "MUTE");
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_0E_MUTE_VOL_CTRL,
 				SPK_MUTE_MASK, SPK_MUTE);
 	} else {
 		dev_info(component->dev, "%s : %s\n", __func__, "UNMUTE");
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_0E_MUTE_VOL_CTRL,
 				SPK_MUTE_MASK, SPK_UNMUTE);
 	}
@@ -1393,8 +1411,7 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_CBS_CFS:
 		dev_info(component->dev,
 				"%s : %s\n", __func__, "I2S/TDM Device mode");
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
 				CONTROLLER_DEVICE_MASK, DEVICE_MODE);
 		break;
@@ -1402,8 +1419,7 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_CBM_CFM:
 		dev_info(component->dev,
 			"%s : %s\n", __func__, "I2S/TDM Controller mode");
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
 				CONTROLLER_DEVICE_MASK, CONTROLLER_MODE);
 		break;
@@ -1434,16 +1450,14 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_IB_NF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Invert BCLK + Normal Frame");
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
 				SCK_RISING_MASK, SCK_RISING_EDGE);
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Invert BCLK + Invert Frame");
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
 				LEFTPOL_MASK|SCK_RISING_MASK,
 				HIGH_FIRST_CH|SCK_RISING_EDGE);
@@ -1451,8 +1465,7 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_NB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Normal BCLK + Invert Frame");
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
 				LEFTPOL_MASK, HIGH_FIRST_CH);
 		break;
@@ -1482,21 +1495,18 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 
 	sma1303->frame_size = slot_width * slots;
 
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_A4_TOP_MAN3,
 			O_FORMAT_MASK, O_FMT_TDM);
 
 	switch (slot_width) {
 	case 16:
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_A6_TDM2,
 			TDM_DL_MASK, TDM_DL_16);
 	break;
 	case 32:
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_A6_TDM2,
 			TDM_DL_MASK, TDM_DL_32);
 	break;
@@ -1507,14 +1517,12 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 
 	switch (slots) {
 	case 4:
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_A6_TDM2,
 			TDM_N_SLOT_MASK, TDM_N_SLOT_4);
 	break;
 	case 8:
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_A6_TDM2,
 			TDM_N_SLOT_MASK, TDM_N_SLOT_8);
 	break;
@@ -1524,27 +1532,23 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	}
 
 	if (sma1303->tdm_slot_rx < slots)
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A5_TDM1, TDM_SLOT1_RX_POS_MASK,
 				(sma1303->tdm_slot_rx) << 3);
 	else
 		dev_err(component->dev, "%s Incorrect tdm-slot-rx %d set\n",
 				__func__, sma1303->tdm_slot_rx);
 
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_A5_TDM1,
 			TDM_CLK_POL_MASK, TDM_CLK_POL_RISE);
 
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_A5_TDM1,
 			TDM_TX_MODE_MASK, TDM_TX_MONO);
 
 	if (sma1303->tdm_slot_tx < slots)
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A6_TDM2, TDM_SLOT1_TX_POS_MASK,
 				(sma1303->tdm_slot_tx) << 3);
 	else
@@ -1598,10 +1602,10 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 	mutex_lock(&sma1303->lock);
 
 	if (sma1303->tsdw_cnt)
-		ret = regmap_read(sma1303->regmap,
+		ret = sma1303_regmap_read(sma1303,
 			SMA1303_0A_SPK_VOL, &sma1303->cur_vol);
 	else
-		ret = regmap_read(sma1303->regmap,
+		ret = sma1303_regmap_read(sma1303,
 			SMA1303_0A_SPK_VOL, &sma1303->init_vol);
 
 	if (ret != 0) {
@@ -1611,7 +1615,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_FA_STATUS1, &over_temp);
+	ret = sma1303_regmap_read(sma1303, SMA1303_FA_STATUS1, &over_temp);
 	if (ret != 0) {
 		dev_err(sma1303->dev,
 			"failed to read SMA1303_FA_STATUS1 : %d\n", ret);
@@ -1619,7 +1623,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &ocp_val);
+	ret = sma1303_regmap_read(sma1303, SMA1303_FB_STATUS2, &ocp_val);
 	if (ret != 0) {
 		dev_err(sma1303->dev,
 			"failed to read SMA1303_FB_STATUS2 : %d\n", ret);
@@ -1627,7 +1631,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &uvlo_val);
+	ret = sma1303_regmap_read(sma1303, SMA1303_FF_DEVICE_INDEX, &uvlo_val);
 	if (ret != 0) {
 		dev_err(sma1303->dev,
 			"failed to read SMA1303_FF_DEVICE_INDEX : %d\n", ret);
@@ -1640,14 +1644,12 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 			"%s : OT1(Over Temperature Level 1)\n", __func__);
 
 		if ((sma1303->cur_vol + 6) <= 0xFF)
-			sma1303_regmap_write(
-				sma1303->regmap, sma1303->dev,
+			sma1303_regmap_write(sma1303,
 				SMA1303_0A_SPK_VOL, sma1303->cur_vol + 6);
 
 		sma1303->tsdw_cnt++;
 	} else if (sma1303->tsdw_cnt) {
-		sma1303_regmap_write(
-				sma1303->regmap, sma1303->dev,
+		sma1303_regmap_write(sma1303,
 				SMA1303_0A_SPK_VOL, sma1303->init_vol);
 		sma1303->tsdw_cnt = 0;
 		sma1303->cur_vol = sma1303->init_vol;
@@ -1761,12 +1763,11 @@ static int sma1303_probe(struct snd_soc_component *component)
 
 	snd_soc_dapm_sync(dapm);
 
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
+	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_00_SYSTEM_CTRL,
 			RESETBYI2C_MASK, RESETBYI2C_RESET);
 
-	ret += regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &status);
+	ret += sma1303_regmap_read(sma1303, SMA1303_FF_DEVICE_INDEX, &status);
 	if (ret < 0) {
 		dev_err(sma1303->dev,
 			"failed to read, register: %02X, ret: %d\n",
@@ -1779,7 +1780,7 @@ static int sma1303_probe(struct snd_soc_component *component)
 	else if (sma1303->rev_num == REV_NUM_TV1)
 		dev_info(component->dev, "SMA1303 Trimming Version 1\n");
 
-	ret += regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &otp_stat);
+	ret += sma1303_regmap_read(sma1303, SMA1303_FB_STATUS2, &otp_stat);
 	if (ret < 0)
 		dev_err(sma1303->dev,
 			"failed to read, register: %02X, ret: %d\n",
@@ -1794,12 +1795,11 @@ static int sma1303_probe(struct snd_soc_component *component)
 		dev_info(component->dev, "SMA1303 OTP Status Fail\n");
 
 	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1303_reg_def); i++)
-		ret += sma1303_regmap_write(
-				sma1303->regmap, component->dev,
+		ret += sma1303_regmap_write(sma1303,
 				sma1303_reg_def[i].reg,
 				sma1303_reg_def[i].def);
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_write(sma1303,
 			SMA1303_0A_SPK_VOL, sma1303->init_vol);
 
 	dev_info(component->dev,
@@ -1949,6 +1949,21 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	}
 
 	if (np) {
+		if (!of_property_read_u32(np, "i2c-retry", &value)) {
+			if (value > 50 || value < 0) {
+				sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
+				dev_info(&client->dev, "%s : %s\n", __func__,
+					"i2c-retry out of range (up to 50)");
+			} else {
+				sma1303->retry_cnt = value;
+				dev_info(&client->dev, "%s : %s = %d\n",
+					__func__, "i2c-retry count", value);
+			}
+		} else {
+			dev_info(&client->dev, "%s : %s = %d\n", __func__,
+				"i2c-retry count", SMA1303_I2C_RETRY_COUNT);
+			sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
+		}
 		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
 			dev_info(&client->dev,
 				"tdm slot rx is '%d' from DT\n", value);
@@ -1995,8 +2010,8 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	ret = regmap_read(sma1303->regmap,
-		SMA1303_FF_DEVICE_INDEX, &device_info);
+	ret = sma1303_regmap_read(sma1303,
+			SMA1303_FF_DEVICE_INDEX, &device_info);
 
 	if ((ret != 0) || ((device_info & 0xF8) != DEVICE_ID)) {
 		dev_err(&client->dev, "device initialization error (%d 0x%02X)",
diff --git a/sound/soc/codecs/sma1303.h b/sound/soc/codecs/sma1303.h
index d1fa2acaba85..186af18188e9 100644
--- a/sound/soc/codecs/sma1303.h
+++ b/sound/soc/codecs/sma1303.h
@@ -11,6 +11,13 @@
 #ifndef _SMA1303_H
 #define _SMA1303_H
 
+typedef void (*callback_fptr) (void *device, int err);
+struct callback_ops {
+	callback_fptr set_i2c_err;
+};
+
+void sma1303_set_callback_func(struct callback_ops ops);
+
 #define  SMA1303_I2C_ADDR_00		0x1e
 #define  SMA1303_I2C_ADDR_01		0x3e
 #define  SMA1303_I2C_ADDR_10		0x5e
@@ -26,6 +33,8 @@
 #define  LEFT_TWO_CHIP_SOLUTION		0x02
 #define  RIGHT_TWO_CHIP_SOLUTION	0x03
 
+#define SMA1303_I2C_RETRY_COUNT		3
+
 /*
  * SMA1303 Register Definition
  */
-- 
2.30.2

