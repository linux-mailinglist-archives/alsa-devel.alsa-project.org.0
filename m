Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F981888D3E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:43:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A42D514E9;
	Mon, 25 Mar 2024 05:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A42D514E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341828;
	bh=E+Bzyzv25MKIc/iKcAN1ZwvL9ULU5WkUl7Z/Dqvkw3I=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JEer8GI5pCZLujZJgo4lO/4tXj42JMUv/hSjZbvQ2XKqiPyqgAkmKUrPom7zqZGNO
	 m9Ffg+6g629Y/j4QkkL6RNwTLAKJsyzmA7IoHgpOUOb12BPjV0ZXW1Cdweqf5ls5ar
	 krNNE3zNVjHVdYB+jq8qbaVgd8ue8iYKKDgxVHDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81D8AF805F1; Mon, 25 Mar 2024 05:42:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FA2BF805F4;
	Mon, 25 Mar 2024 05:42:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0546EF802DB; Mon, 25 Mar 2024 05:36:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67196F80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67196F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IuCUMhpc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR7slI8R+dVnmEUilgL4kf+3xlHsYKiqUgJl2tXTVzhOx2ziXHwCWVz8q7Lv8OaZMDOjjQ7yqpQIoMub1X/Yn6kHd9zGqJicTuK88c/agU/XDG26/7xkiY5CApOWY2Yib2029TAK/0SSsQKCWswmahVggEy33J7KyyrjNWGnrnye7J0o2kNLdeGg6mkgarQ8ZwGuPOXYmmMXg0JWbgWrDJcVtBLc/ZKmOW7DJPmrieO4pPUMAAEIny6zd04RfWBUv1td9Kzs8V3Jl/RubxnfvfZMQ+czIDWaI3tKKHeuDOreX80GbbCuPkJkLeY0bonwtY/AVKCNhOXOtreEq4b8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKzwwxP/L3scvwNLFIwZ2rhzmgTq2q83UIQ+nVP0lTo=;
 b=FHFPnr5/eBpYzSe5/7hHmIcr0kAuzjITb5GTS4VSTrCJ58JPKX4bHRRYvAS3E2lA0FYKAtHq5m7Ei5LYXlLsQSFzP8a1cxk/G3hy65zBnlUJPNL0XMpwxREdp2T+oVzUfyAlmt3v+ruI65QXcyAT42F6Mkdyzu3ATuEFrOKxTNBvCYR12YLaPqZrGRC2nZqtF/e6esieLaYpbFdRFjoHBwN5Q937osZXBbTx+SO2JKLeDkfhTT3n1EoDwB6JWDt8aJ/kgJj/Cgznzx0m5aQbE2qYzdMizXdFggBVYos8gQ9iq9Ecgqg97L3OBjmJS3FlTQKHPBOY3mDDJ1VuD1+P8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKzwwxP/L3scvwNLFIwZ2rhzmgTq2q83UIQ+nVP0lTo=;
 b=IuCUMhpcS6U7W067nZ2HUvz7N98yss4pzz9mvYc3mNKBBWyoqJlESeuR86mZHCmttsExJOqciE/o5a+VVXsSD38Er5LK9QaB/ksBFKF1xEyIPe3pPCQgDLT3u+ZvwiAW696dTioPShdmdvOxUA88fZqSF65IW0Qq9e9B0rFNO9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:36:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:36:26 +0000
Message-ID: <87jzlr53na.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 03/15] ASoC: fsl: replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:36:26 +0000
X-ClientProxiedBy: TYAPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f62cee-38ed-497b-461b-08dc4c8521de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5gh8Hgxqh+zhQxUg8fxtOkFaXCDezLtMKXZq4A9pzFtSSQClbV1nUcTV4NUoTmIEPXOT5fU4KWk1QUkzf7yj4kPn8gTKxBkL3OJZxf7yA5Z2hm+QINKFvIED6eu+46E5RlRL47Eur3CSpZLYavRbuwQQ+MwUA8MapsdVRvZlbQBPg8PnEgSUkY9xVVuvpTEUp2QzyTSo1C/CLchwu1+OsVfJ6r5IFgdJVkmyBVMc/CI0f6S5r8o1T8TQ9tI8zeLD4LID4PlwFpUmPCGdy2c9p+/e8zy4cvN+uBPHfofPWpboIyMAIHZ52paoSoyavau2o6KUNO9+4UL27pLhLKkJUnlAs62IUsne4PoPRTlYJFAhmGtCit5aefr3bfQD3fnsMHlWAt86cT5yzpaWF9yLdL2JCcGDHMB3YbW+JB4Egqix/UqRwpReR9HlX3KxhjPrn9tTef3WZHjGT8vqHEqJ+nyeCpavatPI/ax2AYx33QHMsetaXBIEXvq9KVI+xSn7Fh5k1UYzNZ3tUJx+xwoP+xN+1Y7wT9XKosRa+WhNcb61AUd9lF70JvyAFYQ2KgPj6RSMcv5OrD89359VkUb6oIxDn9dzQgs3XIeUcaGm9aGseoAUuPd3Zkpfx/eXHM+LZikUBvvHnC6bOjYEx6+2scb3mLZLNqxI5ojV/MN+ryWTN33JwXv2tnXKztEz0REWZ1r0wjghdFTTlxL6bEf4gkmVZiVkD/iH/CjL/mpBDYM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oaH8NzC+N658iIJP0pqKMSrmRBa/pI4wMN4qjv7xwSWSC990Unt6KqmOhqfC?=
 =?us-ascii?Q?2+BVt1aHs88W7rjP3qdayNCA+zHgtY/HbBeTbZzvU2p0m8R4Z/0XiKuzoNbL?=
 =?us-ascii?Q?VYlnZUJe6xra0HnL/eey3q6V2UEtJPL6MX6VZXRvIMNtpKBQBF9xxaCQpu4Z?=
 =?us-ascii?Q?QOJi9BkWWAkFYk/JMhXFpH0i+ymyvMijQZAq5lEjUQsJDxl559CA4fUlVTeu?=
 =?us-ascii?Q?s4if+sXKgr+yH3S/18cfgJ2E5OzHfVvHlZ0irlGL9x1Z5c4sAiYcBpJL5vVp?=
 =?us-ascii?Q?Q9LoPhLyluMNMySBs8arzfOe5Uy4VnLdAcPtWNWtP+/3Y6aD7W6ntlFE3z+s?=
 =?us-ascii?Q?k801bAXCVqHsTPIPKiU8pyc2oTuKRJT8HV8+r1n7A4ceW1nvYXuN3C2ggIIB?=
 =?us-ascii?Q?E7sYBwaBo3ltVJuNJge+glFXd7jhisANRXkBx4K9LQKvPDE81yF3cw8AXOTk?=
 =?us-ascii?Q?SpERDPqy7vwI+Qhw6yxLGGNpF4bWoHd7T70+YkmKzCcnfw9mffH2XNZXRyGg?=
 =?us-ascii?Q?oUqDY1cDeUfL5vNwLlrRLgX312Ekqmf9OCF1z07bhjsMORQeO1A8tjOO5fz1?=
 =?us-ascii?Q?nKLbsgD5ATDlrnq3S1gVGA9Xnj87879o1ciysQ8qnBLxXpOgWXENzB6pDvLU?=
 =?us-ascii?Q?rfE8u+7ODtXmW/TgZA1BBHhWkQ3r6l40wi8otNh2W0NhKOTiWvOiTiMg21UQ?=
 =?us-ascii?Q?ogrIxHSnnaY6X5BglcMZjjI5Dyf8xD2CV63I7B/urCPP3Pv+PprpWJrbAaHD?=
 =?us-ascii?Q?6PmFPK+1Dsivay5R60m2CMEalTtWGgMhzIKo3MyU5IGL73BptvKnuuExzIrZ?=
 =?us-ascii?Q?T4eGoatAPgfMjoNXHt5C7QRR1BATdJ9KExwsKpYwcrdtmz7HlEnLh9XPDJ6q?=
 =?us-ascii?Q?sCqQTexROT5StrHKYffXTMY0FkmRqt7HeYYMMyH1aFQ9etsdI+8E4Dr2KJSL?=
 =?us-ascii?Q?ewgluk6xa4a4cQDeA26bNQDLlcgM8XovsOHk04CaA8caSpNi74JC4VQevuF0?=
 =?us-ascii?Q?zY0xephvesn9ur7RglTVNNJw8v1zbzWAlJa54NznfLNX6hrFyLC8ox6frfJE?=
 =?us-ascii?Q?Zi6L3XKLQmxciqLIphDkZUNfAu6TWJMVfim4J2/rtp//HRGC+nNyoNUbRllV?=
 =?us-ascii?Q?4yGc+4ul4h7pRJCFE24rueYQUtlRGtXun7nxNh6ZWu/gsRZa/fnE9rb7h3JI?=
 =?us-ascii?Q?u+jlX3UnkgasgUo8qOR9imJvehRSk6tywmt60hM4lPYsxCM9+5knhDtA5coI?=
 =?us-ascii?Q?8r5jaSghPotBZetuLz4xZ7n3I6FRi4uT+1Axe+TkYRxIECUI8eN2AaZr6G8Y?=
 =?us-ascii?Q?Xz3gygo9H1X/tBEJvC4mNTtXGxHthsm7V9/w04bVmZAVBzteoQkqEAYcqF9x?=
 =?us-ascii?Q?qMCoNO0ppI3ojzS6clqk6VqIITsV6vK4Wr6ElBbEGxGYnpC/lFWR7ObJLNP2?=
 =?us-ascii?Q?lr7u2ZgPymt7jYlb7Z2Y1plA8ayJu9KraV2c7cn9opLGnYLmPaeqjHYIVN+T?=
 =?us-ascii?Q?fZS5DNm3mZgWAtFWCKWQQkqqk8lgv4R/Shk+iQzpJrvi5j6W/op3iabnxtyN?=
 =?us-ascii?Q?kJtsg0PdBOXfJcgWoKnZDx0KLEtdxoV8Ns7aCYDr24AulCGrGE9uBdCAdrw3?=
 =?us-ascii?Q?dTp3eSwTEy7Sahga60eUnGs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78f62cee-38ed-497b-461b-08dc4c8521de
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:36:26.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f6n3uC6+bNbEmLrN6OHkdHvpmuezv27qkUpLklhDQmxv64L3kNlnSeGBC2QH3od8BlJ2uwYG1NkmLHEjlEbqFDaQvGe67XZrEOYRI3Mz83zWsw6AR1nCXu/NkGkddLwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698
Message-ID-Hash: HHJN4XJGQBDVNGOKNH2RZBLGFEMYCMRS
X-Message-ID-Hash: HHJN4XJGQBDVNGOKNH2RZBLGFEMYCMRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHJN4XJGQBDVNGOKNH2RZBLGFEMYCMRS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++----------
 sound/soc/fsl/imx-audmix.c    |  6 ++----
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bc07f26ba303..060514743ca0 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -319,8 +319,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(hifi_fe),
 	},
@@ -329,8 +327,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(hifi_be),
 	},
@@ -648,8 +644,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -675,15 +671,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2aeb18397bcb..8fbd6fc8af76 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -258,10 +258,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
+		if (i)
+			priv->dai[i].playback_only = 1;
 
 		/* Add AUDMIX Backend */
 		be_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
@@ -283,8 +283,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		priv->dai[num_dai + i].dpcm_capture  = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index cb8723965f2f..5b7bdc5d6784 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -817,8 +817,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.25.1

