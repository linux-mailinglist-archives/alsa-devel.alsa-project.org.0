Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE327937133
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 01:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EED7DF8;
	Fri, 19 Jul 2024 01:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EED7DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721346232;
	bh=m0ns3ktl0RoTjIpKNA8LjTPzN7CnApmIRVPAQUh9trE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Etgx42bjeRPXuHlWUXgpFrPe8fqNXG3MWEdUne4kpW43wpU3GlzZNRqoleov7z/Ui
	 AvlYwTVJjPGiTnlm7FqejxOBJvs+ubXLrM4FgEa9F3UUUHQXB2WUR6kSwcRTqi9Po1
	 67jTz8P5y2+YTw/gPNY8F4jVeyk2FaM1bSurJTJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68027F805EF; Fri, 19 Jul 2024 01:42:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4487F805F9;
	Fri, 19 Jul 2024 01:42:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 988D5F8013D; Fri, 19 Jul 2024 01:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E33F6F80508
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 01:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E33F6F80508
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hEpr64Ot
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNgIwkLgsO+vrVqwEB95OXj91C0EdIgo4w9M6a6LUD7kWvNRQ5hi/PEKb/+3PHevn3yYA3UJjQIj/X2aKOpTQvEB/u6D4Z5+GR317vAunlw/5QpRVOG4Sn5O0bjIQNVaZynOXAzHXE8geOXV8tc26Amb0CpLX3CuKesCTYalxU7FwDgyuZfBDbUwqMYOoGp/7Xv56YSEcX1l0Pooh16VSUSPTBN9vpzUVRZ9rI//9AxPA7jMB+r3DjNQ+2AdwHqE1ubv8duLf1tr34uwuKV7ivrK+IHRE4NbqiF4LemrK/OA6qRQox0HlPGRy/oUhtJts353IxZzJVVmLDkW5zsZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGHJ0wf8GaqRZmmD6hjvCE8pFytz/aFvmdBiXgfbavg=;
 b=dM75B56X58PIAwYtmi4wIUAarjohUQHrK0LNSmBYpa2mkZTsyuhsVYbkYjhZg3PpOKKWSDDOtI043hapAL/S3Q3F+1HVHDaWyYTqYSVb9eIToShmTzaQslKzosAfLvFMZH7iH/vSzpEo8v+/ysHRUk0KKIv5XVkY8yVMufjbJM1IpoUiKdVUsGleBoiTd00v0lr4LCDBLLx9Oqv8xRNSNLf2KWPRUpkgU151Kw2LC2/t7FbY5nE0UytsP72OSiUphGv0U7z0KQEwLpWQuD3LuXOCRs0jR4RL/ZSPcj2TJRRQKvFbVDRlB1qmQznoVikrnHRX1Co0EYs8HJryOIDOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGHJ0wf8GaqRZmmD6hjvCE8pFytz/aFvmdBiXgfbavg=;
 b=hEpr64Ot4jD41cednrXRf45Wm2iwg15IH7L9aw7d3GAiUOOLTz89G5kN7+gLG1Op5dqlRKeJ2SATboCxKXqFvnDKbe3PMPlZrBmI4OGkfqc5LS5a/fT83W1D1EulbmC8E6cbzT5sWsqYc8fkrlby+7IOWVW+Iu4dMoQbdOA4IY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11460.jpnprd01.prod.outlook.com
 (2603:1096:400:388::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 18 Jul
 2024 23:35:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 23:35:06 +0000
Message-ID: <87v812l1ee.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 03/xx] ALSA: virtio: use snd_[sub]stream_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Jul 2024 23:35:05 +0000
X-ClientProxiedBy: TY2PR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:404:a::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11460:EE_
X-MS-Office365-Filtering-Correlation-Id: 080cbb35-5f57-4917-ef18-08dca7824119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xqLOsfBeZI1k4fbbCLZRnLNRwT8bLOqgj+EPNXzL2YlruTNAwoDt+vqv5aNg?=
 =?us-ascii?Q?70WdSqlwSxgCLMqifBpu4Xy+iRSwHrYcW63KCq2wPXLpaCSaHnlNIA3COGL1?=
 =?us-ascii?Q?Rwd2RSfGfVUXdxIzDr8MqKlW4KMk3seBfDtmOHlli7HmV4oXn8aV2rmMmXcq?=
 =?us-ascii?Q?P7wnJmo3wxV1owXMlKX3zNe8Wco7jG6MHwqeImz+Zig/9PeJGGnftKV137l5?=
 =?us-ascii?Q?aTOa1pk1+3WTZHNsxcSSb3g99AlJieCKSP0Ot88/ecWZAMw6pRHlCaxum7md?=
 =?us-ascii?Q?0pVtS2rMjogBZDrMU/VaQDoi0+7UFzGpVqChybXbP0JFLZAjHLPRQtqYXKS/?=
 =?us-ascii?Q?ltCdD5l1mlPRwUcadWpw8g+swdfsys9+iJ7V9FEpggmLgPg0SvYB+YZKGqZQ?=
 =?us-ascii?Q?1ejTvJ8qba/AUhMlEORKl4KkW1ALT5pvNSIXmUrDvFzny7J+6cJYExmUxz9A?=
 =?us-ascii?Q?KUdpLV/tDmRajNnVv8in+XkxoLc4Rsb4z9i1LrEqexGMPWpZVUNYL+h/nCPX?=
 =?us-ascii?Q?LAa4PkLAnd8gnvWyBM7/6nO1OneLscBT9m7eH0O2tiz3dkGJRpOCvGYz3P5m?=
 =?us-ascii?Q?bL1O/O7abz4fBigbZOjkqM2JdzpDEES836yIVr9eWxaToZV0GRg74/Lq6LOz?=
 =?us-ascii?Q?4qQ/1OM/mFq4I8amUrroGhcr4Oj2Ukyqgus1Q8J9GijnCvlE/Q77gu64dl1o?=
 =?us-ascii?Q?4qCWMwl6Y9HNvFEKQEeHYOHlwSX3131UhD5Nrtba96ITkP8RwR1f7Go79lXT?=
 =?us-ascii?Q?6eyBdULN5OsApgcvHlgDUmuxOSE8CRybpSHl04BtwN6ZbHzMg235dFisLiPb?=
 =?us-ascii?Q?DYd26CF+N7ifJ5kbcvtcinClyJn0Yiw1hHpYbFEbt4FtfOsBtHox+my4XQRH?=
 =?us-ascii?Q?kb5J3gp7KSNx96r2Cf270K/8zYadqFPyDGoU8k6kzoWPwpLoXdv89FY3/pc3?=
 =?us-ascii?Q?7dXRPAblDJ4eNYXdWBUOL8uEoxDu9sQiEuHRCB2B7pHf5S5YBko6h226u/lp?=
 =?us-ascii?Q?Fu/r8qYWZ7UxHUEpSjBRT+PdXWkbR+8z1Z2qWAIYOLQ1fGtMoA7J9xyAPkaM?=
 =?us-ascii?Q?BekFvCibZduk760Hlim+B42kQ0m1GiLbsGujMQkJ5QJjbJnkNvZtQRX1apDx?=
 =?us-ascii?Q?k42SbVut02j1XeefUt6WLos8wFIU7vSrTvqaDN5P4LRNSJN3eLhxorOBxDSW?=
 =?us-ascii?Q?S0igOY0r3oHHNvFKrxkuLDQmr/GkBdBAcvWNifUCj/GF1EiX+pTiAJomH/wC?=
 =?us-ascii?Q?N7IkuRMiqCM2NR5kmVA/wakJrk77SfoG9r9sNUHpFCwZ0kaduDgqxS6ubqPT?=
 =?us-ascii?Q?RMBU+QcWQVyAbb3GkLAcV54VdzuTwWt3hNNKlfmd5wPvnfMxJcYDPFIpIY1M?=
 =?us-ascii?Q?aqIKLMW0naPvguIXigOw7dE0x3gmqipYb2D843p4K811ZTTKMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dqCFQsO6apHbedlSRW4oBXdnUSJKqcJppptpEj/TagIzSVEtejSJOhciKPtg?=
 =?us-ascii?Q?G6zBFgzX7dcO+CrgAw4Fe/3P7cM5G3LAh/rBLjPsbCtu+KtG8u/L3sOrbEhZ?=
 =?us-ascii?Q?xtDl4518qaUJBqT6n1o480CCjnc9TVOX2kaTzPc8HfnslUzVZjANZEI7Nsr7?=
 =?us-ascii?Q?8YxQpz8X7jaPF4Y55VG+hDfkHlih9EK2e3NNWt1OxaV2aQHaVMfLezc2+RKN?=
 =?us-ascii?Q?YD1mpONFuDd9FEGpC+t1NaWQVcNpgume1aSNpHvj526bx4bE/lPiG14pX/LB?=
 =?us-ascii?Q?pY9a/SB/pHha71OajD4lwRlb038RU335UYqcrV6yBb5JSfeZvrNFdJjvbevM?=
 =?us-ascii?Q?IHTCXUmXxI1/NZ/p9yhfk/huIzrOmTt4+mw146BMoU8kh8ZseQn2LtTD6c+D?=
 =?us-ascii?Q?c6UBKm3F+HNy667KhyeJX6Ah76uJSZPFMx5fm6i9rJb/PpBLMF/V9w/+Of9Y?=
 =?us-ascii?Q?Td6TgcaVhDrrHk6k+XFxNdlPVPMG7mNT+LzQfPmIKlBza7arwSZee+YAzYYI?=
 =?us-ascii?Q?upfjyMiqralLWBOvCi+Uub+mCz/8VKxRSUNZqMtSauzWOqhOxUrvQev8vUaK?=
 =?us-ascii?Q?HKDpkHa4gHBLe+SnRtmBdzo4B97pHx0aZZGHY9lXUTgyWqzwKbpaw51RqcGJ?=
 =?us-ascii?Q?LW2NFO2VCPHSqTNR427ZAs93Duj7mmyrCBHIOOKbICPud8A/adz6qPDBVWba?=
 =?us-ascii?Q?kaRKMUd5QuYGY3rHJT0foE3Px/nAvGNVGEUjGuwU+7O7utSM3t2SCuzpVXfC?=
 =?us-ascii?Q?Sz2b/fCLTbiO4DYa54XCtvCKVa/NCMzmUM2+fR/8umDvVXnwA5B95J5lXlDB?=
 =?us-ascii?Q?Xk5uNc2ubn9Nl7jd/SnouRwJAs2k0Z4rMHrVPAt5RrF1AQ7i14y71FX4dt7x?=
 =?us-ascii?Q?1hWZD7KAAxYLrheVqrJFZIwNf0wgIyc1jeOVZHr5SJsaYnn7fw9QU7PxSeB7?=
 =?us-ascii?Q?hijbbf7M2C75gLFECKul+Ht7ypRGwcCCxrj1Sd3DQ3IvQrRr/77le88f3Iim?=
 =?us-ascii?Q?4hXxdZEtQ/XfCOVuJ7nGPPlypixXleZjRmPrAyEBuJ1rWycjFxo/Q3uWXx6i?=
 =?us-ascii?Q?83dX33cObmLHCSrq4cR3NZllKTKPns4iJAKuzavMC8qXokwZFd5QjUZ64yxy?=
 =?us-ascii?Q?6iFcBpHqxU6vGJZ4bPIJVAQ2UNC+mFJ5/l5rEwMSBAPG6AiniC9XwJL3Qr5A?=
 =?us-ascii?Q?QqS3tu2MheTeVRwqlEOnMBvWXe+znRHRQ2fJZiETQkY+B7VRiIc2yww0VmCL?=
 =?us-ascii?Q?4pcHdsgKN/T4ZHxDKB8PRWzg3KXE054uQo7ycbftDWmvtIjHXMoXR6qQC2qk?=
 =?us-ascii?Q?QEShwpjsGVmRUDcDj2xfSBS7IYsWdAmFiEpa0eyhYRKmBrhWSh+1hhZ33SHv?=
 =?us-ascii?Q?N93emmKcBgekNaWFMiWc3lGRA1lSkeQ/qGjxI0CsDxY7r6XjW/iyePB1GMCb?=
 =?us-ascii?Q?gWolFWNoikTb9k2eeT8Hjt5kpQCWCB6TArDHkfYpZ0S70mk3W8U6PbB1Mqw0?=
 =?us-ascii?Q?QUuoBxOQfZ6y1CVE06XXTqUVZ17eCpynF0RFI1kvLLWKZ/xPmSnTDJy4Kosa?=
 =?us-ascii?Q?An10/+ozFOQQA9Zc3wAosrpPIPfNEZHhrNMVCoyyu4UqAMwBy+wrowl1uJ2j?=
 =?us-ascii?Q?kIbWqMqp+J7PoRLOtK1lbjQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 080cbb35-5f57-4917-ef18-08dca7824119
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 23:35:06.0316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EZcvAMR2kZufASscHQ0CuEGhvVpmDKltO55CSaPamZJgo6K00BWm/3uopM/IwuzdUz/3PfWezNt2DNWk+DUgGa0n1gZgVFWSCkIfUsUzKxhEWtbodWgxfAT/RgWwZLeL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11460
Message-ID-Hash: JYT7DBS5SKODHCQEJ3SEDKTB4MBDNHA7
X-Message-ID-Hash: JYT7DBS5SKODHCQEJ3SEDKTB4MBDNHA7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYT7DBS5SKODHCQEJ3SEDKTB4MBDNHA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_[sub]stream_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/virtio/virtio_card.h    | 2 +-
 sound/virtio/virtio_pcm_msg.c | 4 ++--
 sound/virtio/virtio_pcm_ops.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index 3ceee4e416fc7..2febec09b13ab 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -107,7 +107,7 @@ virtsnd_rx_queue(struct virtio_snd *snd)
 static inline struct virtio_snd_queue *
 virtsnd_pcm_queue(struct virtio_pcm_substream *vss)
 {
-	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_stream_is_playback(vss->direction))
 		return virtsnd_tx_queue(vss->snd);
 	else
 		return virtsnd_rx_queue(vss->snd);
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 8c32efaf4c529..fd4111a558250 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -230,7 +230,7 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 			msg->xfer.stream_id = cpu_to_le32(vss->sid);
 			memset(&msg->status, 0, sizeof(msg->status));
 
-			if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+			if (snd_stream_is_playback(vss->direction))
 				rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
 						       GFP_ATOMIC);
 			else
@@ -313,7 +313,7 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	 * If the capture substream returned an incorrect status, then just
 	 * increase the hw_ptr by the message size.
 	 */
-	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	if (snd_stream_is_playback(vss->direction) ||
 	    written_bytes <= sizeof(msg->status))
 		vss->hw_ptr += msg->length;
 	else
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index ad12aae52fc32..6e8c4881b44f9 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -337,7 +337,7 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		spin_lock_irqsave(&queue->lock, flags);
 		spin_lock(&vss->lock);
-		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_stream_is_capture(vss->direction))
 			rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
 		if (!rc)
 			vss->xfer_enabled = true;
-- 
2.43.0

