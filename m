Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C73947292
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:48:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 509E748A9;
	Mon,  5 Aug 2024 02:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 509E748A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818832;
	bh=BZvktJfse6DJvdv1KZoBYZ/DlJ6YUma/3x69Hgn3tHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z0ZZPBXU6x2vW35No0yfCj41uGoVv+B3FzONxCHWyPMRjEPp6+tvrab34MHjNchUJ
	 l47778VYoKv1aL+WApyL/PcieG8nR6KJiOUnj/WZe9eJsw8UhZHxKDs+z7E6LwM5vu
	 xrS/6sjEAJ5S9Lo6waLpxMgv8EH00XZroT0gzFnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D67DF89849; Mon,  5 Aug 2024 02:39:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 425E0F89816;
	Mon,  5 Aug 2024 02:39:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30DDFF802DB; Mon,  5 Aug 2024 02:37:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 15E2BF8023A
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15E2BF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dzjgFphK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOGp/HEc2nzEByAmShfx+Au9yxNnSffzAt2hnd1rxybe4ullej3j6OJTCWZS7m9qywUxf6p3gLDPxCfA4pHvIbTUx0HtS4tFXUG/YcSX1wePQNJMApjSDLwEgrmjROkcNE4IedaI1R9oM52Nj8mrpnuYlA88v7MmMlDoA4s7IWo21EoRVjXJO2HsOSR0X1RTXdJvCYj1jRkpC9X3PKgw/hos/K/mfLvvCL2Z9LjP98sOA1jxu9zUVbXm6TdqWd4onaMLFd5IiQ8pH+wQv91feWIktn7GMPAPThkSnhNgYk/crZMhL3nU4BhFxpYvUSIY+Ld+W8PYtk5nkOtN8RbsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU8s26hr/REx39uwIqvIC6UC8Mih1rf08xzWkM0Mq3U=;
 b=LVtUQdRhS60h1tkGpO3efm6qljAOJkOkF69oZj6LArbqdk0ShikKjzbUe5xaSZxY20QXLXpOp/iPBrUr7q9L9g4JVHkVPvGoh2DOotABUvYMfpAFKKBbhyZNEuiK1di+xLR5Hr5b0n/lsQUQ/01iX6ys58s+8W5cgiumCDdMl+Os+NOzBiAKjQ5TtcFQ4hoUhDlwq5qg4a4AryA3/Lq6MLiRxZ125kwRtxsHhNClF8XP2uL/HSp8LI96tiLwJUnQrlkXI5NNuqcA3xWYeieJTuoWEyJ2KpvxoMRtA9yvu74qGb7BmMq7UIA05Ve1NJZiKrsTODkqgKpr1IVkNQpt0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU8s26hr/REx39uwIqvIC6UC8Mih1rf08xzWkM0Mq3U=;
 b=dzjgFphKVn5QqQ7ooyXurVP7ra3+UgofyunfBWCkNpTXaij+4iVoTG+AemQFtRKEdq9kdL/pSWavT2Blj93/O/tV/wfpvQTAhxejzDAM62d423dYhxRFy3P6zl2memiKFIZH1jWFDj/R0ZwXEPQ4qqB3s4aqW8REZKoXLnLMurk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:29 +0000
Message-ID: <87v80fztx3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 031/113] ALSA: core: oss: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:28 +0000
X-ClientProxiedBy: TYWPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: edc7e49b-ab78-4e1b-772b-08dcb4e6c918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8h+awG9Ihi2jOe4vKB8dAVS5sL/epIDj4+8Vtp00Sqy4WJqNIVfTNThGHGun?=
 =?us-ascii?Q?9drPrt3Qz8wMka/2wx9t8AJh3WxLM+uDIV5OMThFtAjhBmvDvDuq1q0aqjGq?=
 =?us-ascii?Q?p/l8/lahS2KalRkqfKXZjfpqVkWD3cmhw2wg00KLB6dFOibXAnOB6e9ObVKo?=
 =?us-ascii?Q?LfDV37MfREImvAmDkrXKTTROOw8QDans9SQ/06PPjCXJZTctnjquA2e/GqZ7?=
 =?us-ascii?Q?d9PPweXZejcpdwqgSTVqYfBzEZ5ZpZT/rpR4MFMFBWcZiZHmDVu+5Sq7Vp+b?=
 =?us-ascii?Q?VSgnb5rZpqQPZ9KZD2moOUxDKwnheZmBPo9K2p3zP+Q9WHAFI4Gdv5Zyg8xi?=
 =?us-ascii?Q?lBMPuqDZV0haMuTHw8ZyzfvF53tfiqbh0gvEgFHdMJisZ3LlH8+/NGS8ABvL?=
 =?us-ascii?Q?4bjecnY+PLUzeNT64ULkLknQOtq/HZRx3JTKQIYxJUrjYtkAWMtBJY/IsdbC?=
 =?us-ascii?Q?5qs237b5okomTWaHX9m3aZMGaYjnpUajXLn8FzfCasvnfeZ2fuFqm6IFAd2N?=
 =?us-ascii?Q?DrcfNA3nP/QV0C2r9eDpzXH/xBZXQDF92R0wbyucCaKaxIy6BMUgJF0flCE4?=
 =?us-ascii?Q?oHeUAy0PHp6eW5GYiXHQ1FALXTPzG47VceJsuh6DL1wxz/HFHAblVDtcr7Kg?=
 =?us-ascii?Q?C6madorn0MSEFsYaJiyqDZW02iNUXJulQMuTPzHIdB4Z9gfAL+6pLUFiCPpw?=
 =?us-ascii?Q?NEQYYZ2cUZZWADkvofpOGcFPJEuOy3y+ai3hFpoUTqsGgp4KMWQ2z+aozCq4?=
 =?us-ascii?Q?VdOOgW20iwI80YbS8t3e/4CV26LZs9DIR7T0TeWS9HbCEWHRyUvAy3NZCm59?=
 =?us-ascii?Q?LPUEZkqFWvYjCzC3LnhVs1lzK0bI141V45h1YhUmxY1sNR1HOU7lLyhtjDX3?=
 =?us-ascii?Q?Gj8HH1YMcH+lat40/3KoNSz+JMXlhfqMACP7bp3i4MZGol32REbndMY5axqK?=
 =?us-ascii?Q?WG/8h11dXXHke0++ovLEHxcbjMSE/C3xYKH1tr6borknI0Ks+4SKfGAoDfA2?=
 =?us-ascii?Q?3NRSlAFfUbReKEhvnVCsxD3vnRTBQC8Hwvsjep0Wk3RoJfCw+EZavsQDjE1f?=
 =?us-ascii?Q?m55J8ksnJ/bJnTJbSsFMSRhNkfpVPFijv+ics6qm8WOZ5nYfnfmlqzWeUCBi?=
 =?us-ascii?Q?+D3OJ1N1f6vsD7MgzNBLXTmDkd0k49T/nhSl1CgYU88Y33ZpCRzAv2jqFbMP?=
 =?us-ascii?Q?1CdjykDS5SJeJ8ERdxW+VWXDRMtQbxm1nyN92Y5temHiUK49GgcUwnz6fSaH?=
 =?us-ascii?Q?ioeVMM3FPnbuYZJH/CXwKJc559/M35herxqsQob54qGSIW7ZiUGWkcd7/kPt?=
 =?us-ascii?Q?xiD1DG35ak+qFrgVviKtt+hn7bSOsxPaAB8QrdHOdG994PP1UABlXlJZGDWG?=
 =?us-ascii?Q?wihcPcoxfczUEEjlIKfOXyooNumXNNXP4/M6ZejkZtEEBcYj9Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9F9tzpZK3CAaetxPKEsCpDIoRsWucObyyXmDeGf8QoY+n01kXhJOuWA+B8Jj?=
 =?us-ascii?Q?MIsguUZvcx2htU/UBgaQ/y9ugVA1qpeb8ktMm4Kzk2XOtDhqkoZpTrcPZRqp?=
 =?us-ascii?Q?O9dbFvLZhtee6hWhEFmDltTduYijWKbyR8SiA8PemGTDBqGUKciKRCGUPsKY?=
 =?us-ascii?Q?QO3HFGLr+zCMxKG0CF4ZqaSBBKXRM6NH0iwHSa59LukD84AiTLAl2ZgtL2QH?=
 =?us-ascii?Q?6c8M+rp/S/dJFNTNaVO5QJ8B7AOxzkmgkhoUiy9xapRfJLfucVvI30n7Dk40?=
 =?us-ascii?Q?1oiriFLx/oSe5inrxZ6PyCkN45tNprRBRwXeMyU99idmpr3r3CppWyApCWKp?=
 =?us-ascii?Q?Xgt7htQOkkxp2/grHflVTnqiTpfUtLQTHzgV2lB3QShkbPUWoP8R/JMgA780?=
 =?us-ascii?Q?B9emZE4Ikic1zRQo9TkjnqBhEKhJSiLOr4/B8H0P3ni3WeulTbfFBNexYFOQ?=
 =?us-ascii?Q?OF0Qe89RwQflCPT1LqlUJNewNmEIB8fdLtKFAz/Fq21Ey4BX4y7SC4sKCaCF?=
 =?us-ascii?Q?RpAriBVTLLx1WunBtRlyMg33pt39ua1lBISg6gwGD3jXPysPcRMXDPGKWbyl?=
 =?us-ascii?Q?LGU2u0AZe+NkArDJW0cQ84/6T2v5fgEWBT/uT37eUSRCuWpGbtBA6ky8R2Rk?=
 =?us-ascii?Q?7QuQN60Luu2kToinlTEpg8UF0nBmDV0ByL3ppwYBOBqG0ymzapuNdO7lp26y?=
 =?us-ascii?Q?yDsQyMzlkAzdcYjpLqImqVvdzlwIzhHIN103UgvL6cJQG031E2J/nJ2sUDge?=
 =?us-ascii?Q?qZeMRufFVzd3HURFnN6cdsLh1Yoc0OgSWiZ0Ndf5INbOiAVet5mJ3iP7hQ5N?=
 =?us-ascii?Q?jcSdPAjCM/CQ5Qx+s7bH6TLJmKylAg+EjFOTI9aGBG0udoRsoj5XAqfSqhMj?=
 =?us-ascii?Q?1WV91s0u1Id7wO039koR83/PFmu3YgX3ilyYc707voCGHXOorsxOq8ojJiyR?=
 =?us-ascii?Q?jyocucxkds9PYd/SlNbGW3k2Ir+sEpYK5RldJGzF3wCTjbdOrG0fgWjtoaCM?=
 =?us-ascii?Q?Qd87jzR4i6g4+mmqVomlgsc2I0MAx0Lalv7yvIgA9NLYhGlMvPAq9ognJAho?=
 =?us-ascii?Q?EWUjhJod7N+cIqhtrF/Etl4Dgq9k+f7km0x/N6htFR7/+rnTuJCfPzUwLnDD?=
 =?us-ascii?Q?bKSwmcNXnUAPCiC+bUtG126+T4Q2ApY90khRQaRbSP6wtsyMP2THJLythIl5?=
 =?us-ascii?Q?Bi13XyPn9C5RPbcEA1gK4FsCHZjOH4n9H3w/Frg+y262jEbFa8EYJ7CHdCg0?=
 =?us-ascii?Q?k2z+iMMGbOQmg8iGPaExLF3SvM+vKjGiWrDqK8pKwIhfOJ++Z/sv86ZkktE/?=
 =?us-ascii?Q?2p+6PfDDfx/2UPUu6yeBCNHI7KBlb4HsE8Y2GCdLiQXoDpppJMo9EBgW7w8r?=
 =?us-ascii?Q?8wQwiicfJKY0EIKUtyOp2zUc+rgkm6p4M2ScwSsZBISJXnixTfPXrie8J33v?=
 =?us-ascii?Q?jN8on+revjocAMtZIXHgdqDs53CTlaz9qJX4S6PCJip3I4f0ZNxTayO+UQyR?=
 =?us-ascii?Q?vM6JEXZ+HrBrHtBsgqlrgEL92muEiA/4fu2z6zTXCTV9988+0GEhrldK7ww0?=
 =?us-ascii?Q?pCeLMzKUoikexbcwPv980xeNx/NKqABGs6bIs1mwLc29ilQsNd5MfJiDLYU0?=
 =?us-ascii?Q?i7lAWtGirPa0yVcgT5PD+nw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 edc7e49b-ab78-4e1b-772b-08dcb4e6c918
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:29.0137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n0yIdWpWn2E2KmJSVD13k11bXHxGVwutXTbGWvqeZEWLMTH6Lh8l9u1NrHojK0B7uohcV69Gv/gsJ0xHsGs2+VMb52dXWShqsxEMJllWIZ2h7Q2owh3vSoNjcCb5hmT5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: DYBNBPXJNYQTTE55WY2DTSEBWLXLDX5J
X-Message-ID-Hash: DYBNBPXJNYQTTE55WY2DTSEBWLXLDX5J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYBNBPXJNYQTTE55WY2DTSEBWLXLDX5J/>
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
 sound/core/oss/io.c         |  2 +-
 sound/core/oss/pcm_oss.c    | 20 ++++++++++----------
 sound/core/oss/pcm_plugin.c | 10 +++++-----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/core/oss/io.c b/sound/core/oss/io.c
index d870b2d93135d..86d25f2e01ea6 100644
--- a/sound/core/oss/io.c
+++ b/sound/core/oss/io.c
@@ -128,7 +128,7 @@ int snd_pcm_plugin_build_io(struct snd_pcm_substream *plug,
 	if (err < 0)
 		return err;
 	plugin->access = params_access(params);
-	if (snd_pcm_plug_stream(plug) == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(snd_pcm_plug_stream(plug))) {
 		plugin->transfer = io_playback_transfer;
 		if (plugin->access == SNDRV_PCM_ACCESS_RW_INTERLEAVED)
 			plugin->client_channels = io_src_channels;
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 7386982cf40ed..aeaf9c69e791f 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -986,7 +986,7 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 					"snd_pcm_plugin_build_io failed: %i\n", err);
 				goto failure;
 			}
-			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (snd_pcm_is_playback(substream)) {
 				err = snd_pcm_plugin_append(plugin);
 			} else {
 				err = snd_pcm_plugin_insert(plugin);
@@ -1003,13 +1003,13 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 		sw_params->start_threshold = runtime->boundary;
 	}
 	if (atomic_read(&substream->mmap_count) ||
-	    substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	    snd_pcm_is_capture(substream))
 		sw_params->stop_threshold = runtime->boundary;
 	else
 		sw_params->stop_threshold = runtime->buffer_size;
 	sw_params->tstamp_mode = SNDRV_PCM_TSTAMP_NONE;
 	sw_params->period_step = 1;
-	sw_params->avail_min = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+	sw_params->avail_min = snd_pcm_is_playback(substream) ?
 		1 : runtime->period_size;
 	if (atomic_read(&substream->mmap_count) ||
 	    substream->oss.setup.nosilence) {
@@ -2017,7 +2017,7 @@ static int snd_pcm_oss_get_caps1(struct snd_pcm_substream *substream, int res)
 		return res;
 	}
 #ifdef DSP_CAP_MULTI
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		if (substream->pstr->substream_count > 1)
 			res |= DSP_CAP_MULTI;
 #endif
@@ -2201,7 +2201,7 @@ static int snd_pcm_oss_get_ptr(struct snd_pcm_oss_file *pcm_oss_file, int stream
 			return -EFAULT;
 		return 0;
 	}
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		err = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DELAY, &delay);
 		if (err == -EPIPE || err == -ESTRPIPE || (! err && delay < 0)) {
 			err = 0;
@@ -2225,12 +2225,12 @@ static int snd_pcm_oss_get_ptr(struct snd_pcm_oss_file *pcm_oss_file, int stream
 			n += runtime->boundary;
 		info.blocks = n / runtime->period_size;
 		runtime->oss.prev_hw_ptr_period = delay;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			snd_pcm_oss_simulate_fill(substream, delay);
 		info.bytes = snd_pcm_oss_bytes(substream, runtime->status->hw_ptr) & INT_MAX;
 	} else {
 		delay = snd_pcm_oss_bytes(substream, delay);
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stream)) {
 			if (substream->oss.setup.buggyptr)
 				info.blocks = (runtime->oss.buffer_bytes - delay - fixup) / runtime->oss.period_bytes;
 			else
@@ -2272,7 +2272,7 @@ static int snd_pcm_oss_get_space(struct snd_pcm_oss_file *pcm_oss_file, int stre
 	info.fragsize = runtime->oss.period_bytes;
 	info.fragstotal = runtime->periods;
 	if (runtime->oss.prepare) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stream)) {
 			info.bytes = runtime->oss.period_bytes * runtime->oss.periods;
 			info.fragments = runtime->oss.periods;
 		} else {
@@ -2280,7 +2280,7 @@ static int snd_pcm_oss_get_space(struct snd_pcm_oss_file *pcm_oss_file, int stre
 			info.fragments = 0;
 		}
 	} else {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stream)) {
 			err = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DELAY, &avail);
 			if (err == -EPIPE || err == -ESTRPIPE || (! err && avail < 0)) {
 				avail = runtime->buffer_size;
@@ -2429,7 +2429,7 @@ static int snd_pcm_oss_open_file(struct file *file,
 			continue;
 		if (! pcm->streams[idx].substream_count)
 			continue; /* no matching substream */
-		if (idx == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(idx)) {
 			if (! (f_mode & FMODE_WRITE))
 				continue;
 		} else {
diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 82e180c776ae1..47168e175c966 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -54,7 +54,7 @@ static int snd_pcm_plugin_alloc(struct snd_pcm_plugin *plugin, snd_pcm_uframes_t
 	unsigned int channel;
 	struct snd_pcm_plugin_channel *c;
 
-	if (plugin->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(plugin->stream)) {
 		format = &plugin->src_format;
 	} else {
 		format = &plugin->dst_format;
@@ -110,7 +110,7 @@ int snd_pcm_plug_alloc(struct snd_pcm_substream *plug, snd_pcm_uframes_t frames)
 	int err;
 	if (snd_BUG_ON(!snd_pcm_plug_first(plug)))
 		return -ENXIO;
-	if (snd_pcm_plug_stream(plug) == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(snd_pcm_plug_stream(plug))) {
 		struct snd_pcm_plugin *plugin = snd_pcm_plug_first(plug);
 		while (plugin->next) {
 			if (plugin->dst_frames)
@@ -174,7 +174,7 @@ int snd_pcm_plugin_build(struct snd_pcm_substream *plug,
 	plugin->dst_format = *dst_format;
 	plugin->dst_width = snd_pcm_format_physical_width(dst_format->format);
 	snd_BUG_ON(plugin->dst_width <= 0);
-	if (plugin->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(plugin->stream))
 		channels = src_format->channels;
 	else
 		channels = dst_format->channels;
@@ -567,7 +567,7 @@ snd_pcm_sframes_t snd_pcm_plug_client_channels_buf(struct snd_pcm_substream *plu
 
 	if (snd_BUG_ON(!buf))
 		return -ENXIO;
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		plugin = snd_pcm_plug_first(plug);
 		format = &plugin->src_format;
 	} else {
@@ -586,7 +586,7 @@ snd_pcm_sframes_t snd_pcm_plug_client_channels_buf(struct snd_pcm_substream *plu
 	for (channel = 0; channel < nchannels; channel++, v++) {
 		v->frames = count;
 		v->enabled = 1;
-		v->wanted = (stream == SNDRV_PCM_STREAM_CAPTURE);
+		v->wanted = snd_pcm_is_capture(stream);
 		v->area.addr = buf;
 		v->area.first = channel * width;
 		v->area.step = nchannels * width;
-- 
2.43.0

