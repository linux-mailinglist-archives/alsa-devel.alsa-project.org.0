Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E37A115D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 01:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 009D5852;
	Fri, 15 Sep 2023 01:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 009D5852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694732496;
	bh=kDpvMWq4fLdXq8JHbRKm3Sm28veLm0b1/MqTi7YAeXI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ELkmjDYbi2B97mOZKZPFAaF3nE4Ct5yZYYt/OrqYpjdzdwiJf3QoX1UuTSnGf1vEv
	 yDUyww3/cwOBrIizvvzkWcgdMi3KwW5/B7Sq0+c5QWyUGg1+FYWC33x5FU5obuWclD
	 EFmfBCvb1aqEeDxKKQ9CiRtjnjbB66NCj8AxCflU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74B98F80549; Fri, 15 Sep 2023 01:00:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02108F80246;
	Fri, 15 Sep 2023 01:00:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F35E4F80425; Fri, 15 Sep 2023 01:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C8F9F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 01:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C8F9F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FqaPT7pF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXSHw9FjT4Exe9eQOkoRVT0bvR1j91HJFOqVqgn12bDuXba5R6O/sC/43HMhDlF36iGi1xhFwMVkgWVFOGv0yeIqCoRwjJtfjIAiL4sxYXxD9YIaC2ntM7DRXseZHRv8424nNykX1E3vT2kC+zcGRXryBvx21ViFl/vWQYMeUJJ7IRE4or9qNgcb9D4ONOxAQfhqdbkK28nxbWj9QY1Zz/4RI5K2aJQ9klXNtZvRT9LDm1++R7NuKfwYLJvD/5k/blDxSOcKeEhgxg+Q5onGfWDtA5nuGDLg3XxfUcrBwGdIeTSmIgH3x+sV6+Z5iojlT3MdlcZLJMl2YSn5tc9FBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIPxLkR9bzxNUVN4DXEy7xNMHzQHCqUq0EfoCTmy1zk=;
 b=PKnBDuAgJ8tAfYQRFWV1nqsxaTcXXZOf5JihpPI0xCZ3WI14VbxFM+k5AYwK2bCrNk61bC+twxp+zs2/IRPPHpIXyzRvoOo9ksRBNAuvusbzA9L+VLdRDmBfODUgM5HNG1dGWyrNTfai8GLER0P3/al3xtaBmqu4z8p3fCkRs4dJwvlzLoMyi/AEXfUBath7mho7GZGZ4LcuoUCK37YftM9r3JeXJNveUns/drtQs9MfOmzO6oAieSSogI1FSoY8Hw5GAFMhkyNek0OEKFLt/ZWdEqlIJ2irSutaqGgXMa6uw328gqj3205d53H0wDcpA1aYwE+4LdcQ5oIYBC9/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIPxLkR9bzxNUVN4DXEy7xNMHzQHCqUq0EfoCTmy1zk=;
 b=FqaPT7pFF5WJjxSian/A1HrphsaDVHIg34esx/lWr/75kkqloxRlGQ7x0LAPC/k6m3n6Z+DECjpAEgpGCTnia242Ng/VdhHZDkod1w/gk2vgIw1+VoBj3uryRG7eNosaHW1BWhaMLovPY/J/esbV67q97AuQA2D34UqwGmjZp8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8329.jpnprd01.prod.outlook.com (2603:1096:400:165::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 14 Sep
 2023 22:59:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.021; Thu, 14 Sep 2023
 22:59:58 +0000
Message-ID: <8734zgqs2h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 02/54] ASoC: simple_card_utils.h: convert not to use
 asoc_xxx()
In-Reply-To: <3def750c-5f58-4c36-a58b-bd839a38d3a7@kadam.mountain>
References: <87edj4s26a.wl-kuninori.morimoto.gx@renesas.com>
	<3def750c-5f58-4c36-a58b-bd839a38d3a7@kadam.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 Sep 2023 22:59:57 +0000
X-ClientProxiedBy: TYBP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e34390b-2712-4af1-9b81-08dbb576515d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iUey2nvzVoKAw2uL2FNfXW20S35YWfIv/PVqlDAUd1VCsAsmINiii6BSW4e4zcKJ052MtY6DaBIgKW3Nzlsy2V6bt5pxZwi06QtyD8lL9Jr12Mtr8wu+jyK7IvA5yQZyA8yzdNlBxNflU/z3NyGzIeFMga43vKaC9hhM4ao7wuEhGVroWD0YKDW6NoorQc/ewaZsg8mqj/vQ1WzdogcILYRp8x1oC9wxsmAypXG4gCM26S25JqGCpADffuppnJx+dCTNPn6tva1KuxfZaDJ6hk3ksEtspGr12RQ8adlh9gfWUJXtr4yOq/2yHsfu5uCjlylcgpC1Qj1GzwIkMH5fcV+VZF2z+OoHH0tBuZDkAEREco5XP9gYQwb6AgixLxHm66oni+ALpiIOO7LBf4rqdQRlr/DBNTletwYlktExktxII1YXmYPIto6IZbeqoR8xg2/JA72q6nJydnjLcaXhheFaI9p/rSV+czKIpFHkfMS2xV4R2/2UEyaloVRLiRCmwJq0mmLcmM27PmG7CsZV+APDsL/aMJfqb7q94m8anM1IMcjAb7De1UOQlmZN1rNjwgS+kKBblitWlkBsIeFLYUD+94jtJBioS4w5DxTLtnE6C2EYTZXcbRZjkRKiPKHqqmA9dacbp49G3kXl96YXgg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(186009)(451199024)(1800799009)(86362001)(36756003)(478600001)(38350700002)(38100700002)(26005)(2906002)(2616005)(5660300002)(41300700001)(6512007)(52116002)(6486002)(6506007)(66946007)(66556008)(66476007)(316002)(4326008)(8676002)(6916009)(8936002)(54906003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FyF2RKKK5aSKni59T6GjQNr3fzAYwHrRjNgLKuEpDxLrCiWAFUgDbvOc5moT?=
 =?us-ascii?Q?y+wH/atJlIpn2C8zrczkKg+up6lgaECMwfvQfCpsdoagTRtUb8Guapaz1ITp?=
 =?us-ascii?Q?iXHaFavpKEJpQQqgLySTJfBTEvkTk8D8Z52CZTpbYIlElsa64tmqFCwtReGr?=
 =?us-ascii?Q?smhAvsaqPJK3tFs9oFaMeQtEyzbxF4G4i89rnMxJhOpxpY6loghuF3mo+qq8?=
 =?us-ascii?Q?wmjEauss1N+y5BSTmr1qZZxrevV+hw5QtGI9dZXLmCCYhiFiHpSkdIONlfkl?=
 =?us-ascii?Q?UyB3t2CLShPppKxh3gjgOCC4R6doZmRiS3+9olEcBKrRzKmSUYhne49tkMne?=
 =?us-ascii?Q?SjDZPcQe39Qg9P7fGWFpsXtxlagdSX5lfcl2fnqlnq3m0MuZvHrE6MlctFv+?=
 =?us-ascii?Q?P1uZj1gOcBkmhXi30iy1nFXExs5uLmm5zgdLO9qlpYUw9HkmmyG2jhXMlbaf?=
 =?us-ascii?Q?5Fu0wpGyQ/vL6KMANaBLOnoImT5mWNHz2mGYT648lIpQ8HvSLFRHGYDMd4hI?=
 =?us-ascii?Q?+RiteM3SQEdCPZnxOeS2lK/cHuytp9SNvvld/zUrg+3XHLgytfYGxWWioSG8?=
 =?us-ascii?Q?c+k1rBobnYj8i58tLTspnOLWUaRlOTtXveS0O1JvraR8v6hA1SMT6erc1t3b?=
 =?us-ascii?Q?Vgc6ndT1O9trNOeKRnmr8fBTclC+33ZqgqhyvVLc0y70QD+zKiV8OPUJzG7D?=
 =?us-ascii?Q?XHdS8iWcvo1BvSp5m/egZ200eiu0IQ5IRFzgsCIm3otLNOtExh6kn7HCyyHw?=
 =?us-ascii?Q?Vn3os7NITbH8WgPLNgz9L9bGNyGq/50DDH+6AVa753TyGrTRT678CnXpoE96?=
 =?us-ascii?Q?KxBE0NOayVg6aEoqCtK0SOcBjix3Wj72miO9C66F4kqM+XtIi/cDTA6/WoFn?=
 =?us-ascii?Q?ATdAeeAUdgGIyr+AB02JVQ1kyb6FkwMv64YsGqq08WRtEp7PaN+0DeY/EgmT?=
 =?us-ascii?Q?yP+ht53JLWfIMpdds4KPkwUSBVihvKzZYvaw1WYYHrI6EkRDvYG2js9gy1d4?=
 =?us-ascii?Q?YtRdbl+kDVzMOke03O1m3daxhIqC1qCzLB7jJg1KZ1CtePhSZA5UoWfEAtI9?=
 =?us-ascii?Q?3fgx/UYVgYe9j5FTK88ZeWlgU+yNfF+wDLkTzyfheNsjdldc6EwMtzQuSXh9?=
 =?us-ascii?Q?ug8DKPjBbJ2ERTp5tXB6i3LJvJ+cUZtGHTRjC2rgNYPslpi9bHehEo88Lffe?=
 =?us-ascii?Q?2+jsLAYO+zLeqpMGrT/9UDCoxjN+EGmSdCYhbF6XFz3iGf8OP4cDWoa3KlFK?=
 =?us-ascii?Q?t2qLpxvMiv67Axwt+ypkQsrOtiGMoEoxM9EHmSeZ8jIkwNOMMHJGbMU4ZJ2i?=
 =?us-ascii?Q?sAUm06YWhWDx7dFpom95bd4bVVMIDuJGBgFhLqOSMQuJufM3C52mqbHj3Zza?=
 =?us-ascii?Q?0kqXV4iqLiHzaUD8Bk3xEl9aZEq7U9s5vBa3K+dGPfFK6A/p6QAUc1JR5FcO?=
 =?us-ascii?Q?+4NBk02wmbBlW1+aWaUp8XKvoYd1kt5iesrm+YCYYHZfh2Nsib0kfUAMDQYr?=
 =?us-ascii?Q?DJtH2hx3CFfzdl6cX/Mzn1zzwT0nUH/afWGlmrupe37b3uC5jotcrQkiHTZn?=
 =?us-ascii?Q?JNh+9sPldLakjLYY72sdQepQFxJhIA5AkyJlgbFE9fZaDEWERN4L0rK1b6aa?=
 =?us-ascii?Q?FqC+usTjiR7RtMamDZyhCKg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e34390b-2712-4af1-9b81-08dbb576515d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 22:59:58.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4Vup+SpZK6V5+M8QB3n9vtk1rijnkdzShhh8+dPpxW/Ygi0TZiqU45lvFbwatPjX7WefuDKatFkOz4BatnYkS2KUKt4vAHwnfDUg/2O3+uhrk5nPSuNOSW7/qpgm7RA5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8329
Message-ID-Hash: VNMHBPVKVOYGMCBMT7H3XVAA57GR5SLE
X-Message-ID-Hash: VNMHBPVKVOYGMCBMT7H3XVAA57GR5SLE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNMHBPVKVOYGMCBMT7H3XVAA57GR5SLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Dan

Thank you for the report

> 5ca2ab4598179a Robert Hancock    2022-01-20  307  	if (fixed_sysclk && props->mclk_fs) {
> 5ca2ab4598179a Robert Hancock    2022-01-20  308  		unsigned int fixed_rate = fixed_sysclk / props->mclk_fs;
> 5ca2ab4598179a Robert Hancock    2022-01-20  309  
> 5ca2ab4598179a Robert Hancock    2022-01-20  310  		if (fixed_sysclk % props->mclk_fs) {
> 5ca2ab4598179a Robert Hancock    2022-01-20  311  			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
> 5ca2ab4598179a Robert Hancock    2022-01-20  312  				fixed_sysclk, props->mclk_fs);
> 5ca2ab4598179a Robert Hancock    2022-01-20 @313  			return -EINVAL;
> 
> goto codec_err?
> 
> 5ca2ab4598179a Robert Hancock    2022-01-20  314  		}
> 5ca2ab4598179a Robert Hancock    2022-01-20  315  		ret = snd_pcm_hw_constraint_minmax(substream->runtime, SNDRV_PCM_HW_PARAM_RATE,
> 5ca2ab4598179a Robert Hancock    2022-01-20  316  			fixed_rate, fixed_rate);
> 635071f5fee315 Robert Hancock    2023-06-01  317  		if (ret < 0)
> 5ca2ab4598179a Robert Hancock    2022-01-20  318  			goto codec_err;
> fafc05aadd4b6c Kuninori Morimoto 2021-04-12  319  	}

The correct fixup is not for line 313, but line 318,
but thank you for pointing it.

This issue itself is not related to "convert not to use asoc_xxx()"
patch. I will post separate patch with your sign.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
