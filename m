Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE1316F5E2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 03:59:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3416168D;
	Wed, 26 Feb 2020 03:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3416168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582685973;
	bh=B8SOn+2nkhTZQXvuC4gpC/UHFoUpYGdji9BNS6zKF9Q=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPTHI6yXU3pTTYMcDc4s/8QLkpGMuVZPVkdKO15EAYIxmPOseIUWshw36nuz3xTMd
	 MItKWjdQF3UykQW+k+CtNpGtspnmUz+ag0i0R3joUUPUYvqdpqDnulIDT5Cqk0bUx9
	 5yi0tDzCERig5hingPeaCkUzJJqD2wQozzIWur20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D22F8016F;
	Wed, 26 Feb 2020 03:57:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBBCDF8014E; Wed, 26 Feb 2020 03:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C966F800E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 03:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C966F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="NQGLiZhC"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 18:57:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; d="scan'208";a="384670056"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by orsmga004.jf.intel.com with ESMTP; 25 Feb 2020 18:57:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 18:57:43 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Feb 2020 18:57:43 -0800
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Feb 2020 18:57:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 18:57:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh+aiTBmTKE8/3F9vUeMNHB7u/cfhUkTBTjMkoH5LstDxS702U14fIKHg8IrL9omalNVagt8Zf2P6i36KSNB23t6N8WRWkgbbGLZTq7MqqNlN2dHBX5YBRt5dbGBZ/l4ODDdYLhwOq98kWoDIO818mvhDBovf6tSFI7cW4Fp775+9znr0FztQfl0h+97PcdObMe6d8vuaix7xpMBWiVaLyffyUF98vGFLzsk57s4otEOXigwResRBv02Fh9aVvBCST7G4GYMaA79OzJewMclhELhUD7mN/3hTDu8COh3esLZYABQUc0mDSZ4iBNrFhwxnZpmK5Rg4MiuJ0THD/aWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8SOn+2nkhTZQXvuC4gpC/UHFoUpYGdji9BNS6zKF9Q=;
 b=Ih46DwYWnRDEQrS9f+V7ktERnKSTI0zaC8RaMWzl8fkCzsiSiz7GREhv3tebBir1ETGn3Le2bvR1nED6eDilCqtrKNtdZVCJw5djB2PDz/YfYgQC6+xwgHxiASsU09vCBO2tfP378L6WyM2iGIoeZEAcYYOXfHXmVS7XebjQF7oeNnUrH21KzMvIJlB5gbZv0W/8h5HOnSXRnjZ67GFytctbCZmvcTcaXagGdrSBsd7YEVwk0USv7sBiV8MEa9vmU+B9bLBA6G+KwQIv5G3MhrRi1Qdd2b5XXcHsEZmWXUuXSP0BP3UZzdbOFwu35ZHwQ0Na/E4XM0PghjXRXZgMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8SOn+2nkhTZQXvuC4gpC/UHFoUpYGdji9BNS6zKF9Q=;
 b=NQGLiZhCCQogsx4vj+w5N6HBHkLrWujX1Imrck1e5jd6M+IxsoKLnGOY71DzNgPew77AsfRTwysEID2AI3hEfBaSzAqIqTrf18mn6UvoE2OUCye8eJB+X/hI0Yby8W4YfGwRJ7ZSzLbW2Ool5WO1FLZbq3FxDHn39ndkwTzr4Xw=
Received: from SN6PR11MB2670.namprd11.prod.outlook.com (2603:10b6:805:61::25)
 by SN6PR11MB3456.namprd11.prod.outlook.com (2603:10b6:805:c8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 02:57:40 +0000
Received: from SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::d9a3:52a2:97d7:89ec]) by SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::d9a3:52a2:97d7:89ec%4]) with mapi id 15.20.2772.012; Wed, 26 Feb 2020
 02:57:40 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Kailang <kailang@realtek.com>, "Takashi Iwai (tiwai@suse.de)"
 <tiwai@suse.de>, "cychiang@google.com" <cychiang@google.com>
Subject: RE: Add headset Mic no shutup for ALC283
Thread-Topic: Add headset Mic no shutup for ALC283
Thread-Index: AdW2K/3o1bhRI19tSgevrpsPKZq2Lw2I8wkA
Date: Wed, 26 Feb 2020 02:57:40 +0000
Message-ID: <SN6PR11MB26700CC4D4D7F05EB5E2729497EA0@SN6PR11MB2670.namprd11.prod.outlook.com>
References: <2692449396954c6c968f5b75e2660358@realtek.com>
In-Reply-To: <2692449396954c6c968f5b75e2660358@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTg4MWFmZTYtMWQxMC00ZGJiLWI3OTEtMDM1MWYyZjAyZWViIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidlwvdG9Wa3gxTUdZalwvcFQ3TWJTbEJWQlNXMFI2NENIWFkxbzRcL2Y5bTlRNFhhR1hKVjNVNlNTRFVCdGJmOElxaSJ9
x-ctpclassification: CTP_NT
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [192.55.52.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6d0bf3d-f091-4c6f-b90d-08d7ba67a4c8
x-ms-traffictypediagnostic: SN6PR11MB3456:
x-microsoft-antispam-prvs: <SN6PR11MB3456258250FB72C2E146EEDA97EA0@SN6PR11MB3456.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(7696005)(86362001)(81166006)(55016002)(8936002)(9686003)(76116006)(8676002)(110136005)(558084003)(81156014)(316002)(4326008)(71200400001)(66556008)(5660300002)(478600001)(66476007)(52536014)(26005)(66946007)(186003)(6506007)(66446008)(33656002)(64756008)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR11MB3456;
 H:SN6PR11MB2670.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iQ+X+CGh+WniKBwJzJ01E3Ft9cfj36LDYtgWEa3M4fOPg0j5wwOJSL2chdSen01Tvi7Ww1BuK397BrDT1FpIn7pCwbzhVEMmzxnaFtcAtHQ69JBK+ec5qaJfuM4/E02MbnkL9TXFIboek8EDH9EiwcxxPuciSH4hXQW8d/y4eEhnlGd+MzBMj+BBE7Btl1r8mpUz6+ztK0V+8UHcgLcg/THPJN8yoWOjDGOYM65lCqoyWzYi4aN+/twv75q295t95a8Oed99LWr8G5bwkyXjFlXsun8u7G5pFl/Fsh6Si7ua7d4mXU1IUhNt2Bx8JUPoN58dVlL8CBFQLYaMZewH6JmhUzzOPsxE2og6ix/Oe+Vk91HsTxvP0lXJwr5oCuBdHFsW66awJjvqYjTLpcFMqGB1i3pPZpoFzjeIvo7baQogd5/30IywbyoyTs280Mve
x-ms-exchange-antispam-messagedata: VnogfedSgQy1r5hHsw9+WihZ6SeHkT/e/1z0tXg7xw46lbetWwg6MgiYTdOx8b+H2MhNgoUI2AzwLBITntBvleKUwJ0yXm6FVBwlsV/kn8qUJe0T4YKWavNKlOunAMS7UMaU56GEDi2KVHglo0k13Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d0bf3d-f091-4c6f-b90d-08d7ba67a4c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 02:57:40.1832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AjEENhx1JE4xQMUT/dCSh/5sRXFYFH0w6f5q/dtHjP3JIbR5u/HZBdcwWvknN69BgNt+NlH1IX1BH5Ju6cYbSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3456
X-OriginatorOrg: intel.com
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

>=20
> Hi Takashi,
>=20
> ChromeBox machine had humming noise from external skeaker plugin at
> codec D3 state.
>=20
> BR,
> Kailang

Hi,

We validated it on Guado chromebox.


Regards,
Brent
