Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC107079D1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65E7483A;
	Thu, 18 May 2023 07:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65E7483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388988;
	bh=tLWJxeljsYw+aZMT8cSV4Np4BgyZo7De7xu8y+ZIeQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=othEOEU6dDb1TjnPEl13Z8dAPvI5m1ikCwMQQXaBAd5/L88+mnfOB1Cn77H+B2gTk
	 FHDs4RmIxCcS5xggtyPjCPHvTALGPRq+ZKMWmPDAI5Hg9WuN4Rw9c5/LRHAFL79h4F
	 5FAtGdDIE5tH3RmmaMADkjUoNUljbZ+6OveN4iPE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E87C7F805D3; Thu, 18 May 2023 07:47:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77A8EF805C2;
	Thu, 18 May 2023 07:47:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FAD9F805BD; Thu, 18 May 2023 07:47:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 54A39F8057D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A39F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AqwzDvxS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYDUUvdRcNQ1ICyjtsRZWCQ7ApN0FlEKzit9hGU+B0wyochLo+S5uMl/Eg+aiE09lfQ4B8NU2kBBPUU3lR1jHMYUvT9YANwVI2KUljI/eZ6Soptc9PySJVHmBMK20GHXWaGjdt/ziZHU9l5Nbx5ArJ2FETI8Ma37oZzaF9U3VA6NvxAIncuc/IHVkYq63JKtRYPfTmeVZg7dcB+NZfr67FHOa49nSEzMRCOeW5wdFjhfzvo0lwow84jeuAXF9YkHhyub1OoBy00lGcSqzvucM5xL9MAjjZw4/gywiPggBN5Dpg+W502X6ihum/oz8Fs3xtEwR8UPjdXJGRm/Y8BWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVemXtGCpPNo8rvZwUVhfAUDNWrE2nXFJtfKlx4/91Y=;
 b=MZ96+rYAs0y8JmNNoFevhnGKpLg+MrBDvcfJ1c2LbjM0KQ1R1kUUC5vCnWoOeAqH5OXoxHeu/Wukdbxnnixi7ew7SmwruQB0CagfEpimI/iKW3IPM4tWMAqMBFXRvQmZElD9u/JcHbrsJNLXRBpJxKvYl80nx+21zVLiWXF1ehqv7laqWFkFbti46K3mGwc1dDF3zfHxC8VPzotRV0bVKqrRrvHWylzkwlKgHe4WsLCbmAVo/7Z4LuPdJvD5dF/kD0yqpdLCmk10PpW9qaa8B1IU3JFUkQiiALxsA1czhaXI19zJtwgAsZFiAtZXd3noTXl2MhRmYKBGpsH0SIAzTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVemXtGCpPNo8rvZwUVhfAUDNWrE2nXFJtfKlx4/91Y=;
 b=AqwzDvxSgbNCIU7Q9XVeTOIYI4NWqaj0nxH5Uf0VidIB+7lYsTWbM6gaM8qPCKsDzbah/bDZf4LhvVWBDQJ/YrsHHl86tyt4QTnthMhD1KDDDERAFlKyiz0nB+7Qn7FvxrWHECk1d8c2oRCE/UJZWttnhZN5jQ+tQCdAYs0Bhjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:47:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:47:24 +0000
Message-ID: <87sfbup4wj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/20] ASoC: soc-pcm.c: cleanup normal connection loop at
 soc_get_playback_capture() part2
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:47:24 +0000
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: e7367a5e-8e47-4a10-8866-08db57635b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	50cNkQogYdJtP/YIVZL25tvxs1+ihF2KCPMZNpJPam3DzNzJ/7gLI4F5DE4dhUhoXdWSTG9xJjBgzvnvOUYacIFG/PoVXAFlfSnFh3QbprbLdzSCgeU7HBL/SciQ13QA6943bjkRPejHrWmn1QHNDYAVKXoF+GNFsWPLCQHDQoYvIeEdEwAMul4Nb+cgjjCbIYAi7kx0RvnwlSwaYUIRfnZmrmjuw9+rrMXdDTIdLM4rfKplaiDyakv3PRaj0sdGjISWaOm0C6f5KK8SS9xSQS4rTtqHGNhJ5vaImu9IU4Qugq42v66fqXqkfgVZQ8w64W3Gsx1wB5XfpuCMU9DPDD5vkTg+JWmRZfLJy3A3FxBlAXXgnEEchDceESpgvFsJC/Fr2mXvuHKvOvelFxD8DLOW6uwPKIljrfWvsbg2CHlsrc405vzrl4BLQ3w5VQ2cc9Ncblgu3x9AWC65X+gbrYgOezy9GZXHm78gnAa48ptd+CM+r5K2suTVPbTYCH01cRiA5M7JUPPNNakKK45zm0GMEE1c3FA1nZDhdu/8nUP38exS58p/HZG5TjvUAeELbrRuhHEEV2iRHSUHOjnTnmG3RUIenVf5V+vpIYznOT+N9UfMWV4spsL8LINCT6Ev
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zEsgnhknKs3+lLFda20nj9iBBBZlnArDICnHAefwq5EQsR44AoNJc562basw?=
 =?us-ascii?Q?FwT0uZie0bIrfCG6P8RmQvdPXFzxHULN7aLRv2VWxm8tvSOzKdNIpPex9FP8?=
 =?us-ascii?Q?9burLlAAmSoZtoSkv68BJB4+ywLglZjteEEaEiPSj/Xf33lkcxtdx8WWwTP5?=
 =?us-ascii?Q?Y95hiekk7I/FB0XuoXWUuUz214Tig45sIwizNCXzwxCyfrS7kpBRClbIHgkX?=
 =?us-ascii?Q?esV1ETRfONeoOeMpNHWBcKjXjxPE5wudXJeIq8UYyVZa/PPuWhY02VHt3kkP?=
 =?us-ascii?Q?rADs3lUg1UbhKKdcNWMOU5g7u7KPCeBIAMK9aUiMEGExkn9ril7oNZ74Udiu?=
 =?us-ascii?Q?997Nmu90qVLJJQjP8S26Dg+XXaMJZLYFGee2BnSLNsekyXKUIpWEq3XStYaf?=
 =?us-ascii?Q?Lb33rYTeC2GBNK2qnx9R35cq9BiRu9eYYs1QDXugbMqkjrf7DKK2TSbg7iBm?=
 =?us-ascii?Q?4rqHRIR9YxKg+EhhqsS4M5ddbXwHe+KhgAbJ19MFyCpFBZ58JaByetlVxz7I?=
 =?us-ascii?Q?cY3e6qB6pcUb91Yu6a/EZG0cXCoFt7oMDOWSehcj8dx4OOl9TDxD8y7QSzVI?=
 =?us-ascii?Q?m2jhsaYb8VYmDQiKrd0bVNJjpqNm/bQaAFyPIbUBb4+TjMTQG6ZLTLKKCXv8?=
 =?us-ascii?Q?B8MWQtrt/FZo0ki7Afpi71kNsaAsUZEDn8+VvJVHzIcFeMiu0gMSSVxVgnhv?=
 =?us-ascii?Q?+Fzins6D0O4puKIjVVaNDVP87tNgSb4H0WVsp8i8LBeAUaqkKSUS+fudFF0m?=
 =?us-ascii?Q?plgUzXDuroBGSrmDJPHHAq5IPmm7R25DD/gKezvQlTOFe7cMBno3kO2KSNG4?=
 =?us-ascii?Q?nKC4ScofdVd2IO/PI9JRADoGAVNKkgUvZEP5ATZX/8UAewnt6k5EkqKr1tcj?=
 =?us-ascii?Q?dSk+Ec3Nw+zD8E/0TspMcsSqmZAg0AGhCpSE+h85PRd5cuBQsQ1cwSNn9knS?=
 =?us-ascii?Q?OXxXqzxkoWl9nBL3+AVlzulwurvvokAkQxt6xSj7DIXzJ0qhOxZBbpwyUpjq?=
 =?us-ascii?Q?t0vDnlU6LdvBXUNnjyCpiMRFYCg+cIMdGb9egUXz4FZqCjCDTN3PEof0S+Uv?=
 =?us-ascii?Q?RbJFlfGMplNiSf2PdBugqhJK9N9rHdhrwQwzbl/COPq+Xn+c5w84cfoQSWNo?=
 =?us-ascii?Q?Lsxksxa5tH4UNgXsFOsUKoeyW6boulEgByMMEMUjGDtsW3ZJQQf/UsC+2pwp?=
 =?us-ascii?Q?Q+cLGriJVFau8ci0fkyT4VPmZEFQI0lJDDkAdcqsLtI3i6DLdlS1OdwEss83?=
 =?us-ascii?Q?eIC4ZjxQ5HoP7Pvg0aosA71R9I4aQs1z80YUtgsXxDPkkcuWAdU5LCQNcng6?=
 =?us-ascii?Q?oiqEiuiW9iteitUAPR6XLqcl4Ude4hbr3/l9yPDHwIIaFQAqsjQDwHlbeY8F?=
 =?us-ascii?Q?J203kMSJqD17nqJYYDQy7GNDLdLF+tsoX6VKj1V9JUnAojA+LsUSJsACbc2z?=
 =?us-ascii?Q?DJC33IS/K+MC68tRRsC11xA/rpCQsOS2C4+43sx7srsRgX7dl1S4v8b+ggtC?=
 =?us-ascii?Q?ZzsGhqy7u4n3Z6RdBFebNb4UJDJMByRY19hhdHlxMPx4CXY94mmMzLOg6Zwj?=
 =?us-ascii?Q?sGx4EudSCm1qPmdcKgGyRbNs9iWzD/wwpfxPJLbRkNKstvhH3UmEDpYCIqTr?=
 =?us-ascii?Q?oY/lW9a74q+37/0YKepQ1LY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e7367a5e-8e47-4a10-8866-08db57635b29
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:47:24.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iPYmm3mWXhPKH4ttzhbpm8o7TqA7sq1gAjsBsd7KGaG/rUUyr5jK1u9v7IKUPATs+s23yC4OBT86AYVJqB7chNAIcYZNmvks2+ilPEQhR98jl3aDbg1KoJaIGlYfQ80F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: 3SKWDDVZZAPKANXA6AWQZPCDW5PTQZLQ
X-Message-ID-Hash: 3SKWDDVZZAPKANXA6AWQZPCDW5PTQZLQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SKWDDVZZAPKANXA6AWQZPCDW5PTQZLQ/>
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
 |			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |				if (dai_link->num_cpus == 1) {
 |(a)					cpu_dai = ...
(Y)				} else if (dai_link->num_cpus == dai_link->num_codecs) {
 |(b)					cpu_dai = ...
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

We can simply merge (a) and (b). Because it is doing
same judgement, same operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8ce6dbf37014..af5d4e1effdf 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2794,11 +2794,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, i);
-			}
+			cpu_dai = asoc_rtd_to_cpu(rtd, i);
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-- 
2.25.1

