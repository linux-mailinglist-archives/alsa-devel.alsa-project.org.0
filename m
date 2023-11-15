Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC687E504E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 07:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C047D210;
	Wed,  8 Nov 2023 07:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C047D210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699424747;
	bh=EwMKfCDZCAnJJx5NRznZew8zBpUHIxvum9p5E+A8BUU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dL1yKqNVrQtDZW+Op179XawwGQBd4myZPe1b0N/w/OpLxoqYIlNhlzt7fV0/zdrvJ
	 rBkvQdNtkwReMa/sKiZuijzR5CY+SoQTrn+ZQY1K9f1vn6LT5s72/tkN0RWlR3Nq+g
	 pFeMnSvHB5nIvGwHPwndfZlzmRsCA/h/sLukb9Gw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C2B1F8055A; Wed,  8 Nov 2023 07:24:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5A3F80169;
	Wed,  8 Nov 2023 07:24:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA2FCF8016D; Wed,  8 Nov 2023 07:24:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34495F80152
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 07:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34495F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Sc4Bvbch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFokB6vaIU9wpXq3rPXX9DZj0cOlFq13YNfUCuUCHdzir1SwPrfL7L7YE8waB6av0tJez5pfqFbZwniP/TpG8i+yGuY5I583g+l0TKnuEAvhMO0DpLCkdEIsxUdhOKN2LHd5ljL+vc06LfZAyLnZy5E7h/kkaOp9LcUuTFAwvdQsr4ERikctgifykxJzX5B7pOocyBIvMx0yn8284J73XP69W9Wx2NcjbhFtP86IZI0qO2rQAK8sat2uBm3Qq2US/pl2YWk52roiYvREgoB/4T8u1eWjfmU/oVQriGDqKcs93nUsyd9dGSKimjQAkEwan1LiRePdmKfg3sJGwu3lTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwMKfCDZCAnJJx5NRznZew8zBpUHIxvum9p5E+A8BUU=;
 b=R7Raf6rqZqtmSmRllxCoopBlqbZDSDf/puEe9IFWh1gxWnIlNWM1EJGaIKbtG5SZ0D5EkKeGkPE1IDcjwtt7JkOjOW9cdSSQ9zOxk7tztsbZycHCsilA9Q+x3RAc+vABLXK+8lDepMRkwku++wmWRwg/KF3sPK7djtrltOclFMmfSbrTooRstjTWHQ07ZA0kfs+Q2aEMD7sePkGIl78d//T/pqw3WHlXAPR2515i0pp15IOnQpxXrtXWtTbHBeO39Ya4vhiCFKC+/ltGWgsw6cj48aH3hPdICn7GlZFhLt2eKF69tCkc6DnZlrGaUBH23c9+7pQ9IP6smmzEW/kdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwMKfCDZCAnJJx5NRznZew8zBpUHIxvum9p5E+A8BUU=;
 b=Sc4BvbchzWBFi0m2H/gXUeZSYXv4ufavWXabKQVD0iVjK8m4f7+lzS11UainDIC011UGqZ3OMu3EHV38UN/ncbbBG5+umNBIFvaUCELJ2P1h3UcFlE5qgR+s8prtTwqBjkrpPHfM0UsRU6kbo17RriFK58yz8lQpBXhZ7gOTn2Y=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.13; Wed, 8 Nov
 2023 06:24:35 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768%6]) with mapi id 15.20.6977.013; Wed, 8 Nov 2023
 06:24:35 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: kernel test robot <lkp@intel.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: Re: [PATCH v2 1/3] arm64: dts: imx93: Add audio device nodes
Thread-Topic: Re: [PATCH v2 1/3] arm64: dts: imx93: Add audio device nodes
Thread-Index: AQHaEgw+yQ8/45VgA0yJ6AjMoryevQ==
Date: Wed, 8 Nov 2023 06:24:35 +0000
Message-ID: 
 <DB9PR04MB94982ADA36691F017F48D88DE3A8A@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20231010133838.799714-2-chancel.liu@nxp.com>
 <202310210636.dtEPMrF8-lkp@intel.com>
In-Reply-To: <202310210636.dtEPMrF8-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|PAXPR04MB9445:EE_
x-ms-office365-filtering-correlation-id: 09f895d2-f340-4f36-dfd3-08dbe023609e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 otgu94pvpS9CBPdyFSJWthbow/+t0D+AOtDmqtYRZGpLCY66PWvGJO91/4oQrJRmTT4IBO5zNBXM4ou62XvEqQau6LFRwcv1RqAzQMzTueKozhTGmXij1n4uIAaUCcSL6gzjVFO/kBs0hZa+unf+dZcAHQmVmb16Ve65o0qYKRWJOZIsSjVygQaFKQB4G3BX1Q0uGFwz+MVdNMbvPqqWhp9rPSjJZngxXpduaTEedu68QLkKvdaMonvbqvepk4aWMfqr0I+8sHcBiQ2xpB9OT2Qr9LuG0h+BR9iHZcCdNJUNPDGu3UD0g5q5gHBDGqx+SUJjN993LUeXektMR6fuSKPc/fRzhb/MsoIQWgMlctioTLf3f/qyY/dQJeOoMP7C3IQSDdU6SB4DD7XNVEzdSoaPA8M2ovLhwHQZfxyJSypUdmV21F7yGCscKDJA3m4aQaYJgR2tz3GGQuY6HhMiwmj9l7JVlVvyjlrsSwn2+zsHvZ6FGlKQRdGFgFWjWqdPCWBK81H+xDhiHqCZg/RB65/1Zz8aTZrFgNvrGccL8kkIRUQNpCmKxwzj46QoxaRdwbyLbNJkj4vhRQhX/wncyO7g/w1q6TkF/l1hMa5VS8rTtkA6KuA+9vIu+JfM74gDwjlUZjbmN2oHB8Wrck8rSpksfl5G91RSqxEDV9Z2tBY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(136003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(64756008)(66946007)(44832011)(41300700001)(110136005)(66446008)(76116006)(66556008)(66476007)(8676002)(8936002)(4326008)(52536014)(478600001)(6506007)(7696005)(7416002)(5660300002)(316002)(9686003)(4744005)(2906002)(71200400001)(26005)(83380400001)(921008)(55016003)(38070700009)(122000001)(33656002)(38100700002)(2013699003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iDdSObbrohAH/W5Gy8D2kXd4q6oW+lZVTw3Fhk98grs7RYbRz8gm6ja7F4YG?=
 =?us-ascii?Q?zDca9hOIwIFqI3T/hmS2VgkCqRZPzM2mrHy9cFgc4IjLlNpWR46/Vqkw/6k2?=
 =?us-ascii?Q?03xE+pBBzWFr5vzahGw5JDdr9YcDrh5PC8WWN5Z2MqbJjj+ya2w4ZgyITdvd?=
 =?us-ascii?Q?kAGkRzehLTQ49y/DuR5WBV/hI3QrTo5yX6rUv1MS9nhcQylQ0h1+veMNqXWn?=
 =?us-ascii?Q?ZEGSgC9S4hOEvjHOXQWgNXU7r7KLL2GTmW5Xwi0ehMLQYXSBRDVytKIO73Ld?=
 =?us-ascii?Q?Du1Iecx6on7A9a4xxViHuKbRKslbXIw8pLew9cDxTvusPly8ByULCg6A6DEh?=
 =?us-ascii?Q?NxUxtKLQKNvOubkQE/L8QOVv47I6sWa09Bxi82OVZ3DdysURc6i7Y85c5e6H?=
 =?us-ascii?Q?BaoPPdjD0J8RQrNPQU+qDuIjGGQCJTeYzqRUVsb4ldeFEJFXnPJZtwOPOswv?=
 =?us-ascii?Q?as4Hr1sCok9WoSwgFgqhJuVK4e2JPND6yhc+m9DSx63rnqszoTYUs4HucsWJ?=
 =?us-ascii?Q?PcqsRdZ4QIfG93bh8DFxRsRJiSHb63y+R55Y+bD4t933X/iL7YIsKBIOhySp?=
 =?us-ascii?Q?4MrgdAU1n2F6lUh3PZL8wobXDg7wbUdLUy6egjRI1H6I0Jn9cBJwa7fODQrr?=
 =?us-ascii?Q?RaxS4dzN4l39QR5fnhYDkn8gyaPtWWLBA2jTXxdJXRceCDilTUSa3GPTeqXl?=
 =?us-ascii?Q?4I0SuwapS+3H3AqOOKqbHd7IvdtnW0CrGHKfVXmsS+HZEYrHqBwMvBdksMOB?=
 =?us-ascii?Q?trohRF8Qt7PSYQ1u4+OWQOXC6MjBdA4YlqOjOdnZv/riIFbTwER2IkiDZGUR?=
 =?us-ascii?Q?lgc1pVpeKsCXZ8DHzfzcdn2N0wxzWfGLPNslcKgNXqzZhrJopyLGR/IfbZB6?=
 =?us-ascii?Q?LEbyhLrep+wD7FR0YLMqMNobTECcVQaDIkow51mGphyr5NAfJGj1oytYGQor?=
 =?us-ascii?Q?rBWlJc7ENE7Io3zjAYqRGxfRxIpOyYl3Vr7fXSKSL3koQaNaylRstUCrzbnD?=
 =?us-ascii?Q?+2LaV6A1XU0hqTNyTKkp81wQPy7Ci8BvkUHKZKR5Vv3LH539wtQeeTEVe7Ed?=
 =?us-ascii?Q?llN9KHPpetXDJXQMdHtFHS0d2LZIYptlSf7EjEYkZdPxONRln+gOBqGr8/iS?=
 =?us-ascii?Q?DDybLzKKTv6OJaahuG80z6dyzh7OBGfZ/c+WSZQprambcAap0Uios1rwhYrI?=
 =?us-ascii?Q?HfWjQE6S+RVmgRdCns/GKd74WpfxQPPbnD05959Gy5U0PgKwxz6ByTzYckjo?=
 =?us-ascii?Q?Vg55xmnUwO7hgU7MmnG6wOgEWpeIDcrdgvG24LNOWtnRMQOyA3onzX5+WIoK?=
 =?us-ascii?Q?RSzeLWKr/eDmJOmH9a7C405nB26QBi07t58/PH46O/63pD5SAjb9Yv2CN+RW?=
 =?us-ascii?Q?i+wriI4uxWOQHxkhhUYZhRgu5QgabIPw4cYo9uRRNj07qolrunZgc5nZOmKq?=
 =?us-ascii?Q?me2EL9eYgKXxMZJpAk239hEN3jKbySnbAFZbv7StP6Q9hprEo5lK2DmxRqm8?=
 =?us-ascii?Q?fQ71ky3EwVNfzPS/2GVCP2ZvKDZTgPKs0BSAxZnUairJI0xxRd87DlVhCrOT?=
 =?us-ascii?Q?2jvQS1qU3WBMr8VSHjAqrPf7K7os8gfWwoKcgzo3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09f895d2-f340-4f36-dfd3-08dbe023609e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 06:24:35.2315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 A1/RNLnsFKzOUm5HJlxq8uLNk/X+VPcjYMj5ycTSKTZ3qrlnJMA6vdds/BfhRSYPSpn73//YD0tBZ+vUUPsK4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445
Message-ID-Hash: RRIOIO4OINYNS35Q4E2JV4FXDXCNU4Y7
X-Message-ID-Hash: RRIOIO4OINYNS35Q4E2JV4FXDXCNU4Y7
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJPWBDCADFDSIDDLPGM4XKTQNV76MYCK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Hi Chancel,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on broonie-sound/for-next linus/master v6.6-rc6
> next-20231020]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

This patch set should be applied to shawnguo/ for-next.

Regards,=20
Chancel Liu
