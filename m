Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C82DB465F3A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 09:17:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C7024C9;
	Thu,  2 Dec 2021 09:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C7024C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638433034;
	bh=zNsztMK+PoP/sknVm+sJnr2DGFZmlFn1XBPfzre/0+M=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETWmA6LQEiTRnphW9w8QGC5EzG1oageTAFqskSd9rw+9CwZwdKJPN9JwGelnjdenm
	 7jsZsQG0UKM/iPZvEvdZK1jEamGTTctjUgQ8mPsIq0vpDukZ3Y90ZVTU/CWNVArDWw
	 /tr8jFUdFvWZQOP4ULmASL99JaKo3vppdlSd6y3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9795DF802E0;
	Thu,  2 Dec 2021 09:15:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41E16F802A0; Thu,  2 Dec 2021 09:15:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE546F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 09:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE546F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="kK4wUvPB"
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="216669126"
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; d="scan'208";a="216669126"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 00:15:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; d="scan'208";a="513089425"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 02 Dec 2021 00:15:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 00:15:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 2 Dec 2021 00:15:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 2 Dec 2021 00:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsykUx+MD7t6av/VXRDCDTkuIr8EBC18Yw75qUn3hQ9WNtMFGTQYZX13Vn9a0HzgBpgVLxHMIrzKD0Iu+gEOttKwAEn9GnEDXJHhks/xx1x7hcPOtvaUZmR6Lvvif/L/IbGIyKhkM2Gkgr+x6EGNMtVgqCNXGccMX1zTSJE7JM2etejjZ5DZZWIBn9duqRrvabbVctkFI5Z5jMD1X1Z64sPiyANjqBB3QtiZbHRmizrJygyTDV5+zsk34Z5eCIrrz0ocGBtwcIgLyZ8VB2s4jFvYi1g8rZj5Rm6P8AsQRoXugth6BVCDXmoYkpdY//OUHEYAn1a02yUj5zilpKTLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN5lG9m56BaPOHgEbkNPaF8NPaTLUNtgzoKbXR1DQmo=;
 b=IYUgxKRqOCaTgdJE6PLR1pY5ephzsMHWazm7Ag40GQnMHNqTR6P/KjhTY1VPHdS7NE8n9OhDefz8yYeLphV2o4GefwXtVGH+/apJKh6u9dEf7Y3X4L17bfojA8ytt6GK23aPsXDuMqjMciMVHY1aSvPE29yKQS28X0hkU+VrNF1A2ghM5r7D+Ur1b/W5JjFX4ykoKzyrPsxNMpRWQnPVV76WvQXJb36nqmNyVOu4VlaGPKCKPmWNZgWCVsLNtVTa6WkXjNIHP5MFy+gBQKhel6m6blCpYfCVZymMi4JCTf7noxzdCQhS9lYvL6/KDM59pOaveFlGcDViQroz4WiaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN5lG9m56BaPOHgEbkNPaF8NPaTLUNtgzoKbXR1DQmo=;
 b=kK4wUvPBvHcYmWtWFmOmgYYEAIus5NDFkr8Ba+mlX5U+Dls6RO44fexEYxkDz9D1gNAqJbvVlupDVeU5pkepgZ++n6BEo/SD7aCU6cvIRutEFXi4ltHU0pvp7Czg2vbk4Iqp2He+aH1RcCGkUYLoEyiWcgnjCY8+P8bfxoeSfaI=
Received: from SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 by SN6PR11MB2736.namprd11.prod.outlook.com (2603:10b6:805:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 08:15:37 +0000
Received: from SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::ec60:3876:66d4:e910]) by SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::ec60:3876:66d4:e910%7]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 08:15:37 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH] ALSA: hda: intel-dsp-config: add JasperLake support
Thread-Topic: [PATCH] ALSA: hda: intel-dsp-config: add JasperLake support
Thread-Index: AQHX5k061a6qpg0Us0uUNHqGdJ+diawc6tCAgABGU4CAAaaFgA==
Date: Thu, 2 Dec 2021 08:15:37 +0000
Message-ID: <SA2PR11MB489124ED42353956827A2EC597699@SA2PR11MB4891.namprd11.prod.outlook.com>
References: <20211201004628.1153763-1-brent.lu@intel.com>
 <4e0ec119-2b15-644d-9cab-b2e19b5c0e48@linux.intel.com>
 <s5hsfvczuwq.wl-tiwai@suse.de>
In-Reply-To: <s5hsfvczuwq.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 204b86d2-56ee-492d-ed90-08d9b56bebcb
x-ms-traffictypediagnostic: SN6PR11MB2736:
x-microsoft-antispam-prvs: <SN6PR11MB273697A18251EA362EC7E9A697699@SN6PR11MB2736.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3FPxl30t6uwdGhiA8SdTzOASQSNtgEFBp0i/Rc1CtHHtjtz6wd2usyS62ejqpOD/8wm6vSgNkAsI+dF99ZR6KKG6jVPBYPllA+Jco6q7hGuGpPBt8Vwgao93CSZ3st53sfgsbiu1WZFcOLeHnOhIYA1yjTn5U17U2dwdG0MAB2t8LSmUf2ILI1HHSCMuYvR/+msw9tgBWRjFEsCE5kV7J6iYYAZ3X7FH+a2Uzgyti6BxYqh+FLrJts5O2h67Jyt7C+uvBMJsmT6Jlumlp22Vsjlu2oWd+cmlnV30jwaIBmefmztDxD1Xpnq4+zQuz9I930wVSqhipvcDZN2HZZgDt4wTGRxBoAVF7qpYyH87QNaRmoqM912M3yc8P9qBDYN9+iiIYiyrtVELpWfqRVggQgb7FmxpdDP5XbtKg97PKszej1YdquRPiIsi7fl3DbrJJtaBTmd6d6i4l69usKMHjsrBYR9HGoCpri0wHj5AlbcgYXuZF3KUmwKGAVx3l0aBpf4TtdeZksgZc+Vv4BzXJOnogSRw2NzSLgKJV9RbJBIyl/k5mU0Zt+/kw+OgYBmKwlD3HHuOY6bnfHdEYdodwAUpy99bZOq0ADZeIc3M1oRiqHvUiaQ38Ug4S375IhMwWvg1pXn4NgBu1DcW9/5fnzHZ2Sk43NMmBhQhuvBEbqeNY5mpq/BjZ7oXcLs7d+cM2QBygyyd+PA6rkOEPuL4zYlKlOLB1lwz28YJlpTlH9Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4891.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(38070700005)(66946007)(26005)(66556008)(508600001)(82960400001)(66446008)(66476007)(186003)(5660300002)(8676002)(55016003)(2906002)(52536014)(64756008)(71200400001)(316002)(110136005)(86362001)(54906003)(6506007)(7696005)(33656002)(8936002)(83380400001)(122000001)(38100700002)(9686003)(76116006)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?70pL3SlOPDEUFsLK8Ppwo5O/igKeiSOpCzv1hGklLXBBaeX9FHQNnnqcn3yo?=
 =?us-ascii?Q?tsraPFTgdrqjOtvcdVU7uWkvSClAtzek+B1hsB8QFwG79nS/jZwhpdaErBWo?=
 =?us-ascii?Q?1JAVG9TgqLsLiykNULdsIKVoz7VcDkQkzoREwgbhqf6W4mlqURM5CkXHf/6t?=
 =?us-ascii?Q?OPDutyaRZhOHyBZyymx+A4nfAT0oU+ErBJjAVpGH6CFZmbMXVeUsQKsVOXwa?=
 =?us-ascii?Q?vwEFwCMKlz/qknpnMaDlVhwkZNxjJUJaxI0aEJZSU1XIT9s33D/thWMX/VzM?=
 =?us-ascii?Q?OUpD1o8ACa/90DpxkYS2Y1MKPLyW1plAzVeq1zlNRioIaMXN/Fram4xP7Esv?=
 =?us-ascii?Q?W0+XPb1MY3wc2MHdwKuNsPN9g9EoqD2q8Dca0zaL9/Kufb4FuoNu5lf8TeT3?=
 =?us-ascii?Q?pB6YslGmWhgotp/SzYImXKEIa5DlVV05cISFCdKsIEjlzXK7Z+Z5nq3LFBVm?=
 =?us-ascii?Q?m47qfPU4e5uUv5GBVKpI75nLS6U1ITSCKA/GRuZR/Wi4KcLx7nnzi/SWozfl?=
 =?us-ascii?Q?Du+3qRuXY7ZKE3EHI5G9G5/r55DKzq0YtrGbJdqa2OUrL0qhOIsg4Z6WCCLZ?=
 =?us-ascii?Q?kjLEpt5K1YOXFM7Els3KDQBKrQm4E3RcFdTMmcEVZPkHgrvLUVhxzrg5Rlv2?=
 =?us-ascii?Q?u4M4zCoFT7FGJiejLji9cGVi2UKxB6+xvRxH9PkIy1A45DLF/h1ZP79KBbGZ?=
 =?us-ascii?Q?sYKX+J0g+nN2MVLPhhIyyZps3fSoo67JLe2InscXyh0koGXr215KgIihHKRI?=
 =?us-ascii?Q?3pv1NxAMzRIOcoBcc4NSZPr8bAyf2KhTPicdAcbirXjn2xlf3yLB1wxgX5TK?=
 =?us-ascii?Q?Q7jsRpmxQ/H+WYqbZCm6i0euattXhIlMUXRS4fDjDe8MlyZPhZjVXzfIYVug?=
 =?us-ascii?Q?6mS5qHXMgGpn0MvJdfyVUbwNh4XNBQoaA6ysEn5bfDGNKJ3f3Koo7u/NHHgz?=
 =?us-ascii?Q?JFVpCMLAedN+/1JiLY600i7gqPBizhgoCW2SmIghBZc0oUrgCAtVI20DcVsS?=
 =?us-ascii?Q?4Y1kGP39szGXU1VBQXWG07L1phzOLxfXOFFF9FWXKIDnCer9KUw+4VG7MJ5j?=
 =?us-ascii?Q?TCmJXOPz7UIoS3uWjJfLN+u3LUeYBgksgstZZM+77K/WnVPRkptjZJb86p5V?=
 =?us-ascii?Q?kEFudQJ3HTmxLmjOhYfFFep6yvCcMmNhMV6sxR6rgpW/PYgo5vB1gCBZ6tz4?=
 =?us-ascii?Q?X0XFRdqClCYkaqdbB21Y6Ez7TieZN0pxScz0Dp3PfXez28q0yWz9suw7kG/1?=
 =?us-ascii?Q?74lXijUl13w3H8d+2kL7OiUbG1Y/pFvqrLDIvBF+EfYDfCC6Jrv8I2Bh10dY?=
 =?us-ascii?Q?t6YOoJoAuI6LrB69HKpkK55qYgbas/4WNoVDNVgD/C5Rmc8uRJY9DIpX+hub?=
 =?us-ascii?Q?fplewd8/O17XoopxFhobG8C/yZiQ9TkS7OHyarH50BbbBXKShoM0GIU8I8V/?=
 =?us-ascii?Q?zD2qiKJM0tmU/Eg9IuEEVd2c2/SEMuCwr0AYws6KrpMKBWkVyhe4fJ9ZpPIy?=
 =?us-ascii?Q?bdQCwc6oNLBffub/xY+rmGgY08TVt3vNwJlVA0TUW9EPBCmyoXoZy9cqzSGl?=
 =?us-ascii?Q?zOyZLbS90fSmC18o4aiAqvBAytqE6zZR/r8HNcwZlzQingZPTziXYqkfScky?=
 =?us-ascii?Q?Og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4891.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204b86d2-56ee-492d-ed90-08d9b56bebcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 08:15:37.1037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KWRthHxDw5DQwfFTFGBURXo5M79d/OXv5Ps+7TQmGrGVpWlo+c9KRpGCVlMAhoGkVTA4EvP77ee4mYzt5W+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2736
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, "Liao, Bard" <bard.liao@intel.com>
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

> >
> > Thanks Brent, yes this is an oversight, we should have added this a
> > long time ago.
> >
> > I don't think however that this will apply on Takashi's for-next
> > branch, it'll conflict with the ALSA: intel-dsp-config: add quirk for
> > JSL devices based on ES8336 codec
>=20
> Actually it's for-linus branch, destined to 5.16-rc4.
>=20
> > +/* JasperLake */
> > +#if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
> > +	{
> > +		.flags =3D FLAG_SOF,
> > +		.device =3D 0x4dc8,
> > +		.codec_hid =3D "ESSX8336",
> > +	},
> > +#endif
> >
> > Do you mind rebasing and resending the update? Let's keep the ESS
> > stuff last as done in other platforms, and add your changes on top of t=
his.
>=20
> Yes, please resubmit.  I can merge and resolve the conflict in my side, b=
ut it's
> better to get a cleaner patch from the beginning.
>=20
Hi gentlement,

I found following two patches in sof github do not exist in both broonie:fo=
r-next
and broonie:for-linus. Maybe it would be easier if I resubmit my patch to s=
of
github instead of alsa-dev?

sof: topic/sof-dev
986f58741d0d ALSA: intel-dsp-config: add quirk for CML devices based on ES8=
336 codec
2cccdf5b4414 ALSA: intel-dsp-config: add quirk for JSL devices based on ES8=
336 codec

Regards,
Brent
