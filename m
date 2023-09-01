Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028D78F8A5
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 08:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5446209;
	Fri,  1 Sep 2023 08:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5446209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693550399;
	bh=+oM1zUPP0rYXSFVMXBdv/6VbXUP/gYj3+vjQZlOL86A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IkRJF+/hy90pBu394QYumsib3SZvpNpPIkg2AFLshAXQMHyUvCCY23CenycYiZ7Lu
	 w8EIX6ybZSnfyAIihxTbWvwEFISJWGonY70lM6uKA2lCX+8RCER+1rp3t7ISH4SPy/
	 OXE5ayQxUyrmyjAbS+lUMp6KNXDlnV3JMbWw4zi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6801CF800D1; Fri,  1 Sep 2023 08:38:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E21F80155;
	Fri,  1 Sep 2023 08:38:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC7CF80158; Fri,  1 Sep 2023 08:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB2E8F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 08:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB2E8F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=QgWaawBO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaKcyX9MCKNgF0f9upBYkFeYx7awZe+TxfQAgUVXnNJi9Vsu9kCy5zRL5n+wJ/rEDllXYia/yGaWQEdSP2LhH5SiXwxCw0AEY0KqBnsFLe5hRfUHfADY0SeNnzcVlWoW5k6Wnc6SmwPBzA2OqiwwKQQTDz0q8+zFwvXOVT4XpMsKRclseaS5W7diwwBOmBtoM/Lt9zsQ4tkwenqhiwbxkhglcABIKGr3LZx/Q+eb4HKQQA180bVrFTOzKXY8IlYRJZbt2RqawGIl7M73QRR58GAzfSN+t8LO7G+e/FWa1FavxlizOzaRYvUHoOb4SdUSWY2lUjJ05ahGtASzp5Kd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oM1zUPP0rYXSFVMXBdv/6VbXUP/gYj3+vjQZlOL86A=;
 b=fr8NgfGBytr6UMeUGujGJQTEW9Sj3cznV1IV6mq853GS6sArB0zCZtP15IcgUcqA+rDRSwK1n2gha/P5xT4sTlhD8wFATnkFdQ9JYJuctpzDyyEAHvPAWR6HxPgpYWahqpuTsAZlMnjnBoRzgy0V2a/rWdcCZ1ciDNkFPEXGfvyZtfbyLya0jy3BTgUHldx+9Z/miKRqI/ZkQND5VPom4sxYrUtdfcCHQz8dAhjfHz8ibFcgDqGE8ITzZaSQMh4jxNc/CWJ2QKFU1W/i6pQqDTREEA90dyCs708t7NOjarL+q/Axd+K11ggNoeoautrTp8Ej0serxTZ/25fBzw6sHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oM1zUPP0rYXSFVMXBdv/6VbXUP/gYj3+vjQZlOL86A=;
 b=QgWaawBOV/sdNlQEd3cEKAD2kmYzvPb98Ta8YkwOKoIQWzTul7Mu6TL4VsLX9cDOUtXMHrgTcIp8Glpmf2BPUyzpKe1uASz8/uB6iBIuJV1i6PAaJsIgCoEBrXBmRc6zH0O4AGAgG7x5dPE5Duyr98ZN5SFiJBlx6QjBsUwGU2s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB7830.jpnprd01.prod.outlook.com (2603:1096:400:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 06:33:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 06:33:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] ASoC: wm8580: Move OF table
Thread-Topic: [PATCH v3 2/2] ASoC: wm8580: Move OF table
Thread-Index: AQHZ3EfJrg0Q5YYr4U6Zfq5sOXPFybAFDSCAgAB2X7A=
Date: Fri, 1 Sep 2023 06:33:08 +0000
Message-ID: 
 <OS0PR01MB59225F3B6218648EE650606B86E4A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230831201429.94554-1-biju.das.jz@bp.renesas.com>
 <20230831201429.94554-3-biju.das.jz@bp.renesas.com>
 <ZPEiGxftpGsHrhdc@smile.fi.intel.com>
In-Reply-To: <ZPEiGxftpGsHrhdc@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB7830:EE_
x-ms-office365-filtering-correlation-id: 5c6db76f-625d-4060-f1e3-08dbaab54ea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 v2QvQwpVDnGxXXL1hidg0pp+a1ZOyx3C7vEsfEEwXilVpAWXkg0WN7qaYd7QL5W6IvomLOdasZHqebYqKMAEAjlSUXc0TCJVUW6YtCDnWEeByn0ggWQGAe1xWLnLLqVfGyRqO7F1h2Q+JBvWdjo91TCQd2XBBdIkgfeh6BN/pzJavkTq/t7maRfBaFsxrZXYudGdDm3eY/+UndT7aHMMnPKuiRXySlIaPm0vBH3zMWfkk1X7NmIg9s1DOdtTTf4X/FB7GNJ8RtJgBQI05bHlCfSkVNAsGfK7o1rJxhR9UfbyRVkmsnSzCjawfAHo/0Zk+PIe20uwaXiKRONHoloOvACM7iU9yvopVkqixeOFWFAs8y5AiKSqAv9g1E728uDvo0EBt/HbGTqtpedsjoC43Nq93HOUA1fiCriAKU/FbDsN0gsQ890/rTba7nQVrWYD/lXfu7ul7bTn5Jyd87ZnjTSTrHgmdDU1lSfQCn7YRc9s9Weg1yOXcQzGXkdsHbw75U747a6djuuNrtCAfh9vo/9O8inmPuwsOJJIrgHmc7Mx8QL3xOB7UeWs/ya/Dtcj0prwjV9tgacitWYbf5VAkSEDhdnsaHykMDQWZBcuqrXTL7LoAsKZ/WFhaMs5Ta8y
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199024)(186009)(1800799009)(9686003)(122000001)(7696005)(6506007)(558084003)(33656002)(41300700001)(86362001)(4326008)(26005)(76116006)(5660300002)(6916009)(52536014)(316002)(38100700002)(64756008)(66476007)(66556008)(54906003)(55016003)(38070700005)(66946007)(66446008)(8676002)(8936002)(478600001)(2906002)(7416002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?zIRqf0n2JRFSJAZXJ9138fMxIbPeyBdSgQID765papRyaQM7UmS61Zxz50?=
 =?iso-8859-1?Q?2PGWySsF4LaUcqpdhlgPcOns2FsFlkSVq9KO9vU7qqjmNeoEkSmuy+jtXb?=
 =?iso-8859-1?Q?r5ad7S8HX3e3TCm76BNi+rdlU+llX+p7Cj1CLsMdsPEQf9PlMvmHajXz8m?=
 =?iso-8859-1?Q?QXjRmzn9/kyLr4qT+8pvv1mL6vfEkMsZ3sMMG4fYqOCUma8Rgju/lHDUP6?=
 =?iso-8859-1?Q?JIIqNklFeoJJtEJKwPB0zDfh7cL8iHCynE35A9PkC9fFoeuWaRb2+8DkCb?=
 =?iso-8859-1?Q?aDKnZp4q5AgZxj3rcQ0LhDVS4tmPHFUj4Gz7F2z8ldgkrFbEqSO1/7l2ZC?=
 =?iso-8859-1?Q?50L8OtXj6bu+othaiDUkvTcrXrMoWj+mWFP2tO6d+eQ2M2IUKr6DF2g/6u?=
 =?iso-8859-1?Q?eEDFohsimYP/u6jYeB5OaHeyhKWNqfBbA/XxH9ziykTkl/BGySbsenMmGu?=
 =?iso-8859-1?Q?RMNQvZ1XRTe+kkcUH33rJPo/n3dxie8g56AMBzY6Vn/GcY6mSC0UVH7vYP?=
 =?iso-8859-1?Q?isvqc8zXnv+RQ3oDyjt+CV6fg+qZX+hiJAHVlzw7Hb7YNEsPIwKnUCHHUa?=
 =?iso-8859-1?Q?J9aPIEkrlh3UQqwwMr+LmG0xD0uO8y8UyCKzUy5DRU8DMPAYYaVdFzwNJT?=
 =?iso-8859-1?Q?ZlhzU+KBvaBXAhNgTMUbBqG1D5Gn74mUOoOQESoYPDUwlWxEZJu7DVwFCP?=
 =?iso-8859-1?Q?XThVahJSJeo5z7AQWoyU8lBw36IgGOp4j9GpEK9bmEV5S63eYpdRe5WOBl?=
 =?iso-8859-1?Q?T+9vHNOK3CpBuIVBXY3DByjHUIX+eISN69y1gxuwnnzeIyYYtB05EBdXnb?=
 =?iso-8859-1?Q?M+zikSST5uynMrUdsOXRz8luC/IfMx1KKUhJNjhNNTbENDy+/3u3uo78U8?=
 =?iso-8859-1?Q?MYYVr9Te373MPPhWlWfl4MMEFHd413rtbuCw8U0LpRSbJFr4CZ3RkZMRIe?=
 =?iso-8859-1?Q?RFGs3goEaTSBL4qQZTUichpXREkHyVKBVKnBGA/EdmQ+uWM95XOfnvdDiM?=
 =?iso-8859-1?Q?IhJ8m99PkYfW6ovR9NDFmpRyXlhWHxJD69jxxu21F/gFXbIiuIdgDKVs56?=
 =?iso-8859-1?Q?ME/QRhrZmWn1hppTIAJSxnNVajKe3Xl3Z7l/1ThpLjA8qmgQhqsVmbJviN?=
 =?iso-8859-1?Q?b98x9//o9ex2+m8TFAgjcgDqeIuG5Qttst7QE2uDNGYXfGypjwYPNy8UGp?=
 =?iso-8859-1?Q?/QPrwPbDE/6bz9FjUEAufMeuhDjVcTKASe0G1M0gFviohT/VozAjaoHQoN?=
 =?iso-8859-1?Q?p5d5sYzv6nFQInm0+XUCViOHnNZtzvQhCMDwZWSECR0Ux4fpPiaWrjmdDE?=
 =?iso-8859-1?Q?fBCQasExqKcxeWEYVrHoGjlB7/9nEPhsvbO40SijrnFsd5aEmjsmhEG+aJ?=
 =?iso-8859-1?Q?+f+7pc2ZYm/mMuRyH321CR1ypAEtqVg/rm4zzdisT6x/s8UFvWZ2439MyY?=
 =?iso-8859-1?Q?vJCprXVcOPYF5d9YUVs2WL8KjjJF9NADjlw0R6Jl/EtmHgyRkPS4Wx+0eX?=
 =?iso-8859-1?Q?5GRuxFnf8W6mtJCptTXNxFLdr8PAEy9LbSPqFNwxQBVutFbQLNwrdFWCxc?=
 =?iso-8859-1?Q?yiV0+PHzmm5p7pHsA+42SDO3+Fr1bWl2Ffn70xv2AC0zlXeJiAQiarS45v?=
 =?iso-8859-1?Q?stmSUw/3fhn/2lj2o85W3WkJHejIxlmDwSK53bQv/L+umDE9tjrGLWCA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c6db76f-625d-4060-f1e3-08dbaab54ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 06:33:08.8425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 pPvQYNoddU8KCM3eg7dTAm7kbXF0KHwmRoILZs0x9sVF/+A0cFwI9kNyUic47wJOGmUSyaIHdrlILsJFI4BDYCkAWlrUCu1jxv9AT6JmFXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7830
Message-ID-Hash: OAJL63JNBJK5ITUA5LY3QGP7LSNJCCBO
X-Message-ID-Hash: OAJL63JNBJK5ITUA5LY3QGP7LSNJCCBO
X-MailFrom: biju.das.jz@bp.renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUQJMLDWHO5CW44CWC4WO7KOUJWUWXMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

> Subject: Re: [PATCH v3 2/2] ASoC: wm8580: Move OF table
>=20
> On Thu, Aug 31, 2023 at 09:14:29PM +0100, Biju Das wrote:
> > Move OF table near to the user.
>=20
> It does a bit more that that.

OK I will send separate patch for removing trailing comma
in terminator.

Cheers,
Biju
