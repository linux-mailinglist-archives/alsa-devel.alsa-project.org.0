Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3C71527D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D54B520C;
	Tue, 30 May 2023 02:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D54B520C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685404943;
	bh=YNiYzjDgSBO7kkY+2qlAOfi8XFhWpaAI05zJyio2bHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QXzriu3vCzVlupCcZn/JxNbene7mwhhj5kZNF3/SzBmkiPDsuS6QgaFQ+jATM/Xtb
	 sQNZiRqquYfvyyj+RFThgO/1tWaEFLNHN01rRvacUOv9nO7Oj9JrIycKlhcQhqq/Y8
	 0Yp6jAYL1VW061JL5EYsWjdDyf818JQ7dQ5bejdU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EFABF8026A; Tue, 30 May 2023 02:01:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71404F8026A;
	Tue, 30 May 2023 02:01:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C793F8042F; Tue, 30 May 2023 02:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0C6BF8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C6BF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fFTklyzT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ak+HCvew3YYgXrn0fwFp7t/veTwPFqTIKGjO+K03YtsoMzFYWj0HoNdjuRfbb8QIONYm315YJJ70DZKznuMw+3nppuzZnQvBIc/z7SiAdsrwV3OgJlS+2Dpdf78GRjHrK02mx6023wdUD3P8tSobkEL68qQ2qVlBAX5O4p4oGFhBXm5Zup/WEHGxB1vat13xxpsLa7vt2BMTlZFB0MxaJfpmEfBiJyTvjv2WP92nLVWqcvlEOkssQEw7SM3uV9TsBNonz0A6STtDq695tygh0KGcHRQDpfwFfZPL58fbZx/5UEWoEMpGF7CBXCLNESaIi938ft1bkbSOLAZypuKHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK9GdP3oJ5ht1BvAI6UqZa/wW8bGjDUn4Z04dFAwW/g=;
 b=h1xrQvKUdDbj/7qJEMyDeWxAV4NGtYC/mnEdbNCSv4ofIl62gMvgU8BPXiz0AB95Zi/gsg9CnpRdp7HMoZpQDc/CVjhq/vwPjLRrfCZLxNVyAEDLoWkCQidcDf6bTbH3QH81fvn2TOx/KFC/8TFxyrFSgI7gNPNUSCO0HvWhcky+LoFYlgklCt+4xyduOKv3oOMdQLqn5t+E7ke1ELbpVfbi0et/nXQ6irzKICC/vPhDLzOB1rCCRoycxPDlwin+Pa+vz5OqeSb2Mrdm4Xr41WnxWc98HrGQQVd1C2cBmmGraxYyxooCdoByZGd+8LnbIiB/tDYodF101BB6DQIgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AK9GdP3oJ5ht1BvAI6UqZa/wW8bGjDUn4Z04dFAwW/g=;
 b=fFTklyzTFSfYoYMM19jgT1WrPv4D5yCN4Gcdy1ZmwDuQ3M52tHXY/pJJzwWP8TmvK25XyfMbKhKrdrcVg3RKfIeQgKTcSTmVsy5HzmVL7/+7aG8E+T8sG+cRWpVgukbpEEW5kr3RMdZYmUFhVZOEbKaKvurNDgil7ptcSwUgJig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7890.jpnprd01.prod.outlook.com (2603:1096:604:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:01:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:01:04 +0000
Message-ID: <87353e1ydb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 07/21] ASoC: soc-pcm.c: cleanup normal connection loop
 at soc_get_playback_capture() part2
In-Reply-To: <87edn0lzix.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
	<87edn0lzix.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 May 2023 00:01:04 +0000
X-ClientProxiedBy: TYCP286CA0188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: cc510014-2973-42b8-f4ba-08db60a0f669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5z83D2AAFuRTinDi3afsTrPv0FWfnK4qzAe9aVSMXzsqaEU4ZRvrZa/wGcQb0CsXCurHw1NiJ2lN2ehHZ3CtGLBmwWRBX16YPb+S0yxV/7eEliKWGvTYXGbDu/5dAHNcJ3XLxCCfjIAKF4lddNf1y+y9xWleuSwBq9y8Gu2J7huLWbrTxJenUrTzD4Hb8iKFXV8OW9i3ZhRia8SE64GEhqfha1LO/Owv2vJL0hQN8Z0slskhZjVdrA7lcWCZke7F0l7c7ASpz4I/kk+luBf5fi8JoVCdzsg4bm3/BkV5VKXSySsiotOY9OoBMin/a2bwkXofzZHjpFKjl92njV0bbo/+KrNFoEmPCxEaJyStccQ/Z6jWvN97pEO3vZ34kwKmGKGaMx4HZuvv7YVvw54bM+BgnyDGwxqZNlSYsxht/OgztnG1yI7o++OcpEMVYrspHqQ+u35leeb2uFYf0yfmlSS5ofoVc5FwflENrN/NNJz9GW300NhQBWpnasvGMce0VWkItjFLU+1spdBbhM1cbJG7I3EXfWAv5jpD0zLOIl/dXfwKgjBo1zGWkx0ykqSBwjgNFsd1c61+ePaBZFywioocLWVgVQGaLj2jkSpdHtyC+QHzoYQVBrsfacvwQEWA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(478600001)(110136005)(8676002)(8936002)(5660300002)(4744005)(36756003)(2906002)(86362001)(66476007)(4326008)(66556008)(66946007)(316002)(38350700002)(38100700002)(41300700001)(2616005)(186003)(6506007)(26005)(6512007)(52116002)(6486002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3cL9dr2WbQSHljxXKwhD7kSUcmpWhneVDZTr9K156jXSxBoPajuNIq+doOxM?=
 =?us-ascii?Q?e0Hl+8CSENsMvUKProLWrze9lk16qCBktudSEu1MUt6brUYpZM58c/xLVuSz?=
 =?us-ascii?Q?QLYaXlW7jz4qz3rphcE2mtEqW3yvfc52A7AC1uaP5nvsBCARS/MYEPJ04S1N?=
 =?us-ascii?Q?siWHLmfkIS2Ilykafb6gknBmv49NpnGIKI5PjmjkI1NSMvBj9tnDtdK306+f?=
 =?us-ascii?Q?Y4Q9pnqPcVBoyAPObs6sNbEyRFvLIEO9t+1sP3r+5PPUqa8BmGd8a4t7dyX3?=
 =?us-ascii?Q?EMeNj7VG7Ia9uzvuyYUT1IBR6aSoBvH0F0mfurcqcQIwOdQgojJ+HcIGQHC7?=
 =?us-ascii?Q?ipZRuC/YQsgHdhdjjLPGsLkV0GlHJFXx82nWjQSBHMPpzRHhH+HZUiEctxHW?=
 =?us-ascii?Q?57OLtQB00x4gHvxkiarS6PkQdjivupHfG+waCDBFvkZ76vL+TdbG7HNHo3bu?=
 =?us-ascii?Q?R42E95B/L/gIpmpOJr0b12xJnH70n39JTlVUrG2P2BZ/w5bPgbOoIxhKF1G6?=
 =?us-ascii?Q?s+ycPseZOwGSNSbvn4ombmagiXSYKWpSnyjPfdeNUgxTZ8wWgKwxwJP3oeo+?=
 =?us-ascii?Q?NmHZGaOvg3KC7zfgwrZWG1H7jsAzdBqeibe7h7Z83aaXCRClwbTSJ2VvEvWc?=
 =?us-ascii?Q?1ZD/8HGBCyDKBSAfOFJ389TCoFyMfatmKgFxZbaV0+31FCMKjea0dUgaJqzN?=
 =?us-ascii?Q?qltnS9W2nF7ZRfvxsrrT0jsxcSmd1WBiZTnleTMos9jFunO9p2BPzLLmGBDO?=
 =?us-ascii?Q?L9bJEb+GsBjm9xnc8sDstJEMOzakf6bwbp1SLu4LGuU7pkUdmicBZ2dUz1ph?=
 =?us-ascii?Q?cKyK70SXDNZjyiJwwhJdMYrD3T/eOBvmjhau16JHLezWfsV3ZIuAi3jGUIvO?=
 =?us-ascii?Q?hA0aWVOzQUbmxtpSSeN62+wGgJQ4j4xSsaUKU3DEMBdejdGIxsorw5eZ04gG?=
 =?us-ascii?Q?vpyDwj9kzI9eCG6nUfKmq5TJMCdgRSIU1E0uL8gTewkez4QizogVBLAIYUy6?=
 =?us-ascii?Q?chBbMRrFvTfze+Jv0gU1nFeRBZlS2nbMfH/y16BMxaSdj3CqNJT4RbN/Sa+D?=
 =?us-ascii?Q?yfSFutdmpMl9597wCzMEJcWfv10VKTWT9sY6J75LcD+fU9SDnMbWuivKhKiq?=
 =?us-ascii?Q?L40AGb8h3C0iT1qSkdzM/rFvYHnvssguHpAjLVubhlLNNybSoGP2MTH3v+Eq?=
 =?us-ascii?Q?/r+GK/fjXIZv7W2efDuPRBEFXT/lOcgU+X44W7mdDsFvw9EG1a42TTdzbz0Z?=
 =?us-ascii?Q?d2YZ5Ixzxj/NqYiNIKzfa8mNoqi/6x5pfWipqwmQh7U005zbuuXOt4n9rNjv?=
 =?us-ascii?Q?ZG3vS0wYKR1kZmcPW7AxjWYzsiV61gCSDkrT219QhlUtlJRIaUpqMeKolYma?=
 =?us-ascii?Q?/QPNoZ803jkaX1L4keULdJqCIz5tJ8tc+vdgWsIxuqkzTYzD7DLWTcV/d0ip?=
 =?us-ascii?Q?BXdlpQi8NNPvDw+cIIg5MZOyt5fgBRyUo1EXr08OutSwg8xICHlmU4j8yPPD?=
 =?us-ascii?Q?ATCat3kgwpW1aaKyaR+LhX2Q1p76EtQDJNVK2E2fjsXzKRQ+2raQoVwuyH1K?=
 =?us-ascii?Q?3XpnHMpXP80vJgPqkDeEYg8QhgdmGaIxvjzp9U5ueLmTlRfV61WrwAulgLXF?=
 =?us-ascii?Q?shESl65eY9jLn0NVwmrUiPk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc510014-2973-42b8-f4ba-08db60a0f669
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:01:04.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 i1PppUxSWbztbt4xSXysoFapWLWtI0HHpeXoKLJvqKwblJeptV/5w2qZWvcLlACNu6uEqvu3lTLosuGAAqmG9JhwmzGNCcC3NnnZEV37TDnLjUN3xNhyN8mld+BE4DW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7890
Message-ID-Hash: 3D4JHXO7DVSOITF2YE3NNZWY5TFHF5ID
X-Message-ID-Hash: 3D4JHXO7DVSOITF2YE3NNZWY5TFHF5ID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3D4JHXO7DVSOITF2YE3NNZWY5TFHF5ID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis

> @@ -2795,11 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
>  
>  		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -			if (dai_link->num_cpus == 1) {
> -				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> -			} else if (dai_link->num_cpus == dai_link->num_codecs) {
> -				cpu_dai = asoc_rtd_to_cpu(rtd, i);
> -			}
> +			cpu_dai = asoc_rtd_to_cpu(rtd, i);

Grr
I noticed that this patch is also wrong.
It doesn't care CPU:Codec = 1:N case.
Need v4 patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
