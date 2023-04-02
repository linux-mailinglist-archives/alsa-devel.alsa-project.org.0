Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7316D3AE0
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 00:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7EDE74C;
	Mon,  3 Apr 2023 00:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7EDE74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476351;
	bh=9GC7Ydo+2hFh4Un6xj6KWO2S4vVr5IRvi+aB7E0W/Hc=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HCqLj1do0fPmei2wcMAME1z47G3UbS/IorHTIr3tItVKv2hLVfHm2ahIcmyHQdXgw
	 CzhGMGS8nVykZ05l9vUh5ngLo52O/JK6JHhPta/FXfJ51BauAD8CSQxN3Fs1fTMLKs
	 iMXMzZTqglmzstkdipOjjcVsDfh26fTJBsPIlITQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E52D4F80495;
	Mon,  3 Apr 2023 00:58:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8D81F80567; Mon,  3 Apr 2023 00:57:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0FA4F80551
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0FA4F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fFYMSx58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmT7HMtjlyYa7vgOr39ZT9w8Mr+p9XrUSK1tX5F6wMKzGhFIGMMucJIeoYPTi8YB7ZQ/hc8iaXBlUp1rkk4hhzmGDbeFJCSXBvcxcPdVv5kNJvaUV2XFMgJ9ge4yADpK02E7IvaP1uqA22u2QwLzSh0EnAPAlIlYB8GcUQM0Ult3rwfZyf+SoO+tv9kU2pq9I9MtA7VOGSjB8PdJEtaeWrgltSUY5XJogL6JRvMAsBXye8fIHcMniOcLvb44F8OQlAPKB3m0NW93IY4qZYJbL4gKMRP8tDx2S50a7rXVe9u3kHR2gOs2zNDEegZ8b67G6GFnoWt+d5HGHiKzv+Ty0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCl0lw/m7lybyAYX7Y8k0XO7s2i6HEzHUY24zWhecqg=;
 b=PxBnKvuiFAkLyLMLVF6KWvuMBI9YFptlqxj96GC0SJg9unAtJ6JWW8TTo6x2Sc89JYK7ZLBZ6RPg75Delbk8Ke8coo+TOnu5VRDvDlme9jdUX/P4REge3/xY3QflSuO3ry0wnmMn5hnyN9ZSOsm6KRJ2GJ63RclZrZrpkrs5fA2UrLM8sjK5djgCgkl9DX4sN68+GxiC41O6czFNjrEVwmECoFyWZg5cWXOWhDGaj30un6ADg85cmpZdpcc79vmR5SlDQ2giyar9uvnq+e9tZezhutGNFfAoHfcuDi5O6bifW84nJS7StCJtkvpivPmSB69w8KcPWZmYno7cVfE1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCl0lw/m7lybyAYX7Y8k0XO7s2i6HEzHUY24zWhecqg=;
 b=fFYMSx584rj1cJku92uwm/4JpeQGtS0Z2qQwqYwdtN/jJfNk+3V45ptjNJo+/i1XhygB3aG+VwrXg7V4j8RQidK0Lq5z4RvY9WZlNRpmWcu0MaZXgTfn5I0GxIA9LY6UC4EnbRmwaVV6OFFkTGAlHJg456tBQb+/0VoRDTXqhUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10184.jpnprd01.prod.outlook.com (2603:1096:604:1e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:57:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:57:15 +0000
Message-ID: <87r0t1c2ph.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH resend 0/5] ASoC: clarify Codec2Codec params
In-Reply-To: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:57:15 +0000
X-ClientProxiedBy: TY2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:404:56::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10184:EE_
X-MS-Office365-Filtering-Correlation-Id: 2deb6eb1-6eef-48d9-040c-08db33cd9a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HHCOqhdtaoKQF2Bnm4GWL7F9xcvGY9eVCLuxOu+z27ZvxhCjMkwxajYFdXnYxvsWyqI/SSb7HdoDK0bYMlOjd9O1cTN0uVT7vJtiAXLcPec5Tw4wg2fTHSoaARh44tKr0Bp5Z/ZrDleTFzB9ki1WxOG6uQ+XGe5blDCJW78mOOuVOAmotPShhreWRyw+XP51ohnR+N7kDBWFEJCmN44C4wrILzrOQabbpwFZUEmpdZ/otqRchPcvOl6/bXEVSA5/3XJMaMICehqC6z4Y0iPjbY2rwoDQ3+cLp9KffupSLrIe2wHSPZuqKxszdemA4GkedxPxc6iyhqj3fMiP/+sJRCUrbA1WOpztUzu3MxzO/T65+kj6iydKURwxn4nWocN6E0R4AuMQf3gWPZiZo6CxdCM9mH6Sey0KabVOALyTmYy1zTIFbS2gOOHPTQTjGnLyvUbAlymjtc9qdAvRU8GsAirLmV3u8e7A+QUsDj9oRiW0XA9jPjv11gkNS1FY7YhnrFQbHnyFeLK1SKt+DCxalKiso8/KDlWlctvWVvaSvXb/Tq/J/SjcRpCbourEM07KxVj66x8nZ5T7rjQzBXg5Vg9kzk8cqsXFyVuYllVzdFw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199021)(186003)(6512007)(6506007)(26005)(4744005)(478600001)(36756003)(52116002)(38350700002)(38100700002)(86362001)(66556008)(66946007)(66476007)(83380400001)(4326008)(6916009)(8676002)(316002)(2906002)(41300700001)(5660300002)(2616005)(6486002)(966005)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F861YLQtiSUxddaLwR9Iz1nlc6Nq5tIS1sKKS5wTbbRrSBWmTNNS3fdwvSZv?=
 =?us-ascii?Q?FFiEgIA5cYdZU0d0NqkcM8LYYTJKLgGK7JFbQwUhgCHdzNqJ/n2SLhR/cxZi?=
 =?us-ascii?Q?fTv7IB/FaH+138dlVSYiS99KcnBk1ZJRJcxB/XfH7OX9oibGE+WVje2jdhZt?=
 =?us-ascii?Q?xji8qkhKfK/oF5s/SVls3vUUE9iDGvYTRh+obdpD9T5bLboc/c8yT4utV+Jb?=
 =?us-ascii?Q?4+DVcTfHt6YixDu67lw5A+tMkM0dyZgpb8G9rgA8Wb5Rum179kwAohtS52qP?=
 =?us-ascii?Q?Vvx0gqLZSi1/NrLsVMhQhuwhA0JwbtPEs62KvDSBysakTGo45St7h/HMhdJy?=
 =?us-ascii?Q?rlHCtnEyBuyvylZPAGfiP9bEQS3tDdQny4x8cNTeb5jajTophH3dQVGfk7Au?=
 =?us-ascii?Q?qvv6zG5xQQrSXiJmMUpz8N3gShxh4lJeEDbigeDGTuzj0evneFtFClZt+KDc?=
 =?us-ascii?Q?teFf97xJ3iQmRyb5Z6wztmKjKi7x/Av/y95VV9hbbwbQL7fI0c3t3a8DO9WH?=
 =?us-ascii?Q?aGt7CaisLikwquRaip/yJE05UN4JvBSbFHU0lzLCYDThSsKvyseVJA7JTd08?=
 =?us-ascii?Q?iEQWU2Ft5e2tUYrrP9RP3X3d+hEjT2CX+L2qiQXJD8EFIH5wVn0AZy264sI1?=
 =?us-ascii?Q?4N5fD+cl2fwCDDKAw1hpO4aRuzw1lfPFHruWEy8q990Um+Zqm+BsXWjsvcoS?=
 =?us-ascii?Q?JQvGl7yQ7bMeddHy+4GIRNKH+2UpbbTeODksQE2GUEgHHuh6n+W5psNk0ayL?=
 =?us-ascii?Q?KeQWzLlukwDnllvoJQmFhv/vyA0q7QmFZ6JyZPVw4DknEhpHK4y8kjVja6i1?=
 =?us-ascii?Q?hRIf2+0d8CtEjnqGQrXCDJ3N0o+lzYYqi/8kV8lU4MqhODkdhR5YQdSWbBw9?=
 =?us-ascii?Q?84Vot8sH666pS3VIW/Yc910yffdPWL0ojEgO14f1FJRmYJ2ddKK1rptJCDOx?=
 =?us-ascii?Q?Gy2NY692gEEBEO2XZ4A/vFHBYD7fbGFDU4YqkO2MgSPnltnvGqpPg81Xnxgo?=
 =?us-ascii?Q?XuJFjexsqHN/3w52G2Rihm/vg7ONR+MJumv22kNPAJ7So8yrZv0ksb4RnnV5?=
 =?us-ascii?Q?Jj2BgEukv+Ub9D1t3TCDJ3r0PwnmPkVxrHeNGEQxUhy3AtpffNO1t8piA0Mn?=
 =?us-ascii?Q?Xf/3vCK3ST8KkYXlUaESdBxK0a1UIxyGBdS5r6eTdrbrGmwxEwKtriIIvEd2?=
 =?us-ascii?Q?AaUSaETUG2NXfljjjS86QeFOQozncyKg8FjF4lMx3Vd9gdNhU4WYI64u1z1i?=
 =?us-ascii?Q?r7WAOqjybsHeh5LLnxsmhfXARvR/gjlkNuQ5oFTjOkIg2fx2LytpSimWFL7g?=
 =?us-ascii?Q?ZRG/0/utNEH9w9WzVwFuy+zw8JXw1UZouJ4UzBb6Aqgaw0f0gpNHGqvG/ijo?=
 =?us-ascii?Q?Eo1BumE9vj9W06+PXWlZiq4vDDMJVzUET6Kx4pvTdjLXQscB4Q5n9+fo7hbg?=
 =?us-ascii?Q?b+b+IT1blUiApCi/IMfB6MF2zd6kLbj3xNnPYLWfejaLFQ4mlsYj9Hzpqly2?=
 =?us-ascii?Q?bt4HFeGYYxoZ6X4LlOVPY3EWlXWIJDC6fPzSIOPqRQUggv6k6Mizi1kByVir?=
 =?us-ascii?Q?QztfkJ8jLXWdZ0HRyd8gnz2qY5q8uXViyHobEDCjxoIOiW7CwmC93RIadCeM?=
 =?us-ascii?Q?IgHIskWD7ayD1R848uAufK0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2deb6eb1-6eef-48d9-040c-08db33cd9a55
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:57:15.4478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RXmw/upw91NVSoq32SioMLR/aBq4u8EiMLhvnjgwz4LlRA/rD6D5fZk1vpy8IvdqaBFF5BOI+0ZNOkFtQl3GdPIOk1C67rueofgSvlW0M9OYBIKz2NvhPdUsTM/UJFA5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10184
Message-ID-Hash: 4Q7FP7PADHJZ2DQUIGAE4BBUW3BVQD7V
X-Message-ID-Hash: 4Q7FP7PADHJZ2DQUIGAE4BBUW3BVQD7V
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4Q7FP7PADHJZ2DQUIGAE4BBUW3BVQD7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> ASoC is supporting Codec2Codec, but its parameter name is
> "params" and "num_params" which are very unclear naming.
> 
> This patch-set clarifies it by replacing to c2c_params / num_c2c_params.
> 
> Link: https://lore.kernel.org/r/87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com

I'm sorry to bother you, but I noticed that some of my previous posted
patch was broken. I will repost it. please ignore this patch-set.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
