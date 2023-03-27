Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 428A76CB23F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 01:21:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B29E8206;
	Tue, 28 Mar 2023 01:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B29E8206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679959276;
	bh=0ZnS+G9NdHCRCifflslGDoNZvnY4mVGGCyvtbiyHZ2g=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N/cOHW4yn3qTsv8HuiQBEQkgiJLkiuh02ltnFuU14hy6OY50BX7Jdn18ltc69e/+D
	 DRYF9kpGpz0jM5c5sROtXTTjTR080NckSFmfjxSL6hX4lBzt43dttEeN174t6TD6jG
	 AszW1PtEjqBUaHMa6i7gaC3EyTrO1/9jgxByD3eM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15992F8024E;
	Tue, 28 Mar 2023 01:20:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 919FFF80272; Tue, 28 Mar 2023 01:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03DF0F80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 01:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DF0F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WfD8Sy+6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoyMA9i+JEFseoIKj/h0xyYVHFuRcKjko8pVH1pmyQ18kc3g8txPl5IZN9ouXjtLzcS64GTsOkEhZl0HKpodumr61lT/CtzHS1i2HqK0CmWMz3gJbMQKwFQry4YqgZ5UuGd8SCTWAcTw7S8Fz4W7o/KP1brSAEY40z3eHEYSfCZz5J4dHZ3q5I/wv8AsRhA48HPiFGZ0cQSmUZoPKW2+wLcWO+zRZeGy4Cg/th5H05CDvhEEcgRValqMeQqumV2DQdzBgIfx3XYLCSmHYSVE6/oUF6xhLdXMoe/B1zZ8CFHD/bUlC6OkOUu3Db8WUo13myekKNxCU+h5Qqy7hmjLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4U/Ut8+AKfrkBdiyYlhPu4+pHl7Ny+sx8054Nr8rnA=;
 b=Yuv1jeQpqUSFZTYx6csCqwYeE9B48W9AM7H3xzJSJSYNAhY5iQMEalV9BPIzkb0o6rso7qjBWjF6VvvFCa+dXM/qbsdQC53qWZOqvnJcYUZL6F52Qbp6CiLRSePxWXOVVmiZYdELl3AADP9AvgQttj5YxjtKPOILs4Cu/U43uiGHcOfAPiAYyy3Ul0H/FE1KaPcyP9cJRydjkhNONieiRZsJDeYuiNNv7auLc+ZzCJkIWTPR6HnNjd/nTYFKNfvz58qDBgWgc2Jmj9sjILyAt/eMhwsQIGuqDTcwG+1P+ubYZ9MeeiU5+G8oOHcGNhUPzvSZh/TT4kZFjm83N0sPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4U/Ut8+AKfrkBdiyYlhPu4+pHl7Ny+sx8054Nr8rnA=;
 b=WfD8Sy+6LtYAYZ9ROjxK3OtPXjFDRnbI6znUgla/F/527mAmYG55qhxjE1Gj43g7JNNKgsKIMZmXQes5XK9xyGYsoq17p3J0PX+B8qwsD1fMHiCwIm35s1Vtlfb5tEj8UlYQtB5OVbmKrhTNnBTStCUR3SOn6+bm5Zd7rptRuMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9823.jpnprd01.prod.outlook.com (2603:1096:400:235::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Mon, 27 Mar
 2023 23:20:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6222.033; Mon, 27 Mar 2023
 23:20:08 +0000
Message-ID: <87r0t9g4t4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 4/4] ASoC: soc-topology.c: remove unnecessary
 dai_link->platform
In-Reply-To: <5eb5c8e5-a6ad-2522-1b53-5f927a3a7d8c@linux.intel.com>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
	<87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com>
	<5eb5c8e5-a6ad-2522-1b53-5f927a3a7d8c@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 23:20:08 +0000
X-ClientProxiedBy: TY2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:404:e2::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 922cec41-b14d-4570-50da-08db2f19ce7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hY0Q7HcpaNzdn4//hVlhsU+n8OcINl6pKTc0ZOJHgxL5Q2/Rc7OKIxvYsKLFqEaxNubUHZdVb07DjahT4OB75KGZFqaJrvl7TuDHow9m/WnRpNEwXr1CK48GdaGFBkyeDDxmcliV70TvxxeM9KVt5AoD+ODG9PqDCP4w13kZmZIwBEXZWAgPlAkttkjI8Oc5xcBU3iUnrGWI2mJVGENEph7WI+snyOrC+RD5Jj3Y5ZkPAF79eAfpA/H9dyo2jeqo20aLq8g8U6vQGNT2GLJp8igvt179oEUFkqJ1Wheu7GsWzVX71J3d83Ewo3c/rTD49PfK2NcQ23PhKvOPtQsOaeAkN4p6OmxL1KXcWxWlQWOErwTMtlvPjMtIJq26sWCvJ0JDKcQdR8LfV6tjYlciW87LWVfpgdB0lQOyoSksXfsTPRxrj+P1rEpNqr1RSs+y3QXE8Pyg1VuIo99kprYOApx02qbitMzLGGo1/h0KtVXVjQEGUxNk4KGhCz6I9rMOiZZxxreZvVW76+WnCOYxruLqc7xypAIOlYW+HsHSFDl5tbQhej2xiiONo2lGEezIj2JE/N1TqE2JMppWeDiQvLQnREaej95et5ia0rpbDLZNgB3Wp6vk47RMdDjyL5n9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(2616005)(52116002)(6486002)(36756003)(186003)(6506007)(26005)(6512007)(86362001)(41300700001)(8676002)(66556008)(66946007)(66476007)(6916009)(4326008)(38100700002)(8936002)(5660300002)(316002)(54906003)(478600001)(2906002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?snwFAitOTeUeuFK88nL3VCKFg8jzLSHCGdhSqvQuaeV1SokKOo+gnGjsJ9K4?=
 =?us-ascii?Q?lIBtBu+jeIMuumwDgkysKAR+xOYDL7G0Yy8CigjH75NMqAUscSeBEqmvGXVw?=
 =?us-ascii?Q?Q6Lx6ERhHHy3a/C7b92EhYiQClzdpsiJerUEhlReCXcSCqCDkQEk3U9lDAgo?=
 =?us-ascii?Q?8lvsm7wjbh2zUlYG6eOwMfbdzMSyg2Es43pSzr0mYIzum0sXXhGOGLJMptV3?=
 =?us-ascii?Q?gGx30exWJ/vp2tJ3QpwD3JiMxT+2Xj/qEE+DlOusPKrKR0n9oPO5TsCvejfA?=
 =?us-ascii?Q?FNv5GTK8z2bj3KCdtqs1qCxgjjOdg+LiEg9kHRE8gcMTooho7reGKx4o+JYe?=
 =?us-ascii?Q?UeZS5033j7eWHiZzwN3aM2lCIN8vFDVth5sCVXUBvXtmMbEQhJ8wvbvvPDle?=
 =?us-ascii?Q?nyhsdiJo5J9ZqbCzrM2dYKP2Atz96Vd5jA7swqUFRAZpLq8hxhFvdORMSQR4?=
 =?us-ascii?Q?vFTnKfuP5cGwHi4PJ6YzjW7uqBWyNK8xZyl2fH0NCzLqBT3oj00hB8RKFrOy?=
 =?us-ascii?Q?5kDMF+dtuqDD8qgcIVa1efjC/8zLtpr1qBpT+iuPSjksH7zGvgG9rWHwZ5Zy?=
 =?us-ascii?Q?TTLSenP7Tl9RuyUEZq0MpUDH8GW/EZxIMyns/sMkOuOrSDZDXfDR1f/dfcSw?=
 =?us-ascii?Q?uaDy4W9gVCN7aeIXmWgpieAYWt4akLYuzqCNu1zLJKe86Ld+lzzrIcXHTqHS?=
 =?us-ascii?Q?m3rvQi008HdKJWvuIov+MmfG5fVZPOG3hu8rTK6Rbf+Mxc7FOg311P4dNu2X?=
 =?us-ascii?Q?GCKLCgtA3dWif8MZHCDgChQBOo9yDvKTbqMZIScS365v1g/dQ+sK4zBcR1BU?=
 =?us-ascii?Q?YZyxLaoDSOU7ISR85WWPTuIq7fnwAGO0uoJTs7aQpUfIYop7zmybRuvPq2G1?=
 =?us-ascii?Q?2PkCh7XYHCu1O8sqpGO3PCJ1WzOg7w2NOG+0Nx36jfyxvYI2tvUSAETKoVX0?=
 =?us-ascii?Q?ssDtX0Dkek2qLyWpMFlWXlJc2Q0mzG4/GLqqIPMA2+yaGy/f8YXdWGg4aVwD?=
 =?us-ascii?Q?WgZRG9wNepvVM2+fMjDWYwUPZ1d4zZVp2JC0IFa86CUpbOe65EO9xXwjE7gr?=
 =?us-ascii?Q?ysURi9/U9eB4wQIzEoycZCrfuTIxh34ifPmgRFQc8pxpwz91XlUljwVU1KWQ?=
 =?us-ascii?Q?OAYiQ9yM2Mxv1B4xZnCIbpSoAqdI0cIQmRax3PqwghH9WoT9zd2nd/9KPDFW?=
 =?us-ascii?Q?RIEQ47uxDsYYUl4XFgtCkx7Ya+AGSH0YLJLJDDlBzaJV123prG4SrGeIr9kJ?=
 =?us-ascii?Q?pWXl5yQPXTAnB1X/kBivYmDqJWLI5+tT67g8Uats8nZZKdtYKbd/Aruwhw53?=
 =?us-ascii?Q?X/yWJdLH009X4IuOQLQV8ADtFkTwwZig3ER5lOJ4Ay6D9QQxJpJnSEekL+Yw?=
 =?us-ascii?Q?pjak2qCLYj7qOHnWn88hx2WJu0YBdX7v4EtQqLPLnHuIKZU/KWCvW1ndHIAE?=
 =?us-ascii?Q?/fHOzLHgjv0sfCAKEp4Un5iDxD1JMFeaGJtcuJ3+QCzcXbsjatVSMZPAfBVu?=
 =?us-ascii?Q?ge5QhioL4NTHrBHnL7yPq8bF9HI4hKyyP7cH2TtL4jku2tWIXEMVf7PWLR+a?=
 =?us-ascii?Q?VK7vix01Ld1dXigLtAY5MFvn85FZqeCq8u39YeUsozCX+robu1Afw4sIFw9z?=
 =?us-ascii?Q?j5ETiJ2/HisKsRR+I0sd4SM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 922cec41-b14d-4570-50da-08db2f19ce7d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 23:20:08.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eHUGp4AA1v8tXPmviB6xRh/JzLr918L+w+hWttcPpRM/6sPCYL6yt90DICCMn9XFkepFT94fi9xQgFrBY+ySlAVY8eRaVrXZ13Hqd15nWltGijQGmbW3XlWMuNZIXONP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9823
Message-ID-Hash: NDJFKQKJOHT4MD5EZY43YX63EANJGIJT
X-Message-ID-Hash: NDJFKQKJOHT4MD5EZY43YX63EANJGIJT
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDJFKQKJOHT4MD5EZY43YX63EANJGIJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Peter

Thank you for your feedback.

> > @@ -1694,11 +1694,9 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
> >  
> >  	link->cpus	= &dlc[0];
> >  	link->codecs	= &dlc[1];
> > -	link->platforms	= &dlc[2];
> >  
> >  	link->num_cpus	 = 1;
> >  	link->num_codecs = 1;
> > -	link->num_platforms = 1;
> >  
> >  	link->dobj.index = tplg->index;
> >  	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
> > @@ -1726,8 +1724,6 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
> >  	link->codecs->name = "snd-soc-dummy";
> >  	link->codecs->dai_name = "snd-soc-dummy-dai";
> >  
> > -	link->platforms->name = "snd-soc-dummy";
> > -
> 
> I think this patch is incorrect and should be reverted (I have received
> a note from a SOF developer).
> The link->cpus->dai_name is not necessarily "snd-soc-dummy", it is set
> earlier:
> if (strlen(pcm->dai_name)) {
> 	link->cpus->dai_name = devm_kstrdup(tplg->dev, pcm->dai_name,
> 					    GFP_KERNEL);
> 	if (!link->cpus->dai_name) {
> 		ret = -ENOMEM;
> 		goto err;
> 	}
> }
> 
> We cannot be sure that it is the same component, in fact it is most like
> not.

But sorry, I don't understand the point.
This patch removed dummy PLATFORM which is not necessary I think,
but you are talking about CPU.
Could you please explain more detail what is the problem ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto
