Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C62804EA
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF0C1937;
	Thu,  1 Oct 2020 19:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF0C1937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601572530;
	bh=SrrBkRG0YoCpjy7u4+YJZZaO9RbRizWMuVrFZ01pbXg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WifFw0BcH9Z0nq80SltjpdVidvKcFnerLIOslbPx1KI1zDOcuy9Eg3LnjNuMUAc/M
	 ce0x0KLmgYrfeH5i8UBwZ5CZn5IocIw4esQk/D9Kv9M+7aumWTosa6y/Rxnj97TGgr
	 +MWhsYrSCZ1MNtCs+ntf5LMK0Vz/qGSs5TVC/HA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A704FF801F5;
	Thu,  1 Oct 2020 19:13:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8904DF8022D; Thu,  1 Oct 2020 19:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E3DBF801DB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E3DBF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="aAs73LEo"
IronPort-SDR: oDPF6+pNxy/ElLUN2z2tnscwABcitYe0UKWth84iGUmSDfw/5sKo6HOIeymOrv1vuhx2zFEygu
 CTOIxX6Rggmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150581079"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="150581079"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 10:13:25 -0700
IronPort-SDR: 3fv+Gesp0AQ1HOeHLSGF5Xr8Ly36Dx+hNFOhqIyrH9kkhzPIGPT8Bn8y4Dtzd9UAYG/FPgvic9
 7ZnzckaRgYjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="294508493"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2020 10:13:24 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 10:13:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 10:13:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 10:13:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 10:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVo/lDGf/pzTFr5R78CwsfNbUHVXjewlQsVifZkoEb4lAwMxxxis7l0rCNEmg4ZHlZAN9Dm5V9HfPNcQDY3iskVPMbkiDqAbyorUX41GYsTjMQsRnJSLtm2FP8fv3Vvvvwt8saA6oKqVSQP6qRgL76+qvmF+0xkVAtdC5l6GYHba2xXZ/GDojK8t1RkTh7Ao9TebxfzBPCMLsDTQX1swyOg7hKR8rOiqiivpwb4J5YUuHw0dlpdBuVSTSi9ecdpOhHC328Q4WDwlHSblna19daHd9kW6ub0+hnqgUVs9u/sG8bcBomuGLruXPfjVqx6M+msWkR4refotrz/gkyL9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4Wbi6wTV6YfttixVe5c1JXoGqGmICgRdy/RGRGZuoM=;
 b=mm35dnPd6gxwK6an6PQtNa5OkZ2RT2zlVS4Nz6ROjL8lFs27SFZUS/EpadeJJs8SXxlq+yRkon1Ua6NB9wlZkTFv9lZZthjJG/GULNXVQLc41LTo0oIrLs/jNwvflEg11i0gsjH1d5Q9fxAyLBXJPuNot0F8O9E8Cygtc17aVx+dMasTiVWmfqSpQVBGW0o1H6xqC25tNe9CRM7hYDL9oWTveGwoA3Z22HcGSrCBgDab+tMoYsu7AHYzhXTxq7T8HshKS7twD0tKWhjURTckIA02o2b2qKiE4j5KpxzY1cZPKQ6o5so2285rT/o0u+ixg4iHShYlIQq7N+bNBvTnWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4Wbi6wTV6YfttixVe5c1JXoGqGmICgRdy/RGRGZuoM=;
 b=aAs73LEoGNNC/slhWCV2PGobYx1rT5DU9oRUlFJ2nEi7dNY/MKlrIRQxCfvkG1R4xxwYy1qZONZM5kylOOcXveLYoPDrRQjS0UlOLVIwmtfdxQ2Wpl97Cy3AgWZrQIhD3nR0FXgR1kWw48GgHJdXqcIV6mriUduujvgV0Fv61DI=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB3372.namprd11.prod.outlook.com (2603:10b6:5:8::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.28; Thu, 1 Oct 2020 17:13:17 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 17:13:17 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCVeiAgACRj3CAAARTAIAAEMug
Date: Thu, 1 Oct 2020 17:13:17 +0000
Message-ID: <DM6PR11MB2841EE1B6FC6802389C85994DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841D2BF0E467EF34625BCF7DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001161030.GA3196351@kroah.com>
In-Reply-To: <20201001161030.GA3196351@kroah.com>
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
x-ms-office365-filtering-correlation-id: 9e7821e4-e920-42a4-d49c-08d8662d4a46
x-ms-traffictypediagnostic: DM6PR11MB3372:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3372482EEB0BE4292DED597BDD300@DM6PR11MB3372.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lQofuQL9dUNquvUnb+7hiR4bFRu2T7SBTuM+s1bP7hkQMuNmylJglWxPC0UT/GEETppc7t21JLXG83OaWAT2+inFykNexzw0Xii0FlgY7S5lcK0oQWIgqMoc8oE2G9PZhir39wrRayeiqsKcIJf8mnXMC8PPgRL2ZhAIvQAnxQm7IkKd28Gje8Qbac2aZKrjVSyoi+McbSQXlbWqHUm9QAHogBgezdbIWecoZFEDOVQV0+rIPIVhx5lHl4N07V+PszXbDLdQz0Oo0aCUeeIUxRFBdkcPAaMl8jySiNQkyNDoJ4LzfM0+Zydnf6V6FFDgDIDwDb+UYYxz/6RVbCQU2IWsj8ImxcjI7Eh/YvQt48hpnjZHdp7bOB5T4cxe0rOq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(7696005)(53546011)(66556008)(186003)(54906003)(83380400001)(8936002)(6506007)(71200400001)(26005)(55016002)(4744005)(86362001)(76116006)(66946007)(316002)(8676002)(5660300002)(6916009)(4326008)(66476007)(9686003)(33656002)(64756008)(478600001)(66446008)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Rh+Xh1xTKIJe1SkwBrunSoslh50zFqpgSuZt7/DTuF90kRvslL8cZhMmsNreHInRqfmWKQC0EmOvLRMwpVrLGJvUkIdehvdT4NAB30Gdoafio26aUC/9/33+6iuCIng1nWmEMPEnx6h1uSeB0PmU+U5SgEjIobLy9pgsZSqN6wAPfAC7tQwvxS+cHbzLOhTncmNHLXscEWyLTb5Gt+OIvYaBzRUByGI+4eV5X8AfX0yevi5Y9jW49w3VEvS4EiNacUV6feaOMhSOuB0AHnJ+HqDZE8DK9N1+clsY08YE/tWFEMdfN26mG//qWpetPbPZ0bGi/dO/TiQP20C94yc/JO7+t21flldLVJP51/99jSKxgIEoa4cOBQxrTU6pWcM4uo+M4X1eLPgCxmrYUjRQ2SY6HzYUcuxjrdMKH3mwNrPgx/DYMruvxXfU1q0cGalQemQAYtEqiTKsFQBV9UqnmKeA75vQpR4zts5oHR0A/hJtbnM6Za01Kvux3jBROP0BrjaykNy6Pc1wxcPX94LdjxzNDots/dryxej6Tmco68Gl/vuWWhyqqcrAHHcw6dL9/aqyM+T5ptcKK5Cy7L1ik9ikgfSq1WUuYFFcrYN5VxYDY3rIxY29rtsjDhqARa2+4IUp3W1dpTKzjGOyxHv+3A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7821e4-e920-42a4-d49c-08d8662d4a46
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 17:13:17.7223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pn3mTzFp8T+7E6YV4ehtabribRRxI9mMOqxaVWUG0U1hFDabYK+Ot86f9EwKRMS/ASzHxdkBB5iz6oh+LtbR4hMtbG+r4d2scBrNE9gltyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3372
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

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Thursday, October 1, 2020 9:11 AM
> To: Ertman, David M <david.m.ertman@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; broonie@kernel.org; pierr=
e-
> louis.bossart@linux.intel.com; Sridharan, Ranjani
> <ranjani.sridharan@intel.com>; jgg@nvidia.com; parav@nvidia.com
> Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-clien=
t
> support
>=20
> On Thu, Oct 01, 2020 at 03:55:46PM +0000, Ertman, David M wrote:
> > I have also sent this patch set to netdev and linux-rdma mailing lists.
>=20
> And not cc:ed us on it?  Wonderful, we will never see the review
> comments, and the developers there will not see ours :(
>=20
> {sigh}
>=20
> greg k-h

Yes, mea culpa, I did hose up this first version submission.  I am not used
to dealing with multiple mailing lists at the same time.

The submission of version 2 will be all mailing lists and cc'd in a single =
send.

I will learn from my mistake.

-DaveE
