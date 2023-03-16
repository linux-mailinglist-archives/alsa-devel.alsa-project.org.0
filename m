Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834016BDC83
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 00:01:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F68C103F;
	Fri, 17 Mar 2023 00:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F68C103F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679007661;
	bh=wWPTSgYOb4i2APkwm9QWdcr1Bz53cACkJRY54hIwS8o=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m5Akpu4On/NyLhU33NRyrt6FIQmFasdSYpXPq9SZq3v0/jy+CLA7evX4SAnlNw5ka
	 x2jhEV4ctpy9OuNmBW1FbEcUBJ4rvqvfSRu/jtPO/VwIMiZGLxhNniv3/2LG0Z43lY
	 nCOjv5wXSJ7Xvn2WI/Zq+XZkjRnO18rVt9Cc/iOw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B245AF8032D;
	Fri, 17 Mar 2023 00:00:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C60DBF80423; Fri, 17 Mar 2023 00:00:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B2D4F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 23:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B2D4F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TbvcLEYI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caDommOU2OSUPrOt4Fa0c89iqs3fwUd7DtAAXeH8DHGhUYqgYFuYoPOstluL1pwhDS4QhhE8/Tqzm+Tcj1Wcwj1MngKpB7hBcTriHGzraL29nzz/gvuJEfLoLJ4837BYMCihLtOoSWIJj47N2X5lcFAF1pHz7n6Iw3NFcbIaNPh/NhvxvwLpaoVma10dz+2ZBH7CHckeQSMZ7km9Bjkis8VhMXxZ9xV7ApkSEr2R66F8jkPr8vXwFRfBKwtMYtosqMchf0g8cNlxOvSWxqyz2i2z3qii3cO5qZj084hlaDdFjrF8Qt1TGOr+hBUu6+jSTfGGrMdy3uuVxhl4kFDiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWPTSgYOb4i2APkwm9QWdcr1Bz53cACkJRY54hIwS8o=;
 b=YZd8cE/6WFfM4C7WzIakOMDUJm8poSdA0WaSIcKmy60194WILSwnDsv7drjIbj2CgMLp5X7Dv8dQuk4a9vfzbSwUwyrjnYj7YjesphSf9AksdRLG0D1J1q0OYUdXLHx2dSqs3pPpzEoFWykwl+K85iJhi088e/wmpLCW1/J1F7jURqNmSI+FoLjbciMoGnN5YAgBhLdIVb6pBE2dJW1zPKxw4L5ItEy97lerYoLg1cExV8Ohkp48UllYB4hxtMULSDN2rO9q5jIE4OpLWl+pPkcNcvIpmPfK6mWiSjZdUp4g7sRGw/2yai+GotD6H8RRg/1anLAoThRLhexiErtZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWPTSgYOb4i2APkwm9QWdcr1Bz53cACkJRY54hIwS8o=;
 b=TbvcLEYIjgguZs8tR24pNENJ7ilNXqvjuxMPgndJ2NlNYvVzGWxHg7qx+mqBH+7pEPsmicaRugcBCpFV3HotVYFPI8MCq6LbFFQHI2x/jnhpN7enkyEi/KCIIorEFZAOpxm98JmYwHxdetCDtogWXNwMRvTS3lRlD7F/M1nNKoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB6141.jpnprd01.prod.outlook.com (2603:1096:400:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 22:59:45 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291%4]) with mapi id 15.20.6178.035; Thu, 16 Mar 2023
 22:59:43 +0000
Message-ID: <87cz58715z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 132/173] ASoC: sh: rcar: Convert to platform remove
 callback returning void
In-Reply-To: <20230315150745.67084-133-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
	<20230315150745.67084-133-u.kleine-koenig@pengutronix.de>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 22:59:42 +0000
X-ClientProxiedBy: TYAPR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::29) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: e36f90df-a1b4-46a1-5edb-08db26722110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mrz++oiAlEGURXXd42/udFiSgvqqn1NYVhjRzoy4MGOjMfyLVqa9Q/wPBTxshuprYtGGGer7nnc+x/vWNMxxGKRoRelRwjSlMg9Ekw8SyJzBhZLch/BosdBllxEqivejJNIHB+42C6wV8+L4jPkHZTwg61ZpI2Qp+3Icm9qwBuRruyGLM7oVGJOXmdUilG2MGBujN5kghD/giRkihZUZok1KxPgFsoTYlda08sT4voBSCuGT3D9guXHMi4WrkF9o7x1qSYw/GHHOiwFwJZLxcdFN4wFwXQZ0pAChFwjNdf8fTNwSJhvQK1lyr3mlTFT3ik8bWyImTviuBmSvw7TpP97sedUYRvoFkuNR1SqTfDm0duRUanZb2tgGuJ9QyzHxi2DiiFm5JtTUDDjCINqdSyeUy/EC2V9DOxiVPAVBP+bQUnov7i772rS0BEfepNFQkDellh4/5Vcss9CwywhvsNt77DtYG8ARO5MfvyYea+uzQFKd3bnllpBRInBTLdV4/oojLvBQDVRTU8oNL1XaunB1cJ2yunQvcvnx68j4uw5IKt5xSD9pSYmEQPm0UytaVz4EnQDTg9kT1BGZ48wedaTJinHGAUHnx+8c+QDlCVWaEfXSnoxRkhSms+kbgic/jZETv8w1WLDLZMGXBwqLZs0zlmeJMgEgxNL1AR+zmoZphvlSO5xKJiR42AYwf3YGWj/l1VHYBvqOPK/Xd49QXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199018)(54906003)(2616005)(2906002)(186003)(26005)(478600001)(6506007)(6512007)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(38100700002)(316002)(41300700001)(4744005)(38350700002)(8936002)(6486002)(52116002)(86362001)(36756003)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?HY2JtMwqWHK/Yt/PGLEyuhLjpuOInNmpa/9A/QT2kA/5a8s9jEexEEXMa4?=
 =?iso-8859-1?Q?sl0GQlza1RgXAtV4IFDnI3VgE62bRA6q8vbfqwZRnNWOmTK2ZpkbJOnaxU?=
 =?iso-8859-1?Q?+s/SQ+4APrOa+5fcVKjhoh+4eOHNOYEfNYbjV4aZBFlCTS0/igfr+UCo4r?=
 =?iso-8859-1?Q?M99jGh0C9Abjl+r2cX9Nmb+iWbKoFZZyrKxZ87tG6WyTq+Lb9yr3GTFCzI?=
 =?iso-8859-1?Q?Y6j64oM8AMNeOS016JtEftj98pB0vPYUU5Sc4702V6ofAwa2JNpzEiArHS?=
 =?iso-8859-1?Q?ExrJtqWWbMS+szBLce/beL4+RxuS0ZzJX+zP/8hY+tDvJiIhu6RYbL4RYs?=
 =?iso-8859-1?Q?aswACnr7KmSfqVfwMhKZ2hH2t/9PE7Cr6Wajx0NGSHpiNxNBxEs+M6OLlF?=
 =?iso-8859-1?Q?V3WuOjkPzvnIu3+h3wFkHwMZQZWV7ScMcYsPr1wM6EBnkjpW0H7AEHB8ab?=
 =?iso-8859-1?Q?qKedBsP4HtWwQu/jHrl3C7FdTDK2f03X/Sq4TAJNO1vrjbjsE8eooyMvqo?=
 =?iso-8859-1?Q?EGUIxlhDm3GBtsx6qLW07rc2aIz6TtGkvyFOTcsmvarXoNgvkB/2B5RX/j?=
 =?iso-8859-1?Q?Kuf/J5bSrqZRNX+DP1Ylkldh7WkpkLlhJiEB8OpqIM7oRd7gVjOgWMlyRq?=
 =?iso-8859-1?Q?hkXnF6Sc1of6YVBWVhfs0GFBDSLMEygMl7mqjLLz6ysCW0MRtWNPcGVMYP?=
 =?iso-8859-1?Q?X4MtUGgl5ACb7Su0gLRT4shOh7fVPHRXiSElW25CWAkVPNjjkrpFiblC7+?=
 =?iso-8859-1?Q?LllThAj0Atxd4vo24FTMsbdOdwvITeMee12ErA+sLaLUxDRg/YrtdelIMh?=
 =?iso-8859-1?Q?Dl57Au0inBHb93rwAJdZx1yWGngRVbRA4QKIFW0tFi1t190xR2k2AQU6SV?=
 =?iso-8859-1?Q?HXciSugFqNXecSRu5rvqVMOqV0q/2Q2k+uY3iTOojlrtCmAajXTeP1eDhG?=
 =?iso-8859-1?Q?1+Ml7JEtGMLafrEfQ71piAeNuStlQi8xUZAUdPlMtvYeEgWcsgj+vMTb2U?=
 =?iso-8859-1?Q?OXmKKrnr3wwYiVOT0yNl8uG8ryHDdXQNGjvTaXTmr+fNgvFSmMWERvJu4G?=
 =?iso-8859-1?Q?jq5FQx6N7BbNu9jzT/IuF1zV5JY924pja14fbTDwdfO70N1y+MJMVKzpQ8?=
 =?iso-8859-1?Q?PSLuUXsmeq98udH07DZsiZWF3OCoTPzRHsUF4/hr5fJP3mtcao5w2YCZnK?=
 =?iso-8859-1?Q?1Zp6bHDMpqPHt8HMOwe3LJ6UJARYB3ItxCnIQbKz9Eqs0BwkT19rGX0C35?=
 =?iso-8859-1?Q?Au7Gn/+F2GaPbbMUoKLaJ7HwZCZk3csJd5UtxSVZalykyd6V09ZjWr6HN4?=
 =?iso-8859-1?Q?rxg77aeG8yjVZck9/FG+1oso+B+a6qLSk3JX6CZNqB+Hwq8MeqWvvFRvOv?=
 =?iso-8859-1?Q?7kZPAv9NQVWuR4vBfAfXp+Y6X084C0Utw6ZUFNFx1VKkrAgXETKwjGtbux?=
 =?iso-8859-1?Q?iIgWwMfRcgrQLHN7iIstwQCsYjMlHZts9Mau2NHJDCRAFdQi8fcgQl6bSo?=
 =?iso-8859-1?Q?KUCMU4dosP9ZUtsgwh/Wp3IVGhkR9LyewXp5xp5zFf6ajeqHuKdk9Jf1Rj?=
 =?iso-8859-1?Q?hxqoeQvND3D/d6UWAwwSAAG+m4ImlrGV2IYofN9RNfLBP28yCd7xJwRW5w?=
 =?iso-8859-1?Q?todYC5qc7IxINvlKbYTzjmQbU6yn1coL5jfAJKk9LbFgC+WSovVBnPybyc?=
 =?iso-8859-1?Q?VnuxBFRw66ZMLLpt4ng=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e36f90df-a1b4-46a1-5edb-08db26722110
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 22:59:42.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4D1B7YfFXi0XyP4M+xbFYGty1DlzSHphcHhB7XOmNXMGfjTFWs5bKuB/HKFWTMBQDKE70jeGr2K+VCcyB4hrvnKRYgh4OoLsXBIZjL/CH3NwKJoorQxU1mdN1WF+aXOb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6141
Message-ID-Hash: IAKXM4WUCDV6PIXVJGNJYEVOQXFIYVZU
X-Message-ID-Hash: IAKXM4WUCDV6PIXVJGNJYEVOQXFIYVZU
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linh Phung <linh.phung.jy@renesas.com>,
 Shang XiaoJing <shangxiaojing@huawei.com>, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAKXM4WUCDV6PIXVJGNJYEVOQXFIYVZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>



Thank you for your help !!

Best regards
---
Kuninori Morimoto
