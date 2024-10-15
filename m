Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF999DB0B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 03:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3288BEAB;
	Tue, 15 Oct 2024 03:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3288BEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728954085;
	bh=Vw2xYdXdckIo0v/pRr6zwYaapVl4vL3esBItTt93teM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s6b6SOFEtmGCjoGSr8TgWXwi7fCx/gFoVpAvo0JoC6aC4GCI+wXQbjERLtN2mIOxb
	 taDN0kD0NS5LyU1MaACkGPi9shCREXsknuWPPI6jj6G73s+HPavCTssbcZnrkNJuDP
	 PhMHXNLLnjUh6vLhsi9VlXWDu9JYKd1Ma6jSLoYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE196F80C7B; Tue, 15 Oct 2024 02:57:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6824FF80C5A;
	Tue, 15 Oct 2024 02:57:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51414F80879; Tue, 15 Oct 2024 02:56:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6414F80803
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6414F80803
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pazxBHKu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4WPk0fSUcWAgmpNC+BF27iMAs7TjITolSdi/ZztqXx+0uve94JXTP3hWufjOBQAvWJqmXrDn4Z/3ZveBBFMJpcvF5eaPhf9aunFSkU7676LLuIqO1YQqBUqk1gwGgN/ilQ3Gt2oTV+8Emo+a5EhDn/lb5oRxhARY2RH7fb6GHph1qserJaXxL1pvizY5hIyNrQuF6Gpv/HrzEvajaDNKpVHewjQWcw0YTDpVZpIElK13YO37MwLa1MHTnIvMZfLf8xVIi9Sp+MXu7ZcDXrM3IGY6LFusR7KqRE5fiUN7PmdVGD+cEZ6AhvypI6FMq0KVQ3Nqx4ckLRMPJ3t5mmySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOovbfK6vR/xOXcpsAN/tbbxAML/E0D1rQC/dk4nId0=;
 b=Qy6/HSskDlSBJXUD+kr0xsSCjqz4Oz7Yfo1zER4UmjPdySd4NneRLmx3uvpqUTA+r8lN1S1+cfi72ZZWgkH+Rx9X0+giEGHu2mnpGG6wLV4IyOp9d2CzQFcm7dfAlsWtHaqe4mKfShM/kYJ/t791snvcDuCXb3roBerJfcDr8igWk28CgpYlV4zUY9U7vHtPXyWP022mWq6MuaGuAR1S2m+wm3M/ujBqUe/lWFrrP/t6k4Ecxx9NvSJyci8yr8e7ZbW9HaMhQK4MBmkr0+0hV9tPOHJUfQbyBM018Rt67asEtvgujZBYo8oSXVicr9itq0EGTuxky8V0aMsP5S3FIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOovbfK6vR/xOXcpsAN/tbbxAML/E0D1rQC/dk4nId0=;
 b=pazxBHKu9BxPhEZLdxQUqFt3fYsF5LNHmKA1inYIR7cozSTKiIwZIBBUTBsurdVEyvmC8nyy0PWNBPBmJs+qZN2v/sIlL/VXU7CfuS6OR/lHw57uVcZA97t1tVuRFMVWzvu486sQWik93Fcmm7RqcMNpJlnjHIdEfnEfZhzOy8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7121.jpnprd01.prod.outlook.com
 (2603:1096:400:c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:51 +0000
Message-ID: <875xpuqj3g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 13/13] ASoC: soc-pcm: merge DPCM and non-DPCM validation
 check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:51 +0000
X-ClientProxiedBy: TYWP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 544521f2-5acd-4290-6c69-08dcecb4417b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P1xsf/y4Da5ijaCauR7uwNb31YCADiUPv0tjUr/9dBho4CiO2Vj5id9H0ve+?=
 =?us-ascii?Q?v9RI1JjbXIUj/o5kL3EsgWOv3sAq9vEHopfW8buqeD4L7K9regz6eLRlWJlL?=
 =?us-ascii?Q?F+MQy8xTGCmlSpR5wlFnGzaVq1V8hkRqoSVVvDgyY81u3rR72jbDRKlLXSvb?=
 =?us-ascii?Q?m/N8iTfeIOY1LnCitoaYjEa76yRZmk1AfzopAiOHLLaMI1JS7DWX4LOQ+6Bu?=
 =?us-ascii?Q?7bgIa3YkFFHZosorsYg7MLmvxaLis3/OTz9PX41CaOlDVAFhcZvF9VlA260i?=
 =?us-ascii?Q?JX83kSwtpDpUg7fVtiNivI8Kh+EvDSF6zyrDT7E1Ruw86xDXXyn5pmRZegZ4?=
 =?us-ascii?Q?ytEFnWFk4L10/VRhxYtdK/2wmXoJxEEuJS0Z9mmDdZoxnFjaYpXqG9ZorPDE?=
 =?us-ascii?Q?X3dote57m2StYD0x7RYAKX7W/yy9yhuMYicUh3iJPrWWmQGYIkGFoUmSm5rf?=
 =?us-ascii?Q?gGQOAgTHGsZgjhK411wM8hAYUkuYxtULKOJ1XafkG1RwU958w4ogjlHfSR9Z?=
 =?us-ascii?Q?wogWYXACeW6BmOvmlLs1o5RTlKYJQLUiXZEcS+UkPVlvG/BxH69jcNqoaCsO?=
 =?us-ascii?Q?7dItCAL+nO9Qc2rgCwhkyFjlx87/P7WMuWS+A2bQ5+XSnLSl9A5qtnLe7Quv?=
 =?us-ascii?Q?A2cjBzloGDtekErs5e4cEI4pkn5OfmROf7k817u2V47/mRYRGPVKFlDiIo2V?=
 =?us-ascii?Q?M0rVGDP0a3kVVFiSXXt2RD5Lgg6Ew//I8N9K8ITUgzkzaLupZUDT8YAYlXeO?=
 =?us-ascii?Q?7buDcIRrrW62cLtFp0pwVthunfs1SzuTkzpNe9N/tWJmbqEWrKtNVbnIRHqH?=
 =?us-ascii?Q?omLkb1NVVSa9ROZkrJEHDtmKEGFx9wbWS7GELM0LejcH7i2kW4LX5IvIeT3c?=
 =?us-ascii?Q?1DUeGWvnkl79HeI0RAZBChwnhdGyXb9ki98wMRuP7YYAk3OfgWDsoU56x0ZA?=
 =?us-ascii?Q?FCYyQh72Mbd7mpvmwnvtNnu89EZVuOEpePidBC1swOkYX/Gn2zGswwrLHeMv?=
 =?us-ascii?Q?NcWCDyiDQnV9ttpOm9QgDotcoG25f0PvahlsHQ0oNYsdvzmgsNU1uRFUiAIQ?=
 =?us-ascii?Q?kfAboYzif0gA6/yXooi4fYq8yT/4pZVpcYZv/2ZsOSBojlbtxzqO4H9WLGJF?=
 =?us-ascii?Q?nfHVIrJV2mctp1T8tv9etA/GuwFTwABbL+dRG/AW0vZyN3oWdwfkJ5ZOPEgb?=
 =?us-ascii?Q?6VL0Fnq+Oz6Fa7ofpKkOv8N21lwCfY9Aj4IQzqiRZ8QLWTXbqxmUYSXR+R3H?=
 =?us-ascii?Q?UqGALqQYdww0j6puSjKi8fSy43QPzcYRQNQZIos+J/csHGqaKGkS6glOF9tb?=
 =?us-ascii?Q?vlKrOmgN006zJdrZ/ADesDR6j8YL7ObRiArO7D8tkD3yTw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8zRJ26LhhRWir6oFU8Wt8tT6q6ydX6q5A7dTftbV5+pVKSoaQV6bg5c2BZD2?=
 =?us-ascii?Q?Z4EMA5kssCMPf2P7zQTMbd8Tanm1SDFyemMf0DLSErbeDYXSDbMbaHRaw0ft?=
 =?us-ascii?Q?7OBfrX1hF2kc3nufeX3HFdQTdbJu/tMMEmvdPSz/C++CJH6Qq/JfGVmJ7Uh2?=
 =?us-ascii?Q?EpU68FsIr2s4tfnzTXOfLxRubg8L/hd946ND212GHfVC1cbbDI282Jsxj8HD?=
 =?us-ascii?Q?wj6k71VU7hBHhifQkXcambaKff/XbLcfjrY0U0WFoTUxJfLiENWJ7kY3bPT0?=
 =?us-ascii?Q?eP+6K/wHoYnMEv/al55d637cBujcW3fhStOaF64MmWv3kTGWnx2S69XGMiA+?=
 =?us-ascii?Q?g9XWoj0vI0RoPLyFHfZeCQWck4xeA3xCsZjoL9iUNYg5t9Vqf9lJALyTo2BS?=
 =?us-ascii?Q?0OGzV4K8kkW+2P5cNTm4x6wuVlaNCDy4uj3aI3txNkY4Z+KDVJiHfhBKOR7x?=
 =?us-ascii?Q?y1B90MG79+UuOW/N6pwN6EL8LMqpBDZKu8ibxayVQf7E9M6ZTY154t/Vi3Zt?=
 =?us-ascii?Q?xwQmSGogjkH/l6xVQjy8wWfCNoG1j5JLa7s/3m46pg0SGVuWIH0SeUiPXyjk?=
 =?us-ascii?Q?T6p6ZTFDW9i2SUjfWTQ0/zQJ1j5uYZjIa7I54xSOovLIJ0hj/q7jEo5BcPTi?=
 =?us-ascii?Q?lYjg78f6UUXDVNEBT0nS3eda+Z2/Iyuz3a9PekFtTY7/e3oWD7PVXZ6DFgQu?=
 =?us-ascii?Q?e/GwuvQTJ0nmCfjUCJkcvmRBk5VSX/JFhoxXaT61vwFtu1U7PFFRhGOQseRv?=
 =?us-ascii?Q?GCLhlmkax8HWsJsJffFeYDbgCAaYuZXaaPNEMM9mKjwl72752+/0M/CAJ72N?=
 =?us-ascii?Q?KW69GOWK81RkS03MhU+NI5OCnN81HOiptpolPOzuBRGes44b7MfnaQWaIgRa?=
 =?us-ascii?Q?imTrwnWU9zUNxx2UjeB+O/GHyUUIOW+rI5Vorqo4xpsGY/Jv1W4d79UrOAvE?=
 =?us-ascii?Q?HJ/h7zxjIAvwEX4LvDCkM/eq5SQ+hW58OskXh9dRyOGi8V5F0mBhgKSXKMTH?=
 =?us-ascii?Q?L/LslK8wqzevwE2fLXsxtuhdATXTOBIn5vfbqPHt9FLXJ0rx+bheF4vlIwvh?=
 =?us-ascii?Q?K+vRj7rouRqHZtparWx+lfHsaqN7sIDP3rGP1Q1ivLHZjph8gVaWM8JZcHJ5?=
 =?us-ascii?Q?uoBbZQmNg4BHziEUyju5kyQvPg1CZGDQNXiFhfnSV9lRheEr8KKXPTrGyKqg?=
 =?us-ascii?Q?RrfEv9dARx9N58quZwxMIxRci2C1uEG1YhWcZLAP75KZ6SA7xgmeH1Ka7Zhn?=
 =?us-ascii?Q?vT9ZyWYguIXZAkndQHljzDMyHP90juB00OB6B1D3lIWaGRzJYGWEb1miptz0?=
 =?us-ascii?Q?yzezWv7u+0azvv4lApO8ec/30v83w/owHR5kZVkYM1phZbMpqL+amPQ0uSEr?=
 =?us-ascii?Q?EKbO5ibyZ0+vi/K/y35Ou0M2V/juIzszhBgGUXFDEIwt7YUANKNlH8fUgsK1?=
 =?us-ascii?Q?ZjP+aeQtoapcA2qhhbFSH5nRUqAxCflknjbFXi0DRfg/pA3GUBz6hUa+m2zc?=
 =?us-ascii?Q?x2vdFZ5HM7Q3H9jy6r4YuTQVPSmc4M+GrJtp5RPfKTQXLgCBP/wrT351IAMO?=
 =?us-ascii?Q?X4/gk4GpQ+54vL84cKV3BYNjQwC4iI49K58tGjn5nwr7TnyCYG5Y4IepRIJ4?=
 =?us-ascii?Q?t8rA3nmOl/goPXmCZIhgq48=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 544521f2-5acd-4290-6c69-08dcecb4417b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:51.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eLTLtQhnFozZwuPOpkg0nMTTpZ9Lc9xXMdtV+qp/UFdiOBHF6hqW4dFZlCcyP/OpiqVOFeh17z7cYAS2+JTiFjy93l2HD385tmpzqPLE0d71WGTsee5OtwjOvZvmYjz+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7121
Message-ID-Hash: XMRV527VEDUVLZRM3OCDBLA4Q3PMKFZY
X-Message-ID-Hash: XMRV527VEDUVLZRM3OCDBLA4Q3PMKFZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMRV527VEDUVLZRM3OCDBLA4Q3PMKFZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DPCM and non-DPCM validation check are very similar. The big difference
is that DPCM doesn't check Codec validation. This is historical reason.
It should be checked, but it breaks existing driver/behavior.

Anyway, if we uses dummy DAI as Codec when DPCM case, there is no
difference between DPCM and non-DPCM. Let's merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 62 +++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 27810f6f86302..76cfb6b115445 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2838,7 +2838,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_link_ch_map *ch_maps;
+	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
+	int cpu_capture;
+	int cpu_playback;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2848,40 +2852,38 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	if (dai_link->dynamic || dai_link->no_pcm) {
-
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
-				has_playback = 1;
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
-				has_capture = 1;
-		}
-
-	} else {
-		struct snd_soc_dai *codec_dai;
+	/* Adapt stream for codec2codec links */
+	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
+	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		/* Adapt stream for codec2codec links */
-		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	/*
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_rtd_ch_maps(rtd, i, ch_maps) {
+		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 		/*
-		 * see
-		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 * FIXME
+		 *
+		 * DPCM Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 *
+		 * For example there is a case that CPU have loopback capabilities which is used
+		 * for tests on boards where the Codec has no capture capabilities. In this case,
+		 * Codec capture validation check will be fail, but system should allow capture
+		 * capabilities. We have no solution for it today.
 		 */
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
-		}
+		if (dai_link->dynamic || dai_link->no_pcm)
+			codec_dai = dummy_dai;
+
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+			has_playback = 1;
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+			has_capture = 1;
 	}
 
 	if (dai_link->playback_only)
-- 
2.43.0

