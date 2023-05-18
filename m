Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B04667079D0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31066C1;
	Thu, 18 May 2023 07:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31066C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388982;
	bh=aZhVSlW5vaNhTdjxgE1cYRsocL5Zegvk+2FGM26OhnY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XcyjrSG8u9UBBSW5Zu3Z7+mLq2shijXTjyG6dZO7el4WkCUR1GSvuW4afvJq7qtSa
	 KrywWTNZO2ml5h7TxWVzHQ9LEU67b4YgLtZMMxoywP3zwfaIJVxAmTN8/0F9VzckZH
	 +2M4o++FwNuiuxmFutfNQFraqviRFanxwRr27OwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A230DF805C4; Thu, 18 May 2023 07:47:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB2DF805BB;
	Thu, 18 May 2023 07:47:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38260F805BD; Thu, 18 May 2023 07:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1844CF805BA
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1844CF805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=odBJpZ7e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSo5V3DgTgAZaFWoN/MaMwjh92xAfCar4Fi9NsXtpNJZS6PNolLLrJX3E7DHhKjjCUrJUsJ3dR/P/puhRMmW+KDMjeY+MbX2pBFy6BAOjIYf0WgWi5NupAEFmgCsLIC82XRYVhqMD6++1p+WYRRcXRWBusXDdJdoy4s0eISHvwtKkJc2Iv6IE9Do/zZti6HxXYddEPZP0NQpJZdkdiorvIfBhi6qDfK4tbbkcp1LklMglBz+F3qFsXNzTU+1cUh7RNRiEXcrlOy2/lfWkaZbLBpNnorHwNqfEA1D5PjU0jeksgJZ1IrqqlUwNgvbP10QviRoSbOuodxxbsCjAMQLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGCJaxWIPC4J/R+zspNaOJMCWQcOhLH4B7EMXHV3pgY=;
 b=L2qrW+J325c2H1pT5NOwcEoPxTnQMqZfSLcDx2J2Eoyf85rCeRJbl5yufQ1IC5oa0gUPKzUiEhGrqoiyDHoszIP+MCpIRz0tQuIqfMcTUZPW5ENnorqbfeYPO+dhChHKMjcW7G7b/xM+bsXVHR0h1R8bBY9hl7dyaXyJiyeLPcQJjmpgzcfO29ebTeuYarii+cPj1SOq9CodZnxXj5XQrsH/MwOtV/WehAmwLncjmbSrnj5XA/U5YTGAAvsM2XtQQ91zQYZdiPcMoClDtZikkMpTPZd+7mkPCtxrdABaemGj6em/hg74Tw4SkSNMhqPMZkmfN2SdgASdKyW1wwAv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGCJaxWIPC4J/R+zspNaOJMCWQcOhLH4B7EMXHV3pgY=;
 b=odBJpZ7eLq2sqIuvnpA9bqCLHINTvrnQphN5b+YzSsAbFoTq4ceEvJy0CxLrl91myeYj/sJ7x0OnqJBkyXtLzMsCZgRFSo4reQTVLSxLFAL25OvRsUSNEleR5MAPOvxn1cP0Afl6e7qba9nBiDJBqOrHqXFj5N1O1OH2y3tkdWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:47:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:47:18 +0000
Message-ID: <87ttwap4wq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/20] ASoC: soc-pcm.c: cleanup normal connection loop at
 soc_get_playback_capture() part1
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:47:18 +0000
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae4901d-a1e4-44a1-81e4-08db5763575a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3L6p+ybiM46AgtGMsS/yV066p06qIHnJHfkfigpDTVJt+ALeNr0NuLnGCFKxcL/6f0eouvCh06euuqnHj3XUxrdaipUCKkafddxmzk2GOWXNo06N/WL8nByq76lBjDjk7Z5bD66cgZiqR1pqtnsbZ1L2WcGgZn+WETEqKZcfqYlSDRhhtKYy0pKhzwaZVp1Vi/RZU6jBl8FZ5jaEhxzXfl5YRrIsDTbtsREaX1RatgWYV3EYI+wMn+ZEvDyMSHwOgAlyxjyHg2DwDgF5Zzg6jX+45CC8UNOaEJlYy/bSuOhIqE47i8RSkbb3IrrK1jL8dPB6E8QrUSTBeuD/QUSgiw+WtRTkrw1hxsz7mpPiHNlrUw1Gbw6oL43jplEr0CT36dF7yx8EEi4QSAKPJQ+g3gWpxbEj4Z8GRr78KpbCZdQRb8RIQu6KO2bP+0LzM6J8wL18Ov1ndvddaOy1RGCnlk5Vesgv9hQ6HfB3Au62Y9A0ZEMnKvZ0DBOSqEzD1Q+UzNvuh4GRBfSE8PzvAD0VOcmOfCe+m0rNhSD417zZE+NH/paNVBKV9FQUg9IlYAap4eqmLU6CPJJL78R41B5ni1xqeNra7mTI434LVnxOwvlCogpeOVmKbkN7WZR3RHtf9JmvPh7wZ8Krq5I8SmdujQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DdcjWwOGt7ztAXsTF1gIfaUfQuc6poGrsKgvdxY37NQYcvAz+ft1fkn5kKBY?=
 =?us-ascii?Q?tDwitE0/eb6x6iN0hkF1s2kEs26vhcrEctGLuPL8PFNzh6flUdqLcMcWIiob?=
 =?us-ascii?Q?S7v5oSbeTpkJOeWK5QIkw1h3fk1RAjYbzrghuS/qfOVnBcEkxeV0UvvXfr+3?=
 =?us-ascii?Q?YIv2talqgjFDk2GJi/Ww2SAALoh5BK9ZF72UcQuUZYSael9hqVoMdK4VCig1?=
 =?us-ascii?Q?qZisl7fbmvc+FBMlS/R2yBlU3b/M+KwJ/0WwFp9XAyS7cZ6kT86BXeCVr+Gv?=
 =?us-ascii?Q?8uT6aHZn00MND2xrcXwJob3VxJ/y1KIOW7O7TyzeVuYdfKpIkBAgokVJ+yLD?=
 =?us-ascii?Q?7NFhwH2X7CyECcZBkwIayqvsRjRdPQfKQ5SIgciDXQc2FbbpIxyzDAVwsymG?=
 =?us-ascii?Q?1mY40pybB7r67xgkjXTja01VhjvBa6tvWMupZmNYxBICmMVvXiXY3s9h3XiW?=
 =?us-ascii?Q?JUqzjjgZrui4y0AFSnBMdIR5OdV1SBVr4mGjxLdd1wSrZTiGTNfCnYQQXTg2?=
 =?us-ascii?Q?a7VSBqkLCLwESztJB7jNTzPg4WOe0bb4uBZ3GBRUMzjjmzYVH6Ek+l489Fdu?=
 =?us-ascii?Q?8PDC3WufE5MC0y3oZO7HhyBu364cDmtEqrhKWI8hSedwEJ8YUVehrhgh1szs?=
 =?us-ascii?Q?m7UmmcpyXdnDWpKQjZhImETVaJklineDZTcLuFp4KQOlKrgJ2yoMj32HHIbn?=
 =?us-ascii?Q?33NbD03bgCzYc4WmMvoduhuhpewB14nctWcbAMfc9TizQ3TqAFzDxB58ra43?=
 =?us-ascii?Q?Kf2IBMflmd/sdv4SAh1dlgR7NS+swqoh9tshU7dAO/F6kSZxZ+xE/Y9fvvvR?=
 =?us-ascii?Q?QdaVrMQBBsLHnew9gsqtRYBP7ShvgwGzlL/hZZlrOhjLXqI/NaJ4N6iGl5Fd?=
 =?us-ascii?Q?8azQSGeg2kXM7taufuHTde6ZDWzf2PO51EerHe5iiBieltr5JJpE2VKhFY1S?=
 =?us-ascii?Q?Sqr+IbIoSlHeW4DtQh9khyGz7jCfUd7LKvwZGteEXmz5rCI9v+cBpzgKnKGh?=
 =?us-ascii?Q?mIH0wGnrzhHGnmoBgxCPqMbeDglAjPhTT8Z4LBfXwVmr06hG2wkVXIBg78ub?=
 =?us-ascii?Q?T0lxqxc+g9SfhtVyFbZOIK/+kTmbLwwYYHdlqE3nhUqPPJXTlXhMMPXveNBI?=
 =?us-ascii?Q?D3jn4CEzw6SvyRoxWaFebFWwL1C+5t5j4zhhxXPN9eX1N1jpw2B57I4y2ZOa?=
 =?us-ascii?Q?e866oOn2L+4qrhZae0bl9v2dHo0Z7nYA1+4QCX3NKFTA6pEAjVx6+6OkNigy?=
 =?us-ascii?Q?zlG3oi9dJeuMex9j9WAzfyVprxtmrmvKwNggWnkkS0ESb5c+LugMumEO84zp?=
 =?us-ascii?Q?LHihSbZ2mYHnq1NMWQUlFt/7gPxfkX93OKJQn4jpgSPKVpjoVNnfXEaAiqH0?=
 =?us-ascii?Q?fpjb8HpmwudjFaMnXBtvG1RqSPY/VqDLYprpSYdPbhxYH3bL3NUECypb3CPY?=
 =?us-ascii?Q?yppgCI2Z/JgudlN0gzILXk6ks2qGFsr7pciPpxV+L1tdz+QIOteS53ryCPl3?=
 =?us-ascii?Q?CiOpJZlnIB563p8p07OqR4vspd7K4LXHW13vwNHeLivwyghi2vNWJKgw0yNJ?=
 =?us-ascii?Q?fRL6a1aN6+Xf6Je83WHXeu30JsTWkRHocisrsq3JQuHXoBuJ0OLxDPEiGgL/?=
 =?us-ascii?Q?XUdpIx3mDjI7Ipg9Cxq+bvk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ae4901d-a1e4-44a1-81e4-08db5763575a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:47:18.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 47dgldjIZBqMl2Fb3Cy5Ku6JEkrF6UeQI9qvE52g62X1aa1Uuu6Z8pMvCuohSo9ZpAIVaTymg0KIGKfJ+9nDCXBsP05YK1XXcmSrjNyzHP5ArmznHMskXkISz5jAqd9Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: BNYUO3BDMU4J6B2D2PEDZE6QER4VJAWB
X-Message-ID-Hash: BNYUO3BDMU4J6B2D2PEDZE6QER4VJAWB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNYUO3BDMU4J6B2D2PEDZE6QER4VJAWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) is handling both DPCM (X) / Normal (Y)
connection.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
(X)			...
 v
 ^		} else {
 |			...
 |(@)			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |				if (dai_link->num_cpus == 1) {
 |(a)					cpu_dai = ...
(Y)				} else if (dai_link->num_cpus == dai_link->num_codecs) {
 |(b)					cpu_dai = ...
 |				} else {
 |(c)					dev_err(...);
 |				}
 |				...
 |			}
 |			...
 v		}
		...
	}

In Normal connection case (Y), it is checking number of CPU / Codec.
	(a) is for Single CPU case
	(b) is for Multi  CPU case
	(c) is for other case (error)

Because this loop (@) is not related to dai_link->num_xxx,
we can judge (c) before entering this loop.
And it is needed not only for Normal connection case (Y),
but DPCM connection case (X) too.

This patch moves (c) to top side.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 89416c127dca..8ce6dbf37014 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2742,6 +2742,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
+	if (dai_link->num_cpus != dai_link->num_codecs) {
+		dev_err(rtd->dev, "%s: %d cpus to %d codecs link is not supported yet\n",
+			dai_link->name, dai_link->num_cpus, dai_link->num_codecs);
+		return -EINVAL;
+	}
+
 	if (dai_link->dynamic || dai_link->no_pcm) {
 		int stream;
 
@@ -2792,10 +2798,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 			} else if (dai_link->num_cpus == dai_link->num_codecs) {
 				cpu_dai = asoc_rtd_to_cpu(rtd, i);
-			} else {
-				dev_err(rtd->card->dev,
-					"N cpus to M codecs link is not supported yet\n");
-				return -EINVAL;
 			}
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-- 
2.25.1

