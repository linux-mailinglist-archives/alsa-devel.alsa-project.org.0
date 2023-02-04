Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D389B68A787
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 02:21:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 447297F1;
	Sat,  4 Feb 2023 02:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 447297F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675473688;
	bh=p6d4g8ArL/OotbHl/MeCX4nNPOhE1J3P55aReEbJC1o=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WOv5NB6pRwBjBZazGUllfW9CuvahhpnoEIwoPep1jSiXufvWddudsP1yAyKEDxguC
	 mwRi9A5kfCONo4rTejVut+gywBv9F1FmQf8ek6H99VwbmxQEBYwKy5VLL9zCTCYc6n
	 wE7WqaRGlRKP9TNTqszwqm3jtjGsjs0MmBJkgW9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0D69F8001D;
	Sat,  4 Feb 2023 02:20:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47FCCF80254; Sat,  4 Feb 2023 02:20:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4E0AF800E3
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 02:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E0AF800E3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTXakU5ThgxveyubKS2JsGoJ6tu2O7dR6s8WOBh0og3fGQfd85iYfdCUV0SPbRoK7UQuUl9Qb29wzhbVhJELlYaPPNvfDb01IdDeiGxnb/4FSABsTnszmIX+JDx68dW+ma2490VicuSWwDlOkhYjFXUSr4KZ89pXusNxSadhAXdk1rdS3U6qjm16Bd9YZ3IUmM+Hg94szTTqoXYdPTui3keuYn/XFTfai5uwUqHKSyGOh167TCpEiIMYr53+XeZPWzA9EWE0LkEhZAPutct6HT+Bawvx01kGuvIFdn5493odvE1YfG+Q5+d+R9+qsbLhuolkhk64GPzdoMKKGYJ1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ho26T2HxQzS+dYIWMXyrzOwtiU/SRX58XXQtYJ25SU=;
 b=lM7x71AOshLJlBh7TbUm5ro/tI06owTkrk1SfQbc7xyH8PIehLNDjlxwtnezI0fN1EeJv+NPrhdBkY4Z9NIuQ707DhB/Bag06vueJIUoVP3c9jwTHfMvnAIzQs98mWkavLXpQWH5GUA1PLrBq4jsLipXkvgUxuyGMCk+mJGs3tv8o9jm3QTilHmymxC5ckCgcIkEZ7VjJLhBTSwazKh2jVAsPaRU4riTyh6urZUT2lKMzowkK+1VvtYpkLmhAoFVdZ9pk2/PR8m0PKzik39UDCS/nVEPSYFyT4pLDe3mrctWBYH7CQAotnq2PdxtlWX8CMnLuBEwR5WE+RYC5AB8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB1036.KORP216.PROD.OUTLOOK.COM (2603:1096:101:9::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.31; Sat, 4 Feb 2023 01:20:16 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.028; Sat, 4 Feb 2023
 01:20:16 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: irondevice, sma1303: Rework binding
 and add missing properties
Thread-Topic: [PATCH 1/3] ASoC: dt-bindings: irondevice,sma1303: Rework
 binding and add missing properties
Thread-Index: AQHZN7PkgH5k9OezFEKWnOFoOAGHTq69OdaAgADEb0A=
Date: Sat, 4 Feb 2023 01:20:16 +0000
Message-ID: <SLXP216MB0077DB7583D54CBF7C7270338CD49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230203094239.25700-1-kiseok.jo@irondevice.com>
 <Y90OCX002gLuf+Jx@sirena.org.uk>
In-Reply-To: <Y90OCX002gLuf+Jx@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SLXP216MB1036:EE_
x-ms-office365-filtering-correlation-id: 32341f2a-fb70-42f0-307b-08db064df908
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H53BPz8zje+YanRzQdySzGcIxHbkWcDq7DryNwmFEED3YI/5RxaLlJVafoN2vSE0Ss2bzCACcp3zdMbpg0oREL9VAGXXEikii64rW4A1sbQYuqm5AEE+NQpeAc3JgdgqKV7NBny+4MGEsYEWbMHQwYcxC2jUuNDPNO0yQL1LVq+i8tZS4scmA9IsVbdYoi4e+guD+ZbGOa/dEOYtGFsGLauaxy9e/gCJC5BqI7hiBPibbP2zOoLsQG6p/A5KAnexQ40p2XeYy+0v+rPiFD1RENpERce2q0Ifap4DMzWCJPjXj6w7/6w79YWQWeuB6jnS31EpYDSnbZ9SsrBr1F04Qgk59pY/+1OkD/YwH6Qwd7p/hwWRP6T1siP05kpRfd/MnFNCKu9exPbuVKH3KnjLR1GFVmJJ3pG3LN9VtRZ7edOmYTvVzhkcs9Kllysqs5xp1y5iMP91Vkbn/mqG9iKJeu0t8lblfM7M3OGoDy3AuZ/W5gzDco6UFHOwD6R1FaV+Nqhv5dTJm8bzHpv5gWfku85LpF/jtknMbuoZPwYPis/IcE4AhLlW8R0J2oGcNHBMOgWn5XWlGyLYaltbsZQNVd01UWnnsurd1YMYPe84fAeKbT5N4ITeAD0nmVo/37By5ooP61KCjyi3dtbe1XhnjHBirRkJ1BaFhO/1i+oHxzv0W3by2kN3hjvJmkTm8NptLokrPh0eXg8pS2wpViQBYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39840400004)(366004)(396003)(346002)(451199018)(122000001)(38100700002)(99936003)(5660300002)(54906003)(52536014)(316002)(86362001)(83380400001)(33656002)(55016003)(38070700005)(7696005)(2906002)(71200400001)(186003)(9686003)(26005)(478600001)(4744005)(6916009)(66476007)(66556008)(64756008)(66446008)(66946007)(4326008)(76116006)(6506007)(41300700001)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RaZr8ddNQ7RPhoH37L46OCauczZ9dJzKHSl+XL5GBZr4VX4cJSMStQHqlSXY?=
 =?us-ascii?Q?XdemRLHbpGPzlOVJtLaT/hH3gX+KOW4BgGAvp9D/V5eus14WCfT7E58Gioog?=
 =?us-ascii?Q?qSw+W/+OyEkm9XrEHLoYLhcUIFG8G52DNf2qy2Ru2uVbtKweoXw4xq2K5SOE?=
 =?us-ascii?Q?amQawIlF0hLjwKJvry5hbO+9hgd42jn0N/37ffN82biyoX3O9dfLJfsmkjLD?=
 =?us-ascii?Q?e4cG3NszjHoJq3MKmVYgp4oOMxX6TiP5d2ExX/mHfJ5ctzlU2sKsZjM+8RxE?=
 =?us-ascii?Q?1+B9ETba0VGudNidjoAJKHhKa1sGi3i2aUdgn457SFLdSgfStRsTcE+LIPKz?=
 =?us-ascii?Q?o5+PA7IgjngJfenISzbeNmvzFQh5OfWPgZprYY98JVtgAIk79Uo1PSITTWpm?=
 =?us-ascii?Q?aJc+gcKlIMgadySshg1ceBi5OjBvcTccDXFlLxa1nVL+MjQv4vsJ0tqTPJCh?=
 =?us-ascii?Q?2r1cI3RdapJALwJRJu0NaWjpSb8Mie2Gj4+iXuVh4vmKpvk5q0dTjLhY4z0M?=
 =?us-ascii?Q?BZe5mUOM5ot7tDaWhpCmPZBUY/BYLfq2LWxSl+SGJnOJaLM/gVVTEwjb6c2o?=
 =?us-ascii?Q?G4zbqhaD6G6snuLpAF8OudTnZLXMKCMyn+r6KU80Ase8UARRFfwN0rGCQub/?=
 =?us-ascii?Q?WTL8QLFi27emAUoryStSCMaLsv7cAD1jvJNjQlOEXdYIO+DxdUlI/17huLcG?=
 =?us-ascii?Q?uRl+Z+ET+sHoEUGtMpQaJs3qF6T8OYDhfTe5XVtxJikErKK9b8i557lWmDqP?=
 =?us-ascii?Q?sku0KDRnfSEWflpJWivP2dAdpywzOgb72tpGBJOIcy9s9Th/cwYTeTAeLvYD?=
 =?us-ascii?Q?UZ4idB8ktZzFU908p14BvicsWuUqjUstWjNQTIj8tB3x+640d7AxUS87aiyU?=
 =?us-ascii?Q?2wWFV6Qy6KKYPtgO22FiJQ8fjD0eGjudFDavAMHX2eRP7K3CdATJ1ZQEBBwg?=
 =?us-ascii?Q?1pO/+S+p7pubnxBz49yiFMVn/3IxUjsXT716KO8hXeHlyVeJR9iJg/JuLO9a?=
 =?us-ascii?Q?l4t9OTxyPYkpiQTETjrS7DT9VhABQ0Xsb6eMVE2VPAMxbhJuUbZV8pTTeeQV?=
 =?us-ascii?Q?7tmK5g9pKSDh7vR1TfMOgEsZbyH7Ma8JkByh+TTZ2uUdBICZuX50P/tnYK+T?=
 =?us-ascii?Q?xxBOBKYbFP7HYn0iiJp8vzjwXgGtunGEdoic63I3JJdvQiEV3PpA8eDgrWUQ?=
 =?us-ascii?Q?OoSmLkOWkSDmR9z2IrCCFuVOoFKYmr3GAWCWrp4fc85jux+pur7O967ccDiA?=
 =?us-ascii?Q?VLUh0/0uFg0aMU1pIo+7dLq/DFE/UAiMSTh9m+8S+zfJKDsGQPhtRumnXb7j?=
 =?us-ascii?Q?+BOEhPAn47xXjuo+FIFI/9M3chn3IC/KB4h9fQ2GmX3tZttqNmedtJ/N0Twg?=
 =?us-ascii?Q?cGyEK0WEbhVKSrcmtvKUZGoutxF5+Nw1XChX4geLI4PDNa9mpQ7HxV+y+G8Z?=
 =?us-ascii?Q?tp/1nAKYJYmUIw64n21P6fskfgvp2yKSt9edFBgGtTHoD1Us10mm0YHv+aht?=
 =?us-ascii?Q?D1Ybd8ByOBHn1ZXTuekHI2I1b1Wqd9ilqC1lmwL8X7VZF0UKc2mZJM5kffoO?=
 =?us-ascii?Q?CBLwqs7bPSgElnPl0Bfptnq+IGTJVaICtYBIiwHr?=
Content-Type: multipart/mixed;
 boundary="_002_SLXP216MB0077DB7583D54CBF7C7270338CD49SLXP216MB0077KORP_"
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 32341f2a-fb70-42f0-307b-08db064df908
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2023 01:20:16.3056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eRzyRyhw0NgouB+KDLE4tVPB1G9Sv/Kbp2HhgAdpLE+19b1p3TxrjwNyA0g8UgEwY3sHTcWcau/JzyvfwI6bmpGEJoLYfCuCX0RtAh8xkoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB1036
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_002_SLXP216MB0077DB7583D54CBF7C7270338CD49SLXP216MB0077KORP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> > +  sys-clk-id:
> > +    description:
> > +      select the using system clock.
> > +      0 =3D External Clock 19.2MHz
> > +      1 =3D External Clock 24.576MHz
> > +      2 =3D Using PLL in MCLK
> > +      3 =3D Using PLL in BCLK
> > +    $ref: "/schemas/types.yaml#/definitions/uint32"
> > +    maximum: 3
> > +    default: 3
>=20
> We really shouldn't have this as a custom property, we should be using a
> combination of the clock bindings.
>=20
> In the driver this would turn into using clk_get() to get the MCLK, then
> we can query the rate with clk_get_rate() and use option 0 or 1 if the
> rate matches, or the PLL otherwise.  If we fail to get MCLK then we can
> fall back to using BCLK.

Okay, I got it.
I'll make it based on what you sent me using other drivers.
Thanks, your feedback.

Best regards,
Kiseok Jo

--_002_SLXP216MB0077DB7583D54CBF7C7270338CD49SLXP216MB0077KORP_
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: signature.asc
Content-Disposition: attachment; filename="signature.asc"; size=499;
	creation-date="Sat, 04 Feb 2023 01:20:16 GMT";
	modification-date="Sat, 04 Feb 2023 01:20:16 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBQUJDZ0FkRmlFRXJlWm9xbWRY
R0xXZjRwL3FKTmFMY2wxVWg5QUZBbVBkRGdrQUNna1FKTmFMY2wxVQ0KaDlCOExRZjhERkdIK2Ew
NHljb1VVQkZrMUtCOEtUY3Bjc2c5YnhxQUVWM3dYU1FBVlhYY1htbmkrOWVndFd4WQ0KSEFCOS8r
UCtSRzJ3bFF2SmVXaXBDYzQza0g1ODNkOFJGbFFhelpSYlFJaTBadUxkdXJIeEl2bmtGTVpURk1M
WQ0KLytTOWtoUUs4TjBJa09nM2RtaWppOEU2THR4VUxPN3pSTTB5UmZCa1Fla1ErMXFkam90SmFJ
L1p5dDVqNFVTUA0KY29PN1p3czN6OHpGU3pFSVhLN1B1dis4WG9VZTRVakkyc0hkR21hZDlUSEU5
QUpLa211eE1vWjZqbi9xRzNvYQ0KWFN1OXJkMmlhaXNqaEl6TTNWMyswMll2S3hRQ0h2ZUZtSmdF
RmdIVkprM2FaQ1RnYWQ0R3lzUFd4c0FESU85cA0Ka3lvVGpoeGdIbXhpY3ZyQ1Z2SmFQSHM4OENS
MVF3PT0NCj1rNEZ3DQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--_002_SLXP216MB0077DB7583D54CBF7C7270338CD49SLXP216MB0077KORP_--
