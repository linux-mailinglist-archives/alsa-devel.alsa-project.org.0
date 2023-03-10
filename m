Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08C6B367B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 07:18:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81870177E;
	Fri, 10 Mar 2023 07:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81870177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678429112;
	bh=wGFVGp9envqBjTUftPXS8PQeMrPOhWcnivf3FHZv8II=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LpGeOXyASkvdE73/ibsZjhJBzeDSz5H1l8f49ioO1DZV7ZGWdsK0RWlCf0Xx0aNQS
	 suYVdTrSAYcuVBrQNPoMXf3K3Um72un+a9NXaKc/uIDXoIQyIdo7a9vedXvPRlBcnI
	 QjQqriV041Ky8rhckimMlgbhZwxz2pHG5CGfqMyA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C888F80236;
	Fri, 10 Mar 2023 07:17:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC806F8042F; Fri, 10 Mar 2023 07:17:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18D78F80236
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 07:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D78F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DQePTa3w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIsNvvg7y4hMVAwJtGxyF+JX7C+9mFBP3oGBQE41yXa1leuPnGIznT68vwMdLdA+25KBmiPC7uNC1scrCd+5y1kXlcV9UomaO7TcMZW/RHtiqXmtyHgD4akWlxvxx6HpvalcCjPIVMnNOv7BWy83pmwvQDRLWRUCjzluKNVPtV+RAvgJW3aNtisEbmo9Eg23S5Zr9xSnNq8X3vS4MKoJKAnNCojOweIaoesggmkykgNpaWbb2eprTx/41JV42akSbKYrQWFvHg576/4Ji8QBmzv1JGR68TIqXQ7lDqbYg5Hig1DqtCz/sN3kEO/EVL5XXi4N3fLTDEOu2k8upm2dUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iOypYxXdEO3S2hqxDGFpqRsDCau9R6yLZ6wo4HKPfY=;
 b=iW/O22sAu/wQNuoOd5QsJrjk9OGTRRaKo+HuqZQ19hIMQVN2D/3moY6nSJLe2X/epI4Xv8kPRTcKj2/kS2FF2SChM5JSBNca/TfdAf9GUDzmm7rCQoxlIbZPx/oVg5KevGoYA77Qlb8Hnkvmc0TYRYqZb+yoaTY28h/nWO6ISOEu2yd2uYqtScyvGPCiK2QkKz2q6tDmr/tT9FQLuy7VRuT0KQpEM9/5c98Zxti+PfTq+X33J0hUyvOjaEn3qh1ZxUPaYwWpHk18NY4ciPYFO6icFCjDBDwA9DLSycMzgbnZN2lKVdd99dYvOrz/RahG56GidHEYuydVZIzM+W+3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iOypYxXdEO3S2hqxDGFpqRsDCau9R6yLZ6wo4HKPfY=;
 b=DQePTa3wlG+dESgHjiGXnTCuFL8/YmNAmxN4DiH3njKbn02aHW/G4zcZuqzg02Y5R4mWA22+LF8GhBhOeBgnboVXLlKsnpu0rMWwBEgbAEL/vj51pwMz4hy3cGV1c7qv6vZlEVzHxleIJwK31piTAavs4uRPRO7ir87YlYTio3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8251.jpnprd01.prod.outlook.com (2603:1096:400:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:16:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:16:30 +0000
Message-ID: <87a60l2ksi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] ASoC: soc-pcm.c: remove indirect runtime copy
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Mar 2023 06:16:30 +0000
X-ClientProxiedBy: TYAPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:404::35)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 42af691e-4d5a-4239-54b3-08db212efd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a5tjiYXd9nWaWhnDPG1Fy7CG7jIikRMUPWKn9DHweVji7D0L/5zcISpkgP36CLySMtO3JbYS7dioEjUB6pK5zAAuCVCO+qsrfKCbUGOVHhxbxSR0dsw++GY5/O6A0KokQZa1eFJAGdxRmzioGee1cuKhLOGhNmjzuWYwzy4YSbzJtIQoeb5fWpwDgtM5n60btuzg57oEIz7WD8DuvxBAZ12bzRSEIW6aV/Rr1sa/jI9nklMTPw/dCfX2/tANjjZFV3Lfsuj61T4QobmArQDKgiEHe4ejvhXqnI+dVvXfnHzIaytCxgSGSpajFDlWevEpE41+sI9Ch/RWKJffNVRHUAPuut9NWhHYkM2i/fQBzOflQ4U/3e3LHU18bMWYVfKbJ65s/sF0wlloE1x+fGVgrVqj/WfEpBHx4ZAIGN+vbj3AzqNAV4j53mC54oUNssyjMP3HmlCFURf1lElVe0cKwPGI7pU5zBSpIPw93CA5o8cQxXyzUJ4yAMn6NSf8Scfmhmfmf1e+vES+4rSIz4DixVxQ5Scg459Il62SFwiAD2OW1YI7uTmYDzObQTDU59hltMXY0Ys7DY+nPK6ajbx/KOEk2+9jlvccuO1jOZXkKtiT8Q3XJSsrGBHLVkmBmIqEcfsxkzjtmNGOyZ4HTYEAbQfhVFHKyF9IEigixskVzC4tYQFf3CUcECLfq4tposE3oWCZojZ+q7KucBAHQCOwGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(8676002)(6916009)(66556008)(66946007)(4326008)(41300700001)(66476007)(316002)(5660300002)(52116002)(2906002)(6506007)(6512007)(6486002)(2616005)(186003)(26005)(8936002)(86362001)(36756003)(83380400001)(478600001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tXnKGKKK248Usv6rydBtZuRA8CojLtjrVE5C/jReR5HRnwYWeNwKN/hvDZqy?=
 =?us-ascii?Q?7idj5XXwlHRc5HkbkZpb69fFvfdoG++jMkJ5csIWxrrVPd2UbNpT162ezitN?=
 =?us-ascii?Q?1xo9+JHOV25E7VyoM1FT7fC+zDKJekQrh2cpnhRU4cZ6sZda9Kz+yES0lRiQ?=
 =?us-ascii?Q?vi30CqBAMB90IhTnDGvY7YqDqO21myQHnhSXrxcM2DLzSUSBrE4lvP0eHztS?=
 =?us-ascii?Q?zCe8NSBka4HUWA1zQ0z4+mTIwhv6ZjDm54aBZRKOiry9DZwLgcWpFM80WVDu?=
 =?us-ascii?Q?ERWXuKaUJ1VH4GGxzLqpcef7fmvQ449G83M+tIcrqV77J/ITFQJPQB6LHFcz?=
 =?us-ascii?Q?fRnUeCj3lSerLa40MK66k3ZjZJEVwAYrwJ0rXCYWyRMnEJbD76X0J3C7cwpN?=
 =?us-ascii?Q?B9/sC/R1LYzGKE7BefM8yj2N3Zaqg+2kQ5k4dzXjihvW+b+DDjOpEz0acUho?=
 =?us-ascii?Q?iCIaB9k/Ibcnz3LNvBhe7ns/MGo+zlKlrWIh/7egLU5JXcQrO5e6NkC2CSQy?=
 =?us-ascii?Q?VUIBPyiNuP/fqh+nip0pvyleOwSZpnN9XiUMdT13YKtzchALQbt2p9HduBh5?=
 =?us-ascii?Q?9Z/Pl3nsS8cJHOPscUIY+9ZrG/8KdxprMpa0aQ/4aBoShnUTZ4pO0bB8C6r6?=
 =?us-ascii?Q?BmuQ4RblMFbHsl3lFSY0hDYVpSUfJE0TM77cecylxhSsd9EIOm0K87OsKMlS?=
 =?us-ascii?Q?G+DOa4ipA8RsfIG8XhPY/zxkg/yuJznSJ1jptZVbJBFi5taIK7KWAxjlN1qu?=
 =?us-ascii?Q?zAkddAdEFxEOQRsL903paZzAr0JC4N8fNo7DCFQHANpvZlciObHrcRgFkY5T?=
 =?us-ascii?Q?R1GGcQwr678iMA3wCrRVB3y/63zEXj9qGErIajtmOnahlHsaXuNQ45zVrTKU?=
 =?us-ascii?Q?x1lh7PEdZtk7xphK31f4AStMvyjqeMLJCuvDvaF50J5UUyKfnzOnwQEAk0Sj?=
 =?us-ascii?Q?l+0RSXUcilPBu6pE9RSZfhFAwf75RwP/RJzaGa3Ni8qy+utHL7EizL/Cztu2?=
 =?us-ascii?Q?HXwRpwcw+Bfxb7ZdAkI2PBfgJ95oAiQsxuLTYH4MPQ+j93vX5Jn8DUWZg1Wj?=
 =?us-ascii?Q?ggZYIIP8H3dKRRwxczP1O8DFEFSs8Z+YLlxOkP0NrlRJcf7akX92Qj4WmSSy?=
 =?us-ascii?Q?e3FHWDg/Cs6NOt7TRbe9ZN05LqL+bIXMTq9Nqv8P2+MRaaMFH93C6UeHATw9?=
 =?us-ascii?Q?sBLMrAmu0N03HTluJbxqW7T9FsxTR+N4rzxNAVOj/h7q8MHv2Dcm0jrsZEBe?=
 =?us-ascii?Q?KVEcSX/LJBQeDbolW8OmFcWUbVxbIuQn67hDHGOv5SGGcE0T+iDLYjPZdzm8?=
 =?us-ascii?Q?h8LBGmAWdCjE5n71XA7gR/tmDnrSocKgYRUOjp29ccQemGUy3D7XGX6CfjMx?=
 =?us-ascii?Q?dmugRWGR8++9LNNHch/ICxM0EF3HZi5L4fABuXrEtZbcQy/uu5TPhLQ7d9hF?=
 =?us-ascii?Q?5ubS/jUuv8vL94m0ryJHVL8IGLGOEdrkOrbrbLw6ffFfB5dtGdWg6fOD9h5V?=
 =?us-ascii?Q?w4ksG8lda3jClDa2HQgeeA4vi2v3gS3HzmNV6ZO2pnYSn6FE7qnr9nB8fcEA?=
 =?us-ascii?Q?zPy7+yJ2aCvak0iH0XjUrKJAWt4QztcsHzXz6dmDIdUSGUErznYqNMZc58s4?=
 =?us-ascii?Q?a1EPtAVY4H51YN1DH9Vw+2Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42af691e-4d5a-4239-54b3-08db212efd20
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 06:16:30.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bc8aAi6fBR/chMTIo/NlbgilXin0HiJmFMEmILlCURM9j6Pq4zjlulfPCo737DTUeknDyU59KrokBavgOUSdv8xLhE9N2a7hhWBVHeDQvSfwaNtkyo8e8N/8zu0/QJI8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8251
Message-ID-Hash: ZKTE3X6TNRFPVJ5ECN43PAHAI7CGOSRF
X-Message-ID-Hash: ZKTE3X6TNRFPVJ5ECN43PAHAI7CGOSRF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKTE3X6TNRFPVJ5ECN43PAHAI7CGOSRF/>
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

