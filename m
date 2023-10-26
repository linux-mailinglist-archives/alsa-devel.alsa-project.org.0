Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D87D7CD5
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 08:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B60EC83A;
	Thu, 26 Oct 2023 08:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B60EC83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698301418;
	bh=p388CELVszsXe+cppsEv1JaEMNquukhbVJYX7U8fflA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JUoUVtuumXTIkPIsuXuIombHISnapRr8ToHJaUN4ymmGfv2s+mNBLTqjTVz51YxaF
	 6RGMHSO32Tq1Nix3eYr3kJ7RHIeMqWa4t7y5KioJIvUwEHVT4Y8YbbBCtoBD74bQuD
	 SfheaB8bKFPPWphW+It9uYZk06TmbYDVzSL/RYQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9118FF8019B; Thu, 26 Oct 2023 08:22:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 103B0F80157;
	Thu, 26 Oct 2023 08:22:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E176F80165; Thu, 26 Oct 2023 08:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28EBBF8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 08:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28EBBF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NBsXu9m+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkRdhw/+U+UQTzxuSfFEVEhSQry9GmIJASyCEz3IG7J94nx8uSQcN7YmJZdF6SCwPoS1wtpGiKxRUneUO/Fm8p4bM4D0GCQjD8T7+U0FG8DMHuf4BzyLj9s81U0/wK+yOXQzwhS+/uyOhTtVIRRSNJJN+e7r1knt0EJ8NP8+KCmFHX3mEgh7sJj5mkr0VvBzRWWkTxy+mZ1cDyQuTf+BSR1Yw6CDOW2RNKaNUnL9ti6ZO2VNYqqtx0bs4e+hJrA/ZaCs28j8eOD/DR1qZJ9pgwwznkgi9Cs8OmKq04OTFuHkgQQAqAUS/nHVzjlR1VWgh7tZVimf3NKOANHrbRfg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOdiczMjXyVoqLGjykl2JKO4HhVspuglJ+DXphjUaqs=;
 b=MroZregdVW4Px2cl78og36racBoirfGeo31id/xrCg08GUJzSrPzgMKiXmGKezGpF7Sf6ErHySgkn4JGkDxPkd83P33A9lT5Nm0KTJQBxNxNI2VQxoNOpvFqvC43xpVe6+vYBZL3CcTGH7RbZkP69h3R9EeUHYjfivIkaiwQFAO2KIyyzCfiE+1wVHKIx4AVY16KrbLk0H6LwVvULjUJXKQNsHhRYZnhH+9F3q+SkALpEw6FerAeVD7P53lqAnrAB0foz7yy8879QL9gGtuv3bTrwrMN44yE8FQSK9DE4DMPIRuvY2npFffuIqnnpSv4dkObuOcyQNpwiki/rUMm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOdiczMjXyVoqLGjykl2JKO4HhVspuglJ+DXphjUaqs=;
 b=NBsXu9m+d3YoYMvXAnut1H+yMtVXX//s3Lirx0bE6+maJpCwd9du6V/bDRr+z2fL0gdTgs0NJkNo7Kvk1+yuV7wOy547DUJVva1R0MNzzrfPbmXEOi1lsxpRLpfWjZESgKbrv4rvTUTU5vbQunyEDQYycpdWuQO9LhSHtga495E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5656.jpnprd01.prod.outlook.com (2603:1096:604:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 06:22:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b%6]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 06:22:20 +0000
Message-ID: <87msw5vr6s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: alsa-devel@alsa-project.org
Subject: Re: [bug report] ASoC: cx20442: replace codec to component
In-Reply-To: <3e608474-e99a-4866-ae98-3054a4221f09@moroto.mountain>
References: <3e608474-e99a-4866-ae98-3054a4221f09@moroto.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Oct 2023 06:22:20 +0000
X-ClientProxiedBy: TYCP286CA0276.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 206aa21c-1f6d-4b8f-5516-08dbd5ebe8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pzg6FlsBSGj0KXT3nV9xs1Wo+494Yjxxoh3xRpYdF2SL0G1uF9S6lIC6zeqDZ0SHUadV1wA0LWznOzsRS3QVfzplvo4DY2Lzj1KRhvBtXDoRa5hbwLAppzGbyuQVZ5LOwDUHswgdmE5FwFP3LY/vFJnnQCBeecH95xC1PqlFtoywU+XkpUpfdjqZHrnXMLbeNN/AkeNSinY+7j+djpEchsMWNHPil0gFuhxplu+DhmtEVVc0qGp0R+HW24O50Gs8GzncKbo4MPknV8zNnI4Tb6xF2/98w98yLg0tKsi1qCxAJH8WjpE8J30DY3rk4QyXqU4WfzmN27s3wp7DCL0/MygBqtWx9jrB1De6cvFgB2z6u/Ybte+Rjl4NcwhmPKS0vnpIaYl10U/NhoObrbLimGOKYF/yUGqvMkLXy3stbFDJx2rj6f1R3FcrjOadKXZjotCjLFWL5tlq5CBZoeBNkISzqM8yqcFwYAmw8vs7AEu8MYBF8Z7R9bVxKEJ0NwD0jGQ2InFgM6jBliBzEFFlU+8IOwUNSvH+DLSn/de2qvZeIeau1RtPZgHZMXfZXjTEQAsHF+QwgD+NsHyd5arsvMoQvfSHPVCODgH26h1/co8nFfeCGYjW1OTbrmKNeGlC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(366004)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(2906002)(4744005)(5660300002)(41300700001)(4326008)(8676002)(8936002)(2616005)(38100700002)(83380400001)(38350700005)(66946007)(36756003)(66556008)(316002)(6916009)(66476007)(52116002)(6506007)(26005)(86362001)(6512007)(6486002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?THqayx/2vFM1LO4fY18n6qjhVflj8+AKw3Zl3kZSEMnJ5eFSb7Fq3WU/5JhK?=
 =?us-ascii?Q?os2keGfpdx/amwXSiBETEYREeEjkNoYcIHtWb6MsEME5O2fE7Nr3JOgkwHZm?=
 =?us-ascii?Q?gbpjbxDQ/95jeXdzrRvvLVahmJRsa74SO5d0UYrbDBSPPdYnWDiiIcD7uzGw?=
 =?us-ascii?Q?sM+YZwl4hj6y8D01TjlEdghRmWowPYZ7xHm8X995vdataygdwUxgCeF95RDV?=
 =?us-ascii?Q?sJPT3fGGeO+BNIlw5wq/slOfmPS6pUcBSnuKcWPg889cgR1PpGsbuHdWtlWS?=
 =?us-ascii?Q?WTR0364b1/7bSoGWE8kXrJtYnE7gs7qYN4bXcD5QinbUpIW8CBOrqd0IAV0F?=
 =?us-ascii?Q?sH9ZmytpDWmd3n7SHv/e1+s7Ki1a7eeC++UoIJKXWO8zs1AhoScf82ipCJVr?=
 =?us-ascii?Q?3YCR5FY8Ae7tTKb3J7195SCXW2+9D2yGQWyxav99rovRhxUBRkJv8TpQpqoZ?=
 =?us-ascii?Q?J3IEty/c5QvqtExulag3FfnHekioaorvoKdEyO4Wno9X05Vpc15SvtwSg3wP?=
 =?us-ascii?Q?6OI60WBTD1S2/tI2MBv5e9qLYd9IsBtKeaqDWIGhH/hBZVKHMeo/vH3shHb7?=
 =?us-ascii?Q?O2wK9OzfjQf+rRe6WzaVTYWnKi2Sgny0J1D3trZeET4xQFTSgx5lro6orl9k?=
 =?us-ascii?Q?r2tPJH+P/PZIFqhSd3cy96Fpf8HljEX5mWN7l43/NmQ5nuZxyMiD6+hpOKPy?=
 =?us-ascii?Q?gwL0DodWsXInUtvQMg/05SJSsbeF2QlfdbcPtaRt8o2FbKTWi7GQC2kOnnQV?=
 =?us-ascii?Q?Lb7W3UVBuM7kJJMSYnKEqlz3rue7GEmBodtULeqZ0fVMHYYRPSkmXz4PPDN+?=
 =?us-ascii?Q?8w2aj/BzbvsScYNFxRa64t2a4DlH27lVaPBnIDWDcLHZLc3gmftuGXjgOhaV?=
 =?us-ascii?Q?UlK9uWEoCPT/5YNJ5Lx7vZtPP3kG+T6kG085WWdN3ll8rq8dnX4Sv5/VjT1w?=
 =?us-ascii?Q?iYG6Md6HCJV3pLWnjTvBlzeWyxY/H05PbsAEPmKPg6yaqZNSGVC+lUQf88cn?=
 =?us-ascii?Q?e8FPUoK5GU7BkxGbvqSS7crNCjqF9oj5k3Ty/Zfj9KTzHubmblWUGm59aqQg?=
 =?us-ascii?Q?qNhfmD/TuUTakkn3/IReQgdPa0ZHpfVBeY+2NZy6RbymBbsazyL9p8u3Bz95?=
 =?us-ascii?Q?zfjyXLOnLhGkiQBFWW3HgRc1QsomRswoMI1OUVigp3L5uJXeB6K79R4+DoOe?=
 =?us-ascii?Q?16I8J04nuPurwpxJ0D9Nk95bHK40z53JHDo8NKbE1zOmBE1VCJX+cyZs6pFY?=
 =?us-ascii?Q?H5SxUAn+bF/wrFiNCG11m7l4dw3YyORhrR/KgXAiZcGLA3kYSAE3G5RVW7Cy?=
 =?us-ascii?Q?xvGuKE1T1cvCVxoX4GLMkWRKOyVai0PnGWW5HS5FLKFPX4j/33zRCoSIc+w1?=
 =?us-ascii?Q?mm7LSUtNbmfySMey3F4ZaR/lQd96nGhwtpdoJPqRxACJ1j2eqaRLMvTTa89U?=
 =?us-ascii?Q?fvKVvs+DlWLLM7/JXAtbMR+n7lUkAcVsEn2/JqMf5sONUEiSkUKnp7OyWfjl?=
 =?us-ascii?Q?okZtgYQHwJ6KW3dEAmyFPMtRdvH0Dzz1M860VmvDFarCuYMsocsFI6N3SNCL?=
 =?us-ascii?Q?jxaDC59F0f+nAilFaTm1Svm3Kxu8G/4X5ip/UnFoqtCDsfeOu3bwvStOF/gw?=
 =?us-ascii?Q?vxOPkIjiorWtgpXfJoHUYHo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 206aa21c-1f6d-4b8f-5516-08dbd5ebe8be
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 06:22:20.3726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 g/ZezU4N5rs2UsFhPGTYHAX/lzy5LSJziTl7AXpvpvnXsVlnCq90ZoycciVF2iglp3n0pEp2RkU9e1MSh3G9b122T9aGqd53GFi2C7D4AI2linryNIPoR5l0JRP1jgIi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5656
Message-ID-Hash: CUM3K4Q37HAULMFKUZUP3BSETOW7DAOQ
X-Message-ID-Hash: CUM3K4Q37HAULMFKUZUP3BSETOW7DAOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUM3K4Q37HAULMFKUZUP3BSETOW7DAOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Dan

> [ I don't know why I am seeing warnings from 2018 today.  Also this
>   patch didn't really introduce the bug, it's just the variables were
>   renamed. -dan ]

Interesting...

> This is a semi-automatic email about new static checker warnings.
> 
> The patch d0fdfe34080c: "ASoC: cx20442: replace codec to component"
> from Jan 29, 2018, leads to the following Smatch complaint:
> 
>     sound/soc/ti/ams-delta.c:311 cx81801_close()
>     warn: variable dereferenced before check 'component' (see line 304)

Thank you for your report.
I will try to fix it tomorrow.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
