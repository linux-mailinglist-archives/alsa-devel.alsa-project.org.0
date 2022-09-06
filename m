Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D95AF8AA
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 01:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C459082A;
	Wed,  7 Sep 2022 01:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C459082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662508412;
	bh=V7iMZdPYi1PFbQVGXe2LKEvRhoRPAB6562zf7H6G+yg=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRuLC5lkxHutsk9Vcu76fhqQK9AsbpGedR0tpY7gM7M0UYSjIbS6SYctwHB83FJRc
	 8W48v+6hJyAbw0cBSUxgBXL1DaUlVbxN98Nx77I9ayNG+cJuh0BUd1p63zpoAMP5jb
	 Y1sX2y7ut0XhdICXNR1TWnUpn4wZxoMyTrhOVi6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 347E5F8024C;
	Wed,  7 Sep 2022 01:52:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B164F80249; Wed,  7 Sep 2022 01:52:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ACBEF80165
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 01:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ACBEF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="fNF1TyLm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsxpT5onMiXZKSnGu+H730kUJj+4F+uI4a6deWjisbx/obnQ99tw0IfKMCL2xDaXA9VVr6fammxrWSBYoJ9B9RB3EReeG5tWevC+L2jgopH05Bdk0FwA8wSDSfeprT9MdufO+KeOynNZuHPOYjy/g49oOLMTox3BWY2EzU8q7AVLOJyFHz33iYyYFBTqVMKUU8hSQM2BymZU16lhwC8JMX9KQOPEliXSPSwLJqU/ArEHwD6rrvtSkuDH9cISiUKxCOd32VZiv3DCqS+rx9AnkSIJTP+oeGoHiASRQ8iHhGyvdo/FkvNsqVqkkab6HM3Kr+S/RQ6MdugPPeLFSkLXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FjkzX2ExR9jCHZFza28WRad+sY+rTglgw0DTGfoPdk=;
 b=Qslr5ruSlD0/879XUC8EUb39KwSbSSfcNW3WYwaH3XDADMDml/EpH5P1ocLgzl6JQIJJKxLZkbPT95LAfqYapnGWaYmmYuyAr7wCl2r55xgZxD8ZT+IpEKALfqjCtOEm2b79UdZetMI4FKdccAaHxb+7uCKSo1+vaqAt6eCsYlGO6cQelbVRhsjd/TxO0OgizcTebIsjnRQ4Y0yaul85Yr5L++cdcs+91ereQE8s5oLHC3yIp4MaRr8JXqTJmDw9TJQhEgUqvnoMfmcPrBbnUHN4/pnuEJTFwn8m/P9rGjjqYF9c8+7S09pDFU6f0GJAMAjUD+PTSQQeowyN1HyKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FjkzX2ExR9jCHZFza28WRad+sY+rTglgw0DTGfoPdk=;
 b=fNF1TyLmaxj8LBh07rQ5H496Xqa5WTVrRJ7sW5PlMkWmAElBEXS8lFDm8LRRXUktuA2aC86Uc/qMg64W6rOriUiZRkO0cCFvNBDX2zXdKWIi0ICHMcWKQ5rSC/sPQfMQiV2B9147iiSr+x323/xChZWLsMA/twsYGdPS9JrfNUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB5902.jpnprd01.prod.outlook.com (2603:1096:400:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 23:52:19 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052%2]) with mapi id 15.20.5588.016; Tue, 6 Sep 2022
 23:52:19 +0000
Message-ID: <87leqwuklv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: soc-dapm.c: don't use kzalloc() for param on
 snd_soc_dai_link_event_pre_pmu()
In-Reply-To: <Yxc2wzbZsSVZNf8Y@sirena.org.uk>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
 <871qsp9zsm.wl-kuninori.morimoto.gx@renesas.com>
 <Yxc2wzbZsSVZNf8Y@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 6 Sep 2022 23:52:19 +0000
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d9e987-547b-41bf-cbed-08da9062d594
X-MS-TrafficTypeDiagnostic: TYCPR01MB5902:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLHs81/LGiJEWYX3A5zKt7wq0qIUh6L/3Fmoit8/56cYZpyU/hnuU7DihYGntivhBSeKWzRB3VQiJkRhuEe2T/Md3y0/JbGaJG9Rd98yzT7JLNB3IgA4NvqJBYab8tYcrH/In+ro4kWYgFA4/Egr+H5yN+r/QWKR0CFKQusEwDbEzcgHcZ1jqmLpw3hPsUu/qqD2lUbjOo5db4NdeciD9ygT3xLwbLs0OrBjlbVHy2scg3bM10NnmXD/4gMXFF6AOce26qIFHaawmkoLDlvao4NUYUFMDVucumA4k9uKw2ZxLv47D5xGBHQ7Lj2NLQcOJUWvkdZRf4Pn6T9LMZewN0oYIyv6ATLKvSwrrjsOIPEUJj8Ur0jtmJioQHm7LsR5EbSn3K98X9gRR5rrO4CpJpb7YIK51Gs+shYIuMGV043wHZvpkBQPYneWEH99ioNCe1r2xFlyq5aEwoTAejSebntJXNxfkupQHj2Cv44IYHHYZQFlFJQEm0bG2H5nhI6aHpskxiQ2apcJWXDZvGJ06szRPo3NGaKYecDNl2937bO6dlyqsfLnkOi22LAff/mfBOXzgpPnjl/AO05eZ3q6EWQRwx2vsRSMOxKLIIYTREV+wzfiSqXdPXRoCRg+168hzmHgA0A1e+kMivaUOrMGGozg4iczxuTWlrztgiebmCMQE1kafiNLy2O1qNsEYxK1p0okszvDuvOdax9jBXNAys/PAGhGVFan5lJ7FrW2chFOXceUVtTyvxx55MxFJD8V1RG9mJ0UocLK/ep6UGrBHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8440.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(38350700002)(38100700002)(66476007)(66556008)(8676002)(4326008)(6916009)(66946007)(316002)(2906002)(4744005)(5660300002)(8936002)(2616005)(41300700001)(6512007)(186003)(6486002)(478600001)(26005)(52116002)(6506007)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O+ZT7xlFCOokzez6JurJdpnRftK18BiuKOaxWDqGAVffBnMsStuncAPxZ2uT?=
 =?us-ascii?Q?/AFAi9GyJCJ9D+CuCSY2Y7voz82XJoOOVaFfMFfpZdAmKPx2uZq7LQtS69lF?=
 =?us-ascii?Q?STwauugel8J00wwyIAvsVtzoSgXj96E7wEcVZ6Zyt5Q/c8xo5A0B5wsFPbnG?=
 =?us-ascii?Q?eZlMrBx4UvTNTL0oqQvOtGEghUO8VTETHNjoY07p6iUL/tcsz62Jn7YiT0qn?=
 =?us-ascii?Q?ZMa5AL2SG6pyewrDfcPIR4kROQMXLKqnNVIU/kI+zmcEidOhYFAlt7JST5Hc?=
 =?us-ascii?Q?36F6cxIjAvkMyriMw8mzzbZNIbWtNAFsKDm9UqyLidNBuaxLNym9VYXK1K8F?=
 =?us-ascii?Q?D864pCIWFpNEJ733bX+XA953puejw8pj+iMqBPv2DGRMYhzDZRyvgvUmyg8z?=
 =?us-ascii?Q?tCZ3u4yWu7yzzEzMN8i/sNYvqfKS2rqyD72TUFNizPQyh5xEvqfh3oGK0ZEt?=
 =?us-ascii?Q?gkffk3jqSBmv4uvFcz9erARhYqxJsHhWdUQbuUs+33vJMF6Jqzd+cek6snwU?=
 =?us-ascii?Q?7y1RTB2iNXjsg6j8f2nS/5YVY4tvTxTz7L9DJUOawMvDMm1PsFkdK+XRn3Uf?=
 =?us-ascii?Q?KO5Vp8QpRjc4pmDq15YELbrkzbIhN4YTUcanlEjwyf0vWoVqip8EUeqBfRJD?=
 =?us-ascii?Q?P1me3kDMZdlyepRBg3ZpQ9qtxBwnUYUmmz0qzFAw4Skn5g2f3Tr27pcCdRRs?=
 =?us-ascii?Q?KQJDdJWgRkvf7qaEMvNM5xKf+Ca8C35tHhDqU4ljOYSzUwfvOkIqwq86p0Jd?=
 =?us-ascii?Q?FZI1XUDSso2LKpcHXE4jrd3RyfnRYDkae6g5AnJZsFDt3xbsxh0XH4BBa3pR?=
 =?us-ascii?Q?NUpmJ5J3JiYs3xj7vPi5DNx5AmVTmywxOiBUMdy8gaEur1Y6274qwugicwFT?=
 =?us-ascii?Q?fuVDYHe8fXA9bry/hRV/BiNP3bNCuLDom276jGL/cvH/1rxtk4rn1wcjLTVE?=
 =?us-ascii?Q?Qk0zTN0Wj8gPvQ+X1uXwQgNppL1uLGQa063wsvKjZ/aY2poGQulpymxlKVxv?=
 =?us-ascii?Q?YhsOzTqbUlVd6pRfK1DJ3wT32bpl/w+glwM8Gbme9fgLE0HDhcJPGggl66mQ?=
 =?us-ascii?Q?FY+cv7wsW6EeXrsN4mBYuftc7rLGTftCA3tuH2GVAvIR5gqhNPD3YtElFI92?=
 =?us-ascii?Q?TtvY6fCfN7JLH5AqvZAS84Euv7yGj0aTXPChew+lFcVaPGlTMyKXHA0wY5Nc?=
 =?us-ascii?Q?T78Wk2ribLPct0MBAaXiYYDPdOdub1qDBr9fOsokAxgke8BC5EQ9a47Tsc3p?=
 =?us-ascii?Q?JRQqvIJfz6CPX2lavezpVRX1TSpSAaX6j4ZJK8ST+8xR2WVvRyV81CnYRDja?=
 =?us-ascii?Q?kQgAcC06kLiOGY5uRxExfSWnJhIlDfUTIIlyhsi7gnLTjDojSaCFmDcdrFwP?=
 =?us-ascii?Q?xQ+2HYItMoh+k0IsQbt4xCNt6CzlZ0pDevv3B9bwgdCvz3k5UF+qQMOsSXyl?=
 =?us-ascii?Q?UXjp1dHKzbXDT3YR2Tuk+iNO7TkuuAyjsFnJ9wOxjvf4u2KMJtANpega78eo?=
 =?us-ascii?Q?97hU3no+DwAPjhg7G7q0zJ7qeRv4fX9JmpFozgzIxHUyUQiY6BXlOp89zzmt?=
 =?us-ascii?Q?aUZJ0L+qVI/LL9gHRtjrcuf01gpUDFfy05RdOsk0Q7/221Gwzri/syPaT5C8?=
 =?us-ascii?Q?oHJNRGKpbL+glp4h9UuonrI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d9e987-547b-41bf-cbed-08da9062d594
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 23:52:19.1777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJa0hdgZN6yffC0DEEPCkz+JLWS28/hfCK/EuS1HMv7NNjnKa1UaPKnpbXDlY20gBn9KUJk/BhKxHVQt44zt6h+S2uWJVillsJYZv9WbRQgBwcazbijkN++3JW0PR+h3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5902
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

> > Current snd_soc_dai_link_event_pre_pmu() is using kzalloc() / kfree()
> > for "params", but it is fixed size, and not used on private data.
> > It is used for setup rtd at end of this function, just a local variable.
> > We don't need to use kzalloc() / kfree() for it.
> > This patch replace it as local variable.
> 
> The reason we're allocating it dynamically is that it's quite large (608
> bytes on arm64) and is starting to get a bit excessive for allocation on
> the stack, especially when you're building with some of the KASAN type
> stuff that increases stack usage.

Oh, I see.
Thank you for clearing the reason.
I think it is very nice to have such comment on the code.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
