Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADC947291
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1183F6F;
	Mon,  5 Aug 2024 02:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1183F6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818825;
	bh=nu9nZCnytCGQ3zFB+ND7OAfvLYFH/QXRJco+DbjfDc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CJ4E+aBz4ncA+2IZokYq7TX9CmoU3YWQ2FO6i7v+LF9fIlFF1tXDxJOXz23j9/Akp
	 sjmPiF8hSSmPtiMDaiPf05k2QerHRVuDlXY/w0sCgUIqeEPoG4V7dZud+N/x7Ed589
	 u6ApOomPdbvVOXCjm2hL/CSuP+WpbRdP8/xLrKBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41CDBF897BF; Mon,  5 Aug 2024 02:39:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCB57F805C5;
	Mon,  5 Aug 2024 02:39:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F6A8F800BF; Mon,  5 Aug 2024 02:37:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 88D35F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D35F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gmeQJAee
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSNjL3Me8cJKnlzQ2VFN6ASsrcE3XzS9hUis2BkuoCpRyw5aG67uAdlBwWCZQ9CO+bg+Frmy5bJxRjYJi04I4lg3XL6JMob0/ZF/XhTnM9NXGg9B1rRmmjZxa3RBhNtjSCvcCbYQJurBwPOe8UULN9nB0+R3IpsPWe4btosllxzEWde+6vwae78yxPPgGwPnJZoDQU9y/nYFR/WMj1d+z0HtjWwR6U7FPZOHQwMxPU9MOJ4yVEh/FS1WAZj+kE5D0KmRz4VDlKWzSRis2I4tk7KZLKyiBPxzgql6wkLdwfi7Vx5jsdPYJnsMhu9a9WeCuIM5b00h7QttHe//Bj/OPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LiorM7f5Ed/k2NXaSx6d0E558k24LxH7cojmjiBMkE=;
 b=Au/JXKOtka1TcpJNP2OZ4R3sfwOGdXBPtyuzRD6CPqUCholwfXimxEde+Bw+mL2qOxwEmCdIbiDNg+W13GsMgZNQK/gWEfeqs8khtoH2N1hfMwpQ+BdzkDhN1w3mH7F9vh03ZlluC7YrKVoJNGfYuX6K86cgNJrekFJMlKa+FCFPYEVob0ISAYGbwyWwgIFHzOsuQ/kR1qLBrqohm/13cVaCYq+PQLAXwO6F3PTrZAx8B/t0Opgkh9eiREDhN+gc4QVjQUoeW2LB25JsQ2oON06hjJyVHsFU7YgJrYTeNrh8Tom3bnRprSGip83K0uqYaD8oQ0It/oOmm1svrl8goQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LiorM7f5Ed/k2NXaSx6d0E558k24LxH7cojmjiBMkE=;
 b=gmeQJAeeovyjI/PTiCKUyGkjRfurmK7Bo8WGpn+AqrwZ4dfdFRh1ugLdaAvZTwrTDG3eCqX9e1Ae986mz1Fgw3QHQwRadvV5MShCyNbMPP15rcslwD0hzyWo4ySU9K1d4UUQ8RZ0t/u/DvSK7XdmSy4p0Uc06XOu4kBfgJSF1xE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:23 +0000
Message-ID: <87wmkvztx8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 030/113] ALSA: core: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:23 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: cc53b765-5c6d-447d-9066-08dcb4e6c5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aCiTYSEnTbojOJVUBzXDPUXRc0tQJVDwGWPc9HyBRXCJiqZGsD5mHtRlgqra?=
 =?us-ascii?Q?YpSBOpS0SCzQXQZ3DmEn4vkIUEpMvH2+o6jJvO5uKLARUdV3xcvgBHDmIUz8?=
 =?us-ascii?Q?Wsw9vpTLi9IoasPbV209NhUERgPAlVUAgkyksw3+34kSP1r3g6M8Q1khjzNW?=
 =?us-ascii?Q?BIhB56VfQ54mY7O8c/UYHlvJJqM2nJfim0XDcJUzPZJE8XKLIWfkC7uFytS2?=
 =?us-ascii?Q?iCDaK5nT6B3ekPnQ+J1MMi+SxIR0Cct0gFNooQMNLdbexghTNLJU5QFb1CYn?=
 =?us-ascii?Q?0RoAVbmMBLY5Es/aNJPze7v0ZK5Qbf+r8CW6kqad++pFSiHDJf++pU0UI89v?=
 =?us-ascii?Q?OqmFqWd3zYaUg8ziN2BZewxWyw/DOGdKmyQaq7Pwc9SaYGvr0v4e8jDz8FiP?=
 =?us-ascii?Q?5HP75ocMfyIyeea9kB9u7V08bdjcDXDxATHiMmxGaDtWROErSdUV19wAYRaK?=
 =?us-ascii?Q?d6Qhy905Z77ui5mVnmcKLbP2H5lzOxTYpmVEe5G0GWX5HdYVYxveziltDFFj?=
 =?us-ascii?Q?c5/risnuUYC1eG84zmsuOI0OsJquklKTmrjJzTAOH2GXmKAuqf7fsyj/hkYM?=
 =?us-ascii?Q?PjFy87Q6bLAPEK6kf0/MlepJkCk819ouUYgG5BlNyLMxZ8nu2Bfxl3h3meA/?=
 =?us-ascii?Q?wV/0/nGWSrsAIN4ax21nB70dosisepsnaxyGz2mq1JQ4GcHh7rCdVIkHcLt0?=
 =?us-ascii?Q?qYI5mKLqCDvtDjDNhbkHV20Q3boUX/oqXNLQoSXBlMDkhs7S3mgcKAMh5x5c?=
 =?us-ascii?Q?/5M2Ou8WrKq+h8brQ3Uy01CWgyjfAG6e4x0MPaG96OQi+oUkqcVtZ9q0NyIy?=
 =?us-ascii?Q?WdJQvcVHU7Br0fpO6dhi4Tr0C5egeqLHClH2satpd6hUmeTLkYhP7cbPlgKR?=
 =?us-ascii?Q?QpGrtT4qy1ldtxu0Ee/4/6A2jXy7DxIN/UUG09uTETY4taYTrERX8gzDjGsv?=
 =?us-ascii?Q?5OXVjLmvCyCOrc5/tgeRPcZqF8jvpEJ8tCmWEFb6CEZYS4m7D4TGQOfg4WuP?=
 =?us-ascii?Q?tZp5eCgTGt9a2d6/Aw4SOWRoUPcO61eX3bGNck4QRh0E4il5rMbi6f5QRfaZ?=
 =?us-ascii?Q?Rp/aMsRgUdBf1yJ99vZJeSqTGXwldAlC6WxcwCho6QY2qan9oRNaQZLbTLpJ?=
 =?us-ascii?Q?xs1Hl8ZebzdVRXFip3Qga1IKK0XJEs9HWgIHctz2pw7CNk3lzjdXOjnj35XI?=
 =?us-ascii?Q?NnrV1ID1utjQr9YMlvTQOy4vpKKd2wI7CfyudKpBzV+/AX8K+1kHyK0lobzy?=
 =?us-ascii?Q?fBpTYWx48ybmlZV+9wmNqCr0SXQ2jwJ8uA7nmXF2N/BRFGzrbXRu2v+hu4YE?=
 =?us-ascii?Q?3xjgqRD7D05j1bMZN8DHV3D5zTUgDqPsV2AUcEGXqttBPMLQ/CsywpdpVRP3?=
 =?us-ascii?Q?N7cckwevtiI2ZpErJNkZpkxEdQ5BUg5oo5hZ4eVTld1g0E8dIQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?78ipTg3jJ3KSBMZMeWrPPhJUSFrmJeh5aWP31XrS03tW/77LWg2OwokmDQ4b?=
 =?us-ascii?Q?PSz44fgGibFq967K4p+593g1EKvHMEj8h4+CxGUHS9YVwRTz6ynOVN1ahJD9?=
 =?us-ascii?Q?xE4yAdjEGtvELGNLumGax01iIsqi/74+d0mP4hKj+EE8jRTHTFbCTugbOAQy?=
 =?us-ascii?Q?kcxt9DTkg4B3EoZAf/dkkRbctM84ujxbMetG0CCzpQYt9i4f+vdbM0aL0BJI?=
 =?us-ascii?Q?Btwks9j+qpjpPUIfNtJ7Vk2ilqv+3ijYjd53CIZhLrYBnh6qyzR043ObZIf4?=
 =?us-ascii?Q?8RKe1lcDAhyAOwjdnk5dHed3D8ufUlPTYuZaqNRxWjpXSn2Np20On2rsz/Oa?=
 =?us-ascii?Q?hXgG0JvDtDm60hn6B/2/jIgfB1SMk4AdjBEMN36TcTr5/0/Sy3GVDDcwOS9t?=
 =?us-ascii?Q?b+Dif5MMqOb0KDam3DIcysmJ7ucBIllCCvmaKN4+/GxF3evU1I5nqKnl4Huv?=
 =?us-ascii?Q?MjcxFHibFWS0Gh0vBYvJEHZqzquAFE6Y+tfNvn6xFZk3/d7JLXKpGusEGbP1?=
 =?us-ascii?Q?phypi3UCdxBh9cNUWhnQn8NO3ZOKWXOEpmdEmapt6x9TffabZeEFbzXc10s1?=
 =?us-ascii?Q?93dD3qtgYIjXRZvukFepDoL1Juo6wQPXeIsh+nXHF5/JaGjMLaZ1je1H0i+7?=
 =?us-ascii?Q?5/039bUF7W97Tef+FJu3Z09zDCosaIKBPub0IchzFFidFKqfba0/HOhc0Vc2?=
 =?us-ascii?Q?KAFMUOvm1BMgvXquP3hehpN9Z4/zXLeMh+8ihKpqnMB9s++wRZsO6kxO19qu?=
 =?us-ascii?Q?lf6qSAiKW6bxR2RBrg5lSyi5W2ydMIj+0+CUYOB/b8/BEIC8WS4Mutq+dLUX?=
 =?us-ascii?Q?5eeqtMd7yr00QntsP01rqJ4UEMf1t3/pZ1LY1GjYtWoMgUIceErRvpBSWHY5?=
 =?us-ascii?Q?WVcn+l04GDmaHKfcvFSpdj3RZ7DReBi92dLp29tX+np0ZZSrAHXCkCp149Lx?=
 =?us-ascii?Q?e0We/14NWUZvxZxGl/7UUBNM+PUSGp6YgqI3jbHfuLbbXaATSEyu7L+ZlJq4?=
 =?us-ascii?Q?WfJ2cSdU3ByZq5M3C1JLEurWoqhfnY0aMOftGirvMbddpu39XLw6BUlkuxfo?=
 =?us-ascii?Q?oTqH9hdhVk/oMgkJtPSClwml4lpzVLQBqw4w+tCnZopywI2UFWqQnWOQAo0z?=
 =?us-ascii?Q?sNvgZZmJrJYGLunRMEoIB44z1dLoSNHu6ZAA4LRTu27eDNZkrSWzVw+/Z9kZ?=
 =?us-ascii?Q?zNVbw2km1vnQQsgVGO7sPOmAaiB7qPe8+ZtTK5Q6eoRSupCTYUnE738bv/Md?=
 =?us-ascii?Q?oOAyy//EFXHlPQ44Qo4pMZN08SGIVrh6FMXUr5SIo+grf1TdlOVqIY7zaXpM?=
 =?us-ascii?Q?NeCVBH0WxPpPbhGK8GH616Z+sq2a7utuokbJqhasI5Oo++TonfhhPyfncSYp?=
 =?us-ascii?Q?6dWehtbZHgBuDsmDNaRvFv7pUy7KB8O0sEEcn9hin/PjPCZm+iw9VygdnfvA?=
 =?us-ascii?Q?NmRnXKHMy6JAhCIYaUiNiLix/qpeTjnqTPsmaO8OVbBTaiPqySzJTK4R85VC?=
 =?us-ascii?Q?rfGHbTL7iCo6MstLW8PjbhYHivQWmNGpRYHtvtl68h5MvTdYXC5cukBflSpS?=
 =?us-ascii?Q?1HuFPg0JiYbnDvye3E9d4+VOruX3aErwZz4NIxZy7y/D+3kUXQ0TFxoXD9eT?=
 =?us-ascii?Q?g4s0kdPcwobgcDRyKm68J9E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc53b765-5c6d-447d-9066-08dcb4e6c5ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:23.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bKlUJCE/6o+t1xA2Bmt2r8eA7rUhEiqNdCjhStLwHtP+F/DWt67AyS1i5uKm8wKZ2fCp4F7ho0OQ8JldYINXTL/0zDLPtCl6s9uYDXA/5qAu46BuQmBJwhblMev6qphR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: O4D75LUFPUGB6KECXBKO6B7SML22CVLG
X-Message-ID-Hash: O4D75LUFPUGB6KECXBKO6B7SML22CVLG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4D75LUFPUGB6KECXBKO6B7SML22CVLG/>
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
 sound/core/pcm.c           |  8 ++++----
 sound/core/pcm_compat.c    |  4 ++--
 sound/core/pcm_dmaengine.c |  6 +++---
 sound/core/pcm_lib.c       | 14 +++++++-------
 sound/core/pcm_local.h     |  4 ++--
 sound/core/pcm_memory.c    |  2 +-
 sound/core/pcm_native.c    | 30 +++++++++++++++---------------
 7 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index dc37f3508dc7a..fdbfb13e4d18f 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -497,7 +497,7 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
 	char name[16];
 
 	sprintf(name, "pcm%i%c", pcm->device, 
-		pstr->stream == SNDRV_PCM_STREAM_PLAYBACK ? 'p' : 'c');
+		snd_pcm_is_playback(pstr->stream) ? 'p' : 'c');
 	entry = snd_info_create_card_entry(pcm->card, name,
 					   pcm->card->proc_root);
 	if (!entry)
@@ -642,7 +642,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 	if (err < 0)
 		return err;
 	dev_set_name(pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
-		     stream == SNDRV_PCM_STREAM_PLAYBACK ? 'p' : 'c');
+		     snd_pcm_is_playback(stream) ? 'p' : 'c');
 	pstr->dev->groups = pcm_dev_attr_groups;
 	pstr->dev->type = &pcm_dev_type;
 	dev_set_drvdata(pstr->dev, pstr);
@@ -884,8 +884,8 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 
 	if (snd_BUG_ON(!pcm || !rsubstream))
 		return -ENXIO;
-	if (snd_BUG_ON(stream != SNDRV_PCM_STREAM_PLAYBACK &&
-		       stream != SNDRV_PCM_STREAM_CAPTURE))
+	if (snd_BUG_ON(!snd_pcm_is_playback(stream) &&
+		       !snd_pcm_is_capture(stream)))
 		return -EINVAL;
 	*rsubstream = NULL;
 	pstr = &pcm->streams[stream];
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index a42ec7f5a1daf..47fbbbdb5a8c7 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -300,7 +300,7 @@ static int snd_pcm_ioctl_xferi_compat(struct snd_pcm_substream *substream,
 	    get_user(frames, &data32->frames))
 		return -EFAULT;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		err = snd_pcm_lib_write(substream, compat_ptr(buf), frames);
 	else
 		err = snd_pcm_lib_read(substream, compat_ptr(buf), frames);
@@ -359,7 +359,7 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 		bufs[i] = compat_ptr(ptr);
 		bufptr++;
 	}
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(dir))
 		err = snd_pcm_lib_writev(substream, bufs, frames);
 	else
 		err = snd_pcm_lib_readv(substream, bufs, frames);
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index b134a51b3fd58..30db37652038f 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -72,7 +72,7 @@ int snd_hwparams_to_dma_slave_config(const struct snd_pcm_substream *substream,
 	else
 		buswidth = DMA_SLAVE_BUSWIDTH_8_BYTES;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		slave_config->direction = DMA_MEM_TO_DEV;
 		slave_config->dst_addr_width = buswidth;
 	} else {
@@ -108,7 +108,7 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
 	const struct snd_dmaengine_dai_dma_data *dma_data,
 	struct dma_slave_config *slave_config)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		slave_config->dst_addr = dma_data->addr;
 		slave_config->dst_maxburst = dma_data->maxburst;
 		if (dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK)
@@ -444,7 +444,7 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
 		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
 			hw->info |= SNDRV_PCM_INFO_BATCH;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			addr_widths = dma_caps.dst_addr_widths;
 		else
 			addr_widths = dma_caps.src_addr_widths;
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6e7905749c4a3..34f45deaf493b 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -253,7 +253,7 @@ static void update_audio_tstamp(struct snd_pcm_substream *substream,
 		audio_frames = runtime->hw_ptr_wrap + runtime->status->hw_ptr;
 
 		if (runtime->audio_tstamp_config.report_delay) {
-			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			if (snd_pcm_is_playback(substream))
 				audio_frames -=  runtime->delay;
 			else
 				audio_frames +=  runtime->delay;
@@ -464,7 +464,7 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    runtime->silence_size > 0)
 		snd_pcm_playback_silence(substream, new_hw_ptr);
 
@@ -1947,7 +1947,7 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 			      snd_pcm_uframes_t *availp)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int is_playback = snd_pcm_is_playback(substream);
 	wait_queue_entry_t wait;
 	int err = 0;
 	snd_pcm_uframes_t avail = 0;
@@ -2069,7 +2069,7 @@ static int fill_silence(struct snd_pcm_substream *substream, int channel,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return 0;
 	if (substream->ops->fill_silence)
 		return substream->ops->fill_silence(substream, channel,
@@ -2100,7 +2100,7 @@ static int do_transfer(struct snd_pcm_substream *substream, int c,
 	struct iov_iter iter;
 	int err, type;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		type = ITER_SOURCE;
 	else
 		type = ITER_DEST;
@@ -2283,7 +2283,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	if (err < 0)
 		return err;
 
-	is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	is_playback = snd_pcm_is_playback(substream);
 	if (interleaved) {
 		if (runtime->access != SNDRV_PCM_ACCESS_RW_INTERLEAVED &&
 		    runtime->channels > 1)
@@ -2605,7 +2605,7 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 	info->stream = stream;
 	info->chmap = chmap;
 	info->max_channels = max_channels;
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		knew.name = "Playback Channel Map";
 	else
 		knew.name = "Capture Channel Map";
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index ecb21697ae3a4..f08030e56aab6 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -35,7 +35,7 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream,
 static inline snd_pcm_uframes_t
 snd_pcm_avail(struct snd_pcm_substream *substream)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return snd_pcm_playback_avail(substream->runtime);
 	else
 		return snd_pcm_capture_avail(substream->runtime);
@@ -44,7 +44,7 @@ snd_pcm_avail(struct snd_pcm_substream *substream)
 static inline snd_pcm_uframes_t
 snd_pcm_hw_avail(struct snd_pcm_substream *substream)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return snd_pcm_playback_hw_avail(substream->runtime);
 	else
 		return snd_pcm_capture_hw_avail(substream->runtime);
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 506386959f084..2d55d3bf72d5b 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -63,7 +63,7 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 		__update_allocated_size(card, size);
 	}
 
-	if (str == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(str))
 		dir = DMA_TO_DEVICE;
 	else
 		dir = DMA_FROM_DEVICE;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4057f9f10aeec..5e57ab50f4c0f 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -972,7 +972,7 @@ static int snd_pcm_sw_params(struct snd_pcm_substream *substream,
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
 		if (snd_pcm_running(substream)) {
-			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+			if (snd_pcm_is_playback(substream) &&
 			    runtime->silence_size > 0)
 				snd_pcm_playback_silence(substream, ULONG_MAX);
 			err = snd_pcm_update_state(substream, runtime);
@@ -999,7 +999,7 @@ snd_pcm_calc_delay(struct snd_pcm_substream *substream)
 {
 	snd_pcm_uframes_t delay;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		delay = snd_pcm_playback_hw_avail(substream->runtime);
 	else
 		delay = snd_pcm_capture_avail(substream->runtime);
@@ -1419,7 +1419,7 @@ static int snd_pcm_pre_start(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->state != SNDRV_PCM_STATE_PREPARED)
 		return -EBADFD;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    !snd_pcm_playback_data(substream))
 		return -EPIPE;
 	runtime->trigger_tstamp_latched = false;
@@ -1459,7 +1459,7 @@ static void snd_pcm_post_start(struct snd_pcm_substream *substream,
 	runtime->hw_ptr_buffer_jiffies = (runtime->buffer_size * HZ) / 
 							    runtime->rate;
 	__snd_pcm_set_state(runtime, state);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    runtime->silence_size > 0)
 		snd_pcm_playback_silence(substream, ULONG_MAX);
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTART);
@@ -1798,7 +1798,7 @@ static int snd_pcm_do_resume(struct snd_pcm_substream *substream,
 	/* DMA not running previously? */
 	if (runtime->suspended_state != SNDRV_PCM_STATE_RUNNING &&
 	    (runtime->suspended_state != SNDRV_PCM_STATE_DRAINING ||
-	     substream->stream != SNDRV_PCM_STREAM_PLAYBACK))
+	     !snd_pcm_is_playback(substream)))
 		return 0;
 	return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_RESUME);
 }
@@ -1904,7 +1904,7 @@ static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    runtime->silence_size > 0)
 		snd_pcm_playback_silence(substream, ULONG_MAX);
 }
@@ -2021,7 +2021,7 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
 				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (runtime->state) {
 		case SNDRV_PCM_STATE_PREPARED:
 			/* start playback stream if possible */
@@ -2130,7 +2130,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 		to_check = NULL;
 		group = snd_pcm_stream_group_ref(substream);
 		snd_pcm_group_for_each_entry(s, substream) {
-			if (s->stream != SNDRV_PCM_STREAM_PLAYBACK)
+			if (!snd_pcm_is_playback(s))
 				continue;
 			runtime = s->runtime;
 			if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
@@ -2916,7 +2916,7 @@ static int do_pcm_hwsync(struct snd_pcm_substream *substream)
 {
 	switch (substream->runtime->state) {
 	case SNDRV_PCM_STATE_DRAINING:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			return -EBADFD;
 		fallthrough;
 	case SNDRV_PCM_STATE_RUNNING:
@@ -3215,7 +3215,7 @@ static int snd_pcm_xferi_frames_ioctl(struct snd_pcm_substream *substream,
 		return -EFAULT;
 	if (copy_from_user(&xferi, _xferi, sizeof(xferi)))
 		return -EFAULT;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		result = snd_pcm_lib_write(substream, xferi.buf, xferi.frames);
 	else
 		result = snd_pcm_lib_read(substream, xferi.buf, xferi.frames);
@@ -3244,7 +3244,7 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 	bufs = memdup_user(xfern.bufs, sizeof(void *) * runtime->channels);
 	if (IS_ERR(bufs))
 		return PTR_ERR(no_free_ptr(bufs));
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		result = snd_pcm_lib_writev(substream, bufs, xfern.frames);
 	else
 		result = snd_pcm_lib_readv(substream, bufs, xfern.frames);
@@ -3433,7 +3433,7 @@ int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_IOCTL_FORWARD:
 	{
 		/* provided only for OSS; capture-only and no value returned */
-		if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+		if (!snd_pcm_is_capture(substream))
 			return -EINVAL;
 		result = snd_pcm_forward(substream, *frames);
 		return result < 0 ? result : 0;
@@ -3596,7 +3596,7 @@ static __poll_t snd_pcm_poll(struct file *file, poll_table *wait)
 	pcm_file = file->private_data;
 
 	substream = pcm_file->substream;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		ok = EPOLLOUT | EPOLLWRNORM;
 	else
 		ok = EPOLLIN | EPOLLRDNORM;
@@ -3620,7 +3620,7 @@ static __poll_t snd_pcm_poll(struct file *file, poll_table *wait)
 			mask = ok;
 		break;
 	case SNDRV_PCM_STATE_DRAINING:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (snd_pcm_is_capture(substream)) {
 			mask = ok;
 			if (!avail)
 				mask |= EPOLLERR;
@@ -3876,7 +3876,7 @@ int snd_pcm_mmap_data(struct snd_pcm_substream *substream, struct file *file,
 	size_t dma_bytes;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (!(area->vm_flags & (VM_WRITE|VM_READ)))
 			return -EINVAL;
 	} else {
-- 
2.43.0

