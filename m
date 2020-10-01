Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65828082B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 21:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F5D1AC1;
	Thu,  1 Oct 2020 21:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F5D1AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601582191;
	bh=5ACodKJQ6P0oSnY57WYkCl44ahzSWLGPhcQFvnzIwjs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ifUvDUeZRM31flmlQg267H4W/Ux6O3PczBRnw12IbJZfVFDr+qDDWaYgUmIvOz1aY
	 IbnbNNODd9dAMVBWxPBDgb45QJmty5PaiVkADHaMn7KOVGm9kgWJcR76uiIVJtnTXq
	 JOuh+9ccQiLN4J0uZjFIm4B9lH/gY6GjufXiloxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46DC6F801DB;
	Thu,  1 Oct 2020 21:54:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07BAFF801F5; Thu,  1 Oct 2020 21:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97BC0F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 21:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BC0F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="DKJSwXZn"
IronPort-SDR: 8c/FIQ4R4YHdzbrmshjpOzkOJys285sDuljTVsXRqZclP4WffoT72rQazy1fIWxLTKPnvoG4X4
 WegK9Osd3rSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150455318"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="150455318"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 12:54:28 -0700
IronPort-SDR: A1A87Smdsv/uKpjdK7+9pIBwy00mglLh2b3IaB5Mn+3IoBfMI46jJs1K9jS8j0rEP6Tlt/w2mC
 sc8JqpeuXQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="385653406"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 01 Oct 2020 12:54:28 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 12:54:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 12:54:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 12:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8QlTJ8gpaI9/Fvivb5ywkvao4n4NffY4KUjmzYc+t1hf7P8Dsecg17J3rFycQjWD0JSTVU9mBTI8hb40QMmE5QzbHwRR0R8JbjR8OQEP13sjFbbojyoVIAE/LrG2DVhpDrqDf8lDSLxy3l8sb1LXXPX6tnLOyu0pnzh2zjhml2aZzzBZXzTXi4w0OqXNMNWjsMrl6YAnOyXb4pAq1bqJssjZ1JHmetyUGxHbggqX8950YtgVCJLn7Bm5tEdZmaaUuN2ulLskD/LHkUHgNm6feu0x73HeAOGd+WOxe0DHqmPys/qVvfUeb7uKhhnBeRbb1kyXumRjzIN/ek09f+H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9g+R+Uke1yH6tZAS83Fn3qcaaLL02qcyEep5Gl3qlU=;
 b=aHEqT+FCz+0xovFRgv7kj+3YeLRCJozLFTJfLDCM7VYpQrM7iYDln/gAB3mbWpx+PCHDvCx6DZxDm/4Tho/X36yWLM9EqgOZ3sVv2GoX8SLMxrJaeoO54cIdRXKMfU7bSS7/96/Sf1HvwSJSCci/oHp4iDf6B/YGuvndauRhenxxzr2IYQxM+92LS/wFkUyFxFBW1xBH1TABhKERDts3RxeRJ5WVaGVnEFuQEpunof4RDmp3YSjEMi9NaHu4vIYf7DmoyNmqXnn8XQJAN6xtc90Cg8/CU2wirdGvNV2xwm1mZ49386ZFvMKsqdIvQMefO05hIRqgNrOitlggr3SLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9g+R+Uke1yH6tZAS83Fn3qcaaLL02qcyEep5Gl3qlU=;
 b=DKJSwXZnPzr04QXvtmpMU4XWI2lvEjmmyewRfZ18MbTi0nsyIQV+tIhK6X5uoNlKNjRRadReJX6e2sqAtYc0QA5TJ9R0QaHG5S6/ZlYXiE1soTBcfqtWxx3JAEs2bPuavTpYDOGg/DFsmsmd1txYpmtE5mT63MxQllxKOVIEJLA=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Thu, 1 Oct 2020 19:54:26 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 19:54:26 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCs/MAgAAGNgCAABhvgIAADnmAgAAItACAACUyAIAAAllAgAAUqwCAAALEcA==
Date: Thu, 1 Oct 2020 19:54:26 +0000
Message-ID: <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk> <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk> <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk> <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001193846.GW6715@sirena.org.uk>
In-Reply-To: <20201001193846.GW6715@sirena.org.uk>
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
x-ms-office365-filtering-correlation-id: 3ea364d0-18e7-42de-7f39-08d86643cd4e
x-ms-traffictypediagnostic: DM6PR11MB4660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB46605CF177A0CA2EBE74B3C1DD300@DM6PR11MB4660.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: veNDOWpz4jwWs8qAErkhoqyjS5kGiqhAJrYCJkcf76eEc7r8OsWxAJg/r22QZsY3XpkK7xdQCY+wmKlDxw+M+L+ksTulIYZv8Q4atG4rE7UUHkee6U4A8amU+YzXsyeLxhO57TH1R2Ny5diQYqGR6iGNPGNA3qSWgQR4z4AiTmgk0BLEFYiJlV3tO849bQJo4ww97wx1U52eTtGhjCb93IL47JKobEAZrWH9ON1Rs3lnpkH0JWu552SDOr/OxgJt5L9bTgQU/Nq5deszPnLXpYlj2gvsI3ua9fpWQub8+FcgGYL3/zySMZEzT79oG9gwHD5KNg1PWdB0gu/gk3oyiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(66446008)(53546011)(66556008)(66946007)(66476007)(64756008)(55016002)(6506007)(8676002)(4326008)(186003)(26005)(71200400001)(76116006)(86362001)(478600001)(6916009)(83380400001)(52536014)(2906002)(9686003)(54906003)(8936002)(33656002)(7696005)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5Q8AumRV889ZX4Lrh2ObTtoT16gt5+Asl2O7BbSQ2FNcxe/mTQFCszLYHZJ0hl7AVX438JyHhzFlefKQj/U87GHI4IqG7VuaTkZ+ICMWHiquOQ81C6qtzvZ10yhqmw4Lp/h8vB9H73NP9F3bSFbRgBGMMLnzkU/kYuT5GFGJTcDUIQwCeSgdALy9F66CE+h0DagHak5aQmURyQ00+oe/kSC4vlywqBP4A4DyWRnT077AlwJ9PuuyaFd57/mWX7imGwvinlFNbxz5dKZON9f9sGtXAoWBlNFQr4K1iNg/pspuoXb4g04jWubQMDrWMtyIZMgMEU1uCV0gov666IdBMerFrNqgflZDF+2oEg3WNzmIIyCgnhFbQDUOJCksM2Fcj9hZinnyhfznvvX96FTJ8+5M/TJCgUyj+VphxBzr6FdCeY1U/BkKiyIdLfLuewJ/EWrjDv9CGIL6oYTtu3beveeRwAz68h+BS7GJ/8c3ka7Yo8BxXeVI0bu+yBCAq9SKbw8zhaXAaf3q2QgdnILZOSQRvBMtcUvdzy/TMCKL6IjTZ7SN5m45XHqVLtZBkLkSJ6KNZH12+Qvutfolrb8hJDfnSo7Ud6f0AudYqO7nkiBj6SVP7AdfGfsTG5+ZO/Mat8BZeSG0WASV6m9Le0q6Kw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea364d0-18e7-42de-7f39-08d86643cd4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 19:54:26.4601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Is7/iPeNDF02mg406AKVkQ4gORY3U9aGUdhiVE2pdPY25c14Jg5/H0DIBk42dnyCrzMGUg0tl5aaRJBj0C3ukyD5Iq4F/hOqY4EL9RQ0hM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
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



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, October 1, 2020 12:39 PM
> To: Ertman, David M <david.m.ertman@intel.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>; alsa-devel@alsa-project.org;
> tiwai@suse.de; pierre-louis.bossart@linux.intel.com; Sridharan, Ranjani
> <ranjani.sridharan@intel.com>; jgg@nvidia.com; parav@nvidia.com
> Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-clien=
t
> support
>=20
> On Thu, Oct 01, 2020 at 06:29:58PM +0000, Ertman, David M wrote:
>=20
> > > I would like to move those PCI MFDs away from that, and into this bus
> > > instead.
>=20
> > > If there needs to have a way to pass/share resources, great, let's ad=
d
> > > it, there's no objection from me.
>=20
> OK, if we can add resource passing then no huge problem from my end
> since there'd be no case where you couldn't use an ancillairy device.
> It's still a bit confusing but there's no cases where we're supposed to
> use an ancilliary device but it doesn't have required features.
>=20
> > The sharing of information is done by having the parent driver declare
> > the ancillary_device as an element in a parent_struct that also contain=
s a
> > pointer to the shared information.  This way, when the ancillary_driver
> > is probed, and a pointer to ancillary_device is passed, it can perform =
a
> > container_of on the ancillary_device and gain access to the shared data=
.
>=20
> > This keeps all requirements out of the ancillary bus code and it can be
> > as flexible as the implementer wants it to be.
>=20
> This means that every device has to reinvent the wheel for common
> resources like interrupts, including things like looking them up by name
> and so on.  That doesn't seem ideal.

It's a shared header file between the device and driver implementer.  If th=
ey
want to share a "struct irq_data *irq" as an element in  the shared data, t=
hat is
fine, but not everyone will need to include that.  This is why we left what=
 is shared
up to the implementer, so that we don't impose a debt on some other
implementation that doesn't need it.

I suppose it is not the end of the world adding elements to the definition =
of
struct ancillary_device, but what would be a "universal" element to add?
Where do you draw the line on what you allow into the bus internals?  The
overriding goal was to make a subsystem agnostic bus that doesn't impose
implementation specific details from any single subsystem.

-DaveE

-DaveE
