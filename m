Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679107AE60C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFAB0F04;
	Tue, 26 Sep 2023 08:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFAB0F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710186;
	bh=DJTwcCgHAiyf9aahDbqgJ03AdPEI2d+kFuvTMkXfkKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y7AUP65pgEeFASqrw7rlqD+3pvm+c4Z7zaxrk+QSJRLbFqCNcKHhq2aoGCEZwWoD6
	 IH7tymSJxJouCDTiFU5ydZUOfGtK9S6HP3c+GpZqijHfFJ5g49m7HeOzjU4KZFddRa
	 TYPDnRUzou1uDDLdm0CXdblXhmoC2xzGlLyWKNEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23AEBF8077D; Tue, 26 Sep 2023 08:27:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D50D3F805C9;
	Tue, 26 Sep 2023 08:27:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9E02F805D3; Tue, 26 Sep 2023 08:27:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73566F8077D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73566F8077D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=j0O/AyLC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l803Z7xDNWo/ampSOKng/6ZnoMNMKg9M+z8/XIZu9kEz16TDv4ESE0XeAwN+I7QCN4Ijdqltm3eULhrOTbF3GJRVLBdse4uRwQLk1X15hYL53+q8iGQF8PB+POP1troGpvQs5Itr77KE4nDj9ibxTnfE+DOIZ/TXpmXC/DpFwhOsM2jXG1PeZLDiGUQjoREPURhs8RVBycfLAKKkQXq30LrSMcI/kqJ/EMh76EeL/eWvgEBYOF+fa2iWACIzGKoJwmb5m48ptU05a35cEEszgv959MIxgIuWVD879pdQLgd87X1b7+AwbouFuYgQr+mSzq7RP5avuDgRi8gqvtiBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhbPDGzLyecZQjtcxDPhQKnTYIrpw4VqEMg4HK724sw=;
 b=BAsiEiDgZTXRmvY3Q8UeokBJhkizulrnj+gW0ya4NBhzCGuRgL3XXfcV3iFgDs8BN0Vfq+7vsLZ0yNqsXowWl3NM1EKw6fksCvt1p5Q6sBVldLj6qNyRoaRyphipdeY1bpdvufdMU8TpzctsV7/UaVtsLqVQV2nrClXeN/ilG8cKSryq1xpGC0JeKKr7xGnWIMPo8QFNUt/NeAUwAIxUk3rRHkPi4UusbSQ0z8CJSyyV+5sZrIvEJjKzlfi7Re9trQm3jC/GKgQ7gZYC7D+V85XlKuVlpK5ukFdrGtWBQJy16fNevdBYGJb/4rAhZisJplyzUErUzW8fGoTmBjq/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhbPDGzLyecZQjtcxDPhQKnTYIrpw4VqEMg4HK724sw=;
 b=j0O/AyLCUl4l1wdaci+RYo9pEYkmjYiSVjylvoY/oYAa2XxK0Ol+7N+SpupM3qIjpZGYLATdBtghhbLRQhzGfjfgbzrcRTCcNjHyd1PgKVs+PU2Uh3RXIDUkAe89OjjvYFp1rTJefb6CqhhluFBLi7dldwcqUcRY6Ra19mH0UKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:27:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:27:06 +0000
Message-ID: <878r8tfo06.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 54/54] ASoC: remove asoc_xxx() compatible macro
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:27:06 +0000
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f39252-04dd-4a95-1e60-08dbbe599b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OS1ryRKviXX0Me4/jMBDsYeU2ueN/ZQY+SNp+leGosjlEvKYvtOTPhUSy73cV/8/M3JgmzNz1saDODsI29q3LDQvmy8+q+7dy9zKo3W18faY8SNrAuwYvStoaKSma+SG7Ux9lJPZIJiq4/sRll2IwqMkA1KLFDURm4v60iMZeGAdZqbcstbdcICl7cf4ZqR27CT5KaoxZFSe66fQbPoR03ISU6SDteNlXuGIs9xxNHiuRBQoZWiKW+h1P165WZgL3jVaEaMnyoA9simHfDLC2H1d3QcqbOgfyGfJtbK3cGd0U7Eza3+yUHmXlcpj7LryHljZdTeFeHi0tBWrqQB54wXXVIM6G2y5upLzSnnKjyOpHFITJcndFGvb9mNuxUXUuip5OqpZMYq57+bctgsNXr3G/UnzUOMaO2/8oFoSMhbYxOol7rKwYmkMW+UuAHyH1e5X4DxRkpDGHIlHlH+bQwzWpwe9bwpJEbsLf1LTdQFhur8F+bx8aa2QPaBzZzvLxImCGQXfxLg5uUhXadRrxzZLCLwMv5kKZZ9ltkWePo/+iI+IOgjAo5XJ3hZcnF0EbXuINgydxkWs0CNuFf8vQwALxYXOpIRF4wVoAJ9A/VOGh86+eKFvOrM0nhjrpW1H6wxGwgbgJ0yq7YDFpfisBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Fb7BayGi27IgzvPULkUsIRNr3gRCL3arBvplalYHadXEz3f0I2SdYSs+r7n?=
 =?us-ascii?Q?pa9LVnLEWVjCy5/e9rUoag8pRB2y+muB8ZrkDMp3Urt1oXA+09Fpqt3EILBh?=
 =?us-ascii?Q?Vp93/1mFPI8eLF3kF5+Zj7QtA0KK9vQ2bM0Y2z1ENBDF7MqKeChjR6flpurD?=
 =?us-ascii?Q?flWfSWFFwKOeOVD0QMzlALQYEFkjdLn3cr9TqA6u+XEqlsEY5/SQFBKuLMaG?=
 =?us-ascii?Q?gRLy3rsue6LTjpMANp4eyiPoi9GUdTj3sufG02iL9hV/Wa2A7FLWYGyJBmoa?=
 =?us-ascii?Q?NTQr4NhTyyp9gsPM3Ut/flC03M/cyGKvPpOWF2zI9UemjIR0QFp8no0AGqjL?=
 =?us-ascii?Q?gI4MrtU7gADsoDaVoJBD9LsgICipTIvW576lqtfkyzQn2cbP3dMaa0R5VBdA?=
 =?us-ascii?Q?kIvpGZ8jJB6qCyBjfGsc/nmDxR8Nd5oSuUWLdoOpRHnyHYTTLoHHQBcXJlg7?=
 =?us-ascii?Q?86+iI28RVihVN7thiP8aTv0GpDJqIRDdGEXRA+TUD2s7r5AMFLlkCWhR/r/m?=
 =?us-ascii?Q?mctPT+/tmw4SRxLHdQQG9T8PbJs8ARjAq2WX2vuyD107zgtcpcRZ8mjflAFu?=
 =?us-ascii?Q?vsv9ulFSX/0ubYW7Y+dqZh+gSs2/hO+60YRYZ9iMlz42DLYZIsySofKEBf4I?=
 =?us-ascii?Q?SNTgsU23GT92oY+ML1e/D95oiFUu4fsSsprFc1b1/mqpUwqoN15OB/WhvhVc?=
 =?us-ascii?Q?xfrxKnV/GojlpjEeDw/BiOHX+wuxJArzmWM8fenT044cGlPpnW6khtIHSlUu?=
 =?us-ascii?Q?dIX1TqAQJc8Uz5O+9LnCSoz5eEIbQxPBtCuu6Dqdu8g11QDuGSOftQx0knG/?=
 =?us-ascii?Q?M2RyuGJk58P3O6XWl6Uww40iCLUITj3PQf1LUMz+umf+bM98Xg+0H9z4LAgf?=
 =?us-ascii?Q?EGyQP/TNdzlT1hocwWI938dbxc0KWw3v+tKLVgqL2nPaMJKSQwz+9YQ2VU7D?=
 =?us-ascii?Q?hoA220HoV6waFBRU23805pucQDn2enIZpJTmOR+vNtqFi91331dku4GGBlTS?=
 =?us-ascii?Q?4ncnB3ZCMtfeKjVlVfH+XLHzdcTqTJ58Un3OJ4BM7C4bfrdIs0xFB3DyxpEL?=
 =?us-ascii?Q?TVFDvaFOr7cIy+LxR2XW/SzLnnrOX0Ao9lhTzhwSPo5WSHkpvmySwt8bhqFh?=
 =?us-ascii?Q?tc8ylOqfU2fACbNLdZ3gpiG7Z1t/znDYNUmPYzCDnqh4YPRuU2OpU2NWGPj2?=
 =?us-ascii?Q?hjluHuK9UWp5Fc0iY5mAZ23gUl245SiPze7a5mvMFZEySbPReI1b9tXsGAiG?=
 =?us-ascii?Q?YQL4W3b1WJ9tzJoRWELBueBzuQu8EqXpCIqdTXvE6g4k09niJXAthprDjF+E?=
 =?us-ascii?Q?NrEA15Q1aZZvQIMxBkV/qNLhWLTg4jxIV+YxeL5NV1wLPu0OzCI44y4391Sb?=
 =?us-ascii?Q?Zhw7+MAxLZtiQiWU9nmlb1QXv0xtM0OsSdnhnmcxGY25K0jeWk/SzGlgPmHF?=
 =?us-ascii?Q?+2fhRYRX27dnyADt5lICjUcScsSJpGfj14x61zPjvKkTA1+1v4W4uk93CUr3?=
 =?us-ascii?Q?kLOdxOmGJiBJL12JF6OQaqX2UqJ1NSz35z+xzfpRZVK/XGIYvsCsaWJVy3r0?=
 =?us-ascii?Q?FKxKnxQXK5xPdIrlDDu8kf1JU4tOgj4dU4quNcrcd9mWo4yrF+gu0mzpkkc6?=
 =?us-ascii?Q?s37ixtc62gOLUtFwmNZpXwY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39f39252-04dd-4a95-1e60-08dbbe599b05
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:27:06.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sS6B/cTrEXU32ckYq8yr6NKSchhew0/Op2fLlRytFo6LF8RfNx0SVKhUizcUAgUZQdCmuu2PR0oxzq7TOOxkLZ8K0LihF4/1VUBCUwc3CSjsPida6s4e2dMl078fCkNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: KZAXQIEIMQGMTF5WYOKMAVYQ4F2MMZK3
X-Message-ID-Hash: KZAXQIEIMQGMTF5WYOKMAVYQ4F2MMZK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZAXQIEIMQGMTF5WYOKMAVYQ4F2MMZK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is using asoc_xxx() any more.
This patch removes compatible macro for asoc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card.h       |  3 ---
 include/sound/simple_card_utils.h | 40 -------------------------------
 include/sound/soc.h               | 13 ----------
 3 files changed, 56 deletions(-)

diff --git a/include/sound/simple_card.h b/include/sound/simple_card.h
index a2f214388b53..2e999916dbd7 100644
--- a/include/sound/simple_card.h
+++ b/include/sound/simple_card.h
@@ -12,9 +12,6 @@
 #include <sound/soc.h>
 #include <sound/simple_card_utils.h>
 
-/* REMOVE ME */
-#define asoc_simple_card_info	simple_util_info
-
 struct simple_util_info {
 	const char *name;
 	const char *card;
diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 0639c6df15e3..18e7a0b89395 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -11,22 +11,11 @@
 #include <linux/clk.h>
 #include <sound/soc.h>
 
-/* REMOVE ME */
-#define asoc_simple_init_hp	simple_util_init_hp
-#define asoc_simple_init_mic	simple_util_init_mic
-
 #define simple_util_init_hp(card, sjack, prefix)		\
 	simple_util_init_jack(card, sjack, 1, prefix, NULL)
 #define simple_util_init_mic(card, sjack, prefix)		\
 	simple_util_init_jack(card, sjack, 0, prefix, NULL)
 
-/* REMOVE ME */
-#define asoc_simple_tdm_width_map	simple_util_tdm_width_map
-#define asoc_simple_dai			simple_util_dai
-#define asoc_simple_data		simple_util_data
-#define asoc_simple_jack		simple_util_jack
-#define asoc_simple_priv		simple_util_priv
-
 struct simple_util_tdm_width_map {
 	u8 sample_bits;
 	u8 slot_count;
@@ -141,35 +130,6 @@ struct link_info {
 	struct prop_nums num[SNDRV_MAX_LINKS];
 };
 
-/* REMOVE ME */
-#define asoc_simple_parse_daifmt		simple_util_parse_daifmt
-#define asoc_simple_parse_tdm_width_map		simple_util_parse_tdm_width_map
-#define asoc_simple_set_dailink_name		simple_util_set_dailink_name
-#define asoc_simple_parse_card_name		simple_util_parse_card_name
-#define asoc_simple_parse_clk			simple_util_parse_clk
-#define asoc_simple_startup			simple_util_startup
-#define asoc_simple_shutdown			simple_util_shutdown
-#define asoc_simple_hw_params			simple_util_hw_params
-#define asoc_simple_dai_init			simple_util_dai_init
-#define asoc_simple_be_hw_params_fixup		simple_util_be_hw_params_fixup
-#define asoc_simple_parse_tdm			simple_util_parse_tdm
-#define asoc_simple_canonicalize_platform	simple_util_canonicalize_platform
-#define asoc_simple_canonicalize_cpu		simple_util_canonicalize_cpu
-#define asoc_simple_clean_reference		simple_util_clean_reference
-#define asoc_simple_parse_convert		simple_util_parse_convert
-#define asoc_simple_is_convert_required		simple_util_is_convert_required
-#define asoc_simple_parse_routing		simple_util_parse_routing
-#define asoc_simple_parse_widgets		simple_util_parse_widgets
-#define asoc_simple_parse_pin_switches		simple_util_parse_pin_switches
-#define asoc_simple_init_jack			simple_util_init_jack
-#define asoc_simple_init_aux_jacks		simple_util_init_aux_jacks
-#define asoc_simple_init_priv			simple_util_init_priv
-#define asoc_simple_remove			simple_util_remove
-#define asoc_simple_debug_info			simple_util_debug_info
-#define asoc_graph_card_probe			graph_util_card_probe
-#define asoc_graph_is_ports0			graph_util_is_ports0
-#define asoc_graph_parse_dai			graph_util_parse_dai
-
 int simple_util_parse_daifmt(struct device *dev,
 			     struct device_node *node,
 			     struct device_node *codec,
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 45e005abe03b..63b57f58cc56 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -775,11 +775,6 @@ struct snd_soc_dai_link {
 #endif
 };
 
-/* REMOVE ME */
-#define asoc_link_to_cpu	snd_soc_link_to_cpu
-#define asoc_link_to_codec	snd_soc_link_to_codec
-#define asoc_link_to_platform	snd_soc_link_to_platform
-
 static inline struct snd_soc_dai_link_component*
 snd_soc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
 	return &(link)->cpus[n];
@@ -896,9 +891,6 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_CODEC_CONF(_name)		{ .name = _name }
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
-/* REMOVE ME */
-#define asoc_dummy_dlc		snd_soc_dummy_dlc
-
 extern struct snd_soc_dai_link_component null_dailink_component[0];
 extern struct snd_soc_dai_link_component snd_soc_dummy_dlc;
 
@@ -1146,11 +1138,6 @@ struct snd_soc_pcm_runtime {
 	struct snd_soc_component *components[]; /* CPU/Codec/Platform */
 };
 
-/* REMOVE ME */
-#define asoc_rtd_to_cpu		snd_soc_rtd_to_cpu
-#define asoc_rtd_to_codec	snd_soc_rtd_to_codec
-#define asoc_substream_to_rtd	snd_soc_substream_to_rtd
-
 /* see soc_new_pcm_runtime()  */
 #define snd_soc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
 #define snd_soc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
-- 
2.25.1

