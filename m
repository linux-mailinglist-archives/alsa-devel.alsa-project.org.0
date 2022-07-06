Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2845E567ED8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 08:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A94C91640;
	Wed,  6 Jul 2022 08:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A94C91640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657089845;
	bh=al2bAvJD0ZvrUjbDNeRVHlIIpkr/GCQQgWr11xix4WU=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3ZxAw0+0oCELmjTsyyDWhBfeCuGRPIa0xQj6vMsLB2flgfoF8zFaO9i91aC6ntEf
	 /YcS3A1iZvcuZwYtI1/QHNq1mQ89IV8T0vBL6QTojDOtFCkJoztbtiE7TCmFg3cYSb
	 MRu+1mplsQysCLsuoLiMlyCj3ezAhbCzx6Ezuz6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E57F4F8032B;
	Wed,  6 Jul 2022 08:43:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF120F8023A; Wed,  6 Jul 2022 08:43:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C807CF8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 08:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C807CF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="DmLO7gA5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyYIys9lyX71yZSFd5kh0Nd7cHTJfbXVJ49yHubHtxUp9U9gA+c32rNE7nQShf3PBdRSn5/cgAwGzTeKKmm41lq3OJHrp69/IvOxYD6bdaPZuMmn5uT89JI7lMMn7p6CiXHT3AQB82ipOBrCl1I+2FB3ZcXWGgZZKoUYnnYaPUqwSHu5qJ1dQRxjUoJiGOEIW/H5tMYKSEWk8VME2ILVXnEUdl6/b5TAgdAAcEkHofMJcRbK+O1PvEnXj5BqLTMm9P4BlzYh+1Rrhl1cPAtUl3ZaSjE40bGMyakQ2cAf9XKFo399JgPtjnbVkFwocXmO5Y2MLFBAkjg/8swiX58Dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kidAP0Mz+TZ16uQR5uHGCNyILN7GW7261AN4KYNxNjo=;
 b=WHyh/gpCj/fbfQesvAYzkpsMsqWBerfGHJEZxZMGkVy7Z3Qv9qU0zX4FFBsl3cpi3PLdVcmmXRSQlK6Jm0DvdVPirfbNuB8DZ37e20FVni3uWrSVkfy0K27tKR7I7fyV+Jgl4y5QmIVqubLhXjv3dhLd+slVBhh8DQ/K9y/ALRWJXS9JP4TxAYOdd0eZd2Om238yeHij5T+/gD4tJvnURlIoZLOuPM213MqRtPN/mDVIukcuO+9IkyP4D0PcCORaCVp8t+wd3DJGmsUS9m+v/LngiDzOlIo16eLSPAFm0S5nphEQVhzNFzHG36AsUB9y82ZWRVeP0actTgxVfwetVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kidAP0Mz+TZ16uQR5uHGCNyILN7GW7261AN4KYNxNjo=;
 b=DmLO7gA5ONz2FVYqip8FcTgRGi0JmC9/vihs2xuwarEkXsN8bSPAJEL4Dks/nRUW6oWqPNUTynSGX9ZkXOOk9HOTHMkwPNztn7gkdIZjpaI3mo4AdXbVOrNMoK7NT4FngVhQEqx10k4i0jPattHaYPTXUrc21Xjk3t3TXSnn31c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB1667.jpnprd01.prod.outlook.com (2603:1096:603:2e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Wed, 6 Jul
 2022 06:42:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%6]) with mapi id 15.20.5417.015; Wed, 6 Jul 2022
 06:42:49 +0000
Message-ID: <87fsjeg2s7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: rsnd: Emit useful error messages in .remove()
In-Reply-To: <20220706062611.73m4cwsxtl5mm32m@pengutronix.de>
References: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
 <87k08rf8no.wl-kuninori.morimoto.gx@renesas.com>
 <20220706062611.73m4cwsxtl5mm32m@pengutronix.de>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Jul 2022 06:42:49 +0000
X-ClientProxiedBy: TY2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:404:f6::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f15e63bc-7d16-4fdb-0658-08da5f1abe5e
X-MS-TrafficTypeDiagnostic: OSAPR01MB1667:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xaLd7I5LL9KkD0mj4qG51aaa8xYlGr7RtDEBHPZDsMA2Wm95X5I0fnRld1ONkz57BChuYuXFvJe4vZbRglAVM77Zc+L2C+q/qbV901JSma9sjYW3QK0fpyUEMzkl6uCHKda2+yW+EFlPOam5AOi60R4OegY6Y3QblWKqmqlu39jA4Ybbmud5SMApfCN8+j5nZh4X2qip8ZW8jNQvAlC43wRQF60V/8GIuLmwTXc+ADSbiLrlQTuO2dO0ju2vgnIl3iDB6QmvDQo4LgpLXq34YNztHyjmPm4ETxrReuxPrj1kQqVKx1IWwRbinyBv2IOtwznEDgi9JaLjIF9nA0S6a2kzWdYLa0nYaHL72LAOu4PLRI6VWlqhUukvT/AF9KbU0ymCebXPTNnq3KxRBI+51vMnBqAkrxjkXlqiVUzHR8hu0ZoHMTVnNRd/MU3viFxnkeekqApSEet0nozVkmF0LCwbeUvOQPQCCmzBW8ZfEzDdyhwwuiwv4x3Cd1F0ZPvBzBTGbOeOe8PBIXgmg4iQevbZHlbCna7gRtDahKFL6izEtVJMbdQb0hsrEDcfR+0OHUuyXpZeb9JUM7CPVENWUBT6CSipz4qVZd5SP2detsQNaHE6S9teKGyf6wu5F5BXNt9w2c7dqlLGLP4t/3uC2YnYBX9qY+vyGw1pdvMssLBbsmieRrC4LVkeqlN/go7w0nFV4clnbQqY1WBVwftsQZQLkodRfWceeARs1n5KZyU9e6pH8YRjJg0jDHQaFGAkvzPdTfTzBC2Lh4LJ1BaBaVXvtFflq7frqOOBY/uXrSGVXI7jCINz75s2FfgZXXC26zI+97Et1h4q1+ERCdjNF/Fb/ApXH+uTSqsN9INsji8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(38100700002)(38350700002)(15650500001)(6512007)(2906002)(5660300002)(36756003)(4744005)(8936002)(478600001)(66476007)(66946007)(66556008)(6486002)(8676002)(4326008)(83380400001)(54906003)(6916009)(26005)(86362001)(316002)(6506007)(52116002)(186003)(41300700001)(2616005)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9kuxG/TgRVU99TxtQyyjSnoVX2FEvRibSNQ+8x9zQ1y/2tkfV5lH9w7W6VGf?=
 =?us-ascii?Q?xHzBQyp54ZUnTLatBFtFwFODP/qWSp1YNz0RICEUHabGjDodkBTlUOa/y9ri?=
 =?us-ascii?Q?iDG4t+gJtkCD/CkLuYULxBSBBha89Y4swHCj83v/Pf3Lq/Gz+oQ3AabCJfQS?=
 =?us-ascii?Q?ZGagm54daZYdb1uUOzUrHxNuVHCPdTH9SB73qUeRwIoKzjuGDBbME1UuxPbj?=
 =?us-ascii?Q?ZAuHIwXAF1LlbCo0FWT7RzA9EQvZ6vDm0Ra6xsMEvVl1d5TXvgYrGFJTfiE/?=
 =?us-ascii?Q?YzCUE67n4YnzgDykDLGVePsKm84zC5dlHA+dBZAKdJ2UOio4DFhEPhLrgXU0?=
 =?us-ascii?Q?hFbs0k4KJQkRsWC13KSHtEGRRd/yRY/H+NaMgBUHnEcx00TK4KQqqt4vMv9c?=
 =?us-ascii?Q?d6Ikx2rUS362oywR52vNWwJvMc5nqBcxeLBpeYtxQs7XWOYKv0G3F+Haa2GI?=
 =?us-ascii?Q?p+PkZsMoa4hN/upzKTGyWFcnNJN51/xViDW1lmMMNx5JxKR/Qya72xrciy9U?=
 =?us-ascii?Q?eITm58ob0e/xuIe8RCFRyVwVmqA0FWXQv9E8tGnTKUxvNHG68gFnGK1LVqtL?=
 =?us-ascii?Q?cKhfz9DxYwS5S9EwfOjy251Th6IIXwUc+zS2+rmKKhPQykT74nkSriS1v9Hv?=
 =?us-ascii?Q?vRPb8Sr84iEDpFlJiSLcAKmCBFbJ/Znczso8Fmf73TMspFLlv+22hyPZpRPI?=
 =?us-ascii?Q?GXmrLjZYt9uwytKqUB14calQ8aqxzyTQaztnxXTvsWrrrl5MTYNiD8F+lTF3?=
 =?us-ascii?Q?ikjlNjI5dlFlUY5Xvd3f1HFIVXx8x/6E6WNVmTV9+4aqsKGu31tGmJJeBEw3?=
 =?us-ascii?Q?dOVhcYAerMW8aWWgZR11mZAyM+uN/9L0Dswysx9R9AZfT56T1F6g7Q1qes8+?=
 =?us-ascii?Q?o1+bckFRHiF/Q3Wr0v07Y8Kho4P9rLMiV7s+m/U/gGP4WAYDU1J6sDJSr85c?=
 =?us-ascii?Q?0UpOqcCiz4BNp/SG5jXLbERkSTJAK0ZWRKFxDkslAcpPrsrj7wEyj2JDCpY/?=
 =?us-ascii?Q?7SBI+xNBIs22uXjWjCKFg7X+Jag6g0p62a66j5GEY6XHeYIK4vPrH+xLKrqw?=
 =?us-ascii?Q?3t47vS7fsm6c+lrMMnymzWc3W8Q59QsskZQb5J/oe8ywsQifFlIE9tcf96y8?=
 =?us-ascii?Q?D0XymTzcOOdBiM4LGauTjcQIq2RuuM76khEOPskg/lzNOMW7D7J8vK6myCZI?=
 =?us-ascii?Q?Kv1y6C35Pd93qlXMQw03gB8d2FN+o0kJNcOz1bmIz3dqTmZOmO4qB8Z+X3rd?=
 =?us-ascii?Q?6bg6XVowVfJ2fKHqJwyB2T9z979d9VwNcToJS6F3nICpCXr5S+RwQLkEFYIW?=
 =?us-ascii?Q?mSJCOPLh+72FJnyaKoq7gr0lii6Lk3cy1uDpjKogU30S7JY3fL6pGhEd1xMx?=
 =?us-ascii?Q?CuOy4U75vTTy23TR/yPEr4JmkFxy5jxQWqvsAl0KSEGk0qz2miZWskebkFNO?=
 =?us-ascii?Q?qwcXH7dt57ilGiFZh5HnG+sVwcGPSGo38qyQOd/MvEpuO+SMgRCpdGoRxnkq?=
 =?us-ascii?Q?/+MFa4o9ZfLNylDBCfsGWqnz/uZP9ZyiP2czH7z8Ptg1DRqOzP1R37swCwhX?=
 =?us-ascii?Q?OGfPKkhG2lNSckGusB93PG+qcz5XDqrKNcyB9xkAELtfbzXVUfPMIzWWqo2N?=
 =?us-ascii?Q?4ZqjpP7q0CmEgwYszunkbrc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15e63bc-7d16-4fdb-0658-08da5f1abe5e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:42:49.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkKn/VHsyfCUQFOS9K0el87jaoBFNmD+a+9eTpC6IFUEjrZ+/BscDlTVQHZ7ImgoNr3a2bOekexssvfiLSsoA+rA/+XAn/KranzYWmx+Avh+2IaGzyW1WVVbWqpY/GI3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1667
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de
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


Hi Uwe

> The motivation of my patch is to make the remove function return 0 and
> the eventual goal is to make the remove callback return void.
> The difference today between returning 0 and returning an error is only
> that the core emits an error message in the error case. In both cases
> the device is removed. See drivers/base/platform.c:platform_remove().

Ah, OK.  Because of "remove" funciton.
Sorry, I was misunderstanding about it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
