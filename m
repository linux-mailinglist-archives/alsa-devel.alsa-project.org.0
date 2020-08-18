Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FF247EC0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 08:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046C216A2;
	Tue, 18 Aug 2020 08:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046C216A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597733705;
	bh=ygdBToboPxrEltKr0pSmTLPjO28VqpHrOdt1xKcZ3Ok=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QRpK0UNMCNBadpA1AcDJ8RyHzqEEksv726fHBLxUYbQt1mkzaQ42esNOpPZYFPtSN
	 d1mPnZuziIjQRowYT36hy26ZDK/KuhmK3NtnrxHKcl8B9XP/gI8oiCcpz62/nRNB7V
	 w1vXaCLlKYjwmij1ancuL+TDBJNo4u2S8RsFuTeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56039F80228;
	Tue, 18 Aug 2020 08:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E9A4F8023F; Tue, 18 Aug 2020 08:53:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85282F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 08:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85282F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="zRQv5bHR"
IronPort-SDR: V0i+LOPCridYmcc4FEQh9Z39MKVSSZyQfp8EVDZEK5BlOTEEWzHuAJWqRRgTuuGlkyGNCDZjhA
 xS+KAv9ev2pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219168449"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="219168449"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 23:53:12 -0700
IronPort-SDR: BDfQ+H3/mW5WVADCzkX9OmoWX0ZyabG24ib7/I8otiEHyNG1h5cMPjNd+gfpwTCtoNSLYWzPne
 syyvhKz2JaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="471693982"
Received: from orsmsx602-2.jf.intel.com (HELO ORSMSX602.amr.corp.intel.com)
 ([10.22.229.82])
 by orsmga005.jf.intel.com with ESMTP; 17 Aug 2020 23:53:08 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 23:53:08 -0700
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 17 Aug 2020 23:53:08 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX162.amr.corp.intel.com (10.22.240.85) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Aug 2020 23:53:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Aug 2020 23:53:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwHzeE1u5VJ4RsYnN9HKCmwxLFAniEqytrhfqQ1EcnvJtRXH5+TaweFQm88OS1nSEwAQlWTemT+DC735OnAp/WLlwzMeVrh2JWKPbkDknx7rtsX0k5inygfDhfKcFQI/AOqPm9M69DZQ0eBE01ooocU6JQmEufX81/EyjC8PG6uXTLBh7uGwyL7XGg3Ven28QrI/tJonleN1oYnY2+FycxEy1gNPgo00UQu6xtEnZpHW1DC1FyN898huOYFMWvJzUEnV4qowAz0q0WQLYJFvoOInOxRDTUURp93zVR1EqY0FM2O34tyxClNElN/hbF1gWQPHY4MVhbtCjvy7gj6Zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caibVuZKzfJh0S0Hnqs9hLZGAMR2x3hXhmmiYbnpvoc=;
 b=Lwog5vHHo6TBH2aBulrt9ypWGebdJFGcx2G9zIQ34mg61BwIFoSso3ybIPJfkWqoC35X1el9sM6kOhBbTUhjkT00mPvmYbedWBJ/nlXhhsmXmy+7QH3L0T9/5Ia8Z51lG/N52mDsewlHOdSfsFEGCicSu39pcVR7lBt9HZOXNxgpe6r2PT9LPJ7irQbLGE9fzKrdLZG455DdfRM3wNaLKka/8o8Qc2WA+q6sQMs5SyxReyOWY7KlflJqGeXS2+ZKu6Iq8HLvO1Y+iyY+wIIwZCKaP5ZRMoTU9l0N1Xbv8gEAwimwBSUnefy45ag2bO5KAwWi+03B8Og60Mv5k53TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caibVuZKzfJh0S0Hnqs9hLZGAMR2x3hXhmmiYbnpvoc=;
 b=zRQv5bHR8jWFE7xj4qbjwABCSG/wvazXrqh9J9b1M6KXvr0dEYrCK7zipxKXJ3lANBxW5wkLypaKwl9rG9y9cLaVhfkdrmBd2tdufWflquOBoNzdqPKRNtwnuE+2Fdq+oaJiFbDzE7koqVVNXQmwBkpDAS/T+CikXiN7EP+biQs=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM5PR1101MB2107.namprd11.prod.outlook.com (2603:10b6:4:5a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.20; Tue, 18 Aug 2020 06:53:06 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 06:53:06 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH 1/2] soundwire: add definition for maximum number of ports
Thread-Topic: [PATCH 1/2] soundwire: add definition for maximum number of ports
Thread-Index: AQHWdSI8ybKAPOyQqUWJUXX/RtQZPKk9aU0AgAAEipA=
Date: Tue, 18 Aug 2020 06:53:05 +0000
Message-ID: <DM6PR11MB4074A817AEBB4636095581F2FF5C0@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20200817174727.15139-1-yung-chuan.liao@linux.intel.com>
 <20200817174727.15139-2-yung-chuan.liao@linux.intel.com>
 <20200818063538.GV2639@vkoul-mobl>
In-Reply-To: <20200818063538.GV2639@vkoul-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c32739f4-7b2b-40f3-029e-08d843435c1b
x-ms-traffictypediagnostic: DM5PR1101MB2107:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB210758A06EDBF72154A7A5F9FF5C0@DM5PR1101MB2107.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C9G4StQvuwrnIoGwjfKnyipoWIWA2lM/M9mARiGfEiL51ttwQXPvzZFPopaxaKBTgrv+OW+CSKkitsq776DaxlLgaU/t561IEw0kPsi4eTzC++As8jQxVyoapAjQD9/ot7GzqcyS/J/Yq79CTxr0VQ+s54ihxDgsrHNd1wad3TJFbk4y/3sdjmTBEXvA96iuOTiyOZHEuJxZuWymwQ7V8J5hMcgBqJeJTUnMbZo86ETb1U7NNrfRw2yaTOxejfBnU25ShrqJYAAB3eV+FDK6GtKGaF5qo+ztWMx51Fjdy6YEA3kBq6iskCS6P2ZU6DtdYZZrIA8bgf6JNJ14HyHukA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(316002)(4326008)(7696005)(26005)(54906003)(53546011)(6506007)(71200400001)(9686003)(52536014)(55016002)(186003)(110136005)(478600001)(66556008)(64756008)(66446008)(7416002)(86362001)(83380400001)(8676002)(2906002)(33656002)(76116006)(5660300002)(66476007)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: O33brgqi6+54FfF12jfBCsszHnKwvuPOCVo2A7lTsftc5bYMeMjZwmU3LJyYg8fvVa2vjdgsU2wDNBqtDKU8SndTgwxX5E/DNfbKe/FDHL/X2Cah2fTeSgFz2JnopUxb487BpGSW1SfJwPgX9WR2FZqWfyWLmAhrNEYTONE4dgPJeY7r/nvtAP70PG/EYRSCgdMIzQfD6ZIftxhiAhnfixDFKUaEzMFW2hcdfHI3/Nuv1LxLT9gZvZ2VYtT0bB7DeTrT7o7z9aDfgOUNFnFEniPMLDHLL4K4SJQqCm6N1CPRSTRQVi1QSLr3rEYViRH9ON8IN/6WT4g5aKv7mOi2aBlybNAJ2gvBnDq7evczfiAhxKfYlrG78tEje5HkXhfhAua9PKtYBoDcv4U5b7K9/tJuKuDNBWrFM+rWBMq2WOAxWsPxNfVYHfkjJdtvgQcHt5gLUBZlblRznD4rYeu76zHU4nUekG5cBKLSyfSF5fQQJJ8RgpWw/sQ/FrOYM9E6mDYxN21csGB+OzTPd/OUDmzk1IL/z0xwi30p6jXGYzk0WNw6VzcglDQZjXI9lVdoJOvLKhrww77Jgih30nWFCBtFBDknb/KG7w3W2oaq5C+LHDj4vBLYeus2yVDl0pgqQV87sHcFHp0z3mcb88gpUw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32739f4-7b2b-40f3-029e-08d843435c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 06:53:05.8320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XO2yjdj4Ubcm/JIhzFuefpHzrSDGQ0Zb4yOJt3hBWqnA5pG/LuMz3n9lhJ84Jz3mtTIp/cmjI7LDbuuKeSuSrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2107
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Tuesday, August 18, 2020 2:36 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; tiwai@suse=
.de;
> broonie@kernel.org; gregkh@linuxfoundation.org; jank@cadence.com;
> srinivas.kandagatla@linaro.org; rander.wang@linux.intel.com;
> ranjani.sridharan@linux.intel.com; hui.wang@canonical.com; pierre-
> louis.bossart@linux.intel.com; Kale, Sanyog R <sanyog.r.kale@intel.com>; =
Lin,
> Mengdong <mengdong.lin@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH 1/2] soundwire: add definition for maximum number of
> ports
>=20
> On 18-08-20, 01:47, Bard Liao wrote:
> > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >
> > A Device may have at most 15 physical ports (DP0, DP1..DP14).
> >
> > Signed-off-by: Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> > Reviewed-by: Guennadi Liakhovetski
> > <guennadi.liakhovetski@linux.intel.com>
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > ---
> >  include/linux/soundwire/sdw.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/soundwire/sdw.h
> > b/include/linux/soundwire/sdw.h index 76052f12c9f7..0aa4c6af7554
> > 100644
> > --- a/include/linux/soundwire/sdw.h
> > +++ b/include/linux/soundwire/sdw.h
> > @@ -38,7 +38,8 @@ struct sdw_slave;
> >  #define SDW_FRAME_CTRL_BITS		48
> >  #define SDW_MAX_DEVICES			11
> >
> > -#define SDW_VALID_PORT_RANGE(n)		((n) <=3D 14 && (n) >=3D 1)
> > +#define SDW_MAX_PORTS			15
> > +#define SDW_VALID_PORT_RANGE(n)		((n) <
> SDW_MAX_PORTS && (n) >=3D 1)
>=20
> What is the use of this one if we are allocating all ports always, Also, =
I dont
> see it used in second patch?

It is used in drivers/soundwire/stream.c and drivers/soundwire/debugfs.c.

>=20
> >
> >  enum {
> >  	SDW_PORT_DIRN_SINK =3D 0,
> > --
> > 2.17.1
>=20
> --
> ~Vinod
