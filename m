Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50EC82B7C8
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 00:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 250CFEB1;
	Fri, 12 Jan 2024 00:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 250CFEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705014045;
	bh=225E5jmSKgZIwNXziCT6j4CwgN/NDy/2RIWoFJpS1HA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FtsjZAmQqv6tMvqpR9u2+1HQPmAMLiOhn8Gcdg/dRoy+LB4lJtDv5ycgiRaJuB/KO
	 HlMn9VG5/g2uWOdBh128V7zJ2TvMqv+NkKXOXr1/1rIrZi/vRVLS1SI8TCVcuKHLf9
	 0Qu8r7QRfTVb640+UJfMT5M+DE82CVbwV5A8khxY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC83F80564; Fri, 12 Jan 2024 00:00:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E2F2F80567;
	Fri, 12 Jan 2024 00:00:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E121F80254; Fri, 12 Jan 2024 00:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6115AF8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 23:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6115AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CIvzcf4I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/lFY1r6xGbz28iUKeKis04/cz5qaxxMjFBem0+djKPLZ/7786A7zY4rUEwQQDk/yzcSJ9igaecB2IXdQZhGO3Lh71r6KsmyCxYSf1rUfCSHnjpluHyHjyanPYIEYAuh1IVvXbbL1yaT8EaXlateawmSihl6frfBICacigV8ysarir5VIq4uzPkbG2EKHFPLG8kkbHPOejlkHo5ehW3+ctjHwXbMYtREcS72RtW589eEEdoGnhgQX77az+cF76yByEEZYxafp7lEdHp7lmacBtc9YMJvDwYZEdWoEXJyV1HjP7jWL8XfMbwSjuoXYFCP0298ty3nG+hWPNIDqDqqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oahWKV+V5rUxGDZGLa8hS9aKVdn/veEPi8DrAmrUllo=;
 b=lxKNr4bUlmuErC5Oehl3TfKIphqwPucVEuw5HvddGmqrAYV6npah/m7KoPlmh1UAmqOyiOvTXcyOHc7yT/i3xoQ3ZMj086nJcWenLHGuVozQBrB8YndCfLgZAQtKdBgZbJSOkQJCMyB+R1/wNsz2eYeTxkqZA9nAYBi//77p92ITCtEq+ClKXplsj9ObjIV17MV5C377uWbv2u4u9x3Cwx59wTy+GhU+oVo/XK/StxCi6GyLnJ7m2VP+pFwaFNtGInHN5GdmIurHZkMRXZjRW7PhZc5BbV5zMqTnhu7scDgVoYJx/7bK0N1CI9OT41RESlfpxipunI6kllAv7adYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oahWKV+V5rUxGDZGLa8hS9aKVdn/veEPi8DrAmrUllo=;
 b=CIvzcf4I7H0V7VqMaSLCYPXzbxQ0mBfDxMoZz6iJe3kD0CqUNV65rzToQmzFfv5fvYz+pAU49jAz9Iix1kf7YDLqdh4un03OV0WIRHqjaWXd19FPhgDe25UgbYj8iapZSspuOBIdSgP0cPNisguo5906eZFguCtob8pwtbTFvyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6127.jpnprd01.prod.outlook.com
 (2603:1096:400:48::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14; Thu, 11 Jan
 2024 22:59:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7202.014; Thu, 11 Jan 2024
 22:59:42 +0000
Message-ID: <87v87zeasq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown
 <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
In-Reply-To: <d10f9857-4259-4dff-a7f3-764086ac5a8b@nvidia.com>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
	<ZZblyhfzQjzyoUc_@orome.fritz.box>
	<42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
	<3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
	<ZZe5sTNz005Tt4jk@orome.fritz.box>
	<8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
	<875y03i739.wl-kuninori.morimoto.gx@renesas.com>
	<e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
	<87il42gkua.wl-kuninori.morimoto.gx@renesas.com>
	<cde6d5d5-b6ab-4c64-93f8-78d721a492bb@nvidia.com>
	<8734v4y9yu.wl-kuninori.morimoto.gx@renesas.com>
	<eeb61f8a-697c-425a-9873-b7b60c0a5558@nvidia.com>
	<87o7dswjry.wl-kuninori.morimoto.gx@renesas.com>
	<c868bce1-9a99-49d9-97cd-ead8d0295504@nvidia.com>
	<87le8wwi2u.wl-kuninori.morimoto.gx@renesas.com>
	<d10f9857-4259-4dff-a7f3-764086ac5a8b@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 22:59:41 +0000
X-ClientProxiedBy: TYWPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9048c8-7c9a-40ad-1fed-08dc12f8fef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z/C+IlAC30ZMvrRy0oi2GYJDkvJE+cQNMluFhpo0eXNcvpJxBDNSYn/xdsC/RapETAYQAYKM5hIFc9lwSQ/JcMlGP9QlypuemYuyYXSMMV2vj3H7vCLc7lg7LoyqJ/dEtfrNX4sTuh3th7i5MgT/Y7rI+qrbXz6FRdSU4IkbVKV/AOLjpFwLbLk2mNmK3tGVSgeZ16gXU1es8RvnVMqVmUhdwsEk0YD9hgn6bdmUv01OelqnVBOxpgWjX+ZOL2jpDmLwcCCSxSLzYp+xmU9J541nTEsEx0+ZhIDdxSWL2uz4dsZIZGuGVKPx8YriSSHLrhOpgeM7Ls99berdOvvykA8v7X7esCHmBD5+wnxyRllGYKoTpPtl+Gjw9KQ7iCBi8ajuegqv0zGd8DKf7OhSkVvgn/R4MfI2edJ+h94ZiL77tCcExYku0tflpIdW8dP+lSMk6bICZN8phW/U5RMheqwzutHbfnquanxMfrBeDRSrpd13a+vus/YnuO5Qjw6x8Bdg0O+0CjfOQoTS0yRThXiPFfbddZIIHEiXPH+7/baaG5TjM6BhmA6GnhT7eUa4qICDluk2fdVGDo4eHsgKvHYvg3apcFLY4i3ak2x29uml6ZkdURUbIZsi0/eMyWsh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38350700005)(36756003)(5660300002)(2906002)(2013699003)(66476007)(66556008)(6916009)(66946007)(41300700001)(4326008)(316002)(54906003)(8936002)(8676002)(6486002)(86362001)(966005)(478600001)(52116002)(6512007)(6506007)(2616005)(26005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zYYAb0cCVoLElIXFfiC39KSBJJx6MjkKaVmdBHRQ/OtTOzyRfV9UVzZPJf5k?=
 =?us-ascii?Q?jbO8Z5nYXzrL76meuLWS4mtHOf5XqEhmbdGJ9KEFCzBNvjQrI+I6Qvgq5QRN?=
 =?us-ascii?Q?MlN08O98FghzRFCQE5FxMbIirgTkbrU6QBODSKpEgu40+0gORk2MK75nFgOt?=
 =?us-ascii?Q?7nyvjOa1kmnHyZd+uAsFAjTt2eQgEai6ClgXATVt+n5dGqaWG4G2tTAL/xbz?=
 =?us-ascii?Q?pibV0rrxxT0VK5V0iUf/GQzk1WMyQ8QGduu9vYpfCSZdWOvZfGiUCF+m4Ksa?=
 =?us-ascii?Q?p6+yiDmkIcnAfqTW/EoFmK7QA5AMutjvQ59H+w075kbE0ZZhxXl/ZOxk8Pfa?=
 =?us-ascii?Q?5K0T5ChIHGRQC4OZJS/wCq3fhxhyZfTt4t0g7+O9PGlxorA0DVxFvBjX3WoP?=
 =?us-ascii?Q?kFEA0E6ADenK+k+1JXMRYkCuejuu2p3aFuolvQvBtSecpOSJuXuDDCkPIeHx?=
 =?us-ascii?Q?rtu/CgxFoVmK2xD8dCZBzx3AkkMuT6D9zqOJHyN5kOBTEYLOq0O4PMMyRr+A?=
 =?us-ascii?Q?LFVnubgVxD4c1MMcTOW/3Momns9+23djcbxcjAbLDHWfzCqgGCrl+z/yRbvx?=
 =?us-ascii?Q?bO+k3of6b/LdEaH0aEDNr/PBwvpU3KJFkfI453e6pCjgyaThEY5szgDxSM2P?=
 =?us-ascii?Q?Xo6gy6x1MxseByhupK9vZmsg3fa3oDHQ2OQdmOPcPMPFnC7nvtOAimPossUJ?=
 =?us-ascii?Q?zYoE0sPMtuSPMKzJ2WQs2rgVFwU/+Qmq9MofqU/AP0W0KCzmGgvFJnQBSYCr?=
 =?us-ascii?Q?UI5Ck0QZwRALabc1WDZxMTHeAK6D3juGetzNxKEuhDNL9A0FuCGhWDBgkkE4?=
 =?us-ascii?Q?o+49z6mthoxoWu95lT3MABmA4dHDWAILLdZnWPHqY7bNPMaeksQcguYHW1Hr?=
 =?us-ascii?Q?uZ76fkFGmB2X6GJgzdX87WGAczaL+5gqR8ckxvGNyFr6oLSuC4vqfQZiUkQ1?=
 =?us-ascii?Q?f6EmtImPKR5TqSykDX9j08Xi9vwYgQp+nxiSidYSdkJY5f3NT40jZHAH8GE2?=
 =?us-ascii?Q?/6GSmX0Wba1pM4tFDc2+WM8qFNuzDKgxOEpB7zKH/aS5X8Gw8TEGT0CwKzZp?=
 =?us-ascii?Q?c+6UxfXt3uGEVHypUvGtByLI2K66aqcYw6UQCRwc4/YH6Zf0HYWPfcV35if5?=
 =?us-ascii?Q?dS7TRR+LR/wG+vV1bmXPMO5xtF9vdb+GR/RvHEM/OgbXMKZPZ3ILcdkdCHzI?=
 =?us-ascii?Q?BZaLjcWJ9WY+dlbs24npI8ibRiudzfQ5Xg5tyGJKlg69NKaojnrLaKdbJjWv?=
 =?us-ascii?Q?3aL++KffFe7FbPh2uZMsk9wDLF4G9iL5Tk+oT29CqsPEIBa0HKNBGKQSRY8z?=
 =?us-ascii?Q?WCIyka2OO6m2Ys8F1wXKg895rF31/Ij5Zwc09gNhUfuEDiT897EiWmYg5A+C?=
 =?us-ascii?Q?gzip954BKBnEhVtDBNJCtUesCanOuv/aLU2ch+yaKOgMSjgDW893fiLZM6yU?=
 =?us-ascii?Q?XXxsYLqGKjzBswxe9JUOVrBEPCWedSoF7KFoxBvN2WV+xVvAGf6y4TVbFEiH?=
 =?us-ascii?Q?yxCiM3USKWAbL0nbxCjX0XiDHsF/Kkn+w5VF4Pv1f4FyEiToPNITlzbtWJze?=
 =?us-ascii?Q?utkTjkUNoKm5nJlO6m2wdVhr++Qouf8qCaSrUHf2TQMgM8Q9mkEjJRJ8iIH2?=
 =?us-ascii?Q?HQJqfP6Wr9hfYXcM2mWKLoQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f9048c8-7c9a-40ad-1fed-08dc12f8fef5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 22:59:41.9749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NWnV1JlSD1vzsn/hfLQBU9Ct+EUMYThdbXy5WG8xKPJvVe/B198PMCA5obSkojakJPVzLwkv+1NJLaeq8Cl547/tI7VKTX0M2Kd77Q+zt4btuvwNCvJBOgymakJIw0gR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6127
Message-ID-Hash: WEQM2SUCZMGATAFBVU7IYT2KQGQMP7LJ
X-Message-ID-Hash: WEQM2SUCZMGATAFBVU7IYT2KQGQMP7LJ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEQM2SUCZMGATAFBVU7IYT2KQGQMP7LJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sameer

Sorry to my lack of understanding

> What I am asking is, with audio-graph-card2, when you declare 1:N 
> connection in DT bindings, how many DAI links you create in the driver.
> Is it like the audio-graph-card2 driver parses the whole 1:N connection 
> and creates only one DAI link in ASoC core or it breaks them into 
> multiple links and create N+1 DAI links in ASoC core?
> 
> In other words,
> 
> 1:N connection in DT == 1 DAI link in ASoC core?
> Or
> 1:N connection in DT == N+1 DAI links in ASoC core?

If you create it as Multi-CPU/Codec connection,
1:N connection will be 1 DAI link [1]. I think your case is this.
But if you create it as DPCM connection, 1:N connection will be
N+1 DAI links [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=for-6.8#n179
[2] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=for-6.8#n199

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
