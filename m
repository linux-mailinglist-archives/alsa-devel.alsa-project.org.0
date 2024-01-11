Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2448F82A71E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 05:56:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9436AEC0;
	Thu, 11 Jan 2024 05:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9436AEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704949012;
	bh=OuVsUCjXEWeXGoFMdb8AqYQQTIjdFvjULZA5Vu1eh4o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VClvpbav/bLIAIY3guZouyOlniFABBauoV8JvlTWBfbyDBEwnCA6mhY3jOhZ5xQnv
	 Km1X6gxHPuDFEe86OBZZwGVx14RMIJRRo1NS4sKfnYOAxODhp2FwkrDgPoUxp4nzlh
	 obwH28ZPTX60rb8EipzFZeG5qH+Ct+1am6DjFCSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11EBBF8057D; Thu, 11 Jan 2024 05:56:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D0ADF8055C;
	Thu, 11 Jan 2024 05:56:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A452F80254; Thu, 11 Jan 2024 05:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CBF2F8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 05:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CBF2F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VqQTla4r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKuvzft5qKFBrlcWaQ4ZI9j+lDIX2SxhWEqgAg15Jxd9nfcDVF+oGnx9bU93toM4SWeHail3L8AmjfbTiOAxSAu+GIuBI97mmpdSEo3J25QTW/RYmi8xN2XaZFCYcsJO6FhEZHxtlIzkIYZuBB0qKc4HUYpBknm1uJV/zeCYEMNuIwQnCdclGrpNeDUmsqWoNIqzVBa54AWPF/hz37x/WHIagH6jtH+sinYrq+lB4++F5/iMGjQoHVj5azmIg0eBtP7iYOP2AyYlqur/9sVBZ6cHpixD6ZEiuterfsFgaUau7hB8OANYiwsFiubCfPYiUAzY5JRgVeIptOpYsiOVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQO2xtqxGTEnmFNgtTllb24gDI0Z2NvjVDm/ZwuMyYA=;
 b=W7PrIxzBqvYb4XkhagOWeb3dHyEdaiJTMdQJYQPsa+iq0JsfmYOktZytsdNmPJS1N/URTUfRR9Obd+hDmIU1OV0N3vTpDF20pV0dkSNOAA+wnDTGgXBfRknTPBYHunRT025ixs3WBf/RBDSOLn4ioOkCflrSZ2DF6cJ8BmmCATbFYPlC3O0UcOz3oB2c/tJztIxpE7/DVwsp2tgtLvRQAnFQhy2aD4Qh+McP7umNq2WNAFNNo/M8fXJ2d04S9lisLMyck7Ur2hxpZLZHmG0K326wt4mPzEvbCvFYPbc4Co141lmkhZ6iu91m1z6hCt0sHxY4bqXvjajKRK0SQyQ1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQO2xtqxGTEnmFNgtTllb24gDI0Z2NvjVDm/ZwuMyYA=;
 b=VqQTla4rQVQjlupiIN/KeJjC/6kaV/OMZ7w5eFTdAcTt4kJSEt+PkLXT6QCHbqyk6kfVib9Jqwgl5Cqa8d67mlB/fFy9wRTccQ7dqboeFkkNvJjZ0iUtGeYR4IQoiOtIAJmExEDlXxEOAUB9XsbCOC4ufE8APmoJLdIMUVh8uiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5587.jpnprd01.prod.outlook.com
 (2603:1096:604:b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.13; Thu, 11 Jan
 2024 04:56:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 04:56:01 +0000
Message-ID: <87o7dswjry.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <eeb61f8a-697c-425a-9873-b7b60c0a5558@nvidia.com>
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
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 04:56:01 +0000
X-ClientProxiedBy: TYCP301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a776c36-1574-4eed-1a71-08dc12619bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nSqmsAUvHSd8EA8oTmB7dY7i7nna2MWjX/kJHrAkTejvog9FYGi7vxAkswmIfQIm3VZM2OU8Hx7CiBce0UWOG8WEssHakX//qoIs4gBjYblWJjcpmXgwjc6/K2WhklHtW1ZnOKqRe6LW58+Y1gimP6j90jDj99qb3bxtrhMsHPC1Ba1wNkqDcJ8Cb1cy2qhh8AbusLaRpz44aIaCBGP+09WJMwA2qF5jYUzta6OiNMpsMOrRNKMfTCwN3ltiygGYx9gB0/LK9/NHxvZP0VckAbwpgh40yQ8RWEkkxdQG6+42KhJaS5PCCHUAu4xxnEHAUfUwR7IVRq3r3tKWQ6T3KwiYnr+4arHqLlFQp0xaQVSmrbjatJ6E7dGXkXQkYE+sGYjjA6aaigTjqxw6SqVT4QG3O3y3D+IxxZJA5lBpmqWzF9EtK0q5avkFK8O8mv4+Bgip4xtMCwrcSa/aSp3u18sFl5XuVeKipquKOZcmFml4ryWu/+pjW0ASt/91jkHyVj+7cp92DxkVa8INBM4TicRoBMsYTvaRplFCeUHgtgdcz6xIWhUaCa7T/oGJQovw4UWM+McoMJLUDbz3TOYOzG7zpNgsvx4MUrJU7qSa6CsIctiBf5ijf0KL0Hhann6IDbCw2iEC4RFoSprPNuP1YA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(2013699003)(6486002)(478600001)(54906003)(316002)(8936002)(8676002)(66946007)(66476007)(4326008)(6916009)(66556008)(2906002)(4744005)(86362001)(5660300002)(38350700005)(36756003)(41300700001)(2616005)(52116002)(26005)(83380400001)(6506007)(6512007)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ksZ+XUcfGuShS5xdM1g9FYLYq4iX1zcpSFnAz0/C1W0PFE3LjW3JgjVkCRZ9?=
 =?us-ascii?Q?CMpiEqm7vYB8wFFJ0TI+c2q4bUUiAHwZL4ysFjsLaN7xW7XqJu43nI8A7rMH?=
 =?us-ascii?Q?mDv68yu03j/fEz2ccERqLoRhX1oc0HdatyGVhj8WAit8joLtzVrh8Gp/wfFJ?=
 =?us-ascii?Q?oaid9+8lnPNHjV9NsS3nJf38RMmgajmypQ8TbAHgpaBPjCkgcuWctpGrbdvP?=
 =?us-ascii?Q?2D7EbM7ectoM0T1zF4uPxamP+AvYtsIrX3UXOIyhl7Fg6U9kTD9H0vZt4mSy?=
 =?us-ascii?Q?mZzSI9c4IZu1m7YPUgcwbjTJG6CNe9cm5gIIfcZ81GUh7jpz147lYCDWXVXb?=
 =?us-ascii?Q?GUa2hHNYtMbMAU9Ywl7H3lFMw8raKMLpHVye6+dtfNQoTjXhaFNdLDmGrqo+?=
 =?us-ascii?Q?J57+5NYAyDjFWfr34SSIPQMq9OTKS5XHUy5mddGxL8LF02qddqhjnLYMnam+?=
 =?us-ascii?Q?gk8wq7SeAoyQITJJCkedbFnHGGdyzhWPiOozK1XwrbAfOfcxYhI3De8KIrmM?=
 =?us-ascii?Q?wEDVebcTa+uENK9OwlDaBTZu4HXSVH/+2U6vH4yQrmTV/jwVVFO5N/45cthX?=
 =?us-ascii?Q?3WlmDUw1ob0zFIVZ1mLSh5ooxp7v4onTBLBy9Wa5b0FIECgsrmYaQKiqL9M4?=
 =?us-ascii?Q?638FpPmDeQGfcNsAMsfFvi/OONdTnBLKSNLvvtNLZ00JuFBcHkZO4SCAjLDn?=
 =?us-ascii?Q?9fOwb+X8mIE+VINxPoCOcwr4NQjbmVgSmYHNhwTIcvjYJdH5u1y63q+K6PMd?=
 =?us-ascii?Q?ApimbPnqunzqYA+WlAjp5tsqu9Cqnq80O9pVkRyD68FZVmfVHEbYeZLPWkwB?=
 =?us-ascii?Q?fcOJa59LQfqNPgC/B+ovrGJXTrQ3thbxIV83+legF0g1vgpk/VyU7q+9skyz?=
 =?us-ascii?Q?ip9ZD4iJcQll0l5HWRjJ3x16go1du8vwooOpbm8LV68wShg/A95N0Cil5TNz?=
 =?us-ascii?Q?NZJrObvfxTmavJzxUMKVKF/AeZ3qLpCYGvrRdv16ZiUNGsL8zMXiyvpOFpRo?=
 =?us-ascii?Q?zVxB6z5nVGnAeyszuzEtNfOeWmuFSXjJasnbVJKmvhq8hVUHqsyF4AXpWiRc?=
 =?us-ascii?Q?Qrmb/Wee5OeF2dAF0vy6+bd2efrZJQl8FnjnH4LRbB5AS7lo83iMGlpUj7Wt?=
 =?us-ascii?Q?ChUlvRmQ3NhnDMBCVmthV1BBlIUhOOKlrHoOcDglIht4AI3P8AzDFgZzuukd?=
 =?us-ascii?Q?3FmUPlKjbpBt5lIpnF3Dhd9JSrzX+KWW6yl/rreWipQO+kh/Bx1Af9YNPcrF?=
 =?us-ascii?Q?GDD8I4wJBB169erHafS9F/EMFUF4UsnYK71LvMJ9la33+pLinejQ8oL5l82Q?=
 =?us-ascii?Q?P26hXA87RXHKqD+wycFu8fqV7l+zn9m02Y1xrI+ub/xBTRsqKmMAu/toLssq?=
 =?us-ascii?Q?q3W5KdQs2Lqv+JAim1VwYpxzeEjCD+Opx8mjz9SQvPNQmyOF33mUX3W1B+yK?=
 =?us-ascii?Q?l9LKy0PKnm8APk8Y+GMlWtpLwi+A+CCto/uf4nL8ecNGDoQGXlJgxKwaeW3l?=
 =?us-ascii?Q?86BiSRF4vREdpyowALQI/klrHwkmMHJw2IAymO/VpRqkiJRKu33HIgHJgu6g?=
 =?us-ascii?Q?VQ5tKCaNtEsJQP87Z0Ue2airGSNDbIANZ5wK9gUEggUBwWZ5CRlbLF0jeGdw?=
 =?us-ascii?Q?3fhJOZefjhPGB0vZm62aA6Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a776c36-1574-4eed-1a71-08dc12619bb6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 04:56:01.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 twfZnCMnCOtCbMHWEct5GpcBeYJoBc4xxdnxrU+Gcggzn64LwJrDB05oOLG9WvGwj3tOQ7JDLsFoy9Armf5F8oir3Fs8HUOrQp+CvFi1nZGxRT2P9lP7sh2b6/YHYZKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5587
Message-ID-Hash: YYLEF4FPFDCVYAREXFZFNTYQRBCPA3P3
X-Message-ID-Hash: YYLEF4FPFDCVYAREXFZFNTYQRBCPA3P3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYLEF4FPFDCVYAREXFZFNTYQRBCPA3P3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sameer

> >>>           port {
> >>>                   cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };
> >>>                   cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };
> 
> You expect this endpoint to be exposed by driver right? Or are you 
> suggesting nothing needs to be done in the driver for this endpoint?

If you use Card2, and if it is normal Codec (= not HDMI sound)
basically you need is only DT settings, no driver patch is needed.

> > Sample is for 2:3 connection, but it should be OK for 1:2.
> 
> For 1:N connection, how many DAI links audio-graph-card2 driver creates?

DAI link max is based on ASoC.
I think you want to know is connection N max. It is basically no limit
on Card2

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
