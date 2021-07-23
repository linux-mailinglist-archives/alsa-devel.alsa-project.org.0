Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D43D39B7
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 13:44:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E160C16E5;
	Fri, 23 Jul 2021 13:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E160C16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627040660;
	bh=oVBot7nmEVlI70cytfZV7l/pL/MMhjhnMSU6NeImaUI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TvMO9b8X4pDtAMryEN3LzydVnJJfG/QdOuoGKuYYzG//8p1rKo+gGZtrJr7c4Jcio
	 Si/nefK0lIhLwSte3FDI8JUcgDEC3gigMhiq7QTSgdBY8XOz6+6gO6C8Td9RhuynZQ
	 lvhhNMDSf+FlCq56+Q6Ic9hk9egu81Eq3+1+T1Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D6AF804AD;
	Fri, 23 Jul 2021 13:42:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE55BF804AC; Fri, 23 Jul 2021 13:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0803EF8016C
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 13:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0803EF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="RiZzrmH0"
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="211582228"
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="211582228"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 04:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="496286085"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2021 04:42:35 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 23 Jul 2021 04:42:35 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 04:42:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 04:42:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 04:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzGGMliHDOgxHHEvifA36mOjdSIdrg0ZbE7cPi7+K/VO0Q+YLCKCsOxiMuZnoqFz44zDqYmO0aBb8LCaWouyzeyahaPulzQy3N0t8crI43bxhUswqBFzFEvmNX0CM0O67JqSJe37PQJ4V872ChQ/qiyr9uyws/JhUAd0iSPSDifvy3+X90xnPnbfCUkrg8dJEyslNK6cJNvFmkVd12BCBW47mp6YEHswfdoBmxfK5ioP9IvXyssptsLTqM1m9POtUFkzmx7N7p4LbZBYHLxu/RFj+oEygOQjukyKSCjBVEogOmXSNv3irZU0BW7PDtG5qg8Wrk8s8+em8T/SnzLJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx7gFzNjcBN1gsslzKj56qmbUZP8e6rZtDPGL5DTQkM=;
 b=di0OCxBU7hIZLWTSHYrYhM9ahraBJwkSops6wMpJgsFQc/4/NrvA3he7GOQl2ZHYoighwQg4sQjjRsg4PgiIWOFH+cBP7DAaMUp0uuLqFwyBfy9LGBbO019j36RqyQGC1labNUIziUAnIG8lqQpSLPwFncN8fRGKGS1s2mbe194MgHom6XG9vUN7ZUovaiJ5XRI1+RSiKUVAJBYEVW727/5rndrUqtQOe2AxqDSUtyVsYbzSqy6ARr4t/DtYOOfxeGfEm4FeN1jBcVYATYByC+EJGqYmufUb+bR2Oo3cVHjJEN4RjtjHOiZw5EycQsaLsMKiZK6BOUjv5pFPAoqtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx7gFzNjcBN1gsslzKj56qmbUZP8e6rZtDPGL5DTQkM=;
 b=RiZzrmH0QrKKLmjE0MJGDIu8/nkzmAK4gG5OX2Tf2cMZ4UYXoaWKW5s5QHoj3fx+a2f2+4m4xb2Wx1JOEz3+N6ojMzcUiFr2LHrJAgBm0dSDY+iDjzx6ulRGI5HhA9r9iL2qzhY/+LhSRvaR30YtKhE3AjxdiVGX8GZq2M3d3So=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Fri, 23 Jul 2021 11:42:33 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755%7]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 11:42:33 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH 1/6] soundwire: move intel sdw register definitions to
 sdw_intel.h
Thread-Topic: [PATCH 1/6] soundwire: move intel sdw register definitions to
 sdw_intel.h
Thread-Index: AQHXeFp2kkRL9crGCEu8oo1j2eWJIqtPGeaAgAFiyXA=
Date: Fri, 23 Jul 2021 11:42:33 +0000
Message-ID: <DM6PR11MB4074511AC93DEE38E1AC1959FFE59@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20210714024614.9357-1-yung-chuan.liao@linux.intel.com>
 <20210714024614.9357-2-yung-chuan.liao@linux.intel.com>
 <YPl/p7ynoRoi2auf@matsya>
In-Reply-To: <YPl/p7ynoRoi2auf@matsya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 573171dd-ab6d-4e5b-5781-08d94dcef5d3
x-ms-traffictypediagnostic: DM6PR11MB4722:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4722328F0B1517AAC2093B15FFE59@DM6PR11MB4722.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OCuUUbiecD4ZeqSVUgFlmYYanjv4nY6m/5qusZMKzowLm2aRfCpkJ77uytcw5bd21VbuvRZQ+KNw2Z1XSedmIo5xmhn1K1lqInAFfWeSMliGzKJoSz/aoJHpWyeGSpkO7x6L6yviYKKrvH5DK0AE+40slPQ+UfWRmfN/GhsTk4pQ5LV20fGkNh3Uq5Q+wIY7epO566rypI4cnfz9DrWqQKAOV8O4j5q+B+rgrvqdZVt/UHde+4wwUFyTYP1/4IVYqx/lCiN/ejAkCch8QQi2XNC32rJjsoyFxjNydbOxnzzdefgKzLEqByn2Qamq5mTiTieyo/PZTmPvYix/CR0+zUzypOAcY47z3ezt58dds2kjc7AhCh3aRHT7rezWremOFqOB0/mU1eIx4hvD8mSgTIWPEH/uzDNUzKIcJXEeoA+0VxUxiFCf9VTWDl3j7mGWrflvNJzw29ebpF9eZe2iMcaq2NkS/+jCb8/zK7VfbRT2oiNgBrAufhHS20KRgyQyejZeVY/w+JgHMdszVcZchH72J1hAUmBiJFCyvdQnbucTes1GWReJITOeXy9EzFetVsHk0PXt397cC44605+1mr7Fhqw6SrHXqnNrF6BNeIQ8knq7DMyBHnk++A5TIRAciCXyEOAeFQNmRDHr/xE11PN/E0PKJg1nVldwkWhyZv1/m1yFU87yHY7PhGRiBYny28IgfhY0DQH9VacbEBNs7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(8676002)(6506007)(53546011)(9686003)(478600001)(7696005)(55016002)(33656002)(86362001)(83380400001)(26005)(76116006)(4326008)(71200400001)(186003)(52536014)(110136005)(2906002)(66556008)(66446008)(66946007)(316002)(38100700002)(64756008)(66476007)(5660300002)(8936002)(54906003)(122000001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jzxo7ALGJmtcfa4wkPom68mg4rQ/WtYaEriStF9p8/fPhzWhxBjH33HIcUAY?=
 =?us-ascii?Q?p6cw/gYPw4GUjbRKyjIMjB1ZvN5riUgDPM5t+Z5Dgto993uheCyezg2H3znD?=
 =?us-ascii?Q?yQNHmDq3afc8wJmR+DW9NwPR+wrkCTkkFsIee0OoYrKG+6wTCSK2DTxyAlqR?=
 =?us-ascii?Q?wXmKIEmzhri4uNkfFWPf+DKCIIse1cePYsj9awtMUUAz9QyEgWvrShlzGbKN?=
 =?us-ascii?Q?QuFhiWw4XMxqdKmuE21SUe758hWxjZjP0RPYEcH+2sDmT58GRe4hvzj4UTcB?=
 =?us-ascii?Q?JidxjaI2l5SCutU1uuQRDDYaH22ysXUPjW/V8LQhsfVDJEc4vtXcYdogjb0N?=
 =?us-ascii?Q?RroAtqUDwQIXh4I701wMHjGW8Bv6aqwokMdkZ0IXOou7Nt6NJ/NcvXMhK0YY?=
 =?us-ascii?Q?33v5cqz+kBri82Hb8ITzyeI8kziAkmGxKC+jQo9wdyO/XepsoGVUUG3MfrCV?=
 =?us-ascii?Q?5OZ9Hj9OKYMzuQfDWrJdFCoRMpg+XGAWXSD+yQn2cPy4SLpMEOMQyj9ISuiK?=
 =?us-ascii?Q?51EsCNnldVErL4KA4yEvJqgywVqIH1uIUHiYBxmph1dX+2RGLofpL+ijkl/w?=
 =?us-ascii?Q?o4Vwi0Pxxoc2JNtyQLrW2kfYYalhPW7I3aIMz7N2aY19YLZvkgQR6jtIZ3Rx?=
 =?us-ascii?Q?Fu7ZBbDbbtxDBl63IqP8NbJqDx8qV7yAxdSsCru87j+RGKyFyky5bgTAIFiA?=
 =?us-ascii?Q?VODWEZ1ATD4BaRG933axMbBnwY/FSVrFJrKyw2CgHnytvSo81lvouQ478TLH?=
 =?us-ascii?Q?VSn14xjn8estEx45YJTYNtxen9/Sv2oLBB93J7EtauzfQfeuax+pzSLVmwFL?=
 =?us-ascii?Q?fXknGjkCZdctddiFjSg9AkPiyDd+Tosfq1Y4uj5KDmaqNDviGEaDOU9jhFgJ?=
 =?us-ascii?Q?CnYsv+hg36RBlp6YtOX5sbXQG/cV+Prkd+SKB4Ua9bKKDuzaXOceiKTCb+c3?=
 =?us-ascii?Q?axtQ2opVjFRIiwgRpbdc+mRiTT+37MhWTr+XTUorzjNp/SGl3sIbfkLOP9Ls?=
 =?us-ascii?Q?pG/vkVisiCzXZgQdhd6G8MLusnIGOIC/IuD3un54r7FLVJOQuewctxevQFtT?=
 =?us-ascii?Q?Me9O+SD28iTFczMOQSrGX5yEXBCNy6w+uDiLdSoL4xg9TWXOiRuKgRBuK9mN?=
 =?us-ascii?Q?nsNVLjjpEQ6QZaVoxRUok+NTzR2UokWWtVxNM/JIoPToZBUsMli/iS1Tce0r?=
 =?us-ascii?Q?VgHmD7yu9yZQa0KzzprOsmZV657thDDOXd8vbu41BkW2M3Iq53bC3u+fT0i3?=
 =?us-ascii?Q?PJBrnC6Rys2KbN/O2RHl6rWdAEVic71RjOiSgYwPGpoxmj9+2EUEr/5CF55+?=
 =?us-ascii?Q?46Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573171dd-ab6d-4e5b-5781-08d94dcef5d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 11:42:33.0896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0jOnQWVrSMtdVbwpwT2ysHDXhISRtc4WyI1DkAwFlgLgNf506Bba+CXTR4SH3UG0lbzNa+Cy89GIC587rDppZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>
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
> Sent: Thursday, July 22, 2021 10:25 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; tiwai@suse=
.de;
> broonie@kernel.org; gregkh@linuxfoundation.org;
> srinivas.kandagatla@linaro.org; pierre-louis.bossart@linux.intel.com; Kal=
e,
> Sanyog R <sanyog.r.kale@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH 1/6] soundwire: move intel sdw register definitions t=
o
> sdw_intel.h
>=20
> On 14-07-21, 10:46, Bard Liao wrote:
> > So it is visible to other drivers.
>=20
> More detailed log please, who are others...

Thanks. I will send v2 to update the commit message.

>=20
> Otherwise the changes look fine to me, how do you wnat this to be picked?=
 I
> guess asoc parts are dependent on this
>=20

Yes, ASoC parts are dependent on this. Maybe you can add an ACK if the
SoundWire parts look good to you. And Mark can apply the series when he
think the ASoC parts are ready to merge. The  opposite way also works for
me.

Thanks.

> >
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Reviewed-by: Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > ---
> >  drivers/soundwire/intel.c           | 74 ---------------------------
> >  drivers/soundwire/intel_init.c      |  6 ---
> >  include/linux/soundwire/sdw_intel.h | 79
> > +++++++++++++++++++++++++++++
> >  3 files changed, 79 insertions(+), 80 deletions(-)
> >
> > diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> > index c11e3d8cd308..15668d6fecd6 100644
> > --- a/drivers/soundwire/intel.c
> > +++ b/drivers/soundwire/intel.c
> > @@ -40,80 +40,6 @@ static int md_flags;
> > module_param_named(sdw_md_flags, md_flags, int, 0444);
> > MODULE_PARM_DESC(sdw_md_flags, "SoundWire Intel Master device flags
> > (0x0 all off)");
> >
> > -/* Intel SHIM Registers Definition */
> > -#define SDW_SHIM_LCAP			0x0
> > -#define SDW_SHIM_LCTL			0x4
> > -#define SDW_SHIM_IPPTR			0x8
> > -#define SDW_SHIM_SYNC			0xC
> > -
> > -#define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
> > -#define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * (x))
> > -#define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * (x))
> > -#define SDW_SHIM_CTLS2CM(x)		(0x016 + 0x60 * (x))
> > -#define SDW_SHIM_CTLS3CM(x)		(0x018 + 0x60 * (x))
> > -#define SDW_SHIM_PCMSCAP(x)		(0x020 + 0x60 * (x))
> > -
> > -#define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 *
> (y)))
> > -#define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * (x)) + (0x2 *
> (y)))
> > -#define SDW_SHIM_PDMSCAP(x)		(0x062 + 0x60 * (x))
> > -#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
> > -#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
> > -
> > -#define SDW_SHIM_WAKEEN			0x190
> > -#define SDW_SHIM_WAKESTS		0x192
> > -
> > -#define SDW_SHIM_LCTL_SPA		BIT(0)
> > -#define SDW_SHIM_LCTL_SPA_MASK		GENMASK(3, 0)
> > -#define SDW_SHIM_LCTL_CPA		BIT(8)
> > -#define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
> > -
> > -#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 /
> SDW_CADENCE_GSYNC_KHZ - 1)
> > -#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 /
> SDW_CADENCE_GSYNC_KHZ - 1)
> > -#define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
> > -#define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
> > -#define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
> > -#define SDW_SHIM_SYNC_CMDSYNC		BIT(16)
> > -#define SDW_SHIM_SYNC_SYNCGO		BIT(24)
> > -
> > -#define SDW_SHIM_PCMSCAP_ISS		GENMASK(3, 0)
> > -#define SDW_SHIM_PCMSCAP_OSS		GENMASK(7, 4)
> > -#define SDW_SHIM_PCMSCAP_BSS		GENMASK(12, 8)
> > -
> > -#define SDW_SHIM_PCMSYCM_LCHN		GENMASK(3, 0)
> > -#define SDW_SHIM_PCMSYCM_HCHN		GENMASK(7, 4)
> > -#define SDW_SHIM_PCMSYCM_STREAM		GENMASK(13, 8)
> > -#define SDW_SHIM_PCMSYCM_DIR		BIT(15)
> > -
> > -#define SDW_SHIM_PDMSCAP_ISS		GENMASK(3, 0)
> > -#define SDW_SHIM_PDMSCAP_OSS		GENMASK(7, 4)
> > -#define SDW_SHIM_PDMSCAP_BSS		GENMASK(12, 8)
> > -#define SDW_SHIM_PDMSCAP_CPSS		GENMASK(15, 13)
> > -
> > -#define SDW_SHIM_IOCTL_MIF		BIT(0)
> > -#define SDW_SHIM_IOCTL_CO		BIT(1)
> > -#define SDW_SHIM_IOCTL_COE		BIT(2)
> > -#define SDW_SHIM_IOCTL_DO		BIT(3)
> > -#define SDW_SHIM_IOCTL_DOE		BIT(4)
> > -#define SDW_SHIM_IOCTL_BKE		BIT(5)
> > -#define SDW_SHIM_IOCTL_WPDD		BIT(6)
> > -#define SDW_SHIM_IOCTL_CIBD		BIT(8)
> > -#define SDW_SHIM_IOCTL_DIBD		BIT(9)
> > -
> > -#define SDW_SHIM_CTMCTL_DACTQE		BIT(0)
> > -#define SDW_SHIM_CTMCTL_DODS		BIT(1)
> > -#define SDW_SHIM_CTMCTL_DOAIS		GENMASK(4, 3)
> > -
> > -#define SDW_SHIM_WAKEEN_ENABLE		BIT(0)
> > -#define SDW_SHIM_WAKESTS_STATUS		BIT(0)
> > -
> > -/* Intel ALH Register definitions */
> > -#define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * (x)))
> > -#define SDW_ALH_NUM_STREAMS		64
> > -
> > -#define SDW_ALH_STRMZCFG_DMAT_VAL	0x3
> > -#define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
> > -#define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
> > -
> >  enum intel_pdi_type {
> >  	INTEL_PDI_IN =3D 0,
> >  	INTEL_PDI_OUT =3D 1,
> > diff --git a/drivers/soundwire/intel_init.c
> > b/drivers/soundwire/intel_init.c index 9e283bef53d2..03ff69ab1797
> > 100644
> > --- a/drivers/soundwire/intel_init.c
> > +++ b/drivers/soundwire/intel_init.c
> > @@ -18,12 +18,6 @@
> >  #include "cadence_master.h"
> >  #include "intel.h"
> >
> > -#define SDW_SHIM_LCAP		0x0
> > -#define SDW_SHIM_BASE		0x2C000
> > -#define SDW_ALH_BASE		0x2C800
> > -#define SDW_LINK_BASE		0x30000
> > -#define SDW_LINK_SIZE		0x10000
> > -
> >  static void intel_link_dev_release(struct device *dev)  {
> >  	struct auxiliary_device *auxdev =3D to_auxiliary_dev(dev); diff --git
> > a/include/linux/soundwire/sdw_intel.h
> > b/include/linux/soundwire/sdw_intel.h
> > index 1ebea7764011..7fce6aee0c36 100644
> > --- a/include/linux/soundwire/sdw_intel.h
> > +++ b/include/linux/soundwire/sdw_intel.h
> > @@ -7,6 +7,85 @@
> >  #include <linux/irqreturn.h>
> >  #include <linux/soundwire/sdw.h>
> >
> > +#define SDW_SHIM_BASE			0x2C000
> > +#define SDW_ALH_BASE			0x2C800
> > +#define SDW_LINK_BASE			0x30000
> > +#define SDW_LINK_SIZE			0x10000
> > +
> > +/* Intel SHIM Registers Definition */
> > +#define SDW_SHIM_LCAP			0x0
> > +#define SDW_SHIM_LCTL			0x4
> > +#define SDW_SHIM_IPPTR			0x8
> > +#define SDW_SHIM_SYNC			0xC
> > +
> > +#define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
> > +#define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * (x))
> > +#define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * (x))
> > +#define SDW_SHIM_CTLS2CM(x)		(0x016 + 0x60 * (x))
> > +#define SDW_SHIM_CTLS3CM(x)		(0x018 + 0x60 * (x))
> > +#define SDW_SHIM_PCMSCAP(x)		(0x020 + 0x60 * (x))
> > +
> > +#define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 *
> (y)))
> > +#define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * (x)) + (0x2 *
> (y)))
> > +#define SDW_SHIM_PDMSCAP(x)		(0x062 + 0x60 * (x))
> > +#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
> > +#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
> > +
> > +#define SDW_SHIM_WAKEEN			0x190
> > +#define SDW_SHIM_WAKESTS		0x192
> > +
> > +#define SDW_SHIM_LCTL_SPA		BIT(0)
> > +#define SDW_SHIM_LCTL_SPA_MASK		GENMASK(3, 0)
> > +#define SDW_SHIM_LCTL_CPA		BIT(8)
> > +#define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
> > +
> > +#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 /
> SDW_CADENCE_GSYNC_KHZ - 1)
> > +#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 /
> SDW_CADENCE_GSYNC_KHZ - 1)
> > +#define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
> > +#define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
> > +#define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
> > +#define SDW_SHIM_SYNC_CMDSYNC		BIT(16)
> > +#define SDW_SHIM_SYNC_SYNCGO		BIT(24)
> > +
> > +#define SDW_SHIM_PCMSCAP_ISS		GENMASK(3, 0)
> > +#define SDW_SHIM_PCMSCAP_OSS		GENMASK(7, 4)
> > +#define SDW_SHIM_PCMSCAP_BSS		GENMASK(12, 8)
> > +
> > +#define SDW_SHIM_PCMSYCM_LCHN		GENMASK(3, 0)
> > +#define SDW_SHIM_PCMSYCM_HCHN		GENMASK(7, 4)
> > +#define SDW_SHIM_PCMSYCM_STREAM		GENMASK(13, 8)
> > +#define SDW_SHIM_PCMSYCM_DIR		BIT(15)
> > +
> > +#define SDW_SHIM_PDMSCAP_ISS		GENMASK(3, 0)
> > +#define SDW_SHIM_PDMSCAP_OSS		GENMASK(7, 4)
> > +#define SDW_SHIM_PDMSCAP_BSS		GENMASK(12, 8)
> > +#define SDW_SHIM_PDMSCAP_CPSS		GENMASK(15, 13)
> > +
> > +#define SDW_SHIM_IOCTL_MIF		BIT(0)
> > +#define SDW_SHIM_IOCTL_CO		BIT(1)
> > +#define SDW_SHIM_IOCTL_COE		BIT(2)
> > +#define SDW_SHIM_IOCTL_DO		BIT(3)
> > +#define SDW_SHIM_IOCTL_DOE		BIT(4)
> > +#define SDW_SHIM_IOCTL_BKE		BIT(5)
> > +#define SDW_SHIM_IOCTL_WPDD		BIT(6)
> > +#define SDW_SHIM_IOCTL_CIBD		BIT(8)
> > +#define SDW_SHIM_IOCTL_DIBD		BIT(9)
> > +
> > +#define SDW_SHIM_CTMCTL_DACTQE		BIT(0)
> > +#define SDW_SHIM_CTMCTL_DODS		BIT(1)
> > +#define SDW_SHIM_CTMCTL_DOAIS		GENMASK(4, 3)
> > +
> > +#define SDW_SHIM_WAKEEN_ENABLE		BIT(0)
> > +#define SDW_SHIM_WAKESTS_STATUS		BIT(0)
> > +
> > +/* Intel ALH Register definitions */
> > +#define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * (x)))
> > +#define SDW_ALH_NUM_STREAMS		64
> > +
> > +#define SDW_ALH_STRMZCFG_DMAT_VAL	0x3
> > +#define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
> > +#define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
> > +
> >  /**
> >   * struct sdw_intel_stream_params_data: configuration passed during
> >   * the @params_stream callback, e.g. for interaction with DSP
> > --
> > 2.17.1
>=20
> --
> ~Vinod
