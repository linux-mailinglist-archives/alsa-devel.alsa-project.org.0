Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E77079C8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3005F208;
	Thu, 18 May 2023 07:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3005F208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388881;
	bh=XiBwgNldqNfPXA1xUaru4ezMKp6IHuzuXw7nG18iKYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZHPBWgZFtrIk7ZkuTVJ6nsZkn9jz4gWE4m33xyVmRkCLGd++6PCs0uy+KBM8tDAYv
	 15ajGIs8bneaZDSoq0LI7OMP0L9F3saNUtbZCPcmtK8OSqse+a9UU4jmpV4/4EPiDg
	 MYik+J/2DCQ67OiT5HG/WqvCpT9RBwDlhJUDTspA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C653FF80431; Thu, 18 May 2023 07:46:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ED30F80431;
	Thu, 18 May 2023 07:46:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6456F80553; Thu, 18 May 2023 07:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CA31F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CA31F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nl0zKJaR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N36CJx1AsDM7rDo2Uo3ps4rTTGGsUH4iB2vrtfmXbXfNFqsAMWkg06mmvloAm+q/pEJT+894Ci009E/Kx4cBsn5KAv00nb8FMRdG3PtMy/P3/1vISwoxG3QUyh+U7/CxuEn6PCNVf8uTDlLQcktKfgX+mhWZXYfLMTgkEDgnK3bc4kk28F58aH25ufFBTC9qmu4YfNbMtQKWRdVh8DKWb88f4ZCOMpXhiK8SvPzai/2WBmUvtP2I2NIqFXKi6yjz/zZv27/i0XdGDyqeQ6BGqaqFf3dGLge+Q5vZnhXO721j6NKg60dykIQfMVR9RqPkX22LhybjMJrqWI+G9gNPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0yb6mqpLZyX1In82m/+o8LwaAmRuegmgEgVyvbsKso=;
 b=LUTl8/41ejLsNVRTU/wA5u5uXG4r+VxY4RxssFdjyIIa3lXJqOMXwYjc0UHR1ArECWONnFBwSSwodhtAgXsZm2WOtaOqV9/ElpHe0IQrikPSedCi3EHhOlLRjY/UrMZAtzeo0KWCCiKVBJRa5y0D3BRlPUFxxdfG5hKABl9cc7Rhb2Dt92FhHhVK4qrQ0edXrGmZSZoXZKsjyTlUcqJMJ7BCX/fmSBKzNMM0jBJDVnvQ1Bp4yNZ07ITskNs4LqMnf3cfHQYrLrl4PSkmGWBQqSqLQFocwVfwk6/Llx6s8lwe64CkSSrD0yQQ3KDQgLLxk1EOp6IQhLOcbcgDgQ36Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0yb6mqpLZyX1In82m/+o8LwaAmRuegmgEgVyvbsKso=;
 b=nl0zKJaR1/sEf40X6n+e8uDyMaWumFxzQ0E/057L1CZg19xZNsPsgt2kCbF0zLlS+3CPgDlX4oQ302yhxei93ji3LH3twEjlpcz8w5om0FOdxhtMMRnQlkd0agHYHNeAJWqQgCNZxc/RG1XicWMVzP5tf6RiEjmgsxbgSVqmJC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10472.jpnprd01.prod.outlook.com (2603:1096:400:2f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:46:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:46:41 +0000
Message-ID: <871qjeqji7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/20] ASoC: soc-pcm.c: indicate error if stream has no
 playback no capture
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:46:41 +0000
X-ClientProxiedBy: TY2PR06CA0029.apcprd06.prod.outlook.com
 (2603:1096:404:2e::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10472:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cdfc7c-9677-4550-8484-08db57634165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/he/Pw5G4wzBBbnv8nYZzYNC8rwualGL89fBGrl0ijbzeiNnJ0pQ3fRqb8IiF2DONVJz9RGwIhw+Q7DwJ0Vssq/JnwgxdP6y8j4sp895bR/9Pnz7Nuy97q59rAaQ0BDwL8SJ9LnGmkUZcFEGzix359rK0iKB55/Fblfpv/jnhybyoGQPnljlKoJL2wUveIC8JiMQSQWyYQJ4HQYpJtznm9wWvn6tAkc3njNqq1gG5gvxsm4AJ4EDWTLF4zkWSZJH/E62VdpNIS0WU8mYrx2P0Q1CmSmA2KYH8/+TPIyGJKiWNYYCrWMdZgRMZmnjZj8zHa+/oxw7yZTksa1mpBSYTBfBaUMwADKvsvjzCnCykwxmiWiPY0m74PkVi5VshULXzrlhvEfrDv4987n1Lp7E2OwgkfwHYrAzxYChEcyPIHf0Vp+VMuRyngPGW6SMZouLgeL1LoqfepLJAg1c66ukkTCFhb8yY8HWF6UH095M8XMyhXrmlAlPTwHRhM7POtX3VwsmQ4V1EY/+qhiw5i68l3RQ36t6iGoT/LFcf0oYW99y+nUxnMEQh783cWswuVIZYcpu5z2hF0J7NclJmi8/t/5MjyedoH8uhUjRB8jb7/GHnQgxV5+8+CN9fNKxvl+b
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(6486002)(52116002)(110136005)(66556008)(316002)(66476007)(4326008)(66946007)(478600001)(2616005)(36756003)(6506007)(26005)(186003)(6512007)(5660300002)(8676002)(8936002)(41300700001)(2906002)(38350700002)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u9Fuj/4YnnbQU9+rS73ois+qzfq3N+e+V5+Xjf9KFhrG1knWbua9KBo4Mo6D?=
 =?us-ascii?Q?xSlie8JsJpcCvWmDkuvLMZnXMXeMgyGdq1ltOkBlMMYSUfPd8i6SeRblJfNG?=
 =?us-ascii?Q?u5gJsNG76RFKhVi16mmekN+ZFiKF6fdUWV2c+ioFpOaiusf9t2aJwKSQHyjP?=
 =?us-ascii?Q?/jKmd4mnT1U3nnozhJwD2iF9/Mjod5PgivflPpEtTLIBgzJHeMVdr5oZFzGA?=
 =?us-ascii?Q?dC5u0CKrgrEQ9Wy1a4yxISxGNsM3oDT+vHYgzkIoZgNB6oOyhQUgGcf+A2v7?=
 =?us-ascii?Q?skUSC+E+kBCt/1UyC6zbS47XS0mpkGB92dgN5IPtF2R1I35YZ820A85FodQA?=
 =?us-ascii?Q?A2RL/bFvmRGbLZf2QmhBwbFwWWok4YVRXgFs+SLq0HEqgIDA5Bk0rmsta2BJ?=
 =?us-ascii?Q?H4TxkYkucxJugURsGpwWCI3DLGFKiIXIcr7RuwPNdfhQAApZXF5HOTQtVJyu?=
 =?us-ascii?Q?/CocLd/gpwTs/Ef2xX3wR05vSqRHP4ptR+aGirXG0jpIsFsIDsAah2DyfnJ7?=
 =?us-ascii?Q?cH4oQmZ9Rb4ExsBB5PtztHRThirSRJu1/bCVCTkAZqljcp1/NIPrq1g9FXtP?=
 =?us-ascii?Q?hup7ONLNeyzilrqp6kuRtAjAmR/n3BPzk4538ZWtnCTN2qBRrtB9v7kD5DJF?=
 =?us-ascii?Q?iuRdvAFjdduuHH95VyGpoFj1ypQQfoZpfmTor17pa44A3SdPhIKhGvNkb+0W?=
 =?us-ascii?Q?luPi5ndmXTDTNvM/fK9xlaLr+y0SiadXCDp+/MxGfUDnE8DRL3rBc9biZt2G?=
 =?us-ascii?Q?JH3e1rIJwC5twboBRwu0qeirVSuluMiZCwxmEG+nMD61TsCfYoj5nemIw4lq?=
 =?us-ascii?Q?99a4ufj4Ybod5bCc7uKix1QuxXITA7r7BihWwbzOY0xvrRr8rApD0rESDMgl?=
 =?us-ascii?Q?HDP29ZI/3gXbMjmQiDgUpSyNeG8ZJbt/nOXtnfpKtvAAFYPPZhxH60iOHMmo?=
 =?us-ascii?Q?kNrAhsL/eTv6NRLHFFA/37dahJgm4QCh97PaKYR3A9r1Y3vgPFkhJ3ICjofv?=
 =?us-ascii?Q?Pk14MHxerNkZpkBzCYtDH8SphCxG3bg5ksxr+SrGTLiw4MNToCpQBJA8Edmn?=
 =?us-ascii?Q?cGQ023eIqPyoymkgs/GFMZZfi7fB3ER2lGB7a4QM/STiB0XEKAh/trRR0vHP?=
 =?us-ascii?Q?EiqHAkUE8gkLn4HeKyEqyOf6xb/Obc3RDATePD/Oe0JBxdOc1XPUOMbi4Xed?=
 =?us-ascii?Q?B+7qp3bER714iXhnfbuW7JrTCTk3X99iEL1aMD5Wi/MQ+YwmymOMefNL5q4g?=
 =?us-ascii?Q?knnYFhiw1BWgiSCfVJiudITbYUHDT3NBrvaupYDad7+G8fCJiQfHZ6b7uOG4?=
 =?us-ascii?Q?c0z3gP3v1RTIoQ0Kvqk00Ipy3u8vBd+vnMlVO1tHLyMqOuyELzxY1nICDM7s?=
 =?us-ascii?Q?+uvoJmcZQxa6NhOqL+psmR1YBX1lIBCc+I0H4sw5eAN4y8rrCCR+ahh6EPKK?=
 =?us-ascii?Q?Gox6OYzj/ZRZ3tzprO02lauSYeJpctkVk6/OoA3FFL62ads9h6xBxP+zU82n?=
 =?us-ascii?Q?3F7UO7oo3idu9o+s5qBcZUMVIbOEY8GPuaIaCDaAXUyUirwHaRwe20Cvf8q9?=
 =?us-ascii?Q?WmE3U/J5g2qo+B0cg2m+PWXhchbIpw76WqVpsR1mftWXqiqfVKYIkAHlfkP+?=
 =?us-ascii?Q?kejRlGwUaqLbw4xFvfarFhQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80cdfc7c-9677-4550-8484-08db57634165
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:46:41.4945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NUvHwp/d8UGtHHdSQ3k2OYn+OvoLr8HiFJmdd1+1WX8sRz6l+TTgnlWQOz35Mo71sIDQ/6D6cskVfFsd4I1aPP87C0Q2golfdGCsFz9MzA68C91T+5OL5+PnAWFOGRP2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10472
Message-ID-Hash: 4NDCAUEXV45YJ5463S63QUDOWR75M76K
X-Message-ID-Hash: 4NDCAUEXV45YJ5463S63QUDOWR75M76K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NDCAUEXV45YJ5463S63QUDOWR75M76K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture (B).
ASoC will probe the Sound Card and mapps CPU<->Codec pair.

(A)	static int soc_get_playback_capture(...,
(B)				    int *playback, int *capture)
	{
		...
		if (rtd->dai_link->playback_only) {
			*playback = 1;
			*capture = 0;
		}

		if (rtd->dai_link->capture_only) {
			*playback = 0;
			*capture = 1;
		}
(C)
		return 0;
	}

But it might be no playback no capture if it returns playback=0, capture=0.
It is very difficult to notice about it. This patch indicates error at (C)
then.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7247f44faa1c..fe65994485f8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2815,6 +2815,13 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		*capture = 1;
 	}
 
+	if (!*playback && !*capture) {
+		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
+			rtd->dai_link->stream_name);
+
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

