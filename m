Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19216A0A6
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 09:55:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50801690;
	Mon, 24 Feb 2020 09:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50801690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582534515;
	bh=laI3Iqey3L9L3z9gsnV5W27AnC1j/VdFiE+QumulNqc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e9kkFYuhfFGcZo8L0K4KhDgYNx9WBQs6Mue4tiJH++9bqwPQGw4J4CYuuPNZOd8Vx
	 DTga/RyyI73NdJLH4b5P6I6tS5xV5TngOtii4N0+GvUIHABGhA6MU5qCIML2AGlV3G
	 mI8rlh7xpA/jkzcKWROWPLApv3BhuKRfKJRPzqtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C93F80090;
	Mon, 24 Feb 2020 09:53:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4188F8014E; Mon, 24 Feb 2020 09:53:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28979F80090
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 09:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28979F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="qxmS1PNM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ne7teBaqIlrdQPDd9JaxmSXOsDVZRsBAL0GTTkRispZx44zZ+WRaqCScM3Hike5mI49A82m5aGGMZbWa6X2mkN/BjGpHJX0+dlvB+fNZoekcIUn9lzpEuMAcCsLJVdmBINKL3heJb5MA9N+Z7cwB4dnYygMgSNHYanR+Va23CdZOWVxhxpScgVVkBoAkkX9UKFxS52ITtlZxNHXwHJJFUfyFULHH3WUx8tph/lZAwBVL6pUZZ2uBMM3Nx6sBwR2CEktTuxj9csXXv1ppm5uUoLBmZOlEAWwYnSYBEF4ipxOAnhn9uJfp0RHaYnqCwxK2gvreX0yRDOO7rzV6iomOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39ZpzOZDMlgUHdjcgSEY5oRnIiqbOuAoG3PMp076Lbo=;
 b=htuiyNYNHpTpzxWdK5Tv/DiygHEXSAg/coJ6lYwIKQ6sU4yokFfYKMdBjvBiRFzBPjRvXjMurnY1VmNdUKyAeZhi9O59s/sH251ykc8pbySRS3W1wog6wsIiF60+EDBIUb/fNrDXibH+Nwpd6V2ihZPglqQV4idjE3giq3PaGYZA9rOxTQQSG/Hz2YqFii4vFiDnTmoFgeWDIXPWMAARPPrc84Ts3epKmR/dL9iS59m/x8OW4mghxNqYEWQXhmByhPY5OZcAIRSmwyoxbwOgfRpTln7BQVegoCXTUDeAtVLlNtHyY3P9mXuwonyv2Ih8lPHStjJ9kaoUTVksVHQ91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39ZpzOZDMlgUHdjcgSEY5oRnIiqbOuAoG3PMp076Lbo=;
 b=qxmS1PNMCHIJEN5frCv5iP7B7297bi+IDREMXDkkBM3DyES3JBZnycp0BfGQ0PbH12nkUI94hm43h+4tAL+wmW2qVEiHoOChY50KUywjsVXVoEEwWAd3JXiy+4oGwJSiihs4Y9Rh6jzogDwqAbbTfskZBcM9ocd50dY1w5/2+YQ=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6606.eurprd04.prod.outlook.com (20.179.235.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Mon, 24 Feb 2020 08:53:26 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::2075:2c31:f78a:23a4]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::2075:2c31:f78a:23a4%5]) with mapi id 15.20.2729.033; Mon, 24 Feb 2020
 08:53:25 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and
 platform drivers
Thread-Topic: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and
 platform drivers
Thread-Index: AdXq7zKbRo5k9O0MQoSy/99vj57qYQ==
Date: Mon, 24 Feb 2020 08:53:25 +0000
Message-ID: <VE1PR04MB6479BCA376502F6F1251602BE3EC0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [101.86.209.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e08fdfd-4cb4-4e99-3420-08d7b90702b9
x-ms-traffictypediagnostic: VE1PR04MB6606:
x-microsoft-antispam-prvs: <VE1PR04MB66060C1F0041F6A9ADD08884E3EC0@VE1PR04MB6606.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(9686003)(186003)(6916009)(316002)(7696005)(76116006)(33656002)(478600001)(55016002)(6506007)(26005)(81166006)(81156014)(5660300002)(2906002)(66946007)(66446008)(8676002)(64756008)(66476007)(66556008)(71200400001)(52536014)(54906003)(4326008)(86362001)(8936002)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6606;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o3WWhM5TJLrHi8gznmjIIIzZGx/b7VImqyt4nB4PcK+IaUgb0NNapjhMX5NAkDCrKnFkhJmpFsL/AcabJVEFo3Ys/7rL3gx+ydIAV/RPUqYrXkKlp1NappXM6nXGmDK4pHd4xfPyBBMK9KTF+Kjq0n9UFvuPe1JMBmYq25iTh8l3h7p94x1Q77TpVXQrX1C4XxkLzJO5NzQhBiyAhRVd+UvexgnjPXeiuj0PCmgSraIbXs4F8NWg2MSgRmoaE7858ovNREUjwRvnn9su6Ti1By1pbt7nRl66gHoraJRjMwvSSPShWNjWjxu/GUefpdt3N39gwDzBjgjcEvcKCFQ0aP9uMrCaw1MkyvfTktxfYYN5YBrkLZlIfysoXOCTNmm6WLTp8mm+IRoE4q2EeHssmrJgitFP7TVxWO1F921x3L6EujGEix7OcGCnAG5Dn6jJ
x-ms-exchange-antispam-messagedata: fPiDTjYFKXg/lfnBsTO3GteZXyVRssejJyoDRenaez1X/YyWKTPQrjkzR6KKazjbJM+/kk9VK0/0UWk3JDNxuceiN66P6ZGXwyIuslwmUoCXdprrZegm2CuPWEe6XKak4QbH6G80hkUthaoUnaZEkg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e08fdfd-4cb4-4e99-3420-08d7b90702b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 08:53:25.6346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/pYfVM/+CVio65/5mb01LolyoelAriE93P4OgG3QKflkvmLzB7fC2LWyjezZpiu41FMFEEnD9ZLVh0k86TM/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6606
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi

> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/Kconfig           |   10 +
> >  sound/soc/fsl/Makefile          |    2 +
> >  sound/soc/fsl/fsl_asrc_common.h |    1 +
> >  sound/soc/fsl/fsl_easrc.c       | 2265 +++++++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_easrc.h       |  668 +++++++++
> >  sound/soc/fsl/fsl_easrc_dma.c   |  440 ++++++
>=20
> I see a 90% similarity between fsl_asrc_dma and fsl_easrc_dma files.
> Would it be possible reuse the existing code? Could share structures from
> my point of view, just like it reuses "enum asrc_pair_index", I know
> differentiating "pair" and "context" is a big point here though.
>=20
> A possible quick solution for that, off the top of my head, could be:
>=20
> 1) in fsl_asrc_common.h
>=20
>         struct fsl_asrc {
>                 ....
>         };
>=20
>         struct fsl_asrc_pair {
>                 ....
>         };
>=20
> 2) in fsl_easrc.h
>=20
>         /* Renaming shared structures */
>         #define fsl_easrc fsl_asrc
>         #define fsl_easrc_context fsl_asrc_pair
>=20
> May be a good idea to see if others have some opinion too.
>=20

We need to modify the fsl_asrc and fsl_asrc_pair, let them
To be used by both driver,  also we need to put the specific
Definition for each module to same struct, right?

>=20
> > +static const struct regmap_config fsl_easrc_regmap_config =3D {
> > +     .readable_reg =3D fsl_easrc_readable_reg,
> > +     .volatile_reg =3D fsl_easrc_volatile_reg,
> > +     .writeable_reg =3D fsl_easrc_writeable_reg,
>=20
> Can we use regmap_range and regmap_access_table?
>=20

Can the regmap_range support discontinuous registers?  The
reg_stride =3D 4.

Best regards
Wang shengjiu

