Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0364328068B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 842441AAC;
	Thu,  1 Oct 2020 20:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 842441AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601576910;
	bh=9Gx4c51XghbEprJaf/+IYM2pqaHmcrMbuXBy0KieovI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYWL1M6Q9+7fftAenxz22gHHMPsv+Lie33UTAnRSI7TGDo5j19ttzZp6Rmj1HUHDg
	 263kt7eMZbpQuGolh05UynOli8FAG5AvS/V/qKrvIYZmm1J6pmAG0V7kgPuawIjERu
	 QG53kzyhDl/ALBH/T+LG5WT4A2Y2QtqXhS4GnUC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE32EF800AB;
	Thu,  1 Oct 2020 20:26:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564F5F801F5; Thu,  1 Oct 2020 20:26:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE, SPF_PASS, URIBL_BLOCKED, URIBL_SBL,
 URIBL_SBL_A autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA8ADF800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA8ADF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Zh0zi0oa"
IronPort-SDR: KUPF291qAr6QKDPUjvqWirMvjJD5pQ0k+XJpBflP97nrCCgldAhGU6dBVmsVNUwja73/iVmRAP
 j99W+rjfgsKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="247542659"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="247542659"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:26:33 -0700
IronPort-SDR: NWiWi9FfhEJ91LmI01gZiayuRUpegP2kPICj6pZ+vlRyqaK7/++ysttUy1el8nxKQdVqp8a0Qk
 DSJbx8DA+bAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="294535534"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2020 11:26:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 11:26:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 11:26:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 11:26:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 11:26:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk7gDeVr+NVNDPK7UvNc6OeXO/RGNJ/uKwLvjvnDqnQYHLvIzi3CR6FVO1xBslIVdEBlfDLI5unWtRut+yLj2bAUOSJcrCopJZtGin2K3N0trzhvRiNNCWP6dvzxykWAc4y+fGglPFs6rvIdV4E53ML+bGw3Weq/pVkKaHbAC9RszM8/q57qGdq35JarKqeN3e7eyHI7bhgU6dOTkM42FrBfOCMoYpAYJYIa1DDEa/g0we4+LWiieBqCCWxipTgLELZZevnOorkjwHL1D79f+aC0emNahfrWdlYp3/sG/rOPKt/SmCsCZ+YPwCbtFVqJYTVyfLAmL4HOLzujhsdm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EadvvLl6+2O4mqOY+CO/pZJ7AbJLRb+kwRuhJM5tlI=;
 b=M7suyhCj3ft1sEjROM1IIBYMxubAn74aPIZaHpCa+lmN8cl4zV5b/8IbKffSeW6G6gywo61jpBOv7Iomo2O2Hzrqu4avCMfSeO8t/+llinKB+zCslqJervNEK9HmcA/+jArMuw3abpqoKtS28jtzry/ksEopuuXX9sGaWnt9CCXXrF/mWisDGSSic6CZMnMdZ7rfYMHkwSw4pNt4XSHV5hphD3QQOm00WxHMR3qCatW0zhVbazV4xsAOCNN8pKDb/QrYueN0lataJjmg3p2caWBjSiGqQgXSbrj0+s9puelmnDsmYWKEYIS82/XYRf2/6K8B4/GM6e6dY1O6QoqKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EadvvLl6+2O4mqOY+CO/pZJ7AbJLRb+kwRuhJM5tlI=;
 b=Zh0zi0oajX0T4JL4F1h1OlUt+yhyYsr/UCN38KN40TP6UlFymD0PXeY0z5uhlqfAMMNioVRsVpp+f+WBQIICmVT+j2CPcmZu+OGoeWEK+oqbiaovKayrFgaov/yXZF2WFhbjzHHRP+3JcBEF5PENuOsnQa424H17V2cgH8BXjX4=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB3947.namprd11.prod.outlook.com (2603:10b6:5:19f::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Thu, 1 Oct 2020 18:26:29 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 18:26:29 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 1/6] Add ancillary bus support
Thread-Topic: [PATCH 1/6] Add ancillary bus support
Thread-Index: AQHWl3zIjC3xuGt7f0KMPPjPnuvtoamClWkAgAAMhACAAAI1AIAAAkgAgAADxYCAAEeM0A==
Date: Thu, 1 Oct 2020 18:26:29 +0000
Message-ID: <DM6PR11MB284104012D31D2A3EBC3E7D7DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110120.GB1939744@kroah.com> <20201001114608.GX816047@nvidia.com>
 <20201001115402.GA2372306@kroah.com> <20201001120212.GZ816047@nvidia.com>
 <20201001121541.GB2375307@kroah.com>
In-Reply-To: <20201001121541.GB2375307@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70fe7894-2f1c-48a1-63ca-08d8663783e5
x-ms-traffictypediagnostic: DM6PR11MB3947:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3947204FC12D721B0F6DDF62DD300@DM6PR11MB3947.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: blbRSPtrpW0Ro4K0ggsaY9hLTWYCn0Qpf2+0pkC9VC8rrL+EiWINueW2Vu93fdIhNez5ZR5Xl5ZFZ7GXztKtE2mbvHvOc01NjLbNxC+sta6Lmv6VcOUaABD35/VaVWhS5wVpzYpm1l0dWZyw/H6N/r9FJLyapmhHFlGzaw9bsfstlDEmeEoXLyZu3xNvEm+knTxNNPZYi9FQnAH/2wopfHTdvszKoq2Knk1cXjKIcgWX3psVz4ZHjWKSU/vnEURuBRjawkzcwLSDPF7XI1JXjyoJKN0kYkNtYrctNr0bjQIwoxPGmYsRb3ntW2dhbWKSSeK+bZkq1jlqcN+Sy++uyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(4326008)(9686003)(7416002)(55016002)(66446008)(66946007)(86362001)(8676002)(316002)(66476007)(66556008)(5660300002)(64756008)(52536014)(8936002)(7696005)(83380400001)(26005)(54906003)(71200400001)(186003)(478600001)(76116006)(33656002)(6506007)(110136005)(53546011)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MWWSTZqL0p6TxMYjVPNXWVh7MxFytEoa+IRdu5BQbTl4w7h42Ccqd0WB+qv1jNKKt0B4aEAUJQ98ADwhBuz6sSUAYYXMbYI0uNbT7NqjkKsS+UmICkrBPjVtbrsCOShc21HPZpqv9EL5TbteXe3c47958H7rSee5L92q1esJI0QHR6ugz48Jynf1Wjv55aEdKC5jyI4pyEAAom5gY3ZxTnF7G9QH77Rd+JLhjd9MRcPG42NvcCMOQxahHsLLBjYPduWCnXtAe0YxeoR865mXHHSxWsHtySsAWY4KIljz9luPd0FenFsw+c8tgw3fyymyhpREBllF1O9m7bxfA7VVCjOguSDduR96ceM+6KbH94G5SddgAc3x0gaTqR8mZv8q4g8QeFHyZMxBUcAmCJDMSYqK0MtevY8I32aWAb/1lHxL6WecnfAR+Is82bU7eKWiOG1aKwK0nuD4Zl6UOm9UQJhG9Hq22EvtivpVyezJEtKpIjJ91j/XrvLctcnfmSQ2ZRCkCQpZ5V7SHYVmjym7fVUDqG9dDg21ucaaUN5fV/DXEBXyEItOy+6nCyitwTZsJsBw6kip20dirB7PsRI9ko4oI/y82uPu0D57SGhxUXKdVfA9wApEnyTf49+U+CQ7iciAJ9fYLS/Ag+JH37D/gg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fe7894-2f1c-48a1-63ca-08d8663783e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 18:26:29.4098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/09Gp6UNeCvlLlLOfcIWRLuxKJ0BGExbhYYcAUb2q2PtQGhLQHl9BUuNzkZ2uf344eJOm+kp3KHxoWwo0VKniRLH/ku45Rm47/ns1hZV5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3947
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Patil,
 Kiran" <kiran.patil@intel.com>, "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Saleem, Shiraz" <shiraz.saleem@intel.com>,
 Parav Pandit <parav@mellanox.com>
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
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Thursday, October 1, 2020 5:16 AM
> To: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Ertman, David M <david.m.ertman@intel.com>; alsa-devel@alsa-
> project.org; tiwai@suse.de; broonie@kernel.org; pierre-
> louis.bossart@linux.intel.com; Sridharan, Ranjani
> <ranjani.sridharan@intel.com>; parav@nvidia.com; Patil, Kiran
> <kiran.patil@intel.com>; Ranjani Sridharan
> <ranjani.sridharan@linux.intel.com>; Fred Oh <fred.oh@linux.intel.com>;
> Saleem, Shiraz <shiraz.saleem@intel.com>; Parav Pandit
> <parav@mellanox.com>; Williams, Dan J <dan.j.williams@intel.com>
> Subject: Re: [PATCH 1/6] Add ancillary bus support
>=20
> On Thu, Oct 01, 2020 at 09:02:12AM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 01, 2020 at 01:54:02PM +0200, Greg KH wrote:
> > > On Thu, Oct 01, 2020 at 08:46:08AM -0300, Jason Gunthorpe wrote:
> > > > On Thu, Oct 01, 2020 at 01:01:20PM +0200, Greg KH wrote:
> > > > > On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:
> > > > > > +int ancillary_device_initialize(struct ancillary_device *ancil=
dev)
> > > > > > +{
> > > > > > +	struct device *dev =3D &ancildev->dev;
> > > > > > +
> > > > > > +	dev->bus =3D &ancillary_bus_type;
> > > > > > +
> > > > > > +	if (WARN_ON(!dev->parent) || WARN_ON(!ancildev-
> >name) ||
> > > > > > +	    WARN_ON(!(dev->type && dev->type->release) && !dev-
> >release))
> > > > > > +		return -EINVAL;
> > > > >
> > > > > You have a lot of WARN_ON() calls in this patch.  That blows up
> anyone
> > > > > who runs with panic-on-warn, right?
> > > >
> > > > AFAIK this is the standard pattern to code a "can't happen"
> > > > assertion. Linus has been clear not to use BUG_ON, but to try and
> > > > recover. The WARN_ON directly points to the faulty driver so it can=
 be
> > > > fixed.
> > >
> > > Printing an error and returning an error value also does the same exa=
ct
> > > thing, the developer will not have a working system.
> > >
> > > Please don't abuse WARN_ON() for things that should just be normal
> error
> > > checking logic of api calls.
> >
> > This is not normal error checking, it is precondition
> > assertion. Something has gone badly wrong if it ever triggers.
> >
> > If you don't want to use WARN_ON for assertions then when should it be
> > used?
> >
> > pr_err is not the same thing, it doesn't trigger reports from fuzzers.
>=20
> fuzzers shouldn't be messing with device registration functions :)
>=20
> just do a normal pr_err() and all is fine, again, this is like any other
> in-kernel api that is trying to check for valid values being passed to
> it.

I will remove these for next version.

-DaveE

>=20
> thanks,
>=20
> grteg k-h
