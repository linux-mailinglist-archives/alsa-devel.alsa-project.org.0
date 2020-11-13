Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21D2B1F9E
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 17:09:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0619718A5;
	Fri, 13 Nov 2020 17:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0619718A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605283754;
	bh=BTiAAgkDq8Q3V/TX95vYeQ6xDjP5aHabZh0u+uREDKU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLnDYBpzfsCQTFAOlSWIbmbTyU2piEp1whatxOfyUbxLDGJU3Z7b3ytK6ta0Hxmsi
	 PjjsnxA6kXQFcK2kNCxGhq2zt/m5OS1Al8cEH7MA2SrBKIJA/2cQy5n1mRQzoHmHUd
	 Bv0057y7gECMx6q1ICryiBqALRxfeZRamHiElzLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F1D9F8022D;
	Fri, 13 Nov 2020 17:08:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93BE5F801F5; Fri, 13 Nov 2020 17:08:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E694F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 17:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E694F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="hqD670aT"
IronPort-SDR: pNWuaqSUi8NIACUID+uqBozdfOC2WLCXen6awDv+aYhZaQce/sfCjo0qymQt97LhK7qHvCmM4d
 VmyU3Xf7VhbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="234650345"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="234650345"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:08:07 -0800
IronPort-SDR: 6OejzJeKk6s2goVnmR/9yr4iKZQqFi7Wzm+goejrMVGzjkeJIiqOM3uUGqKkWApcPxU2IZ/v2U
 VgJ12ILGiWgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="328913308"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 13 Nov 2020 08:08:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 08:08:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 08:08:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 13 Nov 2020 08:08:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 13 Nov 2020 08:08:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLZewTeHWLHtMbmkS9zdninNWpgjij0ABjAmIYf/wcz+z1sCJ2mEwoxlQkA7fqRjzr0r+lDC9DF4oTEdbBuYJJlma16vbKVkFalYaKMfAL428rlWHg2YmNNCtnxQxDLyYosSIA6/HC/wU82B+6K1xrB/SegXsxtGRptw/71l4QlNeY7Sronkgi3ul/fseQ18241AxSgYtJPcMunT0dY8TzbhNZEEytaBgjq8BuYHToUxCEI58wrH5Q1c2PGzqGH5KdJCkZ/ktPLRfdc3Q66HbPe0LJEneF0mwEfDRLyXqh2kjAZnlSK3dmqVktzAkl+K1rgqwfHqzLekqfGtbRmzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBmRsXVN1ggjWL74zFyqZ8B9egYdOhn+E+KcNDPqIe0=;
 b=Yw4FUYLYo/G/cWcOGHSKDtASIMNQ4GORvusQnhcibnDuSWUVH++azgUmcluPhDq+gxgaJakWeMnAAVUnaUUapDxqkfHfcaxgR6Zg8/7cw+xLUGBIWROpx0O9/d2dLenHmgQqFUMcmzaQF8FkjF6mCjHL/58QOn+vzUtfyS+4vCM9ARSjh57GxlibsYEtYrJgyyimBFzj9YGF6fkT9F2GMkOfaE20FR+4h+f3rBjljmk+Wj6jX5r6xq8jNctE4nOWu2j7sWq7JR9iYzfiTAwIhVTYatUG9lmSFJEktDsLiIE6Q6c5oEL1/paPVz1XMymy6T1ThULOUfGLrr04OGbZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBmRsXVN1ggjWL74zFyqZ8B9egYdOhn+E+KcNDPqIe0=;
 b=hqD670aTnWS8qzf//zOtFDj1YMC5jmCxylyN7h8Ru+ybwPDyb3JpkPeFhIs53dpVL+npwvCNRbW2VmJW5U7xPiYC25J61yx4Yx1DtCeoBSrHXEmLHEPdpWfrd6rOewJTQqvgpyz6f98VmkgjyQs1ESmFkDGlWr8u7iITphfXxzM=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM5PR1101MB2283.namprd11.prod.outlook.com (2603:10b6:4:50::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Fri, 13 Nov 2020 16:07:57 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 16:07:57 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 01/10] Add auxiliary bus support
Thread-Topic: [PATCH v3 01/10] Add auxiliary bus support
Thread-Index: AQHWqNRxbABQ//8l1UOfD+CnDPwsEKnGV6wAgAAEB9A=
Date: Fri, 13 Nov 2020 16:07:57 +0000
Message-ID: <DM6PR11MB284160D4E69D9C7801A6B1C2DDE60@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <X66rMg1lNJq+W/cp@kroah.com>
In-Reply-To: <X66rMg1lNJq+W/cp@kroah.com>
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
x-ms-office365-filtering-correlation-id: 4b69a0aa-eca0-4ed1-f185-08d887ee4942
x-ms-traffictypediagnostic: DM5PR1101MB2283:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB22838A8ACD3D7F687AF5A058DDE60@DM5PR1101MB2283.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0DzdE0fBbnLG0cQ/KDiIM6IkPXtfn27Yh3c5CPWHlkIA+WcGskm9D4RjfbgXm830kd2GFkLT+koMZG4E9PUfNGXutevVD+WKGHtKZWkitanyfxd/gSJMYN0tMkfJU3DYnZMbPVS/aRIO9w9MX3d5RqmwoD8mOcuGuTAAn3SYl7Ghg3bHgHLzQZTt/mzqW3h9qR+A19aCnyDJVpKITI2I8mEpAr/4rmAl7El7mQ5FqEvAe/e5DEBVbSyBMh2FGixw5if5QnfnB5GvXv4qI4mUfYcnCgRwT87ogM76mHxI/xWEB664oEDjphG83aM4pMrK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(186003)(2906002)(7416002)(71200400001)(86362001)(8676002)(54906003)(6916009)(9686003)(52536014)(8936002)(66946007)(316002)(33656002)(7696005)(6506007)(66446008)(478600001)(83380400001)(55016002)(66476007)(64756008)(76116006)(5660300002)(26005)(4326008)(66556008)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: sXab5IRFE0uiY8VbN1XG6YtTFVOB7MtCTleN8z7bcXwPfAD0SMI8REzyj5kECxm+2lrIAYQ6Gi2OMRBCJaKhpsdu6NnH6eczDduQCMtRZ71jvJAXptyzXafLdnZWMIcD+6dz/6EXN9L9l0pVi3Vqe6vf9ydMFGUUmlwJfupaCxl5fj92VD3EjyNpSaBfR4x8EWlaGvFpMJU5xI4/3pbGmGfRb5FoLY2woGbCCMVVL/exVWnV8stq5JlfVsF3hzwniDM+qebrw93P1jyuv4nxKPp7lBcUgWrP2/IpdUFr1r0Rc1+1RZc0K8Ofm5/CmdeN6fBOUoJWZ7uI8dE1/lhR+gGd/wV6TjA/iynzy7T0j/WsnsHFE4YO1ulTGXNTC/iLlkGYuroAEa7plcls0tu/IOGPKQ6LUFxLawTvyBSqB+O3kveHZpmXHF52n1oHJ7oYI2tML7iADWA0LKsaZVX8i+32MCwS7VTAsST4bRDhgZPAmfK0qXdvvS0KZSXLa+rEKAmMMc+Yyn6o5NPdI8E4R3ST2K5BDkt58AX2qUthtmY0x0Ag2jYDVQgIdO/LW//0pz4i1x/WQiTJWGTYuQ1Wmpg/GV3HF/NyrECzNooPmyIZ93cGH9+2hMobyhWTzMRVyg4dzjprwF4QsizkvnwUwzLBolVZsxKO6pcsEG49BXtbBPWm1ij6LZKa/E9GccMRKrO3sk6bu+RfxnQrkASmLkLeSVEpEQ+B/f+aUkHoOorQlcKaVHIGpI5MKT86reSuCfW82d+D+KuiHnRFm3ZHbirkxte+wVD39gOjygglRUTJd7f5dSn6zWT8fx3cfMRfgb5eGpdBZfgtFdntHX1CIU480AhPLoMz5IFH3QjiADlj9HIIudlwOQ6Egnrdf/a56784soChQgrP2J8eHEUvrw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b69a0aa-eca0-4ed1-f185-08d887ee4942
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 16:07:57.2386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qsParG7YjwMjWm43s4xoTCXnH8tlRNULA9mkNJfPSMBs2MH6ZlXu7jXnHj2wwK3suH7r+kns/kpuSirVsCXQNRRRfrLFDcN4vSul9OrlyOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2283
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "parav@mellanox.com" <parav@mellanox.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Saleem, Shiraz" <shiraz.saleem@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>
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
> Sent: Friday, November 13, 2020 7:50 AM
> To: Ertman, David M <david.m.ertman@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; broonie@kernel.org; linux=
-
> rdma@vger.kernel.org; jgg@nvidia.com; dledford@redhat.com;
> netdev@vger.kernel.org; davem@davemloft.net; kuba@kernel.org;
> ranjani.sridharan@linux.intel.com; pierre-louis.bossart@linux.intel.com;
> fred.oh@linux.intel.com; parav@mellanox.com; Saleem, Shiraz
> <shiraz.saleem@intel.com>; Williams, Dan J <dan.j.williams@intel.com>;
> Patil, Kiran <kiran.patil@intel.com>; linux-kernel@vger.kernel.org;
> leonro@nvidia.com
> Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
>=20
> On Thu, Oct 22, 2020 at 05:33:29PM -0700, Dave Ertman wrote:
> > Add support for the Auxiliary Bus, auxiliary_device and auxiliary_drive=
r.
> > It enables drivers to create an auxiliary_device and bind an
> > auxiliary_driver to it.
> >
> > The bus supports probe/remove shutdown and suspend/resume callbacks.
> > Each auxiliary_device has a unique string based id; driver binds to
> > an auxiliary_device based on this id through the bus.
> >
> > Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> > Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> > Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > Co-developed-by: Leon Romanovsky <leonro@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> > Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> > Reviewed-by: Parav Pandit <parav@mellanox.com>
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > ---
>=20
> Is this really the "latest" version of this patch submission?
>=20
> I see a number of comments on it already, have you sent out a newer one,
> or is this the same one that the mlx5 driver conversion was done on top
> of?
>=20
> thanks,
>=20
> greg k-h

V3 is the latest sent so far.  There was a suggestion that v3 might be merg=
ed and
the documentation changes could be in a follow up patch.  I have those chan=
ges done
and ready though, so no reason not to merge them in and do a resend.

Please expect v4 in just a little while.

Thanks,
-DaveE
