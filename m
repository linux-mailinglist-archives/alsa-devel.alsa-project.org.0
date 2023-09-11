Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC8579B028
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C65CDEE;
	Tue, 12 Sep 2023 01:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C65CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476139;
	bh=77x4T7jbrePqHgzZDmgx/xADihMevFK+SMxAla3KrEY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nr5cA4oYlNXGX6+s2xMBpsT1beOydMmMU1eK4pBin6FxIMiOhwJ9wfHAFiBfO18En
	 VId7ux2yTr8qkt69xpF+wbGKSHYHqLhoMfo+22Synybpm5UOpBSHx/4BpBKaM0B27z
	 pqoV2q64XW6gdzjBXMPJiLQMGxaFeoVkM7pAiCTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E6AEF80580; Tue, 12 Sep 2023 01:47:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05BBBF80588;
	Tue, 12 Sep 2023 01:47:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58846F8056F; Tue, 12 Sep 2023 01:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E713F80563
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E713F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=U8i7ZC9V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6nsVuXxqZ4+dDJ9PzjPRigS8tj0mZtLlOHV4BDbE9kiaDmAKvv2MXzFlNzCNbPmihXf4Cnvfd3HdhU0H6sCr7kTGKUuSiGDiv9QdfNOSDOX/b5rX8nRYQkdcST1Lcue6SXSpgt1DyBGVequ1i3o/f9TTPmryW5BUgl6ezl7oKJxkfHePv3WCaLcmtvAR/aGkNz69HvycH+arZxQgUVjVjk3u09gSSEgHXNHRnDTDLUbWc7y6H1pjbXFlJonCcPujwKWKnf+ecir3fudxBmEzjaZxeYV3e7ODDmuk6imI9RTCQWbOv6C9X+Q860gmJr9cqw9U0qUn57FqcHUK/v2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcHk0xurqEharrJXIYfcCJOL2R1QxYDA/bjKl69Ptf0=;
 b=G4cNNimorNpCQbTVSrVZdREzL1ehNWvyAzdv2XAveMHJcPC4TksQ05BtgvO7MJEbB+GsEpEcuI0yI7yKBoYAmv6XgjpmPyLiBRy5X+zIIfrvIjfDwrVDT6Elttwijjk8tAAwEk2QU21bsGePTe+97n/TjOUsbEDex+57wdldu0W1hxLwyECf/FAFsJNsf8S7bCUmqOxAfCIQjyOd/TDgcHR8iYix4dnwh8nX29Uy5MmBRJIcyQJylB66pCtZCuo0iPfJM9ccE7IlQlwofXCYWTC0xOpDRDwXB5MFiuq3b3jgDtRttepO8wXG3/F5m7o8GPlFIEiNg1I1UdF7ytPSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcHk0xurqEharrJXIYfcCJOL2R1QxYDA/bjKl69Ptf0=;
 b=U8i7ZC9VqajQ0CjYccQ+9/gH7zeBjWMaBnuzeh9KtKb7RJKPRTYF0UL0Ge9yVmSbSSjKMZTgy6x+qA2XbQXdso8UqD7TMhHKBrm89t+0qgOTXDMbiime+AE/o1FuAUECuwBbK0rwV/TDmzVBoA/6Ku07X8LvAE5wVl6aKJQ3eCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:47:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:47:22 +0000
Message-ID: <87cyyos25y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [PATCH 03/54] ASoC: sh: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:47:22 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: f753d632-21c6-42a2-1014-08dbb32171a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fF6xqCLr3feep0jD9tOllTriOSmbpeGob0So5toX2mVr/q5+NvVDME0VciKxoyv87SGtqHIIUDsZp7pvddfft1qRsQC1mHQ5iibFUW4aYz6RIajYwuxDtqm5x3IUSAdmLXhYYq08sZ/6AcBRHXLQ2xk3I+3NoGi8QvuPQVspnEAK8V8znRDcZZTM2YiAbtxxWse54+MbesLKKaKWGqvTBpkcSlQJG9XpZG8hWZmxkivBbasoYnaS4n7Ad6Sq/GMcN/14XpH0lw1CoxV0/u5Isb0XL1mlPlpqEUGc1U5Ad2XK0nfbKNsrcJSQfxfL7lSLPd/jUIbDVcDYm4b6FgUmcdnvRss6YW2+iUkrcnwHcMD7miBf/PH8WaUCfc5yscmkoHQNumScokgvQmpoI2uixSdnENdEU1aG+kqeTylkmujtANdmSK1TprJY88gPmOmo4so5tkXdadL0w1pGchHFAWIWbQN9lyRE2CKWfCXGQkDBjCq9wx0x56gizWW17UzH25q6RVDKBwiCf0U507k5s6oWU5MpSLDImF+mj9Q79oXfuRRs6E2EOBt5klo7sBCg3RTUgyzjabdEKcGcPjMRaoJ0de7dnKeG99BEcFiZtlhFN5ioHbIURpQQJvZf0BN7OYNP2uRYQykZqD2W+GiiIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HFyAOdL7oKGp7DIjHsf3LfLJVoNzd56MYcLJMO3G45IILQmJbrAPiLmNBXnq?=
 =?us-ascii?Q?DNT2D1EaA+4PahWADlGh8kJAAUSSleHdTO71zWORSVcG83t+BZ6tsmzpDQwI?=
 =?us-ascii?Q?g+dAUPzocNtNmir0S1d7TTl+OVVeCft/U7SBc5TXrI/MJpsxOvV58mt7cpUU?=
 =?us-ascii?Q?SZOaB6xDvyJAfBYN2eChGF9xV1dTWCNPtGZEdV+2fOMvNFfeRoQ/VtftGc+s?=
 =?us-ascii?Q?8h+3vmihyQHDCjgGuXjadKJ5izDC/eZeUH+T+x/Ouq8fwqn2pHyBy2eeUASg?=
 =?us-ascii?Q?J/WhHXivjUDrUcHYGqjzDtXOpmmfuoAwkC2bRvvagi701VZflN2INjv2Ok4m?=
 =?us-ascii?Q?PkxIZ8n9bSpJ35Ez3JvBREJ3xWre0pgvIwqQOuqL4CdfuEjHqEp4ZHxyIRyn?=
 =?us-ascii?Q?3xJDW1cddRytja98b/hiSjLz35sLhMTj5c1RWupGN0lqZ0Jp0/pqYC1KHbgs?=
 =?us-ascii?Q?X8af6c01hGOXUolsGK2hDbiqMYybVm+KV75vbzvTxbKqftgaV/diDxBaupKw?=
 =?us-ascii?Q?rLNjST97lbGvVrwrygvYbpIn+E1yMrnj9GVvIwD2biRyHriTzxqx+gkLVWgF?=
 =?us-ascii?Q?buIFxT5vg0EUI4l8BARKo8ngV14DNfc6g0N0qvP6LcDfS2KroUfxUkdG1e4v?=
 =?us-ascii?Q?oFyhA999c/V5Pyf/X8rmBcAVyKQPBxVSkAXxkzWcyofT85PigIiNU3kOdy9Z?=
 =?us-ascii?Q?bvHHo53sjIAb3RagfdE6HtW9+O2ewoZNI45zDb6614OGN6DAgoo1/jCkM/om?=
 =?us-ascii?Q?0S+iVIsT2x4W/sAONPP4EIt+f6z1Ayq/toMK5dYnmxEX0rvcrAFFYRq9LHg3?=
 =?us-ascii?Q?2eJJea8B5oEMOKPiugipM9v/vfOPA19MFZtVO/2BvcGWus8jvt8U/oUlYh3A?=
 =?us-ascii?Q?F8XJrc8cJZEtPz39paJRpeZNhVSDGGy9QS0b6eDRbtzQsvBjjzxgcUuVwDyg?=
 =?us-ascii?Q?jxMFojLDeWfjorV673XfnQS8WDZR3GgSe8ON+PiRV2GsXUsvhpxGvAa2QSqQ?=
 =?us-ascii?Q?5PmgNVYfiLQBZdYrxMh/JLmD2H2yuhn2gCgaC0ugQZXp1rJmItVivjIdUeDL?=
 =?us-ascii?Q?Gn2OlNv7G7l6vgwBicuoaweO0KfqrNWXEhDuD31APLABk/xHJha9ul4BcWIv?=
 =?us-ascii?Q?mAc3LVShRM+6Oab+fwReFIHHBBLkqltMirx/FwaQb+KBx+/1X8HXvKdbXMFB?=
 =?us-ascii?Q?Er5sOW2YC64nfgEFrMRWIy0FgiqncjmXAuIWOyMQWE633OYU1dZbw1sttrtq?=
 =?us-ascii?Q?vgOV+tW8qGBd1cjEE3wUheqnj2dUSK9uAHMxKxF5Co/Rv11skmmTfU6NcqM9?=
 =?us-ascii?Q?l16urkycQhRk2hvZiQ6zA1E636Lilr0F0oTAISvZ8VCVlBviZEwT9BSVMerb?=
 =?us-ascii?Q?lFx2TJg1stxLiOMK+rCFWsbAqtLEyIWgX24eyTh7K1UrjRR9H8EOhVHG6QTi?=
 =?us-ascii?Q?/W9cOQEtnjBf7VqmZWl6bD2oazEhi1feTW7SJ4pRpwsxXNPMlx2huAXKvcbS?=
 =?us-ascii?Q?kcSKDeIKZHh7x+MxhxxcwJtVZb15Jxzfa0xelwqfG5SUkw7oepPfHgb7jtDy?=
 =?us-ascii?Q?N7+vemSCvDoOFAHOLZ9nMBUUBp6xW/bFqh0iJ4MYES7FkS/Tl7HPj80lurGU?=
 =?us-ascii?Q?bZr4DaFZ60P0UWnPEYPmZ4Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f753d632-21c6-42a2-1014-08dbb32171a2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:47:22.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 owgqlj2uMRqPokAxq46p0oJQ7fSV4YzUus2CEUXVjgoFv91xMER2rJDF8c3QF7GFiXNgIBqW3AZnbeHTWyw9CR+VNzZLlvfgIIsWCQs7MEe6hlKKhcpwdvs2AeEh41tO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: GO736NI6K7NINYJBFGP5ZFBR7HDGDCDK
X-Message-ID-Hash: GO736NI6K7NINYJBFGP5ZFBR7HDGDCDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GO736NI6K7NINYJBFGP5ZFBR7HDGDCDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/dma-sh7760.c | 28 ++++++++++++++--------------
 sound/soc/sh/fsi.c        |  4 ++--
 sound/soc/sh/migor.c      | 10 +++++-----
 sound/soc/sh/rcar/core.c  |  6 +++---
 sound/soc/sh/rz-ssi.c     |  4 ++--
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 121e48f984c50..9e26df823b763 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -118,8 +118,8 @@ static void camelot_rxdma(void *data)
 static int camelot_pcm_open(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int ret, dmairq;
 
@@ -132,7 +132,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 		ret = dmabrg_request_irq(dmairq, camelot_rxdma, cam);
 		if (unlikely(ret)) {
 			pr_debug("audio unit %d irqs already taken!\n",
-			     asoc_rtd_to_cpu(rtd, 0)->id);
+			     snd_soc_rtd_to_cpu(rtd, 0)->id);
 			return -EBUSY;
 		}
 		(void)dmabrg_request_irq(dmairq + 1,camelot_rxdma, cam);
@@ -141,7 +141,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 		ret = dmabrg_request_irq(dmairq, camelot_txdma, cam);
 		if (unlikely(ret)) {
 			pr_debug("audio unit %d irqs already taken!\n",
-			     asoc_rtd_to_cpu(rtd, 0)->id);
+			     snd_soc_rtd_to_cpu(rtd, 0)->id);
 			return -EBUSY;
 		}
 		(void)dmabrg_request_irq(dmairq + 1, camelot_txdma, cam);
@@ -152,8 +152,8 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 static int camelot_pcm_close(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int dmairq;
 
@@ -174,8 +174,8 @@ static int camelot_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *hw_params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 
 	if (recv) {
@@ -192,8 +192,8 @@ static int camelot_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 
 	pr_debug("PCM data: addr 0x%08lx len %d\n",
 		 (u32)runtime->dma_addr, runtime->dma_bytes);
@@ -240,8 +240,8 @@ static inline void dmabrg_rec_dma_stop(struct camelot_pcm *cam)
 static int camelot_trigger(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 
 	switch (cmd) {
@@ -268,8 +268,8 @@ static snd_pcm_uframes_t camelot_pos(struct snd_soc_component *component,
 				     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	unsigned long pos;
 
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 1051c306292f8..d0931f4c9976d 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -406,9 +406,9 @@ static int fsi_is_play(struct snd_pcm_substream *substream)
 
 static struct snd_soc_dai *fsi_get_dai(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	return  asoc_rtd_to_cpu(rtd, 0);
+	return  snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static struct fsi_priv *fsi_get_priv_frm_dai(struct snd_soc_dai *dai)
diff --git a/sound/soc/sh/migor.c b/sound/soc/sh/migor.c
index 7082c12d3bf23..5a0bc6edac0a0 100644
--- a/sound/soc/sh/migor.c
+++ b/sound/soc/sh/migor.c
@@ -45,8 +45,8 @@ static struct clk_lookup *siumckb_lookup;
 static int migor_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 	unsigned int rate = params_rate(params);
 
@@ -67,7 +67,7 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 	clk_set_rate(&siumckb_clk, codec_freq);
 	dev_dbg(codec_dai->dev, "%s: configure %luHz\n", __func__, codec_freq);
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), SIU_CLKB_EXT,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), SIU_CLKB_EXT,
 				     codec_freq / 2, SND_SOC_CLOCK_IN);
 
 	if (!ret)
@@ -78,8 +78,8 @@ static int migor_hw_params(struct snd_pcm_substream *substream,
 
 static int migor_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (use_count) {
 		use_count--;
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index e29c2fee95219..844ee36b03b7e 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -690,9 +690,9 @@ static void rsnd_dai_stream_quit(struct rsnd_dai_stream *io)
 static
 struct snd_soc_dai *rsnd_substream_to_dai(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	return  asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static
@@ -1574,7 +1574,7 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 
 	/*
 	 * rsnd assumes that it might be used under DPCM if user want to use
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index fe79eb90e1e5c..f5f102d878c77 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -158,9 +158,9 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 static inline struct snd_soc_dai *
 rz_ssi_get_dai(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
-	return asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-- 
2.25.1

