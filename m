Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73C82A525
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 01:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B414DE9F;
	Thu, 11 Jan 2024 01:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B414DE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704931417;
	bh=GBnZKouVf0yQOSKn/NFwKanfbQyOArf6HVF07Cd6gfQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d1+ixbI1ED3uNoi34cje9IdxznX7zGmEk+5cF9smC9OuHVua0DolYzLr3TNeIlENE
	 mV6OK6FQfQQmi8V4Xfzpdwr503U8uf3nZPBAcTBaXiLKo7Bxh8ETCrsn3jF3NKhCa6
	 iZntx4EOltXGG6S1Sva2alk32jKFxhObF4LToeYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F08BF80570; Thu, 11 Jan 2024 01:03:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2192F80587;
	Thu, 11 Jan 2024 01:03:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2CF4F80254; Thu, 11 Jan 2024 01:02:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7F76F800F5
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 01:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F76F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g4hKJKK8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB3IU20FF2hGWgA2i72lKNDh4hkwfjSHEHCUFUPCqnloFPa1cQA4qRylAsLV10yvv0QDqTBo4cvUsi0Ybwh4up1hNszbhvv7OJLQmhM2TQu2tX4cfywHa8vd6q4XJ9Ys9mHgfmLRHk7Sk4z5lE6dqiAbjijkiE+dkHkxDViUWB9ZCAvF66DR3h3J/nN8kYS3dNZluXk1MEAA3X9IsDIdWv0ltvU6BGHtHZm7E2u3GWEfBw9X2E29+mdYtqCnLcWB1Za9fJAXMydbsVisKMTrb6c62EAK+K9u/XdatU5GPfVIMBNscBXYeTlj3DogI6zTJJGcHXAYEVqcCwHX+i9Z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrbPniPRs894WxtBhfrnIwNR7pL0f/jEOXy8wP4Z8Mw=;
 b=GKGXbLT1LOL0+PzGQghquAE5W3JTUqatBsVZ9j972h/9MbrF2ywOBbhp4Yyln1qGjcYYnNKDYTpO2CvXmtWaw86mEq1tDRRGgoXn8tB+1By/Pb1SAY1aHimRBcjT1MOpSSPVGGKKwVkBUEVMegh0O4ZexoEP2EHWt6CFItIoReeiGATUcIK9bgc12FdtIIzdhp3FX7QOrXDdx5YkQxmv6bO8pbp+bD1J1PK3cCTikfvL/q6B/oljhmdHX1Qv7NvjiTWVrQ8NSGInbgTX2JCFScYoPaBpzmqBhAcIVubJAJz/2KI2UmeBd+w1klDcJhNh2A0bL3E7A9YWiZprEUaP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrbPniPRs894WxtBhfrnIwNR7pL0f/jEOXy8wP4Z8Mw=;
 b=g4hKJKK89SzaFhOAXyyedHhirlZPL7fizx5BZ22KSv8vXdNazQPBKWUnolSACs1faLk3x8jm8DxengXB8bU7DhaQ46PfZPFYYRd0YdStRPaBvmUNaJO9ERsEOkcTM+NTyWdIp8oQqlVHTg/SKnW3L6ySMNaQq4g701HjNpxdoj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB8167.jpnprd01.prod.outlook.com
 (2603:1096:400:116::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 00:02:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 00:02:02 +0000
Message-ID: <874jfkybye.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Rosin <peda@axentia.se>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: use devm_snd_soc_register_card()
In-Reply-To: <87zfxdpoyq.wl-tiwai@suse.de>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
	<87zfxdpoyq.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 00:02:02 +0000
X-ClientProxiedBy: TYAPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f0a833-640f-46fc-8325-08dc12388a17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JWtqePbI2TfnFoKoVFbJPJLHj/VOXlaCK94GCwlsMH4JqEvdb907MMSwMPiWpIyc3sU1Hxp3ECR15tvLz3MqVHCBedsvXlI/xcYGPoECd32OKObLguIfBX2hBLxP3RgsrwxYdwJWnDmVE0ncAfuz8Y7AJGjLVZQ9ml1kAGBVBxAD96imrIQUPkefcph3aY5fnkrNq6xDyHZZoNnXpfXRbgDezudGj6g/wV+cn42D3gQR/2hG1Rednvjto0hMFuXnEZmk8+MHtJhJcw01j0Amf1CZehd/rpNG8Uaqf4QHyXJpCEEn8kSiXZTMeS6+EPnlNhLli/cEXnm3iW7/lzt24zjcZzxyZQoy4yQM8vWxR7dOD+vPXRQE8UOJGOS5i9y0osbZfWQmx8S6O82/rFb//5zHx1+0/6Y98yM6Vn85sa23+Z5glfHkPal+KrhxUZnpbdHtYNmB8WfVvuqb/DLRVOvGQZj6TfhzEM55Nsb/yNblJFNwJJHlorpPrH5cjILkmnyKE99QlXTFRAtSzc5e82XU0Y/xILCLcQvMX7ZQx6aFZt3Za9MBOe8iqIiiKiYD+/jIB/IP/wzmpbbsmbqmnQtk5ZIOtvTmg7zo00Fc9T+sn4V+3ZkxB2shb0xnLM/z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(8936002)(8676002)(478600001)(52116002)(6486002)(6512007)(66946007)(6506007)(6916009)(316002)(54906003)(66476007)(26005)(2616005)(41300700001)(66556008)(2906002)(4744005)(7416002)(4326008)(5660300002)(38350700005)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yh6yn7P4Pcoghr4qU2/G2NqYqkjiHZl6+EdMTUPsllcwko1ujqG4PdleMdRq?=
 =?us-ascii?Q?L3KHa3XS/12HSPDuWdq8ItBuz2Oh9GM3SZ351Id/mbBMjreWwZQnwe+AWcfr?=
 =?us-ascii?Q?mU/L6RleddpJGICG/KxkNb4q4/UrCerGcJO/2aYrTqWEJLKeqiEFtFNVNqpj?=
 =?us-ascii?Q?Ey6YqAKiao995xA9DrrwG4KEmB5g6tsSWDDXdZlMi+wQtGsaeDXEymwPw4vG?=
 =?us-ascii?Q?uE4IpnHDkEa51IUVrNiyJXpHtGh5n/ThZQKiyCBRCJ3rtACeJfpILyeh7FIb?=
 =?us-ascii?Q?yp+o9cqAQb1GMxcDm8Jjs6r/25qnTkTRv22M+fC0ZQ5Eoen20iB+28Ee49aW?=
 =?us-ascii?Q?GNHCFSKHBKkWAEexd3IAzxK+hN0shyQ6a4WtCMww7deiGFdhyan18kzJS1V5?=
 =?us-ascii?Q?Vm1TEHJyttXC7heAFmcxXHE7xrZIWrrIoe7Y5myqRz737Fh79fYIS3G7Xdre?=
 =?us-ascii?Q?tm23TDBq4Hpr6mHwfdLiroN+rwOMmUAmiYT9mWNqVh2RBQc+ZwtcjHjHEPPV?=
 =?us-ascii?Q?lQqEDm0eVgOmHfRCvWCRkgyzFZcPpeJ4LU6B1OrJAQdlb1MmqrJkeFqRrQjZ?=
 =?us-ascii?Q?wcP8s7Yp1uOHsMBvwiN0N31xywlhWIXTS8Ho9zJNOIkZqrDCFCOKIPdUFrNB?=
 =?us-ascii?Q?n0mDOjEidnuiNgOyZxSngUQqZX/d6VX4OhR0GSxe0vT6Oewq0tq85LzZ0581?=
 =?us-ascii?Q?kH1BF8TZ2E9ni4pqH7BudBmZLs5O27SREv8UDkt/x9F29DCO/8Qtzb7zfxU4?=
 =?us-ascii?Q?Bwz4wQLQVLrb8KkQtngbkOz9hE0zkG4IX9fHYMW0tUIZUet2XrM/tpKKoC0f?=
 =?us-ascii?Q?H6Z5w5id/Oj20IIcVu2W8+qhNCKOJjiDk6iogQ0b3T7/hWwUdUkvwccVy/j+?=
 =?us-ascii?Q?fiS8nCctql/8x5P5S+Pj9BNTJanVluuwtrhoSGf9z4X9qjlFXX2RpSDLwQdA?=
 =?us-ascii?Q?08BmapmlncyZ+EkHWxCQgyp0BnxEumzIxeifp7KrzuTEhEnvnR9mrRBoCuDu?=
 =?us-ascii?Q?8dFTIW9T9/L7h4ErOM/RfMRMKmlPNmt3xUiHfWIAHj9yekkZTkDq+520M8lk?=
 =?us-ascii?Q?a1ftmdkapjtidKIx6yZUhL0Pss/oZ891qufgyLi5B5GReKGdW/IShep12rOO?=
 =?us-ascii?Q?YUHqsaU1Q1CxfM/K4Z3oeKAQFAplIv3EiHCAVSe1mc5K7PHEm2bhWZdbxEmT?=
 =?us-ascii?Q?JcCKsPOWh32iBqThLyeR8sDAP/DxFjPo/m44WvV4NaGZvgTigkk1TOOhgxYJ?=
 =?us-ascii?Q?wnSfhl56KwiC8ayIaFWoFNf3q8oPRzZs0MAb0fr6QkfRZ32dYKPvxA1v/oE5?=
 =?us-ascii?Q?zyfmDhlFdFFNtHGLLXjpjgzBylAWyIoeY01hdhcKglTpmfRiY1Re1RUQARLB?=
 =?us-ascii?Q?BrcyohCCXMmlc7XEW/Y5j0k7Vpf7GilOoMKWBH6hThCdx/Ql7pqF2Qo/Y5OX?=
 =?us-ascii?Q?9SPRQQsbfvbeIl/GPrfZxfVDMTDuw/QFLKtmRSeGX0mz8JDD8fkBFUy/DKpZ?=
 =?us-ascii?Q?mPx7rdXwfDkq8uQn1IVDkM2mPw7Th3hgRVxV/Hc9LR3TT9wfoPEO/qgFb2OH?=
 =?us-ascii?Q?H72Ja9F1suaB55bK4G45uRWxuPkdo9E2XejIVCzawKv0utmSPxDw6jcY0DtE?=
 =?us-ascii?Q?U4Pxt2BsxFYBSkEfhQP2bLM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3f0a833-640f-46fc-8325-08dc12388a17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 00:02:02.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7notiyiT6kg+FysOysdP8zVc8NrcykPiw6gwioiXQdwVGOgwkbr2tZS7WvZ5gah4HsKanWiutvMLDKjR+trDOXGZyhzmR1Y7o1RqN0KKEe+gSjW9E/Pg50X1dnp9zfDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8167
Message-ID-Hash: Q3DDGMQ63FAJH7AKQRRQO3Z2WI47PZ2X
X-Message-ID-Hash: Q3DDGMQ63FAJH7AKQRRQO3Z2WI47PZ2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3DDGMQ63FAJH7AKQRRQO3Z2WI47PZ2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Takashi, Peter

> I haven't looked through all code changes, but in general, be careful
> when the driver is releasing something else than the devres-managed
> stuff.  Namely, the devres stuff is released *after* the call of
> remove callback.

Thank you for pointing it. Indeed it should be cared.
I will fix it and do it on simple unregister case only in v2

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
