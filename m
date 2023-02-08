Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E368EB52
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:27:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5F5827;
	Wed,  8 Feb 2023 10:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5F5827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675848415;
	bh=25Sclmbm8ljtwQsZL2HGXJCX5LxZk/37WX1zoN2XNFo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RiVcK22aiwycTmEPYkpoP1GkUOHIoiCSX/ypWZJkD2n7rFO6gmVIWUCTDKAiXX+nw
	 Kt6hCqr5cbKlVkgUoeDwTVyDN1crhQmWO3l1EUSJSX3hoimAxyrusnfXYBppK8ayIj
	 bxY5wCwsXDdl3UYHyUgEhlmbtERtvY8CiM93RwFI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 325F5F80095;
	Wed,  8 Feb 2023 10:25:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CEADF8051E; Wed,  8 Feb 2023 10:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6592F800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6592F800AF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/Wych67vRoOmVSLTNb1Sicsgx/uFFxPDYIVYtq8TOdF+Gyqo5bxnclHP2oYipCwiL1WQejpGf08INBetKR6Oanb1nSlKSXZZlSoOCzyv0tULufkQadYngUL4NgnCZ8zBG556QyonGPybsx4+Fcaa/3O3l82f8+TqJzV/pV6Aw3rqpn9yOSNl924Yg/YJeNnKBA9VNLcHBE1x6T62zbBYZ4GMchTkCwqA/UVtZo2QgV3a52DttFukRVP9dEwrmiD2IIcochSOwdHf313cQW2DnfAQtD4wGIPJQRM1ScxeG5GPV2AxNSmJ7j47c4ATDxkLhvjpLXsDUWiENciNSuyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa1aWAfp+KOl8P5MhFCqeqsJQ9iqNXquzDzUZOez6kE=;
 b=JMViDdjpOeqX72VhVpbC8/pIKTwjEKsJqRoyVA84ZepNTGD5MKhjrjsKE9RLSRH5JFhagb14q/edo4dLb6P3dIgWfquY9s1ddtP4ZVRxfghpH2nmC2MxQu1+sO8LRxc4dQh1ei8uwyHZq/9mO//ZWgRluVsSiDAZfwHXUonWbYlAynhvHROeEqF/P6Qe34keW7v3D21SCN+Yos+X7FcNDji9YW9nJCN8U48NA1l0rUwNemoVQmXuWh0I20/1/7pf/AGNIJ/WByEIjHHqAvY4CjwOd95KN91xSv88JOXQDP362co2xUCxQSBBFmFnms+88F1PeYRvl1HergODawhEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB0228.KORP216.PROD.OUTLOOK.COM (2603:1096:300:21::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17; Wed, 8 Feb 2023 09:24:55 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.035; Wed, 8 Feb 2023
 09:24:55 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/4] ASoC: SMA1303: Convert the TDM slot properties in
 devicetree to mixer
Date: Wed,  8 Feb 2023 09:24:18 +0000
Message-Id: <20230208092420.5037-6-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208092420.5037-5-kiseok.jo@irondevice.com>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:100:55::32) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB0228:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f7b406-80b0-4019-029f-08db09b65756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nvtrD1/sXuobtktjMW6KfTZ6tsWXbwS/IuWPDSh887LJiL/GiEOJTEp4Ifkrct599tYI88x2IofgvS7kiSyuHfLZXIQl6oUh3lB4Ch/cOGBMgFKd3G4N+P/HTa8V+vksgRbCTTR0GVgt4NKJAhm9qcNm/u5xDNOk7G/snfRXt+fcxc+HE3hS3xbwl3I5OWoHYVz4WWKrH/+IQLFcZf9hxHqmEw9J/rUs72HqR4D7cW5VwwQVHH6kLCBFzDJsSCqyMPPkGPNBL0q72qeKG6BaN9SvBR8eJGKW2SxUZuXz7wlO7yyaZSi7KUf9Hs8GljmM5yq8smqEmgX1kzkkNJ2BO+59QRWba8nfeLCh1JiOFjyv93OuuoD9gnq+LfqC+fd8o18o63+mGP3Yekldnz1wureVUpGOu8Nhe6G9b2+q5sFkF4K1OlJJUpMYFl2JGBErQC88AgCTyOm4dvhvTzsWGYCelYhsokPMaPnpUnhYAAcn8MC1ZfcKVMiark/ZkVaPQjabtqjeH0qDSskhLmPle+rEQILNXNYqS0JDKhmNKTX537EK5ACbNfi5ulZA2iL1+xZ9hqBtbq7C86JRLPLquMMdOBWwqTqCTsgNiuYfjySO9xk01w9cCa25HjDSNUzH/PgmmGl00iSXP9KB/i/zs1Pf5hjC+9ZQYvuJExB+SE1DHxN+wuxWWB+6hnPN6RcR7fDy3WPa5luOwQgbF9WXXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(366004)(136003)(39840400004)(451199018)(2906002)(52116002)(8936002)(36756003)(44832011)(110136005)(5660300002)(6486002)(478600001)(316002)(2616005)(38100700002)(38350700002)(6506007)(4326008)(8676002)(66556008)(66476007)(66946007)(1076003)(107886003)(186003)(26005)(86362001)(6512007)(83380400001)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KkmX0aXKY8kkE5O5W+a3uLvAi7GuVM8n7X8VHFn9X6dZBRQlrxCsSV4dq7Nl?=
 =?us-ascii?Q?S9M6TDFE2p/27F/d237LXmOB0GGjzKD8llspgCXQVqKFgWwnztubBcPQ+gnL?=
 =?us-ascii?Q?LbN0h48uD4LYpU+L4fDyiY2Ygp0MhPQtNSrNFa9A46yjf8QCEeVN8M3aUG4e?=
 =?us-ascii?Q?sG47fSMOVSqWoawZ64U8KiVyLcDiICO/MbpU06xvZPtPIGD28T+frJmXqIE9?=
 =?us-ascii?Q?O8kuQhIK4FSRBLttOf2iIh3+fyRt+XQy+GSS9S/EKjQIBhXYHCGwke8qXzVU?=
 =?us-ascii?Q?b3GuuBw8R8zjbJhZ8FkQ/poNGF7y6k9OieFCgnsTBzdKwDDAiDXBCLeKkmZ/?=
 =?us-ascii?Q?0So8rrT/3A3YpvIqApZ3KjR151LQ35+LW1dxlBjXos3ALH6N/mfY775ZC8kC?=
 =?us-ascii?Q?2eoTyfX2DKevArla8zgJtgsrbIunjBn6SwOAqg3NEmtJj8c0AM+q8g2DIHca?=
 =?us-ascii?Q?H9ZwUUoICPeDhViBq/mnstdzccGrveNk9WToVa1+N3jLsidvTHsxaGEsiv+q?=
 =?us-ascii?Q?r4qtwwEypz3jfK5+vzjNVqeN1S1yzyffehgUg3PqASKudbvJwnNPn0hNMbrR?=
 =?us-ascii?Q?lTf93bVUz1ushgXzN+FXmBypFhpwS7Wf3nJxDSQeWfDW6o3dHuTeS6gMt5HM?=
 =?us-ascii?Q?4fIY3wyBA3jAAWy7nbUkMZKNYYmTw5hqhWjHlkQGEVABCY+WBJfvQMrR+Sty?=
 =?us-ascii?Q?adEPeSmurwkJrHua6ukMu0xQGEDtd5Mhh8QNJjHENt+ORRKg9gTAYGCsUyNy?=
 =?us-ascii?Q?oRm0LNT6i/fq5MV6wiGMnhSgqoltGe1xqGI4LxTmJbxhufuIK+7VgsfNWFFp?=
 =?us-ascii?Q?HvjKlM6WMfd7gJULgZ/b7WbE3YuZgN/fem3ZR46T22Rq5gKT3yfuVpqXFoKM?=
 =?us-ascii?Q?3w6xKZCCnA/xF15aRcMSS6ljN5eOyR5lDvMcyRb/pbKl94VjaMWcSo9GY0d7?=
 =?us-ascii?Q?S/vx8GMM2daWPFL6lUpKzhgwIB4zK9gZhqCbUFlJXPuarfF2Nm+Z4H0iQkHw?=
 =?us-ascii?Q?R8JrGrcWa2bZ9ykPuODyK1CcHFZ2L8IV1wY3QhuNCAZnDVkTnhWsnvK60N3G?=
 =?us-ascii?Q?7e538hFYFOcDgdCVL1LdVGREZYDGk5KROZkYyo3uQWStDuVmF0cbUFjNhjyL?=
 =?us-ascii?Q?n1vm1UGn4dzfTDaiLi3208kMllENRhxHq9aHGaWwTLOo/YXZlV7DTVJb4swI?=
 =?us-ascii?Q?HYis+wIz9HasmGQRjcPvR0kApcUKzU/BoPu+f4JtYSlpmvWVW74+wCr/4HUj?=
 =?us-ascii?Q?q1FpQWnd2LnUWUKur5nH1hRg22AaIGWQTO++Nvcm5CHzkUXxMRcqJBHMNZfh?=
 =?us-ascii?Q?JqgBPdx+ZfTZb2WppjlMQFqTyzqTy6pTdcn0kiB5gx6OF4WM9bSA9SSIQYaN?=
 =?us-ascii?Q?FOwXncLm/bdRT3V2TpBJjPuoLfzas2Dt76k/LPux54QxlnoQekWXGc5x0msd?=
 =?us-ascii?Q?WAXEgwrzCcUC3RJl+x3kzHH5dg+etrqLBg91GMZX+kkoDAtuxkokxMOeQ1DC?=
 =?us-ascii?Q?DuPPNIkooLpZGmGHPGieNJONxyVQ5hwFKoexJa6Xl0PVdBZzla+UGMEFzWXt?=
 =?us-ascii?Q?D/RArKRit5xHl9rHFenkJ47MFDYMaaUOkiJHAjdY6g04lMVsNV+Q3GZhw8FK?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 22f7b406-80b0-4019-029f-08db09b65756
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:24:55.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7E3ZhNoGa/VIqzXmIVyuwRRkGCCZ9IXnQuQlpdLZOyY8UgJod/+E4uiOq8iZUX+Se+3CSjleg5VaYrDcUvDK5IL+m1fAZUFgyQI46RmPaow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0228
Message-ID-Hash: L4BPHI42MR7YCPRVQUYTYWJQ7J5CJM66
X-Message-ID-Hash: L4BPHI42MR7YCPRVQUYTYWJQ7J5CJM66
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Kiseok Jo <kiseok.jo@irondevice.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4BPHI42MR7YCPRVQUYTYWJQ7J5CJM66/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It seems correct that the user changes the TDM slot needed after
device probe.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 100 ++++++++++++++++++++++++++++++-------
 1 file changed, 82 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index fdcc40f5fc61..9ae4e3cba3ae 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -292,6 +292,9 @@ static const char * const sma1303_aif_in_source_text[] = {
 static const char * const sma1303_aif_out_source_text[] = {
 	"Disable", "After_FmtC", "After_Mixer", "After_DSP", "After_Post",
 		"Clk_PLL", "Clk_OSC"};
+static const char * const sma1303_tdm_slot_text[] = {
+	"Slot0", "Slot1", "Slot2", "Slot3",
+	"Slot4", "Slot5", "Slot6", "Slot7"};
 
 static const struct soc_enum sma1303_aif_in_source_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_in_source_text),
@@ -299,6 +302,9 @@ static const struct soc_enum sma1303_aif_in_source_enum =
 static const struct soc_enum sma1303_aif_out_source_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_out_source_text),
 			sma1303_aif_out_source_text);
+static const struct soc_enum sma1303_tdm_slot_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_tdm_slot_text),
+			sma1303_tdm_slot_text);
 
 static int sma1303_force_mute_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
@@ -368,6 +374,76 @@ static int sma1303_postscaler_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
+static int sma1303_tdm_slot_rx_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int val, ret;
+
+	ret = sma1303_regmap_read(sma1303, SMA1303_A5_TDM1, &val);
+	if (ret < 0)
+		return -EINVAL;
+
+	ucontrol->value.integer.value[0] = (val & 0x38) >> 3;
+	sma1303->tdm_slot_rx = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int sma1303_tdm_slot_rx_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret, val = (int)ucontrol->value.integer.value[0];
+	bool change;
+
+	ret = sma1303_regmap_update_bits(sma1303,
+			SMA1303_A5_TDM1, 0x38, (val << 3), &change);
+	if (ret < 0)
+		return -EINVAL;
+
+	return change;
+}
+
+static int sma1303_tdm_slot_tx_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int val, ret;
+
+	ret = sma1303_regmap_read(sma1303, SMA1303_A6_TDM2, &val);
+	if (ret < 0)
+		return -EINVAL;
+
+	ucontrol->value.integer.value[0] = (val & 0x38) >> 3;
+	sma1303->tdm_slot_tx = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int sma1303_tdm_slot_tx_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret, val = (int)ucontrol->value.integer.value[0];
+	bool change;
+
+	ret = sma1303_regmap_update_bits(sma1303,
+			SMA1303_A6_TDM2, 0x38, (val << 3), &change);
+	if (ret < 0)
+		return -EINVAL;
+
+	return change;
+}
+
 static int sma1303_startup(struct snd_soc_component *component)
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
@@ -781,6 +857,10 @@ static const struct snd_kcontrol_new sma1303_snd_controls[] = {
 		sma1303_force_mute_get, sma1303_force_mute_put),
 	SOC_SINGLE_EXT("Postscaler Gain", SMA1303_90_POSTSCALER, 1, 0x30, 0,
 		sma1303_postscaler_get, sma1303_postscaler_put),
+	SOC_ENUM_EXT("TDM RX Slot Position", sma1303_tdm_slot_enum,
+			sma1303_tdm_slot_rx_get, sma1303_tdm_slot_rx_put),
+	SOC_ENUM_EXT("TDM TX Slot Position", sma1303_tdm_slot_enum,
+			sma1303_tdm_slot_tx_get, sma1303_tdm_slot_tx_put),
 };
 
 static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
@@ -1621,24 +1701,6 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 	}
 
 	if (np) {
-		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
-			dev_dbg(&client->dev,
-				"tdm slot rx is '%d' from DT\n", value);
-			sma1303->tdm_slot_rx = value;
-		} else {
-			dev_dbg(&client->dev,
-				"Default setting of tdm slot rx is '0'\n");
-			sma1303->tdm_slot_rx = 0;
-		}
-		if (!of_property_read_u32(np, "tdm-slot-tx", &value)) {
-			dev_dbg(&client->dev,
-				"tdm slot tx is '%u' from DT\n", value);
-			sma1303->tdm_slot_tx = value;
-		} else {
-			dev_dbg(&client->dev,
-				"Default setting of tdm slot tx is '0'\n");
-			sma1303->tdm_slot_tx = 0;
-		}
 		if (!of_property_read_u32(np, "sys-clk-id", &value)) {
 			switch (value) {
 			case SMA1303_EXTERNAL_CLOCK_19_2:
@@ -1719,6 +1781,8 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 	sma1303->last_over_temp = 0xC0;
 	sma1303->tsdw_cnt = 0;
 	sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
+	sma1303->tdm_slot_rx = 0;
+	sma1303->tdm_slot_tx = 0;
 
 	sma1303->dev = &client->dev;
 	sma1303->kobj = &client->dev.kobj;
-- 
2.20.1

