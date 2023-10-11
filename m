Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6167C49AA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 08:11:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750BEEC7;
	Wed, 11 Oct 2023 08:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750BEEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697004703;
	bh=ifNCtF3ql/QikeiDvr91Flp2w6TiNIsMJd3bcafZFSE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wzqo3naEPmSpM8Y7Z3ePwJgqP7MWGr1CaovFexSG3ccSzBmmpA64hO4Mjty9rl/M4
	 p/CS9AaU/juSZMc/4NoY5DGscQJdIL8frWDHzPz7VKDuQ0gFS1h76VlukbIGuZvFWn
	 HziZeSaaTdZ/jR3NN8F4tRwHFn8nmqGg8K/o5eyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AC10F8057C; Wed, 11 Oct 2023 08:09:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEB8DF80578;
	Wed, 11 Oct 2023 08:09:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 782D2F802E8; Wed, 11 Oct 2023 08:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E24CF8027B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 08:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E24CF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FmJbLRrF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBoCcKWEzwzF4lO2ALmcwDyMpEPa4Lj5gbSwbKeSHOEetVoEkERDd7Yibpy5ZgkbQRDVENx5cJR7+F3ibgVuND5Ds6EOxXF9FBd7cldUVdzASY7UwIKj/bmwy63vTlVP4UyHBOJEDxnIEFwAbAHMajQAr/M/3GrVkFPZezBZIxOakMh1qF+VKRY2ilrRkGGkEsKsciLOfX/IIwMmQUbtuaOMqIK40pgTCz+H62vkEzHfYPPklv81dpLOn+5ufo6VMJe/n1mAPJv/YN5lcpy0AnFFGcR/8pmwwhn5joMP0Ky1yzIbflU7zqHJoKNGj2UpVdfC4r8YhO857WWt2iIgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4AYtG+keeIPKxYqNKHZTQiSO/VnWhfY9wa6gnssUMs=;
 b=R3+qWDhYjRk8CYfvKpP9FZIj2tnhWMZqBL+CqVemS+LE1d2qwk9yE2OKG4JnS3O8U8ZQpzkiDSEVU52hl1afSE6tCF9NRShKqfqKLZ8ToE/oMd/L7FhoGGSOzedmwuiQOcdwS52zToIL9AtjRnGpcGiD7n8vI/l9fsndm/RMnIhyWX53BkCPFjKH+5kmx4eK4ppH2YJWyiaVI7F/Ora5vRPA8u9+DcQ0jdG2+FcoFMedvpgBVas8YsQZnKbKsZCGf4Mxj5levAe7IBvXufX0ikKnRIiVC6yAZCqNJLmLiilcVXVldzdLvw51yWQvWhIet33Td/DLShuSgvDz2xpqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4AYtG+keeIPKxYqNKHZTQiSO/VnWhfY9wa6gnssUMs=;
 b=FmJbLRrF5pZUiUiUTAGhEehqcg2gsQZAsQJWvZ2U1H14GUqf6j35YY5yAYWpD/gKsEKwiLnoaYpyWecdvOmZBJf8Hbr/CVM6jUoJPhxA/+jr9EKINgqdNoZRTeEPmUagWH3YXxwAvQUpSg/X3X7bgd/8tBKqY/ZJQ1lSIAkKbWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11514.jpnprd01.prod.outlook.com (2603:1096:400:377::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Wed, 11 Oct
 2023 06:02:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 06:02:43 +0000
Message-ID: <87lec91yt9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
References: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Oct 2023 06:02:43 +0000
X-ClientProxiedBy: TYCPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:405::29)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11514:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac88bf5-5da6-456f-ac69-08dbca1faf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b4Ghemm1H7yWQwLAVql8BgkAX6+fkK1ZLXCX99Cszb0xkQu/H6HN0J60hYEJChOGA0c/XH/d8UHGoMWA0jqcE/u2BpzM+kPWccPS7frXwEz7V8cCrilQ1W8qnmnKLzFDmCxtE8s1qpYd0XdcDRhnwBYNWWSdU1HrvnMCTY55fBQnuj0+JHfwr232yy17QjIvYVVM3HNBOGM3GF4PVaUGgMdd34e3EzbvTulANOShUUyTM2dbuj+Mfdr0aGI7txuZ8oNqktn4ikNyEdee1lq1rmSz81EUVjgvQZ4Du1zC74s+4Tmh9vbifu2zrn4Dd30HzcP/IfEKJBP8qwqgUCCH5DbSDqLLDVG6Y3EkUWOfYK/Nv7vpTdgnZ/J5QA0zWXDS9Em7bseFMOGTbTCHQejNG4DAipXnjJMHzRIxMAGgwNqvXR2LXRb4f9gbOqW5KH2nT9xxTQgiZlbWzZd3gk4E2trRvLMNBU7lg46ViEJP9NwnH5iU6YNtq09TS1Jrh32uAppiriRrhUJpu0JqIrU3mu6rP6zNPaFhKaRPrTcJb8f/OclBTtHwnSoMUcZSBkmFuo3a0d4f6ndHUAnJvVs2cwOnKsDGMkAA/JpLCsx0HZoc+MmdwLbMKeJUsukmk7An
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(52116002)(6512007)(478600001)(86362001)(38350700002)(36756003)(38100700002)(2616005)(2906002)(30864003)(83380400001)(966005)(6506007)(26005)(6486002)(8676002)(4326008)(8936002)(316002)(41300700001)(66476007)(66946007)(110136005)(66556008)(5660300002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Vlc2yOkTrGI86vagqSmIyqzwe10FKFXiB4m/zCAJ5XQf0qlBJGvqDzFa1na?=
 =?us-ascii?Q?ZfxiLDdbWDclpgd6PAxZ/1jAgmOFV9t4Nsu7tJSnW2yI+PbMzKHKJ3+hn+eB?=
 =?us-ascii?Q?m2q8u2XShANZVPWUE1BbNZPGvqgIvZ93B98h64b6c6pAMITm7zBsONKfnPz7?=
 =?us-ascii?Q?BygKVbXbByoZeTzIjBFaUcI79de8DNt/D542NcLRPB+VOAv13a6a0hB2JO5F?=
 =?us-ascii?Q?BoAWZK9tTtpllWs/uS4m0yaAAmAqjQfaHXTZYFj1bHdEK3+Y4RX2ZmxRZGaF?=
 =?us-ascii?Q?JLuEKJ+uQW2SyRcPrWFgfwD/Pb++dJjfcBjft85wvGw6MeHI8QbJqhwVChS9?=
 =?us-ascii?Q?d48pyhB1q2Co+fQnvA25En8t/F/EHIoe2yJafBEC+joEtS6rPUMukucyIyfW?=
 =?us-ascii?Q?OHSmFIP0/eCGxQgKamSvOGWBbed4IsGbXz8chDS88Zw4pgMYWOwvJ8RzhoOg?=
 =?us-ascii?Q?p5bGMzO7/y4yCjqrY4fs9fOZ9Lx4N1+oYoyd1tsXGMQUKP/6T72b0S9FuBFS?=
 =?us-ascii?Q?CTk7rrAIld9jhy+Xd7QoYnRae7s5UrWqT0Yd/TymGePslqLbGaEs5LlVB0Pw?=
 =?us-ascii?Q?GQqz1/XB9BpOYCKnKw3ZpGQPxV1wnZnbDHuqI30qCmdIlVOyM7yHS+N2iWDo?=
 =?us-ascii?Q?YFA0mz1kqKE5lobHZWEJi/pXKVuHonytoBBU0Tp0WwCjc7syYi9pJv9KDJ6E?=
 =?us-ascii?Q?3t80siambi/Yl6hSmVzLkKlwDQ9E70LXSzyKjmoMNINjGDkQuSfuvr2MXhHJ?=
 =?us-ascii?Q?rrdECJcJad1/B5PnTAvUOL5JMQKwUt42IEbXcQ1InhnBlveGT9dEJLYir34Q?=
 =?us-ascii?Q?sj+E1WjidJzJue4q9qbzXq//R4+cZ+dodX6xwMQaSMLC9L1wFFx8Fhetd+LP?=
 =?us-ascii?Q?Il+YYcjK5xQlY+OF6zMgbkF7FKTeHPsDbMi+LMut0GnV7dcSArHMDPCfYaF4?=
 =?us-ascii?Q?TTFCUHP7JiDceVmaCLpPUzeyz25Tc2TvY3s0jWsTdRB5GxQXxIdQisP4o1Nr?=
 =?us-ascii?Q?ujOBO2L7tGWjhAvc3Mff//uFOsfqpmw0xeG3jb2ewKKHl3ZwbXc3Cn3QyMcf?=
 =?us-ascii?Q?6I3hUjbqmzxcnySggWVzLGfdCvO8NfOajCxek7NzgvTxGYCA+t8p+13LPy4C?=
 =?us-ascii?Q?Th3pw+84C4UmMzLj1Oy+AVUOl6vzEqRT8Fyqlh6Vom6YD2UugTupnYP6fwHr?=
 =?us-ascii?Q?4JB0y9vzMI7a8SiaJCZ9H+UDWLZeBdvNINt7sEDXf5XZV8WaDzpJvCwpTurY?=
 =?us-ascii?Q?VOqpr8Gds4yoSmrUdNUBYniCK2BATf//p82TNSToJYm6z+YcrCPUL4/ODtHl?=
 =?us-ascii?Q?KgUDJV05bGOYN+z9Ro3WdyitBn4qPp3//wbp8SLgf0jFrmcyZuZ5n8uILMBF?=
 =?us-ascii?Q?f4RWeDrzDFrssUUqdYqd8AzPttovoJzzK+/mbh34wvlzndp0K8y3o7BiB7+u?=
 =?us-ascii?Q?zypFlAjbRgghbn4avAxvzZAfk4UhKyXdlwnBwAcfQaa1ulxfVntlnLp3IXd2?=
 =?us-ascii?Q?D9WnuDJq7MJpqxxHxhkkQfmbLSDSIBT7NB06D+Yx0+CBh5eUtOmva2Xf75gD?=
 =?us-ascii?Q?/uyk4FA8OV/aItrJT3rRG59PQ7yXU6+/5pfa64vHXXonJZw4XB63p0oLuNLk?=
 =?us-ascii?Q?uQ8HSLIB4fMpzrV+hS9V9a8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ac88bf5-5da6-456f-ac69-08dbca1faf12
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:02:43.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0xO05LGtw6cF78djyARo+QM+nxesAEnzdPfW045qSdZvk3CGgEZOTnhsoEHKWqKBQnQPWFQQWaUQEMWUhcxH4SzSvCK/s8/H+ClyIQLDR9mQu5HJ3LcoTWP2fSutZXgQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11514
Message-ID-Hash: OZVQZFPBOR3CUZJDFDRVLRWHBWZ4LMP4
X-Message-ID-Hash: OZVQZFPBOR3CUZJDFDRVLRWHBWZ4LMP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZVQZFPBOR3CUZJDFDRVLRWHBWZ4LMP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
but it is used for CPU < Codec case only. We want to use it for any case.

By this patch, not only N:M connection, but all existing connection
(1:1, 1:N, N:N) will use same connection mapping.
Because it will use default mapping, no conversion patch is needed
to exising CPU/Codec drivers.

More over, CPU:Codec = M:N (M > N) also supported in the same time.

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h              | 66 +++++++++++++++++++++++--
 sound/soc/intel/boards/sof_sdw.c | 14 +++---
 sound/soc/soc-core.c             | 85 ++++++++++++++++++++++++++++++++
 sound/soc/soc-dapm.c             | 47 +++++++-----------
 sound/soc/soc-pcm.c              | 73 ++++++++++++++-------------
 5 files changed, 211 insertions(+), 74 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 63b57f58cc56..ff04ed312009 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -655,8 +655,68 @@ struct snd_soc_dai_link_component {
 	struct of_phandle_args *dai_args;
 };
 
-struct snd_soc_dai_link_codec_ch_map {
-	unsigned int connected_cpu_id;
+/*
+ * [dai_link->ch_maps Image sample]
+ *
+ * if (num_cpus >= num_codecs)
+ *	.ch_maps is [CPU] base
+ * else
+ *	.ch_maps is [Codec] base
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 1;
+ *	.num_codecs = 1;
+ *	.ch_maps[] = {{.connected_node = X; }}; CPU0 <-> CodecX
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ * CPU1 <---> CodecY
+ * CPU2 <---> CodecZ
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 3;
+ *	.ch_maps[] = {{.connected_node = X; },	CPU0 <-> CodecX
+ *		      {.connected_node = Y; },	CPU1 <-> CodecY
+ *		      {.connected_node = Z; }};	CPU2 <-> CodecZ
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ * CPU1 <-+-> CodecY
+ * CPU2 <-/
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 2;
+ *	.ch_maps[] = {{.connected_node = X; },	CPU0 <-> CodecX
+ *		      {.connected_node = Y; },	CPU1 <-> CodecY
+ *		      {.connected_node = Y; }};	CPU2 <-> CodecY
+ *
+ *-------------------------
+ * CPU_X <---> Codec0
+ * CPU_Y <-+-> Codec1
+ *	   \-> Codec2
+ *
+ *	Because [num_cpus < num_codecs]
+ *	.ch_maps is [Codec] base
+ *
+ *	.num_cpus   = 2;
+ *	.num_codecs = 3;
+ *	.ch_maps[] = {{.connected_node = X; },	Codec0 <-> CPU_X
+ *		      {.connected_node = Y; },	Codec1 <-> CPU_Y
+ *		      {.connected_node = Y; }};	Codec2 <-> CPU_Y
+ */
+struct snd_soc_dai_link_ch_map {
+	unsigned int connected_node;
 	unsigned int ch_mask;
 };
 
@@ -688,7 +748,7 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 226a74a4c340..7927b729866d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -579,7 +579,7 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	int i;
 	int j;
 
-	if (!rtd->dai_link->codec_ch_maps)
+	if (!rtd->dai_link->ch_maps)
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
@@ -607,9 +607,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	 */
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
+			if (rtd->dai_link->ch_maps[j].connected_node != i)
 				continue;
-			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
+			rtd->dai_link->ch_maps[j].ch_mask = ch_mask << (j * step);
 		}
 	}
 	return 0;
@@ -1350,7 +1350,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 			    int codec_num, int cpu_num)
 {
 	int step;
@@ -1358,7 +1358,7 @@ static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_m
 
 	step = codec_num / cpu_num;
 	for (i = 0; i < codec_num; i++)
-		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+		sdw_codec_ch_maps[i].connected_node = i / step;
 }
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
@@ -1453,7 +1453,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
+		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1530,7 +1530,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		dai_links[*link_index].nonatomic = true;
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
-		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
+		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c305e94762c3..07fdcb997ab4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1824,6 +1824,86 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 EXPORT_SYMBOL_GPL(snd_soc_set_dmi_name);
 #endif /* CONFIG_DMI */
 
+#define MAX_DEFAULT_CONNECTION_MAP_SIZE 7
+static struct snd_soc_dai_link_ch_map default_connection_map1[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 1 },
+	{ .connected_node = 2 },
+	{ .connected_node = 3 },
+	{ .connected_node = 4 },
+	{ .connected_node = 5 },
+	{ .connected_node = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_connection_map2[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+};
+
+static int snd_soc_compensate_connection_map(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i, j, n, max;
+
+	/*
+	 * dai_link->ch_maps indicates how CPU/Codec are connected.
+	 * It will be a map seen from a larger number of DAI.
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+
+		/* it should have ch_maps if connection was N:M */
+		if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+		    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
+			dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+				dai_link->name);
+			return -EINVAL;
+		}
+
+		/* do nothing if it has own maps */
+		if (dai_link->ch_maps)
+			goto sanity_check;
+
+		/* check default map size */
+		if (dai_link->num_cpus   > MAX_DEFAULT_CONNECTION_MAP_SIZE ||
+		    dai_link->num_codecs > MAX_DEFAULT_CONNECTION_MAP_SIZE) {
+			dev_err(card->dev, "soc-core.c needs update default_connection_maps");
+			return -EINVAL;
+		}
+
+		/* Compensate missing map for ... */
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_connection_map1; /* for 1:1 or N:N */
+		else
+			dai_link->ch_maps = default_connection_map2; /* for 1:N or N:1 */
+
+sanity_check:
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			n   = dai_link->num_cpus;
+			max = dai_link->num_codecs;
+		} else {
+			n   = dai_link->num_codecs;
+			max = dai_link->num_cpus;
+		}
+
+		for (j = 0; j < n; j++)
+			if (dai_link->ch_maps[j].connected_node >= max) {
+				dev_err(card->dev,
+					"dai_link->ch_maps[%d].connected_node (= %d) is "
+					"larger than max (= %d)",
+					j, dai_link->ch_maps[j].connected_node, max);
+				return -EINVAL;
+			}
+	}
+
+	return 0;
+}
+
 static void soc_check_tplg_fes(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -2030,6 +2110,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
+	/* for keeping compatibility */
+	ret = snd_soc_compensate_connection_map(card);
+	if (ret < 0)
+		goto probe_end;
+
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2512aadf95f7..3c7c2b16bd64 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4426,6 +4426,7 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -4438,39 +4439,25 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		if (rtd->dai_link->num_cpus == 1) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, i));
-		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-			int cpu_id;
-
-			if (!rtd->dai_link->codec_ch_maps) {
-				dev_err(card->dev, "%s: no codec channel mapping table provided\n",
-					__func__);
-				continue;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, rtd->dai_link->ch_maps[i].connected_node);
 
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
+			}
+		}
+		/* .ch_map is from Codec */
+		else {
 			for_each_rtd_codec_dais(rtd, i, codec_dai) {
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				if (cpu_id >= rtd->dai_link->num_cpus) {
-					dev_err(card->dev,
-						"%s: dai_link %s cpu_id %d too large, num_cpus is %d\n",
-						__func__, rtd->dai_link->name, cpu_id,
-						rtd->dai_link->num_cpus);
-					continue;
-				}
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, cpu_id));
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, rtd->dai_link->ch_maps[i].connected_node);
+
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
 			}
-		} else {
-			dev_err(card->dev,
-				"%s: codec number %d < cpu number %d is not supported\n",
-				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c168dc553f6..0bfff2ea111d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1043,7 +1043,6 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int ch_mask = 0;
-		int j;
 
 		/*
 		 * Skip CPUs which don't support the current stream
@@ -1055,22 +1054,28 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		/* copy params for each cpu */
 		tmp_params = *params;
 
-		if (!rtd->dai_link->codec_ch_maps)
-			goto hw_params;
 		/*
 		 * construct cpu channel mask by combining ch_mask of each
 		 * codec which maps to the cpu.
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
 		 */
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
-				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			/* .ch_map is from CPU */
+			ch_mask = rtd->dai_link->ch_maps[i].ch_mask;
+		} else {
+			int j;
+
+			/* .ch_map is from Codec */
+			for_each_rtd_codec_dais(rtd, j, codec_dai)
+				if (rtd->dai_link->ch_maps[j].connected_node == i)
+					ch_mask |= rtd->dai_link->ch_maps[j].ch_mask;
 		}
 
 		/* fixup cpu channel number */
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-hw_params:
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
@@ -2824,36 +2829,36 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
-			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-				int cpu_id;
-
-				if (!rtd->dai_link->codec_ch_maps) {
-					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
-						__func__);
-					return -EINVAL;
-				}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, dai_link->ch_maps[i].connected_node);
 
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 			}
+		}
+		/* .ch_map is from Codec */
+		else {
+			for_each_rtd_codec_dais(rtd, i, codec_dai) {
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, dai_link->ch_maps[i].connected_node);
+
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
+			}
 		}
 	}
 
-- 
2.25.1

