Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05893E46F9
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 15:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7947C167C;
	Mon,  9 Aug 2021 15:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7947C167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628517421;
	bh=fobL2NRofzP7Fm2cNwuLicZUZdsl3f2g3XZvSoAwraI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npPwR+6ntGqXq9UXAjARHEQAjew+B9wl2HN2wOV4F9Jk1RzqYl6p8R3goQDKLNvmj
	 hC8AieRntsI3OfOdTZtAt0s2OSKRf6vDTpNaTh5UtyqfP7Ky9/SZgTdBgn0IpmoBxj
	 +OgwQjJXQsG7J+oiUusdUdeEIow7ylrYoJZtILXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F37F8032D;
	Mon,  9 Aug 2021 15:55:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24382F802D2; Mon,  9 Aug 2021 15:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2135.outbound.protection.outlook.com [40.107.92.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 431E0F800C8
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 15:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431E0F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="AJVpK41e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8ODhhOZKq36c8koKYd+LF25xvddTOJAkb9b+fQ7JE2nWBWXXxXBy6D6zMatKa1WXt+RyOE1/6T0llDxq1qcCH7AB0DovuIAHq4VUbKN5+EyFhSeAigcLlXxkRhvjM2r4pOsg9/LEoocaE1JO1UuvsheYTmGHaOgnKpl0yowZsT0akQui8aM66Lp+0vsu8Nmwiyn47tahSxMaqRs4bP+WIUSboG1asD+XzEoFunJYPfg9JniUL67+OZMRQ4dLW7xYZCgwz0q2lyocf9W7H9VUGlwX7rNJy/tYMKGe0bEVT+xrPNWPeyrxcX1XaE/Q2uZ+XfMYKwGLdo2iuuSo53bmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2E3FlWOBeA+zG+URWCrSVtIAJWthWH72hDNipyfH9Y=;
 b=B+lA/paRfJsIoPUCWLY0dyo7qbtAqK/H96vNDIEMlVJnmM/vtodpHfWWOyiZFszged1GmlIz3YsI4xJTcSAdWWCaIcCCOR+KL9TBJIjdAyNdSvqzSYJ8qj3KZmZ18iWRctiCxgS1VCf8qkO5QjyPKx5YSCVnNN1PFvJ/+AvzodjOWQvwioBEXzEhohwn4IdIq4RovRIP+mTIORtVUNpTxA6K98iXVtTs4HyXCVHqozoWjbT+EyMnNikbzqeSMiJ3NIrmdf4Bem0M6VF3TbS6LQZIBt4pv+R8KsAcXPSiIEKAP1rNoprO4bBjMag2N2BZd7NYrehiomX23qBUEXZ5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2E3FlWOBeA+zG+URWCrSVtIAJWthWH72hDNipyfH9Y=;
 b=AJVpK41eLhD5IAavpmjbATAukGPL1Vvk45PwhmQJFj91pLxSYZ3x/sGSsj+PkK0zIwzQFT8AtvHkwtNzYAGDvGhZY3ElAqlUxpsOTbh2iAzJH8y8aMFTc7iZUi6R1AC3nVjwvB2NXsXstTIpBnIsubJWeFJCUljGaKG5gRnT9Iw=
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MWHPR11MB1552.namprd11.prod.outlook.com (2603:10b6:301:e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Mon, 9 Aug
 2021 13:55:21 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960%3]) with mapi id 15.20.4394.021; Mon, 9 Aug 2021
 13:55:21 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add support change dsm
 param name
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add support change dsm
 param name
Thread-Index: AQHXippclk84bnNRdUe7mfrYo+58kKtmUAmAgAQN46CAAL8DgIAAGj1g
Date: Mon, 9 Aug 2021 13:55:21 +0000
Message-ID: <CO1PR11MB5089FBBFCD3D9046F9FF7BD592F69@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20210806080834.16705-1-steves.lee@maximintegrated.com>
 <20210806110301.GW26252@sirena.org.uk>
 <CO1PR11MB5089212BFBF03F82AE41E34C92F69@CO1PR11MB5089.namprd11.prod.outlook.com>
 <20210809122125.GC4866@sirena.org.uk>
In-Reply-To: <20210809122125.GC4866@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce9d3c06-ccb2-4f08-a5a0-08d95b3d5457
x-ms-traffictypediagnostic: MWHPR11MB1552:
x-microsoft-antispam-prvs: <MWHPR11MB1552B7341B7DDCCAACB5D73492F69@MWHPR11MB1552.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O+t7b0zcop0fgyPLIZKB/DkgHK/hmYDaE1qQjhtqExz88X+Kdq1H2h/IsDjMC/VF0xiB6m37BnwfqB0w6ZMVvxto6cE7KD8377BKHmpuPISEH5imP8B4+QPP+Y9pxcNEXQata4fsJinVMhgYyQU24to3RDwaCOTtVOFNrThtAl8BfG6jCLarQIoX1r45Cde9cc5ekk28FQLFAEySmEnOvzs2eeArtU7jTFpyS5yk46Ox74eFG5gf0EkLM2OWlB42eDKSX/7p4ZX3OfBm6h4+kytQIE1exlJxJJ9/jI0T9ql5bobC2MZQcMUi/VxLQ9dRa2hj839fDQoY6o+LNsuY0e4RUby7WZDMJZEQ0iYhll+dk6O9gUs2m7bFCnO2/xEbJtdI8CtPY6yHcya9s4nb3+uTgpPgjwx1PAL2Zw0OMIqHv7rJwlVOyL8h3+fNW7/TDZEMSK83kKSBG8Xk7S1VMn02F2kf0LJKBP/N5B2be3DVbVYH+suOSw5+VHs9FLYYjeTLNI0E/QSl5LhdhCkxIvizxg7FVb+0Q1EdrSMpZbzUxrInRyOkceRXrx1OqS3EuYxfGbfryJNE+e/4aJIALPNWPz+Ys1pAHVTqmFMpVHcbf2zoeNQMvRtYQMEkW3STMq1yowUZm4ijCZKIOXlOPdiEB6KCnMZwQj+5DiP+ImTWlkC0hdhn05KcaMshHvl77lHXe5WwaNh1aNZN6OesYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(5660300002)(66946007)(66476007)(66556008)(7416002)(9686003)(4326008)(6506007)(64756008)(76116006)(54906003)(52536014)(66446008)(55016002)(4744005)(38100700002)(71200400001)(7696005)(38070700005)(122000001)(86362001)(8936002)(8676002)(33656002)(26005)(6916009)(186003)(478600001)(2906002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q/2IcC+O7H5bNYZQySmhfN5o6erKk4ncvjQiu2I6RMLtucnvOdyDN2exdu/0?=
 =?us-ascii?Q?njq3HGcQXojdg8dbY+QgWQ4e6gNKLMPZmEAGUd6CJIaJEz484pk0oJFKeV81?=
 =?us-ascii?Q?w5dZR1zpu9wUMRuWExtZL/7VQEefi9F96nH2/mXE7LwhM2u8G3lyH+MEfmA4?=
 =?us-ascii?Q?Qu/cSkjdiDIWZmRcj43toBMMw73uGxukUniMeLweW69/xzKtIA9fqugEBVnx?=
 =?us-ascii?Q?Hu7LF0ab9auq41oMlj0Tp//Rz07wL8LwwSnq5d/k4H5aTO5sVduIiXArUb0q?=
 =?us-ascii?Q?p9Uy0AaZjNNSjuxCr6RqjmKfDMpuoyeZtrR9Ccbclf6KDzhH3FDAikzfJxP9?=
 =?us-ascii?Q?e5mIQ0e9NMylEqgBMzoxjO8Vlo3TeBjgU41h01v5kX7UzTUsEhIO8TH6RpvB?=
 =?us-ascii?Q?XlgofOwg9PL1mJCvaUq8ysrYu5T9P0Ezeoas5TeYMlBqfh2LK7Y7pFcLJlca?=
 =?us-ascii?Q?VaX2u5C0ybDGy5wYQ3sicVzmHUMFrG48emW053Kj0nTHf0Dnc3rE7jzqQJDH?=
 =?us-ascii?Q?aMUe/5KdZwG9CpZdseuTgU7B4RHh7Bs22l0q15DdLI9nVxIEXAthI3EFG//6?=
 =?us-ascii?Q?oA1U8e4ZJKhbAGVA0Wr9jRmUL6EE6sBSplwLS3dZOl+/OfELGPBuOBeMfzym?=
 =?us-ascii?Q?v22H19UCBZu6wD79uLgEAH8Qh04GQoH1Yy/sua6HJH4TYGnsv7QLUGFhHykM?=
 =?us-ascii?Q?Ab66nvoYrLPgK5+DMWuvfxTOAZi2V0aRXc5c6yUW/MgFfSSZodL4e5IcZ/qn?=
 =?us-ascii?Q?1pT8p1YuGBX6hX46IhQl+wSbw7UeOmprNyAqhCr+5JYTie7tw5fAd0A+hfdc?=
 =?us-ascii?Q?lXBc+VCfwkv7JBoxeJt3IjGFtf36WGwCqBKuFmNlydKt/dl3LHGc5KUWGxtC?=
 =?us-ascii?Q?c+pEY6iQQWiLyxwuk3qmqLVxHbi8z7AeRyE17F40fShyauJVa3BYZKRJOq7d?=
 =?us-ascii?Q?AthzjW9tadLNktR+1X1efYhCrAOFu2G0BRSy178lib+669PykxSNJ5IUzm/4?=
 =?us-ascii?Q?LddnnSGuDvB//Wiflm8recgepokn8u/Felz0tpZ5JFXLt+aYg61OZDoHOpG6?=
 =?us-ascii?Q?vmLrzVwIbi7pz/hoqBVJnymPb3F0/27Ncak22IEigrw2FBFuD+WOUxvn4TeN?=
 =?us-ascii?Q?r7ByJKuDjymmWJIATAV60SJcFj0hugoFgx8xmoP04AdAKLnWZrcpFJ7hZRvV?=
 =?us-ascii?Q?G6Fvdy+54ufD7bsv3CQr5urCQZTT73paump3WKNoSL7nBJ3VD/kiYBXUA9Eu?=
 =?us-ascii?Q?xswt4+TKsOGsXBaAWTi8dk4GF7YydqK+Odl3Ogx/ncmTBKaHH/Qv7crTbqxX?=
 =?us-ascii?Q?dxw5nErx+FmeXo5JvVJGRA0w?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9d3c06-ccb2-4f08-a5a0-08d95b3d5457
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 13:55:21.2762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQ5NMvM+TJqyjNhIAQjukoFIucHvIGlzVIDBNp8P0io5VUgXgFjIWbkQy6TjEdtKwWHpAtxc/Z1CmGbWsUR3deysa7xBHAryizYuN52Xsz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1552
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "steves.lee.maxim@gmail.com" <steves.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>=20
> > > This will break anything using dsm_param.bin as the default - why
> > > make the change?
>=20
> >  I'd like to make that as same name with other using SoF project line.
> > This originally production default is "dsm_param_%s_%s.bin with vendor =
and
> product name".
>=20
> If you want to add a new filename then that's fine but we shouldn't be br=
eaking
> backwards compatibility for a minor reason like that.

  Thanks for reply. I will add new filename not to break backwards compatib=
ility.
