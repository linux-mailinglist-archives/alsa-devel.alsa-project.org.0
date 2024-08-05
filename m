Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A59472ED
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F294F1A;
	Mon,  5 Aug 2024 03:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F294F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722820120;
	bh=HDLM2abrOtJiDSbTqFAxp7eLsOFWIRPf9jli6rlyiCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uyKrL+CXqaqPwUmaaE6Cs4BuQeklyiEXhKzqW4RSQQDoUgqlGdW8DLllYr+n+sTdX
	 54EXtfpU+Yq8WhwofS8gZDa0G4Qmrw2BgUJgctMzeMUeftVGNk019WKWH/P5TVt8qW
	 UhMYZQ7wGWytb6V0kwrAkj7N0nARQAmMv/LfATQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28AD3F89FB1; Mon,  5 Aug 2024 02:44:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77B1FF89FAC;
	Mon,  5 Aug 2024 02:44:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C2B8F89F84; Mon,  5 Aug 2024 02:44:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FD6BF89F76
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD6BF89F76
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OPjfKY8Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrlGxtJk9XPIY6hZsdxYHFr+ltRnm/Wh5yK8rHCkQ4Su44ENeotWApHv3JlqfICoMWelSFbZE+rVuZoX5s1vuQFn1bwO99SNx0XlXvc9+Rf4LsAkQ9Vy+q8p9WkfYZKSZ6DYTeN87FUCM0TXWn3kZ6ZGYQVBs4mGtG0E2F3/OC9CQD/AIde3UZeUekbFJqs352zzg/c2P2H3u/HegVFN2wMHOOxHBk0pgDhKk7yzGycKFJiutq8a51zYhHMKkiGZ1XFlAEkU4Jt6wgJvhOMVlBjPyjWFdRoeifnvMJR30SbKMD+qNiD1gFlfz64XBzGuCzS2Cr76U1pHjkfhXvLSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2p1el4yLQRR8pMhWBfBlMJO/bZeEGO4s5MS9OnFS0Q=;
 b=n+dUFpCdSPFBTveX+Fmz38oZ6Tf5DEcI8MPWueW2J4aauC8uWjeH3tTACbXPbjSaeTrXkicQNSpWggyNSKr6Csa1ZwQpIatayBr1e7YXQOk542LWM10H7YEXeSFGf0Vo9a/3JyDVjfrdktbtyoHKdE7d33wxKhIcYBshUAqa2XCOaTOysDhkpBPQ3cZw296Cg1k+/jS8igoYrn7hrz4O4hW5tKW+lbnSsxrBvgdqmRS+9rFHHrkMNhgPs3558bMXrUvKU3pJLWMdIFODRPVUlDz78nS5ZhEtDjh+RSN68KRcg3mH3hxtkqXOHKSAJsm26W70RZoTml+zHm1I56FxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2p1el4yLQRR8pMhWBfBlMJO/bZeEGO4s5MS9OnFS0Q=;
 b=OPjfKY8QtAWjPkr8tTtbKK5xAkGF7sQnAYbwmCav/tofwfVIhNQboTiyV3nFjxZqeDe0q7qBDTcOFZkaWldAwtgNCpxf/a/meozbeaP1XrlDW+i3h5EKmtjSR7fY8PfeKnd9cbzMwFbVJlyj04lXaMSVNg2cISqUR3lV4aS+l+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:18 +0000
Message-ID: <87r0b3vlwd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 109/113] ASoC: rockchip: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:18 +0000
X-ClientProxiedBy: TYAPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f5d9f4-de79-4878-bb08-08dcb4e7bd64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/ZD1uuWgPRAEL2QfGcKEoSk7lZvagaiDwarJWcpbufp+qlnxSjPUOFVLgyFa?=
 =?us-ascii?Q?mMqvwovaS84JgDX/vuj93IiblyNsYEC8HZKexHDW6g8lv79oDh/I8s8D3nox?=
 =?us-ascii?Q?1DrPy4WRpVGM+lZknqrZB1TF28VmwCzvfp7EkcBgWaS6qsEGSDIDBV83E9HL?=
 =?us-ascii?Q?8DJlkB7Bi3d7eiBtYcta4f3TeR6ZxJRfOxFdZUb5qwiqyKjm90RtQVFowxCR?=
 =?us-ascii?Q?E8rOccioAF9RHCkk55hGSrCKCJZR1MGMprF0kuypWrVP+zsGVGBb3uRe7IFI?=
 =?us-ascii?Q?cIJlAxuPSQGCv8IBR6SQGdB2dldgkBOK3CbfWlPb8SqwMd+FPkFdT3mgFniX?=
 =?us-ascii?Q?ntISYsygOyyLHDmYClSCff7VeD2js0MqevKWBb0O0JrsjiI7ymJpwQwiO+fq?=
 =?us-ascii?Q?7EOrGM9TqnYjIlNNggPI+eGqLNzshqbK6wb/bGaYBaclFjEZ9mCvAKYW+WjN?=
 =?us-ascii?Q?hO5dbf1zYyZ+7ZtWXaDdlGxSmX55MB2uxrxZXqphw4fs5V2raIpi3rk7gLH/?=
 =?us-ascii?Q?CGhnS1E9KWTl06uwTyx5DpCjm3eyTE3RY2t21RrNZcBnswgFFCrYcJ2dbjRz?=
 =?us-ascii?Q?IO3nrC2LhW3FLMlXWuCRGbtStZQ4AHTEVTFpqp6lUdWra5ts/XS1byuKOx7a?=
 =?us-ascii?Q?WfJo4cv+VIMmPeskjwhvQhTMpGN8heSsXm2SfIUiQp868JeGSI5Q5oVsBgb5?=
 =?us-ascii?Q?k2vPEsDLPnzNLT357PtosrrhGObZTTzKvzseVj6E7bWXwamY9tKz2RTPOFTn?=
 =?us-ascii?Q?FPB/Han3p0Cv5sA8HTSWkZLi1STlDCLVpFxGxOqPUwwLn32jil1wy/MBDsH9?=
 =?us-ascii?Q?2KC2WOVIa129sZ6tWnm5OBO4mXvec3UjkXMG6F/rkKYl9X/GZERaupJf6xox?=
 =?us-ascii?Q?w29OCqT2CMGEstYWI0+aJ+1cuDzMMxmobdR5oJsYK0J5cxPzRueSG3qqfHJT?=
 =?us-ascii?Q?xDpmMx2+ahDR7ZP7GGlbONMIiGCyIH2dSVoCKI+ukLIO1shYbqyTwcKefcEV?=
 =?us-ascii?Q?HjVZ/irjTBQowCJX1NhLnGpyCx2V6zZo6GXVpXiiEPqcXWdn+1D0TphpqE8d?=
 =?us-ascii?Q?s43ad8txGS2NvgMkX+P+/h+IuDYYvNpyGiSVGr9SiY/OUWXsrsOyYEfEpDFC?=
 =?us-ascii?Q?MCycl2XSI9arIgD1soZdhTvW4cXg+4kOBHZ707irb4iwi13UKh6kz/MpnlZw?=
 =?us-ascii?Q?5aqVuayswLLKT3Lf7tDV8w2V3msc2Ja1/t/sk03tVyuNIwAVROExecCJ6cMK?=
 =?us-ascii?Q?9ykfFZ7gRfTfuDFm4RmLJdFlKqvi73ANIlVhaqkPyIcqJOvve2uo0fTHRwoq?=
 =?us-ascii?Q?AyUBFrbbtKyb5BWmfbkjDPv7tvo1Vs4nUYAuoaZXTSHUpeS50z6BIbc5KB+k?=
 =?us-ascii?Q?vdHQxWtp0GwJrhH7GWHacei5XPEpIVADyRHVhu7/cUdK9fMkew=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y3naQlVNn0RIj1HSSIf3UY0fgEk/bq1d72h1YMxD0UfNhHz3Ly+OaGepgGWN?=
 =?us-ascii?Q?i3MXvQbHfwHezve9CfHl2vZ3/nbbumYlfEF8SNHDhux2zEaIrwhX+7KsEfnU?=
 =?us-ascii?Q?05ZzwvWJkd4MXbQU/aSPPREuG4d1ET2ZrjSuHwq3CKgiavHSe4L2C09F2Zon?=
 =?us-ascii?Q?SOsbdrBSxV33hTlQcjXdV7DXj+Ak2vsj2eIUWR7qmH3+e8/BG8bt+BNxi31d?=
 =?us-ascii?Q?st/cLwCvep9ayYfe51G4kxNHq9+nwhWuzvUfhqgj+jwP2TCNGOfYILEHyFQD?=
 =?us-ascii?Q?3mvFu5fFGfa+Ad9OnMtkVmoP3H+S1oZcsQ/H22jpSLSGHgIWUxy0ddDyBKDO?=
 =?us-ascii?Q?Km2JCG6CwLH66//8kOI1pAoJu2OwS603Ffi8GHuOJeCv2VgC0iTzud7GCSBI?=
 =?us-ascii?Q?BVaeYUtaf6qV0Wwbv6dZY+35oqd04tDhbbC7iUOLooSJWaLVivBg2WaFDE8Z?=
 =?us-ascii?Q?hE4tZLkbYYPRg0HLnhJCxfOmXD2uS4ydsip1pzf88QXjaRtfYa2zs6cYTNpx?=
 =?us-ascii?Q?fHyZEVz5i1smahtY+tMbI53s4647oxyWWqi7CRL7kcyW3qJny9SvWXIX9g6d?=
 =?us-ascii?Q?kV8DxpJ8K7vD9PCREW4nLpJm0I9bfos/V8xBZHeEuujUBaoGlnusIxxJwF3J?=
 =?us-ascii?Q?17dNdKk/kzqfnXfMTVTs1WSi49HlYnTTnPWRUyv9m1vyFOguwUkzuVuPmbYK?=
 =?us-ascii?Q?VXhXkBDmGiUXl1vGtIsQEvpyaxdLXRHocKJV/XDDX50hFpPEiS0xNnWIC4Ec?=
 =?us-ascii?Q?ZdrMcO7NqV46qkzu75m4PJsvDct9NXZinnv/2faiMRxE7rMm3aea8XKbsvL2?=
 =?us-ascii?Q?F6/3CJteRuf7An48padlzB5d0QgU5MPxdlrmOzoGkAEzucMs6Qp27oLUXvDy?=
 =?us-ascii?Q?kJnIsR2Xaw+/q10TUabRM4xax/b8FysuL+n54eSL1VDIxjl55aMePl4Cs+wi?=
 =?us-ascii?Q?G5ve+PYnBP2H96J9jEKAEIpKrhoEFgttURv+Mn72ezbGCUo9vJIJ0kuNAEMQ?=
 =?us-ascii?Q?DNmIfVz7o3FYh09DSTzmJv7OMovZwgVTvL9l/mYgusUjWLctzC90wAxgx85y?=
 =?us-ascii?Q?UoJbsEhL5iXyv+bJYLzFX7ZW+zBj1FbrpBiwS0saOHf1oeQEAjQ0YqeBwYRz?=
 =?us-ascii?Q?CPwZEmF40MTrmc4ucZAZp/Q2JAVVotat+yTMPAz/Z8aw9+nEnO1Fabw7rmRN?=
 =?us-ascii?Q?j681K1d5UCD15z3hZACwmoWsDsJB884K0L0C7j+rmys55pc/oZwD6Be+r7Vf?=
 =?us-ascii?Q?UTKUEkwdAZLqXGcfgtnLRp77etmp6qgnFBAcpQsDlzKPBPLdW8r6N//IETuq?=
 =?us-ascii?Q?SLX/qKEceRmfCAzBtbJO4DFidKSV6iaDHrYu744NZbXnTPR6xmsL4mAQ7kDG?=
 =?us-ascii?Q?tgVPLy/LFxuFfdG+dXzl+pxwlGl1nMU2oQvCKIG7uchdGWH0CL6ULWlmY/P9?=
 =?us-ascii?Q?Gc61x4nBtRW1En4P59sgc5Fv8fWIJBGw2NW0kKPz5UenCfsZILucIpOxdBkE?=
 =?us-ascii?Q?kbvtfMOUjtF/dZnrSfW59A3zZ8VF5VB2EIye4YAisvNm8rwocoB/Ij75In0X?=
 =?us-ascii?Q?i3cTgQhC6olbqYGKW78R1DNPoJM23fQCb0pUGqWQLGiv+D+CDeL48kZ4bZch?=
 =?us-ascii?Q?HBVEHH0kJogn+xXlJ1c+rwM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59f5d9f4-de79-4878-bb08-08dcb4e7bd64
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:18.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0WZBrTwNpJcBr4u2M5wRBbfG6ZtiJqABkfKmFu0+6IA1lsImNqlCbcXRkZmbmQK3IzTxytRuuNNuC6XeoH+1xRkA7ARJTHyYAL7G6LsccIl9DGPbvzHqaNkdGApIYjbQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466
Message-ID-Hash: LUIOG2O2BNN4XEUJYZTO2GG4JPXY7XNY
X-Message-ID-Hash: LUIOG2O2BNN4XEUJYZTO2GG4JPXY7XNY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUIOG2O2BNN4XEUJYZTO2GG4JPXY7XNY/>
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
 sound/soc/rockchip/rockchip_i2s.c     |  6 +++---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 20 ++++++++++----------
 sound/soc/rockchip/rockchip_pdm.c     |  6 +++---
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index b378f870b3ad2..09e4806071839 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -413,7 +413,7 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		regmap_update_bits(i2s->regmap, I2S_RXCR,
 				   I2S_RXCR_VDW_MASK | I2S_RXCR_CSR_MASK,
 				   val);
@@ -471,7 +471,7 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			ret = rockchip_snd_rxctrl(i2s, 1);
 		else
 			ret = rockchip_snd_txctrl(i2s, 1);
@@ -482,7 +482,7 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (snd_pcm_is_capture(substream)) {
 			if (!i2s->tx_start)
 				i2s_pinctrl_select_bclk_off(i2s);
 			ret = rockchip_snd_rxctrl(i2s, 0);
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index ee517d7b5b7bb..25d1a516962f6 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -287,7 +287,7 @@ static void rockchip_snd_txrxctrl(struct snd_pcm_substream *substream,
 
 	spin_lock_irqsave(&i2s_tdm->lock, flags);
 	if (on) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			rockchip_enable_tde(i2s_tdm->regmap);
 		else
 			rockchip_enable_rde(i2s_tdm->regmap);
@@ -301,7 +301,7 @@ static void rockchip_snd_txrxctrl(struct snd_pcm_substream *substream,
 					   I2S_XFER_RXS_START);
 		}
 	} else {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			rockchip_disable_tde(i2s_tdm->regmap);
 		else
 			rockchip_disable_rde(i2s_tdm->regmap);
@@ -488,7 +488,7 @@ static void rockchip_i2s_tdm_xfer_pause(struct snd_pcm_substream *substream,
 	int stream;
 
 	stream = SNDRV_PCM_STREAM_LAST - substream->stream;
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		rockchip_disable_tde(i2s_tdm->regmap);
 	else
 		rockchip_disable_rde(i2s_tdm->regmap);
@@ -502,7 +502,7 @@ static void rockchip_i2s_tdm_xfer_resume(struct snd_pcm_substream *substream,
 	int stream;
 
 	stream = SNDRV_PCM_STREAM_LAST - substream->stream;
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		rockchip_enable_tde(i2s_tdm->regmap);
 	else
 		rockchip_enable_rde(i2s_tdm->regmap);
@@ -557,7 +557,7 @@ static int rockchip_i2s_io_multiplex(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		struct snd_pcm_str *playback_str =
 			&substream->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
 
@@ -629,7 +629,7 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 			   I2S_CKR_TSD_MASK | I2S_CKR_RSD_MASK,
 			   I2S_CKR_TSD(div_lrck) | I2S_CKR_RSD(div_lrck));
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		regmap_update_bits(i2s_tdm->regmap, I2S_TXCR,
 				   I2S_TXCR_VDW_MASK | I2S_TXCR_CSR_MASK,
 				   fmt);
@@ -661,7 +661,7 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 			mclk = i2s_tdm->mclk_tx;
 		} else if (i2s_tdm->clk_trcm == TRCM_RX) {
 			mclk = i2s_tdm->mclk_rx;
-		} else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		} else if (snd_pcm_is_playback(substream)) {
 			mclk = i2s_tdm->mclk_tx;
 		} else {
 			mclk = i2s_tdm->mclk_rx;
@@ -719,7 +719,7 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 
 	if (i2s_tdm->clk_trcm) {
 		rockchip_i2s_trcm_mode(substream, dai, div_bclk, div_lrck, val);
-	} else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	} else if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(i2s_tdm->regmap, I2S_CLKDIV,
 				   I2S_CLKDIV_TXM_MASK,
 				   I2S_CLKDIV_TXM(div_bclk));
@@ -755,7 +755,7 @@ static int rockchip_i2s_tdm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (i2s_tdm->clk_trcm)
 			rockchip_snd_txrxctrl(substream, dai, 1);
-		else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		else if (snd_pcm_is_capture(substream))
 			rockchip_snd_rxctrl(i2s_tdm, 1);
 		else
 			rockchip_snd_txctrl(i2s_tdm, 1);
@@ -765,7 +765,7 @@ static int rockchip_i2s_tdm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		if (i2s_tdm->clk_trcm)
 			rockchip_snd_txrxctrl(substream, dai, 0);
-		else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		else if (snd_pcm_is_capture(substream))
 			rockchip_snd_rxctrl(i2s_tdm, 0);
 		else
 			rockchip_snd_txctrl(i2s_tdm, 0);
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index d16a4a67a6a2c..2e97a9e842a89 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -204,7 +204,7 @@ static int rockchip_pdm_hw_params(struct snd_pcm_substream *substream,
 	bool change;
 	int ret;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return 0;
 
 	samplerate = params_rate(params);
@@ -351,13 +351,13 @@ static int rockchip_pdm_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			rockchip_pdm_rxctrl(pdm, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			rockchip_pdm_rxctrl(pdm, 0);
 		break;
 	default:
-- 
2.43.0

