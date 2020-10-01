Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09958280356
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 17:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE061616;
	Thu,  1 Oct 2020 17:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE061616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601567868;
	bh=jyy2Iese8XhGYNIjTHsFMjrnraYPrHh8gxVjdYOAmjw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TgeXzrXBkI71AhWpLGvDkj7lZ3Br6ncbyQMfSftj9OfZl3s4LDOMBB6c1DgOPiE/s
	 l6rzsH5EypU6Vp427cVOWe+gMr6QOSYiKWpYrG4D5jlXHYpQ330u3XiK7S9g3P/iby
	 3M8RP68pCDuHUCVxshGBVPag0Wb7qUJ2lGuaWqv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFDFF802DD;
	Thu,  1 Oct 2020 17:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02529F802DC; Thu,  1 Oct 2020 17:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9863DF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 17:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9863DF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="rMZt6e7e"
IronPort-SDR: 8DGTq/u2WDOV8Q49iFcRuLahQKxCOzzX9uFuEHZaeeY9T/DOeyqVAFLP1WlO2KFj1qjjEVMI1Z
 ME9igceaqYIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="247500819"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="247500819"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 08:55:48 -0700
IronPort-SDR: cvGV9CuB8Klukyx3c+QtvHx/2ibRdxvaYeza4ZufHip8f8GhabhDMPk+zfuwuA78dvnaut0Uqm
 h4hQr6hCu1WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="339598593"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2020 08:55:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 08:55:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 08:55:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 08:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLYvEhRQJw712utJiXAfi8Jln96VhNJ+fMr1WBgzl05/UiNaT4WrAJ8OH1I7dY4iJ5kO3ogAIgc+LH0VRRKgdMykjhpa/hAnCzT+isyGEPALurPxM7pBej8ICWyXGpZzqi+oK+9HO9qm62qwhyxxvSiqUuQ0Q7CT0r0tqWELg53iI4kJCdTLfMqgDsxCzLwxrX2vwkrE5Ca8Abd84gquv7OyDprlF7/6dLvlQU3WPgSskFsVKi2R7rnNOwC/HYAngWcRPlYlZbahX89ryIh/teCM81Nc3yL8BKogsGvUmE564wQwGIuGp2QJNOXq4BwfZKZsTtKi2dBS3utfJxxWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBilNt1yRWms+Or/+UlRSPY3rlr9KX3R6XTNK6wVk6I=;
 b=AZeZL+mfmQyehnjRqi04eVDWY2Tv1KHE/6SjE3TetA2AKrzS6B0Mq+suIPKXPfQf+sXva/uMSvdV+R+NQMnGORQB55Mf+loubsaX5w/U1CxsdkLeUjOgqtQdbEade8tZivJ94ixEjpcq3eTjklZUAUSZXU2upO9/+Kp0YLvOfVjpVDXQqZJhiCKu744gaj7Ui7QSVN/u2l5f2OARFfGIiKt6DbFfitY7wCdY41ZgqvvHYKmtaVS0lt27sAlmiH5p+Bq9cNtkWfH9yCBs/5WXPVlRmhTqhLQ95m9ECTKmeH0gaeSayoAy3T7twWvKpPMY9EOp8DMCjyZ9EbhblJjAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBilNt1yRWms+Or/+UlRSPY3rlr9KX3R6XTNK6wVk6I=;
 b=rMZt6e7eTasiYxFGKOovwRpvIcrYpnPpIJHH+m9HxY3pklMws0jqO90319+gt1D/Mu1CS1Knh1D6ppryI3WLl5ntFxxMSCv0XhGhOc9ZgdGj9ekVxwIkpSSkfO/Pn55bqqpJyqwsf5YsWMqMBhp4ioSvLGMxFrlIujWNbl6JQw0=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM5PR1101MB2283.namprd11.prod.outlook.com (2603:10b6:4:50::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.23; Thu, 1 Oct 2020 15:55:46 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 15:55:46 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCVeiAgACRj3A=
Date: Thu, 1 Oct 2020 15:55:46 +0000
Message-ID: <DM6PR11MB2841D2BF0E467EF34625BCF7DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
In-Reply-To: <20201001071403.GC31191@kroah.com>
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
x-ms-office365-filtering-correlation-id: 85ae080c-d098-494b-e165-08d8662275b1
x-ms-traffictypediagnostic: DM5PR1101MB2283:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB22837A01013BF9B37AC284E1DD300@DM5PR1101MB2283.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GAxc6uFT7gAy2XkyXXAAYFVKHu8TNSd1dDTzseNb8GYGABpSVd5NVzS7cpLJJpIMavzCHfmVUhdQtAN4XjwA7/Tzr7wxxvbIYp4VGi5qn7ZbW/baqoKpWLNg5qQvFkBblCzvHxRnLdDoGUrr5DNBLLkKdgNAdNhcWTDbdi2N982kmrmXBCS6S+lISSXLfsaZXC7Gm5eZgLlqbgJrI4U7f0OlO+EvunaTCH/7pKdDkKJ8KIMTSP6dtlXbCzyN2+dC4/Mri6Rvq+A+NDlFLwRPAZWurXikeQF2c7np042X2X6kzfiC5skwzU3Sc2DZdDNcpGZzHl9t4qnzdVOUkmbTPdE+Em3kM1Dx8Bu2k2O/evNBZUh7ebpyp/4nw78Lt2T9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(53546011)(186003)(6506007)(478600001)(2906002)(26005)(9686003)(55016002)(6916009)(8676002)(8936002)(5660300002)(4326008)(7696005)(33656002)(71200400001)(83380400001)(66446008)(76116006)(64756008)(66946007)(66476007)(52536014)(86362001)(66556008)(54906003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +fVtoDleZYC1epJUkbciRXQTmqVBzLLfPl50uOtBYoFieBra1xe4/fkaPTqOFpMfns+rO7OQK3ry53QLIBQ4TajtSFbZd7TGSTrm/xRijKqcFKlQJOGQvKzcuzjfcYcxHLE3lUC6oFg/ovTdLZjc/sWo9zInMd11XpWJKO8vMJ2ROrnGtRaAIHTwGm/7EbSyHnkEeteOyRo5kGnQb78H9sYDocw3EiA96SJAzz5uTM9H/R9sxW6lOmUmEpcRsaN2taWzHQeTpoFe1b/NUg5AZ/qf4AKdhOV4hY6kmTKAj8CsxM2nmcpIKbVtvyAxJscO9Op4JDc1Axln98FgCwEB3wbAo4cjFr/rU0bh/R2QUmIGR6GoX3cRFvjTbcqNIaurbfjToCNJPNlDMiMouKmGaS03QkeTDniRLaWOqyI10hgObPZhwi7Z/edKqWqAJgjXZazWqBqrur9161DfhOAa65duqHZF5X4JJIqQJDGuMYxDAYeARnoh0iccK/FxnTPtDuy6L3KJvCBwx92TB9dTr+UW2kzTJtGLPJlVHHHUmJVKS/GhBuLJzady+K66XGjykyCnaAiSRuqCgzVZRv85sx4DZi6U0P/bo2dW8XyohyKJyVnQ5BMqmSJCrCI2gwd3ZXCl/KAj1YzyLRW993aKkQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ae080c-d098-494b-e165-08d8662275b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 15:55:46.0989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6qg8FlSanMHc2OtFqUXTO5ggISMp0WTAr6Qb+sEsRIOVaKuSPcXF+U9FCngAkzryIoA0RsQCnWRH+jNC5K+snARxJxLwe9rxnoCUXdODoic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2283
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

I have also sent this patch set to netdev and linux-rdma mailing lists.

-DaveE

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Thursday, October 1, 2020 12:14 AM
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
> > The ancillary bus (then known as virtual bus) was originally submitted
> > along with implementation code for the ice driver and irdma drive,
> > causing the complication of also having dependencies in the rdma tree.
> > This new submission is utilizing an ancillary bus consumer in only the
> > sound driver tree to create the initial implementation and a single
> > user.
>=20
> So this will not work for the ice driver and/or irdma drivers?  It would
> be great to see how they work for this as well as getting those
> maintainers to review and sign off on this implementation as well.
> Don't ignore those developers, that's a bit "odd", don't you think?
>=20
> To drop them from the review process is actually kind of rude, what
> happens if this gets merged without their input?
>=20
> And the name, why was it changed and what does it mean?  For non-native
> english speakers this is going to be rough, given that I as a native
> english speaker had to go look up the word in a dictionary to fully
> understand what you are trying to do with that name.
>=20
> Naming is hard, but I think this name is really hard to explain and
> understand, don't you think?
>=20
> thanks,
>=20
> greg k-h
