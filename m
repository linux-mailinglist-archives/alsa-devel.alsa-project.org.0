Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD46C28044E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73BF0192F;
	Thu,  1 Oct 2020 18:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73BF0192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601571154;
	bh=vtI6B3fZ6ETYPAYYqFg8tLZTrbnHGxW76ch4J6W+bbg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPlsETTn3Q2929gRhuGDf6rJTvgyVSbBtgQbOxaKdh6HVbnlYxRS5axk6HgEtrKj+
	 y2rHpSPJGWiImIxF3BhMfYkg6c3nDJaAv1ocBDE3/m1OkMBOEevjyWU7D7T0kbRUSX
	 kalCi1YOBwQGv156PbgnV5PnQTFRl+InK+gdZ0AQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C37DF801F5;
	Thu,  1 Oct 2020 18:50:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9F30F8020C; Thu,  1 Oct 2020 18:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D314FF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D314FF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="SYhw4lH2"
IronPort-SDR: 1QlET+ZknFmEvWZqNJDLjZ4MdYdZsTcgd9+9w3gSvYE266Sb93sf79OOsaJuUud7vp6FUlaOEA
 fb9zqwaFxCIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163635466"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="163635466"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:50:37 -0700
IronPort-SDR: ekfQgagU9RtYn97T9sjMkMOAMjy2ZV72u0h4evjIVYk6NgmgNq8XDxHhZWI+MmoaB1WW7B9aKw
 kc68fgxzgNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="313120418"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 01 Oct 2020 09:50:34 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:50:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:50:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 09:50:27 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.55) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 09:50:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHwzRQi2D/9MHpA/qCxVkAowunx+w1y3PWvHMr2d7Sm6phanvNi5Y9dZglyt7ZVzCMO7GBvU8SSxBmt7XHk3O13tFqWO0CPl/w2iwq+GkG+JvXEkRV/G2OMJQqP/nSQE343KRQw1GPKMWjn8RjfrLjDZREQK+PeonAU/Bxi7ii7o+uh5r0e0OWTYJM+GmRWfixap0uQa15XDFJLl08pw455e6Dne7GfLRgAqOtkDSBSy2HBY2k0u6wJdp8Sou/DCntHSDLhM1U4F05gMUhGLXcG0FLmFjvLqjCkuLG3aGVFN1W3kMTO/7TXnVZk6Dd4qTHVUrpQQ84ALfG5xM99wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oizODr80KyF4oBGv922y7e7fDfSLwOr/7lCTzpUID0=;
 b=UCAD1/bZbjW+9dFR9qcILSSM/joAA6KLl6PONS4pBqfGOJMT8fCoHURMBILV9jNMfwyO+w+zUr6uKhQ0IukMen8OlQfH0HEIIt1tW5l4PZ1omr1+ztX98rveacTS99b5u14sHiS2yrWFUs9nk2+gT4tqP3GzRqUypBFCIjxh+/WE23Dcgmzl3zramwSnXAkuskZzcNpkmVZ/jl6+AaG7b52BY3DCtvbqpu//+zJvI5p4qvuYMiFe2TMf24KLfxt9AJYaUoo4Ig8LZ+mN2HFrtO4anxVj8NPDN47gXuDZt6aX2hqSvudFvahGA+LkFjbvZzDINNXXy4I/Z11AxjW3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oizODr80KyF4oBGv922y7e7fDfSLwOr/7lCTzpUID0=;
 b=SYhw4lH2h6X32FryiBCulN9VmRwGYZBIxiYagny0g1ygnR57JxF7zGEoGOa3jdOUX+xVy580soFwjr2M6G5vPikF97VC/d8DmXxSWVKHQ8+7GQaXjLg6I6lrjJKxy7+i1VA+TmR0V5PZo5KHzbL/CCUITdJ+KzTQ4oIxqNPZQHE=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM5PR11MB1658.namprd11.prod.outlook.com (2603:10b6:4:8::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.23; Thu, 1 Oct 2020 16:50:26 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 16:50:26 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCs/MAgAAVbICAAC0LEA==
Date: Thu, 1 Oct 2020 16:50:26 +0000
Message-ID: <DM6PR11MB28417E157FB2144BC5C99ED2DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
In-Reply-To: <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1811686c-6b4e-420a-1e99-08d8662a18ee
x-ms-traffictypediagnostic: DM5PR11MB1658:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB165844D60D3C6666652DB93FDD300@DM5PR11MB1658.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uYvLYoVQpV2ULcUlpN+SR7cnt9SIcWfJAfw/3f2++M1N5aY4z4sw6lUDrvjuW6JIR2HpJ0gLj26yPqbyGPUpeGkjp94aET4Rh4e2Rg3PWZNmO1XcUrdT7MbLpD82xGsuj03dz67UojO0gXADf0n5rJScwsJuChX/zrDzVw+LEevrwV56Hn6qnQ44TezqywGoNWBn7OsE78/bka1G5uKF6tAOUpnHE1xeheUb0Y7TwBr6VD7elvT2UgJc61c11GndsZvRH+viN1ZyM0pAyCgsBcMO5YIdmcVeOdwtaerlsD25Qb6qenIT/P/8p2Hqv/Zblbj5ZMn4We6Z0RWzvVhBvD1YeNrevSuNYVDZNzErWPA8iI0VRW6jg9eDHF9DRxCG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(6506007)(2906002)(186003)(8676002)(26005)(478600001)(53546011)(9686003)(55016002)(8936002)(4326008)(110136005)(83380400001)(33656002)(5660300002)(66556008)(66446008)(64756008)(66476007)(76116006)(316002)(86362001)(66946007)(52536014)(71200400001)(54906003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 23qiu98VYclpx0MQyTDbw8sLCpYuom52YyV+f0Lb1F3G9aqIbCbwIAWYMNd1vn/NscNJ/2b5E8xEd2WW+QpRJkFn1SeNRUGW+WHwJ9tcYD3MGXkvyav9h35rJJMdBm1C66kwivgemD7h1dteJwHc3wvlqX6ilITwShzpvI564cKtwkDbL4MwB6k2+Qd82kZTkz4i9xhst4V2szp2mVuDcpAto8O/mpwyA/+ma7PIRuQaraUjoQMywRE752tBAzpj5xyGgmXV5H0vDfBZzBuZRX3yN32vy0Zhq5vg8RisYBvtCFjVHXzttuAoP+Pfchm6wrbL17r2qWS2OP/uNno6DB/HhJjZ+HCaYBzzkqWGvTLHsbPzfTMjEDU+wLA7FA0/6zSm6hizh8xoBIOf5wly2/oHl7tdU4aQ0WAc5E37JiB9qpytArtuxTfFWOOgQxqVoX2YGAcfl2Oa40qFlSj6IL/XEPE/unv6RbLhhG64GFutm40zdyuHRJF49oJpkf1/FQd221ip5ycDJK6Ix5ObRaovshHPHDQSyblNG7PnN1wY9E9f6uC8gnqNyxFbNGdm9HaU649k4kJlGNFBpzzOqTWLq4b1OP5HLyHwli+wa/xPKFIE2tq6iKSWLasm386JJfNuVeg5SnCbZrPfgQ667Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1811686c-6b4e-420a-1e99-08d8662a18ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 16:50:26.4704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zV8QIxrSNrtw9UpXnMrbuMlzU1k49Y7fr+rEYOW4dvLFijdhUxObRiPJjWB5i5rcvM3zqkV9sCNqgfFiF3q7KJKGixX9695QuUDrIPZjMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1658
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>, "parav@nvidia.com" <parav@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>
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
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: Thursday, October 1, 2020 7:07 AM
> To: Mark Brown <broonie@kernel.org>; Ertman, David M
> <david.m.ertman@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de;
> gregkh@linuxfoundation.org; Sridharan, Ranjani
> <ranjani.sridharan@intel.com>; parav@nvidia.com; jgg@nvidia.com
> Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-clien=
t
> support
>=20
>=20
>=20
> >> are controlled by DT/ACPI. The same argument applies for not using MFD
> >> in this scenario as it relies on individual function devices being
> >> physical devices that are DT enumerated.
> >
> > MFD has no reliance on devices being DT enumerated, it works on systems
> > that don't have DT and in many cases it's not clear that the split you'=
d
> > want for the way Linux describes devices is a sensible one for other
> > operating systems so we don't want to put it into DT.  Forcing things t=
o
> > be DT enumerated would just create needless ABIs.
>=20
> I agree the "DT enumerated" part should be removed.
>=20
> To the best of my knowledge, the part of 'individual function devices
> being physical devices' is correct though. MFDs typically expose
> different functions on a single physical bus, and the functions are
> separated out by register maps. In the case where there's no physical
> bus/device and no register map it's unclear how MFDs would help?

The MFD bus also uses parts of the platform bus in the background, includin=
g
platform_data and the such.  We submitted a version of the RDMA/LAN solutio=
n
using MFD and it was NACK'd by GregKH.

-DaveE
