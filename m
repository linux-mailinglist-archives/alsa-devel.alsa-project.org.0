Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1BF947283
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91EB4BE9;
	Mon,  5 Aug 2024 02:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91EB4BE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818665;
	bh=yfgVQiUCgnxLQQ6XJIHNQksmrazJG+hcsEw3Itd45Is=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D9gFM6qr+SktA+1rVFko9zM1IeTYlhTXJArj6BUW5PIHWMmFHiEKmQkUsSI1Nc4CL
	 711WLF4GJrrBwNPnmEHESN2VUvtelmnGtLBPJQoxwepcPNqhxgGY1LcWlFjFh+C+gN
	 cZNQuMjPeROFSTJ5snPgQTs5HOC0UxvHYr1r9Rn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8155F89826; Mon,  5 Aug 2024 02:39:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C03F8087B;
	Mon,  5 Aug 2024 02:39:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06304F80448; Mon,  5 Aug 2024 02:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6ED8F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6ED8F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LG1Lc4/3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/wLX4RtSrzhkqh8O66BE5PW6o2Z15zjwLSA4Sqv+937/J1Qh2gnam3doc41BczBCtc+EPYyrX8cjS39gKZC1vGgP5GzrX4ZC1jgsiuwe9tCRO/E3x4wQWN1bjM5o1d8QhuxFRwgsxKgv53lb8dU6FOvPjdVylgk9iSR70f3nIcRuY6GlG7Uh+ZGpbqAwJ8V3tYFEmwMJeimfgMHPtyi9uE8iFqCe5eaReHqrqeVvuWKLC4tAISI04junZIiQwTas28tT5Ece7EnIPni1X5CxW/7zvKxRMCKQnA3jDiDGxTaK8LowNfidfuNjXawSDySWj7MpZtN+KK5T02xbVYkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10QEcSqGNEU3Jmr8Q3ORPlOaXXB7ow3Xweb/2Cn1SGw=;
 b=t8OkbGxUte/+9ec6OblKJTyZQ69ZAOdkPPHPiJCCDkKwScARcoIK7mZf9fNn2V0GY3EN9IpII5T7KCOlBVyrEykhu2VG5qd+DsqVVGC6xwvh9V5RKiUK1mPqfM/k0sC7YiQhcPGCAIktH+ikrhsOcyOtvjYlR2lBTamuWaPdX4zW6gpE06JqszjKTAT32/k9Bk6K0HuV6GLUHmS8iNO6wcZDNufXeLhBW5HZX/TQfTFTLK7MkBb/hv5PkPC908IkeetMRgP2/fJFYG/ZYX1v06GZbNHZS7rgzYs2i2iw+vfWuv4HyaWF0BMggM7scqrRzLl2wmFOatZoqKbGRKc+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10QEcSqGNEU3Jmr8Q3ORPlOaXXB7ow3Xweb/2Cn1SGw=;
 b=LG1Lc4/3hB6QqtCwyyJJwELeDuTzkQd/8c9ZyAmmw5Si5QV59y+6i00SHnfgiSb87yVZith8YJqhUZSyC5NVzzJ6R6PICgFT8JzLgLIHl0FwYycSDnH6UkVVkkka+lNxGzfxk2tc/8JO5Xo4SBM+BU6iUNo1sdejc+5yUeElGiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:32 +0000
Message-ID: <87le1b24dn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 013/113] ALSA: usb: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:32 +0000
X-ClientProxiedBy: TY2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:404:f6::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4319d61b-987f-48ab-83e3-08dcb4e683e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B5itVf613Ge4NrMGyHmfZZqu/oJN8Sftw3qgIO0fJIevuDnsugkou0BbRoO5?=
 =?us-ascii?Q?NcpKPerE5QmxweWNvQcf4vh1ZAL++mUrFbguLMBWMGqBameT5PSs8EEENY7A?=
 =?us-ascii?Q?o0XyhgO/ZXCO64tEoqzRr9yZKwxyBM2atnb6wg64h++RCZgR5uDUu6GLqLfF?=
 =?us-ascii?Q?uW2zbAw+JaL/ek4YldJ2+rAJ5hfOp+bX0w+Dnn7SegCU0f9R+1HZs1LwWUeP?=
 =?us-ascii?Q?u+9nJ4b8D2a/fJdbkU4ZOAUZ8ohpNBdrrYibkwi3HWtllQUUw8DGgx9FAm7i?=
 =?us-ascii?Q?1ykXz8SX+vGlitROJvwHSJBEXjEE5bmkTtPUsF5eplT7BMCKoyV2MP07hOoY?=
 =?us-ascii?Q?EqrMR6cVPCQHnKwX27Plk9OemdEe7gbClku9m1P8U3SF43qHGvP0gNAg4LCY?=
 =?us-ascii?Q?6JVBIo9lk/vyuYrZXcB1wdjVTz3JQ8hHqKl0YiALog5mTkE6ZdU58Mby3hi9?=
 =?us-ascii?Q?3KM0M/OmU6e5vIUR8VV4rgKjPVeXaoMn9/k79ddnMVxxXsUDZ1Kfr+Gfm18Z?=
 =?us-ascii?Q?uL7auz+mikx09SjaPbuxIVokSYyG8YCqOLqDS3ZdIG2x6QMidWqZ9bSlZD2U?=
 =?us-ascii?Q?YYTFJhdS5nIGP29Cg2Cjj9FX+knB2pQdNbHWEswT1SW8fzq1Sy31sIVKn4HG?=
 =?us-ascii?Q?TuGRrhHW/6v/QIabVmoL293riGV8XJ1k8mgWmhndGgY5ohmohLYLIFiUjzHJ?=
 =?us-ascii?Q?PwsjoPNqECAGMkNWjhMczc1fBlJL6xhy8HcYWw6OF/JDrMFE90buzQy1d4XY?=
 =?us-ascii?Q?AFUXSZ8FfRIpLH3yQHh5+YH+l6Vljqxwaty6lMalyrlky7iZTu0gjzhHN0cT?=
 =?us-ascii?Q?grM3O17pL1iqaW60+D8Ds2vujlkIrc70LnU1B5J02XVI5llHDf/HsoWkQAWB?=
 =?us-ascii?Q?6MM+ql6mytaDar59zEkMaTgTdEAxplVxEjqQbERI9hAJECKbqpwnuc3LiEVy?=
 =?us-ascii?Q?UqRqXoCMe2eYrKShRG8dJmva5vmGivOmrbWJWCj+hHMLiteeW9SgjyPYKUSE?=
 =?us-ascii?Q?PeI9ghZVpVhhTeH/HBcuqOdL2JV5O2gGGLyEzmIm7UdUtO9ksmeKHu3mpr2F?=
 =?us-ascii?Q?AE6C3blh2Rq6OgIWW3iU5v/p5h96jGZnzzJ2U2lXcOYmNmIO+uGcv2+qiB8B?=
 =?us-ascii?Q?p8JXbZ/u+S4xpe61A6qL0qyz9PPd49t/lhgfeDz0dD0ZtSUmNjiI8AG/Auoy?=
 =?us-ascii?Q?Gf9hpfj3tjhm41OFuJfzovWg8hNCW9ezhXci67T2IdXqtTBs9IDdyUSYOlUx?=
 =?us-ascii?Q?ARdGMlAzODkP1lhAYIlB20WZhVTEHcINMp40D52jguKeC5a+mslFesAf3soK?=
 =?us-ascii?Q?8K/1bIyRCa/0nwVgFAEwLmifCYVjFQRQY7XadvRZozWWG6323KbegnIGhKuk?=
 =?us-ascii?Q?4M+DTXg9cOTiOoQ3fBoXcURqt5PYh62r6KNFcW853SUt0UYEPA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+J8kaELoRUqT290M8qIkRKZ3OWKvcD1WL+KavY0CjBr+MiS/V6SR7PSCl/gG?=
 =?us-ascii?Q?PPhw5nsQYAp2ujkyg6nOxxT+SkHCF3gH6X17nYrtpf6xWnPGKJhLMUPw+i8i?=
 =?us-ascii?Q?0e1VaAJlTThvo76w9chqkhYlRKwoalrZxRc/UsXewS/GfMBaYmOCc80UHpI2?=
 =?us-ascii?Q?hkbRGcl9Dzz0ST606Q5MVW8E/eOtG5BQX+eI5ntoSRI0IUCgQWseWlrqElvQ?=
 =?us-ascii?Q?3nX8iOElSz4AAtFT9jWV9mc5SGlH98ra+6ktOaLo0x2l/sETR0VsJm+OQqAD?=
 =?us-ascii?Q?+eu4OVdIlV7V0cG8dHUS/n9kbDMs5fV3i892qFYcC2iC3agT6XBeBtYP4zUg?=
 =?us-ascii?Q?wmWv7cEbWOOy/gJhonbzWLMlxbpG/DQYnTYb4rsWR8wCoUFSwUAuvs0eZBYj?=
 =?us-ascii?Q?7mmKb8uMBJVvLKjBAOBT1/9YcBPWfwekcZD0bfreBb1oQ0lFdckpBRNLHRv4?=
 =?us-ascii?Q?v11ZCKwhVcV8gA9OKh8nxhXMQtdZnOqkaFCdfTAzy2G0ky7YKx5Vr2YBGMAX?=
 =?us-ascii?Q?BbqSHMZ1zPgouu0iw8IkMnq70zF/S2s6l7kLbqRbpR3sdLnT9i+qEgEr2uQ1?=
 =?us-ascii?Q?YOC4b800HSiVNSYCrfPIjJRfDRCETG3sEIR0dz1Xe9iIZMppxCvUyUeY/A92?=
 =?us-ascii?Q?fn1B3WQMuvoJ990tUXcxN/mYMYHPk5X7WaPGtqv+BuMYkHodvlZCppA7cfcs?=
 =?us-ascii?Q?3zqoYSqV0VGsgWbUPnX6z100Aok7zgVd0buv7td8jAMJahMNWt6ShNVGPvFq?=
 =?us-ascii?Q?JtKrtbMxq2YBYYqwoUbNKQEBO7sxKA6U7GU15Krf7FgpMxNEYPfK0NXvtN5K?=
 =?us-ascii?Q?mFPSk3SI1h67/T7jFrdQGurrbOVJDC0IrmmIOHTfEvKOZlSJh8rxU7IFfytD?=
 =?us-ascii?Q?EUHjRPAC/ZBK4uV3+Bh+09sH8q09KQlitTwkVMjvgOqfXmrPiKtxcVbREH03?=
 =?us-ascii?Q?M36i9NU5PaQTbLBAvuUopDkKA0neO+uI7tzVZdRwWg3c0HOSpbbpBcMGTEE1?=
 =?us-ascii?Q?SmD1/VjEGQNh/fZGYdVVwoKfIXCUiKrtc3v5QAORxIkYqyAsEJwCImv+6aI2?=
 =?us-ascii?Q?eIFybaPaxgs1J861y+IU+Q9q0cnMMna/2dcPzqXl6UuYWCPWEyycrZDQimr2?=
 =?us-ascii?Q?SX/IQkB2Rcn0ZdzhfAgt0vBHmg8Lm1D9ZitE40iSaID+Fcr15JRbnZUCqAAk?=
 =?us-ascii?Q?4tG4XIgHPLjSPjc2HO91mA3mUPVSUaAOWa/9oM7tYaAumd51lsNNoBhZw79T?=
 =?us-ascii?Q?wOoeUQ8DKxgCvvucH5E/GuSEc/tFw6WXmUDU/MKGg/ToegWdbSl5G3M+cP89?=
 =?us-ascii?Q?bwXHsN8F6Zw7vmn6HbRAJFDwsd6IvvhthjDlzSRBT8o/8mGvDynxWyjEa1x+?=
 =?us-ascii?Q?z/XQhpOQuqKB962y6I3w99LUqWs4gQvkjLhm6XARNETMcum2DarQb3504Q0j?=
 =?us-ascii?Q?Pe0n2zCD/fjdwC2PsuWGuQUKichBZaxGtvLHA7LT/kXHmRYQRd1dBXLzQcRq?=
 =?us-ascii?Q?OEjdPTAm30Ee5JK6yq9vAfzh7qRU6OlYMhi2AYNZohkR5b0XbPsGd5QKNo4M?=
 =?us-ascii?Q?ijzsTm66kAwg67HdpUw2rATGGVaPA93KeXzpKFcg/8itW+ALXMWrmrZrZmTr?=
 =?us-ascii?Q?bzHYT+/SfN2g9eHWCZib+74=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4319d61b-987f-48ab-83e3-08dcb4e683e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:32.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WguzEHuXgE8ellqC6CniPcIAKXWer4w8TyL7LKJePY1uV2NMkEH0HJ+9jxEp+nWFOow5ZAj5hoHLIonV725718RYe/mz5wLZYaeOH1HuCF7e9J5qJ196zdy0FFQ8nCV0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: V5VK6QUTXWZXQT6W2CFR4AWMBD4IFPUZ
X-Message-ID-Hash: V5VK6QUTXWZXQT6W2CFR4AWMBD4IFPUZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5VK6QUTXWZXQT6W2CFR4AWMBD4IFPUZ/>
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
 sound/usb/6fire/pcm.c           |  8 ++++----
 sound/usb/caiaq/audio.c         | 14 +++++++-------
 sound/usb/hiface/pcm.c          |  4 ++--
 sound/usb/line6/pcm.c           | 16 ++++++++--------
 sound/usb/media.c               |  2 +-
 sound/usb/pcm.c                 | 20 ++++++++++----------
 sound/usb/quirks.c              |  6 +++---
 sound/usb/stream.c              |  6 +++---
 sound/usb/usx2y/usbusx2yaudio.c |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c |  6 +++---
 10 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 32c39d8bd2e55..fa3dfceab11cc 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -119,9 +119,9 @@ static struct pcm_substream *usb6fire_pcm_get_substream(
 {
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
 
-	if (alsa_sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(alsa_sub))
 		return &rt->playback;
-	else if (alsa_sub->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(alsa_sub))
 		return &rt->capture;
 	dev_err(&rt->chip->dev->dev, "error getting pcm substream slot.\n");
 	return NULL;
@@ -395,12 +395,12 @@ static int usb6fire_pcm_open(struct snd_pcm_substream *alsa_sub)
 	mutex_lock(&rt->stream_mutex);
 	alsa_rt->hw = pcm_hw;
 
-	if (alsa_sub->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(alsa_sub)) {
 		if (rt->rate < ARRAY_SIZE(rates))
 			alsa_rt->hw.rates = rates_alsaid[rt->rate];
 		alsa_rt->hw.channels_max = OUT_N_CHANNELS;
 		sub = &rt->playback;
-	} else if (alsa_sub->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	} else if (snd_pcm_is_capture(alsa_sub)) {
 		if (rt->rate < ARRAY_SIZE(rates))
 			alsa_rt->hw.rates = rates_alsaid[rt->rate];
 		alsa_rt->hw.channels_max = IN_N_CHANNELS;
diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 4981753652a7f..6996c5e07095f 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -53,7 +53,7 @@ activate_substream(struct snd_usb_caiaqdev *cdev,
 {
 	spin_lock(&cdev->spinlock);
 
-	if (sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(sub))
 		cdev->sub_playback[sub->number] = sub;
 	else
 		cdev->sub_capture[sub->number] = sub;
@@ -68,7 +68,7 @@ deactivate_substream(struct snd_usb_caiaqdev *cdev,
 	unsigned long flags;
 	spin_lock_irqsave(&cdev->spinlock, flags);
 
-	if (sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(sub))
 		cdev->sub_playback[sub->number] = NULL;
 	else
 		cdev->sub_capture[sub->number] = NULL;
@@ -192,7 +192,7 @@ static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
 
 	dev_dbg(dev, "%s(%p)\n", __func__, substream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		int out_pos;
 
 		switch (cdev->spec.data_alignment) {
@@ -305,7 +305,7 @@ snd_usb_caiaq_pcm_pointer(struct snd_pcm_substream *sub)
 		goto unlock;
 	}
 
-	if (sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(sub))
 		ptr = bytes_to_frames(sub->runtime,
 					cdev->audio_out_buf_pos[index]);
 	else
@@ -339,7 +339,7 @@ static void check_for_elapsed_periods(struct snd_usb_caiaqdev *cdev,
 			continue;
 
 		pb = snd_pcm_lib_period_bytes(sub);
-		cnt = (sub->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		cnt = snd_pcm_is_playback(sub) ?
 					&cdev->period_out_count[stream] :
 					&cdev->period_in_count[stream];
 
@@ -701,7 +701,7 @@ static struct urb **alloc_urbs(struct snd_usb_caiaqdev *cdev, int dir, int *ret)
 	struct usb_device *usb_dev = cdev->chip.dev;
 	unsigned int pipe;
 
-	pipe = (dir == SNDRV_PCM_STREAM_PLAYBACK) ?
+	pipe = snd_pcm_is_playback(dir) ?
 		usb_sndisocpipe(usb_dev, ENDPOINT_PLAYBACK) :
 		usb_rcvisocpipe(usb_dev, ENDPOINT_CAPTURE);
 
@@ -741,7 +741,7 @@ static struct urb **alloc_urbs(struct snd_usb_caiaqdev *cdev, int dir, int *ret)
 		urbs[i]->context = &cdev->data_cb_info[i];
 		urbs[i]->interval = 1;
 		urbs[i]->number_of_packets = FRAMES_PER_URB;
-		urbs[i]->complete = (dir == SNDRV_PCM_STREAM_CAPTURE) ?
+		urbs[i]->complete = snd_pcm_is_capture(dir) ?
 					read_completed : write_completed;
 	}
 
diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index cf650fab54d7e..178f70fd64d51 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -172,7 +172,7 @@ static struct pcm_substream *hiface_pcm_get_substream(struct snd_pcm_substream
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
 	struct device *device = &rt->chip->dev->dev;
 
-	if (alsa_sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(alsa_sub))
 		return &rt->playback;
 
 	dev_err(device, "Error getting pcm substream slot.\n");
@@ -359,7 +359,7 @@ static int hiface_pcm_open(struct snd_pcm_substream *alsa_sub)
 	mutex_lock(&rt->stream_mutex);
 	alsa_rt->hw = pcm_hw;
 
-	if (alsa_sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(alsa_sub))
 		sub = &rt->playback;
 
 	if (!sub) {
diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index 6a4af725aedd2..db1d93de327fd 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -137,7 +137,7 @@ static void line6_wait_clear_audio_urbs(struct snd_line6_pcm *line6pcm,
 static inline struct line6_pcm_stream *
 get_stream(struct snd_line6_pcm *line6pcm, int direction)
 {
-	return (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return (snd_pcm_is_playback(direction)) ?
 		&line6pcm->out : &line6pcm->in;
 }
 
@@ -148,7 +148,7 @@ static int line6_buffer_acquire(struct snd_line6_pcm *line6pcm,
 				struct line6_pcm_stream *pstr, int direction, int type)
 {
 	const int pkt_size =
-		(direction == SNDRV_PCM_STREAM_PLAYBACK) ?
+		snd_pcm_is_playback(direction) ?
 			line6pcm->max_packet_size_out :
 			line6pcm->max_packet_size_in;
 
@@ -191,7 +191,7 @@ static int line6_stream_start(struct snd_line6_pcm *line6pcm, int direction,
 	    !(pstr->active_urbs || pstr->unlink_urbs)) {
 		pstr->count = 0;
 		/* Submit all currently available URBs */
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(direction))
 			ret = line6_submit_audio_out_all_urbs(line6pcm);
 		else
 			ret = line6_submit_audio_in_all_urbs(line6pcm);
@@ -216,7 +216,7 @@ static void line6_stream_stop(struct snd_line6_pcm *line6pcm, int direction,
 		spin_unlock_irqrestore(&pstr->lock, flags);
 		line6_unlink_audio_urbs(line6pcm, pstr);
 		spin_lock_irqsave(&pstr->lock, flags);
-		if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+		if (snd_pcm_is_capture(direction)) {
 			line6pcm->prev_fbuf = NULL;
 			line6pcm->prev_fsize = 0;
 		}
@@ -240,7 +240,7 @@ int snd_line6_trigger(struct snd_pcm_substream *substream, int cmd)
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
 		case SNDRV_PCM_TRIGGER_RESUME:
-			if (s->stream == SNDRV_PCM_STREAM_CAPTURE &&
+			if (snd_pcm_is_capture(s) &&
 				(line6pcm->line6->properties->capabilities &
 					LINE6_CAP_IN_NEEDS_OUT)) {
 				err = line6_stream_start(line6pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -256,7 +256,7 @@ int snd_line6_trigger(struct snd_pcm_substream *substream, int cmd)
 
 		case SNDRV_PCM_TRIGGER_STOP:
 		case SNDRV_PCM_TRIGGER_SUSPEND:
-			if (s->stream == SNDRV_PCM_STREAM_CAPTURE &&
+			if (snd_pcm_is_capture(s) &&
 				(line6pcm->line6->properties->capabilities &
 					LINE6_CAP_IN_NEEDS_OUT)) {
 				line6_stream_stop(line6pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -267,13 +267,13 @@ int snd_line6_trigger(struct snd_pcm_substream *substream, int cmd)
 			break;
 
 		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-			if (s->stream != SNDRV_PCM_STREAM_PLAYBACK)
+			if (!snd_pcm_is_playback(s))
 				return -EINVAL;
 			set_bit(LINE6_FLAG_PAUSE_PLAYBACK, &line6pcm->flags);
 			break;
 
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-			if (s->stream != SNDRV_PCM_STREAM_PLAYBACK)
+			if (!snd_pcm_is_playback(s))
 				return -EINVAL;
 			clear_bit(LINE6_FLAG_PAUSE_PLAYBACK, &line6pcm->flags);
 			break;
diff --git a/sound/usb/media.c b/sound/usb/media.c
index d48db6f3ae659..3870df7214e53 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -54,7 +54,7 @@ int snd_media_stream_init(struct snd_usb_substream *subs, struct snd_pcm *pcm,
 		return -ENOMEM;
 
 	mctl->media_dev = mdev;
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		intf_type = MEDIA_INTF_T_ALSA_PCM_PLAYBACK;
 		mctl->media_entity.function = MEDIA_ENT_F_AUDIO_PLAYBACK;
 		mctl->media_pad.flags = MEDIA_PAD_FL_SOURCE;
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 08bf535ed1632..18a0b55e4159f 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -37,7 +37,7 @@ static snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
 	int est_delay;
 	int queued;
 
-	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(subs->direction)) {
 		queued = bytes_to_frames(runtime, subs->inflight_bytes);
 		if (!queued)
 			return 0;
@@ -57,7 +57,7 @@ static snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
 	   some truncation for 44.1 but the estimate is good enough */
 	est_delay = frame_diff * runtime->rate / 1000;
 
-	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(subs->direction)) {
 		est_delay = queued - est_delay;
 		if (est_delay < 0)
 			est_delay = 0;
@@ -126,14 +126,14 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
 		 */
 		if (subs && attr != cur_attr) {
 			if ((attr == USB_ENDPOINT_SYNC_ASYNC &&
-			     subs->direction == SNDRV_PCM_STREAM_PLAYBACK) ||
+			     snd_pcm_is_playback(subs->direction)) ||
 			    (attr == USB_ENDPOINT_SYNC_ADAPTIVE &&
-			     subs->direction == SNDRV_PCM_STREAM_CAPTURE))
+			     snd_pcm_is_capture(subs->direction)))
 				continue;
 			if ((cur_attr == USB_ENDPOINT_SYNC_ASYNC &&
-			     subs->direction == SNDRV_PCM_STREAM_PLAYBACK) ||
+			     snd_pcm_is_playback(subs->direction)) ||
 			    (cur_attr == USB_ENDPOINT_SYNC_ADAPTIVE &&
-			     subs->direction == SNDRV_PCM_STREAM_CAPTURE)) {
+			     snd_pcm_is_capture(subs->direction))) {
 				found = fp;
 				cur_attr = attr;
 				continue;
@@ -616,7 +616,7 @@ static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
 {
 	struct snd_usb_audio *chip = subs->stream->chip;
 
-	if (subs->direction == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(subs->direction))
 		return false;
 	/* disabled via module option? */
 	if (!chip->lowlatency)
@@ -678,7 +678,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	runtime->delay = 0;
 
 	subs->lowlatency_playback = lowlatency_playback_available(runtime, subs);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    !subs->lowlatency_playback) {
 		ret = start_endpoints(subs);
 		/* if XRUN happens at starting streams (possibly with implicit
@@ -1212,7 +1212,7 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = snd_usb_hardware;
 	/* need an explicit sync to catch applptr update in low-latency mode */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(direction) &&
 	    as->chip->lowlatency)
 		runtime->hw.info |= SNDRV_PCM_INFO_SYNC_APPLPTR;
 	runtime->private_data = subs;
@@ -1770,7 +1770,7 @@ void snd_usb_set_pcm_ops(struct snd_pcm *pcm, int stream)
 {
 	const struct snd_pcm_ops *ops;
 
-	ops = stream == SNDRV_PCM_STREAM_PLAYBACK ?
+	ops = snd_pcm_is_playback(stream) ?
 			&snd_usb_playback_ops : &snd_usb_capture_ops;
 	snd_pcm_set_ops(pcm, stream, ops);
 }
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ea063a14cdd8f..b26d1aa12a698 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1685,7 +1685,7 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
 	 * sample rate shouldn't be changed
 	 * by playback substream
 	 */
-	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(subs->direction)) {
 		if (subs->stream->substream[SNDRV_PCM_STREAM_CAPTURE].cur_audiofmt)
 			return;
 	}
@@ -2017,7 +2017,7 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 	 * although it's really not...
 	 */
 		fp->ep_attr &= ~USB_ENDPOINT_SYNCTYPE;
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(stream))
 			fp->ep_attr |= USB_ENDPOINT_SYNC_ADAPTIVE;
 		else
 			fp->ep_attr |= USB_ENDPOINT_SYNC_SYNC;
@@ -2036,7 +2036,7 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		break;
 	case USB_ID(0x3511, 0x2b1e): /* Opencomm2 UC USB Bluetooth dongle */
 		/* mic works only when ep pitch control is not set */
-		if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(stream))
 			fp->attributes &= ~UAC_EP_CS_ATTR_PITCH_CONTROL;
 		break;
 	}
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index e14c725acebf2..b4096a2b53210 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -524,8 +524,8 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	as->chip = chip;
 	as->fmt_type = fp->fmt_type;
 	err = snd_pcm_new(chip->card, "USB Audio", chip->pcm_devs,
-			  stream == SNDRV_PCM_STREAM_PLAYBACK ? 1 : 0,
-			  stream == SNDRV_PCM_STREAM_PLAYBACK ? 0 : 1,
+			   snd_pcm_is_playback(stream),
+			  !snd_pcm_is_playback(stream),
 			  &pcm);
 	if (err < 0) {
 		kfree(as);
@@ -1058,7 +1058,7 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
 			audioformat_free(fp);
 			return NULL;
 		}
-		pd->pd_id = (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		pd->pd_id = snd_pcm_is_playback(stream) ?
 					UAC3_BADD_PD_ID10 : UAC3_BADD_PD_ID11;
 		pd->pd_d1d0_rec = UAC3_BADD_PD_RECOVER_D1D0;
 		pd->pd_d2d0_rec = UAC3_BADD_PD_RECOVER_D2D0;
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index ca7888495a9f4..7026e6a8f023b 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -816,7 +816,7 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&subs->usx2y->pcm_mutex);
 	snd_printdd("snd_usx2y_hw_free(%p)\n", substream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
 		atomic_set(&subs->state, STATE_STOPPED);
 		usx2y_urbs_release(subs);
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index 36f2e31168fb0..56111336d71f7 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -368,7 +368,7 @@ static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 	snd_printdd("%s(%p)\n", __func__, substream);
 
 	cap_subs2 = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
 		atomic_set(&subs->state, STATE_STOPPED);
 		usx2y_usbpcm_urbs_release(subs);
@@ -414,7 +414,7 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 	struct urb *urb;
 	unsigned long pack;
 
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(stream)) {
 		usx2y->hwdep_pcm_shm->captured_iso_head = -1;
 		usx2y->hwdep_pcm_shm->captured_iso_frames = 0;
 	}
@@ -592,7 +592,7 @@ static int snd_usx2y_usbpcm_open(struct snd_pcm_substream *substream)
 	if (!(subs->usx2y->chip_status & USX2Y_STAT_CHIP_MMAP_PCM_URBS))
 		return -EBUSY;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		runtime->hw = snd_usx2y_2c;
 	else
 		runtime->hw = (subs->usx2y->subs[3] ? snd_usx2y_4c : snd_usx2y_2c);
-- 
2.43.0

