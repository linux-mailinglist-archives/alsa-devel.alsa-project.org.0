Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1D708C34
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 01:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF179200;
	Fri, 19 May 2023 01:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF179200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684451955;
	bh=QXiMj1Irj0854N+L/wMFeK93YKyZgpmVXIwdg/r6zRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oq8by24SF90lMNy7H6f0NnYkWSrlZcfuzYNJIhXg5ymPl3D0ON60e9t3Ccw0na8d1
	 fwN2AIuVWa059Xi91szmxLjv5G2kHiUP13PiyL7lmpSb5BF5kf3aEQ2iPkE3KP1Dic
	 uXlmUMZRoXJHlt9ZiVkrBCAqYqgd6966HqKVlhIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF82FF80087; Fri, 19 May 2023 01:18:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17913F8025A;
	Fri, 19 May 2023 01:18:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB8C3F80272; Fri, 19 May 2023 01:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56F98F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 01:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56F98F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MHQl2xo5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMYFDQ4ZroFCVf/BXvKL+7FyGDelcjb8CVuAyLKzVaP6t9T2QTbjP6m4gDEVuLlgLAO7a46mOthtMZie94oAjZCch7BJL/aQcovRXpyIY84QxV5dD+LoFg1QHTl1xkTpzvtKSpzx/cbm5YBhZdVdtmMw1LlfWys2ZPMi1nUryHFYtps9Mi52EOJRHOeDh2AysNS3CfaRjSc3drHFDBUMBfQtKvY5/INEkzaut2VHxnMANWV+MnY2vDQg0Rj/scliy2C2TBgenfLx4EGdBwDkb6N5QOKJ+sWAnxyT4tYjTm4hKOI0+9BAi4VdZqlWJVw6gL1+ugw6mQrmwV40RgkjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgOBog7jTaELW4GOqCb48Rk/QNpbgsTOzcoXnA3iCHM=;
 b=GZ2RfsPr9jF1PjY1gceIqUyPSkJubdiStIEuwvH6xoDbxpyrxsVTWnWlCwD9O+rzMOLxcXekOnVOLtA+6maRX+0MAfRGHVPioA/z0Hnn56sTPwwDnqkV6anoojw0Ej0Neqbz4dJ495Rm/pTrjVacvj4N8dvT6su6WcV9YbDv+KMyoyRHzgZDawOm8Cu4n4uE13h+stg/zO0C7x8+l+GaftruSw7Zt7bZql7JPqtaYFpEsbQnv9fe+mp/pIfL6zlcD0OcEki+1DrndwalbMINbbQVPxAc6PNWJ/WNLSZjcDNiS1QzRnCSI8L29S9c7Eba64zhavURzvZJjvvkFwfF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgOBog7jTaELW4GOqCb48Rk/QNpbgsTOzcoXnA3iCHM=;
 b=MHQl2xo5KuHbDetNyZ/O5JSTsJLt2490rH4UxIyceHS4EKuAI9DT/17+yM5BsbWkycKoeJ0ugCkI5Q0x4fv8mpYKMDPmd5L30NfTDEG/ZvZFuDqpKKtSgIuRg0adZIB33H8sSVknkm9jehM816ugU3XaZQdJVZvHcwodhiUUzpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10808.jpnprd01.prod.outlook.com (2603:1096:400:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Thu, 18 May
 2023 23:18:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 23:18:09 +0000
Message-ID: <874jo9mdov.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 16/20] ASoC: soc-dai.c: replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <43a183ac-544d-48c2-f9d5-71ca8a0cc09f@linux.intel.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
	<87fs7up4t5.wl-kuninori.morimoto.gx@renesas.com>
	<43a183ac-544d-48c2-f9d5-71ca8a0cc09f@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 23:18:09 +0000
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10808:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cae31a7-67b2-44d5-77a4-08db57f624bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BvIaBcjKTaGESgGUlZQFqyehb8TsetSUXGdC/wcHdBPcUe4MDT3Lftrt31okfrMY0JTgpxZnvfZ/CpUhSCS0v5R8XTthG+YLNaQ1TqWg37IJ7YTHWwmKDsQI+t3pF4HKXt/62UdUH4pw1Xx0DlanIF/LReC+68DvofoR/He5hNEO4I7pjlw8fwbAfIwoGf33p14tPv/RmYFc4K42R+M0HMaRYpoBA0dtvhUuT/Qt/pdMypuQpi+MIwwVrfKlLRpqxTXNSMgfs7WTpuU7MQUAShrZmzxvc06g52nWify4/A1OJLWZ7T9Xv2QtQKV3NOIZKjihCi1PfjpJPR6/PcGMQ79QN0mh/FsWYxIy2thtMeyXt1c1Z4VNuyLzVc89kXJWLb+ek2jjGD4F7vQZVvwoBnLUboghboQtxukWdtqjRgKioPoIi99DESNgIF831DwMYgQXFPToWm/kXv08b8aP8l8jdBwb4TEhJ9sPfkVTgmsYpSs9pPdgBkuAsPGy+hpOAED4GouWniTzwTgIZk9g2Vqe6X5vK+R0+6ZPeVpmTfpp3ZBLZ/XjjihCgbKJiira6iKkk0UgjYGDLRZKUpfqQPoQHItHUHyRycntCeH7hvor9RxJRoP+vacU1h+vyrAC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(66946007)(66556008)(66476007)(54906003)(5660300002)(4326008)(6916009)(8936002)(8676002)(6512007)(26005)(6506007)(478600001)(316002)(6486002)(52116002)(41300700001)(2906002)(2616005)(186003)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?odyyWhDGfH0nMeevECzwzbebY/TlcEEiEMrhtbS887rjREvm9MNpO7eXZqea?=
 =?us-ascii?Q?8GCUQWIJGf6/7m7Ah18f0tAjECg0xBT/7K09IN6ydh+Y7AeBoJTSOIb6GwHe?=
 =?us-ascii?Q?0oit0K1DbZzSn6TE5+ECLmGgRJCdWEa89kOg2wUUSnSaxBIZOJsprm0wPtRh?=
 =?us-ascii?Q?dHF0gd/fV/xyZplixBq8HrjSTutVFb94MGpMpctKdBtYNQooCDWh/svFF0Pl?=
 =?us-ascii?Q?GW9r1CwMXt1VDEK7P9KQIP9J5RqC4+38HZaC2h/W0VQTiz9gkPXtKQSvWdSb?=
 =?us-ascii?Q?oWcYP+HlTU5nlk01yECCI6mV8FV65zjD2zMiKrWR7J6zdU+uy8PtkGgmXPOJ?=
 =?us-ascii?Q?9QmLk18GCaVNCQYZ59LwFTqfxqGJgD4a7PLvQPpBHxWpk2FIyUTzkZ3wg/t/?=
 =?us-ascii?Q?ShF0wPai68E78KHXTGKGkvgVTFbpRPMJ019S94OyKfKj5q5cTTxx5fa1cqfy?=
 =?us-ascii?Q?senRxn/Rtm7Zm4LI0rvhxr+led5/3fcHbhyj6yu4siovjc5vTIIQM8gKJlxT?=
 =?us-ascii?Q?zur11Tg3n1fGrXO2plXYAQJ20wDQZMbbL9kuCd5oxooFhjjWGQkUfLRsz3bY?=
 =?us-ascii?Q?Ac5EKKI4h9EhxHau7O5RjqUrwnMHmQzxUl5mlYwm0C8m/AMMUL2Y74BULGgC?=
 =?us-ascii?Q?P5JxvwANeggdloyoKA/75qx7X0pP5upQzh2WSkG3rwCmwkKq5P8v5INhIv+D?=
 =?us-ascii?Q?7+UnAIrOI342tOoQUlev8JgI5rkGM4PmETSc4nI4DHstiGKdCe+wad1ol5PM?=
 =?us-ascii?Q?GVf6h4nQsLVhrwnVIl5lbCjPBGQA0ACTSIQ3BtQKLANRfp8arykZHoo/rEGg?=
 =?us-ascii?Q?H4qSNJwljo25O5iKNLNzNCJP8PnTUC1VLZq6zYkIyLFbDGV/+zGFKGLamfWR?=
 =?us-ascii?Q?Qp9kdoRP6mqWsSBx3jF1ZRJWoEGce9B8Wp0WC733uh+cahIJbf+srMVt/7mO?=
 =?us-ascii?Q?O17kDUROPfdHAGn/OzSC4EThG2IN+QmDE8g37DD7lohq0x48E7xi7kL1cA5k?=
 =?us-ascii?Q?eZC6iCzMdtDNraCDUtr3GfHBFlNj9tNlAI9VrjQhGyeTLQ6lT87ufv7TDerk?=
 =?us-ascii?Q?vNOw6gHCcumxiKPkMn5hqJskwiF9JtQGcww4skRHFV6kmMQvP9VYZ52MWfIb?=
 =?us-ascii?Q?8dihoYDdvphaOrrXbFyKgcOXpxeVe3zbvSiD47XvU/wurBgRlE66r+AxAP4W?=
 =?us-ascii?Q?ZjrVOnJCG9qXECCzJc5tQ+4RT6YZQ/yRvKmm8NziLD9MQ2xFi+3maFyaRp+Q?=
 =?us-ascii?Q?/U5BRXqLeyJsYfSaKVmQUDCFI8AhIV26kGifXyocQqlE6aAX8svlTRIUmOfj?=
 =?us-ascii?Q?CnVvLuSQlDh+pQMeNEKv/lbvViXOQqB1VqBSvXWDS0PlXTwhN/Yf7XkW1BA7?=
 =?us-ascii?Q?RAppJOCPCkhzVHwu+HVf89/V7wokB+S8/SNNsMI/NjvvZwPa1qXMqS4lvIVc?=
 =?us-ascii?Q?Ca93HuNDuk0FLkA4f0zgxRihBmvCOHONfd6hoLJ1xhofx5tdMHOpPG9sLZD2?=
 =?us-ascii?Q?KSAbKxb5NZYqVWVolxPvxG5iJkbGuggVL25LLc31QzbgOHmyJacJfV2+C2ti?=
 =?us-ascii?Q?Yu9cF01GTmkzQNz3YC7Y4VVVyx9ZmxFX4O+opI/NQrFXHC+zKYiHYDJWuY0F?=
 =?us-ascii?Q?OZ0wMqwY51xfNWwkf5d/AK8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cae31a7-67b2-44d5-77a4-08db57f624bc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 23:18:09.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r1cvA+RHA+eEiuNSEfebr/lbCEYgmHGW4YTN2Wdced0zVhApnS2kKZqytmY9+FG9htyWRmqwZFWe7rMxJxF/5H9GuoXX/LfzZV0RSu6lAvQ78dj6YD1BVoRC7ydnf3gh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10808
Message-ID-Hash: 2TFK2YWB5OU5G7FZ54YCZ5ONA3GZQCYQ
X-Message-ID-Hash: 2TFK2YWB5OU5G7FZ54YCZ5ONA3GZQCYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TFK2YWB5OU5G7FZ54YCZ5ONA3GZQCYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

> > -	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
> > -	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
> > +	dai_link->playback_only = !supported[SNDRV_PCM_STREAM_CAPTURE];
> > +	dai_link->capture_only  = !supported[SNDRV_PCM_STREAM_PLAYBACK];
> >   }
> >   EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
> >   
> 
> What happens if somehow both supported[SNDRV_PCM_STREAM_CAPTURE] and 
> supported[SNDRV_PCM_STREAM_PLAYBACK] are false, and so both 
> dai_link->playback_only & dai_link->capture_only get set to true?

I think it is original code issue (= both dpcm_playback/capture are false).
[01/20] patch will indicate error in such case.

> Perhaps assignment should be more like:
> dai_link->playback_only = supported[SNDRV_PCM_STREAM_PLAYBACK] && 
> !supported[SNDRV_PCM_STREAM_CAPTURE];
> dai_link->playback_only = supported[SNDRV_PCM_STREAM_CAPTURE] && 
> !supported[SNDRV_PCM_STREAM_PLAYBACK];

Yes, this is nice idea.
Will do in v2 patch


Thank you for your help !!

Best regards
---
Kuninori Morimoto
