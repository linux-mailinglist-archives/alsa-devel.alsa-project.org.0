Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A272D552
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 02:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7952220C;
	Tue, 13 Jun 2023 02:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7952220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686614789;
	bh=zWXfgQqHAbtPr//gWeS9UhEomyW+AtCvJ4nJUPgP5wA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UrT/ySba4AuGajfi7e1f8aDz97h+NqatBqMpkOOW0k9y6qyLHKHZoJiTVe3Z3z78b
	 CHSNiNeXIVvcANyUrZ52PIxtKslWfj8Xs36n0VooO17+dyMagwsQ16oF9dXvtbkD1C
	 /YvmLDxcoiwQm6KQAOqS0UemmGMJzOERE2PrOjMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EFE3F80149; Tue, 13 Jun 2023 02:05:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A506F80132;
	Tue, 13 Jun 2023 02:05:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B124F80149; Tue, 13 Jun 2023 02:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5564F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 02:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5564F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QR5QIMgk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAHBGvpCeGU1yurTaGVaBb3Ui6XCtq0oNd2BBokZxfnITwqciE4RZBgFSm/PsCPPYvwdgZ2rCdSbsf6qwJ7SQOqZBO9r4PWmAp4ELsW+iRD/XLXzBsGORFX2yiaXPSgTJmjIHDj2GO9J7qDsmHJceRAfEPwpAIszXh/cmxJJoWeFl+MWB6mep7tKx4VmNBjYLzLwWjry73vRcrG1vb4U57gvOpXzWAFDWOwW30h3M1hWS2yrqC2E8do9l5F0qQj7Rvih5ossV+6Sw+8/qmsBy000LsJZoDQ2jJQA0P9hJElF7PkkPB9Q4JtJfsePXpjblc47xUAY9unoF+7v5n+R4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yme2ckdMBnuIPDjhej4NZ49RR0NAwT0bFhDD0cWzaRs=;
 b=CQG40PTJtQu3wsXKavFCD4GuFDgkpXV3EZEOMBQQicQSXmZpjpIYrdrgRfymvaTjvWPVCGA8oZgXoEdfOhKfrP88JZBpy467x66MEB5RlUiD3dM5Yhgdtr1tLRbzulhA6IndT3z4nFNX5vODS+JJqFj/urnDFKp9q2q500Z2tjtTeJvcCg7e0NvUqxSGVzA6O1iAeNadfYl606XyZCPJSKAsyTsm+JBtjakkkE533/Zvh9W6amdvKdfNAikbS0eRQqXdnCtigaj8bZCh4eYfgjdv05khVv82nWnxzLfi/z9SyTmTDiMxy/TJVI11FTqCFg3MjXfSgaicb2mFXBagRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yme2ckdMBnuIPDjhej4NZ49RR0NAwT0bFhDD0cWzaRs=;
 b=QR5QIMgkZJ3wXKh7amBvcO4ZfGN0XegXtWJopoJCm1DWMnhDcEOUlUg5joCqAECEHWvgRCp8sPCUBExHBBBaUKUcPeFwDySMhJ+Fj81sXBqYLpB9x8LoHUFWranZ7XsPaePu/z15fwHTWm1tkWTc7m6eHzN0SkSjcEDoYlRD9SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8335.jpnprd01.prod.outlook.com (2603:1096:604:1a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 00:05:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 00:05:17 +0000
Message-ID: <87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.de,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: Re: [PATCH 1/2] ASoC: add N cpus to M codecs dai link support
In-Reply-To: <20230607031242.1032060-2-yung-chuan.liao@linux.intel.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
	<20230607031242.1032060-2-yung-chuan.liao@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 Jun 2023 00:05:17 +0000
X-ClientProxiedBy: TYCP286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: fb25c035-de21-4a39-bc3d-08db6ba1deb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7uTGWeR2ccTxq7A7jV9IAJRKZF2aN3h0Ujsq0WcpaEUkSQlgrAM8exFVVEb2eqeymjI+NujBShX82ODUbius0w9yoEF5pqHlCHNWeW9pcjdlBhZY0k++Di67Sc2RSN3tT9tz5ZvBS7vs9DngyCHj0wmQ97Si4gXhWeNzSwMd4yqirpeR7HQxthlt2FKACrHUrFwRzpEY6HixLeacnypXId0mv2IJbtjUvUjiZtkDiDIyRqgiT16tSRMOZ3R63xI+O5ApjIopMwFR7pFgP2plmAewAdCsxWiIPdt9sEvoooVGi4SfOqnQz0moJsQ37iIl4ZJskPbfp3IL2gFN8qCdw2nycgvg3DFHzsSQYAgw/+uNE2xUcL+3+pNdGfvGI6IfrJO3PxjUqw+tJW7fM2+nhIiC6oLkR1R03CQMP33HlaObhvqIlH4cglZPLE9gsik2FWPKnrS2EEuJq+6Iold36aINVeOy/Reuggssfq6SYXBcVIhhY2A2WPT07ACOu2q/dLlppG2eFQXYhOwsiWMo1uhcpj5O3Qtf2XnmDuuj6vlumxdN+5R8aVtyTGsEEAJVLA+JhjHxp5+yNKKF4X0qpkjeil2n4Li9OwFtxC69Ru1/eN836NTBpT5cJ2Le5246Ox5fyhK/ru6g6oOMfuXLBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(186003)(6512007)(6506007)(26005)(38100700002)(38350700002)(86362001)(2616005)(2906002)(36756003)(41300700001)(52116002)(316002)(6486002)(6916009)(478600001)(66946007)(66476007)(8676002)(8936002)(66556008)(4326008)(5660300002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hBosihyC1JtkX0nCV0KHWRgl2AJsLh5U25HJpDCAUJcTc5z3nrxncGYBiwKB?=
 =?us-ascii?Q?fsHrIs9+cDmSDtG4aJ10PJaeECATlh2vfcCF5SZgsrm84xiiGbsAayXh4jB8?=
 =?us-ascii?Q?NeLS9ctQrHQ63AiliGbUVH88Zj2hVthGcnQM5QrKjTPJ7cxgNiRvTmdfsAMr?=
 =?us-ascii?Q?L2/MK0nmthTbWB7KGoC6BmIPQrN/F8Vt7OIVngECMgio8d/5EPwLuENUKnKo?=
 =?us-ascii?Q?OLPNfTIm+ttm9FFsa2Z+Ey8mTx8kJZfyGTPcw5qgNA/dIsNLZpn1LbJonsEb?=
 =?us-ascii?Q?ExwNCslTbkPSOmJydlprwMId5w+o51lVTLSYefLS/10kkrXki9yiTihHqiv+?=
 =?us-ascii?Q?9NGqwF6piwZ4TKfyo/zFqRT91n9/DdwRHGsvzpeOdcgEeLAW5t+LI9YVAFZN?=
 =?us-ascii?Q?BvBBh5ZI8+4Dl5vSVEDoWkTM9Eokao39noQkvZFeyPa+x/lyn4mDC9L6ypDE?=
 =?us-ascii?Q?gnn1CxJdvvJ32f3HDiJT0Se5McEiE2A5h3D9Y+tyoX8Y5v8n9wABBlMGMKvp?=
 =?us-ascii?Q?v5spJRMGi75umLqjPK0hotQH9YiTxOd8IIxnwgyFdD36PsAJuSk1EpTyjodE?=
 =?us-ascii?Q?jKL+zSmNs8Pfj5kD6QLUrFS9CtFzll6JtHFrkyLNEI/6PvnmxTfP00pm/0jW?=
 =?us-ascii?Q?c/+hK4nzSmqclHpN/yGXubLrZyoD5/JHvjrBRrZq6t4GNnfOeX9oBCCc9snD?=
 =?us-ascii?Q?BgD9hOj4wUkCzKvfRkI7CG9vOR0vGB7Lk1Ok7tTrLW91RgoKKFnUDvCAOdUq?=
 =?us-ascii?Q?r8JjS3wYHuXUl2zl9L97P/b3pBdIcU2JO/pDkXoeguPSz//X9hKxQ3/X3mm0?=
 =?us-ascii?Q?668wmxwjOH0a9xKDq/r35pXdPNpEUPdFvgAajEff7JkrsOw0guEufw0/IWJx?=
 =?us-ascii?Q?8FfZNZkxXWLlaTQtV2PzI2ymL27c9uKVGDwsK7PdYZw8zUHuuz9hc806lzNf?=
 =?us-ascii?Q?eyfcPm66KS7Q1M4foaVVMVojcYblLFf3RutilEiQpNAZZYpTL03HQ+Ioymmf?=
 =?us-ascii?Q?EggZzaXXBnQK2wOk5NRUPkhk9YBKrkh/yQBgah5g1W7UbuQsG/uAGqfhWpr6?=
 =?us-ascii?Q?3tqji+YGUNet2o0Nj45O4T0xE7KYJkDPemvqVBeXpAecMv8B/PxdCjZr7aVH?=
 =?us-ascii?Q?4HQo1/9RSyZMWFIY/CCncUBZNMp7pprH5sOlwvLDcI1SHmo7DVHWhwv0cNuo?=
 =?us-ascii?Q?x+EId8sM8v65eriDQkWkhTNvH84UpDZ2TQWWjZUez+AdjX9TUHA2cLmMv9/G?=
 =?us-ascii?Q?BTlLZcvG91Pljq522DmbRc1dzJ4QMqJP1mJ/aGnz46yYVoLg2nsUOf4eeYBI?=
 =?us-ascii?Q?PZhc/d5VJB7yTSaiBckWqVt9H/Khbr27Wpy3qRr6/n4UvE5noxy8h/Qmy4uF?=
 =?us-ascii?Q?Em4Ll8zhgZ0+kqZ9nhACeQsHGZ0THu7s23eKVAotvWGKBGOHbYO/x/xV9qAN?=
 =?us-ascii?Q?bik+A2KvRVv+CMRJf2oD7vGxwuuDIgF48iHjmIBKWYuvGc6HPMJBSeMs/wnD?=
 =?us-ascii?Q?zBaDoG9Av6utTIzqmlqe4k7x+WPkDICHkq78LeyxYmZ/sc6W1i7lkB8LUQl4?=
 =?us-ascii?Q?bmdkORRjT7h3BxUYh/CPFLDOXoXHQOg/dwrPvxnyPLQXb364ch6fHcS+poVM?=
 =?us-ascii?Q?nCzYQH+E/G/xqVk2GHJCAoM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb25c035-de21-4a39-bc3d-08db6ba1deb5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 00:05:17.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V/URkxQJA1zUlDSVDd1m10c3vx6SG08wgKTkkBRBjiqcMu5iKu5wuIZS+WbuzfnVoVDi7G1cDoViulL3JBzXKPisgoeyt0lDloZEdBTCrZo0JY4wS75qLWdAGUY1OVVi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8335
Message-ID-Hash: YT3DREJDUPDNQMTKCQEFVTBR7PT22A6C
X-Message-ID-Hash: YT3DREJDUPDNQMTKCQEFVTBR7PT22A6C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YT3DREJDUPDNQMTKCQEFVTBR7PT22A6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Bard

> Currently, ASoC supports dailinks with the following mappings:
> 1 cpu DAI to N codec DAIs
> N cpu DAIs to N codec DAIs
> But the mapping between N cpu DAIs and M codec DAIs is not supported.
> The reason is that we didn't have a mechanism to map cpu and codec DAIs
> 
> This patch suggests a new snd_soc_dai_link_codec_ch_map struct in
> struct snd_soc_dai_link{} which provides codec DAI to cpu DAI mapping
> information used to implement N cpu DAIs to M codec DAIs
> support.
> 
> When a dailink contains two or more cpu DAIs, we should set channel
> number of cpus based on its channel mask. The new struct also provides
> channel mask information for each codec and we can construct the cpu
> channel mask by combining all codec channel masks which map to the cpu.
> 
> The N:M mapping is however restricted to the N <= M case due to physical
> restrictions on a time-multiplexed bus such as I2S/TDM, AC97, SoundWire
> and HDaudio.

I like CPU:Codec = N:M support !
OTOH, I have interesting to ASoC code cleanup too.
So this is meddlesome from me.

> +struct snd_soc_dai_link_codec_ch_map {
> +	unsigned int connected_cpu_id;
> +	unsigned int ch_mask;
> +};

If my understanding was correct, this map is used only for N:M mapping,
but we want to use it for all cases.
In such case, the code can be more flexible and more clean.
see below.

> @@ -1041,13 +1045,32 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
>  		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
>  			continue;
>  
> -		ret = snd_soc_dai_hw_params(cpu_dai, substream, params);
> +		/* copy params for each cpu */
> +		cpu_params = *params;
> +
> +		if (!rtd->dai_link->codec_ch_maps)
> +			goto hw_params;
> +		/*
> +		 * construct cpu channel mask by combining ch_mask of each
> +		 * codec which maps to the cpu.
> +		 */
> +		for_each_rtd_codec_dais(rtd, j, codec_dai) {
> +			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
> +				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
> +		}

Can we re-use snd_soc_dai_tdm_mask_get() for this purpose instead of .ch_mask ?
May be we want to rename it and/or want to have new xxx_mask on dai->stream[].
I'm asking because it is natural to reuse existing data and/or have variable on
similar place instead of on new structure.


Maybe I'm not 100% well understanding about CPU:Codec = N:M connection,
but if we can assume like below, we can use it on all cases not only for N:M case.

We can have connection map on dai_link which is for from M side (here N <= M).
The image is like this.

	CPU0 <---> Codec2
	CPU1 <-+-> Codec0
	       \-> Codec1

	.num_cpus   = 2;
	.num_codecs = 3;
	.map = [1, 1, 0]; // From Codec point of view.
	                  // sizeof(map) = num_codecs, because 3 > 2;

In this rule, we can also handle CPU > Codec case, too.

	CPU0 <---> Codec1
	CPU1 <-+-> Codec0
	CPU2 <-/

	.num_cpus   = 3;
	.num_codecs = 2;
	.map = [1, 0, 0]; // From CPU point of view.

We can use this idea for existing connection, too.

	1:1 case
	CPU0 <-> Codec0

	N:N case
	CPU0 <---> Codec0
	CPU1 <---> Codec1

	1:N case
	CPU0 <-+-> Codec0
	       \-> Codec1

	default_map1 = [0, 1, 2, 3,...];
	default_map2 = [0, 0, 0, 0,...];

	if (!dai_link->map) {
		if (dai_link->num_cpus == dai_link->num_codecs)
			dai_link->map = default_map1; /* for 1:1, N:N */
		else
			dai_link->map = default_map2; /* for 1:N */
	}

We can handle more flexible N:N connection as Richard said

	fixup N:N case
	CPU0 <---> Codec2
	CPU1 <---> Codec1
	CPU2 <---> Codec0

	.num_cpus   = 3;
	.num_codecs = 3;
	.map = [2, 1, 0]; // From CPU point of view.

with is new .map, we can handle existing 1:1, N:N, 1:N, and new N:M (and M:N)
connection with same code.
This is just meddlesome from me, but I hope you can think about this.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
