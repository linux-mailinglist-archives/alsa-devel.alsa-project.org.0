Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FA9472F0
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 337D85CBA;
	Mon,  5 Aug 2024 03:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 337D85CBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722820168;
	bh=a9ztpP3vFeEIvYnFOeBXW+2SNbCTx95QARjsD7c+wCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UNf43yrjWt7JdUrCK7Z8oMKnPGEt85xMmOr7cDp9Ym8yTAv/2Kw0jBlb4IpiO1E6D
	 +daxq6OPLYN0QNva6Di4EAngIbJU5FhjKwpWtkA6xqpBidHD9YMD/NggjOyvWwaNat
	 rHEqAJzkSZyJo1WWgb0kO5G+1ltnFtZmjatFIRT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DADFF89FBA; Mon,  5 Aug 2024 02:44:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD5AF89FF1;
	Mon,  5 Aug 2024 02:44:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B117F89FD0; Mon,  5 Aug 2024 02:44:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82419F89FB7
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82419F89FB7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WNUXUQdK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvvYe/+rGiGiXPtvNE2Jqod7DpJN/U3klqp0agWacW8aHoSETrU8BtLxB/a0MrG4/K7Ceb4HINkb2caTBj7G8eaYy39Y3FIaspLYgRGYUk3lPGytTSosO8ws92GAzvxHI/4pxGD5FF6RF9aOKmZQr08hbNK/TkxZyzsYBaTH4T9+3auf/EcROKLM51m58BYoXHj3459gPoeF/ehMowejNWAf/qJT54FPKyqyhYkwIgwebPUc4xrb+yV0hwPIaB4BLe7rv6aEYjJVx8oequb+7u/pnxT/AiWvwKzRhHTufKBFN5B04D7ygW2XVxal6AimuFI2W+0cjfTQ04NTsZ4q5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blaxdQ8XtGclL2ZIJhWZL0YNMNXebqSKX/sRc8bPS3c=;
 b=SRXAfbC4iY/0TA5Ccr8KKLMMXHqFPZdsjOC/ySC2GTsq0NZIabl/bbxEP/1RTujfMUWvtgPEtY+KGS3k2tRqTprlT2mZvC7exXLrreFOSE1jCnhgvkOT2E6u/BO7wekuiYVQxfn2ehFezD9aQoCGGUnZ6ZFfVE3LCoFeb/+LpzXaLRDqx4GbKGAbKfMflpSsZM6/ISZNEHrt9Vn0Dz2n8M1l5yIGo1r6jevWeoTq7IbxM2WdcUpZravn2rLMS6THuFeKbrhmXmX9GVgItys53gk8ZGLQPLFWvOkuzQtqEB38O2wn8u9BlVttTT/tjiJiyJMeN4hKvK/fbKZI3oed7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blaxdQ8XtGclL2ZIJhWZL0YNMNXebqSKX/sRc8bPS3c=;
 b=WNUXUQdK6dOt5/C+IuKW/HKhYseKSKmEzXAeK/I0IahFQQlK30dksrPIwSSVQsp/5wKyNDGvHBSVi1m3eImM8wQ3DfIZq+KpGEgnF56s1MkJ9dCUfjUN0AEW2kXqEvzqtBDk2pSMYC8T5rYFH/l9YHtaodr2x1E/UJol2qHwatQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:35 +0000
Message-ID: <87le1bvlvw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 113/113] ASoC: sdw_utils: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:35 +0000
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a55f330-2b66-41d5-611f-08dcb4e7c754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U3x9d0jTpJUctPGxIropl3Q/ItfqzKfW1cu6spnPOehI5FOHWpsclGQ72FZX?=
 =?us-ascii?Q?1phUPA4e+nrIImctngL3vg+3dOpxxg7Gvdrh2bSGw5ftMyW8PWZnxIavKiNJ?=
 =?us-ascii?Q?aJHBUxqybgZb1fTZo1zYhCaDaXEN7ZoyDplkSM1essA3fuqVdOQmCWGJ0NtM?=
 =?us-ascii?Q?v0fwVL7dWaC2K/WdJfWtFDKFGkajLr5vvnyNiYKSBTOPZHlh07OIL6oV3IoE?=
 =?us-ascii?Q?FoOIGoGI+mz5NlHIgB7EYK6v8+VaxmhRAvHvNSaWWjVCYfdcTsHNO1Pm28Bi?=
 =?us-ascii?Q?kyVumObW79V55rLaeAmiRfsciVplAc2BsmVhw6Es8u0niwdQqo9vh2vsWMn6?=
 =?us-ascii?Q?ecJmiDrzvygl/OifB8fQCAGn3VNexmJ0S0xyEZRYyx0dQFbHoAg8Pr9XAskh?=
 =?us-ascii?Q?V+fs1Jhmx68HQZceuHbfnliVd0+ROGtEWaQqlnMnuPxqZjxB1Y+4YknaOIRV?=
 =?us-ascii?Q?5faU8j+amxTnNU1fLKnSINwes9qG6jZBP2CajWPUy7Gha2hx966FbI48Q2Ty?=
 =?us-ascii?Q?Acn3AvPEyJowl9IMyqLxgAYluiLsKGcv9RxMyFy73IyKMvFtyJTtN3HseFNm?=
 =?us-ascii?Q?+GlcNnId4aGleo2Dm6z9Oj27Ccav72SBBuSvOnVCyuJKhul4ZZ2xIsa7qCfM?=
 =?us-ascii?Q?VmE67uIjudBIisZmRythzYIaz7K0Txk9O0+oOgjEFokZHjLIQgRu6m8Cm0y2?=
 =?us-ascii?Q?jcYpTCMEFps5zAwAz69l2B+q774WB8Hyi89x1IgAJgyPMf0HcgQ5ucbaTXbs?=
 =?us-ascii?Q?acIURbr3kRLPkM8CaEKCwPavql8q+1+jr9/Q6y8CqsbA3OPPHhnZqcz8lQsU?=
 =?us-ascii?Q?zRcFF9f4YE2QWwlKs4hpaKkZW855BI0wYrkv5qYqHXtmNq1bLZiYWZQZgWG+?=
 =?us-ascii?Q?BKOoZ0t9cDHgizBNOdJrDiEQHxIyL+Jr0JrO7I/vKeRYcDfIftYvsgfJHPQp?=
 =?us-ascii?Q?tm8gUfiQoQ+6K9uWrZGI1w/MJ0MzK+egc4wWOlOGVgKuf3oK5unl7sIMZPCA?=
 =?us-ascii?Q?b7fdKa6P3KfVK+8yybcdibX9U5UkyVq94X7Im3e4vhqMfyhJP3eXNlFdaKHq?=
 =?us-ascii?Q?DSkgg3SxfFJC113xGBm5QFmq0lW3G1wIh04NlftuJZ5wMvL8U2LqxkLmBUJL?=
 =?us-ascii?Q?QvH8ZoWpDum4DwUg6k2x2jWxGxx1qdU2KbBIEtWnVpjww71bOL01BETfO1Yc?=
 =?us-ascii?Q?IzXbNiQfqFuQvjvyXNdg3ueEqukSTiugHBzcVqXOfYbQ5+rAv0RpgKXRnFOU?=
 =?us-ascii?Q?Xf1Bjm57iyDeQ9JZYhDOry5IuYGUkdKCzpBMcxWvG1a5FSvEyvFiaAa3RBFJ?=
 =?us-ascii?Q?KGfT0Jc6SqmKAswQG+on/C+gfl6pJNh4kSkBA9i1GsnrtWXDTfL96T4wSwXj?=
 =?us-ascii?Q?02aqpUbvqkhViVH5lNGQPmQ7ZO/O1+ePbAdqu3QE2aE6aejHtw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wrR/JPOAT1OMa6DTecG+O4mbND0T2niAMxJi3kVE8Ml9oxzOcOO8lgBOI3t1?=
 =?us-ascii?Q?WlDMqHb51yv+AporJTbnpaaq1Cn3grpWS9Ff4KlTwie1EeY+w/xKkaVbKSQi?=
 =?us-ascii?Q?HqOuvgQGg1Utw1g9HC/U5O9TtzHsg2DIyn9vHT9uxGHtNG68L1GMg1YjwvL5?=
 =?us-ascii?Q?uur4f6lmL9AU0GF9MvsCq5bvDH7Nz4FqJlh9rlkUbq2rz4GIsI1hD4pvppQD?=
 =?us-ascii?Q?d8vseC2W58cAe/2ErEgCHl7J4egw+Z2fkGQIY2I8TS1rYw5Z88LGMFXw0JDE?=
 =?us-ascii?Q?ijSZYb6c44e/gDV2Yqy10bQAMi4d/qOQCln8maoH6RqEi+D0Zfz1V5jLlAcp?=
 =?us-ascii?Q?EXIkJ7h8EJ+L6FklNTp7DlKzN6CiOvn69kuJm0+0xFvzF3JSzDnfbBX2fuuE?=
 =?us-ascii?Q?Sr2m56ibfk+SGGueDU8BF7Bb3d+jP2xU4TUGULOR79J+4UeJ13bGsX+Xsxpa?=
 =?us-ascii?Q?LkVGcDM+YYrFyqcEytpk+peJpaqFLMr4T678gaYKEe2iPKHl3CAZ2KcHVwYl?=
 =?us-ascii?Q?PcvBFByhKPDlReMv2BYgxqPSKrQTVRdOXh9ta3bVbyCFBKvDwA1Mvb4fLe+F?=
 =?us-ascii?Q?9efztUse2XCOPJoJdUEz9moV5jQtiewlTlCANpwkPtApL6pro7DEIdUHHlcJ?=
 =?us-ascii?Q?tiouer75rpZBH71fWW7fZExYNsuerB79GlzJlOP8saZpU5GRQsDws78RvZT4?=
 =?us-ascii?Q?1gZCJWlJSQN0hTllWGWtIOGsLJHHWaUvNdCzv74kR3lGEd7RYDY5HZXoLgBw?=
 =?us-ascii?Q?o13hpinIeMRFG6vC2Mp/3n93gcCPp/VL2w6OUUJ4X6aDgerBvXoE/6tJ/vbr?=
 =?us-ascii?Q?sgzMBdMsR5xm9bTWQqBfXTSs25Ly0Fm0oiCBaaLyCnau0wMnF1Y4Ng7/FxcU?=
 =?us-ascii?Q?QdAKZtG+gUmOCmqd5CpNe0fsSLYBfesqpNSqeO22HjmOzi7QVQYq9LWtfLiy?=
 =?us-ascii?Q?bFhAEzDsC0BMZujIfQwxkS/dAIxXHhv+EwsgiGyiYGvgma03aSbb8vFqfJ2r?=
 =?us-ascii?Q?+Sbd7vbr+uicXtJSvuFMb+P8gCZEf3oWkxW88TNqN9UfT+lubEyoYypzuLua?=
 =?us-ascii?Q?bVf3tSFNvywzDLwBAby2vs13k6BU9NxpRNdMWjXbIuJ5wvGn0/gk7QehGGSD?=
 =?us-ascii?Q?AVsJ/lWram9WE6zkrXijdU6d01+4gkdWDt/t5fevZNIKRCemtVSmRu2oebwH?=
 =?us-ascii?Q?/6AdQvsITsR8itJOjCUBvrMfZXdqTkW6sjrVVZXE354ibrXTaiD+2bZ9gOHO?=
 =?us-ascii?Q?sTUZIRkz9icZRbTrQas0A+X/D6K0nOM2O7LEbrgcfgdRGYCnsiQm1nCgh60/?=
 =?us-ascii?Q?gCbxMzhyge/eR1rYEjv7iLVFPF/FeRP9kixtu7q4k1CsFvm6VoztcFkeBk6Q?=
 =?us-ascii?Q?7V9ProdAswn9rXmuNPD6t4Y4Bbp3OC0lXJyX3UtVtUQ22a05v8xIMNNkqTG0?=
 =?us-ascii?Q?hDiGaMtTvhl4oXYLBX7bTMYXw/hap+S/s7zuWO+ANZQowZ3CiBX3yaoNE0Ai?=
 =?us-ascii?Q?qOpzLmMHCITnh/DX3wryj1wRxPWdLQJGgQJyAZyZkvYILWbzmbE3OkwZdQFl?=
 =?us-ascii?Q?9J7hxC/yQipcAziWvJ7iOi/a4p5boQ90dP7+BMQiM7F45w+HXceGJVLF0A4o?=
 =?us-ascii?Q?hVZ3pBPRPux3euECqonGCnA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a55f330-2b66-41d5-611f-08dcb4e7c754
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:35.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AnHYKSM6WIXV5velbyFKWSCQcB0flOciGVAVdp9dz5cg7lpxYyvpliapCckOCb0h8AFOI7XmEVDgKC/13QGr5ghUJynrlSmCzPr1qHmRCnvtZz/ewcwXAjO9aE59VnV3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466
Message-ID-Hash: MEEX7AVX6E6TD7DGPY4NTDYBWCS26NT6
X-Message-ID-Hash: MEEX7AVX6E6TD7DGPY4NTDYBWCS26NT6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEEX7AVX6E6TD7DGPY4NTDYBWCS26NT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sdw_utils/soc_sdw_maxim.c | 2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_maxim.c b/sound/soc/sdw_utils/soc_sdw_maxim.c
index cdcd8df37e1d3..714dadd75eedd 100644
--- a/sound/soc/sdw_utils/soc_sdw_maxim.c
+++ b/sound/soc/sdw_utils/soc_sdw_maxim.c
@@ -54,7 +54,7 @@ static int asoc_sdw_mx8373_enable_spk_pin(struct snd_pcm_substream *substream, b
 	int j;
 
 	/* set spk pin by playback only */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return 0;
 
 	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 6183629d1754c..2b8f058450b25 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -750,7 +750,7 @@ int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ch_mask = GENMASK(ch - 1, 0);
 		step = 0;
 	} else {
-- 
2.43.0

