Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF47079EA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1690C209;
	Thu, 18 May 2023 07:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1690C209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389178;
	bh=nmP/EvPfRymITFLvQPIXlSBZ2NojsgRs2MbgQKjNQe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZH1CRj5XZysEx7Dz6V3su+kUtsEBwFcWUkpnAhsmMDfzp0uuM2K3Y6Hs2EtBEALO9
	 zXuHph8sGSsrRam1ehjJFNy9So3mJL4eJ3AB0uJsQvMp6PxFqrxKsPsmHsCDIW0D9I
	 LqCKNe7q6UMh5cddf3UNgUDqv3CEMVSDs0AHV6BA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81993F805C9; Thu, 18 May 2023 07:49:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D6CF805C9;
	Thu, 18 May 2023 07:49:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50B88F805F1; Thu, 18 May 2023 07:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43DFCF805C1
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43DFCF805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Pb2AaVtG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/16sqVWQ+ru4y/9up8Yy7qv3TVPtIt7IePHSyzJAkzW/spRhKmPlL4K+dV8Hlvt+4dJO7rPzMaxH+fWRGNeOS8KF6QgeqkSXQI4f2vFGQQqfDS5RbJXPn8/Z7yu3RGlMSyGBkNkbzS/dxVlQIVvQ3ZoDD03gkh/62LdpPAXH3vdDFdUNHHZi8g6SmLyL/RTa5MdvN+6X4m2wL5T9LD2+UqOCCPR3OyUHT07AS1vdyP7hcSNuKZOOz4XKXPZidPQMifRz4T43Zx2E+8wlekh+D4rfOqtrx6bFyPhR7Hc7bGayqUd5Kt746N8kvrkQ32ZxrgYfp35tUk0nn1EnPkbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SimhG1a3s9oOuS2YbMrEitedG/dG+CSvSIEDKoLhFdQ=;
 b=dijP3TOB5o9B6nkBd8Nnp9pSmIx1kc34RaXrBs6jHinOcyihYp0A/LINPAlp+Mh+oi90m3LvvHwH8xgbFkL67FjVLdBmAsCHKerx3yWnHSymNjl57yGKIS5AnrnkIFrKiRjBhi3u8IiopfuIA1vWhjk4sj46BKrOXsmV/WeMonk/gTKVB2Q0mDgHMahipj8LrtyxASpO956jbw0zdxtD5Q3r336BR0XcDWC2hWkp2VR5xZstTWDsq3px5uOnmpm7tAlsHy+UbLi7mkoaGtDefF26iDjyDqQmJURay+5GcqkSQfafwyHF+cZimzd7scnRWljeWRADS8X28XHUYnCD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SimhG1a3s9oOuS2YbMrEitedG/dG+CSvSIEDKoLhFdQ=;
 b=Pb2AaVtGd0HYqndbnvkJH1jEMvIKVjyDWljef4IsoxKEYUEZwC6ApQrg9F75zRS1X/01sfjVn7l4Xvv8JkWcWRXn7Xd3nNx1KelpNu4RsUwMqd8dQjH5sE+pXNv9o1UBS9YCO1f4FQHrjUU6C15WGNI1t91KfKwI8DKGOIpcUkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5325.jpnprd01.prod.outlook.com (2603:1096:404:8023::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:49:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:49:38 +0000
Message-ID: <87cz2yp4st.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3?=
 =?ISO-8859-1?Q?=B6nig=22?= <u.kleine-koenig@pengutronix.de>, Jaroslav
 Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 18/20] ASoC: soc-topology.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:49:38 +0000
X-ClientProxiedBy: TYAPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: 2414b335-9be7-4972-343e-08db5763aafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HSA/YFINPdvHXe1yCJl25OT8pLxCMc0IpJIZmBBKXPMTcu7M/gU0mcOXsMvaF0oRVTBXereF+I3Zxag1k/sz77NXL/ZLfx30uMsewyrOXDZc88GWvuWK+V8FzVyK6+RH8PSZ2mM6Hph0wASIlng8jC17njs9eimw/OgxAjTK/vDr+qGeY9PZn9yWu5A41lfB2eM9zL23tUWgm1OIXa78KqvJE4BiZSw5vrxCI1DB6X3VC/UL88yBryN8SXlItaJOf+yjBSw6E9tYDbIjtV6nLX+Dw/t1w757xQM1CKhg9B48Lfp/RtzuZFLs6CQWFuVudsjsoKcn3cHX6to/lotOWiNlKxtmKfyZ6gtofWnOjJe1i55G00OwAutjpn6MyZ572qtW1WvxGncHtc6dkf+PDR+qcFzSJazaAtnuaOWiDcdvPaF9M4J0Fo7rbrHTm9kz+qDaXpKD9lxp8e7vijfqoCrDWtYX73DP0IBK5p18s3Eq172O1bddvX4guDxIrADTK6lI3SmS4HLuA0ywwByqAq7a4b0826GDkxg0fR1eMtR+pK45SjRpEKz0HiKfgJOnGZsOh56XSbyU4zjGJ23APbgUsrAeZEYC6wxe6rwax8f6ytCJmPjyjjRfDBYS7ivI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(36756003)(52116002)(6486002)(2616005)(110136005)(86362001)(83380400001)(6506007)(6512007)(478600001)(38350700002)(38100700002)(26005)(186003)(2906002)(8936002)(8676002)(41300700001)(316002)(4326008)(66556008)(66476007)(66946007)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+S06kIiUvW7/i/5W3XUxQIX9dUIRcjxmH3xTVVXdlabbBif43d0Aov8RGh9d?=
 =?us-ascii?Q?6sl8CQWdAwWmOgYKyztPoQ4jNKF6XpOcEQZp5Zra5Nf4uV6U8w5nqX5Bf589?=
 =?us-ascii?Q?VTrJqc4g47L3BLoesE+DcdMA6xicaFmJ0+fdgzQxwU/+5750wQ5WTNxliCWW?=
 =?us-ascii?Q?KhC/TC5oUfG7WVuCzhomcUuGySLBPYoLtRSRg1SHlbBvfg4xS+UAyykbRKF9?=
 =?us-ascii?Q?B+Ww4oleAZQO6ik3mmDOOqrrxBEHvLwzxrIRYxY2oTgavG6F7yYHhh5r+tuE?=
 =?us-ascii?Q?B2UJcGNp/ErZ6pr/E+U96ddnBX4SlNDrFo3fHkKcwwjHtXRiAoZgYkEieUsO?=
 =?us-ascii?Q?Bz9gWLEl06ssi8eeLecyVslbgIJj8JlNvy7iRL+BSQeiDSVpvt/qb80V9pi3?=
 =?us-ascii?Q?GPgGLiYDBY8TX0rfe8WKJwmFlL0GJ6xA+FdcAD/kF/a+4ytBTsuez8FGN2H7?=
 =?us-ascii?Q?yLTeqQDMPVeoYSjx2p3Eo07K+26gcx8sOIPS7SRv5kTUyEqCtn9Qsyg4QpEf?=
 =?us-ascii?Q?3a2ynC+3dpCBalluApuYpNdOA4YmlYuRv9O9XdtWiDTtf83+LQ7QMlLi3xZw?=
 =?us-ascii?Q?VPKLz80Lpd39JuKwNNUrQF1y0Yo1YjEqfbH63Yg8hxD/f15OAMwIVIGdNqWt?=
 =?us-ascii?Q?DnbxtNtRHNDRI357tgmlFm8damHRiRdH1YW6xz3M2AfTcRGgWT31QK+LOmC2?=
 =?us-ascii?Q?OdZk2L593Mh8qNUJtIwqbQDlCEezJMibUa0AdNfBD6/LEo6mKxSdi1jdhUo/?=
 =?us-ascii?Q?HrnoFSAkHzfSc49zll/LFR+/FIMeGIUZZVYLoOtKLKsY4DWANU7vuDw16wGT?=
 =?us-ascii?Q?1bnvrBmlVMfMk+cXfP8LRCWekNRKEhiZYqPGzf7RPkbfevBPwA/+Y00SxXGE?=
 =?us-ascii?Q?Hu8jwmm31iYHtFN/w2oLyyUV8aRn7f+bdRwcQHdtRs6hrb1cfnHH3wPKfbYp?=
 =?us-ascii?Q?Xdy6zf7VZKj1hWS6B+DeUgD9HFKiHOAXhaHZ/Av5DC0m2aYNzhSqTIM+JNDl?=
 =?us-ascii?Q?waVOpjoZDCZhnFFSATG2qGZuUJplKVzRqymtTUGuSwqW5TGoA4ArdfpvPxfn?=
 =?us-ascii?Q?ybs2/oU+PmonzmrjcJE5XgTSaRbJ1eLvcRWDAthSUwMkaSSKe7e6FekOsJBH?=
 =?us-ascii?Q?cD866fDPuPO43Hbqmm0pHqZIzOC91JZhKKJip1qpLzfjg0J0ZDKbNNNw7zVK?=
 =?us-ascii?Q?RmNb6fPtDmAAlneSD6PVqMGX9wDUNw5NAgsyiNgRQPgflQ2h9T0CssCs4Ku8?=
 =?us-ascii?Q?i+zypKLUToF4KlCkCCZFoiwzdc3MV1h+wnLbtIopXrmhtyOHSsRx4p8SPKOG?=
 =?us-ascii?Q?E5zZLKFWEAKg6e11G+kmVOTsqGGKff/LnA0pV9+AiYr1TU3GZS+VcEnBu6gJ?=
 =?us-ascii?Q?OK76H4s/t9PZAigDFbtikRMTWGJIs/fXoBkfO/ab8i4BsfahRFdXyVn7q+nu?=
 =?us-ascii?Q?XzVavScovb/0STuVucDcOcfI/0bYn+/w0xMt4Ljkj8mUtoSxBaXCytqjU38L?=
 =?us-ascii?Q?zDXPxxaV/HG2ZN2ZDDYBFz3HyVCQyYiGoFKmjA736cVaO6rj+79t91YcrlR+?=
 =?us-ascii?Q?L6u7zpM47/qg3uq5R6wcfW0vMxia0AJhMwaZF2l7gP8dyB2KAQ0H5DhuSXIK?=
 =?us-ascii?Q?YUb5I3BWij4l0eJeXPrUlfU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2414b335-9be7-4972-343e-08db5763aafb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:49:38.5902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZhbqB9BcUNBAU69vO1oRHKY7tj5Aqwl5S1CONvmgSRyca2uSlJMzUJXDw8mDaPF7UFqSF2u1VyU1iNMH2Pfm4S33IRAm+ucGd6R1th85kl10o9R8NRFF9t+JmC5+DIad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5325
Message-ID-Hash: FJXWY53A7YV5QHGI2DEQARYUO5WLBNPK
X-Message-ID-Hash: FJXWY53A7YV5QHGI2DEQARYUO5WLBNPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJXWY53A7YV5QHGI2DEQARYUO5WLBNPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 2cd3540cec04..703a366e0abe 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -94,8 +94,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 47ab5cf99497..16a3d570463a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1735,8 +1735,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only = !le32_to_cpu(pcm->capture);
+	link->capture_only  = !le32_to_cpu(pcm->playback);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.25.1

