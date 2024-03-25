Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21B888D66
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 387F1211E;
	Mon, 25 Mar 2024 05:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 387F1211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711342007;
	bh=TolPqo4VI5Gif/+6G3oNP6FAhQwCwhpzsRmS3bv+FTw=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uDWSsfBKrQWd+yEd2V7uP38JJ7y2RqXDvBewxxg86+vDl69/s2ABwlVmzjP3eBtN9
	 SUxpb1WC0Xw/X6YI5wHOymC/O2g+982RsUv8cPo5dw39qd9cd7BCWxKsgSvVtkUSMz
	 LUvqWgOC8RbVjIwadt3vtds9JguKANukzKT1jvd8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39AE4F805F8; Mon, 25 Mar 2024 05:43:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AEA0F80791;
	Mon, 25 Mar 2024 05:43:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E95D9F80236; Mon, 25 Mar 2024 05:37:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAE7EF80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE7EF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WGxQrS6z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKd5tutlqsbgy3BS3xWoGWcosycB+rhTRRENqzx8c7CWYC/HPYtqlDfA66srH3wOrUstTpUcdS/EEfXQAP7Aio9xwtOPVuo+x+Wan97RLt2ZcZwZVVX+qSrL5oibnDX3jFCQ0ap2YIAyNV8FiKXpJOrcAcfCI1usiW7vqyCyQQQu+ckLJg3/dteQi2NtgoTk88pGiar4a/+/J2ENYDCPznP88FL3nuotji9HbfN+Se5ttwX4kRFMKGu54BcTFultlirwqSA4LRrsTIa7uhSHJmZxL1xtAmoD3p4NXC4/fyMcrSHDtIkgfgiAHzdusglzfdeI5vtkD+32fn/4EnjiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeiO+8+yFMn2LWLKD+CNighW34j8Mf5HDYlPdHUfdqo=;
 b=EcVdeNmsrzak0aIBaLcc0o12+jP8hWaNjBskDNgMyawORgxhRcX156ZuQBsr0UHgKJjnaCzOK6VxZDR15+TY8yuQMGgyLAnAw5x+RARdisIcTI6KLoq8/BxLZuFzULIn5jAxQ64z5AwwvV5lyhg9JE8hJiwgLkMxlAH88DAehtWWUcgWagpWwleRFJGroi+NiG/8tpr5cdpTXnW54cHs3tRaamCAjZ31qOqU1f2nkcbEY5CCqOGmtL+XHU29eEbySO+vAaRB9/hmMozbqYDGLiwU52XazkKqw1S33LzS/wk8MwjSX9V2NxGijLrq5q/Hsd68sS6XNQR1pN6WYvkq4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeiO+8+yFMn2LWLKD+CNighW34j8Mf5HDYlPdHUfdqo=;
 b=WGxQrS6zYbT2/gvCLL8sUpeXC0DDCDwN+1IXC3YHSpZVBEYaiUppAlho9R+CJ1nqRpL6yHWLl2RTcY+cGd3XchYnFolal15ipJAB42xC/wDNJ1fZhkc7mglpSXh8iDN3ljOerTq5IiuxGdEa1QUdkJFEgenNTT04sfMiaIHXNKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6829.jpnprd01.prod.outlook.com
 (2603:1096:604:137::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Mon, 25 Mar
 2024 04:37:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:37:43 +0000
Message-ID: <874jcv53l6.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/15] ASoC: soc-pcm.c: remove dpcm_playback/capture
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:37:42 +0000
X-ClientProxiedBy: TY2PR0101CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: a35a63d1-5a5c-4a96-3e7c-08dc4c85500e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RMFwGOakAwoYzqu8fUGN/l/9fnuJx0hayV+HESSsgn0WHNnFqgT6e38kJ7fUBQtgcjP2E3jPEgGk+pNmmOH6pvbGd+HOlEAlwb++VKTjxiX+wkRXYVrf5t9YmZ9sOZyyqe+cALnXHNTlLk6wBe/+2ipwzBfuNikSGyQFOgDwnsBp7rYAE79UuYFRHV/b1+E5YZqMIvqXmu3ehY08uFs/S/mX/lGkmkfkZ3ZrROrD9S2jN5Rc0FJWMYZVCW9KjHgeg8KNkJScZx/r0Ew+m7lx5QCaQxIk0CUOWzo1H7w/vKPOBVqDDUpuhaOgA3i8twG4w1OGfg/RwoHZme1VBebDBtvDcB66Cx/BKbFnvua1CsQfrJI7jRcxike4LuhcX7Xy7fo6aZXYqu/G/CjJ60bwt95M09fCPduvC1zYV1k1hi8r8dmBrbHIasGZ/mOupqAL9jWP6TDN0XqGhn2x2raYg2/RW/BFXsJ6ngDeP1ECGCYjHVpdAaClOPI4kTA2ONqpPvoqmqhCCKH/Tvo21oAjQXsaTymlK5Yjzafxj5YCjxVnQqxCzks/WlGdFUSwSo6YdDqsHnUJkGTpzugn6EXxleuovgpEPWkJUGjUjj3ZPxaIYwVvUwU8we4QCh+gVqRqiGRCar6RTe8tAruEYIMXKXGQmpoMwT1Sf2tX+8vad2qkT/koO/2qrWyhH9agy62LPWcSWzE/aMUobfeTzoLg/VHHEfdBP1QNd1G8rm8HSak=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tcA6bz1k+2YvOTmxVGAYd9Rern/vYuzYVNzcSd+hrSpkSd+rZFxyR5hJE+wa?=
 =?us-ascii?Q?JJcA//ZE6DT2yFIBcdPL7jNxGUCKySviZcC0fPhIEmNudXkZLXl6xlvKYfxP?=
 =?us-ascii?Q?eKg2HZFru+AWAsKlfXp4euCR3h6BaaRXoUR2HY3STKfd/EhqqzccXsR2JjC8?=
 =?us-ascii?Q?56oL5TwVQhfU+IfIqihuMBzZASPNy3ITdqwi90t7CrXQVmwD4f7Weah/gqTr?=
 =?us-ascii?Q?UhJWexUWpCNp42RwkRFKUftl4wfXZ8v8gFVACYe/AzjXRVElUbuPvvOsKs0k?=
 =?us-ascii?Q?zoI591c1NgEkwMpf1izsWkiVGDKBv1gFqM/MSir0yIt0AhDPROaTJns6KAcj?=
 =?us-ascii?Q?6ceBxGhRTfimohIwGixnv4GPPlBbSMBJYsdun2ogxher3Kd0uBgOEpd3hDbt?=
 =?us-ascii?Q?nMxiMgk0ech3gMC85rOOEFKXq+JIyn+xFuvtATKUaoh3fLJJMux+S9zqZD9E?=
 =?us-ascii?Q?D36yHHmuTGn0qjqUHNX8VmMr9g96Ev8nrV2tubKH9WRj+vy3k0UjnFmWdlqr?=
 =?us-ascii?Q?CddApYimkAdYB/tfaVbsOEt+PHByCMwsBegZjenZDbYJTOi8EoI0R7uvUUvO?=
 =?us-ascii?Q?fk2SZtabSOAgH+hJTHi6U7dpykyb9YTYAZqKVPn96JaPLrzq+I70AyuaZYa5?=
 =?us-ascii?Q?c1m4y6iLRghkyggrTnCAjNvDcA6IVZ+eteS+Hr4VwDOYP2LJlx5/O5ywhqn5?=
 =?us-ascii?Q?qwG7PHN66N/W6ML4XMu46mi/iLNKzTbPt5MjBp6QvzTiFIPw4A7GIYH7E41a?=
 =?us-ascii?Q?wiaD+7e5UlsataDlx640HDxlgv9R2y+QJV3SCoyMqAqZNTeEVYToOemHYGwY?=
 =?us-ascii?Q?FBCJyB9Vpadpe4HDXSMBu9CJGqZ4NFvtCVswUtGGR1SjFuwTDZqbwrmM/3l5?=
 =?us-ascii?Q?ZjqzgLUOQLloE0M180M66AtZ6mT5OWEFnwlbYY/VRdxaaQLIMnW28o8ZU30R?=
 =?us-ascii?Q?vvZxfQfeG0YjYYCg0ZzWZ8ImIGJLdvDJyVaW73V2EiE13Tb63++3PmDCOdHL?=
 =?us-ascii?Q?a/n8Z8oXeBu91wvuN0s4MYuhgWc5bZqeoUTtT7xDewPk0tq9xr/M4Uplaf+7?=
 =?us-ascii?Q?MODL0sZGqRYE+3Zce7biJaC8fR6v/kLxT21QKhE+LN6bysz45pTv5CfaVz65?=
 =?us-ascii?Q?ElNzw9UEOBzeIKvud4ZiNLARhQ983WdUe3lOx4Eo1WO0nGUAnSXXeFxRKrGb?=
 =?us-ascii?Q?a4UecklWT85sS3BDUqBmlG4lIYr81YvsUwm3azosshVfY2W7izsKbUpCxDW4?=
 =?us-ascii?Q?QFw+2pt4f44MP6UZll4l3YzwRKw6zoY2WID8WAQkDUoL5Np3vef3zigDJcuD?=
 =?us-ascii?Q?U73sV5LmbPH35ee8h+qpFuWq7UnM8g6xY9BlKX11Y+dITmoGMn55wKo5csBt?=
 =?us-ascii?Q?sVtFJDXQP3HyqxSKOEVbGk6jbVCV8P0rbejvEnlDXcsyEzN1i2WJxj1HKKO9?=
 =?us-ascii?Q?7dc5R+5CrEnFNyiGmmEuHRanjfZJ0yNShznZrVGRrRl6d44gnsTJ6MIajuN5?=
 =?us-ascii?Q?HhNreR8u5zBZxAiWa3F3rFmz4+4mbJCoVmotgdYrP0mP2ed5PyrOgcHboX+k?=
 =?us-ascii?Q?PjM8QF54WiMsYgESU5DeVgMzWLv3baNYht1BtO3R3RY4DbO9/70VNTrONXMu?=
 =?us-ascii?Q?M7xuGjC3zT8pcnx3vaMq3/s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a35a63d1-5a5c-4a96-3e7c-08dc4c85500e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:37:43.8214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ROfZ+4Hm0fNvr/7cZrZZwC4RK82WGJbW36s08fQ9zj5onuv5w8fhcCypZvrwnkVimcnrXejXIdo9n4P82viM9Dfa5U7BV1uuCiIU5puLyhz/+ZUmKl5fpB7do95Mx1Po
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6829
Message-ID-Hash: 3DDNQH4ZKPNQ2WIWGWZ4W7DVBJY7YAQK
X-Message-ID-Hash: 3DDNQH4ZKPNQ2WIWGWZ4W7DVBJY7YAQK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DDNQH4ZKPNQ2WIWGWZ4W7DVBJY7YAQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is using dpcm_playback/capture, let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  4 ----
 sound/soc/soc-pcm.c | 12 ------------
 2 files changed, 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 39613b406b1d..6030ad29d2d6 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -793,10 +793,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8761ae8fc05f..ac42c089815b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2808,18 +2808,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	/* REMOVE ME */
-	if (dai_link->dynamic || dai_link->no_pcm) {
-		if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
-			dai_link->playback_only = 1;
-		if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
-			dai_link->capture_only = 1;
-		if (!dai_link->dpcm_playback && !dai_link->dpcm_capture) {
-			dev_err(rtd->dev, "no dpcm_playback/capture are selected\n");
-			return -EINVAL;
-		}
-	}
-
 	/* Adapt stream for codec2codec links */
 	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-- 
2.25.1

