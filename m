Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857228773D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 17:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 746F11673;
	Thu,  8 Oct 2020 17:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 746F11673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602171098;
	bh=brp3Fq8TtNOPTd60fgFO0oJXZe7zSViXQzVhJokTO0M=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p83Ino2xPQ/OYsp8JIDWerqMWuCO6avTTEXrJ18F5iWS0lnOyS+MDzk0fxSnkM15v
	 oHyKju2ScESXO2XTAiXZTVkOZtRsHMPjE5tK30Y95p1rol/jKzhRnIzrp/He1IKeFH
	 PImUeN1jOIfTCWvFRmDB4YODjlrCcCag1TLjmHm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 084E8F80167;
	Thu,  8 Oct 2020 17:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C786F80164; Thu,  8 Oct 2020 17:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92A5EF80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 17:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92A5EF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="K6398kjz"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7f30580001>; Thu, 08 Oct 2020 08:29:28 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 15:29:38 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.51) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 8 Oct 2020 15:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4QgN8oEbc8bCNZu+RQyhKuxQFWw019J3PEIBE+PUoPbXkDd1MtxhZlf+yXE5iS2HUyNoAf2zWgWaSoMew1V4ZbQsrU0sS48ee+AkAGVUpCDWYYDZ+JykMSMRUbXZgBmYBwi6ZfqYX6TvH6Hm/cZ7mSKkFlZDmMbZ9Mwz2CO/D7mVslE7dZlMTolmAJpI7iFLFlvSoQ5U2AL3duOvuNXM+rU5nAcbUHQ6fP9OcI5QlpoHZqywLfY4VnMYYnSasv7fPBnX/fFhGm+1b7iuI/oJdT9eH4EHw0yaR8pUxOgMof7xldN3a1ocJfx96jK7x8GbvMoyuJVNCiJPqlU80rlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6ELDvltQ4i4aGxtlxhMKXggwmz0S89cDsm9x6G8UN8=;
 b=nPjHnsr7Vvor6GPY5TRAbm0gx61iO4N8li6sv3zO4DbAJOb6GvODuZJKD/NGM/G5xgjVxyriB61eEb55zBmyRwC8fbKYsHmxstdFC4R3B8+kMF6BN31/BOMY3vwzbhpDb5eToUiIHlXl5tydHuog7OnREi9+CV+Wq7aZHf8zig23v+1yC7AzQ7qSYWAz2gls31V/ikUb325/Nix+WMQ0lvGJ7d7k1dU9T3X2EzmPJBQiQTDmh5TsHio25mZ+zIEnXt/WDCxf72qzU8NDAA5RQqXU8jXEPs/jEi7TpoICQp/cqfdyWk3ZYWINa29O292G0CSHbXRVrnzYB7c3TzJyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2936.namprd12.prod.outlook.com (2603:10b6:a03:12f::17)
 by BYAPR12MB3110.namprd12.prod.outlook.com (2603:10b6:a03:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 8 Oct
 2020 15:29:37 +0000
Received: from BYAPR12MB2936.namprd12.prod.outlook.com
 ([fe80::5c95:2357:59df:273a]) by BYAPR12MB2936.namprd12.prod.outlook.com
 ([fe80::5c95:2357:59df:273a%5]) with mapi id 15.20.3455.025; Thu, 8 Oct 2020
 15:29:36 +0000
From: Stephen Warren <swarren@nvidia.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Lars-Peter Clausen
 <lars@metafoo.de>
Subject: RE: (Optional?) DMA vs. PIO
Thread-Topic: (Optional?) DMA vs. PIO
Thread-Index: AQHWnYSjGhRCGU0Kvkq4bwOvZsF5u6mN0udQ
Date: Thu, 8 Oct 2020 15:29:36 +0000
Message-ID: <BYAPR12MB2936DD3347E5794A1E2095B6C60B0@BYAPR12MB2936.namprd12.prod.outlook.com>
References: <20201008150539.GQ4077@smile.fi.intel.com>
In-Reply-To: <20201008150539.GQ4077@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=swarren@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-10-08T15:29:32.5703485Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=6e706248-50c3-4576-95fd-5907e7b0a5fc;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a40bb96-b8b6-4f91-71d3-08d86b9ef738
x-ms-traffictypediagnostic: BYAPR12MB3110:
x-microsoft-antispam-prvs: <BYAPR12MB3110B1FD3AB9333F49CFD115C60B0@BYAPR12MB3110.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DVdt35FYJm1tMtizOdnGlovA0AyQTPngtzUyiF22Y6M4jpggMaB7KSg9P+8sjQTnRF43j3ES/AU2Jc4P/1Rh8y3nW1uaSVXDOs0k9O7RSL5Gl+rS1//SziZJSjerf8i4p0iPXg1BwdDZ5z6Mil4kMsdFqGYOax5vJs2E/miYqf9wlTVnqZw4UHN22xFVUl4ig+b/F8M/EkrvzRLCtMgntXevawXtQqXCjy3t34rBNxdNSh/jXFjUzVwSfOkLrSTm9MujywH7EXs1z4mqxwIIGgjGbKnTIV2OBZyfzZczlgz4lMQ2kKetnTySItNJkNZD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2936.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(316002)(33656002)(86362001)(55016002)(2906002)(52536014)(54906003)(83380400001)(110136005)(5660300002)(478600001)(6506007)(4326008)(8676002)(66446008)(64756008)(66476007)(66556008)(66946007)(9686003)(26005)(71200400001)(76116006)(8936002)(7696005)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: TSOsxYvCJSFRTJ/enR5h/nOd5VhKm+YpsrKJCWrM/XJN7QRpCPnE68hvorW1tkFmkyCqvzhSvdwDXH4ZZMyRy194CmX3M1LFLdYCizoMwqbcMfHLSij34bOT4PkHCYMBykcF+b2qRCU8COeNz7AAb1oPkvLPcNOh2rdA3O4uxdEesTPuiMq7XHEEYfnLu60JdOjxpf37zGuvI2UJFE3YVqKmYgzy4htPHTLIHv+LAl0in0tSpZmc0178dfn5twNBRdYPLXQWTIfBTZtRvcwfB50Ogo5wkl3VjFfqGUMgf8mD8bs8iHChZODgPkWScHrAtBxIEL5iFN884YtTLqKwbZ2JuJ5n5pkdJBBWh5u5PTdOEHPQeq6iYpTPmD4+EHbpTzNdcOoLDXfytaix4KDf/JKAdO1lpl6yI0bJlDueLMWZWtOYzQg+MnhA9VCKhUuS3zv/I3clJJpX862Riucmr1IqsuiiZV4aWfBN8kVHrNC4Q3ngm3KC5EU0PBry24ChnMs1edNMwOOLEu27u9jrg1l/+1hlPSrFZuDiiCjnMNKlJeVrj4zsIR1DGF8uDFZn7V0GZ/+cAby3mr3KP/GHk60yuL/Y/LDg3Gpz6eakE7rWXERnsjnN6gvDfW+pXRNieApYU2WxQOSqz7xLEYY77g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2936.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a40bb96-b8b6-4f91-71d3-08d86b9ef738
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 15:29:36.7752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gs4t48OPFPwcc8zvMsvg8/Dm/oNOElR2AMKfut1OHFdh2UH7kIX/TgfXv5+MTYJG7lxr9Lsd1mXui+syPy6LHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3110
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602170968; bh=t6ELDvltQ4i4aGxtlxhMKXggwmz0S89cDsm9x6G8UN8=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:msip_labels:authentication-results:
 x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
 Content-Type:Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=K6398kjzuTz6ZlXCIljiCvlqtR5zZfMB72NicX3cr595yAg5Kk71C43eHGVSHWE7O
 vE26bZwA7atanf5Uoof/2VOz3BUm+wBH7v09haywfgbHHEsVtQRVFxqQIw3efiRU4B
 JCwu947RdwMV9WJHoDKSbzOs/SSfrlu0SyMAYL0Qqvr9MQ9uOhty3Ax2gMGdeiqpxi
 UIDDYKMX1yloYbcA4H3oveTFogel4TIQ6BC2DvDSlAcrNWWZ59et8fRiczQmxsm6EY
 +qI9dbeVweYSj59EjQ0QrTU+PoYe8uBX+ec72vkAmxh+179PHvbCWiLvzx2t0kkvGD
 B4PxdVJAdK4OA==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
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

Andy Shevchenko wrote at Thursday, October 8, 2020 9:06 AM:
> During internal review of one patch I have been puzzled with the followin=
g code
> and Pierre suggested to ask mailing list for help.
>=20
> My main concern is what was the idea behind? Does it mean we support opti=
onal
> DMA in such case? If now, why not to return an error code directly?
>=20
> ---8<---8<---8<---
>=20
> > Why ASoC core has the following code in the first place:
> >
> > 387              chan =3D dma_request_chan(dev, name);
> > 388              if (IS_ERR(chan)) {
> > 389                      if (PTR_ERR(chan) =3D=3D -EPROBE_DEFER)
> > 390                              return -EPROBE_DEFER;
> > 391                      pcm->chan[i] =3D NULL;
> > 392              } else {
> > 393                      pcm->chan[i] =3D chan;
> > 394              }
> >
> > (note lines 389-391).
> > If PIO fallback is not okay, why not to return an error there?
>=20
> no idea, the code has been this way since 2013
> (5eda87b890f867b098e5566b5543642851e8b9c3)

It's been there a bit longer, in fact since the file was created:

commit 28c4468b00a1e55e08cc20117de968f7c6275441
Author: Lars-Peter Clausen <lars@metafoo.de>
Date:   Mon Apr 15 19:19:50 2013 +0200

    ASoC: Add a generic dmaengine_pcm driver

+               pcm->chan[i] =3D of_dma_request_slave_channel(dev->of_node,
+                                       dmaengine_pcm_dma_channel_names[i])=
;

The commit you mentioned above simply prevents the code from taking the "no=
 DMA
available" path if deferred probe occurs.

> It's worth asking the question on the mailing list, I don't know if this =
is a
> bug or a feature.

This does seem like a bug, but there are a few places in the code which exp=
licitly check
for a NULL chan or dma_dev (derived from chan) object, so it seems delibera=
te.
