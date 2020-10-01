Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB97280350
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 17:57:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE311902;
	Thu,  1 Oct 2020 17:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE311902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601567828;
	bh=kyClvA3J2RK6BzlmunTEFGiInDguhugcUyuXG22NeAg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EyROZN0ycJU+1UHJoOWfKBA+gMH6l4tu+96Pz2QCHLt5QQVHnpTOiISdn3UW8Qejz
	 grk2JoHjwgZsCg5IybZaNFaSR6/a6CalwXXVlGAgE9/1ATvIEXq4wr23aOFd1fM0V5
	 pDOdaRQT/8B4wlgB2O/YhlkO2AYaw3KcZ8G/T4Gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D0DDF8020C;
	Thu,  1 Oct 2020 17:55:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41268F801F5; Thu,  1 Oct 2020 17:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA60FF800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 17:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA60FF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="PbjO7QfA"
IronPort-SDR: 6AjESpH25jecl0B9DljOgP3gy+LBR1DEMOJwm5RiQT6PJup9K+mqe3VTdJw12IqVS69kl4Rbms
 isw/c5dod0AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="224379926"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="224379926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 08:55:02 -0700
IronPort-SDR: koCuoZwc2PsEEOYlkHcITM+4jK0YbKDn5hrtMh3l5Fiw4TNuKFRD7oNXnPJMTROL2ygwErwA4Y
 t8RHUzplr53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="339598395"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2020 08:55:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 08:55:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 08:54:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 08:54:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 08:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i43IWz4kw0FNftxQgDNG57DSZySPWHHMsrHepZQ8GYq96DlXiVGnNvuWb7uvGGxytp3xSD5oCpB9xkwEgA1kJXz7kw6lXCiRIgm9tSgt9ZDvdTSrKov0iisaxicDnksbRPmyjmEecfqBMc81x6zoUSlmhL9DXwjSga3tXzC7ZPzIh6EP6lvStprp2B1d7EeBsiRZBljDixuo5/SNNwdkDTxx51TtLLEhUzYb7cFW9GrWykmosUpS8zV6V4ecRc8dBR9XhSk6J8t1FGzUcF5pz1ToyNDKHAsNX7Y5fCnIK2u0Igk46AWIcmGPtXot8latP2xXG6tSQQlhg88iqlWykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtOHBnfLsWPI/9lrVUNDvdAzls5ngk3pA0T7ZagWafI=;
 b=n9TD6xry6EPFjqgkiou3fEiicVKjJBXqfTm3F4BxSKo5iDakl/eNgrYVaH4kNdJlaQOE9A3BLny04MEev2r5jk2ookYHXdmmWhOY1JGHE5Hjmq7frl1PFv7oJackrDHUaKbHle/BYGuU/DygxkBELc8fuuqxADPXJQF1jdSo9iTwZf/W340uQYKfnBWtN+PCLSLxy6pg3JXryaoEql1tjFY3mBfKIMs++HopWiB1k7tWokQNmppZ1uGfujSoISMxQ7jky5eRdbcwJXyr/AkbPcEy+anN1bxKR0U94pAFdRK7KharCRLUEiZm/nkqw/GlWUMcBfkkjYBZZSU1mGAH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtOHBnfLsWPI/9lrVUNDvdAzls5ngk3pA0T7ZagWafI=;
 b=PbjO7QfA0mJMTCP/9P1VaFv/SLiDp3dV/XE+Y3VFAtVplyCLuxajsmn1bRS8jQYpdXB/MuR12i/HS3rjMsFDZti3zvH/uYZ9loNDtWYwHugsvcrKqJPZr49I82uzngu/j6X+tlBX6iQK3kEB1rkQJmUQBpiWFWiyCGx8jZ+Fl3k=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM5PR11MB0059.namprd11.prod.outlook.com (2603:10b6:4:62::37) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15; Thu, 1 Oct 2020 15:54:57 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 15:54:57 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCQLuAgACmQsA=
Date: Thu, 1 Oct 2020 15:54:57 +0000
Message-ID: <DM6PR11MB28415FF6A7BDAA4E2D3F123FDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001055815.GA25976@kroah.com>
In-Reply-To: <20201001055815.GA25976@kroah.com>
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
x-ms-office365-filtering-correlation-id: 9331a26e-ae71-495c-06a0-08d866225896
x-ms-traffictypediagnostic: DM5PR11MB0059:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0059E3446DD2D74AF749C071DD300@DM5PR11MB0059.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xh1+qYjq36od/4IRSszUeHnROLFDHYhw/JygOqzH7KCL8aPLxCf1Oc7Sl2uEHV46m0si5B8DLKm9VT/EhTvG0AzeZaI70PULl8NoUuHM95dbGHGj+KrMXaS17mhgAX7xx4sZ7nYnTNzTS5WV10oETsQJVrlef8yDZSrRElQhp6HjCXYR+wZKVQ4mhpLvIoOvnFuM+jN2qkqn2cx4roHLSgiNV6anuv5Q5Wms1Tpxfn7msZOLEMingZGhN/rsR5KTCk2wbF24bXW1IKrp4rfVJ5AQVYEzS4VKmhFWBnkLR6couDTHzScAoFKWq5uYoeAxJ7EIxgL5kZw6RJI8/dSAhXIADqlYUoQTzLvbWwIquJiZ3EOHOktQRm+6LcDFyzZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(6916009)(7696005)(86362001)(53546011)(316002)(186003)(52536014)(9686003)(8936002)(478600001)(5660300002)(4326008)(83380400001)(2906002)(66446008)(66476007)(4744005)(64756008)(33656002)(71200400001)(76116006)(66946007)(26005)(8676002)(54906003)(66556008)(6506007)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9Ki4pku46n6t67aG8JELyp2vY8qmO3JNq2WcQH8R9PGoeX+MVSoQOkXKO4kQRe+lTrtCm70Z71YQiPlm3IkHApxmancJFVapnWwpiidZ7pdWb8ZCFdgBn32Amm8rl+yYXjC5bQcn+a5ZwomfW8HYSNRvdsmJ7mINZy1FDC+fanpqWdPIXeHsC5vP2Ejf3BgvOk75uA/qgu8Vyt8sgx7zgSQ74uOvW3dabihqYsMNiooHMsMdEHbVz+U6AzkXIxyXSNGIFDOUMtv91LDRH9Lx9rY25xUdfsx2a28drMyBLvUtI4bk93pJGhVtMHmqYNOsAZcCiOgsfjvJDA1OKM+jVt8VxjFmFb0KniIVRAoPkxiG7w2KLUh4Gl++Gv4gyefHRwxiOV0dc08OAGA06wdHWgDishGt9rX8J7h4QOZdq7ULZU7hBJqP9pWOsZ9dj2Ard7SjUSOBF1n2iI5vz+GAb/xLF4nRnhzNvwBF6Nk5uD6k2wlx0kYU7LOxBRSc+kn9NaDfDvUodA0O98IZ0oyfsnmeG04bGNqIIBrx3yFiLK/vL/nDQGFW8wrl8u6tsauMFSa5q74ojzSrg28QPQYv05ac7Rg7qQLvPMc/u9z2qKItE15RJj8/oWPiPy3hr0UmgKFATZ3E5jnsOlQfVkEe9g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9331a26e-ae71-495c-06a0-08d866225896
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 15:54:57.2504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +THrdSa8R/5H5iaSBJ7MQCjaIjhTpgvCXU0a/HJsliggTSxu8Ep0ihhpckkAlzw+XAXj0FeMIZS9blOQw81kNUKQRP/1I6KFlgxWIdu5Gvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0059
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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

Sorry about the two copies.  That was my fault.  On my first send
my subscription to alsa-devel had not gone through and I forgot
to suppress-cc on the second send.

-DaveE

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Wednesday, September 30, 2020 10:58 PM
> To: Ertman, David M <david.m.ertman@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; broonie@kernel.org; pierr=
e-
> louis.bossart@linux.intel.com; Sridharan, Ranjani
> <ranjani.sridharan@intel.com>; jgg@nvidia.com; parav@nvidia.com
> Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-clien=
t
> support
>=20
> On Wed, Sep 30, 2020 at 03:50:45PM -0700, Dave Ertman wrote:
> > Brief history of Ancillary Bus
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>=20
> <snip>
>=20
> Did you send 2 copies of this?  Which one is the "correct" one to
> review?
>=20
> confused,
>=20
> greg k-h
