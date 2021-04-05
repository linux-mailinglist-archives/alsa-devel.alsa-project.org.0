Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39D3542EA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 16:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379E616EE;
	Mon,  5 Apr 2021 16:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379E616EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617633621;
	bh=GMIrRcGVSr780+x1Y7QLOYFMgK5azxkF7sAd5G1iF9Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G1DJMma6Z5gmtzbJejXErQZKWZOs637orZAdSBLdjHuA8rAr10IK/moIOKHgnXE1E
	 Xwb45dDHZxUMIkKR0KNy2tzelh7PKj9SAXwQyZbFZksWP3FeSLNaI1FYEfolIu8wkV
	 lekNo9fRFo44Tno4KGdt/TsInQou7NoKmBoeTuNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E16F8016D;
	Mon,  5 Apr 2021 16:38:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59ECFF8016A; Mon,  5 Apr 2021 16:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2131.outbound.protection.outlook.com [40.107.237.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DFF4F80124
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 16:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFF4F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="C/VCd4d/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAge8xL3T3wmFu94xav/gMh10tRbKT9i81Ewt8Zy+ktKs6QAZNg1i1BwEADzV3BDfJOOI8anOsMwbFRSRiI4/RwccHRIJyKM91gNUyw2yaIoZALgJIhQ7l6k0VobpyecAvjAXHMQZE8iYi1StF0kgIbFRwKhwLWRTl9dJ1Kk4vTTbnWZjNKbIF5nfmyst6woDP8HrumhWfGpYx6sZqm4pRc7D9ksqckp3x1oGyaY6h39r3DPCx7u4L1YJUAZ0Ye4xtZieuJ65shq7Osn9dqu9mnaMs2yw5OK876ec3iB1ObaVYdw4JI4cn4Z9s7F6/ZvJwdf7geXa1nj8uESU8Haag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RcuHE8leoZamaeA8oo1pJ9JoH3oedSM/RTpN/QVUys=;
 b=Vz7w6LL6RuNuwy985aTIMVtrhRBBavDQKol1gG5HajBsI4B7/I5WhBV+R9UAFfhcelVziL7Ygo7GuXcJZUwPzToIpaXfv/+xmJHVCcFBFqWGZWEVUGTY2JhGwxky61ZMM+DWCllCVtdqhei0Ls08+zLrmsZwYDzwiM+9WS/j/cVCbRvZBjvEOQnwRy2f683tPIASd7aeFFTceCy/21mhXzdvT2Caw0NIEWjHTklbqaAejsbjZoikUb+DXjqQscs0WghfnJRbcjVDYbO4i02vNXx7Hmei9S6AjZoG/uKJBq6Qo1vyNJaa6FHUsKOjiX93kI4Y2VDKcmFEcmxf0f8e6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RcuHE8leoZamaeA8oo1pJ9JoH3oedSM/RTpN/QVUys=;
 b=C/VCd4d/VK0EpetpmsYCYgP1ZObnXJkqX8YZJ0EjuQfdZK0YQK2TaCuKe95Y/Ppd+y9sQ0ff4GxM9+GUq2APVcWRXK4JRyShqdI/zuSUs0tpxaaIpFCOQQ1AGvkm8i56G3q/9kQuaD8CTUzKjxz32TteJ8RO5AldR9LNP9CXLSE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Mon, 5 Apr
 2021 14:38:41 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::cc39:7519:2fa6:cc8b]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::cc39:7519:2fa6:cc8b%3]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 14:38:40 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, jack.yu@realtek.com,
 nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: max98390: Add support for tx slot configuration.
Date: Mon,  5 Apr 2021 23:38:01 +0900
Message-Id: <20210405143801.29770-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [125.129.66.126]
X-ClientProxiedBy: SLXP216CA0032.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:4::18) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (125.129.66.126) by
 SLXP216CA0032.KORP216.PROD.OUTLOOK.COM (2603:1096:100:4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Mon, 5 Apr 2021 14:38:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 913d78f0-0890-4a3a-28f2-08d8f84080e9
X-MS-TrafficTypeDiagnostic: MW3PR11MB4585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR11MB4585A4E8D04DA69A9D3E0B9E92779@MW3PR11MB4585.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:68;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GUw6aHWvUiQ0cIDxnwFjGMHNZRQOsXfTwlwgOFoXi/ES/coL15cVubgvkZL7IeISBcr5lBvqM4tJrn8fyj4blo66rcTtrPkuB1S/JQlUVIuIeNrLg7V1dYbHuivt4cUpZYKpJn8T8x4dJaBug4XvVwKCWkh06srZm5kJo7tdg6Y8uxY3tgs8qIuISA6sJfdiVjkIO5L5PB/iHDpW6lvvzxPP/0Qn/PsuXdLMJTB1egZfQsO3tN/ZuX5CFhRgY04UK7KbHTTOp3lD84PqFpPI2OW82s45eSnV+1OnWRd4E8sHtnFsS5jGhYXqebjLcDZRPpku4QF7q7S5tCr4GaR1bH3UyYJBk22bW5AQhw6adwZpasnIYUCu8Ymb62xjBXAlthHidu7OBaDlUo8DM9JctrrFfVD9/sj4d5vltDn0/zIiXHrVWgR4svUc/4viH5JW2DuU5t6AFAgmPYP9CKhdea1wRtMdcS+ctzvOmL4CQ7xH4MwN3+Crf7llPK4RaCDwVb7Yt0IoELXf3WD8jgpFvwFkzoyf38sei275RlDcFoADW/4JbgB+W26JF9qMutO/EYb5HwWOmCw35zuPDLS7oUkuIG+ENgQKq7MFe0WywTm4jUhWTOHOZ1R2dt1cbd7FENvxPSj8kXO7uMBc5pwMRxBCMeGQlzYAk5H6mI4PntiLGH6XS7oLcBGeVX634rHRTX8iRHBppdWPJ2DUwwMyAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(69590400012)(6486002)(26005)(6666004)(52116002)(478600001)(7416002)(5660300002)(8676002)(16526019)(1076003)(66476007)(6512007)(2616005)(38100700001)(83380400001)(956004)(66556008)(2906002)(186003)(4326008)(6506007)(86362001)(66946007)(36756003)(921005)(316002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?47xDlunmobmXCQqIsL/qFyt+tlZXth6PJTRMBij9yPpuXAIMeO0b3Xyki3rG?=
 =?us-ascii?Q?i6H5YLQUrJ2dQ+nLE84IskiXTpA4XmCfcdUWKM+Z080SxIzUfFr7uhOSn/j1?=
 =?us-ascii?Q?LDfAIHy9lTsENv4EJBNINGFcoSBL7WnzkkVOHGcsSGrIMPf9cIscG5ceaOeM?=
 =?us-ascii?Q?ivYJM0Fb2yLGjYuYEb+2SvEGhqfFGAtP04SnzsnUDhL79Qq6+XdXlD0I+LcF?=
 =?us-ascii?Q?HvoTtb8IcYkLk6521ROXRAM3oy6PRxXgyYeUwlbIgplI0idkH3NtTMI8wbvo?=
 =?us-ascii?Q?Bpuc1QIareXqXLAujwXbBY41hmoflJ5Yf/6gzfUBKIGvFHAuz3kTgxrOs0gg?=
 =?us-ascii?Q?Y/TNjDdRTVnADF8/qC+/US2vHK0KUnj9tA9W2piyMqV3sAYaDcqC0NtZNxmU?=
 =?us-ascii?Q?PT8U+H/zKcz/oMTaE1wzKJpxjB5bG0HIM2evoYLtUFKWaFAwYZskkzhV/kYB?=
 =?us-ascii?Q?BOWrYHxEIoY7zTbDyBHb9rEW/RET5L/iYaPAEEQQlCDBOdDRudBmRyUvOzQW?=
 =?us-ascii?Q?+vfTXcraBPOpRNtoyqSG5tWTOH0iEn9EMMyrUP320/98dqP/aOc3CKpP825i?=
 =?us-ascii?Q?LQP7TRshV47Q3+C2TALg4E3DTQxwa+fNLH6yzM875vdz8o9mP1YOQUPj+NTH?=
 =?us-ascii?Q?kQqRP3NXHeSAnxfsUoXgf9UdB3+BYTI/060eQXD4gqMAdvMIKt6e5mwpZzZ4?=
 =?us-ascii?Q?bcN73bdxuY9QeoxRswsEgrytk8a/UTskBtJbaTiHfomZdMRvfrOGW7hnT/YM?=
 =?us-ascii?Q?0YMBklRSwypItnKXwCacC2PF7e7K5crYBIAxJtzhnXLo+eHSSHlxszfJZQY+?=
 =?us-ascii?Q?crqqNvqW0lHt9MagTt3s7epmWzNFKZwAgSYhv3dJIYfzZkUjLynLOR4Fe2uc?=
 =?us-ascii?Q?QQtmrxV3QQ2S/Nq3GJ8bwnGTBLQpQK9rhkRcsUi/7vjwUmh1RoYDsHz4u5kj?=
 =?us-ascii?Q?Qm0aV8N4TsSqljPbD0Yp7ovzfm/aopY5d0wb9yOuPbxvy+lv7qwQzFWHvUNk?=
 =?us-ascii?Q?A24FJlV/MzJ3C4QM4X/SwoiAR6Sam9zHBBORvEQrE17vX0Db9ryP89iNmZvG?=
 =?us-ascii?Q?XZsoZpsyJvEhFyzvpK4dDJ1bwT6+TqDMAWosrzgU+slS4qE1QMxc4DEZXiVf?=
 =?us-ascii?Q?zDyMujvqrM8dfeETOky4BWFvUBPlEGtsI+SSiS+occO6IihFZ58jL1KYw5D2?=
 =?us-ascii?Q?XizSPXpRFSQEvtnE0DuxbtpNXPefKIFOpFSFLxuFXvtCtpYq0O+/bFZl5gTu?=
 =?us-ascii?Q?WDTFPBZmrLlIdI/w30ubNoHzIR7uV1geKMAwujgX8EqZX8pF/rm6ZAGwyTUG?=
 =?us-ascii?Q?v9/lxWNuaiwi8taFaKHOVT0j?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913d78f0-0890-4a3a-28f2-08d8f84080e9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 14:38:40.3337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCp2kQqjJLkR09rPfp406sfAYFKt8DjmbGoiaeJMVIqEnEvREzWBmA8AfuG8WutPr0lvxLL8BAscf49Cmo68ycMgffHYvZ1OwjA5FM4sHJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
Cc: ryan.lee.maxim@gmail.com, steves.lee.maxim@gmail.com
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

 Update voltage/current tx slot configuration support.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 62 +++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98390.h |  2 ++
 2 files changed, 64 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index bb736c44e68a..94773ccee9d5 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -856,6 +856,48 @@ static void max98390_init_regs(struct snd_soc_component *component)
 	regmap_write(max98390->regmap, MAX98390_ENV_TRACK_VOUT_HEADROOM, 0x0e);
 	regmap_write(max98390->regmap, MAX98390_BOOST_BYPASS1, 0x46);
 	regmap_write(max98390->regmap, MAX98390_FET_SCALING3, 0x03);
+
+	/* voltage, current slot configuration */
+	regmap_write(max98390->regmap,
+		MAX98390_PCM_CH_SRC_2,
+		(max98390->i_l_slot << 4 |
+		max98390->v_l_slot)&0xFF);
+
+	if (max98390->v_l_slot < 8) {
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_HIZ_CTRL_A,
+			1 << max98390->v_l_slot, 0);
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_EN_A,
+			1 << max98390->v_l_slot,
+			1 << max98390->v_l_slot);
+	} else {
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_HIZ_CTRL_B,
+			1 << (max98390->v_l_slot - 8), 0);
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_EN_B,
+			1 << (max98390->v_l_slot - 8),
+			1 << (max98390->v_l_slot - 8));
+	}
+
+	if (max98390->i_l_slot < 8) {
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_HIZ_CTRL_A,
+			1 << max98390->i_l_slot, 0);
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_EN_A,
+			1 << max98390->i_l_slot,
+			1 << max98390->i_l_slot);
+	} else {
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_HIZ_CTRL_B,
+			1 << (max98390->i_l_slot - 8), 0);
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_TX_EN_B,
+			1 << (max98390->i_l_slot - 8),
+			1 << (max98390->i_l_slot - 8));
+	}
 }
 
 static int max98390_probe(struct snd_soc_component *component)
@@ -946,6 +988,23 @@ static const struct regmap_config max98390_regmap = {
 	.cache_type       = REGCACHE_RBTREE,
 };
 
+static void max98390_slot_config(struct i2c_client *i2c,
+	struct max98390_priv *max98390)
+{
+	int value;
+	struct device *dev = &i2c->dev;
+
+	if (!device_property_read_u32(dev, "maxim,vmon-slot-no", &value))
+		max98390->v_l_slot = value & 0xF;
+	else
+		max98390->v_l_slot = 0;
+
+	if (!device_property_read_u32(dev, "maxim,imon-slot-no", &value))
+		max98390->i_l_slot = value & 0xF;
+	else
+		max98390->i_l_slot = 1;
+}
+
 static int max98390_i2c_probe(struct i2c_client *i2c,
 		const struct i2c_device_id *id)
 {
@@ -988,6 +1047,9 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 		__func__, max98390->ref_rdc_value,
 		max98390->ambient_temp_value);
 
+	/* voltage/current slot configuration */
+	max98390_slot_config(i2c, max98390);
+
 	/* regmap initialization */
 	max98390->regmap = devm_regmap_init_i2c(i2c, &max98390_regmap);
 	if (IS_ERR(max98390->regmap)) {
diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
index dff884f68e3e..e31516717d3b 100644
--- a/sound/soc/codecs/max98390.h
+++ b/sound/soc/codecs/max98390.h
@@ -658,6 +658,8 @@ struct max98390_priv {
 	unsigned int sysclk;
 	unsigned int master;
 	unsigned int tdm_mode;
+	unsigned int v_l_slot;
+	unsigned int i_l_slot;
 	unsigned int ref_rdc_value;
 	unsigned int ambient_temp_value;
 };
-- 
2.17.1

