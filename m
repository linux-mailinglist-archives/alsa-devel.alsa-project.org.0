Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333B6DF9F8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 17:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038781078;
	Wed, 12 Apr 2023 17:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038781078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681313294;
	bh=iZ2d15krzEjnz7JKcGnyW6S3Exfd1r3GiFuviFB4wlo=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pCcYh/O+UKOtF596MEm17w7WDrYKkR1wiadvadf8zxqg1Rb0YYXFMGLnxua+DF4NI
	 Ab7Vm54pctdxuSeRM4EC3cVfWR3O6wCCTejR30awj1epRZ++pu/Zt/zdKVMPZuHxdK
	 NJRlqwp/jusFylgXbOc7lGF9qUSLbBh74EXRLU6Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59621F8025E;
	Wed, 12 Apr 2023 17:27:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD811F8032B; Wed, 12 Apr 2023 17:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B563F80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 17:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B563F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=GSOUw2mN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bea4aKc0DCAw+VYPlF9s5nbn8GKNef7MsyNWFI6qdWG5pdDRQMZImSi4JduOLL+pc+15S3sWw0AYI8v30icgoys62YNNW9kDPBNRGmnVPtsijPXmtvHDxl9+Vs/CtPuL00MXKBwghRdOxcOOKolwIjwhXPx8J8ieNCFZJRTNwPxgY3MxWEs430+mm1Ffu6Auf7A4IdInQZIibzmHpIkZsHiuHRdb71/O0G79qEB3EZFBLM6411+gRO2usjcMYffU85dhTJycOoqIKBw/gw/sBVFBxXD+veJJHnzC1O9Rqv0njJqNZuz+5dda3+z6PUZjUZ8hMDi6gQbWFLwuV3JnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODBXCFBHdCpVuzjLxBnkaI+5ousq61EvLS0UHrNeUQg=;
 b=cbG3sDRd1tNGDsUL7awD5Gp7kUI0wE3C50wZ9r/Acenh1XaQyl3IRiuzQAEbuRXPlb5cXIVKyhoWeYIEjlIlvw/U+fRn4CkzDeNvqWB6Ro0EzGPHdxY7ShXS8nIUKGEVNMQMBSDPKUFlM7C6xKaxjwViZkUuQqO/ZvCjVJg3vlPGmlS/z49euZCoDCjXEphl41LPpOt1fi/WCRZrOlCzsivtiyMVEHY5Hrqze7idkP+gQCV+yfj+Q9PqMSyMNswMKlTglUqLBLwO8/1ep2wfpuq5odjX4efcd93RYpcgpNFw3jDaaZNqqA3L5q8Yj2eRxiRIQoku54vEVJU+6Aw8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODBXCFBHdCpVuzjLxBnkaI+5ousq61EvLS0UHrNeUQg=;
 b=GSOUw2mNmUufqTI5lThRb43W32gDyI/UoXlpSrm3o6rB2i9F1FFP0pHr4ix3DwqolfHqwJFsHSOlY56wpMbMf6Uzb85HnBOvKoLSFAyWgjRRzjZP4dpVRy5Btq/jfjpNFoNYND5UC5nnyRy42vjWzgy5S0aIGGNOhFEtdZhBTBE=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TY3PR01MB11760.jpnprd01.prod.outlook.com (2603:1096:400:406::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 15:27:04 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::75a2:f32e:d86:4246]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::75a2:f32e:d86:4246%4]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 15:27:01 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Mark Brown <broonie@kernel.org>, Baili Deng <bailideng@google.com>
Subject: RE: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
Thread-Topic: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
Thread-Index: AQHZa46eguM7qKJ7JUCs912NHUE94a8l+4eAgAAxBQCAAMp5gIAAoS+AgAA1vBA=
Date: Wed, 12 Apr 2023 15:27:01 +0000
Message-ID: 
 <OS3PR01MB6641B6FBA5C227B55350DA73CD9B9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
 <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
 <CABXOdTfGD_fyi+itsr9Nd834Pb6+4Ej8M9SM5AN=uhXQ1K4DiA@mail.gmail.com>
 <CADP_shKfY6-F_4+_eYv=NC9XcgVA+0H3BkCqH8D9wkqJ5SpMDQ@mail.gmail.com>
 <227d1f11-dea0-400a-96c9-dee568730a13@sirena.org.uk>
In-Reply-To: <227d1f11-dea0-400a-96c9-dee568730a13@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|TY3PR01MB11760:EE_
x-ms-office365-filtering-correlation-id: 787677df-d6fd-450a-44f8-08db3b6a5d35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 p399uGPfgWM4If5scGkmhc4N7pA9q7d6A+msnsJSPkfvKG0OHoD3VhdlJ+VdBoT3sPCVU/M2MEObyVwijA4jGtbeM/SOzFBNyeuW0r+F8gItiZkQ1vQf4uxoPQZVJdyKXdsCB2FbMWzJ0GFt8OeEcKDmqXxLwMoiJcVboH5l5xL52uz3ragmqIuJTzhy+3Oqfha2GVkv+BxgdkNizAQqeMzmTRDlrOg7EOjoibq+F11INhHjM13RNiEKdoerw6Tqi4RaweZiLmgxdkdnLUfgEh8D9rxiOTSOxIyt8FaIVF+ZjwrH28pMRRM7GApiSpMt4Aub0rbBc97v52E8k5OhKtngjIB8kdr2kvOPpFKBjGZttukNMQtckRp8lnVSrUxTvkXddS/7TSru0acu5XDOhqiZn9izQALbLuLeYESN65akldHlF4IkNi5sVhUbNg13C3RlUWbUjN/VP2WcSC8OYDqxJ9z77ZQfIyDC/o06U3SCKGhM7aYkSQ/mnrcKyLXPrqyXllfkuWZ3e2NJl85+fpghOfe4zsiuYKro7aNkxj4l/l5lX8xxzc9y1zGY02rfBwLCW3oavfknAeZvnUKa4JXG+qc2CEu4GtKwtDd6Vf4FsXT5dXpoiZrgpCEIMNUA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(33656002)(52536014)(38100700002)(2906002)(4744005)(316002)(38070700005)(8676002)(8936002)(86362001)(55016003)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(122000001)(4326008)(41300700001)(83380400001)(76116006)(54906003)(26005)(110136005)(55236004)(9686003)(6506007)(478600001)(7696005)(186003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8ZSDtqvGo12Gd1Q9Dxkro7mkpxZx26D93ajUw0G5VXssOss1IES9fdf13jhz?=
 =?us-ascii?Q?tt8b+hJmW2cc+uyWqHyaHzJPd0IX7vPjRFaF/ERIStHGzuIamXEQiPv7AdVN?=
 =?us-ascii?Q?2DXoRh/o6CPTdJgNARVAuNd7snLNHJM5m/XvWgveDwTQKXulclTCmP1YsDkw?=
 =?us-ascii?Q?vhjGr0Ne/vb+t92tB3HnyahrXFT2uqSmCAqxg2tviRc6Df22sXucQl1bmN3P?=
 =?us-ascii?Q?kOqDsc2TFBRJYqP3guFtPZ3q9MWN8DwS5GYovXn6PLp6rDkSfeddbQ1YoHiD?=
 =?us-ascii?Q?1TRXApG79rk7MxReJC/KScyk6PQXHNYQjdnaP26ITOBIthDwdu3iW9r1hsmS?=
 =?us-ascii?Q?VfNQZqBF/9apfPuKboyIzoYK05PxsBGavOOET3ZcrOAVKWRYYUgYsddvTxkP?=
 =?us-ascii?Q?rFAzDUKBy4tpQ1lnIDd1QCQal/6j4m90xrzbRIbACdJwMp5E8oarCcqoz+dC?=
 =?us-ascii?Q?yOxAM7NblYDKMFyGKb4/2F9/uMh15CHbr6dY8ZRlGNu5+A6m3XToclGbn/jL?=
 =?us-ascii?Q?SEvygYTwz7VMWDNELFX4PH6kEKUvlVOhzLTPfxCl8+T453+hCtdj4ibr5adM?=
 =?us-ascii?Q?YDebt1p5OhemPvBFiNeaoFtF44lZX6yC1IoNAjR5rUkls4d3AsKXGLSWl7hF?=
 =?us-ascii?Q?XNxzl3utbsRN8wqwSSOZIarGQFZ5v6b3RLaM5jLYsWkOFxyEdBNHcMlDUy56?=
 =?us-ascii?Q?sVCNMeqMVutz/7SwokdYtdtStzKobEw5uNNRK8tVMwGTazHixRemQwmU6s1z?=
 =?us-ascii?Q?pIRhQMFZPSuicnCkVd9fN5drQIl7n6tqTSJxhA4tCKKzXMfwTCkdaAci2Xwf?=
 =?us-ascii?Q?xLfujKyRsP7/4YMRcUwt5js/NHUGlEJl1kUfxU4dTmHOCBX8uVcbjc8Fo9Zw?=
 =?us-ascii?Q?wt3QPh2A601gCYmtzvQ0bmoBj8FkrVGR6XkzcT3nbG83M6PdFCPeSLMie+uD?=
 =?us-ascii?Q?m6BJprk7HHYEXkh26wbVdfyifKa2aF82WxAr5EwGkSOiAvPDS/dFjn9o9t/A?=
 =?us-ascii?Q?SPwfLy5ygpxp1pH0jt9KrF6eUwkBEY9DOJe+R5hSt9KJrx+YVAMIZ65XSYen?=
 =?us-ascii?Q?b/yDS13SYuQNI/PrhYyzPJ/97hsW9GnYaJr0rUohDzLfQxf6i4kROlK/h4Kn?=
 =?us-ascii?Q?fDntu2kVWU15RT2BnMgUDEBsXHqrbiRC+tUTOrLwLKfoXnd3ErTSwFBbUeM1?=
 =?us-ascii?Q?FA3tF9ID878FPdkgIfLKLr5v+qZjVF6xVRj+BFdvhhlKeuXdRbb+OlOC9QbA?=
 =?us-ascii?Q?QiRPji+fwjo5Wo/Nwr3gfF6W0VqxnymGbdf9GfvO8qUt4hej8V1wvUZWPo0l?=
 =?us-ascii?Q?I7M63M/jqTixsA2zmO1mka1+HtWodd2ooh4d3O4RRHdhlpocUjxFF59TGq13?=
 =?us-ascii?Q?thfL0ayVwXIKYZizKQwtrwhV2B14DhI6ALPhNJ+SwEOsUnlRzPJbWrl1piSO?=
 =?us-ascii?Q?2qVhj2nQAUKL0DXB5AjKWtVO4UL5BEAkPmgYPY83fXhwgH1lEQSjbCH63a7x?=
 =?us-ascii?Q?RiAY96HTzTQj19zEgUr3Oa4BcvFqUJ9u+ecVP8cjK05xQXbaOVPlSCde7oYx?=
 =?us-ascii?Q?j8Ofj/pp2udYhNS6i0zNtHKFKhIrk12wL2JWePeCR+JV69NvqDgvDY0VQyHu?=
 =?us-ascii?Q?mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 787677df-d6fd-450a-44f8-08db3b6a5d35
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 15:27:01.8868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 UuSqlpkOqi7xhpnQmm43o8eAr51YS15x76rTwz3G5pvh65Ucax5cHWtT1+4hHTFrClKeGPW3lj17ijQDOWcHTUk6Qb9j6xJBrDZ+alBpPeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11760
Message-ID-Hash: 2NC6OEU34VJSNXNVUMNZOSTFSZ62NVYT
X-Message-ID-Hash: 2NC6OEU34VJSNXNVUMNZOSTFSZ62NVYT
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Guenter Roeck <groeck@google.com>,
 "David.Rau.opensource" <David.Rau.opensource@dm.renesas.com>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JRF457RMOCF2OJXLVILEJSMVLQ3KDE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>On Wed, Apr 12, 2023 at 10:32:47AM +0800, Baili Deng wrote:
>> The change in the patch done to address the issue Geunter mentioned is=20
>> that
>> da7219_aad_handle_gnd_switch_time() is now called before interrupts=20
>> are enabled. To address the msleep() issue, the delay is now added as=20
>> a delayed work of its own workqueue.

>The point with the question was that this sort of stuff should be in the c=
ommit messages.  I can't really tell what the change is supposed to do as t=
hings stand.
Sorry for missing such needed information in the previous commit message.
May I send another commit that includes the complete information again?
Thanks.
