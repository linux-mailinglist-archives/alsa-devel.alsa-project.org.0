Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF40888D63
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:46:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659521530;
	Mon, 25 Mar 2024 05:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659521530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341992;
	bh=C1knyMcMUNJElxOveH3tjXn5H+XKY1lHUCakTua+kPk=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ENjM2mJEW4E2DJim9t6mW5TCrGks1/QQxQGaghZbWTtjuiZSiUsTyGjTZkUyAmyuh
	 4ke3SUPTH1/vKsQcS0zOrfp/41xclciFad0FWoKafFIqZ2PeTSSCbSdPI+l9QmlVOT
	 vhuQ7ozmtcSjzHlfzayuSCHjP9R71rU+kbpcEvV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E6FDF80769; Mon, 25 Mar 2024 05:43:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 315C0F80768;
	Mon, 25 Mar 2024 05:43:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE1CBF80236; Mon, 25 Mar 2024 05:37:46 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F308BF8015B
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F308BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=db31W7Zb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CL7kQ4eTBCZ18vovKvNRPghjqhF0F02gHWQ9HogWlHqbh4pRkBjZyfCne232e6Nr0bx4l+DybqHuu6NJtA0thju4JO1o0ZUGy0jPFvxrN3O2Hveh4FTdsEBaPkCIH5G4usI2n8qIQM1Id+tE8VyKbS8YA/ouQDlhtB+iYMjcngGgWqd6q0DlG+p+fmGhRPQFroCj8xOoqheYJUV6nCYFi+9LGjstGmo9V7+w5y15fVbjb185ZtlTcu+KMsTmyxvuF1P7XSOkrIizdgVRlrTq1zszOLakUrBTqRWqy1vB47pZ5dKlnXcxyV3ayrUB7pXeWYs1cRdD8gU0l4bGE6OIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+puesDnBCnwDd56Gq/iOEngRNyTZ8PMOvhbqtW+Yzj4=;
 b=hdeBBBNef4DpO2ebIgw+/laRTU4xb7mt4rs4Pv8hxRnbIzO8gtUTUqdOxyRM8jJVWzQSc3UPJOZf7edc4kyHdqY3Xb+Yr+EvwDSOdMxLY4zfue/cFOLOj7k8rnw4zj5CdHAvT8f4nmgdLDvf6z5u2kAPDXLZXUXMrKU5wdQ4R8U5kLZzXTv4ru6l0S/fMCDZ46uLSYxfArjlXLIH8RIeEOjoXirkV2DHz3v1OpvwY76JKJM2OVqUzgu7Uea541h96sBftzVg83pV/qzRUKcDgxucGHWad+VLRTyHmjiGZheWD6TRmXMk5q3GkCD0lk82QExtQoqNAy97VHvvFNl51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+puesDnBCnwDd56Gq/iOEngRNyTZ8PMOvhbqtW+Yzj4=;
 b=db31W7ZbR2c6Mjk626SKuwYyzLwmXsuxdLqV+NtUua1ZDaiILe4E2qHqdcIEL+HxJk0+9Csbvd0+PgOO65KnyAaAbCk76uEgOm5lQQ6KmzBNyMpLgyNCohuNIDEPVKFZxsY8MMATx+v0fHbHCwv82IrR0OVX8iTaTt3IK3hJnRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6829.jpnprd01.prod.outlook.com
 (2603:1096:604:137::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Mon, 25 Mar
 2024 04:37:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:37:32 +0000
Message-ID: <875xxb53li.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 13/15] ASoC: remove snd_soc_dai_link_set_capabilities()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:37:30 +0000
X-ClientProxiedBy: TY2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:404:f6::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: b1703ab7-ab2e-40e8-1ab7-08dc4c854961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7F1PPMy4LKEKP0mBvtdc6pyWvLf5OmbjZeLwW2vF1Hvl/hRybJfyEFuDINGo4X8SBLvIzlYWWec6NVaFjlMitErDJUfqWYzKwVKujtcvk3aLOci54Evs84EsMMc0KhMbXD7CnvvaR5ZmQBkH20mAVtLoqtML9qi4UOSwrA60I4NU8KBIrZZIk9PNibPvW0DWZT8LK9ZpNxL1nm+dLW0ywGDT64M580xUN9gYH6ErkGNoLoH1NpBTUKa2y4DVtDm+D+msLkdAbdz0KkEEtFIc/wDfrFbv7bX/ARrLf675Vq9yFf+6yCT3YQa7r8urM+Tt0SMJYutlF1i1Q1WZ1zapje6+al1k28KBdMBaonjOIqCBTRG6jay7c08IuJg84l2w6eQWB/K4bMdoY1Rqiy3JngnVPKr5+Qadr7DUhlAhZp9webReklUcVNM73L/YoXwb4Z6aihcQx36YonIYTXhZpSts81rwUpEOSPO2uhiZy5hTLu7XCfkoMJrr0ioAGUyI3MZO812D/YU26SMYqFVt7MJ3+uNYogq4bqNgkIXA6BCS+ZouvRmKJblzMDVolKRWO9G1VvomdMzTungPIMfKFqmGlZUVEGa911cKe9fo1rD+15ct42AKmkO4HUeCZupCW8p+/AjZVlL+LppK+ENAhf0VL5dSgD0YGAxwCA0O0YtRp0SUDNRY1P1acMD4fjo0jW5Ah7MWoKjoCULW2lDkcavuOjjHPtPFLUc2U1g0W6E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8FC30UZl8/JlSg/fZbbS8UQTR9/YOz+0//gaF5QlC0LukHo4GIyB+5kJuuPr?=
 =?us-ascii?Q?A0r5VYoi2ozq7B6QBwrI3RBo1Z1slEyfi09NmHqowdR1a+qXTifnyv/eM1QH?=
 =?us-ascii?Q?n4bRJBh+FE5EadlQRruxbuIHNoxZP0wE/coW+7DcNlRcndBImSoOWEAcIvzD?=
 =?us-ascii?Q?tbGpkKQIuybD5MopRcV2ak3sn4+pXywGEyWq1HB8Rpq1FCAdjTgn/BfsYF54?=
 =?us-ascii?Q?O9XBczInfCAn7RhxdpVspCOupYQCEhZKUaBGWkpy4x1lGzS2gIrg+oypIfgo?=
 =?us-ascii?Q?zGEzSwJ3TzP+eCy6dYIkGmn4cIT8Te83Qd5XJ5YmYHqEOBiommmtk3TMoSU4?=
 =?us-ascii?Q?PeM/b5M/u2hR8tm50AWzUCh0RXZPPWFDFc1nsH0JgAwASxZH9jjMbPhWTpHV?=
 =?us-ascii?Q?/YVanM7aF7tInH4DJRrxEHdaV06GWHBHY91FK/A3nvwHSoa5kauLXjQFV+Kr?=
 =?us-ascii?Q?wnjPtB/mytFo3wgMsWMWYPAYHmj4JOQweIWvn6TVaQLpvASMEPaRD8uN19tF?=
 =?us-ascii?Q?oKGyaK/tzVbPZpT5tugMDgrKebPb1G61qOkx4YfC4dvrvVkSsjyOV6ssbEEk?=
 =?us-ascii?Q?aYFsvp4VwNdgC2IMesXYFjqmuiHoaMXx6N9hGJnz5aGizoybQzh9Q4ZNyJzu?=
 =?us-ascii?Q?l4I8DiGOKYU9EgGESPrJ5QNl8Oiyk+BC3ItQY1H9o9yQUCCtZg+p2A6q5X2M?=
 =?us-ascii?Q?s4BHH/5KiE8YE7ujW8wFRI6bNDc4SrgA5bW4LtWwYURXhcVLmagDztebHh1H?=
 =?us-ascii?Q?aUU+Y9Ep4bRQL4TVCa1cAx0YeWu9/vPMz7VNNmwpC9Wx4GbloO3bvD++uUDo?=
 =?us-ascii?Q?mjW7Pqhfw0CQgGsfxzJHpOWH/VA0jfQtZlAy/E+j1rLqsfsmwtEUyiT4dqDw?=
 =?us-ascii?Q?9GXHVLZ5OXj+sxShrjHWH2m1Rg+2/AuJHtuUnsCdiJ4gICiOJ+ev5na9085T?=
 =?us-ascii?Q?eSvjj8SZGNklvizxkiFGEMO4kzoYLUyaeCQq4fBaJ6QQfD/yvZEfKyrMzXet?=
 =?us-ascii?Q?ermjXcaNdWJoQobE6FMHJXy/Z5t52jLqijkg7wxSvK4MD+esepp4vTCnKi8k?=
 =?us-ascii?Q?dTtM4IOdpfupqEhPLAMfsel3/e+Gvu+8FM7hXtIruEDSQDmH8XPoBXZhjvGX?=
 =?us-ascii?Q?nPImV/51d3C7XjtOgP87hicUFdgpBCR0Hwz1LOg1QYmgeHW3bNUXZ/O+Nyl4?=
 =?us-ascii?Q?+vUZpNeg6BFAe7EogiT9/lLXTh6DDWrWJFLxDtNgZx9lc9Y1LOUn0svcZLup?=
 =?us-ascii?Q?v9pLDUI2LDmrEA4f/XW3Z3n91vQPzW43ReRaIS3KaxikBFj6Ll+yJoob662K?=
 =?us-ascii?Q?9RP2eoiC+Mz1PunSwhZ/RzdeK4+OZjWCCgpPjS5GKX2onCVrh9mJBDusGt5C?=
 =?us-ascii?Q?TU7gpuY+OvUO1zQKQi6jbwmJbphtM9YtM6yAfO6g8ek4g33Hd5s/nlOFknAG?=
 =?us-ascii?Q?QiVTlJNxGiUoUBStuDyUwGoix7nB0JsQ67OI3xdd9IBFFxLbt5iQgPr6I9PD?=
 =?us-ascii?Q?y9zlmU63KRRvymGmPJaeoytbSNtgxjXvvS7BrlCOC9mnUgay5UfrLGogqjBI?=
 =?us-ascii?Q?QziDYCRQwcmrOqgN4Bxr5DUFCAAtHmN3isUtTpO7Jo844LEKzJKpu44Xh4eB?=
 =?us-ascii?Q?y155s+OH6FVfUpluM0O3bPM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1703ab7-ab2e-40e8-1ab7-08dc4c854961
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:37:32.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wy0Q05IHHsTAoPa/fybNxBlHsNCrpkUxVJJJYdrvaRl1ji2zhe8mUIacR64XP9skLDPOLVj6z7aUZbYCREwtRpd+5EPG6EBRnGGlAuYs/oPxsaO3Tvp0kFy0YXLhKexi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6829
Message-ID-Hash: F6MRU2MGLSJT3ZLJMKTHC2TGRFLE5HNQ
X-Message-ID-Hash: F6MRU2MGLSJT3ZLJMKTHC2TGRFLE5HNQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6MRU2MGLSJT3ZLJMKTHC2TGRFLE5HNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_link_set_capabilities() checks all CPU/Codec DAI (Y)(Z)
for Playback/Capture (X) and checks its validation (A), and setup
dpcm_playback/capture flags (a).

	void snd_soc_dai_link_set_capabilities(...)
	{
		...
(X)		for_each_pcm_streams(direction) {
			...
(Y)			for_each_link_cpus(dai_link, i, cpu) {
				...
(A)				if (... snd_soc_dai_stream_valid(...)) {
					...
				}
			}
(Z)			for_each_link_codecs(dai_link, i, codec) {
				...
(A)				if (... snd_soc_dai_stream_valid(...)) {
					...
				}
			}
			...
		}

(a)		dai_link->dpcm_playback = supported[...];
(a)		dai_link->dpcm_capture  = supported[...];
	}

This validation check will be automatically done on new
soc_get_playback_capture(). snd_soc_dai_link_set_capabilities() is no
longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h               |  1 -
 sound/soc/fsl/imx-card.c              |  3 ---
 sound/soc/generic/audio-graph-card.c  |  2 --
 sound/soc/generic/audio-graph-card2.c |  2 --
 sound/soc/generic/simple-card.c       |  2 --
 sound/soc/meson/axg-card.c            |  1 -
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ---------------------------
 9 files changed, 51 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index adcd8719d343..69ba1a628eab 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -219,7 +219,6 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
 bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
 static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 5b7bdc5d6784..72e90e56d59a 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -650,9 +650,6 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
-		if (link->no_pcm || link->dynamic)
-			snd_soc_dai_link_set_capabilities(link);
-
 		/* Get dai fmt */
 		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd..714ce1f4a061 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -246,8 +246,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 62606e20be9a..0d2ac4c9ba3d 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -925,8 +925,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, rport, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9c79ff6a568f..5e66812ffadf 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -276,8 +276,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 21bf1453af43..0ff7dcabd314 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -338,7 +338,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 			ret = axg_card_parse_tdm(card, np, index);
 	}
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index f1539e542638..7edca3e49c8f 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -107,7 +107,6 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		/* Check if the cpu is the i2s encoder and parse i2s data */
 		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 747041fa7866..24862002e82b 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -145,7 +145,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		if (platform || !codec) {
 			/* DPCM */
-			snd_soc_dai_link_set_capabilities(link);
 			link->ignore_suspend = 1;
 			link->nonatomic = 1;
 		}
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 6f8773a8fc05..986b92771f3a 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -479,44 +479,6 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
-/*
- * snd_soc_dai_link_set_capabilities() - set dai_link properties based on its DAIs
- */
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
-{
-	bool supported[SNDRV_PCM_STREAM_LAST + 1];
-	int direction;
-
-	for_each_pcm_streams(direction) {
-		struct snd_soc_dai_link_component *cpu;
-		struct snd_soc_dai_link_component *codec;
-		struct snd_soc_dai *dai;
-		bool supported_cpu = false;
-		bool supported_codec = false;
-		int i;
-
-		for_each_link_cpus(dai_link, i, cpu) {
-			dai = snd_soc_find_dai_with_mutex(cpu);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_cpu = true;
-				break;
-			}
-		}
-		for_each_link_codecs(dai_link, i, codec) {
-			dai = snd_soc_find_dai_with_mutex(codec);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_codec = true;
-				break;
-			}
-		}
-		supported[direction] = supported_cpu && supported_codec;
-	}
-
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
-
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
-- 
2.25.1

