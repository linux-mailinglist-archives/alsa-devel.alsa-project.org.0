Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E9708C18
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 01:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B541FC;
	Fri, 19 May 2023 01:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B541FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684451597;
	bh=kHT7Uqm68gNr56KfjRKls3bNtKJ2cShNqbkRaRupupY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s7F6hRhSvYza+JIMphuJJfN9WC/9AKxOY5jgD2pW7pwZa9nYgAnxx0brlAKoX5eK2
	 pKH89kZ1Q0yFB73dvFHBWOPkBV08aHCpZ0qRAHpefupxrlQ545RdTe96/EN/elD4uD
	 LDNT+QrSElFch4hlC9U4TDy4GDvAg1neSVfk6z9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E07CFF80542; Fri, 19 May 2023 01:12:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B99FF8025A;
	Fri, 19 May 2023 01:12:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4ED5F80272; Fri, 19 May 2023 01:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CDBAF8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 01:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CDBAF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=G2u29U1S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyLzlQTEg863pN7EYNSVyNyHH77FZAd4zJva+c8BD2BABlQ7rXFWdNKBLFLmv+Hbx2bcQJEHOe/fh3NE1VnFinJtKbRFsaj0mYJ0EI4hJAwjH+uaqHQpEsKtdQb9B2CtnxJNJ8d3rl+2cVxOja0wZ6eXr9vfwCRipEl3Rmfua298WeJFt83jKsR5DY/r48xqSJ8bcg7DGYKwMkLchw5tUR9Ujmy5TLxKIL8kRfYTrCZl3Jd9ysLHULa2nxvdva59EqKUt5uU0c+ovV0ZUnpffQUSQapzEceCgeuFzVS7Er1vkWpKt7tjlckn8+SimycA4s9SuMU2bEijaTDPfFt8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmHG6bNau/XCZQzCH+S9xPke5V6VpkjGBwcJDP58AOE=;
 b=VvG61aMJCz1MxY5k5xdL+S5Ekh8pV6/LefYpPcdXZqYU2zt5yRmShhnFN35IYVg/+/ukP13IDEsx1Td9ditxRrd5PKvIAfCmLMIU7layJKrxTCMcsu3xg73L9QKcAy3KCFDshXRqoRW0q3GVcF1a2ugcHFQ1hp0/hTo0/SD9bOu8rSFezohpOtKrRoCAiGj2g69CeTYgFePDu6n5brEJYjzDJ5kMtrrRNcZ+eSuZo3VRxPZASg1r6vWtp5QUfSmuk9Ucf0bDpcqrOJdRiOqbt/0suU43YcmB6uvzwkhrQTXg52cxEohws5YFEAXhcHrqJwAif1/XNwPWLWxJqM5odQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmHG6bNau/XCZQzCH+S9xPke5V6VpkjGBwcJDP58AOE=;
 b=G2u29U1StdzF0BSeU2Xddch8Ipjy0j9kooq7B4G4INR8AMdryZHY35KuIUNdhdirJEEc25ZAe5o2Ac9EAGG9bqMlaGJejgf7GcAUiEmB0LAirTJE9D8WZz3s8Guc3oPG5rH0GTbhOQXkiCrwcP8L2SLRojWBR4VMQxmkDdMk9Lw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12110.jpnprd01.prod.outlook.com (2603:1096:400:449::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.20; Thu, 18 May
 2023 23:12:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 23:12:06 +0000
Message-ID: <877ct5mdz4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 04/20] ASoC: soc-pcm.c: use temporary variable at
 soc_get_playback_capture()
In-Reply-To: <053f0ed1-e175-90ae-73cd-fd22b1d508d0@linux.intel.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
	<87wn16p4x4.wl-kuninori.morimoto.gx@renesas.com>
	<053f0ed1-e175-90ae-73cd-fd22b1d508d0@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 23:12:06 +0000
X-ClientProxiedBy: TYCP286CA0250.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12110:EE_
X-MS-Office365-Filtering-Correlation-Id: eab0e3c8-187f-4e7d-67f7-08db57f54c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z7kGpPtHLtRBBtLQzlmQsh0xEt/zxpNqvWACks85MtW6migx4Q7/bdH70OQzP+ZUab5rmBKHgrKGrqZ5xwufFvpBFp1MJCzP4nJDtVL53W2gHLA2UYabiuaVk78tQaBi9aQIbqq0PiGMiTnZQ/wshRthFXr48aydnTHpA8a237SEP2L1u+uF+Xbprs40jWAHbnUhFwmxB0xFsl6FutOkSzX5KM2exCiTu4Mm5VSgwwZhtiACpK9c8mpVtLHuR0KqAdkoU6G0ENcWpcWF+Mv4ZovjuZ0223CFf4s6xXkp2iSGB/CwyZkarYxxiI4DJTdzlNL4+8AxYd309uDNQnGsck3kzgF+lnezudSH2itwMq+jiOdecGkDz8jg141fafrAG2ND+xceibZgvtpW/eOe1UBRNijTp/cgNtsRsbmrDuTf7oLGnbPqPnZWjORYVwF7mbO3DnsOm2H+Fi4qKyvucAd6lplqzkROazEmVre6lRt2AmaFO2v9WCuoih/CHBrJkp7Va3HObdueu7O3EcFcihir0HvvfS98PQIRGdiN+wq054LGAWJ1rT8DPhM5V7uJsOdQSXmUq7FK4pt/18TDJU4ySBR2fVjOwm1XCY7hSWrWB7baCSBAWGPphVRIbZD/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(6916009)(41300700001)(4326008)(8936002)(8676002)(86362001)(316002)(38350700002)(38100700002)(66556008)(66946007)(4744005)(54906003)(2906002)(478600001)(2616005)(36756003)(66476007)(26005)(6486002)(6506007)(6512007)(52116002)(5660300002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kJNuBE/2eE61bnoOt2qJ4UT2RM58emhDQkldq4l71OFkFMWOZ8FEQgxJSWaK?=
 =?us-ascii?Q?UsKzGeTznafrHSql5OPTuNKOK1sM17YS9s3IHAnKzwYfHQ6BEs4VdRzimTzf?=
 =?us-ascii?Q?V+9v5siHynVNTrDkfbngZOA87eKw8IDj5iK3DXquDmlT7EEaDUx9nRgbFeh0?=
 =?us-ascii?Q?4vnzkz/bE6GYPLixf/cDtnaVryGDvQBBu6yIkVKzZ/EUG5awfyJDHNVbV09z?=
 =?us-ascii?Q?Url6pHfUsbtUA/klvrATYLJGmDQm9hUiDN8S7jXaG6RHze4oda6dUo9wsf/Y?=
 =?us-ascii?Q?92CRtYlSY3Cz0xPZJ43Kjq1ulc6K2m7HTKoxB6uXqM2ncls3eiTrrUsaeCx7?=
 =?us-ascii?Q?CHIUPBMyE2PNPKpEVclef1YprthUnEyDWEiunl/7BhIY0JslGT2ragl6Jv07?=
 =?us-ascii?Q?inWOtjtXcDtlXd/kn8P6jHelz7RVNIPZXvdry9IRuxKAGdu2iMCKtW/IVKJe?=
 =?us-ascii?Q?2D8KaJ+HnlOZR0AxVy2zMPV1aXODAjQ3pz696dsjzcWMPf9VcPwXc8ujRqab?=
 =?us-ascii?Q?ni8YJ/UXBWYiB0Q/J2zFemUxOu/ndM5rGPAgX0Spj+jaaERkstTbWyduWIhj?=
 =?us-ascii?Q?1A0Q8SE71IjpOIr5lhjywMTxsv1w2wVXJwcb/EGaWtTeGDGPBrtDlG9hQuPv?=
 =?us-ascii?Q?U4Dgq02X7tfv2CSexeb7yhEMOp9NFoqVkxv6RXVFxQ7jQQFTWZsP4qMATWre?=
 =?us-ascii?Q?JuyXet99DwXnp05zlLH73dUy4LPfUjhJQGviRtjPmMTYziNjDknYI7WTcj+6?=
 =?us-ascii?Q?TC9puk9gmJFIuo99QKxv5Yp+9FudIYbw3XE7E2u9UgQErctTA9uhsXNpKYz7?=
 =?us-ascii?Q?GnCJrQGiFuqK6RCddbg06fkS3jjiI2goh9iucL3WjfQaN/ud5E972G5PaKP1?=
 =?us-ascii?Q?KUmMHRF0Ir6bkTEeqf9cKzCOJ0kRh9d0uYWVLH87Byyv1K3rWS75x02TLKex?=
 =?us-ascii?Q?TMEPuoIDBqk4Pcpb/iRiaX8hgNnjPOOnR8XChB86kFnHgMOWHe5toUZEczE0?=
 =?us-ascii?Q?vsO7KA1hKCddrDikigBWhiYOllfStQmMJSFux2xUIkjsSSf4jve+fkqizLJs?=
 =?us-ascii?Q?BjyblBWwg0+u5qKT06LGkQfb6/YiSyAHOVq740hgVn2DpN0ztSazHF7Dl8yS?=
 =?us-ascii?Q?BYoxQ0XySVujx9qjndhjD7cNPQ6rlxEDB1uqGYVd/GsKfLBpMaNunIzUnT44?=
 =?us-ascii?Q?Uvm1cNUgWU0E8FmWRgwvfxjyQFCfRDp5jIUSIr3SlLIj+JJGLW/LBvL5ahN9?=
 =?us-ascii?Q?gBFB5ScYMoZdwnT9tAopyF+BnLaZlcC9lLl2jVroHblJjUhyqN3Cr9Lj05ww?=
 =?us-ascii?Q?L5Ww53X/j0mGGKeUqRuiPwGsUmDgOX5hZd9EGjfA+GK6JjwKIjSPzMBW8STT?=
 =?us-ascii?Q?/xetgoeYKRanI1JvsVYXowWylcQJkVK+gunkjbNNdODqwkR+fDaOB3Fl7q2e?=
 =?us-ascii?Q?3u2i/z7Bq6Rf8drjSkKAJEBVr1iGkVNVKDb7N4UbHr6ATaRLt1PsqcEbHd8f?=
 =?us-ascii?Q?v2B0poTzQFf3wcmmGrA9fMT1RznPZjQX9TnWdmc2CXggm5kiwdW1wozhCBVJ?=
 =?us-ascii?Q?M5l36Aj/uW9zytSgFgOguF7NTc0LaD10NfLQnSR6McfzFd5kfwCGyoTeWsHU?=
 =?us-ascii?Q?G4GitjqoLbbB7tyKCW0/T2Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eab0e3c8-187f-4e7d-67f7-08db57f54c75
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 23:12:06.6325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 www+LL9NMZb0PphKHlxh3BuNVWu1BMRdP5XEdWrD+2pWY8/SzOvEYU0q7m97601S+2j7nbbEEZ75vWZf8sCZNGCCV4VlGVpSGIXDUEwFpPCgOD58JCeTgFwj5nGBKRBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12110
Message-ID-Hash: 26TFOHCMEEGWW4IQXZ4TGQKGZK4LWHK7
X-Message-ID-Hash: 26TFOHCMEEGWW4IQXZ4TGQKGZK4LWHK7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26TFOHCMEEGWW4IQXZ4TGQKGZK4LWHK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz


> >   {
> >   	struct snd_soc_dai_link *dai_link = rtd->dai_link;
> >   	struct snd_soc_dai *cpu_dai;
> > +	int tmp_playback = 0;
> > +	int tmp_capture  = 0;
> >   	int i;
> >   
> 
> Maybe name it something more descriptive, like "has_playback" and 
> "has_capture", I think it would make core more readable in context?

Thanks, will do in v2 patch


Thank you for your help !!

Best regards
---
Kuninori Morimoto
