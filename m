Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99A6E5845
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 07:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 444C2DF2;
	Tue, 18 Apr 2023 07:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 444C2DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681794144;
	bh=IwGd8XBaORibrzC5i7N08sc8fHb3hyfyxoWY+ezICp0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bfWYKvGwRVFJWhbga5ptUtRkBggOZG5aEEFP3p3Ztu/Z06/IY1H9JrlXiSo9zu/eE
	 7y2giy03JX9AvWcKeP+mUI0IcxUOmHNm2STRfbLRXfKAzeG7mOfMouvn5feqv491sL
	 57hcZ21iQq/ayWg557e5LYeTZCH+z97m8tS7RrFQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C51F800AC;
	Tue, 18 Apr 2023 07:01:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF64FF80155; Tue, 18 Apr 2023 07:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D371CF800AC
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 07:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D371CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EUyErVce
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuNT+8VpvIKxIQ2c0BSliyCKEB5KTBxlAx5hyVpCxPV8RenSLVS2LUu/zjcPRU8jMQ/scEHDXKQApcRbDVdNPPYuQwK1sYs72EbK83rY1YKvisGJillNEyuB6PeU2oUsiRQrl5XW2hMcPrTXBwHZ71VJQMCE482/xv+/EDjBdWXtZX5uWzVppx/4NugCQnzdvQVifUS1zFIAZDR89jiEGGp1nNWgMncNno4LSdl+vXZV1CFJp7zsKyVuCzuzinyd1CHoezv9cHH+rruE+j2adO4JF93SnoRsSqJeop3/9PwWpdmVz2Ujj3OCHt+gaEJx+d5lSzmrljD4KmWsb2otAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WrEw/tZ7FU2OZXWFi0F89U0qTB1wA3RNEpq3MMDp1E=;
 b=J1sowV5FIRLY6E1MonnzuhVO/vumOa9OcU0a7a1koi5SRaNvfeIxSYaz8q3aWvI7TVgT8587cRYpx8OuHmAIQL8q43TCdtM52Kl4l4LRa4sNBnUxwmGQa8JZqjdNeE/HTVLrxQO5xqjBfBrOd07lNdG/mfDD1dgvjBni4Le9BWOD+S4d1uwQm+1Pg2vk1/wWDnLdsVx6bA+s1moPpGtI8P5yS/WBglCqB5AFWfBp+hfWm6UxHcqE7/AUK7Dg6R58odpi39M9rTsPtKrjbd9uIvSlF+g8yHIFKuCko4eFiZQjePB2Fnc0OH6qgYJmulI64Cs9bccFL0HjUJgNYW0m6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WrEw/tZ7FU2OZXWFi0F89U0qTB1wA3RNEpq3MMDp1E=;
 b=EUyErVcehoi3kTyfxrFTqf+KbGKwSOS7NXT467La/H9KIAZhAbPuAHPiQgrmbZ1jTYkUhgzRQTA9K/FWPpu8rjk9TgyctaRfEU2tPRzvJVpT+8Vr9ohZyj+DdubzUbu716sHo/ayNx+vXuC81YBZ/+gsEY3qnqIsiBnfCPIYHDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8327.jpnprd01.prod.outlook.com (2603:1096:400:15c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 05:00:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 05:00:11 +0000
Message-ID: <87h6td3hus.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: What is difference between snd_soc_xxx() vs asoc_xxx() ?
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 05:00:11 +0000
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a3c508-9d0c-4060-8310-08db3fc9ca41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zMtWFSWfZ6sTfFIVS6CdnlK6iTuSrQFm0srGrrKvLkjTIRgueOLJPO4XfDUT198FwJdeMoydEDyjh3SY4cRloy/Txg6wRgEjJ77JXmaodZyj/nuClUCDRaCMHCNFu2lTxdHL6S6FJMc/omROcmX8iyTa31n0y46r692vmZb7+g26gmB40anXFQ50db4ugHOrFLHdhNbU7+eYWsZY4f0y9lQGyB4VGFTDX64ohkj9YSmYGj5kZOcW9WMylPetLcey/VgQrYacU3A3nWtJldTNNdN5BmjxHF8BEfdo+ARF5pJooWHPJnUzf2P+nKY2GFtaju+w/7+UrXAGvIGgvSf4+hL+/g+AFl7Qm/I3yCeiriPblpK7e9qbC8+8+p8lgXv8BSpdWZ9y/B4n48o0dg1T/x3vIiroA94aGmdloh5Z752xGKTMn90PZ/wwZSBvBrwNev6SH2I8qE7uwbtQ5F70PY67deqKy63bJTeFYjH5MJGdR+RdFTSKIdYd855ZEYhSeHR88vuKrFx9HzhJ362S5Mu0B+Jx66pbIU5/FpTy3lvusfTH0O9+Ow5NCN5W6AfhnVykdZK2rHqx4ji+alnLIAnJ2v2zYyga16UqogflmxS4gO8J2rnlOziyskhv/v1QaLIVItWUHoFWnEluOZjP6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(38100700002)(8936002)(38350700002)(8676002)(5660300002)(2906002)(4744005)(86362001)(478600001)(52116002)(6486002)(186003)(2616005)(6512007)(66946007)(6506007)(66476007)(26005)(41300700001)(316002)(6916009)(4326008)(66556008)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2QCg+pI6CAThEplxvMPsZ1GfKpTQci+gRm5Y1SMqlD/zhJVE+fvVD4aKcJ0x?=
 =?us-ascii?Q?r3xZFXj6HUax6VIQaJupOR4ZB5BI4yWKCpiPudP0gXgz2u0Yhk9O3PQb2r1V?=
 =?us-ascii?Q?FzSLZ8eWOU+ow2q1mNM8aTLNBUQ57e5Uc4uadWgv5a0ckX0Src7WMjL8ObeM?=
 =?us-ascii?Q?aT+O3W0WzkKITJoBcaR4GuBC+2hCepqyjKExa/fFVU55lFqmu9jmWvTKj0XA?=
 =?us-ascii?Q?cwbZD1pGEPq18DPfuJlruFZRqLFKHO3UXAnHYhvpBMPJP4zGNjTLG8BW4WU3?=
 =?us-ascii?Q?XBW/hb0IhbDvFlI4MKjhWGwa7UMUYWwNXqTfHbyDvmUSPFK3rn7Lq2qlDjPk?=
 =?us-ascii?Q?iw86AJIeJDz/ApnzSYI6yJujsCJJRoVDO/jFr3OqrifB/ftAxwREUCrK/6du?=
 =?us-ascii?Q?gzPKj/kMc1CUM8zcAJFVA+DMrUNtT4/9nIyu/TgtMBfDYtGWTTseGbJERj1L?=
 =?us-ascii?Q?pv0Ko6L9omC18J35FeOIPOI1Typ/jt+YILoGUIRYMI0PoWYXjAHKTJdozrEx?=
 =?us-ascii?Q?j0WS/mt4pf7vl4G8Kge/8hnWbfTz0C2yRccmisyIpq4bakowrxIoDSjn9OIC?=
 =?us-ascii?Q?jk4RRWWfaYk2tl0gpbClNkfNJ/ujTTRItvMnSXhrbubgTFAWrvgXm+qxDWP8?=
 =?us-ascii?Q?z8NLulbQWekaMAS+x57ZFcSaKb1kcJ/JsaexcAZ+dGybJlCbwW+n4mjtaJ6j?=
 =?us-ascii?Q?DxQDEaJGfkt4bDuO5lmr3maoCvHArram28CO3CEe9AHdyIBLaTjIeIyboejp?=
 =?us-ascii?Q?zUocG+5wlyfjcFh2iWtk/YmVfN6y7HI4lIBdDw1j4pwUOdExVQmo0RZ6lt1T?=
 =?us-ascii?Q?ctri46lrxnl3bhfk55bBmA6iMlQ7p/W2ZbMoT/LVExWuptov24EYt3BfXtD5?=
 =?us-ascii?Q?xl31EHG4AhtvbehxAVjMLSFjJJfZcFEUkfTydEw+EgpjUrWFok541S39KaUA?=
 =?us-ascii?Q?U+w9Ojs7yOSgnzRh4SflcTckYYyBCqHTzIDzLs1JRMl5K/n0nsbvPtn9Yg/p?=
 =?us-ascii?Q?+OVHtPQF/eidRaX1Ieu8IVKDtSd8gCTUl/2vVN3fIDmD9eUI08VbYoZ8KxEe?=
 =?us-ascii?Q?P4SE1G25jG1LQ2IJaaRW1ePjuyE42fD4IxGn14fuo5qXR+SpcbjYkZvoE1KV?=
 =?us-ascii?Q?qqdOawOEtSfBDQopkI/4BZyjAZ8fYcBIus8i5+MiyeQJtUz5IbTVnCvnOGeA?=
 =?us-ascii?Q?07rQRiF3d1lJ8kglbbFtg33cWJVTdPHqpYDqKsqU8nv4A2WbzyAYqNWwbkyE?=
 =?us-ascii?Q?AWhQ5SgHi2IufYBzMAxJwnCyjcNDPpDTnqi12F1pSiKygjltGOqFouGEMxv/?=
 =?us-ascii?Q?CXBn4UsScP++xLbRr4bPavybPKGlUcBiYvrDcCmbcwhsFJK3UQFfA0tpvKhH?=
 =?us-ascii?Q?QnY6z55uANULbsmFAYj+FOyTgvheUOvyl5KHHWtSeWRvJpZNrfMazfDYIWRZ?=
 =?us-ascii?Q?vIsiu24Owv0J/DVMNPgHxpmVAGPagoQMzkR3czpPCEIp535I2jkR66JmeIlQ?=
 =?us-ascii?Q?4cbCiK8poWeqnHR2WP23Jo8xu/+KLJCaSjvRuo2ePP7/u0L/nCt0Cn+9b0tE?=
 =?us-ascii?Q?8HEQmmRnvOrsDV66oat82oIjM8ER/Hf5X9+QuIJNPUS38mCMY8XZEDjHliL5?=
 =?us-ascii?Q?eMVofLix3TK69D/xuE+FSXU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1a3c508-9d0c-4060-8310-08db3fc9ca41
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 05:00:11.8754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qyUOmblo1Grm2cnyWgyIcIfuoODQR60D5lBXG36ChQnFpEhmmC5LOcv+al3XpQUWIce8Y1VvEvirhJV8U8NoYqLsrgwV9y/NT4cFwxmtxvMgzPqagNAMOG8XmLLn/69H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8327
Message-ID-Hash: NPC7BHL6S3COYEUJ4UQTQH2PW37AK2OX
X-Message-ID-Hash: NPC7BHL6S3COYEUJ4UQTQH2PW37AK2OX
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPC7BHL6S3COYEUJ4UQTQH2PW37AK2OX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi ALSA ML
Cc Mark

I think ALSA SoC is using 2 type of prefix.

	snd_soc_xxx()
	asoc_xxx()

But, what is difference these two ?

If there was no big clear reasons, I think it is good idea
to unify them, because it is confusable.
But what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
