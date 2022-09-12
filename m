Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197295B644E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 01:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7194316EF;
	Tue, 13 Sep 2022 01:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7194316EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663026327;
	bh=Glq8YNeFriITdfR1jA81yEdWM3YK5rssXIUU5ru2gRU=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nf8S7muYD2y/0GZRI0mPv+lgnAQnKRoP2CqEJ5TLsIJmyTFSSlq9s83UuEXjEsaBT
	 x1ciB9Z1TJNNn4tkQSKmVCUz9Qv/T6yx28bX7BbroYY/7Ml1+DOND/Hw43lR7giY+t
	 y91rdq9OvSL4bFf4X7nchh++ATHsSY1uHMgylqhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C53F8030F;
	Tue, 13 Sep 2022 01:44:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82473F8027B; Tue, 13 Sep 2022 01:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DD37F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 01:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD37F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="GrPyUl2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwn9+jC6MXHwsS3dekkN1kApMdK2QxRnbDH+vjyZ+bC1ceb3tL0SZeC5pQOUqkZ/V69BVND4ochGH9YwENhrf8j3Jh2V2yEzUKz01Mpy/pMVwQv1KIUHoGDMQwrzlmILtXeJ6BU2cPbCBwW9xLFzAvGqB2pQsFtZZXY2Rbe+16JA3R2HuaTtcMkcsxMz7Il7512dg4ro1ItrWCK8P3uScWtf9QgZbdEruuwD20phED6jMStr+dK4DiteOA6ofC75Hr26KRWLjj++HAJmDT39BmRdrOH9Ci4/shrH4/rOs2fLFH0m/9GdRPyuxQtf5I02Z22LBPSvKmpRJUPneY3lRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBDNn0QRDP0+EgV/u24fas85FaongHFlCHhvPbpDIg0=;
 b=d4lTDaYnBBVRrtoxhZkBxH2FMPkco3Vv2kPDP8RWj6BioeblDxmuOt16LLjjELyjeBVUqbtZq5wRNi+/cu70PM16EB4gjuLCf8+IVgifL45FpF4ARnkB35Ih7faAn12iO6a9+RAomMhP8l3TjgeRUIczghyzVxCGhpibmJHdPd+MVSfaOaLZn7BNQpf32Sq39JDqhmCAqh5qpEaOA7In2UiBFnMyTXTzAwEK0qkYwJ5274lhTwt+qlTEBUgPVJCUVGN95D/CJphumtpo+i8IQADfOCW2h8r4NQIcum0M+o+O3eBX5saH5FnL/uJhGVwgqWLS861KgCCtt0oliZkKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBDNn0QRDP0+EgV/u24fas85FaongHFlCHhvPbpDIg0=;
 b=GrPyUl2UO0wJdmY6R7IK39kP+RqSZ6SHL0FQoUWqpBiimuCtEEqlxdMq8oAyLvxfddSs3hRntPLv2K+A+L18yoAR9vwuBII7ne9RU+H8rwPXKyEZsEAsA6zhCB+9Q0RQsjTool3eq/GVj94t3K8B4v4rYvQTDq0mVbvQPhc3RkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8696.jpnprd01.prod.outlook.com (2603:1096:400:17c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Mon, 12 Sep
 2022 23:44:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 23:44:14 +0000
Message-ID: <87tu5c5fap.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ak4458.c: move ak4458_reset() under CONFIG_PM
In-Reply-To: <YxtxbQh8x9o9qJgj@sirena.org.uk>
References: <871qslmf4m.wl-kuninori.morimoto.gx@renesas.com>
 <YxtxbQh8x9o9qJgj@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 Sep 2022 23:44:14 +0000
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7b77af-a5f3-4a12-7c7d-08da9518b358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1uyf4LyYUU4cuXN3XpimFwj7QDCmTe50SkKUH6Npu6YNH+EGvh2J2BJZNYrbtJpFuxOYH51UQd/LrRh7sBiWO37GUBqBdENm5daf2EGOTtprMp33m0+F3AbZ3+sfmDbZ6avu65GLIec/W6zTodWKNlVQErvlyBO19hgfCTaFxCVZRnRUaDg+QNJRXS07niGAnuabj3KkbGAvMsfB15VVcjlbA5fVjjj9e9QGxuDDNxrbIBU0E8v2UOatwhGdBuuCjKpWxHRWN1T2aHUGPDfmQv/GIbSX5SlTa+RAtdGQeeq1Y7Qai33FPiawDz91AUgmaOzkcjbsuZ3rIGYKs/EaPpyl/KpyM3+QS6Eet3fwXsO47CgsqKzn6G27mQtYriIUDRdcl3GYlUl814SQF/qN50HtQzZsISBNiN0Qj2JTTRrJX2aWPvEVbNYW2q3KehQ3QiDdBPrl3+HZ/boxyMt42O8AJyTF69nDFwTjY4kvmazpIgZrjJYy/ceeOjyyL60pzPzJrZ03d4Uj8Hc6S7ZY66C6OrzT4beb+SURK4IGf/y+tGjEfdDFynySNU3mlHQG503k7RqCWDpz13F7B3r3h04ImFtKtf2/+pu5VX11UgLmZBHp0JsPRqXSuY2bOpSBzjBlucUisuMrK3LEXW49jJA4spDkXm/sJPtxGy5RffVg3yAbbRca3zsbtdpfYiJMws2Wo7PEIDThyN8aGO2q48NxfPKmXxkCKWb91DO8PWMyVwYPgtmb2Lh4GMDhv4xrac2La2LQvDA34mugREy9Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199015)(6506007)(8676002)(66946007)(38350700002)(6916009)(38100700002)(186003)(478600001)(6486002)(52116002)(6512007)(41300700001)(66476007)(4326008)(66556008)(4744005)(316002)(2906002)(86362001)(26005)(2616005)(5660300002)(83380400001)(36756003)(54906003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynm0aRTqBHYI3JVIedHqeAKekVF0Vo/Ay2xx4FnVvWEzVlZ4/YP9Xis7ViwR?=
 =?us-ascii?Q?Z9jzBYFSH0DrkxIxuugK9vLVQeE1x1TMa31WC2b6Q4yM6V/RyHeQTwxG5BSm?=
 =?us-ascii?Q?iuYi+4q8H4VNnWsOfLEaMh1tjGj2knIX/09qoXMHcI7+qNYRQxvqbpWVzmyO?=
 =?us-ascii?Q?twYWiB6PGbO+kPc0MXtj1KTCHzc9cZCbRkdR/L0HEbITcfEQUbl8PNGu7XI0?=
 =?us-ascii?Q?JFPeMgppmC2NggUpbydO1wOgJYcHryntD7JIFW+5Ed8iwC04dNTbEj4jUaJO?=
 =?us-ascii?Q?/D68srRGWj4JWblABgMjPi98Xjbc5vjDoma7MCWhF6CdY2sjnvUVFwrCBMDF?=
 =?us-ascii?Q?t8yIFjGo2x7HSkLNrK5m2PZvrJny+e5mWjEYuhwwGAWuPUuGCKmsm0Y4WjA+?=
 =?us-ascii?Q?GgrGm96yOJeukLjqLa7mMTyRAPHBmCY2HskK3Ne9qZsmvW3FDF70HQPfFzaC?=
 =?us-ascii?Q?4QQFhPSt6W5N9ILJrgenW8MOMgtLTkvWEltTgatRDr6VfcYkDcS8rqPp7PrV?=
 =?us-ascii?Q?pwMaHhXY31Gw+qCbnyb93ewvCUWazTifhsRqCUW+l75dW/VChD0E0QEzwH5a?=
 =?us-ascii?Q?7bzxeunOMvHwY2I02rxjLarNE1hFh14g1vzmK5DaXE31SlCt2xGPSFGcX+y9?=
 =?us-ascii?Q?gjOQQ7GauKaL0VfAdguRibHztzSNZyPPvVCeK155rxepU/2E6kzgdx63R72G?=
 =?us-ascii?Q?9CfWaiuDVaXic9WPensXsc+GjSCnPfmTaWddlBiaFB0UM0n2/KuAy0ero/EK?=
 =?us-ascii?Q?oA8w+aK1Pe0a/bzdqrnhaSEr9uVuRrcqCXQPG0dXyJYlXG2mP6EwEX+/55rV?=
 =?us-ascii?Q?l5+FHJHCOcdf6ucXP+78uLBqfvFd5+PUPpnntT13fGq+EGjad3RR/3fLUQI2?=
 =?us-ascii?Q?d0+6dcNlmHaf39HlEX2xrCdNNv9eGcE1q8IemkKkS4qCoqVM1rQoEm+7fFHL?=
 =?us-ascii?Q?Ua5fesv+Vr0ryQzH0IMxSi5/53Q/d1z4SFAo5MB0gW21rrGsqk89d3qlCHR9?=
 =?us-ascii?Q?NmOykJHUBA5PhTg5tw5v6dBV7KfA4EmEti4cZVBqjmA2WMyMCgP4UT1lI+m5?=
 =?us-ascii?Q?rS9p4s2lFXR8+hsarUkMuQ3AEKPgXRzpyJSA38Ufms70Bemo9C1EM/9ln7/c?=
 =?us-ascii?Q?sup02fp/P9fTsScHXc+RFu4OwUtvZo8rRUUKSrK6Sdfxoj1pYx8M7FiYSKrg?=
 =?us-ascii?Q?L/0BJM3MYC9aHNtMn9gxi02s9QtfoyWYAGBM+AXrGU4Q/K6QvwC2KbUezND2?=
 =?us-ascii?Q?HRPJAr7IhoaOZm2oz8yIJF6doL5LHWnGoa0UsqsMCMyoGtqBazNqv6Bblv4v?=
 =?us-ascii?Q?Yyw6WqenPQBZdO31tufoAscB8nUIpRiYAyTaI3npJaVlwe6AFnooHRqO78+/?=
 =?us-ascii?Q?Ip4/BJSUh6dTgJNwPbs+ton+CRgShRpQ6lRC3bZH24wNOx+BDL4yx347Fc8V?=
 =?us-ascii?Q?xVq2uIFMjaYPKWBNyr237qamoTjnSKG7/nSReNXYvFaUvSZ+jIfqqnA3hJPR?=
 =?us-ascii?Q?u4+FvE6TjMcq91BQlbz5/24QOJ2wgmiF4js46k9GsFBGMAJlc5OBzCB5lllu?=
 =?us-ascii?Q?xyn7J0ZV0DcKPO5nkjFj10fCU7iUr8MLEW0DvbXqNHWoUNohFIzLYLgAnv0u?=
 =?us-ascii?Q?egruJsovjWyecKk+V/vGxO8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7b77af-a5f3-4a12-7c7d-08da9518b358
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 23:44:14.8426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlIN+GRvxKLDro15rU8+pk/hv1K9UnsJdFOosj8mpJkSyHVRYKiKSTqBZFPfMbOj7ZC/7vLvfO6y4ygIq+vPySoyDVDt/x60LNadkiawfdAAWIHc4U5xbrtGrputuEbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8696
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark

> > This patch fixup this warning
> > 
> > linux/sound/soc/codecs/ak4458.c:631:13: error: 'ak4458_reset' defined but\
> > 	not used [-Werror=unused-function]
> >   631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
> >       |             ^~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > 
> > Fixes: e9e7df88996d64 ("ASoC: ak4458: Remove component probe() and remove()")
> 
> Is this the best fix, or should we be adding _reset() calls into the
> device level probe() and remove() functions?

Hmm... I'm not familiar with ak4458.c.
Is your opinion for original patch ? or this patch ?
This patch is just trying to fix the compile issue.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
