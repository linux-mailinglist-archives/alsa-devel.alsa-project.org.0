Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FFD6CB249
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 01:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B06F209;
	Tue, 28 Mar 2023 01:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B06F209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679959543;
	bh=4lilC17kv1mrTRYjXr0PLYlGshz6t3K6Vl4FniE611c=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k+tERttZws2nHZl8npbKudYaLBuMwaBkX2hGN+WgWKwaG7M0kbl5UuKdsrjatA+Tx
	 fqwT+8Bzzzr9fnypWubPn/W0Egk5jMviBnl1uDe/KLVf/CafBoF7OI1Aqn1yQxL5xv
	 7ogWFS5xpCV+UJPHwKpc/GX7vThyg7XJfE6sipzA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F9AF80114;
	Tue, 28 Mar 2023 01:24:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 526DEF80272; Tue, 28 Mar 2023 01:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21EE9F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 01:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21EE9F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NLGYkcTg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/sA03GX2eO4c9NfmqoHDJxWtB9KX/nvSVpMPIBq0bNSN2nYJ6s14i78xRADBuxRpmYb/wKrsyqkILmF5iQqBpCnYzpfQOlbZEfmrgwGpb1RkE7KkOpsRtqb0qDoz2ybanF4LloEbbJVotRRt1K/2N+K+jjnrjxGxJTcs4mAmyfVvoCNYATnoHsjgzrnqq5FJdyF2BZxqYSEtN0zZgsRi+9do51zwAqiDNClUBspkpYDEu6JLiegKlH/zCx4nOJXxzSPho1omp0YBAffImt2ByhnOuyXgvxcgpCvo49KsadgKBng4nwSF4DFv08cLXwARkeY367qNLMG8tPwXdbzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaGyQavFtsVqqaEX7u9ewzkcH2NoAq5zlqid7MbAtN0=;
 b=RpDDxOn9Y8ahbI8Gz35sbNR7WuDb8/vPZvxEZa80EZfBWaJgPyjVIz6nQMCP3SZZe0Tim0Wx0cJRyKKRLY/OwScXT7FTwSe+OdUQmgl4PGoeouyf1UirjU927Rcv0CjGON9SyUqdmcF6JZsv30wR2PIGS0vwdVQGNGyUbW3RU2j3A9Mtcz9oXwwrgGnfNzWtLe9cuXeYtdRA09lNu4xvvR0yoG4ynbN24hIzQsWao36M8XKRGoQFGdEYN+ENWJYHlGMIDZukWxOK5LszO2Ncn5f6BR8RyYjd41Zx+1TnDYkHLFv0XQqZdbuIL97uNTuFJVDPoWpvfsvZK+RkY+HgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaGyQavFtsVqqaEX7u9ewzkcH2NoAq5zlqid7MbAtN0=;
 b=NLGYkcTg/DHgQZxBFcXL7EsZ8amQuMEV7mkeUT5mAbGLJuR2jgxYAxA3uKbzNmjBYDTcXWbQUYVQ3iTlY6snfPKRuTqkddGpvwbEnI8p3K8p5hdBfhSUMMn7SahiaVWx++H0uvIQ8KQXKDOthkh8Wh32i+IgCOHK+KU+GRMvFNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8621.jpnprd01.prod.outlook.com (2603:1096:400:13e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 23:24:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6222.033; Mon, 27 Mar 2023
 23:24:37 +0000
Message-ID: <87o7odg4ln.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: da7213.c: add missing pm_runtime_disable()
In-Reply-To: <ZCGJCoFj6DLUEcmT@sirena.org.uk>
References: <87fs9r6ktm.wl-kuninori.morimoto.gx@renesas.com>
	<ZCGJCoFj6DLUEcmT@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 23:24:36 +0000
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8621:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a13a248-d589-428c-6c20-08db2f1a6e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sDaFwGLHuL48Wq3k27eI6pnSphkmL41P2jTJDa2qRRFaMD+At9egiXqVBjSGf56SjlVYqSc6SWOS6ixtJmWXYwRWvaTKSGc+QEmeLo1jECSWa5Il8OqP5rp/gDwGIGae0knUL+BSMGCVsj67Z+U27shGODYfkxr2lq/AdulVneH7qb7W89oolmBWdc8ugOSKbByvY+bsd/Z92vZ/aC4RSvEDTiilfDWHbCTmChFtCpb0HOE9hP3RBCK+s/UFxvAocBDU7gxD2fxV58Kso+TQR/4IpsPmj4ARCE3qMql2e9zXXASscuIcpckzDQSXP7MLhc9LdRA4TyILWM6p7RmwVMOCbyYHNRYH5An3fHNbMXEbSiLNjBbzNSeDOJIBE8w+0QXuASWMshW87kLr+9nr7dcQ1gEMAOvb/EW3FWGUIM4cfgOAr1j3YwKkaIOhfSAAirw7TxNifkdOEuveVy4V8R4z+uDZYjV50DD7Lx/Z7J7POD6rWaCA7EA2XFfuxRfPlANhxUGhG3gQu8lvF/Wi3XiWuLsPOAxIgPmfSWkLYMbiaM0gEPkP57P5zvUfrIu/oUgk41QXx/VlPxjoDyP+lne6fLYLGbnlE6okfRogCgT/QFhvE70N4YWsbSx7DHI/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(36756003)(86362001)(6506007)(26005)(186003)(2616005)(4744005)(6512007)(107886003)(8936002)(5660300002)(6486002)(41300700001)(6916009)(52116002)(4326008)(54906003)(38350700002)(2906002)(38100700002)(316002)(66556008)(66946007)(8676002)(66476007)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pLn/M4S9J5b+eTMxsib+oaajcSmEX3U/tOMtjZDy4XoNXuU07upwJBEZHC7r?=
 =?us-ascii?Q?MUhhPOI+pWOAXvLkA5kpkHCEIxPB72L50rkGsKyTjkCxLDV84vRJfy/4IzgB?=
 =?us-ascii?Q?+ZCgTnWb/rrqmMmRiQr5OR/Z/SGSwp6QPEQMetfdFsZ7/lVwIOaYnLf270c1?=
 =?us-ascii?Q?vVdkWIZu5PmZPk9NX3EE4epFhihwRNTPOdg4N33qWkTvDN1rWdQ8Qd9CG6zT?=
 =?us-ascii?Q?l2wlEISQnIeENaObEc30goyjIf/gdQ4EL7zZaqBt0U5wBDUnb1PMtOui0cGa?=
 =?us-ascii?Q?zSIoe9519G+U0KgDIS0yokG/qCHAcpUgKJbxcHSEQ62O+73lrdkLvDAED4mZ?=
 =?us-ascii?Q?RINg97wq8ogUPt2nXmrfGSs+rIeIUSnZylMHZ6LITfd+kIuQhQ59IPeC8IMW?=
 =?us-ascii?Q?UwZAVZtoo4TiaTw4sDzOVyQzj40aeuYe4BHt3iXfrpdXExLrUP74wNwId5MX?=
 =?us-ascii?Q?MowzZcZ10k4XVBEU9+Ggwq26E3nyFu3i+hsDkAff0uG6TqZ7QlE1iM+/Yz/q?=
 =?us-ascii?Q?k6G8XNK/9CUHK8wvnlYja/va+fCus96RCgIoomNy/Utzyti+TrqW+88G/OHW?=
 =?us-ascii?Q?FeX3UXupEbfizeJp6+L+rTLU9/qCWQdUm/pYRVCZJvzA8hTU6ltGgw0eUyZh?=
 =?us-ascii?Q?OSdShzPUldFtdapiearUMb+2kSf+zaMyrAIIFcGKXDUnGDUmwlVb9Lk6P1sE?=
 =?us-ascii?Q?AiiCXvhYP4y07WQ2OpVQXNu0S8eI9E2fzJNbWzhfCAlsseOKAobUjaJfCw9A?=
 =?us-ascii?Q?oc6ttl+AaO98IzbKSz7Ag46L09+reTF6Ur5gNgCw2obNuE4v6HpIw0f5iXgn?=
 =?us-ascii?Q?TzKHSOvOVOmNcREOCccObnvsOlO7zS4A5/KykyrLa1qpZ8rcjiEmLlzrae4E?=
 =?us-ascii?Q?w3BGn0OgLLWvaSHq6MZCyxvzilzMYseqf1C19ux/HoRlK5I/m+kNHwU2k4Vp?=
 =?us-ascii?Q?8v0XbSA2BzOOy83+mjNlkWS8JTmEgjZ3C/egYhnyzJiZEglibvCUgF+cMYae?=
 =?us-ascii?Q?hiCJhVjPFUY5GCBLuI4EORU9mq6SbBPdKnsx3wvL8NJs0aaLLQBD+d7GZDuA?=
 =?us-ascii?Q?kubi1HaWAjiYGyFFAXPZhj2XSwd3HkVjHnEXesk0wx7gMdCfv4Fdm8ANE85R?=
 =?us-ascii?Q?5YSnFqjh+zM9jRbkPorgWM8QXeyHpWlcFz1YL63TxdA9h98dbIX/zgwwidFY?=
 =?us-ascii?Q?fzUkQDhT2pg8RJ7Ny1aBzJX9d3kcSvPcztxFLzDvfwg/5xYu8Qytnb227Pco?=
 =?us-ascii?Q?YkhIQqGc9j0DZkq5B/s971YnjjQDC9JwLBQG48+flKTvcstXxHIo6+/VQyJx?=
 =?us-ascii?Q?8tK6S7/XrxGf4wZa1aTKztNec3+22FgeAKqJ1mqzHxaHLMahvjIWEh6C6iNJ?=
 =?us-ascii?Q?4AH69tEUd3O1XgdKGWc10FG82piOhE/sP7AnYicb+614zw6b8MC7aEqcGzJl?=
 =?us-ascii?Q?NwMn1azwSv2nGu+j/oN/QDmuE2akBYPrqaEskVQ559GgsnmO00l9sHH8ANT3?=
 =?us-ascii?Q?i2mbmjTRJ6ebgbGtr5DFy1WCkySfhEMZl4rTlQzQtwlQKszHWqHSlRXw6Xvb?=
 =?us-ascii?Q?Ry7NjFy4Ouk67O4d64qvqDUVKxtIAU+sSWgoDGWSMvI6F2BLa0vPIpN3mo3T?=
 =?us-ascii?Q?hA9PhVjAo+R1m0AAh1hI+Sg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a13a248-d589-428c-6c20-08db2f1a6e5a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 23:24:37.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aIJU1OTz+mK0b3BYNIZO4RZNSlF9WC2tk1OwKAnEPrt4fsVPebkVM0InEgu0+RbTPWP9U6efp+kYO9It/fsrFB1Iq0Wvki60L1D2h4BA+V5dl89IqoEnGgNV0LbHSI/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8621
Message-ID-Hash: 77YZM7LLNGG4XPFBUATVTL6RQK77YBUO
X-Message-ID-Hash: 77YZM7LLNGG4XPFBUATVTL6RQK77YBUO
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Duy Nguyen <duy.nguyen.rh@renesas.com>, Khanh Le <khanh.le.xr@renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77YZM7LLNGG4XPFBUATVTL6RQK77YBUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > da7213.c is missing pm_runtime_disable(), thus we will get
> > below error when rmmod -> insmod. This patch solves it.
> > 
> > 	$ rmmod  snd-soc-da7213.ko
> > 	$ insmod snd-soc-da7213.ko
> > 	da7213 0-001a: Unbalanced pm_runtime_enable!"
> > 
> > [Kuninori adjusted to latest upstream]
> > 
> > Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Tested-by: Khanh Le <khanh.le.xr@renesas.com>
> 
> If Duy originally wrote the patch it should have a From: line
> saying they wrote it (they should be the commit author in your
> local git, in which case git send-email will do the right thing).

Oops, indeed.
Thank you for pointing it.
Will post v2 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
