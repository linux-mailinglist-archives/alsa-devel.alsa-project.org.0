Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411393976F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2024 02:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25721847;
	Tue, 23 Jul 2024 02:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25721847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721694145;
	bh=28nq5w5q2bHSNwelMel0GCo8tJzj5dDvfEtTClRB0Ew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j3qlxndTz/SDSNxURnfot0ZUPgM/A7N3Je1rZhzT8XhYaEbNnfsMUL0nzPlpDhCbi
	 ptbNYFtTvSu/LnyjBw1IQ7vkaGBE+fKKbRnNx9uEc2cpZANjDVQPXG09vi6ITaoBQC
	 O+auWdFKqeIbK+FYw+KhYZU8md69ev5hVcGSvZBQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C62C1F805A1; Tue, 23 Jul 2024 02:21:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D536F805B1;
	Tue, 23 Jul 2024 02:21:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66167F801F5; Tue, 23 Jul 2024 02:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A873F800C9
	for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2024 02:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A873F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TTUk+Sir
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYhuQLB5Wra8TYPN/TY15JvNZxFvWow4Xk/O/CS1Z1XhiVLBJBSmGT2L0QsFrNDDygvG/5mIqt06CTQjNYSKAQQa0PbzFeIdOUO0AgdwayYA8FqOWldN/ishPstQ9mPg8h2gt7eyWsn/OzmVuuitG+zqC4fG0/enPMp330LgcNGQKSS4L0Y01+0pFTRLdTGxtTojIBIVe4QtRyCt0c/GZqI49Pt7fjjoUz79YiDteF087UX1iz8se84rrf+JKgcncBQPrdoCg9fYEvTxBFKrz5cLF0PBYL/7TtphjlfBRfJwT6ixXu+1K+NGxKWYtKGOv2UK6NZ1UOivsT7OYPmcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+oNJYSF2kKR42B5jc3wjBBn8AAVn6noSRqj7G4A4/c=;
 b=Ca4bM3Mkq4vendZqU2zz8biWYb4L/rLcF5nIr2ORXoj+nBk+bwijy22ghSDsMWHD+ZmytOFkK+5o5Z7ISYQeYvdGw29p2c/Gpklgpg356rJWya0hDdMjogkcrFDBK0JK8l1pX7XF97tamo4s9kUz8QkgZ5SP2TuY48G1nvcBBwY6NwB4IQkbQd6dHycdq3VN7oqv89elpNh24Dnf6ddU7vaqv/EDRtlfVRnL9anJCOt+kDy+z2qbAtaYHidjCQ9eJ0eS9aAwJIOg2MhgFa4C+1dvHuIVif/YVtZIZg2v91WtAVKABrx5HGGwpqUteV1R9U6qHEqgIdpae34LWJM8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+oNJYSF2kKR42B5jc3wjBBn8AAVn6noSRqj7G4A4/c=;
 b=TTUk+SirL2jvI0uh4gKzHuk2zC1R/PasBpCHUXUmHLgzcYdV8XyO9Yg6NbRgxERQy90pQHRhFQHs/eQ2E9nrZQRIN9KqPEtOsxwG6sazUog0GbW39ZdJDi6fNoTXVrb2oTqpmT/tHgWp2SBeL4TwwnYDVU+1qiGD5G2w9wFvh48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9849.jpnprd01.prod.outlook.com
 (2603:1096:604:1ec::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Tue, 23 Jul
 2024 00:20:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 00:20:47 +0000
Date: Tue, 23 Jul 2024 09:20:41 +0900
Message-ID: <877cdd3qna.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
In-Reply-To: <e3f3b4fd-92f3-4162-bd09-78aecb6d5193@linux.intel.com>
References: <e3f3b4fd-92f3-4162-bd09-78aecb6d5193@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYAPR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:404:15::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9849:EE_
X-MS-Office365-Filtering-Correlation-Id: 05658b36-31a7-40d7-17fe-08dcaaad4cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?weH4CszzrkIxcdyeZMHhNuLlqhtPzvxnrid+m6L+bawQAnNq0ZGQe5xLe3E3?=
 =?us-ascii?Q?53pe2aMM8Tunqbez8cP7FlO8KrG/sHHzIBN+4M0GU2QhI2ktm8NgbYjG6AHz?=
 =?us-ascii?Q?Htesqu/8qBxJbAfp1u3Tf6He9MSBrhkaorkUQoqGvdhwB+t2YZPs8WdzDNWP?=
 =?us-ascii?Q?eEsJ1wjaS8iO/96gx6EIGvbT+ojHrkqzU/xQpQC0Ta/kihiWQ3QorLRyD5xq?=
 =?us-ascii?Q?0Of7XxVt6xRaKud/cm6/XZiPKPiOUkoeoeF9jFzZjO69pgea1BdrmG5FQrm5?=
 =?us-ascii?Q?WQOS+tHWk7vc3bAIKHDOcLEVABmBjONYVElli2e15s+0LvgDpbu4o7avovSU?=
 =?us-ascii?Q?NjPcFnmvWZ3dOczsp69gSCJnQK6MDvwIPQEN5G6Juvn5+vOKOaSNkdKFdVX9?=
 =?us-ascii?Q?RJ+2g/8IsU5FuefOWPTAE+iQvtBfD2F0KNUdOSSpbiFzze6BqrJgJwUj2jOG?=
 =?us-ascii?Q?dMFbyVnU62k2F4/Ies+aLXOuCsGv0rUBHB3iON2Ewprf4hrAbSxMiWf1qd0Z?=
 =?us-ascii?Q?NIQI2ziNMYP+oXNus+7d+ZIeakdiyGrtswuZnSG+apluJpVigIjJ7uKrD6mc?=
 =?us-ascii?Q?BY20rQ+RDsVTJwEgg6sodQj0ylCfJvBB+FW+A7p98mfrixqrmR2/dzyztyZn?=
 =?us-ascii?Q?9TiCAkwP85dzN6XO/sBXFam1eAZjHFHUGgFM6eHJ6cN81mFc5eNuF2QgNt14?=
 =?us-ascii?Q?wj9hNn6J41emY/+xA+HdAq5gg1PZ/ojwAY8CTbTZ5KkTDNWMriEvIkYZvqFh?=
 =?us-ascii?Q?8tpZcwZWHsJuSfewxnS3goLPf3n+l11hnnuT96iEW1t+XfW9+yluN7ILxSjo?=
 =?us-ascii?Q?Obo+uD1PMHzF1gQzf0I7ZFIDLIBq6NybK2uVYdE+ZirznbJkS2PbCPxu2f+u?=
 =?us-ascii?Q?mjVckAkAfVDVXZtXkvbMSZWlSls6shMUniOpP1CbCnoBAVQ1mvgrNDoz0qnD?=
 =?us-ascii?Q?n7C2oFsaoBpwePvlJOfrU5r2fLZbE5W8BDvWKm0d2RR0MS7/hHm5ep3RLHAE?=
 =?us-ascii?Q?FXAjox7/6/8yrRYHJwngd4FMvV9qJw9QwWIyuVuImHCiDQjI3cjMAuOjfeKh?=
 =?us-ascii?Q?RVFzpoq8r+AcuQdLQFOgER0gbpm2GVAsnoWMztRyHIUkiBhC3zZCCtTJENkr?=
 =?us-ascii?Q?a2MckIx2wxZhLmA4d+rqZbM2QIrROJ/f5c1km883p/CzhNzu50MTs4ve6fAX?=
 =?us-ascii?Q?d4VWziM2A0moVCesALya+4ed/Gx9b2up9ZrqDhlcbdy09vm8kExX2OcvVL+j?=
 =?us-ascii?Q?AQmxdBtI/AvIl1xMQ7H2Js4Hz12zXCYggcTxaTOclgmIcD6bWmqO4qFw/s7g?=
 =?us-ascii?Q?K5Xzd/L8r8apDQTUBpJ3JWKZQhuqV/x0rqkxLunminUCC55cNZy/EaiWHv2B?=
 =?us-ascii?Q?KesXaLM/s9vFq5Fr1OZHlxTAcr3AMtusFAM7fMSIqUSL25didg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7IePW7Lm6MGwDmTLqPZ0JPQibhEFhIJYc7o8+c4SVzYGBM0uKzFfCOXg/pZ2?=
 =?us-ascii?Q?4fC6o2fezKVPY12BoKVQsDWgIlPvfB/guTqCFVxvvYlXvbB883ELEkTxJc4M?=
 =?us-ascii?Q?GJKZhnqo4LQlH68O5l9MD+g431cCBXh8AyF7ucM7zZOicpjM+rjjagvSjSj7?=
 =?us-ascii?Q?QHBcnXldSp4mWx6Z7JMknna3La7CYPn4EWACzEw/bUqp7I3POfoCHFWh/8jm?=
 =?us-ascii?Q?0HmERMZAI8TVe1914DTrnYAST991hmwXe8E4rjxD0Xzhu6lICy+QI0CL+CMi?=
 =?us-ascii?Q?WF2zwUdMEKgdBNF8irhlljxSGBzaz4GiJQYSjzLHA3CGpdNckV2EKzm4MltB?=
 =?us-ascii?Q?MpeSimeR4V+I50wqkTYQkv2IRqCADzGJU1/1GGgRcQ8Ds5UNxbD8/Juu02G2?=
 =?us-ascii?Q?9JRPgfUnyoQ+d4KUwNUeI57b15AdhXIwehyg3HIih/BkoqVEYdTOL3YJ7/GT?=
 =?us-ascii?Q?9YZmkl9d1af49b9xl/v+Uajtj2uu666+KcXYgUKmiw9EKTo6nkFzVrAbNq+p?=
 =?us-ascii?Q?Kwzm8NJoV4wtFbMBkMp2m/Cth10XW9ONbacPZZinQVvYeFZobam5AbpPH7aM?=
 =?us-ascii?Q?9OIw2OnP2ly49fpFfIfvbvkFEzTinmfnPrjcLudk7TyBvsoHUI867b/6wTE+?=
 =?us-ascii?Q?138axqwAHfLJuo8Vo8Xuc7yCwpmyRbrR9O9qvryX/aHtss1XpLsnmpUzH9HI?=
 =?us-ascii?Q?et1trWZZR9gX3ULLLfp2OFvRB18g9MyKz75ndi2ymcOTuHhlfZ8a3eRhUyUZ?=
 =?us-ascii?Q?wZY2+1itOrrMDzgSO7Q6dfPAVDhMGeMvuA5aUollz+XiywjRB1fOSVT1KI5u?=
 =?us-ascii?Q?Oeo5VsoUluNam9mMsjqvWbs9rKwaK2cntahyxdKSziocDxz/88emc/nWbH/V?=
 =?us-ascii?Q?IeFMk/T3yoPTYzvo3/aXb+49C1X6vpTb1G9I0snpj7pjM9Cy8GC0aJGZf/yK?=
 =?us-ascii?Q?BnpmIDyQd9ba+iNbU3d9/wkhg+WFJV3RPeoM3E72Wq+JxNpFETer/3Wi7Ls/?=
 =?us-ascii?Q?tIwNcLtPjJUslK63CRHT6miuESsSZGcFAQFQNnJPjvAxXGVp8Lmj4ST0hgW+?=
 =?us-ascii?Q?iTvFrBqjiQnsYLFxbj6P++dy+aExLtFBWD+Pp1azH5oC2fAdsgt+0kRG/4F4?=
 =?us-ascii?Q?B2iRqdZ+Knzp8yRt0bMlgxwBUTYmmiuvzqeuSfzfuphD7nRolvO1zXm8J6eB?=
 =?us-ascii?Q?0zMn/+G/ZL8ufvjF3vhVB9pr9RaqBLr/eZSbvHELqo6cxOg7lWM1rXBwseiB?=
 =?us-ascii?Q?yFdDqP/YEcOl5dhpyWnwjT3Z+KfxGpZmCvXCuvN0DJFBMUB3iG4Gw1RjXnOm?=
 =?us-ascii?Q?7me8SC3vlYhCPVMoKTpIqzgXSKGenDqY6rSWOrtNF1qcDYS8DBhi5lADDA14?=
 =?us-ascii?Q?qP8lcan2nPzgncSe0LuR4zvGdP0t4RQym1FPzJVs42iOrHBn0hQoF5V4RbJZ?=
 =?us-ascii?Q?dwCCgzOuFd+hicyu0vKUiLske/conQegscLh0yn0oaGxgv+1/6XPtNGOyxGX?=
 =?us-ascii?Q?xBmlZHbeZNq5IpoGkKhukOQ6aX4KbTNd4QNJ7Jn2Njp0Ml7thLk5avvFyPiA?=
 =?us-ascii?Q?ltyBNpremWjb9w/yvgClePVY73TEOEZnACjPkBVIW8SxZt2oGIhnkmVCJ2QT?=
 =?us-ascii?Q?1u4VHUDo0GCDimHciOXQHM8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05658b36-31a7-40d7-17fe-08dcaaad4cfc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 00:20:47.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WtB1k0F6oc6Y+Bd74KnU7+WeVLRn/PGbC+YI69/rRDJ+X+g3F0NEA7Z17QVtT3O24PODx9tZrb3rcKzFFTifdK3VpDfEER0Z0o+sefjpND7atCDbgyq+vbMJiQiASFoG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9849
Message-ID-Hash: UWO55M3BPI2XPVOS2LDYC23X273HBHTP
X-Message-ID-Hash: UWO55M3BPI2XPVOS2LDYC23X273HBHTP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWO55M3BPI2XPVOS2LDYC23X273HBHTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

Thank you for your help

> My mistake in example, I've used function syntax, notice (x) at the end, 
> if you remove it, it seems to build without need to call inline functions:

Thanks. I was aware of that.

Your example is calling snd_pcm_is_playback() with "snd_pcm_substream" only.
It works well indeed. But I will get error if I call it with "int", like below.
I don't know how to solve this issue and/or what does it mean...

${LINUX}/sound/soc/intel/avs/pcm.c: In function 'avs_dai_hda_be_prepare':                                           
${LINUX}/include/sound/pcm.h:506:40: error: invalid type argument of '->' (have 'int')                              
  506 |         struct snd_pcm_substream * : ((x)->stream == SNDRV_PCM_STREAM_PLAYBACK))                                                  
      |                                          ^~                                                                                       
${LINUX}/sound/soc/intel/avs/pcm.c:375:13: note: in expansion of macro 'snd_pcm_is_playback'
  375 |         if (snd_pcm_is_playback(substream->stream))                                                                             
      |             ^~~~~~~~~~~~~~~~~~~                                                                  


Below is the code. It is copied your example, and I updated it to use both
"int" and "snd_pcm_substream".

-	if (snd_pcm_is_playback(substream))
+	if (snd_pcm_is_playback(substream->stream))


----------------
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 3edd7a7346da..a4916342f715 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -501,6 +501,9 @@ struct snd_pcm_substream {
 
 #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
 
+#define snd_pcm_is_playback(x) _Generic((x), \
+	int :                        ((x) == SNDRV_PCM_STREAM_PLAYBACK), \
+	struct snd_pcm_substream * : ((x)->stream == SNDRV_PCM_STREAM_PLAYBACK))
 
 struct snd_pcm_str {
 	int stream;				/* stream (direction) */
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index c76b86254a8b..79ae6a5df9c2 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -331,7 +331,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	if (!link)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_hdac_ext_bus_link_clear_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
 	return 0;
@@ -372,7 +372,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	if (!link)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream->stream))
 		snd_hdac_ext_bus_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
 	ret = avs_dai_prepare(substream, dai);
----------------


Thank you for your help !!

Best regards
---
Kuninori Morimoto
