Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAD23A721
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 15:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 851881667;
	Mon,  3 Aug 2020 15:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 851881667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596459755;
	bh=zwMgakNC/7/KXzH6YAYtYB4dExE+qxytAV1ODaAwveI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kICCCJRgh/yZp+YWtyBrzeAgH7VyuODhADe2c9GDvpgkzTZG6hHaQiE1QPDyZsi9y
	 g2eBiDApJYimSficB2awlxgRv9P7s9zdg8fOnvXcIjThLgSlZbZwClOD70jumhEE3V
	 mek9Ep7jlQZzkgeuxKEuXn9/Hi3/UdbBMXMvpXmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17EFF80234;
	Mon,  3 Aug 2020 15:00:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90D94F80218; Mon,  3 Aug 2020 15:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15195F800BD
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 15:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15195F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="NZgjk/+n"
IronPort-SDR: xZ2i+xWWtNWMhezuPdQdKZwc7JTkSMNOm1Ux5ZV84c7yOLsbe4AiHDRK4tquVIJRg8x9CKkRqP
 mNTIgiZ23/qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="132152172"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="132152172"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 06:00:37 -0700
IronPort-SDR: PnScKTBZZYas2NTkD0AdOPHBICNNTeDQnbSaEV9xtdtaP2YZS/pYt5xZD6i5DMBzQuzVc1RF0W
 NZVEIiBoJNuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="396048553"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2020 06:00:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Aug 2020 06:00:36 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 3 Aug 2020 06:00:36 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Aug 2020 06:00:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 3 Aug 2020 06:00:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Srz7le03EnhI/Pl76Vo71XUxvJi77VuUZ+VYbuKKstDrf9c4uhIx5f7YgyX3f7wY9bbH0ghgdv4sseCZcXQkD1wj2cWlNSUSlgoFrCVo00juSeSJGnXKMl8bRxrGl9QcUlM0iQLMoQ2ielQee5H3Hv7ac8xt6wu8m7hlIly/jSgCDnWR4tOF9lrGOv3h+YG4swCwbf227sol5uGaXf/o/p/eXMGY8u2RtUNbvVuWJ87TzpnPch78H+H/1I2iKREj/WL8ujPQ5LfQUqdtrtsHNq0EaF/mF79M8q9+LUeFCJ+XM2o4TvSWef9XSgD7epZpz6O3HwpJaJ4mOnv6xCyjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjJVn+tYLgzqh5KbUvbXMBF91/om4C85yjQELUYEFHQ=;
 b=b25ygQ9Moq6ojVzstOOTox0jhyEy/WZzZ2mV99SqgzVmmc2j+sh2scgZbsjO0FEXi08O4fFQvbPb9h8r/rDMqU0LelRD729GarGTTh4Tw0kfD8k+1qH7xamSSGP56fpo8yvUIBWtCCQhUGD9nEya8ExjjLkWQ4g7UzLlFyhWv67QNNPogP8wXYak9PJzGNCSMo7R4T00FO9vieU9iWJsyeLOR9mhqb4peU2XZEK3rmU2DGDXcy0akhQuYRcjuS2MaTzFtu7nHswtxSQ13PbYBzrAjELh7rVSI7R4Og9xYj92wuEWehycZuVbicIi1+eYtTSzTa9eM1tNLZRhAVq/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjJVn+tYLgzqh5KbUvbXMBF91/om4C85yjQELUYEFHQ=;
 b=NZgjk/+n3RVAi5OeRxnnX/Pq1a1b9ysi164j6Wmd9FRYwq7aUf5cTDasv8wAeDMBMTyjhgjUN/am46+C5Db75Y2DZzOfhqwxQtNgHIeuFZMbLV4Pdg6BdSD8BoerPwfK70bMYFwC0dXxdRP2Hyvus0RgCQcqVBhBRtEkxgOBNpM=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB0043.namprd11.prod.outlook.com (2603:10b6:4:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 3 Aug
 2020 13:00:32 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 13:00:32 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZzZzIgMFwAI7HkKT1/DPVspAl6khsDgAgAFDasCAAAm3gIADX8DA
Date: Mon, 3 Aug 2020 13:00:31 +0000
Message-ID: <DM6PR11MB3642B5BC2E1E0708088526D8974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-3-git-send-email-brent.lu@intel.com>
 <s5h5za3ajvb.wl-tiwai@suse.de>
 <DM6PR11MB3642AE90DF98956CCEDE6C2F974F0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hd04a90o4.wl-tiwai@suse.de>
In-Reply-To: <s5hd04a90o4.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.136.119.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e8449c9-43fb-48c4-818c-08d837ad3466
x-ms-traffictypediagnostic: DM5PR11MB0043:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0043FF7C6FF658BBD6FF505E974D0@DM5PR11MB0043.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H/tBrxBJ4PSSh4KIFyvxMpD+W3RkANr+pp6wnjNZTrq2GhoptZjbqIZY2ngzIAWffczWaroZeW3SdTaiGogV0wXKnJVwgA+vTL+bqrb8RZJ0PK6GfDXaiWfGsjyVBnA+8tRq8Z733hLaQDbMddBm0qzRHdv5mrT+5Sb92lotD6R1dG2N0gQ+cHhH/iZFb5sgTf0cLZjsUXz1Ov1DbYB2RqlhanAmc22vMsMECZeSxTjv3awmInyTmz0aMpHuaj2b8Oef6eeGzfH3BiJcXBrfX7P1qv+tRq0mBPfOIt7uoLvQozP3BzY+PpuHiCUGaRbWjICJzBsZnUahhzSw/oDmZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(8936002)(2906002)(4326008)(71200400001)(8676002)(478600001)(186003)(6916009)(316002)(33656002)(86362001)(54906003)(66446008)(7416002)(4744005)(64756008)(66556008)(66476007)(66946007)(26005)(7696005)(9686003)(5660300002)(76116006)(52536014)(6506007)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JGrX9P3mKZtI3A8j2nY6KhW1T/jVCf3vWrAZSp8YEF5GPOQkZcC0nybGZdf83Y5rSQyH7JmTptQa1wPST1q0O6x9Zc1FghCQMe+rDPyqUbeH37yOJm139vhHoTzMCscFivbuMPMbd7ABPh23iCnPK0c7cIvDFazVFnEzxz3Q63my2pVHo158d0goD/KucUPMFMQQBqk9gMs8vy5hDMGPFhseslYaL/6jCOy9ad7f1Fyw9VvjiXFv59JCmW3bEUVg+QcXcZHqGHzyO7QCH7huFmkxlx8rnOPgjWR36gkBARiNUdf4lv2zUptSw3sMcYWS5fWDREKdg+zSnufg3zMeglzdpAfVRZ+sIvwpNNqHiQlbJsHDtU32vHccPFtRnaEFnUEhOcE780rHEV+m3RUJcPIo4ngQQWoJt/x8xNrjAYDQUD7qYDmm0GWwN2NyDIQp+Vny8cQsq+cbn71CJzDnKn1BHSVppmJMrM/h77Qdf2SE9YvB6vMRExhg136189hS
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8449c9-43fb-48c4-818c-08d837ad3466
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 13:00:32.0338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBm2T70VJADyNDpIpIFXMRvnGfoLyXc/FnUwFVUuFD/U9twNmGIQlSjDyzvyUIa4J9ANA6fdVTI+8/6ClumP/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0043
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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

> > >
> > > Again, is this fixed 240 is a must?  Or is this also an alignment iss=
ue?
> > Hi Takashi,
> >
> > I think it's a must for Chromebooks. Google found this value works
> > best with their CRAS server running on their BSW products. They
> > offered this patch for their own Chromebooks.
>=20
> Hrm, but it's likely a worse choice on other sound backends.
>=20
> Please double-check whether this fixed small period is a must, or it's an
> alignment issue.
Hi Takashi,

I've double checked with google. It's a must for Chromebooks due to low
latency use case.


Regards,
Brent

>=20
>=20
> Takashi
