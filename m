Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8396C7CA7C2
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 14:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6745E836;
	Mon, 16 Oct 2023 14:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6745E836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697458200;
	bh=Yk3vbDOeNbA1eoNY1eDfb83pTztwHv3dsS47Jl5n+X4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o7sc61q04Nrs/IwMZTqmXPCxkG6QkqFFFt1zWy8lUZ+vcK6fJYcZcvH796Hvj8XTu
	 8tRP1Eo72jrMpFxdH5GRJByIq/rG8Y02bDY74PX2Zx1UkjDrU9xaLnE0DBDz0gsfeL
	 HhA28Wg5JkDT83LG4TYPYR/JI3RVHND5ZgaIzVGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8883AF8027B; Mon, 16 Oct 2023 14:09:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09584F8024E;
	Mon, 16 Oct 2023 14:09:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7DE4F8025F; Mon, 16 Oct 2023 14:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B68DF800C9
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 14:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B68DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=j/xP9xUq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsyUQrFonYvuNgRcgZV85ItNP6IMtQUZ2zLW+A5npgWw5YQBXpuNEp94cdscrQYPipVc0soAZMXCtNkb0L8GJjjmWLJQ/CFhhYBuC3oms+hgNuGXJnQRDvTTApOhrDhLvnc2eOl/vjhrnl9TrGq3NAK4ceAoj4wYBiF8wyLJYcM2iD6T54JIYaRpiOZpSILIJs+RmUPjrITJancOYD/q151aZnfdCm+SsNjzd8d5ZIlDMOoY6Bj8kg+KL4NQmkjiO2yDd+TP6EVnX6fSEFBZv4ehy61Ya5711GDMthvqnAipapWfpXEjjmNsQxpHILz4HxOJ5Lts9E69RlJu1ALMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjaNb794B5WdEQV6oO0OJ1tASt26o2uz5whqXeaaP6g=;
 b=HAkPGf7FoYr5XAyFO2homGEaV0dSZsbW7e6bqyAww5fypyOIGfSIHP0DA92q98C7c5xqgINpLOpbstTH+kRhpdnOCQtqlZkTLmnvNXFZVjZBALfZkeum3+uQF3b9/NmbVslsrKFnylmrSGafQeBAx4kDGqhIyrfE9ppphzduW8GUpu169Dm/hOcnYfeyJBJj56+PfHeL92leTWrAMTadd5qjQTJfr5dnvjdU3pf0vRRMkXi6w+BzXwyVptXh0D6t6jfnAoVSGOCkd71CiqbNGb/GQWq8s9+Mkd3gO6x9G4R+LK0Qqw+MLwsz2oAGrjtKO0csj+b1Q4HKs3sSKUyWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjaNb794B5WdEQV6oO0OJ1tASt26o2uz5whqXeaaP6g=;
 b=j/xP9xUqu3PTqmi5mrdSPgV3FQgU5ebCmo8/Yj7ItG9nQzCm342uTIK9FMil1LwKtosJBT0vw7Qy9I9shB+7Y4b44/ozul5NuEpYW299MiVk/B3KnQMjF4XAy+Q0ZmqTonBVQ7cSGz6jv8JsCZXWwyL181oOrZx+98/fK8IZ1bs=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9523.eurprd04.prod.outlook.com (2603:10a6:10:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 12:08:57 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 12:08:56 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "nicoleotsuka@gmail.com"
	<nicoleotsuka@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: Re: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List
 DAPM endpoints ignoring system suspend
Thread-Topic: Re: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List
 DAPM endpoints ignoring system suspend
Thread-Index: AQHaACmJsu5Q9I39WkaHWuyFJN2nYQ==
Date: Mon, 16 Oct 2023 12:08:56 +0000
Message-ID: 
 <DB9PR04MB94987AD33756548323D8D101E3D7A@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20231011114759.1073757-1-chancel.liu@nxp.com>
 <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
 <20231012204739.GA1706264-robh@kernel.org>
In-Reply-To: <20231012204739.GA1706264-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|DU2PR04MB9523:EE_
x-ms-office365-filtering-correlation-id: 9262a0b7-ed0e-4318-e93d-08dbce40ac72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rLZ2UzHzMTDGo7ILn/bQgE1kkF39hIAeL2LAgfxnycI2x+c5L2nAWHP6RXb7X4mczPwwh0Pzl/QyU8lHFWLX9aVDkH/IWvA09/dTAvKJQQbo3vcoLm1YmsU0TwZCwLgJzq0hS6ROnCK37Uxg5HfIZkQM2vG4gKraHucDQO5AbfIqriYHid3cONSyd9E1IGM4oLkTQ8RH7fwBYbidVheHjlmm+wcJUqDafaa7WoE0XKLrTQtDB2E5FwruNmJA2z7sFfwzXMWOzsiZTapwsbFwjFb0HSexMV0M9Rz2Pdo1BxrtX2DwXuyyjzLaDi3OZGjYqFABOCGUaEoTAZnGAs1z0VBfCWIaoqg0edBzTjoVGVqXye3cqwA7WX5oW0bCb3s/iZE2RP7isIzRdDhu8LWuzO5qbNV/lPGd/2jMLo3ZvxsxTTlTAFgng8o/1T7uHOvJKC6uCCSOdmKhN38HRkcKBgtZRJuP2A9dtuCKNUxGPq79g7/805KH9z29EUdgk3TdMq5f1DjNd05jF/pupbgainE3QCEzwqmkukEeT3ZbnZH3+JdFATnPtEtr/Jhxh6+Th2TyknfeJ5quuATPoAa1e27/II51Tvm1lN0fTuTilwlOUmDUV0ioy/xysRT7o2wQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(7416002)(478600001)(9686003)(26005)(6506007)(7696005)(4326008)(8936002)(8676002)(83380400001)(5660300002)(41300700001)(66556008)(52536014)(44832011)(66476007)(15650500001)(316002)(76116006)(66946007)(64756008)(54906003)(66446008)(2906002)(38100700002)(38070700005)(110136005)(71200400001)(122000001)(33656002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?I3k/3HVDkdAoN/0nplMYPFQSsK/frP+KD8EJx1Bdyj25RW4psatvL2vdcKDh?=
 =?us-ascii?Q?g/+YUOG/7xGUb9MGwY3fjA3YunbpO4A5rESLH6Ly9ywpTcoso8mh8+huZEuN?=
 =?us-ascii?Q?1w4liHK2yoPhKckewLaoAAsB19mF/nA8GifQ/H5DDQ2FKJh/PrtfSQdcsrBo?=
 =?us-ascii?Q?aVrUBcKOSuFZD/KaaVKeqXd2T6gYmZi10UOvhpl988HWgICjEeV1QbgKyQ+n?=
 =?us-ascii?Q?5rihHf8dH6eTNumLj0YJcXQss6CoT+71n5JQtfm2k2/WPTlDeOW21k/aBK/D?=
 =?us-ascii?Q?n4vt6m3sfhEf9B+Ng9raxkfRHeXtrUyo3H/1gcau774t472JNlZpEQ3RRkgP?=
 =?us-ascii?Q?miogBmdImBVCbNEApLayaGXz3xNA0QMMtEs5qDox4Jkj6FAWfHk19PDSobX7?=
 =?us-ascii?Q?vX3jaMSvFxYJZges2oKmVqR7bQcVN/wNxm96bR9OrEsIfupM/AmRsgHaDFWX?=
 =?us-ascii?Q?A9xkFLzE+6ut0OLs/HGio/seKlBDk/fkajH3IGZ+n2/FIg8vUjBSmgFeHbrX?=
 =?us-ascii?Q?IW1y4MgwhyfLhhj7bRR0QXywNuj/rrQx7G92UlHBqsaCIDLZrWS6ydTvGlP/?=
 =?us-ascii?Q?wPWvexIE8xdcBG5lYJwozO2AQn22YpH8yqILOokXqeUzeVqFHvDyo7tjOoQo?=
 =?us-ascii?Q?LNcPDd5wguWIKAFZ33FggJZUv75eZXnidFr3hTG0hWwzvyhBysKIueGxhqq/?=
 =?us-ascii?Q?lwNxoUF6tXsyqNQ/OVoT9u2eNd9ECLGACPDvlKA4AIaqrkaC2TOP1u9jyjnj?=
 =?us-ascii?Q?UKF3mrhBqwwcmGFKm2OLbDhAa+UmmoHgyWdarYyyE1iZUMNQLAcMnNlRIlks?=
 =?us-ascii?Q?t8ZjNNJPUPRyfiBkHRNNif4DxtRF2Tp/TayerJthSiX51GOCGPn7L+aWvkgw?=
 =?us-ascii?Q?Znbmp/BpVJj5HYOBdiLd8HSqIgdryv8l379YJyBYlTRXg87tQSdR+Y/ltgZZ?=
 =?us-ascii?Q?Wq2x8SjxdmlvAMOQp/qVuGCcH6KIuN0tTamFKpRFrqpyWxWrrGPXFID3fYdm?=
 =?us-ascii?Q?F63Iqnk9WW5J9v7tOGTxbyCESIxO3sluo3rOgZ9K55IxlgsO4N3pJV1szDrK?=
 =?us-ascii?Q?Jh9HVY7g+1uGYTq8KbAKzhCgIsc8Cd+tcCNNwifcNhBGhmRafnQpCmNA/vfv?=
 =?us-ascii?Q?GfNe45I3L6Hcz8lv5y55e2cCAakmsI446d0LfjorBOsExD30lcye8pl4T1bO?=
 =?us-ascii?Q?juulH+kq/mz83IXqoopGk1Oeh3vsSHN4hf+LYQaxSIuU8e+C1x0Af7hzoZYg?=
 =?us-ascii?Q?QEcwD0NkezjqJYEI5+MrvPL2XMPKugTWjbubdpSxlfohWRypFQ34TkqL5cSb?=
 =?us-ascii?Q?NjsiH01rUZTa32sYpeQfi9cEzEHs5cnDac7NvM8xZba6ckbhrK5NplHI+mv/?=
 =?us-ascii?Q?s5UnDbOQmVxLv5fgy829swwMeQ4s7hbWJ/iyRxiNv20gONrICI9iWff9zftJ?=
 =?us-ascii?Q?7/UdhRDCPDKu1cz+/qWSh8g6FTtcRWzVA7VU9k+bfbNnKEHERDtlNCh7ZqGs?=
 =?us-ascii?Q?4Ei4b3dlR/LkrWGAEM6qfkOMUHP14rXbNtwHsmA0fOjt3g30vqpjBB1kJeED?=
 =?us-ascii?Q?aJYNg3ggvshLOfo/Bdw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9262a0b7-ed0e-4318-e93d-08dbce40ac72
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 12:08:56.8982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 qFSSUTw1DKn+fj1G4B4JB5meILLkUTBTlB1IYhhm6pVhL2iO7ms2dcukgM11itE2Chl4DX+24mAOGs42oN2uOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9523
Message-ID-Hash: SS6UG3ZJSUH3PU45WY3JV5EPCTCTZW3O
X-Message-ID-Hash: SS6UG3ZJSUH3PU45WY3JV5EPCTCTZW3O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVZAHWYJCZ2IEVQXSWHZM7B73UKYA3DG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> >  I think the key thing
> > here is that these are endpoints that can be active over suspend of
> > the main application processor that the current operating system is
> > running (system DT stuff is an interesting corner case here...), and
> > the example is probably a bit specific.  Other bindings use "audio soun=
d
> widgets"
> > rather than "DAPM widgets".
> >
> > We also shouldn't see that these endpoints "should not be disabled"
> > since that implies that they should be left on even if they aren't
> > active which isn't quite the case, instead it's that we can continue
> > playing an audio stream through them in suspend.
>=20
> This seems like one of those things that everyone has/does, and everyone
> handles it a bit differently. I applaud trying to do something common, bu=
t it
> isn't really common until we have multiple users.
>=20
> Rob

Thanks Mark and Rob for your advice. In fact, it's common use case. We can =
see
many drivers set widgets ignoring suspend. I will remove the linux specific=
s
and focus on the key concept. How about the modification on the property na=
me
and description as following:
  ignore-suspend-widgets:
    description: |
      A list of audio sound widgets which are marked ignoring system suspen=
d.
	  Paths between these endpoints are still active over suspend of the main
	  application processor that the current operating system is running.

Regards,=20
Chancel Liu
