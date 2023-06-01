Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494AA71F6D2
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 01:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32D2C3E7;
	Fri,  2 Jun 2023 01:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32D2C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685663208;
	bh=zIi9NsNuWmEmINMis4K7HNqmIPR/xa3/ernISuE0VCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n82huEQ4NbgZdWoei65ESVpAe4uJWLbyyabg3ty7KH/EaJ9lw4AqxtYelrnL5zTsm
	 M1lhV1hR6jk3Cox9fzIb8e46m5Sbf1rA5260SaCNiKLTFqHWuCLlLR41xsbrHJgFFb
	 fPXQgtsOc/jd3yb9Axj9PTCn7VrGg7qagy9SXyao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7328AF8047D; Fri,  2 Jun 2023 01:45:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9EB5F80132;
	Fri,  2 Jun 2023 01:45:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6001F80149; Fri,  2 Jun 2023 01:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A36CDF800ED
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 01:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A36CDF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N9GiNenJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eX+ZSm8iml9gXRMrNuPyIO/SscLKP/X9YjLM/Fw622X+zLtS4wjfRbv0DuI2Wns7fXKR1pz5oKNF2koulKKQ3HdBEWkMvFlR8gurWew5a5/neS1eiEVOEMBQw5LwHApkHGDxuvNXn2NZdwxGReDbF+LvUHDSF37dsvzHjNdTBd8ohGFQIuH/9l4+oYdBZP0NjSNTOGtWJ2W7qbaMV4HQls9mMwGgRqBpZdoLcezarXkRZ1CIddGX+jJdlG4XjgmXuu5EUOJRudxXyXzKjh7MIfIV2DyEAnZ4Flu3kMlci5dG+ya7dHjWCzDHhDaEOADd328CwkeH3xNMKPY95ZICKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUnVn2TuAR3icT+ec8dq/tu6BVpPjxDR2lJaXFgrIP0=;
 b=G2UQEdG49OCVzDTzAitlpHwChEck2cz7XyvsKlmc4dBn5vKihrP390DJyxNtaLkQUySMUgmkzeANiX49AP8lAiafYzE97nUNSL+9Lt55jd6KycQ4X3Tnryp6vcE2z2y3W6XpJVoIyvg/TDLeJGaG/yF75HG9Zb9tHM0xoRPUtxMQZ5DMvrqXb1WDcrYCb2KI+wFLqeMz3I1bYsGfZoPDeG88W2ipwUK2DdXhBjCXEuwOQz+GI8NrTJLzljAleS5HbxvWzIef90StxwspT+7LMddAqhRIpG3+IJfo+HMUKwWMaS5GEnNCdL+axvPJ8df1GOC5JUeafcLfe2KqCJ8e9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUnVn2TuAR3icT+ec8dq/tu6BVpPjxDR2lJaXFgrIP0=;
 b=N9GiNenJV/tu3fe//u93tw8GPRiABudRdvmi+IBBMVtdv7iB8I0eyItyUi4lVL1qgAFFWoKduvIySlMB70NWTN/lCrl0UP/qpzjgO/wt0wFyaPcFIv93dJrByO7kU4jFp1LktzNiQ+5J9msHm8JlB9keAcJ+CBZx/120lkhtqGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5631.jpnprd01.prod.outlook.com (2603:1096:400:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 23:45:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.024; Thu, 1 Jun 2023
 23:45:32 +0000
Message-ID: <87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <875y8fx5fy.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
	<ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
	<875y8fx5fy.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 1 Jun 2023 23:45:31 +0000
X-ClientProxiedBy: TYCP286CA0245.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ab7fbc-ef72-4e5b-3ecc-08db62fa4990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/3J+T1sVJPT8NBhzPootNJZ0K9wxP2gOUwdGAbiOd8omOxz12sZZK1rwO6vSqSpNs6CQzx7R3LUBARk7QKT+CfXZdoC/3f9sM5pv/9iKUnjnQ3GMjMnzKK9JAPzcYgkOx5ffiOBoY4n8FEgUcVxbgOzEbfUFSgoLUdkN55zuTxQr9YhKxKr5uyYWVf5Jd/ddO5rWnpHMM5x34cqqsmi+YIrvwkCJLzun3FlDHr2Mr1wD0tNSef4tcE4T5508+bsy7uoAl3gfmi1BqJ2mFGKPQPPHMV13yj3WulMk4i4f7rOeDAs/d3xebTxEYGNcIYZ82IMaeA4wHIcYj5jy7vu3XX/MU3c7wiI4jWpFYNvRVzNLy8UpnbLEAV6rgptLPBA1sEa93Tba2m5vSKlYgxsi9I/NqoXayHzaxlubZbplYCUaHvhRriyyHts2SKydHT2hyTP7TPF9izRNfomZPDDSc1LAeZhJNTSyqPk+zEqbhY/MHl8bcfvmmkOiAejhCUFg7unEpRqST9AhMpdtgtN0xC/kUH8GdBbQr7ptRH6WLDndk6N05IiSrhpWAb/10fT8/D8lyfx3mBZ+kzhky3XbqQbYJpi25OdFsJ4ZhVzPhwp1ZjsHFrSKcBwP0GBq7X0l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(36756003)(38350700002)(38100700002)(86362001)(8936002)(6486002)(8676002)(6512007)(26005)(6506007)(52116002)(5660300002)(41300700001)(186003)(2616005)(2906002)(66476007)(316002)(4326008)(478600001)(66556008)(66946007)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IgBbAjENeJWa3brcm5/admyfVVBkNPEabeD/ivDOe15SOsfaI7X0FcLqXIlU?=
 =?us-ascii?Q?FFbyXGiypXrVr4tDhxKu54lvgonQ4lVROXUehJs7m3anmFoN7pyGLaPjzSkF?=
 =?us-ascii?Q?iw/jqpcueI563YemEJnNqdKJ4pe2/VQVTI//7FmSa30WJe9204wz9RdlJwx7?=
 =?us-ascii?Q?wUtQmtbgNN2X8eFDOz+SPmfPXFg+6kDAmj4nMZTuIj/SJzFDAaQZ7sGC8Ca7?=
 =?us-ascii?Q?dW/6kkj0tWuN85jvo5ZbKuEgbln9U+M3hT/rjxDiPZ3rx6uT3c7lb6zPw7Uh?=
 =?us-ascii?Q?6dsf2XSyLWRPZKKVKMtFyg1qg0T/cfZ0nSsMkpYgblt1bNzXYaOk0oom0GdE?=
 =?us-ascii?Q?DVfjk0jevgUQaHbQKbmKaprXd0zwC+esTuzIoYLiRe6H055BPluaGKEr2YQt?=
 =?us-ascii?Q?1jGk3V8yrQxVlX/GVtBZfeb4GiRT8Re/eYJF5u8rQX6kcNPY61YQA+7/0Z84?=
 =?us-ascii?Q?LbofkAREdXYvqlaWEbdF615w8vMpznxeRPfYfTbrSCReJhujXDKLjw5vjPrc?=
 =?us-ascii?Q?ZXem3Oxa50V5BmeC2U/cxZegQx1IRuPce2KUIxf7BzqUqXlxh4e74ARgEr7p?=
 =?us-ascii?Q?nJnwlP88N4QJINcIh4BXYs3FtLputUS3pOQbXuLbE5mW+iOviWcceIl7lHjb?=
 =?us-ascii?Q?qoXO7R0MuO+ntDM9JJL+Z7lyyDrYiHvd4nBNN5vVGSpAHYo5ImtolfNZcbzM?=
 =?us-ascii?Q?KatfFLjFIT2wBWaJiN3VM2U2BM5lBIgYgQvVcBCirlW8udT4gAg2sIRX6ca+?=
 =?us-ascii?Q?pStFtHwmb/acrMEtfzfXj4L1UurkXKuCK4m5oRMXkwl7CflGbzb9FUq6is4Y?=
 =?us-ascii?Q?6Rp8/45elqM+gRhT0IdGmxOc7m7+eWWfxaVaUhZtruCmTjUQD5s1WrX/Xncu?=
 =?us-ascii?Q?75F2VpQqDF8SvmfdG6hddDY11gA4vl1GyoZaVVZsH7/FCxZ3JYxrCuGNiGf/?=
 =?us-ascii?Q?cl5ZylpX9fHvzw7yFdvOCs2fi2Sjo2G7QIpqxOq29Kt4uSCHjZ1DV0FoIRQA?=
 =?us-ascii?Q?c4XamqkbfWc4leUUocMLGqK2Y/jf5Qw7xk6tXv0Qaot8erDkeXCWjHxD4ugK?=
 =?us-ascii?Q?b+9xFNSUwi3Qkx/0x5ROYXChOS3xA0CN9Q1X2tPZwb4VFWFyyhTzkSRzMWWq?=
 =?us-ascii?Q?P0wQ0puRM6+DW1Z+j9DP3XRRHyt4wY2Y7gAg23LuFph16+BdJrPpGwQkK7OI?=
 =?us-ascii?Q?1fJ77hrclZKHqzUQjuUcWp/thydQQwzja3GxqQRN+SB1Ag17LaLRvPQnXTSg?=
 =?us-ascii?Q?1AC3/dtdLpeBZfipNJK/DNRQsAT2v60ym8pBs8Qha7s79KpHTktjJYhzK2d+?=
 =?us-ascii?Q?1pLHGs5CiTv9o81nBqui4N4P9r8ZC5YpxcV+l/NwMf0BMA5yzjBFHoHychcT?=
 =?us-ascii?Q?jzKGZ2b7fopZts+ry5UR06Ga+plJpEj3BSFbPILhR+cH7275ekShaKy3FInP?=
 =?us-ascii?Q?9YFHiPYLnAMXLkEdwo1p+4CW/BgA7TZ8jHCCvxJINrb0BevzL5d4HfLJtLe4?=
 =?us-ascii?Q?+mrP9vs+sNjH2PbgwsFnBpO2UXkLmpXqJwc7etaDycHeJgMwRJkwVznD99La?=
 =?us-ascii?Q?Rbws+vbVQXLgx1lJvEPdp7nYi2AqhSdtPAevu0MwsGtTIS1YdX6PfaXLwsX0?=
 =?us-ascii?Q?wzdSYVjIJiUwJZ9zjHSI5No=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78ab7fbc-ef72-4e5b-3ecc-08db62fa4990
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 23:45:32.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QTLJdWy8MALvdAw5NmnbLuaaHtR/ShEoD+5YmAjnx6pM27VSSxh4JdHB0teDrawqTa8vLAt9QAk/JWk1yOkfWj9r2e/eU33Dlx6Sf+M0R9xRyahlq3JfPNkgRayQuqLI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5631
Message-ID-Hash: QHTCPULJ2SHG4B6A3DJ5OYG2ZQBQTTHW
X-Message-ID-Hash: QHTCPULJ2SHG4B6A3DJ5OYG2ZQBQTTHW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHTCPULJ2SHG4B6A3DJ5OYG2ZQBQTTHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis
Cc Mark

Can I ask you about your opinion ?

> > This is problematic, 1:4 connections have been handled for a very long
> > time, this is basic TDM.

	static int soc_get_playback_capture(...)
	{
		...
		if (dai_link->dynamic || dai_link->no_pcm) {
			...
		} else {
			...
			for_each_rtd_codec_dais(rtd, i, codec_dai) {
				if (dai_link->num_cpus == 1) {
					cpu_dai = asoc_rtd_to_cpu(rtd, 0);
				} else if (dai_link->num_cpus == dai_link->num_codecs) {
					cpu_dai = asoc_rtd_to_cpu(rtd, i);
				} else {
					dev_err(rtd->card->dev,
						"N cpus to M codecs link is not supported yet\n");
					return -EINVAL;
				}

				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
=>					has_playback = 1;
				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
=>					has_capture = 1;
			}
		...
	}

In case of CPU:Codec = 1:N, and if its validation were

	CPU   : OK

	Codec : OK
	Codec : NG
	...

Current soc_get_playback_capture() will have has_playback/capture = 1
evan though one of Codec was NG.
I think it should be error, but am I right ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
