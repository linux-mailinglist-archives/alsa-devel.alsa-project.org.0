Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88026CCEAC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 02:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935331ED;
	Wed, 29 Mar 2023 02:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935331ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680049295;
	bh=/6goLK2NnmFIxJ0VxYojp1XhJf+RMzNMJ9915hLJxX8=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MhUdfNkrLbL75gp0tyYKkAbCjrj2K5CGTQvwgOHYV6tMZa3X0UIHAH4CWgpMFqFiv
	 EJr/2zrjqJH9KHvmcpx4jwo/eOP7Y4veBS6jHSfjrDMEDn9l32qjhvZIQ3rZgYv9Gg
	 J+4m8ebHDu7s8xNNcTJrnhLH0yykc+CFUpxm/Vnk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B45F8024E;
	Wed, 29 Mar 2023 02:20:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB7BEF80272; Wed, 29 Mar 2023 02:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DFDAF80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 02:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DFDAF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MyBApRL1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTUoxX8Cky2wv+zW2nK76guIyc74hRP1uyb2gDm6qCI8z3E5IJeghFirZLBhuAEG7xZvVXFiLeu4G4epbU+bPFRUS2gDMrunn0XsENXRW8HVf0QCbKofpHqY35xlrNgN3j07xb7h2I0lyTkCYKY87Z78v1dDK9NKHK5DPNxskrDlQk2vB1PQZ9HOJsF+1a0iNtd292g0k8rBqtyNPyih2fxOiUef4e1OyTrQe1sdnKcONhEye0mXT1uO3vgbNh0nweYmkAtA5vvcv7ktl6riDT3PZBPbWRUTdRU3nIfg7s3y+Z+yJ9WdRBQXmeZidJP7vWEaHu8fOMhgTKAHIkdNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6goLK2NnmFIxJ0VxYojp1XhJf+RMzNMJ9915hLJxX8=;
 b=TkK/RqIUSmlAJxqZCetrm6Hfw+hvb0Byv7kkHeolHCrr4jklEjViIsh+Oal6WcPbIVhJxq8t5nyyum9Z83Z4JMVpb3BGUQcIDq3PkT8bTFK2jGRj+Zaytwk4ZdijUNsHuYWxpHilD3bmWS4aWQFVZy3mf9GpUtv9aV3nsPWl21GACz/OC6W9YapH+xw0kluhvk+vW4LDOgzh9WapeLhPZYvU7/ZVeaAiMKcze3xn7O8QNIZJOH/2rawThXTahEMfXeFhHJ7E06EKylzRnylDIWGXEJS044LZx+v77HFE30Hkt3VXk1iLuwr6wKpXw/xHm7pcmLDqxXqukPjvxb5EEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6goLK2NnmFIxJ0VxYojp1XhJf+RMzNMJ9915hLJxX8=;
 b=MyBApRL1k6YyZxSEYZC+h92unwajMj2UXa9Wl0eS7iTeBFHMA5CXl/RkIodIQIAq4l/Oo7lopGeO2pFkI0+DKfABMCV2HTXyuTnBt9X7o32erwkR0uOqu7RntskE2ahdRK8ovp0gsDmQDUzwDLXirlglMdMkW8hUSfUlTHQFFfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10165.jpnprd01.prod.outlook.com (2603:1096:400:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 00:20:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 00:20:22 +0000
Message-ID: <87wn30cssg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 4/4] ASoC: soc-topology.c: remove unnecessary
 dai_link->platform
In-Reply-To: <e254ea09-1ea7-0317-b227-17a2ab79de02@linux.intel.com>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
	<87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com>
	<5eb5c8e5-a6ad-2522-1b53-5f927a3a7d8c@linux.intel.com>
	<87r0t9g4t4.wl-kuninori.morimoto.gx@renesas.com>
	<e254ea09-1ea7-0317-b227-17a2ab79de02@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Mar 2023 00:20:21 +0000
X-ClientProxiedBy: TY2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:404:a6::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10165:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f47167-6330-4930-200a-08db2feb6282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X+zDdyj4ojUL4nJi2LkSzG0db29mPYZXAhgrIgCmyb/J/Mz+pVFA+SU54mFR/3Gb2ewe2Uztv6fAhlMLC1zZ1+X7r1KakEgB8tY3HZjXv3I3ny48iADguGtMJgMrEhmz1mwAsJcCfQfLN7K2PK2uKkKUGY4M0gHUXOwhO250AoWbCObg3yyTgH0GAdejQGuMqSwN+10PfLfeIu5ACWWCVBPwRxrPUyywx5gYB7sn//eNjyj0dP7Xet0WkHCvbcimZHSrrY1YtDWNSYSBLJVWw6F/NKwaLm+BqSywivGxCWGV3kGqOX68fjyDFbrLcrjfxUUmkniMuekHtXAOHbP1NAt7M9fKLscvju17hUayyoncieqeALLs69wrY0mn4t5aepOr2OnTjvTpf44EXNPmHLiltrZ1pl7eiqyIYxpWSvK/ouJVEcHcGBL9F9PqcYVzXrFBBnSiuLNdLeejLZtTMdFqNQODOe6+87AFCdypoexWS8pmIuBxBfCnOGGNgruqNVa27zg1LisfGJNnu/g8pDwZGA4p4cDnwxSkjeVgDwYg4wML2sz1hbtnwSAWOo2Ygo4JOH0SPvweR3keyqSP/hUIU8Jw8ggaydGEsjWfCSZWVd3qY3Hp836L4LBlFU+7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(8676002)(41300700001)(36756003)(4744005)(38100700002)(4326008)(66476007)(6916009)(8936002)(38350700002)(316002)(52116002)(66946007)(6486002)(2906002)(186003)(478600001)(5660300002)(86362001)(6506007)(66556008)(26005)(6512007)(2616005)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M3qaLe8cJGgdztZqATAinVeVQgiIAHk+8FzolycccEeBKll/z/fl+dHHDgKK?=
 =?us-ascii?Q?p3m7tbNGTUo0UJx+PcUxx6w8tbtTDmqUd7OA9Sro0JuJ36ivWs42B4rzPxNw?=
 =?us-ascii?Q?l4MMZeXWo7kVmSWhSL0SMrK89VoQyNCToF9ju8bSi5Zh7Ls8Pvvg5wQe6Waf?=
 =?us-ascii?Q?A+W3XLoFzrih9SpteRaaSZV7Xt6suhRDmM9YP2pW6DesoZDFZ4PXlgySqcNw?=
 =?us-ascii?Q?Ly8prXIB++LYUul+3gD6T4ZCcY+Z8z56z8+IvoktGGOygjTl4dHURsSw3kas?=
 =?us-ascii?Q?Fa5VQn5ys8wZUkXwNbQ+vrWu0vp1Yxdn25swWsN30ysLhcu+k2htQVpq3JYd?=
 =?us-ascii?Q?p7owIKxEAk9OA6yUzZmnEpKPJ18pqoMafZIKbyuNgVyz44GeReQDG+lMLIG3?=
 =?us-ascii?Q?IbLmDyQcDTdSPfBgMF/W2fMIig0F9mBP8YTlApEISzW6BIa7Q6jfp+oZv2VU?=
 =?us-ascii?Q?WDvMj+xhJYBpt5O2+xQvm427jmyOBURcXUu173Z248cDPMQS1sxO4OuHrPkg?=
 =?us-ascii?Q?pUGcZ1CUmIDJVXg6SHEQrmlHCFk0VP598ztwp4lkxb1mHw9rdTOnYHHLBmVr?=
 =?us-ascii?Q?f3rBBdaSry2TkcIdJVkT5dfANwxwz+o0ca05FvB9ck9wEFPEV0cntZWV8rW7?=
 =?us-ascii?Q?0JGmb8X7wpVkBYjmSFvbZWfjC6gkFyFiczEwTLvjqVZhyCdA5XZU13ONSbvW?=
 =?us-ascii?Q?X7s6i2bDy2QYBXGJyeB43BWUifeKv0oTwDzByEim2hmWgknkQ3rxNo9Q/cYl?=
 =?us-ascii?Q?a/pBfliuliqrwE3D0Sxuo6IzY8V2UDKUlAdxe41j1M6Msh/6jPMHauRqOqId?=
 =?us-ascii?Q?Z09DP5ZNA/S2ZvwnE9tJyfUQOKYRohOapO4JAWfeyzz0FG1XMIS/Yf3/Ybon?=
 =?us-ascii?Q?tY+xNOtePhfxr3R8greEBfTj380JmpahDxOX3QWKYK06l2HByUk0MM+pczx6?=
 =?us-ascii?Q?3NnDiUPCGL5qyLBWQOICO5jQC1kaDftCx4d8rxhSNLkofK7gGKxDmZ4Xmg9I?=
 =?us-ascii?Q?NEjVGbAHmax69qEF4I6YFvhIZosNc/AP10+BJkO7OWe5NjBAbRfpfjhA1UXJ?=
 =?us-ascii?Q?5Kq8kkrM6yMTnKw14s13XWVBHIG4Cm3iv+1T3HDA5SFD04inIxJ5czVMquAn?=
 =?us-ascii?Q?2CjhO2b5z2RIbOimUMI6+J7K15WJYdk6J0oBIcOyKnNUmDitiZ77ODKwsXOd?=
 =?us-ascii?Q?05EHVWYtU1n7iiAlXfqgylpTcUF3G4uvTIgAkN3i7+kKsug0spZZkKap+V7d?=
 =?us-ascii?Q?pZ17GreJ7Abln5Y55OsyVl5e1Ai1tMXVQgQUMofnj6glFK7X/V+STgZazvqg?=
 =?us-ascii?Q?ZgEPXUUlm00KgRfLmn6A+bA7X9kn4z5pdIqyGkZOuMv0+7yzJaKkkoSm/tsD?=
 =?us-ascii?Q?kiD9NT+WD8WIvx9dAcQCWJbmvc2Ohh9VRBjPSYx0h8uLca288mF9eZNnB/UP?=
 =?us-ascii?Q?al2UzLJR25PL0m1rz2dvaiDgX+suyycXTC8bKKe7w/G7R7PoVg3l7Zlj3M9P?=
 =?us-ascii?Q?483XcSC6YzklR1MH0JBK075vifArdtS4uXhQ4miFs6Petn9soj65CevroHSg?=
 =?us-ascii?Q?aTfhwLupoiUTnjw3JoGt9aWMmnS+wtskvV5g0quJ8Jsv01y6g79wac0Q514d?=
 =?us-ascii?Q?9JiaeeNwF+lA0E4ZOnaU3RE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79f47167-6330-4930-200a-08db2feb6282
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 00:20:22.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jQFFoiZs8bTOw5HVhP7GU8nKptfr+7ZPJxV6VD2lyNcQJxzOaGo96+Af11Hkl3EM+5Ux9WhLu85XLI7SvarnTncuwa4H5XR9NnA+e6eJAm6UvV54hwqH8n7FQsxLUeen
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10165
Message-ID-Hash: ALY4JTOONFFWCXAUKUQVGXTWV2ASTZZC
X-Message-ID-Hash: ALY4JTOONFFWCXAUKUQVGXTWV2ASTZZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALY4JTOONFFWCXAUKUQVGXTWV2ASTZZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Peter

Thank you for your feedback

> But in this case the CPU name and the platform name is _not_ identical,
> they are different and we need to have the dummy platform on the FE side
> unconditionally.
(snip)
> sof-audio-pci-intel-tgl 0000:00:1f.3: error: no platforms

Oh, I didn't know that platform is needed on SOF.
Thank you for explaining detail, now I could understand your issue.

In my quick check, each SOF topology might overwrites link->platforms->name
and/or link->platforms->of_node...
I'm not 100% sure about SOF, but I looks strange for me...

I'm not sure which one is better idea, soc-topology.c has dummy platforms
and allow to be overwritten, or each topology alloc own platform if needed.

But I will post the fixup/revert patch for it. Could you please check it ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
