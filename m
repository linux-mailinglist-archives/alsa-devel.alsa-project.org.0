Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1319403CF
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:34:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A32797F4;
	Tue, 30 Jul 2024 03:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A32797F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722303261;
	bh=RdX2cfM+AZ4QUJJ3Niil2Za6CN9pG0oe/RYxOlzHfNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Opm4rxnQiUHXwRdAibmr/MOHVM/elaK/rljD9Icg//9VZsBoMyg45BfKKX8wH8ETi
	 msU/JL3JR+NQ42GXmv6TacghjdGmk9oDtzR7kehizJUJcqiaZfaQHg1uAz7Z3zJadS
	 wtcuFvfw7DrR7XyY0Nv4rRqiraK7RhAqgFnQczAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE705F805CB; Tue, 30 Jul 2024 03:33:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A48F805DF;
	Tue, 30 Jul 2024 03:33:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11623F805C0; Tue, 30 Jul 2024 03:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06790F8007E
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06790F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UgnYJvux
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jz4zL+Feq4X6I6x1KHmJgtt6fPNGVYP5Epdqa0yn6cL/e4mEJSfn5e127f/dOdPVtZxg09IO76lXbaKckLrowDi79CSO06YxgbPxEIk64YTawxdvjgVnNE70t+9Y9u9d23kmuXc9Ygz5RwYP4vAwHHjbBZzEBMYUkfGO0gkRnpXLdkCV9sM8eQ7tsnFUkzlZKi41tzjiBNi/u9dbX30HJtYNcFXdjwAp3WIQtJ291h9RsUvkFjLkeyU/FE95GMe63eJs2qSaYG/HgC5lBWPU8XgNkcjioGLjZYP3XR7KaYgAeKZlhKuiSjc30wkFPY+Q7uVh/K/5m+K57BiGmZIxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgg3BGm+ozSaRVfBljcEnjYirZFcrFQLRddrRdkFeJQ=;
 b=JdJsU/e3ypxsv5R80ndy0IqgmvRxp6Ks9ci5qdFoKcHbDwr0HcM4+5ACAEkiQyP5IIoNTgcPwrB+bo0X3Y8+YQvKudlh4lIU2enMIFOMZcODnURon/CicjBhMKLFX5TY0zLP/q8qjPEMb2dZSQHJ8tObthalzTXTqRcNgHHnA7bMFLgw/VJ9L/lJsN2C9dQDw0eSDCUStRWxlfmAV3ZHcs5aEoiprXOYritBxn0KJShyNuT119fzhh7LYuvaVFDsKEWfA6NNawq5Lh4BqgNGtvsMljQJBNx7JNExiPMqRVnWTJSenHXWM2CuBqnSpgELTm2OulJ5hjLydQJIBnaHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgg3BGm+ozSaRVfBljcEnjYirZFcrFQLRddrRdkFeJQ=;
 b=UgnYJvuxKaB6OkrbRGoz3MSW5ciiMxjNnPQw3Ad6kkX9clIDPVQIhbTWjygEzSOFsaKXEYcIFA3TIDK8CQDd6S4yyNZcY4OoAwFVHIY+Cu9c9o2rQrpETYeunkAn+NkYSng2bDAoqpsgwMAO/uCWX9UTactUpY23GU+bKpEaaPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7901.jpnprd01.prod.outlook.com
 (2603:1096:400:114::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 01:33:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:33:25 +0000
Message-ID: <87y15jk6jf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local
 function
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <871q3bll5c.wl-kuninori.morimoto.gx@renesas.com>
References: <871q3bll5c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:33:24 +0000
X-ClientProxiedBy: TYCP286CA0241.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 263e01dc-60dc-4601-379e-08dcb0379b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LAoXTipyQJgNdFvnhGScg1uJSYpdRG7OoZnsepp5m2ReTrBzkLvro/OsulAN?=
 =?us-ascii?Q?WkLgz0XPPT0gHg71rdA+KPTBP027CuqNW9OJbqpcQVR0M/Xip6o5rnwPO4mS?=
 =?us-ascii?Q?GdT9QiOT4OpqoobaJlXx87naGCWB60J91ONcozgfybXhpWvdPV6QOO5dpo4+?=
 =?us-ascii?Q?sMB/Owo7nNMUC1M0NaOSFhDUciCAwbm32orE2Eon478XIzdUrL/T6Rx3n/hG?=
 =?us-ascii?Q?G7iJFjRmnUoTVQ1uOmzZb/ViLzEMYYTl3hTsad+H5Ba3F8FQsgz7De6w/sVr?=
 =?us-ascii?Q?yvF5U7uJC9EvxlHd//M8lxxelCDvbK7lcYLDoqDOS71Dx9sClFmCeMje+e1/?=
 =?us-ascii?Q?CNaoaCDHT/pBQNJwbMcR4phD/GQ0+4VO4dDSQe2WoELvjTSkjONKD5/yIhoU?=
 =?us-ascii?Q?N+yo4+zpmFZMvK6PCW6Xy0J94d4NN9JV5/poPWrsrryYrT6MZ1qMmntG9Tlv?=
 =?us-ascii?Q?oM3nrilCVMwfmpWxHMMX0Ky1xwjCnp6brFF02jILQQ+Go/HarcsetWvY97Z7?=
 =?us-ascii?Q?2sja0QHX9HVzXgawZDPVpBm3AdhC8JvdtuP9T8eiBLLorcRlNtxjDlDwREJx?=
 =?us-ascii?Q?yQ167Lfp80QDd7FSyPl62z/zxZnVKlq39CXh4NnUb8iK6oXx+HA5TMOS+V0U?=
 =?us-ascii?Q?2JQm8nF/Ex42MKg1u/L10/UItztTJPZFW4AqkEzGipQMfiRvXb1O65LSRGkS?=
 =?us-ascii?Q?vCzh8Jnvkwr+jBYGnkcU5jGOz8PcMUNH7gpUZM0ty/hF8v50kl88T8iXScxr?=
 =?us-ascii?Q?+vbOvf8qbkXrteQ1N0encSUt50apBEwVMMWe6r8AtHHpQUGXtceAeOmePoj6?=
 =?us-ascii?Q?f+9rrsJQj2IqxaK86vgwiZn5+XEuo5ztKPjG6rln+9zvC6Sp98UMrqAMOiLe?=
 =?us-ascii?Q?YLwB9PxL8wnr+nvHbA7Q2aYOdZlst52/mzO9MKg5vcrlISA7C1V0OaIXmFh3?=
 =?us-ascii?Q?ENlwxbviUOsqzkhLUcna88rvq4jvQZZbBJ5IgnkxKeBPQryKHBlCVeMz9pNM?=
 =?us-ascii?Q?AMqSWjj/+u2REmKYrhLR24w4vr8m7ygSBO1rAHs80oFCX67BqSgCJ18Y5/Q+?=
 =?us-ascii?Q?x6ras2vRUmS+iQWRzlksi3H+yumoTcfCDB7SbbdSVQLqVNUM065mkF2vujGN?=
 =?us-ascii?Q?MmK5PsS+BRQqXBTfHbmAi51IAz2uyUg0u3KOV8qWPDpkIN000oyyYDoWJ7s+?=
 =?us-ascii?Q?c3ev69x27Vk5egE+O9BUErCHqTdIpDlgYYxrI0an0Ntyo5eOzT0iMmhHV1GQ?=
 =?us-ascii?Q?8ziOe+KGVhREuDW+oiqy9vqz74tmm8H0+axU+G0Ba+FkGWSbW9H/AiB9haPr?=
 =?us-ascii?Q?tgc4ZszXp0cJCtZ49Hs97GbDyBvx4/apQwePa116/hk3pLvwgO/jfNbVKdNF?=
 =?us-ascii?Q?8OwCqvUdrVVZA+4OFUNaNRvSYOmluhAthHf3PNvJayzCjDKiFA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G8NJcd5b6qNhk7zDVowwSYo3E++fSV2CCREZ83mg/n9kXo1rUqN13wUf2lLj?=
 =?us-ascii?Q?n+519j5QvxtqrTps0SXck0CxHYSxB6GzfhpngYNFQjAHeoT37b80/vj1V8qy?=
 =?us-ascii?Q?vhNiohNzBkgbz4JtHE8kEpvwxVI7v7NzwlqyTK9AlQ22Ka7OMr6AUbZ95aU0?=
 =?us-ascii?Q?+tCN7gp6Tdjg0GMLdD5YrANMuqlQ8jJFhGQVhGZYduFWQRNi4mNSVkRdYaDX?=
 =?us-ascii?Q?eYvN5EDP043E5S2Lug/G6MvQKh6FGbCa0FAnjN1TAfQr+rYvMxdx5gwlU+pz?=
 =?us-ascii?Q?MifiSUg3qw459QWuYUp6PMFKRojfgok6DoP6c4KSsO6/L/5KNgkSJ+w9efG1?=
 =?us-ascii?Q?HCE5m6PTsgqlpdysQbbOjzLRRVYUSlZrdjapxpfWqRpu7dsUSH7littI/KVr?=
 =?us-ascii?Q?Ep0RshI4EbXWKbqJUyW0eD2AUztcUNjswjO5O4WyDqcyB2nh+sfPv3hoM143?=
 =?us-ascii?Q?sktEQhYwHq3h7f00w8br9NVyvyylEIqxMp+eSKBteiLBvUiI8EKQ5XYjqMkt?=
 =?us-ascii?Q?pJ7PE9yzC7UbUEsLVpGQLDV999D02Mi9gnmt5o7w4RRIQY2EoiDlrH17zcXu?=
 =?us-ascii?Q?xTUw+HyYbP2Mi7X5AYRYR1NInILtalrHpxwyJY5gw5QUSmNLrmXTz2qOrli2?=
 =?us-ascii?Q?etYMBQodf8QtcVJJ1Senebe7dfuEo4nx8ajJZz1lHT6uN95UaX/lG03bN8p+?=
 =?us-ascii?Q?XS3vrNk21guDdTC6Yx9VryBN9PyPm1iRlpcJLR+S23Q20BI27/G4aZSG3Ga1?=
 =?us-ascii?Q?NS66jIA/CoG+nfGF+PBfgTHZVI1y6H+a6hssETLcHEwKBWNi4UPZZPOhxc0s?=
 =?us-ascii?Q?6RMfctq5gzpc+erSwgCn9JXjsPM6WKHNMQ3sYLkRYDHhpc63Ig/B6zbrCI6w?=
 =?us-ascii?Q?hYdgQiaA/sEvtIZe01hbByeTDV7lqvwsOy/7Xwe6ner6co3HMmb9PDWB1sbb?=
 =?us-ascii?Q?bPcFhMr1KNTz9xAEqiRkhpzh0ueHA7MFwMUqCRqZXl1kJCGD2Qgd9LFMz9s1?=
 =?us-ascii?Q?0fUPSz9IiDRarjIuGHuGtjotQfln4qeZuacybADkwHJQLnDAEkYatTPYSJPO?=
 =?us-ascii?Q?NRIU3/PxGAE4RZ52qvIvGKlq/g20AJVex3WaU/bCMWqmD8PdfKg8rpWa5wYK?=
 =?us-ascii?Q?hz+Co6cfusACQg2pRBNFvYuTJaFopgxJ2uSmkZ/OMPAuZIc6oczG5RZu6y2/?=
 =?us-ascii?Q?o8oqXc2eqAeOdzYdWObK//i0kK4gpJqem5UUjXpZBw/l+314+Q/vIC2hiJ4o?=
 =?us-ascii?Q?FKHyJEsayttEuotvIHi3Peuxnp+tt7JmmRo7qk6hixIKrQCXP48V9Rw9rTB4?=
 =?us-ascii?Q?nZNMX5vdAxOm73iU93vBNKMsO2g1Ft+PzVScsL36w9OJem35wtLNqv5xmjAZ?=
 =?us-ascii?Q?wIZPeS7iGXck0R/5bK231Sgf041ZZfke1YqexJpgbVUfyu0+wzxshQ9E7BlE?=
 =?us-ascii?Q?/ahxSl4tnFjsMCreZd5gJ4DR13jXaL1ARqCqYjb17cIM5s2nK/1tqFXE9IVh?=
 =?us-ascii?Q?oPADScZTwdnf9T2K9xG6cj244/z2/rJRrD7Na2BNqNNnGX5a151ftyendxPl?=
 =?us-ascii?Q?ED7ZH0ox1FcJmbbUGfYOcFMy8Ku3yuI0cGVvN8yIi3ZTVh9QmMyNC98sJHzX?=
 =?us-ascii?Q?O6uK3gAgb70ojDEUY9SEAeU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 263e01dc-60dc-4601-379e-08dcb0379b0a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:33:25.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2G4q7AaJqH42bMmE9ux3Aeur9de623ZeL01YU5MzE4cu1ekhjMRnkxm22a67YTHKgM/UZbfgmxt0XrIXiwgKVN+xPqSKClVWR955KDxSZRGwOrQ0wJFn7TFdgj+d0dVW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7901
Message-ID-Hash: RELMRVUAD655DXH6SX4Z5IYWJCILCNNQ
X-Message-ID-Hash: RELMRVUAD655DXH6SX4Z5IYWJCILCNNQ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RELMRVUAD655DXH6SX4Z5IYWJCILCNNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
to have EXPORT_SYMBOL_GPL() for them. Let's makes it static function.
One note is that snd_soc_dpcm_fe_can_update() is not used in upstream.
Use #if-endif and keep it for future support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h | 18 ------------------
 sound/soc/soc-pcm.c      | 23 ++++++++++-------------
 2 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 773f2db8c31c8..c6fb350b4b062 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -113,24 +113,6 @@ struct snd_soc_dpcm_runtime {
 #define for_each_dpcm_be_rollback(fe, stream, _dpcm)			\
 	list_for_each_entry_continue_reverse(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
 
-/* can this BE stop and free */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
-
-/* can this BE perform a hw_params() */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
-
-/* can this BE perform prepare */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream);
-
-/* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream);
-
-/* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
 
 /* get the substream for this BE */
 struct snd_pcm_substream *
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 961fadc6fbf88..9ebf07d349d8f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -50,16 +50,17 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 }
 
 /* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
+#if 0
+static int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
 		return 1;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
+#endif
 
 /* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
+static int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 			       struct snd_soc_pcm_runtime *be, int stream)
 {
 	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
@@ -68,7 +69,6 @@ int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 		return 1;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_be_can_update);
 
 static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 				    struct snd_soc_pcm_runtime *be,
@@ -103,8 +103,8 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
  * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
  * are not running, paused or suspended for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-				  struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+					 struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -114,14 +114,13 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 
 /*
  * We can only change hw params a BE DAI if any of it's FE are not prepared,
  * running, paused or suspended for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-			       struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
+				      struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -132,14 +131,13 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
 
 /*
  * We can only prepare a BE DAI if any of it's FE are not prepared,
  * running or paused for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
+					struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -149,7 +147,6 @@ int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
 
 #define DPCM_MAX_BE_USERS	8
 
-- 
2.43.0

