Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FF6AB463
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 02:46:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A81E1026;
	Mon,  6 Mar 2023 02:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A81E1026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678067162;
	bh=wGFVGp9envqBjTUftPXS8PQeMrPOhWcnivf3FHZv8II=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ff3nojF1epc/S8KHDvUGb6l1kWkEUlEKV4sojRLdj+NpNp36g9eHmM4oWOAJUP6Ws
	 YKLwCCCfjioKT/IaqofFmCP3J9r8qk27+LC61sPjprWWGAE8OflYST9f84qr1oOzkg
	 W7/9LFbGNcjyDCsHpGDRToLcGVUrywRq+T1G3s8g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B967FF804B1;
	Mon,  6 Mar 2023 02:44:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC345F8042F; Mon,  6 Mar 2023 02:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E5A7F8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 02:44:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5A7F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mH04TgZ7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAzkZnsQtkR38X+0L0C2vKMAbunFioQSH4c4SOXPTAmk7enJOjniGcTQJ9QdlTvO1/YsmWcvzs+5OYYiBlKxe8DXCkclCfc4znNft5A3IxAvoLIef0YSwKRWTHlGCuPVPNSgV9JVHW/wn+B0pYwtbE11dyQJugpzgDamOAtSxV6C+Pns6x7TpDKjT+b0Z+sNuKP7/riaYZS/rip+nzIyzZHGrfQhbStR9P2iIQD8I3SFGNAYqWuTChtRsw0kBctTychWUz4pwj2gSbm01b6FgHuWAuab0bvgPg08rVN8VG7X9ji/iIl41pYfi2UdAFMEG+IkufFWPbtxzGti9iTx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iOypYxXdEO3S2hqxDGFpqRsDCau9R6yLZ6wo4HKPfY=;
 b=DmbJE3aDPG5Vugivar8LZI6Lq3YLRlXD6txo3nX96+3VmQ09nn7cMDjtclS0tQm5YBK28/hVEKnYy+FYJVCVC0/uztb4shdGiX0mvgrIVHpaqeCzKxM3ey5RHY5lscGpAxdvCpVNKLKrhJfNfBsRsPZy18ZfcqADMkz/uHvIzHJSpSfmKtWyUHk+mkAaR9zsCM8dAItVFm9OmrW1F9yi9X3SCMrr7OUXcCCI/DQTbP0xHI4s5cfwt7wFiatK7Pk32sJVtv83fphdpkhlXaEuuHE/iVGc19wpI/APjQon99pdx+V5B6/E5HwpaqTfdRkcvN0GMOBiIzofm1tBQrBlqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iOypYxXdEO3S2hqxDGFpqRsDCau9R6yLZ6wo4HKPfY=;
 b=mH04TgZ7Xxb3mOSDTIuxSSbqJGFrXE1jaEoUbJsDxW2u8HlbHRArerqJgebhqIv8W9kNF8uwfnllcySar/9O/HuvN6l/1xztFlBc5UNtDXoKQGSsG/1MwnwHZNjt6RTCI65sjdv5m+4WD8mzOxCfdNfNmeOUX/YXyqvzRMoPYY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8747.jpnprd01.prod.outlook.com (2603:1096:604:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 01:43:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 01:43:55 +0000
Message-ID: <87v8je64dh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm.c: remove indirect runtime copy
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Mar 2023 01:43:54 +0000
X-ClientProxiedBy: TYCP286CA0239.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: a2294480-db19-4358-2bd2-08db1de43ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IjSg4VFunrUx62LsIxQQriqkIrcJVHn1boMoFyGBN3cGuWKso1tyd+bAlfm7orfG4GYtKSWTj4niPb+ythUROK3h2U4CazGBZLdAPti2kO+hthz/4szi55NgK+2V3mUJ/OigUMp5BxMQhmAK4VvG/Jc7yYg67O2VqjMsZabXGxIEcvGtjMJqW0oWA3YZTodqZhAJ03PdrIOWeTYVbBqZQJC3TK9wr6UNqDp/tmHHgaueoBqE9W/oaRvzH5InxmsnSvxrzGGW7BK3XeWmhGfkHY6QeXirk4dUIypAuMTT+zTyHko05rEUQxSSBylYjPtK6Ejpos4gUmGZM2wUz7GN8K184ItLUdj6g956+i9EayAkWI9y5dndYyb81UrPIbh9ac1i6xHHksnaK9Sv1lg/F0p9wfV3WfwYt6J0ZmzNoVxwvAV1KuNyC7+jy1XMZzyNiPO+JSNZgD3gjf2XP9cNvjoYK4pRg3a/9KWPVD/nMoheXS3t82hDUXiNmO1BL7pKSeR4Gq/a5NgjlgPLliitWtjkID3A4yvPSs1bO+/gSJkvk4Qzj7gR2twuQvHxS5pjRKEQ59qAh/1a2Q4BVNhqRUsPguvh4O+kqforlau20QBGz9MB5hgUH8fgs14pToxojFD/HNxHINCWYz/dhzTZ4nwz9mAL1SOiZQY+ayeMWFjaWoKyCRUO5B31Hvl5i7IQZuhQRRbsBXvqyJoWzjOwfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199018)(186003)(38350700002)(38100700002)(8936002)(66556008)(4326008)(6916009)(8676002)(66946007)(41300700001)(66476007)(2906002)(5660300002)(52116002)(478600001)(2616005)(6512007)(6506007)(26005)(6486002)(316002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J/45ltS6ILLBJYyEpku3DOpNrMR5CNYpZ2+fnadPy+xsJjfDS06tPLfmRiLe?=
 =?us-ascii?Q?YfEM1v5fNdICwk1eeHMCkK4QZ0JCMAsJQ/zVgyRZHvys69JUT+Ap+zhjmtk5?=
 =?us-ascii?Q?hH4MQcFqL5Jcdn9VoiuqJyzkZBULQUs2cDt/H8/ALrE2swXM/MCh+GPva8GS?=
 =?us-ascii?Q?UHelgZKc6Es4p5xmRq7eFCnWYSekOBkMWHuEJg637XFurtci5P4o5ZLEWd6H?=
 =?us-ascii?Q?3mefOCDI0+XlpVGrVCILFhxWoIrn7JLorBEIcAbg5is415DpRAviB9JeOO/C?=
 =?us-ascii?Q?mTyx/zjcS3Yr1sZ3qlAvGKk8yc0w/pP9CxR0LmYenWLrfDbV+0f/FEWdWtKJ?=
 =?us-ascii?Q?T2DsmfZPn7nA8T+Phlu3W86GCY/1IW7wFQKCtHovSb/XtKDkw20tUFfLMEpL?=
 =?us-ascii?Q?0ePop4n6pK9AKoR+OvR2m5hgnL9leGywCuOZBPHybTSGHj81994eAYQVWpTL?=
 =?us-ascii?Q?RewPz6D1/T5gnVMFgUdHVh4vzoAT9m+pNK0VICG0VZxqjf9Toz7OFB4jnxkX?=
 =?us-ascii?Q?SayDXCm7sr7sO5l4rt5EZ9Eox5C6uim3k3sN5cRkXyKSD+5gk9skEVNaKnKO?=
 =?us-ascii?Q?scVPYRxpAbLfMAwRhwwcyDQddse85qGey7h53b7oQgkUKw5HymxgOT9R9vOf?=
 =?us-ascii?Q?VgZHaoKQ628x7w1DLeTzijMBx/j07HUJYx4fmasBNDdPelpSH1voqmyYKH2j?=
 =?us-ascii?Q?lUnV0ZVdwkPE3qPP9GzA5m5ksiIHOBXQm1kYWUXTeNEytd9cSJt0p9cFx7Cq?=
 =?us-ascii?Q?8VJ0V1u6KHmMbdig67HeUB7aKpRc6Ajga6O3VPl8f82+vbTaX5xpCJHDG8SK?=
 =?us-ascii?Q?N2rxr8MOQZc345rHup72sf9lMF/KZIOecyJgCc+BxJjRo5Jtl69So3zZjJOU?=
 =?us-ascii?Q?yA993CtlzZjfEXlV9vv8GvC+t4oSz0dfkJcfwa9wAQp9/6kCANrQO/ZWmlXt?=
 =?us-ascii?Q?fp5FBtexPW3uyctzLlzVcnuEfe2Xn42MkgNT6f4bbmTCZhwj6i2chMF/Y6kp?=
 =?us-ascii?Q?lhXBNhQKYRHcNOeb1sYvfFMPKrd+0jHtRMNMORtxTkL+fMB4PA1V5EJ8JRPs?=
 =?us-ascii?Q?vKbNyyV2YX+wChAxypQ9+iH9XyX2OS6jzt17rmKZTAF8LgM2yxq4x/2Zb/ad?=
 =?us-ascii?Q?J0v8EaAVR0V9U+dAXRWMhsf456zMikVYo/5+K0O1ls/j8v4qzn/szAhMEGaI?=
 =?us-ascii?Q?9Rqet9y/hVdKiG6HTulvOBnhkAF4FBv4DOxb18RMXQyk+G+iisoq02TzavwL?=
 =?us-ascii?Q?LGFHphCoOSTPpS/1uiHIEoG9hcxZCE1eiaAtHWu5cTqseO1A5+SUKqwHzxEK?=
 =?us-ascii?Q?0RcxRUnA+02t7HV/O82y3M+921oRMRYdqC+ieHRGqSUsTG1MXqJPW8CnV1bs?=
 =?us-ascii?Q?QNWCo0dcdgC6FIvVOPycUIKz836QKdWs05qX6ABid47vtXvi8jRWUB1sgO/O?=
 =?us-ascii?Q?jOluAq3jkLYpZdkLG2bxRtWCheWkta4sYZ9ZbHqihkHEsap+iZ9P1dYOuHO1?=
 =?us-ascii?Q?pdr969ESeiN5DGW2K9+Z8NEk2t47AKBDvJvwBbfYvPEluox5cI2ohtNx/xyi?=
 =?us-ascii?Q?mqIo0hqzll1I6ixuwwMMqxesb878bCjEsvcoojdCynbGPe4bu+OO2k2KYG1Q?=
 =?us-ascii?Q?72kt+uBT9uXEPFPXNugXcD4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2294480-db19-4358-2bd2-08db1de43ef1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 01:43:54.9736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 psMKKgw4gfGINk3vXx9RTadiZsJfvaKq7J9L8gVuOq7faoXDj5gNdDRrCHbfeF9LIvi7oehgCyXy6bx9xaKoOROkp8LEJnZdiYgtCBsPnspa4yjKcLCXDOMmLMJNY28H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8747
Message-ID-Hash: 66BMLE3CEG466FAYF66UH2URMZIVI7KK
X-Message-ID-Hash: 66BMLE3CEG466FAYF66UH2URMZIVI7KK
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66BMLE3CEG466FAYF66UH2URMZIVI7KK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

substream->runtime will be attached when substream was opened
at snd_pcm_attach_substream(). When it uses DPCM,
FE substream->runtime is attached, but BE substream->runtime is not.
Thus, we are copying FE substream->runtime to BE.

But, we are copyig FE substream->runtime to FE dpcm->runtime first (A),
and copy it to BE dpcm->runtime (B), and copy it to
BE substream->runtime (C).

	static int dpcm_fe_dai_open(...) {
		...
(A)		fe->dpcm[stream].runtime = fe_substream->runtime;
		...
	}

	static int dpcm_be_connect(...) {
		...
(B)		be->dpcm[stream].runtime = fe->dpcm[stream].runtime;
		...
	}

	int dpcm_be_dai_startup(...) {
		...
(C)		be_substream->runtime = be->dpcm[stream].runtime;
		...
	}

It is too roundabout and troublesome.
OTOH, it is directly copying fe_substream->runtime at dpcm_be_reparent()
without using be->dpcm[stream].runtime.

	static void dpcm_be_reparent(...)
	{
		...
		for_each_dpcm_fe(be, stream, dpcm) {
			...
=>			be_substream->runtime = fe_substream->runtime;
			break;
		}
	}

This patch removes indirect copying.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h |  1 -
 sound/soc/soc-compress.c |  7 -------
 sound/soc/soc-pcm.c      | 10 ++++------
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 1e7d09556fe3..4d6ac7699833 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -91,7 +91,6 @@ struct snd_soc_dpcm_runtime {
 	struct list_head fe_clients;
 
 	int users;
-	struct snd_pcm_runtime *runtime;
 	struct snd_pcm_hw_params hw_params;
 
 	/* state and update */
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e7aa6f360cab..554c329ec87f 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -134,8 +134,6 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
-	struct snd_pcm_substream *fe_substream =
-		 fe->pcm->streams[cstream->direction].substream;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
 	struct snd_soc_dpcm *dpcm;
 	struct snd_soc_dapm_widget_list *list;
@@ -143,7 +141,6 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	int ret;
 
 	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
-	fe->dpcm[stream].runtime = fe_substream->runtime;
 
 	ret = dpcm_path_get(fe, stream, &list);
 	if (ret < 0)
@@ -153,7 +150,6 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 
 	/* calculate valid and active FE <-> BE dpcms */
 	dpcm_process_paths(fe, stream, &list, 1);
-	fe->dpcm[stream].runtime = fe_substream->runtime;
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
@@ -164,7 +160,6 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 			dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
 
 		dpcm_be_disconnect(fe, stream);
-		fe->dpcm[stream].runtime = NULL;
 		goto out;
 	}
 
@@ -236,8 +231,6 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	mutex_unlock(&fe->card->pcm_mutex);
 
-	fe->dpcm[stream].runtime = NULL;
-
 	snd_soc_link_compr_shutdown(cstream, 0);
 
 	snd_soc_compr_components_free(cstream, 0);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 41a111586ac3..f6b5f72df65e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1230,7 +1230,6 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 
 	dpcm->be = be;
 	dpcm->fe = fe;
-	be->dpcm[stream].runtime = fe->dpcm[stream].runtime;
 	dpcm->state = SND_SOC_DPCM_LINK_STATE_NEW;
 	snd_soc_dpcm_stream_lock_irq(fe, stream);
 	list_add(&dpcm->list_be, &fe->dpcm[stream].be_clients);
@@ -1465,10 +1464,11 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dapm_widget_list *list = *list_;
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dapm_widget *widget;
+	struct snd_pcm_substream *fe_substream = snd_soc_dpcm_get_substream(fe, stream);
 	int i, new = 0, err;
 
 	/* don't connect if FE is not running */
-	if (!fe->dpcm[stream].runtime && !fe->fe_compr)
+	if (!fe_substream->runtime && !fe->fe_compr)
 		return new;
 
 	/* Create any new FE <--> BE connections */
@@ -1590,6 +1590,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 {
+	struct snd_pcm_substream *fe_substream = snd_soc_dpcm_get_substream(fe, stream);
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dpcm *dpcm;
 	int err, count = 0;
@@ -1629,7 +1630,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		dev_dbg(be->dev, "ASoC: open %s BE %s\n",
 			stream ? "capture" : "playback", be->dai_link->name);
 
-		be_substream->runtime = be->dpcm[stream].runtime;
+		be_substream->runtime = fe_substream->runtime;
 		err = __soc_pcm_open(be, be_substream);
 		if (err < 0) {
 			be->dpcm[stream].users--;
@@ -2693,8 +2694,6 @@ static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 		dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
 
 	dpcm_be_disconnect(fe, stream);
-
-	fe->dpcm[stream].runtime = NULL;
 }
 
 static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
@@ -2719,7 +2718,6 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 	int stream = fe_substream->stream;
 
 	snd_soc_dpcm_mutex_lock(fe);
-	fe->dpcm[stream].runtime = fe_substream->runtime;
 
 	ret = dpcm_path_get(fe, stream, &list);
 	if (ret < 0)
-- 
2.25.1

