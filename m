Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43A7D8C7C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 02:10:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E16EA4D;
	Fri, 27 Oct 2023 02:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E16EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698365435;
	bh=QvrUv5/1217xHFPBlGjXBu1QetBXRzvBaxnUX3a39IM=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tw1U5TKP1Yi3KAnCcDjqwkyl8kxVy4CV1pWgUUnRFu4npBEki2AmmJzlbp2op4H0S
	 r6j740QQ9MjOLdemlbot9oW1ooJ7VwfYM54HZK/zepN/AiKc9p1xUcGyk1qa3hMXCt
	 0yEYKhsS5YBgcnCFH+nl/V4NKdhxVUovYL73clYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD45DF8020D; Fri, 27 Oct 2023 02:09:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38852F8012B;
	Fri, 27 Oct 2023 02:09:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC60F8019B; Fri, 27 Oct 2023 02:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B189CF8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 02:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B189CF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OO+z1p5k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBhZ3iFh4PtCU3xjCzVxxfwLjTNotHosQRtOe3uNDAX/gdX7keckqm4LiPaG9KbAsQfRmptuHr9BlM1YQ0Kfe9ml31y2mk8FNwW+OYm4su2yiGe/+KuRyhtbyjMTW3ufNaSWpoc6p0BWEdr1qZ5fHF++7gMeEWgMZ348P1SYDIf718SBAkvP2u+9Z3mvpiJBhWYmWFTlbCk5rQwzmyX1mp4mbZhKkJTJhddfzucFKFwem4fUBmx4eFuzWwTevmTvUXcAOQXL4q3Jqbp5NjYFqncPlV627kZyVcznuNcnMuAh/eLHQBt5RoGfnX8R+PaufKZndJ8eLDycHD0bybM9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnTz3aW9YsgxOji8VIBL30Jjf0MZEAAzt7NscZQJLQM=;
 b=aGoblcZHhxhsmccCLesS1wJPRWhi77FyRbFnlgf8VxZQejL1wvvBwL5N8OZkzjv3iH7FN0tIzIA7ihoznhXtP2PLU9TmerW9UzpeljpjqfYgyK7QmWlOmWGulhDoUfiLXYFqvXwz6hFYC7ddkXlah/c3cUS8a1B65v76/PmKsd5+f3x8OiqJgb/YMuWU61i+z+7xSTjwWMIWP46jTAOI9uAh5y1IJ+MasxCjBAGM72rFh870MM3qM+TBPJcWzWeffxu98kuWl94gPG/s7uhlRq3vjO8X/HjvtiAXGjFN8kb4p6VtoH04AFbIScecgjWKpfFWO/rBmelrBhlFz2fxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnTz3aW9YsgxOji8VIBL30Jjf0MZEAAzt7NscZQJLQM=;
 b=OO+z1p5kjbO1st0Xg6gysl2erxm7gIPJl8pEpfFglb+NXeZLpCDrpB18biDXxe39kLBQB9O4Rsojcklsi0nwotIN7oq6XoQ3J0W3n+24vgu27iXhbIJDMhwC5pOR7OKF5Fm3a5mkgcii51SRHKkO5zSNA8w4X62GzofHq/I5jtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8788.jpnprd01.prod.outlook.com (2603:1096:400:18e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 00:09:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b%6]) with mapi id 15.20.6933.019; Fri, 27 Oct 2023
 00:09:23 +0000
Message-ID: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: ams-delta.c: use component after check
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Oct 2023 00:09:23 +0000
X-ClientProxiedBy: TY2PR0101CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: a957ee7c-0263-4ae0-9597-08dbd680f99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iVOPnTSCChw+OyNCAYIgX+oiT5DkB2XrcbICyWL+AFbnQDLyb1jupWWAEHoq/fBvMieB7Yn5YOyvTDLoPuNspJgaWeV4pSv+HQSxU7SMyg8HsEwXF/q3D4+g13NCZ1UF74RLKSw/oIEhia38SSQJAkhsKCmPXtVbVkohnysbsx09CARtIKuLWChB5tfSVBUWQrDhIZDfDgQCoBwS7al6QE1uLMFvDAczLfhEHeRzjmt7iYvQIYkfW6jcu1RVcnVCS2j+ttuoA8MpMCrWF56auvvXQ0P+4vp2e/NTxwtTKIGyf1LbqtjfPht2PgFTZ8LDn09v0nw0AxDwyDPLVFJQU3jyoZSb5gZhYazojxaT32KRQsu2bpbAlye2BB6KBIr6iSMSTZS2X4dD3vdJFHs6ZRPWLNuUUnLGJfQas9Y4/X05vChyTL/9NSLYkJSpwUdjQpE9sWWJmPfJpwW70bjq9TvrFBrMtR41wwCHvsqlGBgT12t4XyG1GfH/alwnKWUyUs/4gzdlC6c8BD+fAviCUlF3G60gTTpaDd2unY6Eei8zuy2eJEMKncEtMwAmL3adZzmhqHotnsymwDwcYYRNCE5LT8kaFDKVchHLIoxHHH77DyRRu+7oorc1aGZKO75BFSX9R/SjQd8Dr5J51Fat65CVnLVuB963OYd0dHB3KdM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(186009)(1800799009)(8676002)(8936002)(2906002)(38350700005)(41300700001)(4326008)(4744005)(5660300002)(52116002)(2616005)(36756003)(26005)(38100700002)(6512007)(6506007)(83380400001)(66476007)(86362001)(66946007)(110136005)(316002)(478600001)(66556008)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OdtugL2Vy1W0Y6nSabRr+Gkp9xRZhc3F4NI3uFECOEWO9tpzdpfk8CerPrQw?=
 =?us-ascii?Q?TM1B4es/f6gwouVtgsRq/du+/VGdCnWQOPoryEVh1wnJigAjsHmWY90OE781?=
 =?us-ascii?Q?2QzaE1QLRNkr7JgX2xuRH6m+h5pw2a6STrna/uX7V9qvuqtmflvbKFMs+OAs?=
 =?us-ascii?Q?/6vQhuraY7bfuKk8I9fdJf3gulQd6sQq63RT4TamQAVZFuUFv0kQV6RAEQcI?=
 =?us-ascii?Q?JbftwL89CUlo+2Po86fr3hiB5hNC7lMUNeR5igfdTJHDcpvsdt8dWvRou2No?=
 =?us-ascii?Q?c/KPG14HVtOo+l18iU2CP4Ac2N5EDqYJ8EzMGsEriUPcUE70F3DXIZZL5yti?=
 =?us-ascii?Q?eilhg8EwB+EKhJEoCeCasn88XifLMdMbVhg/HNgN2WC6Ddy9JRNCLQqf42cQ?=
 =?us-ascii?Q?OTQixbeATBBD/eT/CnWMwsf3/yJTJzxdfeawU2RudhfcYDhKThEwtccDsvQK?=
 =?us-ascii?Q?JwpgPh6GcKLrkaCpekI8sdqrCPo9pE50viUlTFBqti19eOJIT2ghQ0xvd5Dn?=
 =?us-ascii?Q?KC6UXb53Tc2iZcxra5pltuUcb2pggwn6nhNO6G8xXbccK6RDVFzncWmG6WKH?=
 =?us-ascii?Q?TQJZQyGhmyfj4No+hs5cImTSNg95Zp9Y+cVxso6wXeWBmLN6ULn7yuCff/2l?=
 =?us-ascii?Q?CjQO8tNOEENNC85/FscplbxCDkZpW8M/wpapZ4lvQOjU+T4m903N2/DL8ip2?=
 =?us-ascii?Q?i0Sd0WyTI1bZjCEj1/iOqlrfKxRE0GCiq2854kbpCfVv8/Ws8AHjtLgeq/qu?=
 =?us-ascii?Q?/ChxTCc0FhXS7d6YDxntthZrg51EHgLnmArykAKwKt70GjMTsSOhJHGLsudr?=
 =?us-ascii?Q?O6UOc2SWW5DXbAHRFk5TEtb4Jp1bXUH4/Csdz8FDdcWwYrxup85ks4CdWA/b?=
 =?us-ascii?Q?Uc/sP90oz3kzpoqfN25kfukrttraelUA8LlV1+hrAT4Wq2fns1ENDPekDkSd?=
 =?us-ascii?Q?9DITHxj+Zj1uq0tgMJJ5UEX12T9LsHWugtZ9/nN87OTbmmUSMB6dt49O3EmC?=
 =?us-ascii?Q?mi1RfQxNYj6LUGeGZMrHtzC//qrGOPO+vbKs/8arjdzsDlJ6Z3nD4BOkHdMA?=
 =?us-ascii?Q?79mP0fVkOs3FGiiOPrBRKxgKY4+7MpuWczr1nq+LnKHq7KrU32+Ec0T1OOhr?=
 =?us-ascii?Q?jh4MOJjPjsU8KQs69iIiY+bQlieLudcF69Am0ZSZB70aF11opuiXvSa1vowi?=
 =?us-ascii?Q?hun07ueAya5FIKbzMLLnPBd9ucxsVMTezITXrkxuHD5kMp2pe2MgtAmuZUNk?=
 =?us-ascii?Q?Dw3CnCyFF9h6cmfh3mvpWKYr+W7F/PeWJABzbuXhSbndy28JnPC7pSYECHjp?=
 =?us-ascii?Q?XAAYHtoERlz2bLxC93DZ0kMr1UujDYPImZifKhL+UbLrbksqflCT5ah83FQb?=
 =?us-ascii?Q?TuW4fmRCjY24ISPjF1eYsW8/FKQKcU2tG7UKboBxXWap37Ks9AG1RRFh96IU?=
 =?us-ascii?Q?ffUtvV9ifxK9wN2prroB+VGOx5F6DwxRyrHBiOHPwSrRKV5dWCXPgEdLa1+Y?=
 =?us-ascii?Q?7lzcrZHJlQLBTSvB2KEtHi3Ov6ItlbNgk9YhwEH9yN71XdW3HpV4eZ294tp6?=
 =?us-ascii?Q?UV8Tpw1YED0+sHdSvjqPE2JBZLLn3jjsmUKquvRlgvLVbVV1h5UVLoWweSyK?=
 =?us-ascii?Q?FJN+ksckWM89bLB1qcDhsXc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a957ee7c-0263-4ae0-9597-08dbd680f99b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 00:09:23.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xmOfV9QhkMzmRsF+bvtd/3uUATpBSOrE9p194/aXlEpPoEqnE8mSGgu0i6NcIyAL2Xn6GT5xJ84TgmnBoF29RzU8cf78QedBz4il6BJmkM0GgKq+Z8B4PP5TmFEhTfxL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8788
Message-ID-Hash: U4KFXQ5C3IYYEF5JPK6JASFI7FPVNH7D
X-Message-ID-Hash: U4KFXQ5C3IYYEF5JPK6JASFI7FPVNH7D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4KFXQ5C3IYYEF5JPK6JASFI7FPVNH7D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Dan

This patch-set fixup ams-delta.c's 2 warning/error.

[1/2] is for compile error of .receive_buf = cx81801_receive,
[2/2] is for static checker warnings

Kuninori Morimoto (2):
  ASoC: ams-delta.c: fixup cx81801_receive() parameter
  ASoC: ams-delta.c: use component after check

 sound/soc/ti/ams-delta.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1

