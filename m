Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5841B65FD71
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:18:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4403C1412A;
	Fri,  6 Jan 2023 10:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4403C1412A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996699;
	bh=QHZxwF0mVVrUqe4TokdvDgehbwetzR51FC52Y6/w5BI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uXLmfSFVl8Gdl+dneKz3eBa0xrLYA5fbbWWFBz2uG1N5XAch8tk4/Mwj+mcEL+0BI
	 mmA6vospwsg4CtyhT+KYo5tH03j47c24mAdlXn/LjSLsUrFTXN2Viqh3rp/KieUFtu
	 EEY7lanSWpNX7Vm31Jpc9QF448c4+cebcaAAkLrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A815EF8057D;
	Fri,  6 Jan 2023 10:16:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07646F8055C; Fri,  6 Jan 2023 10:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2059.outbound.protection.outlook.com [40.107.129.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3404FF80549
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3404FF80549
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgbsB5R4YHFOMF3mzebu/1gzLwxXNo/PQFdkbXMx6PCWlOdX7ltBVpQNzauEmq3qoLr5j9hLi7Tx6aMF3fMJqZx2uLEg46qrrnWLWYL/BkWGNVcAj851DuU1TBVdIRoUj9NxeA2pfKwIMY8YesKYLNzKDMRy6hD0Gh7OVSqv1xp272w8BghLDA6jShf4y3hHcYLRHfU0hKKz2WUpw8pR1xBaQ5hyrrpYerNkNdbImJ/eIXExqrC3yCgeosWSmGxWLIhD0JW0wPJFgVztRfE0rCBm7BEH54JfFaWB0tabwQPc/+Wj5c/4YubWv1m9GFWo5rpkGl0FKl2Q57Iam99c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va+v5mkjsJfDKO23AXIsMwUF9gsFy3rLjlNX4KjDg9A=;
 b=S5xAR4uNe/lUfKfXNpdvgWMzoFeekzuMiGWqVdQGmKbQi9zre8vHlbbXj4TX6VC1DKR9jICzqhhzHkfoHi8fKxy8DP1xdNgMekyD6mA1ryNxdPl0JfvT+At6Q07RNanjmPaQ29dKaX6maBh62N6IlMWFuv6w3Jq8+3e3TC4WuIZD3nWHhVTaaPELeeVLeFByTdzzS0vGTncoAjmDZNJoDVmzcEteHHNzfRUf6Y78lgOSRqj54gO6jA9IbM92AJLFT4oz68DpwL7uXCa0z3srvwtBoCjRHAJapG72X8WF81HGhFYIAQRy2m/rjSfcTzasbN19oq91HsgoUne6E9bolA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:57 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:57 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 05/14] Change the DAPM route and widgets
Date: Fri,  6 Jan 2023 18:15:34 +0900
Message-Id: <20230106091543.2440-6-kiseok.jo@irondevice.com>
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
X-MS-Office365-Filtering-Correlation-Id: 13009c5b-0301-45c0-531b-08daefc69eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wrj8gONE5uz8o+Yo0Af3Po/erDrXimAtauz7hSdiYya9zWLHyW3GhgJT1g7o3SSbhsACreTBwp8ZZsKlw/SKxy/k8qd2WkAckhcHtDdrFJSOv/pKZjIno4ryVe96xuZnOg4iXOnKSdDuaIBK+IPIUQHIJ6RheNPIDZrv+wpo084BSfpXxr+IR37XHf7NqjB/KrYgaOCSRewCKpu+gCG8fp2xUYKq1cvJa2kAPRtb3//qanmboxEa18vbvyxdrIC42hbxJxFC8LJ1D96EvHvKoIaASr9apHOhyQwQpE3SpqwgYOC53ZBsVK2Qa6kNDUtw4y3Wul3x7COzAShUDKVCuxG3RkmJItIs6TlwW9Qh+odgYwRoCViIQ37M27mXu5lgGfklir2ifzSQtma3r0h5DXICCq8Dc+GbhsH32PEOcSqKjIdD77DRm0C9xC5oCUHma5ITpMM79N3h4UFMX+9Wowssu1MgNhRvlmKUYHj37ZMvAkXnxkU6NGGZrBcS2a1VEAwHtU7ueszYJyDJD6WPvJElFkBzEsCmW2v2l8FlCIn7TD9M7uWkYI8wYXtRtyw62/IAWtZm2qZg8ht3dPq9qn1bYZ7htvVMWYZcMDYtkEpK/gjgcihqpYATom2cDmX9+OhiQx/KER4wYcQSugpvIOS8P7jB3qIf3qm6tpXVaagRR8igQmCTR3Qn/nBfXenYw4bxiM8FPKkqal55o1ZmtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(30864003)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iqLNZzaCkv+Oyp6TxdTPnMUxWqksWTDSOvpew8xS9wmaKOik9PZ85mdn+Hvw?=
 =?us-ascii?Q?nW4HSQzHu1BwJ3rSdpjDBrkUGPeSIjo88I/xkc3J0s36DCQKe88oHN1deAUS?=
 =?us-ascii?Q?s17WSTiMBC6RJlCwxhPux/OVGsgsW6tsBG0HSkqLESZPXVf0iCBR1MgdfQ/N?=
 =?us-ascii?Q?Kb3fxgoAz2vQqsTYBZkiJEYFyeFpeAXycwzYFRSXLcp3K1FRQ2Brx46pxGvx?=
 =?us-ascii?Q?W5gR54Y/f0Nfj0UdN5j/L7xuW3TPNxj2DXNYqZwrtOLmvQnrBFyqIottZ0Zs?=
 =?us-ascii?Q?of8ctLiau1EBPr7kpy3exhQ7RFS1+rmlc6ur38h9O8FEQa54sL/a1/RAmIo0?=
 =?us-ascii?Q?gtbn3fAu+X0+pSV6o/EI0gtb+kzfZpkHDixOXpQVRMopr3jadJhentA4fD00?=
 =?us-ascii?Q?hrwoMNnOiYWYZ2K0voSbVTe9niRJ7LLGibM+WxuB4zG4FBEmf5XUZuEQ6cj7?=
 =?us-ascii?Q?F76y4r1iJyam2a2eYIalSMcqKlXf8GiXOhbLwhwShfq4HNeABgnEOLYyZg+6?=
 =?us-ascii?Q?ShLZfHUfqnm/5Zn41feoxIp1jcTvaTM+F4GHDIVlJ2+xq53+nJXvdx0w1iRM?=
 =?us-ascii?Q?y6z/OvHkw5HgwHilPI8WHPJ28v6bd3y1pVZ1DnbRR1KpXVt254FrSsd9ZK98?=
 =?us-ascii?Q?VOz93oKUcpjGZagfmYosmVnwdigiM/dMT6V4PQynQhExb4zqw7iHq3smIWJc?=
 =?us-ascii?Q?ll4RSG/hoDUrNq5gugSM5t5f+FyGJ9wCzSbv1ibXnrqBx4ZpIT+EjIGZS8Nu?=
 =?us-ascii?Q?oX/0iSpTTj7Ev9enr5t8efsuFnZF+gyQYZvqkA+vKQ0oykuY6DeM/zeM8280?=
 =?us-ascii?Q?b1LfUG7KIaIgo8+13tz7mjTEtyOcJ6q1GxBhFjYHplxm96XcRLkMvI2ryWc4?=
 =?us-ascii?Q?974B2imjhUTLu0UA8iMx1g2LpEd61qRau5Is1SLChO6Le0CGj4sHCJdKLHWw?=
 =?us-ascii?Q?8eFtMNUGdUL+Pz5cWSFHHBMLhSHi09zklKEhHTb7fkswOrdhk8BwPQgjbvy2?=
 =?us-ascii?Q?lDOY1VLl3sd26e6AKBkCkjlw60jztM3sqFEk9cC+lDMGKnJbZX0iTrS+Kuv3?=
 =?us-ascii?Q?e9n/1R/7ckXZYKeFdGYLeBomdjYs2bk3+KKCUr1hMn1MA77n/LSTGKTo4A5/?=
 =?us-ascii?Q?dYA+dwb57cEMwIkb3vmTbb6uRKs3GBDNxlMzyUrGhutixifpTs3GAqpaBTXI?=
 =?us-ascii?Q?lBtYlPDTtNE07ACgb8ankMdUCURtrs1f+67YqzN4SWGd+oMWMLvmF2Su7BO8?=
 =?us-ascii?Q?pEpygGdIFZ29AUABB6drqVZSeh+8wBDm8zhjTqltuXgS4GNiHRAwiUQOlT9m?=
 =?us-ascii?Q?H1dqBFjMkpKhtMgGJHiyBRuUIcvgx3afIXc3fV0JscSrzINxoVhf0NnQa+ed?=
 =?us-ascii?Q?+aByNqwj3pkKxMfnTuBYZ5rV7DLbZ4+rG9ghaNhjcqPp02liOm3yv5EvptRc?=
 =?us-ascii?Q?Tdd33G++zvc5O/FM506XqMwIfTrKWtZXGDVRh3AjVO+HMJVQCC0Al9JebD2V?=
 =?us-ascii?Q?Ji4koHzcIG2/Yj0Hb+3Agr1++vqxrIgfBHNx3G+piwQZWdnYjYZtlakfGJnC?=
 =?us-ascii?Q?TjaoaX7E4zM+SVAkRaJTsKLEFtoe+hkT1FjO3W2O?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13009c5b-0301-45c0-531b-08daefc69eae
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:57.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMgz430QBkBF/D48cHKXVp0hSJpWJc81e/FJmIwn5zDqkjyQ0I/pruEd+XrApdaA6iJxYv1zghOCeyr2Ly5nAsANJoQ01Ps0qbnKCilRMOc=
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

Remove the control of 'amp_mode', and add the 'AIF IN' in DAPM.
Remove the outport and add SDO Enable event in DAPM.
In DAPM, instead of DAC and ADC, AIF IN & OUT were used,
and AMP power control was added.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sma1303.c | 644 ++++++++++++++-----------------------
 sound/soc/codecs/sma1303.h |   8 +-
 2 files changed, 253 insertions(+), 399 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index f78cd2daad61..1ef0b145f5ba 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -374,190 +374,6 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const char * const sma1303_amp_mode_text[] = {
-	"1 Chip", "Mono on 2 chips", "Left in 2 chips", "Right in 2chips"};
-
-static const struct soc_enum sma1303_amp_mode_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_amp_mode_text),
-			sma1303_amp_mode_text);
-static int sma1303_amp_mode_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-	ucontrol->value.integer.value[0] = sma1303->amp_mode;
-
-	switch (sma1303->amp_mode) {
-	case ONE_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier 1 Chip Solution\n");
-		break;
-	case MONO_TWO_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier Mono 2 Chips Solution\n");
-		break;
-	case LEFT_TWO_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier Stereo(Left) 2 Chips Solution\n");
-		break;
-	case RIGHT_TWO_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier Stereo(Right) 2 Chips Solution\n");
-		break;
-	default:
-		dev_err(component->dev, "Invalid Value");
-		return ret;
-	}
-	return 0;
-
-}
-
-static int sma1303_amp_mode_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = 0;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return -1;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return -1;
-	}
-
-	sma1303->amp_mode = ucontrol->value.integer.value[0];
-
-	switch (sma1303->amp_mode) {
-	case ONE_CHIP_SOLUTION:
-	case MONO_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_11_SYSTEM_CTRL2,
-				MONOMIX_MASK, MONOMIX_ON);
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_11_SYSTEM_CTRL2,
-				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
-		break;
-	case LEFT_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_11_SYSTEM_CTRL2,
-				MONOMIX_MASK, MONOMIX_OFF);
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_11_SYSTEM_CTRL2,
-				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
-		break;
-	case RIGHT_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_11_SYSTEM_CTRL2,
-				MONOMIX_MASK, MONOMIX_OFF);
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_11_SYSTEM_CTRL2,
-				LR_DATA_SW_MASK, LR_DATA_SW_SWAP);
-		break;
-	default:
-		dev_err(component->dev, "Invalid Value");
-		ret += -1;
-	}
-
-	return ret;
-}
-
-static const char * const sma1303_outport_config_text[] = {
-	"Enable", "Disable"};
-
-static const struct soc_enum sma1303_outport_config_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_outport_config_text),
-			sma1303_outport_config_text);
-
-static int sma1303_outport_config_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1, data, val;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	ret = sma1303_regmap_read(sma1303, SMA1303_09_OUTPUT_CTRL, &data);
-	if (ret < 0) {
-		dev_err(component->dev,
-			"Failed to read, register: %x ret: %d\n",
-				SMA1303_09_OUTPUT_CTRL, ret);
-		return ret;
-	}
-
-	val = data & PORT_CONFIG_MASK;
-	switch (val) {
-	case INPUT_PORT_ONLY:
-		ucontrol->value.integer.value[0] = 1;
-		break;
-	case OUTPUT_PORT_ENABLE:
-		ucontrol->value.integer.value[0] = 0;
-		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x value: %d\n",
-					SMA1303_09_OUTPUT_CTRL, val);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int sma1303_outport_config_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int val, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	switch (sel) {
-	case 0:
-		val = OUTPUT_PORT_ENABLE;
-		break;
-	case 1:
-		val = INPUT_PORT_ONLY;
-		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_09_OUTPUT_CTRL);
-		return ret;
-	}
-
-	return sma1303_regmap_update_bits(sma1303,
-			SMA1303_09_OUTPUT_CTRL, PORT_CONFIG_MASK, val);
-}
-
 static const char * const sma1303_spkmute_text[] = {
 	"Unmute", "Mute"};
 
@@ -566,111 +382,6 @@ static const struct soc_enum sma1303_spkmute_enum =
 			ARRAY_SIZE(sma1303_spkmute_text),
 			sma1303_spkmute_text);
 
-static const char * const sma1303_spkmode_text[] = {
-	"Off", "On"};
-
-static const struct soc_enum sma1303_spkmode_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spkmode_text),
-	sma1303_spkmode_text);
-
-static int sma1303_spkmode_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val, data, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	ret = sma1303_regmap_read(sma1303, SMA1303_10_SYSTEM_CTRL1, &data);
-	if (ret < 0) {
-		dev_err(component->dev,
-			"Failed to read, register: %x ret: %d\n",
-				SMA1303_10_SYSTEM_CTRL1, ret);
-		return ret;
-	}
-
-	val = data & SPK_MODE_MASK;
-	if (sma1303->amp_mode == ONE_CHIP_SOLUTION) {
-		switch (val) {
-		case SPK_OFF:
-			ucontrol->value.integer.value[0] = 0;
-			break;
-		case SPK_MONO:
-			ucontrol->value.integer.value[0] = 1;
-			break;
-		default:
-			dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_10_SYSTEM_CTRL1);
-			return ret;
-		}
-	} else {
-		switch (val) {
-		case SPK_OFF:
-			ucontrol->value.integer.value[0] = 0;
-			break;
-		case SPK_STEREO:
-			ucontrol->value.integer.value[0] = 1;
-			break;
-		default:
-			dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_10_SYSTEM_CTRL1);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-static int sma1303_spkmode_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int val, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	switch (sel) {
-	case 0:
-		val = SPK_OFF;
-		break;
-	case 1:
-		if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
-			val = SPK_MONO;
-		else
-			val = SPK_STEREO;
-		break;
-	default:
-		dev_err(component->dev,
-			"Invalid value, register: %x\n",
-				SMA1303_10_SYSTEM_CTRL1);
-		return ret;
-	}
-
-	return sma1303_regmap_update_bits(sma1303,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, val);
-}
-
 static int postscaler_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
@@ -852,41 +563,18 @@ static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
 			SMA1303_A4_TOP_MAN3, O_FORMAT_MASK, val);
 }
 
-static const char * const sma1303_sdo_source_texts[] = {
-	"Disable", "Format_C", "Mixer_Out", "After_DSP", "After_Post"};
-static const unsigned int sma1303_sdo_source_values[] = {
-	OUT_SEL_DISABLE,
-	FORMAT_CONVERTER,
-	MIXER_OUTPUT,
-	SPEAKER_PATH,
-	POSTSCALER_OUTPUT};
-static SOC_VALUE_ENUM_SINGLE_DECL(sma1303_sdo_source_enum,
-		SMA1303_09_OUTPUT_CTRL,
-		0, PORT_OUT_SEL_MASK,
-		sma1303_sdo_source_texts,
-		sma1303_sdo_source_values);
-static const struct snd_kcontrol_new sma1303_sdo_source_mux =
-	SOC_DAPM_ENUM("SDO Source", sma1303_sdo_source_enum);
-static const struct snd_kcontrol_new sma1303_enable_control =
-	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+static const char * const sma1303_aif_in_source_text[] = {
+	"Mono", "Left", "Right"};
+static const char * const sma1303_aif_out_source_text[] = {
+	"Disable", "After_FmtC", "After_Mixer", "After_DSP", "After_Post",
+		"Clk_PLL", "Clk_OSC"};
 
-static const struct snd_kcontrol_new sma1303_snd_controls[] = {
-SOC_ENUM_EXT("Amplifier Mode", sma1303_amp_mode_enum,
-	sma1303_amp_mode_get, sma1303_amp_mode_put),
-SOC_ENUM_EXT("Outport config", sma1303_outport_config_enum,
-	sma1303_outport_config_get, sma1303_outport_config_put),
-SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
-		0, 167, 1, sma1303_spk_tlv),
-SOC_ENUM("Speaker Mute Switch", sma1303_spkmute_enum),
-SOC_ENUM_EXT("Speaker Output", sma1303_spkmode_enum,
-	sma1303_spkmode_get, sma1303_spkmode_put),
-SND_SOC_BYTES_EXT("Postscaler Set", 1,
-		postscaler_get, postscaler_put),
-SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
-	sma1303_postscaler_config_get, sma1303_postscaler_config_put),
-SOC_ENUM_EXT("Output Format", sma1303_o_format_enum,
-	sma1303_o_format_get, sma1303_o_format_put),
-};
+static const struct soc_enum sma1303_aif_in_source_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_in_source_text),
+			sma1303_aif_in_source_text);
+static const struct soc_enum sma1303_aif_out_source_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_out_source_text),
+			sma1303_aif_out_source_text);
 
 static int sma1303_startup(struct snd_soc_component *component)
 {
@@ -905,7 +593,7 @@ static int sma1303_startup(struct snd_soc_component *component)
 	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_ON);
 
-	if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
+	if (sma1303->amp_mode == SMA1303_MONO)
 		ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_MONO);
 	else
@@ -963,62 +651,157 @@ static int sma1303_shutdown(struct snd_soc_component *component)
 	return ret;
 }
 
-static int sma1303_clk_supply_event(struct snd_soc_dapm_widget *w,
+static int sma1303_aif_in_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
+			snd_soc_dapm_to_component(w->dapm);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
-	break;
+		switch (mux) {
+		case 0:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					MONOMIX_MASK,
+					MONOMIX_ON);
+			ret += sma1303->amp_mode = SMA1303_MONO;
+			break;
+		case 1:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					MONOMIX_MASK,
+					MONOMIX_OFF);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					LR_DATA_SW_MASK,
+					LR_DATA_SW_NORMAL);
+			ret += sma1303->amp_mode = SMA1303_STEREO;
+			break;
+		case 2:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					MONOMIX_MASK,
+					MONOMIX_OFF);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					LR_DATA_SW_MASK,
+					LR_DATA_SW_NORMAL);
+			sma1303->amp_mode = SMA1303_STEREO;
+			break;
+		default:
+			dev_err(sma1303->dev, "%s : Invald value (%d)\n",
+								__func__, mux);
+			return -EINVAL;
+		}
 
-	case SND_SOC_DAPM_POST_PMD:
-		dev_info(component->dev, "%s : POST_PMD\n", __func__);
-	break;
+		dev_info(sma1303->dev, "%s : Source : %s\n", __func__,
+					sma1303_aif_in_source_text[mux]);
+		break;
 	}
-
-	return 0;
+	return ret;
 }
 
-static int sma1303_dac_event(struct snd_soc_dapm_widget *w,
+static int sma1303_aif_out_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
+			snd_soc_dapm_to_component(w->dapm);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
-
-		sma1303_startup(component);
-
-		break;
-
-	case SND_SOC_DAPM_POST_PMU:
-		dev_info(component->dev, "%s : POST_PMU\n", __func__);
-
-		break;
-
-	case SND_SOC_DAPM_PRE_PMD:
-		dev_info(component->dev, "%s : PRE_PMD\n", __func__);
-
-		sma1303_shutdown(component);
-
-		break;
-
-	case SND_SOC_DAPM_POST_PMD:
-		dev_info(component->dev, "%s : POST_PMD\n", __func__);
+		switch (mux) {
+		case 0:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					TEST_CLKO_EN_MASK,
+					NORMAL_SDO);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					PORT_OUT_SEL_MASK,
+					OUT_SEL_DISABLE);
+			break;
+		case 1:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					TEST_CLKO_EN_MASK,
+					NORMAL_SDO);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					PORT_OUT_SEL_MASK,
+					FORMAT_CONVERTER);
+			break;
+		case 2:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					TEST_CLKO_EN_MASK,
+					NORMAL_SDO);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					PORT_OUT_SEL_MASK,
+					MIXER_OUTPUT);
+			break;
+		case 3:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					TEST_CLKO_EN_MASK,
+					NORMAL_SDO);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					PORT_OUT_SEL_MASK,
+					SPEAKER_PATH);
+			break;
+		case 4:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					TEST_CLKO_EN_MASK,
+					NORMAL_SDO);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					PORT_OUT_SEL_MASK,
+					POSTSCALER_OUTPUT);
+			break;
+		case 5:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					TEST_CLKO_EN_MASK,
+					CLK_OUT_SDO);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					MON_OSC_PLL_MASK,
+					PLL_SDO);
+			break;
+		case 6:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					TEST_CLKO_EN_MASK,
+					CLK_OUT_SDO);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					MON_OSC_PLL_MASK,
+					PLL_OSC);
+			break;
+		default:
+			dev_err(sma1303->dev, "%s : Invald value (%d)\n",
+								__func__, mux);
+			return -EINVAL;
+		}
 
+		dev_info(sma1303->dev, "%s : Source : %s\n", __func__,
+					sma1303_aif_out_source_text[mux]);
 		break;
 	}
-
-	return 0;
+	return ret;
 }
 
-static int sma1303_dac_feedback_event(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *kcontrol, int event)
+static int sma1303_sdo_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
@@ -1027,59 +810,132 @@ static int sma1303_dac_feedback_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		dev_info(component->dev,
-				"%s : DAC feedback ON\n", __func__);
+		dev_info(sma1303->dev,
+			"%s : SND_SOC_DAPM_PRE_PMU\n", __func__);
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_09_OUTPUT_CTRL,
-				PORT_CONFIG_MASK|PORT_OUT_SEL_MASK,
-				OUTPUT_PORT_ENABLE|SPEAKER_PATH);
-
+				PORT_CONFIG_MASK,
+				OUTPUT_PORT_ENABLE);
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A3_TOP_MAN2,
-				SDO_OUTPUT_MASK, NORMAL_OUT);
+				SDO_OUTPUT_MASK,
+				NORMAL_OUT);
 		break;
-
-	case SND_SOC_DAPM_PRE_PMD:
-		dev_info(component->dev,
-				"%s : DAC feedback OFF\n", __func__);
+	case SND_SOC_DAPM_POST_PMD:
+		dev_info(sma1303->dev,
+			"%s : SND_SOC_DAPM_POST_PMD\n", __func__);
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_09_OUTPUT_CTRL,
-				PORT_OUT_SEL_MASK, OUT_SEL_DISABLE);
-
+				PORT_CONFIG_MASK,
+				INPUT_PORT_ONLY);
 		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_A3_TOP_MAN2, SDO_OUTPUT_MASK,
+				SMA1303_A3_TOP_MAN2,
+				SDO_OUTPUT_MASK,
 				HIGH_Z_OUT);
 		break;
 	}
+	return ret;
+}
+
+static int sma1303_power_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		dev_info(sma1303->dev,
+			"%s : SND_SOC_DAPM_POST_PMU\n", __func__);
+		ret = sma1303_startup(component);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		dev_info(sma1303->dev,
+			"%s : SND_SOC_DAPM_PRE_PMD\n", __func__);
+		ret = sma1303_shutdown(component);
+		break;
+	}
 	return ret;
 }
 
+static const struct snd_kcontrol_new sma1303_aif_in_source_control =
+	SOC_DAPM_ENUM("AIF IN Source", sma1303_aif_in_source_enum);
+static const struct snd_kcontrol_new sma1303_aif_out_source_control =
+	SOC_DAPM_ENUM("AIF OUT Source", sma1303_aif_out_source_enum);
+static const struct snd_kcontrol_new sma1303_sdo_control =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+static const struct snd_kcontrol_new sma1303_enable_control =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+static const struct snd_kcontrol_new sma1303_snd_controls[] = {
+SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
+		0, 167, 1, sma1303_spk_tlv),
+SOC_ENUM("Speaker Mute Switch", sma1303_spkmute_enum),
+SND_SOC_BYTES_EXT("Postscaler Set", 1,
+		postscaler_get, postscaler_put),
+SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
+	sma1303_postscaler_config_get, sma1303_postscaler_config_put),
+SOC_ENUM_EXT("Output Format", sma1303_o_format_enum,
+	sma1303_o_format_get, sma1303_o_format_put),
+};
+
 static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
-SND_SOC_DAPM_SUPPLY("CLK_SUPPLY", SND_SOC_NOPM, 0, 0, sma1303_clk_supply_event,
-				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
-SND_SOC_DAPM_DAC_E("DAC", "Playback", SND_SOC_NOPM, 0, 0, sma1303_dac_event,
-				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-				SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
-SND_SOC_DAPM_ADC_E("DAC_FEEDBACK", "Capture", SND_SOC_NOPM, 0, 0,
-				sma1303_dac_feedback_event,
-				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
-SND_SOC_DAPM_OUTPUT("SPK"),
-SND_SOC_DAPM_INPUT("SDO"),
-SND_SOC_DAPM_MUX("SDO Source", SND_SOC_NOPM, 0, 0, &sma1303_sdo_source_mux),
-SND_SOC_DAPM_SWITCH("AMP Enable", SND_SOC_NOPM, 0, 1, &sma1303_enable_control),
+	/* platform domain */
+	SND_SOC_DAPM_OUTPUT("SPK"),
+	SND_SOC_DAPM_INPUT("SDO"),
+
+	/* path domain */
+	SND_SOC_DAPM_MUX_E("AIF IN Source", SND_SOC_NOPM, 0, 0,
+			&sma1303_aif_in_source_control,
+			sma1303_aif_in_event,
+			SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MUX_E("AIF OUT Source", SND_SOC_NOPM, 0, 0,
+			&sma1303_aif_out_source_control,
+			sma1303_aif_out_event,
+			SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SWITCH_E("SDO Enable", SND_SOC_NOPM, 0, 0,
+			&sma1303_sdo_control,
+			sma1303_sdo_event,
+			SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER("Entry", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_OUT_DRV_E("AMP Power", SND_SOC_NOPM, 0, 0, NULL, 0,
+			sma1303_power_event,
+			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SWITCH("AMP Enable", SND_SOC_NOPM, 0, 1,
+			&sma1303_enable_control),
+
+	/* stream domain */
+	SND_SOC_DAPM_AIF_IN("AIF IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF OUT", "Capture", 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route sma1303_audio_map[] = {
-{"DAC", NULL, "CLK_SUPPLY"},
-{"AMP Enable", "Switch", "DAC"},
-{"SPK", NULL, "AMP Enable"},
-{"SDO Source", "Disable", "SDO"},
-{"SDO Source", "Format_C", "SDO"},
-{"SDO Source", "Mixer_Out", "SDO"},
-{"SDO Source", "After_DSP", "SDO"},
-{"SDO Source", "After_Post", "SDO"},
-{"DAC_FEEDBACK", NULL, "SDO Source"},
+	/* Playback */
+	{"AIF IN Source", "Mono", "AIF IN"},
+	{"AIF IN Source", "Left", "AIF IN"},
+	{"AIF IN Source", "Right", "AIF IN"},
+
+	{"SDO Enable", "Switch", "AIF IN"},
+	{"AIF OUT Source", "Disable", "SDO Enable"},
+	{"AIF OUT Source", "After_FmtC", "SDO Enable"},
+	{"AIF OUT Source", "After_Mixer", "SDO Enable"},
+	{"AIF OUT Source", "After_DSP", "SDO Enable"},
+	{"AIF OUT Source", "After_Post", "SDO Enable"},
+	{"AIF OUT Source", "Clk_PLL", "SDO Enable"},
+	{"AIF OUT Source", "Clk_OSC", "SDO Enable"},
+
+	{"Entry", NULL, "AIF OUT Source"},
+	{"Entry", NULL, "AIF IN Source"},
+
+	{"AMP Power", NULL, "Entry"},
+
+	{"AMP Enable", "Switch", "AMP Power"},
+	{"SPK", NULL, "AMP Enable"},
+
+	/* Capture */
+	{"AIF OUT", NULL, "AMP Enable"},
 };
 
 static int sma1303_setup_pll(struct snd_soc_component *component,
@@ -1976,7 +1832,7 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, sma1303);
 
-	sma1303->amp_mode = ONE_CHIP_SOLUTION;
+	sma1303->amp_mode = SMA1303_MONO;
 	sma1303->amp_power_status = false;
 	sma1303->check_fault_status = true;
 	sma1303->pll_matches = sma1303_pll_matches;
diff --git a/sound/soc/codecs/sma1303.h b/sound/soc/codecs/sma1303.h
index 186af18188e9..95535546fd73 100644
--- a/sound/soc/codecs/sma1303.h
+++ b/sound/soc/codecs/sma1303.h
@@ -28,12 +28,10 @@ void sma1303_set_callback_func(struct callback_ops ops);
 #define  SMA1303_PLL_CLKIN_MCLK		0x02
 #define  SMA1303_PLL_CLKIN_BCLK		0x03
 
-#define  ONE_CHIP_SOLUTION		0x00
-#define  MONO_TWO_CHIP_SOLUTION		0x01
-#define  LEFT_TWO_CHIP_SOLUTION		0x02
-#define  RIGHT_TWO_CHIP_SOLUTION	0x03
+#define  SMA1303_MONO			0x00
+#define  SMA1303_STEREO			0x01
 
-#define SMA1303_I2C_RETRY_COUNT		3
+#define  SMA1303_I2C_RETRY_COUNT	3
 
 /*
  * SMA1303 Register Definition
-- 
2.30.2

