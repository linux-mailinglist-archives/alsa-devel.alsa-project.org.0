Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841D737903
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:20:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BD483E;
	Wed, 21 Jun 2023 04:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BD483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314008;
	bh=Z3WijGFAvwNgm1Y0EstQMZOsBjwUC7XW0CTEUft40Jg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mjc6474T+d8wKTMACpcJRkVceJSgoN3O/UF2OSurhVbvinvZP6++GaBnTmzVWW7/q
	 MKBkMIzZ/tY1lCJ4FFdqzF5li2thKiHKmcMEMZcqrh74bXHA61jNTktMaT8iEiSCbb
	 O0TNyT3Ee3tWuIl5HCm2uU6w6lCdcSpZVO7Cw1xY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBD37F80570; Wed, 21 Jun 2023 04:18:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CA4EF8055C;
	Wed, 21 Jun 2023 04:18:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1846BF80551; Wed, 21 Jun 2023 04:18:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2E75F80544
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E75F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DATRyRrk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMqnaugx/vc0GHcnEBZeHWrYHLPwPp6S3OMworCDEpw4xXkv04tOCc/xxNK6C6OspIXoSm5aI6OnQwxqlnr/fffOeUY0qRc/vGOgn9K6x8bnW4Uz9jtYn+4PPaQPZ8FqQ8hAYxJDWoAAuytD50yYTRKth7O9qFR+Z+yRwbIVW4rcUOp3jC+UW7wHWOAfJ+wybmVGqTvanOM/vV+o8EJA/WRDZRcUOzsZQjxglKl80WGm034aMlswcEqEUuf6iOvZo0ZiK/vknayc37JUg8fDx4Fxm2YAWITmOczQP1uu8hKHgi2b5IrgTmNDejMsdt4oyOqAakvVSE8ZN67v1iVKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btHEnIHXndrIs9guMF9LczyS7LGl7/9l9eokYTP0A00=;
 b=kFGUpZIv2GJ7HoWZZY31zXY1DYGMX3JqAJMl1E23gC0vHCRP2qN/Nw1bhfWG569t49XRspxiFjBbiifsys6fPQWg5BGeDLy+Y//m16AqC77HXMISZC8E09ahqGdWVFDI3AmqmurSpNCKar9qXo0f/w+8TvKzrHnucy6qXmRyNFmEXyHfrzz7BlJ76n0Nhyq0AIBDxYR5vcJ5c+PbgHYT/T3uYX3gzUp1sPFS1BbG7ID3Upn+jbwmTgINX2129Jb2GbdZhTifTHbxsJgqkmuJpVgH/MUjAx1evPLxFSKrfdmh6HFxJTUiRM0ufkpqqlEP3SokxZtkx8kuAVF5SJlTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btHEnIHXndrIs9guMF9LczyS7LGl7/9l9eokYTP0A00=;
 b=DATRyRrkp1uq3d2BWV88HlbAyFvm3SMMQsNgwTOFmJAydTLrLqzNe2qCYuHVV03j5ro3axHv0zG0PYR/M+y6oWVZGT0Ypb+/p61fWLD+ja++jiRafeCqfxxrLmv7FMw3l72+nbY/hs8gwvzwHBzBRk91wXXstnDSsbBI4N/i7Fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10367.jpnprd01.prod.outlook.com (2603:1096:400:243::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:18:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:18:17 +0000
Message-ID: <87o7l9blsn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/14] ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:18:17 +0000
X-ClientProxiedBy: TYCP301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6e96a7-d9da-44e5-0fcb-08db71fdc681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TY1/AeCa7/NZ1UY6LLoLi+OXxsodkpFbZG1U0rgHzqMvIJ9/1z+6U932f0ow2JY2tsjWGIEWTcPcB2PrlZKG+RHRLYugpLdWZkisaWq3YAj+tXKexRtdBbhE6BrMKS9+y91cQw99Egb9tF6h+kuQCtIew4vHgjURvnXPASPOzszHBMEQtpAgt8gLs0v2WVfUKyy3ing+OJPirZq0Jl0lLb1DnMp/FjtvqR++MAH2rEM8ku0Nnet4PpVW5gJZgkTg6zPwVtdP1l0fD9khGV9cuT6LX0UUVFahKgUq3+wiX9m69lEhXrm9FTq4AE8Ae9rbUEa5TCHP/sWn4ZgLxXj64UASfMioI8kRu9JEZ1PBbtV7QmNpe1RM9+1Yrv8cWJIHLNpsKBybj9gM5NywXw66drfm8Yz3/DDMWGEKDybsORz0uDmxANi+yCZkXoiMGLMlYKu+zvDo2Q6kknIkSHxRCmTzg9Y/TE0OMKkZWjrroXO/fwyoOcBfWlEbWfgUkWbCFXSaLUQmLPuXv6iOoFAyrH7DQK88WxMKzZFxGUW5+imkBG+/UaaXSQKsYNfQK7Rn/MgWorUehNqkAG6iEBBRxbU9AW7QpT1eYDkht6tNdrD1HuypVxhmMCBfEr8PCv8DemTLhc44vqBURJ+ytbtcBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(66946007)(66476007)(66556008)(4326008)(6916009)(186003)(2616005)(38100700002)(38350700002)(86362001)(6506007)(26005)(6512007)(83380400001)(36756003)(478600001)(6486002)(52116002)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hsCPAa9Zl9WX/4OgjkznE92h2Fy0c5HWRUg/eQqX4UF517MvIAlRgxDEdRg+?=
 =?us-ascii?Q?g9qc8j0ozDU6GXQszzjhDiFbXwWMFbZztEBHBX/SpT1FvJQBO4GQpxixvvn5?=
 =?us-ascii?Q?6j5sB42f1vSo8Vvpg+m7d3aNibJzMTSHUotCFfEsFuTtJCmbS72Zxq6kLXH1?=
 =?us-ascii?Q?K1CcgWebSTE3rdub4gejfVaz01yU09GpVtVikQMDC/usZNGjiqva6tV/yKzf?=
 =?us-ascii?Q?8HQaD/Nbu3iszzsVn08AyKUsKvFN2l9FIr1Tv5pm7Q0OjeRjmIgvEM77QSuf?=
 =?us-ascii?Q?H/CaSiwi51PFfiNjKwnJu6AnYAWw0DMseX9701sAF2F+6+pbdg2Bme8Djos3?=
 =?us-ascii?Q?U+SJ5cWrTQQeOQ5qN51ELUjynMDx+EMgo82vwxpxmiZjxr+0zAhfwW+PPuiY?=
 =?us-ascii?Q?T7ABZ25bsSViXR0ljaY29nDAjm9Z3zFAL0ZeAooA7bA6AG/cxsCqj2BAT9bq?=
 =?us-ascii?Q?r2mybls3dShqQI0FvdSk467QSx8Th9+nguOwT/o4dr35D6mBNfvcyfFWD+T5?=
 =?us-ascii?Q?SG4lRcsmeNJwaI/IkEpKpyOa6+VJOlIqaTHrEViY39WMaOkvB5oBGqTsWWsx?=
 =?us-ascii?Q?xcN8v9hpsKuYqAjYvIvgHnICGeieh5Ilz6fw9KQMO1wpLVbkdVTN5bPUdT6z?=
 =?us-ascii?Q?3WZMx9Qct/najKiQqB98/3UzGK9NbbEeZZHwUxRVIUM683pOz7E2qDlpqZ0r?=
 =?us-ascii?Q?bh2anLSN43QBcidaYEkC09AgNSTWpSLYJjIz8OPrSypYc1WgRsJLfNeiOVXf?=
 =?us-ascii?Q?0S4qtKCJyVD2k6HdwzfyFTOCn7PG1IpaqlJuB29ZNvhlHWl7/qg56LhG+tvs?=
 =?us-ascii?Q?lBrIddKNSD1eZflbTionGcNFYVEx1CnrYgustSEPhZG6F+DSLgvqFH6w2g3o?=
 =?us-ascii?Q?S0TQ0NgomPql0qntHUrytZxFftvk3Dug9nY7J2dwgoOlyAOtgAkAbyenxfWK?=
 =?us-ascii?Q?O9DZ14vE+QA06DqbmBtSQM2XvLVVwhoi2BL/4UMXHXeEAq2llgzKd1AIBDuE?=
 =?us-ascii?Q?KZ9fHxW4VJ74cGW5HC0pdI7DZunEHmR+bFyhwzKkgEB6V7iGiQB93wEHQ23y?=
 =?us-ascii?Q?FA5KSR4peIz7Z2a106g5XilDJxyDtj2EQ2culBOcTIuZYIi3mw8cZLPrVA3t?=
 =?us-ascii?Q?cAWIjM8Wo6c7PoxsKR+EtvM1W5qEkjVB3hVs5dzHYiMIY9L3lJBaLgkXlmj4?=
 =?us-ascii?Q?RAbzwRrGPjP/+V5FklR5TSTawI1KE8uxC96H7+3GbS6W0Auh/2D44bLcvoSn?=
 =?us-ascii?Q?rpNt9QjwKUy1w/E/kC5/e2EawAbSYuvEURWoJvlW1uwHf7gdixyqf7jLIyAB?=
 =?us-ascii?Q?bQfzsp4ZbqwbSd+EHlYOTohqPmFLWevBbsO9CzFrTKwXMWM6yuAQnr/Ft2Y3?=
 =?us-ascii?Q?SPyt9OxDLxhcVMhM3R+5m2kQosQDDLI0EE/uVudNBdTgD19+H+5LJMdoAUIM?=
 =?us-ascii?Q?sHVmsL04Me08/iiSfJ7/7yibzli4663AziktjVXIpFVE4znzVDuDlm0NBIv2?=
 =?us-ascii?Q?T5h5dS+ISQ3OLEQgRJBKVTxToq8uP87fFCZKt5fc8X3AlgYIfARFKdBcDIBR?=
 =?us-ascii?Q?B8B8R2DgI3u8dxt82DRQTqoOzm3BoH2TuxHFo63oXHiO8mHPSwc54wZkoOdx?=
 =?us-ascii?Q?7Brkg3qynC0qhohsRQix8/U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e6e96a7-d9da-44e5-0fcb-08db71fdc681
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:18:17.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 j4LWDN2vP2fph5v+3H9q89OHpd80eQ98ZQS+JqJdj3xv2eJ84zt15QI4hSalLietp5U2PMv5+OOqDLiChntvmrXfbTNp31FcIqP3NQ+Ou3yKBm47Cl45aFZCZRw/HnTc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10367
Message-ID-Hash: RFCBWKPJDDH5ILG5EFOORDLNGXVVAPDF
X-Message-ID-Hash: RFCBWKPJDDH5ILG5EFOORDLNGXVVAPDF
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFCBWKPJDDH5ILG5EFOORDLNGXVVAPDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Required CPU/Codec/Platform dlc (snd_soc_dai_link_component) are similar
but not same, and very complex. Current implementation is very confusable
and it will be more complex if multi Component was supported.
This patch cleanup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 131 ++++++++++++++++++++++++-------------------
 1 file changed, 72 insertions(+), 59 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b25c26deef63..4b66c6d87fa2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -238,6 +238,21 @@ static inline void snd_soc_debugfs_exit(void) { }
 
 #endif
 
+static inline int snd_soc_dlc_component_is_empty(struct snd_soc_dai_link_component *dlc)
+{
+	return !(dlc->name || dlc->of_node);
+}
+
+static inline int snd_soc_dlc_component_is_invalid(struct snd_soc_dai_link_component *dlc)
+{
+	return (dlc->name && dlc->of_node);
+}
+
+static inline int snd_soc_dlc_dai_is_empty(struct snd_soc_dai_link_component *dlc)
+{
+	return !dlc->dai_name;
+}
+
 static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_soc_component *component)
 {
@@ -829,102 +844,100 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 				     struct snd_soc_dai_link *link)
 {
 	int i;
-	struct snd_soc_dai_link_component *cpu, *codec, *platform;
+	struct snd_soc_dai_link_component *dlc;
 
-	for_each_link_codecs(link, i, codec) {
+	/* Codec check */
+	for_each_link_codecs(link, i, dlc) {
 		/*
 		 * Codec must be specified by 1 of name or OF node,
 		 * not both or neither.
 		 */
-		if (!!codec->name == !!codec->of_node) {
-			dev_err(card->dev, "ASoC: Neither/both codec name/of_node are set for %s\n",
-				link->name);
-			return -EINVAL;
-		}
+		if (snd_soc_dlc_component_is_invalid(dlc))
+			goto component_invalid;
+
+		if (snd_soc_dlc_component_is_empty(dlc))
+			goto component_empty;
 
 		/* Codec DAI name must be specified */
-		if (!codec->dai_name) {
-			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
-				link->name);
-			return -EINVAL;
-		}
+		if (snd_soc_dlc_dai_is_empty(dlc))
+			goto dai_empty;
 
 		/*
 		 * Defer card registration if codec component is not added to
 		 * component list.
 		 */
-		if (!soc_find_component(codec)) {
-			dev_dbg(card->dev,
-				"ASoC: codec component %s not found for link %s\n",
-				codec->name, link->name);
-			return -EPROBE_DEFER;
-		}
+		if (!soc_find_component(dlc))
+			goto component_not_find;
 	}
 
-	for_each_link_platforms(link, i, platform) {
+	/* Platform check */
+	for_each_link_platforms(link, i, dlc) {
 		/*
 		 * Platform may be specified by either name or OF node, but it
 		 * can be left unspecified, then no components will be inserted
 		 * in the rtdcom list
 		 */
-		if (!!platform->name == !!platform->of_node) {
-			dev_err(card->dev,
-				"ASoC: Neither/both platform name/of_node are set for %s\n",
-				link->name);
-			return -EINVAL;
-		}
+		if (snd_soc_dlc_component_is_invalid(dlc))
+			goto component_invalid;
+
+		if (snd_soc_dlc_component_is_empty(dlc))
+			goto component_empty;
 
 		/*
 		 * Defer card registration if platform component is not added to
 		 * component list.
 		 */
-		if (!soc_find_component(platform)) {
-			dev_dbg(card->dev,
-				"ASoC: platform component %s not found for link %s\n",
-				platform->name, link->name);
-			return -EPROBE_DEFER;
-		}
+		if (!soc_find_component(dlc))
+			goto component_not_find;
 	}
 
-	for_each_link_cpus(link, i, cpu) {
+	/* CPU check */
+	for_each_link_cpus(link, i, dlc) {
 		/*
 		 * CPU device may be specified by either name or OF node, but
 		 * can be left unspecified, and will be matched based on DAI
 		 * name alone..
 		 */
-		if (cpu->name && cpu->of_node) {
-			dev_err(card->dev,
-				"ASoC: Neither/both cpu name/of_node are set for %s\n",
-				link->name);
-			return -EINVAL;
-		}
+		if (snd_soc_dlc_component_is_invalid(dlc))
+			goto component_invalid;
 
-		/*
-		 * Defer card registration if cpu dai component is not added to
-		 * component list.
-		 */
-		if ((cpu->of_node || cpu->name) &&
-		    !soc_find_component(cpu)) {
-			dev_dbg(card->dev,
-				"ASoC: cpu component %s not found for link %s\n",
-				cpu->name, link->name);
-			return -EPROBE_DEFER;
-		}
 
-		/*
-		 * At least one of CPU DAI name or CPU device name/node must be
-		 * specified
-		 */
-		if (!cpu->dai_name &&
-		    !(cpu->name || cpu->of_node)) {
-			dev_err(card->dev,
-				"ASoC: Neither cpu_dai_name nor cpu_name/of_node are set for %s\n",
-				link->name);
-			return -EINVAL;
+		if (snd_soc_dlc_component_is_empty(dlc)) {
+			/*
+			 * At least one of CPU DAI name or CPU device name/node must be specified
+			 */
+			if (snd_soc_dlc_dai_is_empty(dlc))
+				goto component_dai_empty;
+		} else {
+			/*
+			 * Defer card registration if Component is not added
+			 */
+			if (!soc_find_component(dlc))
+				goto component_not_find;
 		}
 	}
 
 	return 0;
+
+component_invalid:
+	dev_err(card->dev, "ASoC: Both Component name/of_node are set for %s\n", link->name);
+	return -EINVAL;
+
+component_empty:
+	dev_err(card->dev, "ASoC: Neither Component name/of_node are set for %s\n", link->name);
+	return -EINVAL;
+
+component_not_find:
+	dev_err(card->dev, "ASoC: Component %s not found for link %s\n", dlc->name, link->name);
+	return -EPROBE_DEFER;
+
+dai_empty:
+	dev_err(card->dev, "ASoC: DAI name is not set for %s\n", link->name);
+	return -EINVAL;
+
+component_dai_empty:
+	dev_err(card->dev, "ASoC: Neither DAI/Component name/of_node are set for %s\n", link->name);
+	return -EINVAL;
 }
 
 /**
-- 
2.25.1

