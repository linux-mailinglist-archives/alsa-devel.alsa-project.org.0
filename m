Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6082D302
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 02:44:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA2D206;
	Mon, 15 Jan 2024 02:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA2D206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705283056;
	bh=vkl9qPwerggBcLpJqgFrSOFTvGhwZNyoc0vvY1qNzkg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e3+R5EuRZBD/4FYMa+UYONXuvrp1JhfSWSAGPJCVUepqZHQbZEc1fLdPcK5zKxeZG
	 IwWwIrhy4GB8myqzrZ03BvGqkGld+4v0+hNAn/mCePeHQVP+BeGOgi4jE/5uKcYWlk
	 CR+nyF4r5YOuiVmo3gC6f2FRFkRAWedPn+5Xe+NQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FFA4F80589; Mon, 15 Jan 2024 02:43:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9700FF80580;
	Mon, 15 Jan 2024 02:43:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 068A5F8028D; Mon, 15 Jan 2024 02:43:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AE63F800C1
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 02:43:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE63F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ReE+qO5C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uurj3mE55/RW8sa6WSNe/NCixcOdnxwjFiaK7VM3akqs5gwdZuEzoe/saQkYlk6QYh4ggChFvFlzXWrc5/1q3WLwIPnxSubGJx7FRsMxQb9nCTrlgGsYyk/+7QfaaDhkL1NmWi75DZURRvMshtNOn5ZTNC7SYa7p0k4By+C7w/vL/Tt6I1QC2wuS37x5cATOZtGjkP5yNQxzgdhXSJOAJuzYGfFAv7h9uBXbADh/2rjDszpMIX7zSpump2D0Bl+52kcNTh+SVyKHbZ3DiXAHyMi8u3cy2WjRnjXNqtHegcxKLm6T1BKpfdGFHzPe3RP+r8Vi7tS+4Z4LZv9qbt+t1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkl9qPwerggBcLpJqgFrSOFTvGhwZNyoc0vvY1qNzkg=;
 b=AYoKaMav8gXjJnlSzgWAUWRE2wR22iq5Q8vz5i93n9bOcMAci/PTLkxkLAUsL2oDfAcUZeMXgcS8g+q4tloZ+OqELQtgFhIgE7VGujDlJ7kAp00HH8pouJj1O7lz/L9XMzU9upLRTBXwpHGlwwRhfCZ7TjPaDreiAuOlzEpRyEn7+j4Hg3hxaXjYphCDRwiqNuDziS80Nb3hRHf28FZYoEPskFkR+gWCQPZ9SWkvXmo1irs/4HgDv2dY0YBDVyYDjbFSPp+J1JLo5nT6As4Ez9X15QZgaSDKGHRa9Xv0e5i7MWTYT/xB57JVJln2HO9RmuyubsYd3J1MM90tymr3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkl9qPwerggBcLpJqgFrSOFTvGhwZNyoc0vvY1qNzkg=;
 b=ReE+qO5Ch7tIX5tyFPXl6MaCpb7p/nKatmM0XRsAl7h1kJk17utERVZ5+8KDDfxDNYTvzXfKjxgZ4AenIFjDeMrYgW7AqKStfTCDSoQcAONuNmtrhRSz7gPGPpxSLFBqp7QEIdScrgSBh6bhxGJvov5hj4HmO+yBX7yqJXPJ07w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6281.jpnprd01.prod.outlook.com
 (2603:1096:400:86::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.17; Mon, 15 Jan
 2024 01:43:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7202.017; Mon, 15 Jan 2024
 01:43:17 +0000
Message-ID: <87mst7tlqi.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <dc984f84-6877-497e-9b47-d116c8f3c42b@nvidia.com>
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
	<87v87zeasq.wl-kuninori.morimoto.gx@renesas.com>
	<dc984f84-6877-497e-9b47-d116c8f3c42b@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 15 Jan 2024 01:43:17 +0000
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5e5109-bedb-49b4-1689-08dc156b58d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kd019Ttzy6eWKRMS9EgLIegFUrFX0hOP6vFIUf2ZBV5DMEqUro9hqKFPyNBb0+zKJwzh3xgm0AGnNIV4wZipTzzsnYS7ZHpMGyZN5VpGP2BIm9T17ClHb4Qs4dXwedSIfBgKxMOcLCTI9nNCxBD6qdMQRDOasqWoRak09D0wsL9yLvTGevMr+Jq73phj9EfJNxfeMHJwk4mTBSwqvCQWw7DhcEJXocUpFkaaJty9m+WxVqQ+hpRnoSANC9ENSdoYQMnA3j9/VDKvoTk/ZJkSt2+ia5AqLl8yL5xlVNa0S2KZwNFtYnFWmy5UorFbq/Rh33S84IisBuWyHH7i3+kdUfsQ/uMpNDqjLvqmryaN/n0LQZdcssFhlM/qFwNvmsWCP1pI1VezdIWz9YluDLSSwSqPXKV404YoQSIfMG2Uc7su5SRYXXZS27tOhrbSVghE65BXGqHt3WpaOKvBttpRmfsWp6+hN06d0OKsVovr3+OkpskLmx9Fr+JkNjvXGnyLe42adEgL/5psLH9XGP/M20RTPYHHdYax9qhkez1DCxLmxypyAr/tKCIYnybzH9pidKnZiwlcza83NAzfjAeG6qmkOwdQSC30GLtdXWuw6uUAp1U8D/i5tLlyurKX5+VnaVQdnmRbAemkZc9gHC1lIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6506007)(6512007)(26005)(2013699003)(86362001)(36756003)(38350700005)(38100700002)(4326008)(5660300002)(2616005)(52116002)(8936002)(6916009)(316002)(66476007)(478600001)(8676002)(54906003)(66946007)(66556008)(4744005)(41300700001)(6486002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a23qxHtxqjuu14+7Rq3TbNP8lLNdmR9GJx51b18sJbk0SpSGMquIrW39VTI/?=
 =?us-ascii?Q?W3Jvxeg8wOimsCwvqOtxlq7rLPMq3YzptF02vniOMntQv6mOLMwJONoHXUlX?=
 =?us-ascii?Q?9k/SWPd9EBtHa0x/aNftbuQhi9ALbuJndz4vb0R47pEM/fdw7W5ZWyVZ41Js?=
 =?us-ascii?Q?u3La7CXsual++8bdtz5cWhpa8FIJ3vvLSs85FLOP5j+8sz+Gti+O6fjsQiZx?=
 =?us-ascii?Q?6NPw1oygHKgw1VDLMiNS/LhyWmCn0yigHM6wxCEbLqsgjD9+3OvxsITwAd1Z?=
 =?us-ascii?Q?YdHp0OnkbNdDV40gbRZ4fz/1Yw8qqk9JyEeg1AxdukBYnLYTEkkx1lOc99/y?=
 =?us-ascii?Q?aNoKHPooM0BMz/MbjNuHXUoSQmVR3uzErwhhsU32lgSIP2ypsCAVB0XXBTC1?=
 =?us-ascii?Q?cvrhWR66mSU2BTqKQSrYT1KQYctohxhXNmFq6kcWp+Z03PUdiB4Ku4rvxU+M?=
 =?us-ascii?Q?vWf/NPTob6adhJ/crVAAU5dd//9gB4HLLkp3YBfpJ40wSteQfFz+3UDKp1WP?=
 =?us-ascii?Q?wozRbA7q4nehH9bVNTk5t7Eu3rh7SjToiPowj/EDJgPK2mfWiH7xGCdxBqEp?=
 =?us-ascii?Q?Gap/uBewyxoWidPCvbXVj0veh+QpEsuvklnLyOaYcFZlp4on+dKid8EiiehR?=
 =?us-ascii?Q?zhYoUbc7Oi112+E3DnufxKi8BM6b8N+DAFf4v7vO+qJhTGMAzWcCXDoTSrZR?=
 =?us-ascii?Q?5F5Z4rRiKkCigMjRBLw3xR8k8/AsUVLck4IckO4lgyx0dNHytKevsY6yzzgE?=
 =?us-ascii?Q?Obiz+hI3qwafu3/1La6Och2A5wnk3Kz/WNYDabiV7n9NnvkBMjxKEEiWTiGp?=
 =?us-ascii?Q?8NMxPXAXiz+OxV5iaZVtDxyx6GCfUuygcxZJSePYtWbnrljN8yZnSwMd6dOH?=
 =?us-ascii?Q?ssxuTtDe3/61S95G5U6R6tcWGAM2UpLnJIIAqP3XZU0PtaM3aZqhLgRTZfgR?=
 =?us-ascii?Q?dXIdpPUmstzvCWJDrOhJU37Ses8FOvTx4tEKJk0MNYkOLd+OxzM2JIGZ3Ujg?=
 =?us-ascii?Q?kf721p6HMnCdaJLs5K0plX5K9A8Vw5rfGi6r5nOncnMW3flZGiNAHvQaOMOp?=
 =?us-ascii?Q?yEgLoMl6rRAMXMNfzsKy9fvLYuZIe7/h6ehhgWbNGDYIhxn4pwjmmp4AHW4u?=
 =?us-ascii?Q?89PsCJOG091DAkzusbxRkUETdjTBQZNr/VKanXBc9zPCk7A7PwaShABnl6Fb?=
 =?us-ascii?Q?Fh6q3d1yJHpwzwXoSohL+Xv8qVfboMwsOXrZsMhLDPuOzHTE5RUbTPgGRiqH?=
 =?us-ascii?Q?/lQTC5aPng9Cq3XgXCQBk5GwU9knXraGJUBWXrI6PWNMvsYgmqk7KKsUG67F?=
 =?us-ascii?Q?LsuUSMW1VrRQ1hY0J1qC57ZC/0oVGenIqXnqIWFGWotFxlBm5C9tP5R/BrMK?=
 =?us-ascii?Q?xM3+L6gVQPOfy+azEcbMmFOi60CAhxx9JMJczo/w4qf2FU5wFFI4mJGkS7ze?=
 =?us-ascii?Q?3OI1qOHLsQsOYCxkSHeyNILVoo4CvUYDJ7QlNE+OcCQ1LWiFBM9xZytvbUBh?=
 =?us-ascii?Q?ICiOzoBcRjqbRj2lLoUpC+D8ylAronu5NfoUEvSM6qsKQYkQwKKNgl5OL6EK?=
 =?us-ascii?Q?7oHFB6q3KQRRQI/oqa0AVFweU1lnE98ou7t60QIjEkJRTpMXW46FSK1NXY/8?=
 =?us-ascii?Q?oNF1K96k+UMyfu5yo7RmpOE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e5e5109-bedb-49b4-1689-08dc156b58d3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 01:43:17.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2qfKnA68MKmwJV517i674C/0DHTm13Vxg70f4+bWd7jVMABy3wfuG2wFy9Y89EUUYIR41Aul7w6TV/WEJzIxzvpqrGLX230hAXeNDBwyymbuE2ZA90ZdFIIrGBpgc7aS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6281
Message-ID-Hash: IFMYIIKA3XMJ7FBS3UTNBFC4YHPKZUS4
X-Message-ID-Hash: IFMYIIKA3XMJ7FBS3UTNBFC4YHPKZUS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFMYIIKA3XMJ7FBS3UTNBFC4YHPKZUS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sameer

> Thanks Morimoto-san for references. I need a lot more understanding on
> "card2" before commenting anything further. Right now I look to
> continue using "card" driver and have an easy DT extension, if
> possible, without disturbing existing Tegra users. I hope it would be
> fine to push changes to "card" without affecting existing users.

"card" and "card2" are indeed different, but similar I think.
I hope you can use "card2", but if you want to use "card",
you can use "custome card" feature which is zero effect to
existing "card" users. "tegra_audio_graph_card.c" is already using
this feature. see audio_graph_parse_of()

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
