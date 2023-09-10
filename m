Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B179A08F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 00:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69318820;
	Mon, 11 Sep 2023 00:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69318820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694385881;
	bh=rBb2wHPKYUq7Ege3nPqs8k0x8eChwndycztYLSVfXA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lLsSm64y2xBqYfDQwGcsAD8rhhz/3UWbK4F0wz2GeZXS4Y/wqenvPgU828Cju42RG
	 J1PiRXaj79GVLuWWvyu9ur+ypXVVqv1AwDcZ6i/h2ZFIfvyCpSYIdzN3IVFJSAuxhi
	 6XxnO3jWJojlmX3RAV1Sr8auNuiPfK/PWzD+nRmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D261F80431; Mon, 11 Sep 2023 00:43:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 992AEF80246;
	Mon, 11 Sep 2023 00:43:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E62AEF80425; Mon, 11 Sep 2023 00:43:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF3EAF8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 00:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3EAF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=c1txAIQs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy8BnXwDpmPJb522pNm+YUMdydFjQFLmaq7oqasf78Yh2KyCrl5lxLlfoVgXFhPd62sK+NCwWob/MOHPI+SpRgLflgajkwssVi7c5h4VQUTFSZrM98UynIKXpgm/LiLrOFvTv3ZbeQ0n6ZDvRknwDKn+LwscQyjC1zX/JcF/KZtzD1VplW+upINOI2r+w2fEdMdvISyY0pKYG3sc5OlG9K4oWESSDjDAstxY2pS6Z3+wo+TqgKwavfTPFHRdqIq+gwhQCDC+2wREyC/9y41ZOGewWjOrye5ZdiuaoEPnCcyHP62j68ED4+jvm5cwf3W6iEgp8GPlu9ZfHV4TxhTT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykEMargkYJzYOKRzgZdLsCKArQF6ax1S58N/Rpnirhg=;
 b=dGdt+7LyxcXTWL9JYGSyBOBJTWJPl35AuKeMxqX7GWfX+VbynV4tzyiAhX27sglcVJm0IgUbGl5EqyB1jSpPqXiEceSY+jkk3vcd6fgxmF4XdBJjVgtEun2mp9RgZoDlk7qEuVDz5IeLRalMuCEyBr26lRn0lw+d/ZUwJCkyhM9AgEVpdFva+CHbQqB2d0ed3K4V93Dj6owvVge0TugYfWN7PpN8a38OFGnSY04+h2UEENmn02F6pwULREwT8YtzdSAbhM9aUz/bIFObh6ErSNrA7xctZXblbcVaJAIx/r8jG03X5NVE156UFr6Rz6hOPeRMMk/xKPX8vnp9NEsykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykEMargkYJzYOKRzgZdLsCKArQF6ax1S58N/Rpnirhg=;
 b=c1txAIQsZ/Hhozv3nW+oIRDqxBWfrwLRNDLJwI9QP2gYUAE/tmxHpyWjXyHiU0GKGsLoqUq2dzk2ZVR9IbUHbjE/+y7kDQ3B2ldiGA0gv/8xNrpRZ4MXJAY03coovpX/QBOP5wC03ApCqaUhn9cVNA+sxC/oTSo/AIq4MbpWAQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8478.jpnprd01.prod.outlook.com (2603:1096:400:175::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Sun, 10 Sep
 2023 22:43:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.029; Sun, 10 Sep 2023
 22:43:22 +0000
Message-ID: <877coxd4zg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	kernel-janitors@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] ASoC: rsnd: add missing of_node_put
In-Reply-To: <6348f825-645b-14ed-31e-7ef7f607a29@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
	<20230907095521.14053-11-Julia.Lawall@inria.fr>
	<874jk55heh.wl-kuninori.morimoto.gx@renesas.com>
	<6348f825-645b-14ed-31e-7ef7f607a29@inria.fr>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 10 Sep 2023 22:43:22 +0000
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: c7479a84-89e5-47fe-316a-08dbb24f563c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	brF9vSUXSSqTmgs2NWULurP9VQ3nea63KK/eE9/Ja8pQv2Zx6vr7x6MKtT7xD+Y/a6ZBmnIhGOJNsRx2YQR4301TZDcZn2Z6j4GGkbZxwrUWSmD3s2RGUeetpdMWxn1gD/aTqAATgpkL1PvAuWvopzuM5WU6vUA/kpxM7+ycCHlBqxqoH9PDYO4jNySAPoPo9o3qH/fUsl4ZXH/yj8nJSVBtGcnIm8seZAP5Y7f45JzuuzW2YLU+nStNqxVSNADQDlLyXs+//l83YC4sjEV93mtob8EOzhrfewdxQ+dWswG4S1wqtAQfnG+Dz3uMh4D4Q/0LYPN3kEZJ+L8uD6nNW6HaUw5WWeHidcL5eh1tObCpYMUNMyM+yJiHzAKuUwJ/N8pXqJ7kYtKpBB81V03jez9fL0WzDGDKpkc0kOCfPKxyoPXU0GeM07W5nFfZQX2fu9Are778VvaJgo/wyzqTWXYfD0Yq9DyuDhESgKFesk41Yv7ELq5DWkFQiUhoaUpMQSPXr3G5BWEaSEVAKczfr355CrWuENhib42hvag+LEUIzF909xPzzL2xibXqRBEy43IkTIHzJerxNOaIw38v/yLECtA+n9b40OkzV5frZH5gJvzU99K4luEwAHrmOB1f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(186009)(1800799009)(451199024)(41300700001)(6916009)(316002)(26005)(478600001)(2906002)(8676002)(66556008)(66946007)(66476007)(8936002)(4326008)(4744005)(54906003)(5660300002)(52116002)(6486002)(6506007)(6512007)(36756003)(2616005)(83380400001)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MPdVg+zJdPeBfxAYksrFqfXBmE3Jbkj4XNJu1bugby5TNyCBcErTeyaL6GAo?=
 =?us-ascii?Q?L9EQsKtTRt206QoRlF/nfkxN7TkUosQB0WwvdondCfJMfAgs7qlzqrgYIzAw?=
 =?us-ascii?Q?7bPS7RIDDZsKtjm5Ng4B8xKW/6tKglpMiJekir8bVwc9POkHGVM3bGVhoLNU?=
 =?us-ascii?Q?0t/xEGoAGFmnjCNqLt7JV0ze7uLKe9KRool2M8zCFbNSRiqK54XawXaBqDWY?=
 =?us-ascii?Q?NptdLMVTCXEqfPluiVBM53hyLP2e54GUmGppQsV2Q5AWw9T2drk1qMdaMPgB?=
 =?us-ascii?Q?CDy75z/tcF2GsTUKJd3W777PUbJQ6VfXkyxdbNBi5WY2pPeG+yrZHKI9MCay?=
 =?us-ascii?Q?eLFEPRYKwBLzcnSz6NocjgrbS/tIpiUkskVzThOdGXLn6vM0UHOiK8rQxrHa?=
 =?us-ascii?Q?nis9GsiDbf4RvIOmcQ9LcLbsliWjRacOS2gcKYo+U5C9jFsFipcYRHruGDWJ?=
 =?us-ascii?Q?6epK+txRmHsDOFdi+5E8RMSpxdA7nrzJSvKVihdhPyI88wBgc0puxKl1iELZ?=
 =?us-ascii?Q?jI1QdUitKKoamK5bGxDeZpgaiSPnrUhvLWTDgHk86wB4ezrb61hMfJfIaZ1X?=
 =?us-ascii?Q?JpKGSRIKXIokasnYdciMVPqJj+vVNkcVdhu5P04Ch4KAOdm8lUK+vWh7p364?=
 =?us-ascii?Q?Zu+kBp6eE5dl7byhgwyi3dJ2jPNOxNSYJzE+hVcBVKhoaMuivM6ODWmNH6SJ?=
 =?us-ascii?Q?Jo5qUj5AdEJxUuVlLedLuEHhl+Zx6vFbPCusshNoFL189KyjV8gyo5lP/R8t?=
 =?us-ascii?Q?I0U6l4n1EmG3XtKoeG2Z4VZtqWKegReEuAxr80zPiuZ2XrHOH4IytmRUJ5ve?=
 =?us-ascii?Q?7fI4b4RN/tM3KzgHuWEhpSwcTKXmhAnLSlZcZ5EhuIFAQ500MOhBOt9ks8cP?=
 =?us-ascii?Q?QNdpep2qUhevlfFGuA0NiwPdg5iN4ujCU/ojCEwPQNO/OAQaiqfzbANWtKN+?=
 =?us-ascii?Q?a/J/CrjLOTJqy0SQAniX6251bmQzzxI1LzztQVHmda1ZHpQUnkmSzyPlQTZC?=
 =?us-ascii?Q?8ILcwIhXOlpI+aoeIw3iKINJb1t6TgUnYKvnp/WqPP4TOzf7aU4mAaozJyLi?=
 =?us-ascii?Q?nfPKQljpmU9LmAUawh6HIdfKrSc+Ni/OS3KNeSI0d+DQYT7DZOkm2jgSRVHC?=
 =?us-ascii?Q?Uwh/LYCUKj7gurEdqOln7VsXpkjeFKyDdfkfT+0qj7pEabMloUyzbJiTrlml?=
 =?us-ascii?Q?8DrvHiUIiUyMyBsm5tdrAjHien9AKjxoep/5VINakTSaiMHPvOZKra6Z9CVC?=
 =?us-ascii?Q?xUYxzx4Sw/5GZyEZNISDh1aj52UmqvBWU7K6VzK0a8n0ZdnI7ZrUSdS2sGVt?=
 =?us-ascii?Q?bUabIbfCYh5wx0Mzw4HFziahxwfeEhzlB+cs1H9+3ig0x4XDgqwh2Mo8vqpq?=
 =?us-ascii?Q?RZOg0sQJ/O7HqWFsKMIW5+ik/PvwnVgcd5EGC+VjqDLGuMHfHy7FNTD1NFZU?=
 =?us-ascii?Q?x5fDIGz40T91uvDTX7c5AOavM7lb9Rz86gc6H5lkP5yr7LJDNqJPwkSeukWK?=
 =?us-ascii?Q?5JvWBSBL5/8YOSaGfgY3PCJn+icJFXJuustJvGRmWwBuqwGBBdtz0y3j9Aha?=
 =?us-ascii?Q?zQANfs02l8wgXldhzSTs5NRnba46jDQm5NfwRFc2Vxx0x0URprmlBOooUj8J?=
 =?us-ascii?Q?BepieuLAPVw6xKFMWGQWt0Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7479a84-89e5-47fe-316a-08dbb24f563c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2023 22:43:22.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MgqVLoFdesV5uWWnjmOG7JVJZIsvrIdf5s7yAMn3AkDZaIqsbYm879Xn57KqKxb/WuFBI0dgeArCYVpwhvCmhfW7W0UrJ/22uDj3m/4qUH3eCtSCw6hMWEAZyyUtz1ki
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8478
Message-ID-Hash: WBGNJB56GULTOKL3XXBILI2GYN5DQ4WR
X-Message-ID-Hash: WBGNJB56GULTOKL3XXBILI2GYN5DQ4WR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBGNJB56GULTOKL3XXBILI2GYN5DQ4WR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Julia, Mark

Thank you for your feedback

> > I noticed that existing "of_node_put(node)" itself is not needed.
> > We can remove it, and I will post the patch next week.
> 
> Oops, indeed the better way to make the change would have been to convert
> node to ports.  It's just a copy paste error with respect to the code
> above the audio_graph label.  Do you want me to send this change instead?

No problem
"add missing no_node_put()" and "remove unneeded no_node_put()" are
mutual independent, it can be separate patch, I think.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
