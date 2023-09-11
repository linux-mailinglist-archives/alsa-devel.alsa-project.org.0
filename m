Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EF79B55A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F28FF9;
	Tue, 12 Sep 2023 02:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F28FF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477008;
	bh=lD9lbL4OgdwJkpD5r+AyGYBGYAem8tl7o5AzIlNP8qA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L509HZDo1BV4DJx4TGmaBY7vxE6J6fZVWLqnm2iv06rUaNCb0mB1WxfKtLBaB2lr4
	 xEFnK36SEN5YcFU7ZViGxUa3nIrzZMFk4lKgdRukZiWdIOOOJ/h84UFvDfXOD9wlPo
	 bMj60SHCcTAIKseVAOTxpzznLuesBdD6uNm7OYug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE56BF807B6; Tue, 12 Sep 2023 01:53:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C2EF8063D;
	Tue, 12 Sep 2023 01:53:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89854F805E7; Tue, 12 Sep 2023 01:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F60F805DF
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F60F805DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=meH5Eh59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q38p834iSTlg5Yc+iJHHELCDS4ndC78p5UYABzYoiJ58n5OvRKgIECeyHfLUZdhxb3j1Gp6Mmd0SNTn/SDoQGhBa1VnqwcFF2A31Sf/91ML5azIbw3sLvGH/Lu1hfgpremfl6nHkV6/iJcJD0hNGiDZEmnjNb7XjFEeNKOtbyIr01gHJGoUi4oMaTma4shIfmqnctRr5VktRGrF/ScbMKQxe5RE0k2ECAp5uwSVt+EYxOoJLKmzkNHKVo3KiZUWSxvIUB20abc53caH+B3Og8WkMghtIOd6Ye5ctsFJDkymHe67IzYShmVFZvVndLOQYayT2wyqMccLfuw+B5eBOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKGF5d9JUNUaczXoXTgNjel+g2m2iW5RR9y19tiwnHA=;
 b=ZyHZygoD0PGJGr2L6A5yXIFl4YmaO72U+OrQGRy6c0KrgaGC15IQzh2GWyHunHTHsYTdiWxidX7vZZtjog4PQpWZukAc5Iq29WfNVEr6I8uDFsDtw/3kRwB85QzY3a66e83NSeg4teMsIJvbBPwNnP1Xd8hFRYh+1TKY+sGSN0IVNlamupxlWgfNxs3cJXf9IpdvARupJVp8PtiVwOP5rvwz94FC3fuZ/JT+PYhbku8RJEUqCnkKubE7fZrvhjON0Oj8wzv5c+D0uyK4XMpdnfxTaRZfFjMIZEvsf3C+kNyOFtVD362PzZI3dkhYzuGBHgEKhiw1c3lXc+p9u/yTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKGF5d9JUNUaczXoXTgNjel+g2m2iW5RR9y19tiwnHA=;
 b=meH5Eh59BaQAbDH/HATxDq/qHSRo9qOPMzGVgLCnuDQOLQQaGFGBcJGmBUTXEPiB4jCZI8GIFr7YCheE73jT38f+TzY2/sMfkEEfzBH+p/PD/0GJihJKcjT2WHM4B+XMt6377XLtLS00tjHGhriA7T/PNYTUtLNcQ/j7xunb/c0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:52:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:52:29 +0000
Message-ID: <87bke8p8sj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 54/54] ASoC: remove asoc_xxx() compatible macro
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:52:28 +0000
X-ClientProxiedBy: TYCP286CA0303.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e1242d-b7d5-4bde-21e2-08dbb3222858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	odfrjjFv8yAoRsi/8Osw4qfuTIkQ0yDZ73sGCx4eIqJNk+9TKCFpRRwhAVKNY7v2SQ1qfM2qBs9PQ7jmxST3/veaLvs2uDPWUhFY016kjfbzJCrFmA70Elw95UZEceN/xPpsabfpSonsuic94xQ01GORH6za7BDA9skyNC4T81nQwWheaKpgPWCVumMdFyGj7zWBYMKDpSlvnIYyJU3KpPBQHSpV3HuG53gTdF/ybX14gVAiY1T3FrXX5qDaTAiImRdgzd7+vBjbIBLiXE4DPaJQHgR5zfaVv4IzQ9yOwg8pFBAjRJqvfKnrWh5iKsOFtKlYhcASR6JpeLXK1ILX3K/i1xNCZID8JbD4x1oCQZTrJtiwMtEkOczUTHT301Jca7JSrjLIy6jQ052GjGtCctP8bFfRUynYxYqTpTkYrtaF6z3Lji+qCglZ17ZXjUNKPAq/B8amjunZBzm8vmaFHr+i7QQMEynojS1yeCZuVabLpC6ExallS2zm9h+oFbKaIaSs0S963kV0Kv6Ls+gzQc986MkpQ6IB8wJyYWLIg7kxLvhMBI6wIvjdCLQxOy+R0K2s0qYSMWKbnG2QYpvcgbVBcD1RuAdkdI0do1Ic0sOUFBr8U4sqvXYJb43mkW/QZrHcXoY6dKA8yiq01BOCWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jt7UhlZLaXLo9cHJhZEujSSqOpogc51ITahnFM0LJC5gIS6HjmCVfmE0VbkS?=
 =?us-ascii?Q?kGIuskso3gxdPU6li6Qp1dt/MAeYuCq0R/HyqLwv11BMY1HGBVE/F4sI8g4o?=
 =?us-ascii?Q?d6HY7hlugR/B+ouiPab/3804mSIM9rttewxO/9iuDn9hNugKtZErgfjAssj6?=
 =?us-ascii?Q?U4eOrQQcVPld/7tCTpN77VFy3Mhd1yVZY94gu63WW6WhxZgbqZWywLwvM/Es?=
 =?us-ascii?Q?81GDdnLFxOhfclj2pGgGeQbZBTe3SHVuwVRQBcBvg2morY33TD9HhsL7jyIy?=
 =?us-ascii?Q?lmTft1Xwol4XW3SaIJ1QSgOwvCrWqjYNeX7EjoUMbyS1yHBeyaEGFpwBuHTN?=
 =?us-ascii?Q?6mKnVf4GkllcAHCdsmuqqpi71dzaf6UZZx3rq4vE+MyVuUQsLzPf0rUiIOBI?=
 =?us-ascii?Q?drIXMUTzujWSJvSpXVz2iorlLkgHaw6rrZAXicMkZ0p60RNXrPg0eMyw18um?=
 =?us-ascii?Q?urcEMll2Cd/n+FBfSZKnQSNG3QvQk4TNBdveHdTMNu4BAP1EhjcHcJug6SYO?=
 =?us-ascii?Q?kIfyMahicFYhnFwxbEUcr53MJlsRBiSRkjFNy6XDgqByBR1GOxAh4ZmhUbLy?=
 =?us-ascii?Q?/aZ+AYI/SSDHrA4DAewW5n7xtocXtM433pfTL/AMLNNCLoA1RbpnGuFKAmhM?=
 =?us-ascii?Q?ct5oyFaTtHJTH9K2mkyS+Cb2LZIdI4mJgCmvgEUf4UKRLsjf2NLddlOiwc5p?=
 =?us-ascii?Q?pSLwAuh27JyFfUOlcyeD1svpDzCLSE0/YeeNvlxtsAjYmQRnvJllZdbFmja5?=
 =?us-ascii?Q?SjJNbecNRNHV121cjubeD4tHfBzEMLlSPSdUA+RoRQjIPMvvBPXrbhlgtngP?=
 =?us-ascii?Q?PqCAjGsQhBxKkeekGKMu7A5VS58U4GZfoGLZiHDrcFaTwFXSIqQ/DRRPGRfI?=
 =?us-ascii?Q?sHegf6UUu9Tw67r7Nc86lUuWMOy73R+QdVdfX0BNa5kN+i55ekBDWWvO5ykx?=
 =?us-ascii?Q?y0qMcG0JLBGuCFcwsBbS6TmuyWYPHVksYuSaGN4QDllvPbQIotlxZclWPP2L?=
 =?us-ascii?Q?Ys97n2oGSdvhogjOkKX504BeKISAv6+NMFGajVfjL0WzcVH2Al0DWnjvhmMb?=
 =?us-ascii?Q?Lb74hT1A35BfpRToGAkNIQkomIztyxNq/qR52vhRichBhbsiJy2DwQsidDN8?=
 =?us-ascii?Q?rD6rvuQ5I+yriKtlmiK2HIjSVAM49XPV0xGr+2OdoDssJ0lQ5vpyHecX54ub?=
 =?us-ascii?Q?wLm7OVB/eVikN16FmCeaHX302raOp9dZLH6FiOiDGal0vda2UEIsl4cQ2lxo?=
 =?us-ascii?Q?EIri98inEd/jtNKXwQr5cqKsVtvKqZ0DZCAPf/kDy74Fw78EMEfoL1CoXT2c?=
 =?us-ascii?Q?jc7WZ/e99NWTWdJN/rfOYZEUXweAdEfwKDfHG1Za/KDR8Pe9FAGU93jF4E01?=
 =?us-ascii?Q?0BurN43gkn2S2NDR1mQiyUtCncQpympjvEDl5ToPoE12ey4BrTHA3poarp2G?=
 =?us-ascii?Q?Pdskex6S6PGh/lwpliP64xSwLKethEaHwO0Nr3K4MqAlibTIsb0yxC2IAWwC?=
 =?us-ascii?Q?tugtiyHunRNwWDYY3T47yQYTApdPAg0EKhsNhwaxXBXDtKUYrmpWWjE/aLqI?=
 =?us-ascii?Q?WTjm0PrFgYba6lwAgluOddviz+umIqabMwUrCTKjkWykZlpm2ZnXzLSK7PfL?=
 =?us-ascii?Q?U452ZeIKUEkktgKYrEtoRZM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11e1242d-b7d5-4bde-21e2-08dbb3222858
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:52:29.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ckKDdtjHYWedxDm2qAdPnqVlN5sUrwDngHG54XmR7GaNoK0UJiJjm2iUq6nwyW52XcPVZarAtKFRhsjnH2UVdObM+cJ2NioLDRsKzk+w7Ja5UiZoE+Xpd3ohLZSfo0mQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: J27GQ5LENIFSWXEIQGHAN35L4NUKSZZ3
X-Message-ID-Hash: J27GQ5LENIFSWXEIQGHAN35L4NUKSZZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J27GQ5LENIFSWXEIQGHAN35L4NUKSZZ3/>
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
index a2f214388b537..2e999916dbd7d 100644
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
index 0639c6df15e3a..18e7a0b893955 100644
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
index 2d0e8801cd485..e015c3115747e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -774,11 +774,6 @@ struct snd_soc_dai_link {
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
@@ -899,9 +894,6 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_CODEC_CONF(_name)		{ .name = _name }
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
-/* REMOVE ME */
-#define asoc_dummy_dlc		snd_soc_dummy_dlc
-
 extern struct snd_soc_dai_link_component null_dailink_component[0];
 extern struct snd_soc_dai_link_component snd_soc_dummy_dlc;
 
@@ -1138,11 +1130,6 @@ struct snd_soc_pcm_runtime {
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

