Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C948D5412
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 06:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D0E1671;
	Sun, 13 Oct 2019 06:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D0E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570939467;
	bh=pUy3u4CdArDNWRKvVVHNFL07EiV9J9JOY90uyGhyLSY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaGzPYgT2LylDBcXjoEVSkiM17Y2s+sEqXNni4NIDkF492/fXDeGvxSJbcBhxmCzE
	 wn3QIeNPm20AzfzGM3JuXZmllNkCPJPLqNfAx7NNSE/RTPWgH0uHRr1jYGwrC71wc+
	 FMhsv2zQrDve2QCPROUIZeFqlUcIlFrNRRW0N22U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE1CFF80322;
	Sun, 13 Oct 2019 06:02:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ACB1F8036C; Sun, 13 Oct 2019 05:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 411BCF80322
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 05:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 411BCF80322
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=kernel.org header.i=@kernel.org header.b="RUtF2zmo"
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D3tchT031324
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 21:55:38 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D3tcDF031313; Sat, 12 Oct 2019 21:55:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org; s=default; 
 t=1570637969; bh=8OFuYNdXenlIjXhNk+D84skEN7SLhZksMmULahT16D4=; 
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From; 
 b=RUtF2zmoOA+Eyi5K7g4B0P1QN6UnntoqpXCRKzFWti0cpfF8VaNRqyfctxgOzK793 
 5+hggukDZPOHe30wTWuPrOdLMzyAYdTX83ggiL60exti/cDqaDaTHFC/hDQWREuKo1        
 ttBuOSNBHEyzVPHxnmOIrHdY5GwQBzwlKDT8zhQo=
Received: from BY5PR03MB5284.namprd03.prod.outlook.com (2603:10b6:a02:ee::49)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR02CA0036.NAMPRD02.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 19:18:42 +0000
Received: from BYAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:a02:a8::32)
 by
 BY5PR03MB5284.namprd03.prod.outlook.com (2603:10b6:a03:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 18:13:53 +0000
Received: from BY2NAM01FT040.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::206) by BYAPR03CA0019.outlook.office365.com
 (2603:10b6:a02:a8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 18:13:53 +0000
Received: from ipmx1.colorado.edu (128.138.128.231) by
 BY2NAM01FT040.mail.protection.outlook.com (10.152.68.174) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 18:13:52 +0000
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 11:19:12 -0600
Received: from ipmx4.colorado.edu ([128.138.67.75])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 10:40:33 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:19:32 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731777AbfJIQTb (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:19:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35420 "EHLO mail.kernel.org" 
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP        id
 S1731083AbfJIQTb (ORCPT <rfc822;linux-kernel@vger.kernel.org>);        Wed,
 9 Oct 2019 12:19:31 -0400
Received: from localhost (unknown [167.220.2.234]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate
 requested) by mail.kernel.org (Postfix) with ESMTPSA id 7B9782067B; 
 Wed,  9 Oct 2019 16:19:29 +0000 (UTC)
Authentication-Results: spf=none (sender IP is 128.138.128.231)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=pass (signature was verified)
 header.d=kernel.org;o365.colorado.edu; dmarc=pass action=none
 header.from=kernel.org;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
IronPort-SDR: gfJBjV9xkdt4kyB4pJ8cumqdS+zSul47FxwqNTbI4km9ljw1I6+vO/l7Tx/QUj9c5VxFQ0nIFO
 GR/5xim3PppsNqx6v3ycgbX7PpQuvrcKE=
IronPort-SDR: op9/PYM5BPXHkgbkxKbHFb9/kO2UoBYHpDAMCRszpH+50+4DhDUqQAAf52Cd6WQ30CgrUvVQjW
 l6u9VE4TFwTvFUsAAjfXkzuvmN2zc4QRM=
IronPort-SDR: wklZqGOAcKL+Ij9DiyzuLCuDqIP64MREvnS1+PTAFvEmZ2vvIb3QgooNF9FcNJYuNyd2Pb+wWd
 J8XrxI0bIuOBFkSbYYiw+26NWpI32nuag=
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
Authentication-Results-Original: mx.colorado.edu;
 dkim=pass (signature verified)
 header.i=@kernel.org
IronPort-PHdr: =?us-ascii?q?9a23=3AGFGtwx307IOUHct1smDT+DJfSgsGnvDZIAcR95?=
 =?us-ascii?q?M7irVILv/8rYq3ZR+X7KB3l1aMRoXSsa8a2KLd5rrtXWUQ7JrGq3EHaJhBBF?=
 =?us-ascii?q?cJ3MYbhQotBIiCE0KoSZyiJ2RyVIwKHEQw83y1OFVRBJW2ewiL/yLqs2VNS0?=
 =?us-ascii?q?uuZm8Xbqy9Usaax4y917Xi3LPOUiNEtDe7ZZJwHBWQrkb95pUNgqZEdZ0Vyi?=
 =?us-ascii?q?nKuV5NRsBfxV8xe37PykWZhI/4tNYru2wYu6cN/tJNA4vgeKFqcbsKJz90CH?=
 =?us-ascii?q?0/5sDgqUv5QAWC/HYaWWgNwDtORjLI9BXrG6v24AXgse8uvUvSdYW+Bfh8ET?=
 =?us-ascii?q?731Zp3ZkX6jSAgHn0U4WCKqZN/0IgDmEuYgUJCxYjIZ5iNBNFEXbHzQs8bHW?=
 =?us-ascii?q?FZUOgBaSVnOJqtYYATH+UmL8UH/tKYxRNG5VP2TUHkTL6syjBHm3za75Ud8+?=
 =?us-ascii?q?l6SR764xEYBfUClFHGvfzEOJsiAbu6w6jsk23Of+9XnjzR8YHkeywBj9rLXZ?=
 =?us-ascii?q?5JTvD81GooTmanxh3Y4cStd3vdyvgnrk+gycBAePO9tVYHuwd0hRm15ssd16?=
 =?us-ascii?q?bWv6gH1VTn2Rkp0oYMIojrAF4+YMSjFoNXrT3fLYZtX8c+Fnlhoz1pkOdUkI?=
 =?us-ascii?q?OnfCUM1JUszgLebPrCSYWT/xb/T7jBczJownlifLWljhq1t0Ws1760Wsq11Q?=
 =?us-ascii?q?NSpzFe2pnXt38L3gDO8MXPVPZn/0mg1DrOnwDe4+1JOwY1wILYJoQnz7p2kY?=
 =?us-ascii?q?AcvA=3D=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AO9atdhW/hJs40rhS2us1wfNIO8rV8LGtY1w5yb?=
 =?us-ascii?q?sCzp9Qe6C+9ojjO0qDvqo/kgqQDs3Svuhfgq/Ns6m6BDJTqZ3Uqn0GeYxBW1?=
 =?us-ascii?q?geiMAOmwFzSMLQCkDhKvPuKSsgE5cnNhcttznzeQAdA5PyalPbv3muvnYOT0?=
 =?us-ascii?q?yialIrfbukRN+B6qb/n6j6s9WbKw9I0WqaT65DChmGoAPVl8smga1haYphlg?=
 =?us-ascii?q?DKj10XQMBW92BzAFeuux/82p7u0MI2oEEy87ppv4YIGe36KogxUbEKIi4hNj?=
 =?us-ascii?q?IJ45/Avkv4UAGN63AAAF8bnBdSDg7O4Qqof5G0iCbisvs45C7IE9fxSONRO3?=
 =?us-ascii?q?zqp+8jAFeggnI9CiIXqnPSjetZz49KoU+C+BMj6dbsObizasd4eL/aZMsqbl?=
 =?us-ascii?q?BiTOhuSy0ZCZuyQdsxBsw7JPdWpJXtqHwcjkTvXmzOTKungncAzje+gO463O?=
 =?us-ascii?q?s8Ei305CsAEolWr0jrse3vE6s2dPKk5ZjE8QWTNPxZ2BOjsIXYbhFmqt2VVJ?=
 =?us-ascii?q?55Ter/4g4vOzr6tHiNiou8WlHdnqxF+yDTp6J8SciyrFUBgSFcsyqR/uc8jI?=
 =?us-ascii?q?zup5g1xmGZ2jpA6pQqIf6UdB5pYeejRcgYp2SbLYxwWsQ4XyRytT0nzqFToZ?=
 =?us-ascii?q?egZ3tQksYO2gLfZvqbcoOB/hPkUqOrLCxlgG5+JuLtggb0+k+kzff1Ws7y3V?=
 =?us-ascii?q?pX/WJJkdjJ42gEzAebqtOGRf104lq71H6R2hrS5OBJLQF8lafSJ5M7hL9lvp?=
 =?us-ascii?q?keq0LOGmnxgkr7?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FJAABOFp5dh0tDioBlGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYF7ghuBdiqSf4IPjxiMFwEBAQEBAQEBAQgtAgE?=
 =?us-ascii?q?BAQGHECM4EwIBAgkBAQEDAQEBAgEFAgEBAgIQAQEBCgsJCCmFNAyDRmsBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBFgINVGQBAgMBAjUCBgEBNwEFCQEBChgJJQMMBUk?=
 =?us-ascii?q?Ygx2CeLIOgn0BAQWFdYE/CYE0inGBHRiBQD+EIz6EKIYIjzieD4IsapQjJwy?=
 =?us-ascii?q?CHgGXFagLgWmBezMaCCgIgydQEBSBT4kHhVsnMYEDBSETj18BAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FMAABKBp5dh0O0hNFlGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYF7ghuBRDEqkn+CDxSPBIwXAQEBAQEBAQEBCCw?=
 =?us-ascii?q?BAgEBAQGHECM4EwIBAgkBAQEDAQEBAgEFAgEBAgIQAQEBCgsJCCmFNAyDRms?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBFgINVGQBAgMBAjUCBgEBNwEFCQEBChgJJQM?=
 =?us-ascii?q?MBUkYgx2CC7IKgn0BAQWFd4E/CYE0inGBHRiBQD+EIz6EKIYCjzieD4IsapQ?=
 =?us-ascii?q?jJwyCHgGXFagLgWmBezMaCCgIgydQEBSBT4kHhVsmMoEDAwEBIROTKQEB?=
X-IPAS-Result: =?us-ascii?q?A0FJAABOFp5dh0tDioBlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYF7ghuBdiqSf4IPjxiMFwEBAQEBAQEBAQgtAgEBAQGHECM4EwIBA?=
 =?us-ascii?q?gkBAQEDAQEBAgEFAgEBAgIQAQEBCgsJCCmFNAyDRmsBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBFgINVGQBAgMBAjUCBgEBNwEFCQEBChgJJQMMBUkYgx2CeLIOgn0BA?=
 =?us-ascii?q?QWFdYE/CYE0inGBHRiBQD+EIz6EKIYIjzieD4IsapQjJwyCHgGXFagLgWmBe?=
 =?us-ascii?q?zMaCCgIgydQEBSBT4kHhVsnMYEDBSETj18BAQ?=
X-IPAS-Result: =?us-ascii?q?A0FMAABKBp5dh0O0hNFlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYF7ghuBRDEqkn+CDxSPBIwXAQEBAQEBAQEBCCwBAgEBAQGHECM4E?=
 =?us-ascii?q?wIBAgkBAQEDAQEBAgEFAgEBAgIQAQEBCgsJCCmFNAyDRmsBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBFgINVGQBAgMBAjUCBgEBNwEFCQEBChgJJQMMBUkYgx2CC7IKg?=
 =?us-ascii?q?n0BAQWFd4E/CYE0inGBHRiBQD+EIz6EKIYCjzieD4IsapQjJwyCHgGXFagLg?=
 =?us-ascii?q?WmBezMaCCgIgydQEBSBT4kHhVsmMoEDAwEBIROTKQEB?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="414433458"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369154081"
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
Date: Wed, 9 Oct 2019 12:19:28 -0400
From: "Sasha Levin" <sashal@kernel.org>
To: "Oleksandr Suvorov" <oleksandr.suvorov@toradex.com>
Message-ID: <20191009161928.GT1396@sasha-vm>
References: <20191009143836.16009-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009143836.16009-1-oleksandr.suvorov@toradex.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 18:13:53.2715 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 0187f2b9-863c-4ff7-77ca-08d74ce47143
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.231; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:BY5PR03MB5284; H:ipmx1.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT040.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0187f2b9-863c-4ff7-77ca-08d74ce47143
X-MS-TrafficTypeDiagnostic: BY5PR03MB5284:|BY5PR03MB5284:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 18:13:52.2196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0187f2b9-863c-4ff7-77ca-08d74ce47143
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.128.231];
 Helo=[ipmx1.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284
X-MS-Exchange-Transport-EndToEndLatency: 01:04:51.3649967
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vg7svxFX2MsUdsHtE1YpcCky02pMNrCw7oNJlNgVmhLaWtCrjVamQ8/YYheC?=
 =?us-ascii?Q?PfLHQQFv5E8Dyi73bmq+J+o9pYGElChB0SZIkpcseS5YCaZeW07tU/KWnC/l?=
 =?us-ascii?Q?KxBVLWIpAZkFGjPGUQYrn8XdouZrnvXKBy6GIV5IHxrcI712jiSuhV5J4vau?=
 =?us-ascii?Q?IBoVl2LeROiXW3Kbp8Fgqh1Kejz1HSUdFkdjitXLH5hu1n1dhaJFPtO0npDv?=
 =?us-ascii?Q?LVcamcw1E+X9e8376XqVrVpkN0+tsVVVdvypjPR1+Ql5NFTw87EA7uZymLOn?=
 =?us-ascii?Q?aAb8HsKP7GYf+gmmOkA4pfvubnEnS7vbn29JENoeKcfdkLBy9Qd0YaGYqukS?=
 =?us-ascii?Q?Ynje4FHcWcPK1gaVgurL6UOe3d6OJ1o2QcC/jHoxSVX2v/AVT5U7WhoFHbCL?=
 =?us-ascii?Q?vBOJsJCB/9J1xeQXck6yLqa2VhtVPTSwI2NV9krpKq44hdcuti4w6GfAEjyT?=
 =?us-ascii?Q?sq2VMgaqgiu4aB836dLIUgBwUJIsIsNdf08/TKh1VhiqvLJ3wtnk769hUBtj?=
 =?us-ascii?Q?DMn9H3ZrUCdpG2D1+G+OFxUAZJ/7PhLqarb5hmVMQyt/R/qVPgBJgYKaj9eq?=
 =?us-ascii?Q?oi1cd7iGLNSUz8m4twLgXxrLInO/6aZdgwhMm3U7GZ+0ND/23FGxy+xZIlkn?=
 =?us-ascii?Q?slP99mU39FFzbRwR0FVTTkAi2I34qRfWx06tKDlrUZz3hm9pzIPUffV+IBLZ?=
 =?us-ascii?Q?ARDE/a6Ches8IeBNc5CedT/VUmXDfK+1/K+F1IuABPpU7NXDp00o10MORl97?=
 =?us-ascii?Q?Y8ERx+1aokRk1oI9RHukeDYI0ZJv7aiH1NTcxZTIwOk7yLoReIA9KH9afowT?=
 =?us-ascii?Q?WeHz/3xU8oSbuqD333/y+pqbBCbAt4M3nkT7MFDuvD3i/oXyUWwiiiiB5tV7?=
 =?us-ascii?Q?425+qyBpjUs0vPb17Dfj4qshxNL51P+D+/SNwifUm6TSRPvFe9JEVJr4q2B9?=
 =?us-ascii?Q?feaktBFS+FZUJ/tMXmQSy2nwtDhaojNBDfWHP7MzupHW7Maza7Ygs2bTlQCu?=
 =?us-ascii?Q?FhjsEyOY43c9intq/RmB1La3i66CTQxUF9jV+tJzwDHNsZH1fhtaIKblaPLg?=
 =?us-ascii?Q?A+LdutbS/cbGKVo0IvgiWRGeYkuuNx+wkKno1FKxx5gU0Nbl8Vu5ZjVyO2Kd?=
 =?us-ascii?Q?Iep7CwJJPrdaHmR8s+neGtAvtxGs+LhEfg=3D=3D?=
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 0/1] [for 4.14] VAG power control
	improvement for sgtl5000 codec
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 09, 2019 at 02:38:40PM +0000, Oleksandr Suvorov wrote:
>
>This backport is for 4.14-stable.

I queued this one and the 4.9/4.4 patches, thanks!

-- 
Thanks,
Sasha

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
