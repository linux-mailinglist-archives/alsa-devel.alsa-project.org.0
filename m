Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6CB78CBB5
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 579E474C;
	Tue, 29 Aug 2023 20:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 579E474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693332367;
	bh=i+1L577HY5ocn4HTMe+UdSKSqeusPkGpuDa0+lHg8Tw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lXMD4SBe3KMmqNplB+yxekPsgYzDNEIOTcPsTptkoETPZlWPaHPfNXEqDS9GkLWJz
	 bIxxhttpA7MTo8L/hQhPntmSah9Amlv8EE9CFB6eCEAXYHpTlEdohKMi+tUUTRryou
	 8vArGOmNV6w78d0V5zlhgYcrGj3jhlMOKkTd11ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27683F80155; Tue, 29 Aug 2023 20:05:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2B9AF80155;
	Tue, 29 Aug 2023 20:05:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 630BCF80158; Tue, 29 Aug 2023 20:05:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03E6FF800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 20:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E6FF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=iunXL8Vg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meFaKKEwNFyXpT++HLe9ruyDqlvXTmMpl8QqnMo4bKZ0+FE/lj5C/MRkIfuVbG3C9Gs9K1EwK3XJ3qxvRSSNqyliOWeAP7tchcJJCCFrPCNyWd6iE4DOHGu4P+w7aX0PrpfEW8P9IETU6ytFhFIdDBc9NhyYu1mxBf3Triy6y+3Z1LT2hXtBex7BT6JYUusQ1aYzayhuMr5bJrctapT8ThVRjwaMZl49m0J5m8x5lxUmPmQbhyg1GCOKDZLda06E8SsDaOYSP9gsK0c8pPOgH7OXzoCPSW90Gjjf8Uuh0Bk/f2L11dZ0fCOGLoTcfoFtoeW2NxmDYxdm4+0xHtZNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRddwHMgpKkrj66no1Pgc49zeq/j9NWe2SIYAoCZOJA=;
 b=Mfwn0EDmsWwW8MEbLyP2V1qPKiN285Ht/9QWjOgATaUQdgRCQxcP3UcKODF8o9q5qjEN5j/bBJzHhu49s5SRRP/n+erxYyiS5m9Bt/9t/OCVl2h7kpyOWHJf9WGfYsO3oQlpRRHBmNlcPBdsf4a1DoDM7E90Ngz2lXCb/mG1AhZOotPgBx/iMSLt7hHjQ1SlYH1kKTda8yPcluCzFB9lOlbmfsdfjbXnkaHPXlZROYaAwyforw9bDNXfZ9lmC0Aseurh8CzcygWPAD1j692jy2KshWDbdgLJNiaDh002ywW/r4F1ycSq0LFDg41kZ1GFHXdezq3BD/LL7fNmN4wUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRddwHMgpKkrj66no1Pgc49zeq/j9NWe2SIYAoCZOJA=;
 b=iunXL8VgqLFFaPBGytGp2B0JnNzElam6agb+4T/9L1ZDs856DaqIwK9zxsmcxFtECcxAkCYTDdvUqFuLJFCKze7479LeMqygbdomqAXVqeYQlcD3cWyHyJVJWcuecn8LLJLcYLlovyfJTQjWN+BW3saCHSED4FmiRudIVjG+mG8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9656.jpnprd01.prod.outlook.com (2603:1096:604:1f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 18:05:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 18:05:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] ASoC: wm8580: Simplify probe()
Thread-Topic: [PATCH v2] ASoC: wm8580: Simplify probe()
Thread-Index: AQHZ2da7+a0BzKZ3uEKsWHcNzw6LsbABZFmAgAAuhFA=
Date: Tue, 29 Aug 2023 18:05:02 +0000
Message-ID: 
 <OS0PR01MB5922DAD6A4CC3AE8A5C25A1F86E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230828174019.119250-1-biju.das.jz@bp.renesas.com>
 <ZO4ML5Iykmt5xL2e@smile.fi.intel.com>
In-Reply-To: <ZO4ML5Iykmt5xL2e@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9656:EE_
x-ms-office365-filtering-correlation-id: 1137fc32-74d6-4b24-bc0d-08dba8ba77c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w1misPuSCzrL1msAfacGJWjat8am3PrWJOF9Ah7vc6+1uCue8YY5iDNDod+qCqk3ncLIGGp5rlVsAglgDXVKwViaHtgr6ccxDvZqyZkcantF52Ev++mjSiU5AvWVEEe8uYEf5l9+XQQwGaZfNIPXMEV+bTnM9BVodCUdSldYAR0IZpiPVLk8zA4/ZMTwribFa8rNAoK6ReyUYuXogMSLjnLoj53elD2MEWLvxgGrz2LYiDZEcmVOQ0bQ7UoOgovUUDIMpvCG/EEbVbZzJf/Y2cFIBiCSOWeHLc9t8coAtRfU7Nlcyvr1EGwFE9FeKe2EbbQgnRAl1nwRzc5fzMgwd3QU3UY5XS7KVSCp5jBllhlInxOu+XK366nCHIR+wvAcWeVi7GR9u+fywU9mVAU1C+nPSJ1YAMhzRNz7GJSRud4fMXwcHKivSlE02y/SsB5wLlKlWMLJ8OgKt/03oBABrg+04jqgn4BZlg5OeAmuGmlDenFesIsgPL8uKE4f9lLliJj1HSN9P+a6DLz5FPsGYI4/+CuCi4xsGn8enErTnU9AxAy8mSoj8agIr8mLfFA1u+ZtCN7RTJoIIy2HU4zw6xEhPpBSBz/C9tQSVnPkZ3ECb9YG+FK3RDhjU7Fi07GE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(1800799009)(186009)(451199024)(4744005)(7416002)(2906002)(55016003)(54906003)(33656002)(76116006)(66446008)(66476007)(66556008)(64756008)(66946007)(5660300002)(316002)(6916009)(41300700001)(4326008)(8936002)(8676002)(52536014)(71200400001)(7696005)(6506007)(9686003)(38100700002)(86362001)(38070700005)(122000001)(26005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NSgyP42rA+Bnp6gx60NpnxEFVXF6xBbFzQCbVyJh3TZOO3zNmIl2A775FA?=
 =?iso-8859-1?Q?FuYnUcllNCDza/MtoCP9ck/gy9VsWy57m5gC1zRFPvaqFYbYZce6EyBK4F?=
 =?iso-8859-1?Q?RaquGQtlstBnbk6+n3yvtIspHbaCylrwutElZ4P7Q0E/0SgeoSFpmoHUDz?=
 =?iso-8859-1?Q?G+bZ3cIm6Z8pS4NNWjUwTp/zYVKH0GMpLAwhdAtPpeVkTiApBniiCB6+ZI?=
 =?iso-8859-1?Q?URNQnxjALAsobpb4E+fvUYEupE0UeRbVX6JPR1vi3idHwX5SrSsKAz6wsj?=
 =?iso-8859-1?Q?I++LY2CIYYpeQmJc0wHaTOAyBq22aZE3VxOfKwJC1wzCGn1FcdU2/b38aG?=
 =?iso-8859-1?Q?T2G3hN+V1ALTIueFIFYK/vBc3Dd0sjMi5lIjUV9mYz0VgBa0I8I36+HlVK?=
 =?iso-8859-1?Q?OvZtOj0+/yi4IidIs56s3vvXTfNBOkYLaI7KC2EgOMm/1vpSUN84fFp8ia?=
 =?iso-8859-1?Q?HhTpYpQogXNUQzEzyMOe38vneV+aJUyNj+gY8YJ+iTT3PKuBkI51dU2oko?=
 =?iso-8859-1?Q?mwTqFkAST2yw30CQ2rf5Nm+Ztt3bkPAAjw5zBkA5F7MpVCAXnrGQunpksc?=
 =?iso-8859-1?Q?TErlVKznpTmQPrQ9c5vuTV1vuP4/S/AYEZZPf8wLd3JsC2JUN/JBM2L7NW?=
 =?iso-8859-1?Q?SCQs6WrEpWN3oohhVhl6vktCDGadZlng+0PxbASbpCuujLo3QRAJo1mTiP?=
 =?iso-8859-1?Q?xLd0wJ1IWvJKsqXAmXM0K+vIjYW++jD29A3P7Fdv3aLJqvhhxX+ozsqjV+?=
 =?iso-8859-1?Q?F+3zD364i9fh58Ma1yCJ3PqNu+4pSVJoleFs0/nf0upN3JvkIfklzbfYNw?=
 =?iso-8859-1?Q?dKjBhu3T7oxyLypTTvgp5L1uRd3ib/C5BvHWlbzUuQ5GJgPcycMXOm3WDv?=
 =?iso-8859-1?Q?upJFTxpHDdaB8vj3oRejYRiwsLGDr+P7AYfeyrYzrGnDarhOy8L/Tl1jmO?=
 =?iso-8859-1?Q?Au3SoqLCBZ8ZJ54kPTrkjKa2vaPNWQk4odjnIF2ACDR2rTQlJe4U3c0ze3?=
 =?iso-8859-1?Q?TFFqAk3JdggOCfbZHL3QWYmC+LrehALeweU4Y4KLh7YWoQigVaFCAW5ZNs?=
 =?iso-8859-1?Q?pzzE07KAx+Z1OWd35zLj0O7OfBY51ed4Q3HE5oPhXs+3xGQtnV4tCXuvnx?=
 =?iso-8859-1?Q?kOy/u4oMxb6fWLKJavLsr0w2t+v3qsXL5G87xy2fYm1DpcSFtUYy1LF9Ar?=
 =?iso-8859-1?Q?P5M5A3iFI2Lr0/0ek0Y6Uuzsy5ZGQZMCqDRQV4xrCK/jRXtUNKCrobsGY5?=
 =?iso-8859-1?Q?XV+TUNYOLnS7FVtrZ4YXpNQdC+F8X5cRbXVu1pIoR4d2BPlZlGK9NGvecF?=
 =?iso-8859-1?Q?qUZoOQJ8Fn/UwHlxf02UsCCcFQitNYbelzAMr5lEbW8H5aJ+p9ECfQ1fzr?=
 =?iso-8859-1?Q?0C7CfI/PBp38rnOnAgNT5Cwl9NGbT8rqhlxgqKRT5vZndQeDLrrz3gMA8m?=
 =?iso-8859-1?Q?q0a7SxCRB/oTpfjnlZ8o4Ji0gGnmGmotdVA+hv3E6NuHCDYpk0ztoJOXzX?=
 =?iso-8859-1?Q?0PUwlDlM8IeNH3t+zSs8DC2hlOvAn3ZlwBniuNO4ynUi0QHV6VkVPYW1NG?=
 =?iso-8859-1?Q?ZBChNLRDmxoZOMX+73mmkEdOfn8pNt615ZTq8NSyJlDgz5UTBOg9UIieq8?=
 =?iso-8859-1?Q?wUowHe96j0rm3Z+zGUmZyY4cGOP1oygMkPf77s2XfXq4gYyqYPsp/bDA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1137fc32-74d6-4b24-bc0d-08dba8ba77c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 18:05:02.9347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 JLKtNr0JZ49kzKpG365I3ElHf2sIaZzGMvZ4A+U9anvEdJYKU7jt2fe4o70PPdc5hHWOGlW7cP/QIANftMXxnDULX1xZzkDPIVWob4/Uc9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9656
Message-ID-Hash: UIWIYLHWJK7XPDCOTWX45XO7KP4WWIGX
X-Message-ID-Hash: UIWIYLHWJK7XPDCOTWX45XO7KP4WWIGX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5WH5OC46MPXDP3PKNZZNGTPQPTJUODU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

> Subject: Re: [PATCH v2] ASoC: wm8580: Simplify probe()
>=20
> On Mon, Aug 28, 2023 at 06:40:19PM +0100, Biju Das wrote:
> > Simplify probe() by replacing of_match_device->i2c_get_match_data()
> > and extend matching support for ID table.
> >
> > While at it, remove comma in the terminator entry and simplify probe()
> > by replacing dev_err->dev_err_probe().
>=20
> dev_err() --> dev_err_probe()
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> ...
>=20
> > -static const struct of_device_id wm8580_of_match[] =3D {
> > -	{ .compatible =3D "wlf,wm8580", .data =3D &wm8580_data },
> > -	{ .compatible =3D "wlf,wm8581", .data =3D &wm8581_data },
> > -	{ },
> > -};
> > -MODULE_DEVICE_TABLE(of, wm8580_of_match);
>=20
> This doesn't change anything functional, please do it in a separate chang=
e.

Agreed.

Cheers,
Biju
