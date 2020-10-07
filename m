Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2B286554
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 18:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4F816C6;
	Wed,  7 Oct 2020 18:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4F816C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602089888;
	bh=sybP0WGZeVbe7ZQBmS1EHy9qF79H2HCSUatfqWYy9O0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B3tZi9CokkePYaGM2ZdGHwWYwuzx73PGF95SEC0N/OpoSJBK2UsCeA2GD7dn5dEyx
	 qygFG6tllc+bTpd7J0IGQ1TM/D9BVP6qWmisB+TZTAossn+AyspKI3gd/SrpsunR+S
	 gBp8NO4pO+BUM5EmQAL64orwr7bC/rlEF3+nqv7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09EADF800EE;
	Wed,  7 Oct 2020 18:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 350BFF80128; Wed,  7 Oct 2020 18:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1671F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 18:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1671F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="j6HK3LBW"
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7df32d0000>; Thu, 08 Oct 2020 00:56:13 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct
 2020 16:56:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 7 Oct 2020 16:56:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jcvsqpv/zgqhJjH/3yWopFi3YbNCcB6URWkqb1HGRs8+TH41cFkQ11V+Deg1pXiXpobwu8y1xU1v5PE16yT8lkw010n133VJWPFgfiFgXv66Bnmxuw/hygzIrlnBkMrxweDylDvu23pEPNZoHeUgHcIVXrNSbqSu/lvz2lyoY9o/iXWa28C7bDLLX875W9KQKGQatt4kEbGWOSkIh0v3KaHuLnMnvxJDmR8QesrDsjDKNkWyAV9hGQd1wWf8QNTd9lZKo2bVP0W6IfqPKHVS9SPlKmosR3EhtYAnLv3iCbyxZetLpvUcO+Ua+H/p6nfFtWJk5l2TrJntfFdEGxn9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sybP0WGZeVbe7ZQBmS1EHy9qF79H2HCSUatfqWYy9O0=;
 b=XdYHzdRYRFhyWgzsiJxmDSKITHwOpnhMcCVsymwWAz3Gq1WTmEohNxUijtpOLW96XBw+8Z7rhMXCAgHcnA2l9Zf0ssv/W4T9OJNNDe3K+OApJi7n216ko07B7JNjOdwECGIrXPDiqRJeJl6yst/m//t0Rwl5noDJvgLX9HHvwsE4M8NDFBhykdO/OWlWLZoG0rAN4a3hSYMEhOvxumJ1I4GIkOVlyd+vbevYdBlMOZmxojrlxeqTjklp+pZk/aUvd3UZphacPIEsqq4K6P4hChxnapmNfoh+UyNdBKhcf5XJGb+JdGC/zC3iE+sMEmUlUXQr8QbAN6WxxTnKNepskw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 by BYAPR12MB3494.namprd12.prod.outlook.com (2603:10b6:a03:ad::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 7 Oct
 2020 16:56:05 +0000
Received: from BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105]) by BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 16:56:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3xKvomHiYgkD0WKJ7Q9Ugi47amCVemAgAJu/YCAANXFgIACh0yAgADDm4CAAk75AIAAsRKAgAB2sQCAAADuAIAABXgAgAAB9qA=
Date: Wed, 7 Oct 2020 16:56:05 +0000
Message-ID: <BY5PR12MB43226AEB3F8BC3F2E4B894EDDC0A0@BY5PR12MB4322.namprd12.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
 <20201005112547.GA401816@kroah.com>
 <CAPcyv4gWc4B9U9+RcEgmbFWiZ7VpDK+kFXnhGcOUkDhVc609vQ@mail.gmail.com>
 <20201007091443.GA822254@kroah.com>
 <CAPcyv4hLVF4AdRLq2mTGJ9NBwRHm=_ANerUu0OuUPKk2XBSu_w@mail.gmail.com>
 <20201007162251.GB5030@sirena.org.uk>
 <10048d4d-038c-c2b7-2ed7-fd4ca87d104a@linux.intel.com>
In-Reply-To: <10048d4d-038c-c2b7-2ed7-fd4ca87d104a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
x-originating-ip: [49.207.195.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d068b2d4-d2ef-4082-0ec7-08d86ae1e1a2
x-ms-traffictypediagnostic: BYAPR12MB3494:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3494C6FF36D0084F552C8EC1DC0A0@BYAPR12MB3494.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6mqJhOpJywwDLveamVloDSJFtNXOSJ6DwJQq5b0t0p0B9Q8cvTzoHZK/5IOzK7zWu1GKpuT8rUmy0V5am6emdxRvYCCLsayTq/MNXr+/IS2PkUFH6uhPS+yKQQQ1fZkxVkc0F3BKGYtCVRjUPpSlign8G7bZOno4+5uSgSBd+i4zltic0BwEMXNc+uVPW5E/zVQz4AeQo7Oax9Btpkyur9oRxfxJPi0jITx3l0eBvFKph3/ZXZC3PACgELQlyteXUHh120UGGH9/jWmv2s7fiRD4Q1amdx5wUlht1iCjNYGKH47CKMJPzH4235/WRI5oKVXNrmrhqH/sipgYvchNzqdt7jaU/fdV6JDQcsCE1m6ilIAkXKqtaFhMd5j6sqCw73o3jKbTC29FlRN5Cg2mLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4322.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(186003)(2906002)(76116006)(4326008)(71200400001)(7696005)(64756008)(66556008)(66946007)(5660300002)(66476007)(316002)(9686003)(66446008)(26005)(110136005)(6506007)(54906003)(55236004)(8936002)(52536014)(86362001)(55016002)(83080400001)(8676002)(966005)(83380400001)(478600001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: UhWpPVtEOro4N2dTuK23R2fAKO1ayDtrmHYQ2TOBlIDLR/0sq9xFgXkQ84VxOYE0TrqVOKyRPT/y/3YZJ/5KulaftAwDgjI2K2SrYHcHxie0hwWxUXEvgUCOZ3NX1vCgVZI5g8EaS8DzPPgvk70dhYopqMaQSpT8Xf5m5Y75qV3mfM3FcvlY/h9dGGKao2yb7eM32P1R17ufD1RzAQDsrsQ0RLF2pIawm/H+4soD1BqXIaVcan9WynEDBeeYqcjxv2WkzNz6jcT6yJKCEQO4p5n1bM7dvWoJypSSbCR1MaZi7ci3HxzIZEyCSYQEmLjOhPk3r9CUxH/0fcCRr/oErqOIXW9wrRHI1uBzV1IqcWjRzk96SdQVB+zbYUF5wZyGt05Fhv07G2unEYzkpVwtNT44MnfC7bZ+tYVI1/YplfS60u7rBk9B3Vw3uNbMReN9+Lrjer2+xkzHyurg4O0xhXTOdVej/yvxNTGsOXi6Z0jxE1dCNPHlStwd4ZvRFRp09U/0G78o21F2sMA+lSW275dyrjOYGoMjgcZ965TUt/KwadFkxea4jK1o9fUgRDwzz41T5YS208Larkcw+jY6AOIF8/4JmgG2rE9ZgNea/czX++z6FlRRDK1b1wuAiIy0SChsI47+uNoOmpTMEP1dsQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d068b2d4-d2ef-4082-0ec7-08d86ae1e1a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 16:56:05.8197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vA8DrH4ee0Y87G/3wJI1U5AJM48LiY/nFSiblPQUNrVm/bULmQ0TDN6qrKoAykiBNdUEwJuGYYwOnCnaH8IU4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3494
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602089773; bh=sybP0WGZeVbe7ZQBmS1EHy9qF79H2HCSUatfqWYy9O0=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:Content-Type:
 Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=j6HK3LBWKnh4NP9HNGWrhF/V7aoO15IfferaTqIV4wumlH2RnOdLEgfEUmSquNX/n
 Z1ywI5410H+Bpm3PAlvRG6I/8Im4yxYtnobVJqny2gNQj6k0wcNE/K8NtBjTujJAlS
 0SYNdf/wSuqKLN/nYh3kQ7UdOGN75Mmq3x9aJM7roeK/qpZzxTRFtPffFUTwg0cBng
 fAa120XMgGbAWVdlVRO9zegnfkLFESNKT+ucWzxGOwMp8hHn0XEXuWmvU8o9njFKsd
 m80/rRKqc0GOkPJN2itqf5XFVq6mfX1AOa5brB03/yCDHNhL3OfMBXHlsKmFZwLQv6
 LNlsR3HqnkkYA==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Sridharan, 
 Ranjani" <ranjani.sridharan@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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

Hi Pierre, Mark, Dan,

> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: Wednesday, October 7, 2020 10:12 PM
>=20
>=20
> >>> "virtual" here means "not real" :)
> >
> >> Which of these aux device use cases is not a real device? One of my
> >> planned usages for this facility is for the NPEM (Native PCIE
> >> Enclosure Management) mechanism that can appear on any PCIE
> >> bridge/endpoint. While it is true that the NPEM register set does not
> >> get its own PCI-b:d:f address on the host bus, it is still
> >> discoverable by a standard enumeration scheme. It is real auxiliary
> >> device functionality that can appear on any PCIE device where the
> >> kernel can now have one common NPEM driver for all instances in the
> >> topology.
> >
> > Some if not all of the SOF cases are entirely software defined by the
> > firmware downloaded to the audio DSPs.
>=20
> Correct for DSP processing/debug stuff. In some cases though, the firmwar=
e
> deals with different IOs (HDMI, I2C) and having multiple 'aux'
> devices helps expose unrelated physical functions in a more modular way.
>=20
> The non-SOF audio case I can think of is SoundWire. We want to expose
> SoundWire links as separate devices even though they are not exposed in
> the platform firmware or PCI configs (decision driven by Windows). We
> currently use platform devices for this, but we'd like to transition to t=
his 'aux'
> bus

There is more updated version of the patch [1] from Dave which is covering =
multiple mailing list who are also going to consume this bus.
This includes=20
(a) mlx5 subdevices for netdev, rdma and more carved from a pci device.
(b) mlx5 matching service to load multiple drivers on for a given PCI PF/VF=
/subfunction.
(similar use case as irdma)

Greg also mentioned that he likes to see other mailing list CCed, which Dav=
e already did in PATCHv2 at [1].
So lets please discuss in thread [1]?

[1] https://lore.kernel.org/linux-rdma/20201005182446.977325-1-david.m.ertm=
an@intel.com/
