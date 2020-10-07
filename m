Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A842867FD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 21:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C45C816B8;
	Wed,  7 Oct 2020 21:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C45C816B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602097432;
	bh=kKbO3gw8eIhhGA1p0s2S3gvfg8L11ANj3YESKusg6Ro=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ya87fFIhYBrihRqL70zn6QpzHrCT3YBW4/46bTBLWlvcKlRULrdz8KLFO736cxjev
	 hyIMparLYSjbDavY4wdG6SqQStmiLXJ5fAn9Llx46opj0trPVqjcVG3xHRw9F3x56g
	 2kUM8WDAwou734ckfSHWlZryzTI/VKh9f7lvuvCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A35AF8016A;
	Wed,  7 Oct 2020 21:02:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C997EF80128; Wed,  7 Oct 2020 21:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A2EFF80090
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 21:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A2EFF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="tzCM/MRJ"
IronPort-SDR: n2n6tytAYb+okKnhBYKjATZeHvhsc2xVKQFq+Mbg8z1T+yHCzR1yPZrx9UBeMLfDoSFhhLtOLF
 tZK2cilPwKRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="152845455"
X-IronPort-AV: E=Sophos;i="5.77,348,1596524400"; d="scan'208";a="152845455"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 11:07:19 -0700
IronPort-SDR: xmDZwynQXHyAq4eX/jG3QiHc8BErQkNjemAWkHGqMPdz1sBkJ9HiZDvQ7r+k6hFgurkmnAES+l
 pDzmC4A+1dzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="297698931"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 07 Oct 2020 11:07:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 11:07:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 11:07:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Oct 2020 11:07:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 7 Oct 2020 11:07:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCeqevbija4woGfu/fKKPZBIZFAg5DDcdICRaykB8oJyOF2fxUiBeXC+Fc96NzlqcRReIBODZcdoC++LN8gpNqwwGPfCiI9R0CMsxV5KB4FiqhjJ5aUMFVJJvx9Mh54gupW9l5dpzTpMFEZEqK2v2ChiIGmd4PI1GvkRQ/OmpCSvMiqUx5oJhOkNRIfQYidceVxc+nBXXk7q1ql6Shziw1L75UcVsZ6pWmErFsJIXH26P9DHb9aZgjb3VF+GHRyRBtAFY7Hhgk4gXZWScYYbMC13+9dY84pMo/BqSyudimCqa3ij4ZLe33SnyE/J0umINkCFrObcx1PM3+SN8ywEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYeBXYG7TkA57/BLx92pgLLTpMiXYAvaCAQGRuL7zxA=;
 b=OmfZQ/caO49ghsYkhJM0dFSF24c47SbkYEx/Xn2RwkhMdhZ60LusFgnIBuTVLOCawJt28uvMjLoOWRdGkWmZ+fE+ji2O+Aa+sXxnMiyV3CDPMqHbP12gmmwvKs+yWhlg+asiadM/Lq5LM+tKwLi/zoN6Z66w9kMzN4F1lLp01lmfcr+/WPvrYQr8sRwq1ixxfbSwAqn6ebjX9qrjfvxRRy9meIsVPyXFzIT1lioiya8zN1gW+RWZXzy7t9cqTnu2giRqorHXAJsd3+BxP9HV8ORjmPWcYUr0dTtoFPACbYaTp8A7SE7ocKPhP9o4KJUBVsDxiul7rM1tpwb5K68o0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYeBXYG7TkA57/BLx92pgLLTpMiXYAvaCAQGRuL7zxA=;
 b=tzCM/MRJTZeq738RRee1ZK9Hm+ONxOOlk+pcjar38vfxx9DAn9i3frQ63zFXZ1uoplCHtuvFQ0qPxVtF1MmcReDKx4bIWje/fi63evRuEZIYX4OQrFXAqWz6CRV9v4qLeKfU/cHood2Yb75EDQbeS4/yGlXxSNx/ndsVcW+0PBM=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB3835.namprd11.prod.outlook.com (2603:10b6:5:139::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23; Wed, 7 Oct 2020 18:06:30 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 18:06:30 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v2 1/6] Add ancillary bus support
Thread-Topic: [PATCH v2 1/6] Add ancillary bus support
Thread-Index: AQHWm06cVdQZOfJAqUq6P9wAQIqk66mKKyCAgACGDICAAB03gIABoskg
Date: Wed, 7 Oct 2020 18:06:30 +0000
Message-ID: <DM6PR11MB2841C531FC27DB41E078C52BDD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
 <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
In-Reply-To: <20201006170241.GM1874917@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77bac927-18dd-4882-88b4-08d86aebb801
x-ms-traffictypediagnostic: DM6PR11MB3835:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3835CF4610C46C2B10FE4B1FDD0A0@DM6PR11MB3835.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gEYtARMwTiJbGcqDnoVel36XE1hlwRwkMHdfMOXQcnK4JUM6CWL4YhDjrf+XLnpcTmxJVL55YwDsU+tIg3jS7CIKtUZEuajye4p6QuUasqXGFWbDwaJ0RrUXo/hqKpfMCyW1hEeNKAtUj1LkzA5nY57xYcHXdTo+wbpp8OAWxrGyawVBbbPygNTH6hov+Zt8QbcuokWubEeHu+Lq8uldCHY2+g4iOKOUy2zRTuDPfzROXud/hidVvuGvDa9xABTlEQ+vL8lBqK+rwu5OB/ZVh7xEHKL68Mokk3TsaZoCBwROhqf60CSmQ4t0VhNUhwnbTcG43oCVqeDRTAXuZRgVIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(2906002)(186003)(76116006)(4326008)(71200400001)(7696005)(64756008)(66556008)(66946007)(5660300002)(66476007)(316002)(9686003)(66446008)(26005)(6506007)(54906003)(8936002)(55016002)(53546011)(52536014)(86362001)(7416002)(8676002)(83380400001)(33656002)(478600001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MFBywZcwUEjSnOkWzZHMu6gtUxp6c3xz2X2jrzjf/H7VC/sAtzzWWap3FtJPOinBDApcMVqCAqQByingIUtxJSH/nQZaF6bUoUh3hYWN/zWg6NQEa/HeLk+qKwxo9+mEXbJf3+P/j1FsL5TTlNVWBwFBGJ+uoIwazwWkdSBX7gg1hJyTbpzxtwoV2fTPhLIKbu8G6p6clZ52THPU4ev71TZXRC8AVvmgHbdVkpV0UCo+H3KqSpxhHHnB/Eo0vW6UKXEXUpIfkM4t7E9i37n25mFTrIpfIRcnz6RSd8s6R9C3IY2WiA1xbP6KMV45nebSDMm324Uk5nT6LV4fZBCcbgNhqWNDzZCrl2kufYGuqoBdbWMX4tv+iKSDRRxqJmM54IrwGwPKZVIkH515Md9BEz1UcPA5i+7mrmowOW8yCXy0DXzGREuUxBVPvJRs0QitSYG4mzfaw3IlaaHN/NkChUG6mpALZXuuIll/aRGreRuCx8PTNz0DvqfuAGV8372KIAKqZelHP4sXblMNo2wvEFmVV5cjxjq0qNqf+4nZf9G5mUFcHdfAmZakF1GRW+MoDSQrHmW8qE5/2UQh1hD3+ZaTYweoQrsfxiTyFbzy/eCQh7QKvBqQjx/nJRjz1vqjiPAs2SXoteDIzMVXja+zYw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bac927-18dd-4882-88b4-08d86aebb801
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 18:06:30.8603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dul88mk7UPVs+xwUEE7t2iMN9Dx3fMSp56YFdF0oeBzKrP8iVespRXx7JSB8JTj7TrznC9E1bLQtVpnb01jF+KU9BZp//VwiLWzengIXvOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3835
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "parav@mellanox.com" <parav@mellanox.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Saleem, 
 Shiraz" <shiraz.saleem@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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
> From: Leon Romanovsky <leon@kernel.org>
> Sent: Tuesday, October 6, 2020 10:03 AM
> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Ertman, David M <david.m.ertman@intel.com>; alsa-devel@alsa-
> project.org; parav@mellanox.com; tiwai@suse.de; netdev@vger.kernel.org;
> ranjani.sridharan@linux.intel.com; fred.oh@linux.intel.com; linux-
> rdma@vger.kernel.org; dledford@redhat.com; broonie@kernel.org;
> jgg@nvidia.com; gregkh@linuxfoundation.org; kuba@kernel.org; Williams,
> Dan J <dan.j.williams@intel.com>; Saleem, Shiraz
> <shiraz.saleem@intel.com>; davem@davemloft.net; Patil, Kiran
> <kiran.patil@intel.com>
> Subject: Re: [PATCH v2 1/6] Add ancillary bus support
>=20
> On Tue, Oct 06, 2020 at 10:18:07AM -0500, Pierre-Louis Bossart wrote:
> > Thanks for the review Leon.
> >
> > > > Add support for the Ancillary Bus, ancillary_device and ancillary_d=
river.
> > > > It enables drivers to create an ancillary_device and bind an
> > > > ancillary_driver to it.
> > >
> > > I was under impression that this name is going to be changed.
> >
> > It's part of the opens stated in the cover letter.
>=20
> ok, so what are the variants?
> system bus (sysbus), sbsystem bus (subbus), crossbus ?
>=20
> >
> > [...]
> >
> > > > +	const struct my_driver my_drv =3D {
> > > > +		.ancillary_drv =3D {
> > > > +			.driver =3D {
> > > > +				.name =3D "myancillarydrv",
> > >
> > > Why do we need to give control over driver name to the driver authors=
?
> > > It can be problematic if author puts name that already exists.
> >
> > Good point. When I used the ancillary_devices for my own SoundWire test=
,
> the
> > driver name didn't seem specifically meaningful but needed to be set to
> > something, what mattered was the id_table. Just thinking aloud, maybe w=
e
> can
> > add prefixing with KMOD_BUILD, as we've done already to avoid collision=
s
> > between device names?
>=20
> IMHO, it shouldn't be controlled by the drivers at all and need to have
> kernel module name hardwired. Users will use it later for various
> bind/unbind/autoprobe tricks and it will give predictability for them.
>=20
> >
> > [...]
> >
> > > > +int __ancillary_device_add(struct ancillary_device *ancildev, cons=
t
> char *modname)
> > > > +{
> > > > +	struct device *dev =3D &ancildev->dev;
> > > > +	int ret;
> > > > +
> > > > +	if (!modname) {
> > > > +		pr_err("ancillary device modname is NULL\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	ret =3D dev_set_name(dev, "%s.%s.%d", modname, ancildev->name,
> ancildev->id);
> > > > +	if (ret) {
> > > > +		pr_err("ancillary device dev_set_name failed: %d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret =3D device_add(dev);
> > > > +	if (ret)
> > > > +		dev_err(dev, "adding ancillary device failed!: %d\n", ret);
> > > > +
> > > > +	return ret;
> > > > +}
> > >
> > > Sorry, but this is very strange API that requires users to put
> > > internal call to "dev" that is buried inside "struct ancillary_device=
".
> > >
> > > For example in your next patch, you write this "put_device(&cdev-
> >ancildev.dev);"
> > >
> > > I'm pretty sure that the amount of bugs in error unwind will be
> > > astonishing, so if you are doing wrappers over core code, better do n=
ot
> > > pass complexity to the users.
> >
> > In initial reviews, there was pushback on adding wrappers that don't do
> > anything except for a pointer indirection.
> >
> > Others had concerns that the API wasn't balanced and blurring layers.
>=20
> Are you talking about internal review or public?
> If it is public, can I get a link to it?
>=20
> >
> > Both points have merits IMHO. Do we want wrappers for everything and
> > completely hide the low-level device?
>=20
> This API is partially obscures low level driver-core code and needs to
> provide clear and proper abstractions without need to remember about
> put_device. There is already _add() interface why don't you do
> put_device() in it?
>=20

The pushback Pierre is referring to was during our mid-tier internal review=
.  It was
primarily a concern of Parav as I recall, so he can speak to his reasoning.

What we originally had was a single API call (ancillary_device_register) th=
at started
with a call to device_initialize(), and every error path out of the functio=
n performed
a put_device().

Is this the model you have in mind?

-DaveE

> >
> > >
> > > > +EXPORT_SYMBOL_GPL(__ancillary_device_add);
> > > > +
> > > > +static int ancillary_probe_driver(struct device *dev)
> > > > +{
> > > > +	struct ancillary_driver *ancildrv =3D to_ancillary_drv(dev->drive=
r);
> > > > +	struct ancillary_device *ancildev =3D to_ancillary_dev(dev);
> > > > +	int ret;
> > > > +
> > > > +	ret =3D dev_pm_domain_attach(dev, true);
> > > > +	if (ret) {
> > > > +		dev_warn(dev, "Failed to attach to PM Domain : %d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret =3D ancildrv->probe(ancildev, ancillary_match_id(ancildrv-
> >id_table, ancildev));
> > >
> > > I don't think that you need to call ->probe() if ancillary_match_id()
> > > returned NULL and probably that check should be done before
> > > dev_pm_domain_attach().
> >
> > we'll look into this.
> >
> > >
> > > > +	if (ret)
> > > > +		dev_pm_domain_detach(dev, true);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int ancillary_remove_driver(struct device *dev)
> > > > +{
> > > > +	struct ancillary_driver *ancildrv =3D to_ancillary_drv(dev->drive=
r);
> > > > +	struct ancillary_device *ancildev =3D to_ancillary_dev(dev);
> > > > +	int ret;
> > > > +
> > > > +	ret =3D ancildrv->remove(ancildev);
> > > > +	dev_pm_domain_detach(dev, true);
> > > > +
> > > > +	return ret;
> > >
> > > You returned an error to user and detached from PM, what will user do
> > > with this information? Should user ignore it? retry?
> >
> > That comment was also provided in earlier reviews. In practice the erro=
r is
> > typically ignored so there was a suggestion to move the return type to =
void,
> > that could be done if this was desired by the majority.
>=20
> +1 from me.
>=20
> >
> > [...]
> >
> > > > diff --git a/include/linux/mod_devicetable.h
> b/include/linux/mod_devicetable.h
> > > > index 5b08a473cdba..7d596dc30833 100644
> > > > --- a/include/linux/mod_devicetable.h
> > > > +++ b/include/linux/mod_devicetable.h
> > > > @@ -838,4 +838,12 @@ struct mhi_device_id {
> > > >   	kernel_ulong_t driver_data;
> > > >   };
> > > >
> > > > +#define ANCILLARY_NAME_SIZE 32
> > > > +#define ANCILLARY_MODULE_PREFIX "ancillary:"
> > > > +
> > > > +struct ancillary_device_id {
> > > > +	char name[ANCILLARY_NAME_SIZE];
> > >
> > > I hope that this be enough.
> >
> > Are you suggesting a different value to allow for a longer string?
>=20
> I have no idea, but worried that there were no checks at all if name is
> more than 32. Maybe compiler warn about it?
>=20
> Thanks
