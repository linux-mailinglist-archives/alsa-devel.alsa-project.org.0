Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A38232CDA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 10:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0498483B;
	Thu, 30 Jul 2020 10:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0498483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596096252;
	bh=OytoeSxkISSPclirR+yJoRs9m+xvNaTmp6C7p1cA0jk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvAdnmDiGYBUSvJ7mPkkoJ4bjF3zGUTzRcE668ZkV6ZGCK0lRqXIUSNPqUJIy6Nl7
	 XHiMpudp7MtUh8dbarj5U1yMZ81lVilNFou0lNXGhfaabqfbY8U6v5+pP1rya2CISX
	 PNiPkJCTBX2mSB0qXvSc6wWV36gbLxcYTDxZknA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D1AF80227;
	Thu, 30 Jul 2020 10:02:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD4D0F8021E; Thu, 30 Jul 2020 10:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38015F800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 10:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38015F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="zB/f/2N2"
IronPort-SDR: 598d7ECajAeX9RzRPe4FnoX0jbcFzayqtWuQ5vfFtyaIIg0uKxmOdrhPrRNdMfhePfbZFOEKXQ
 FthAD8qfSPKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="131624231"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="131624231"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 01:02:14 -0700
IronPort-SDR: xy+QGq28c/i+IC0ugJrL9tHe5/Uk51QyzrwTOHmz+QMizI55mpkxl8Q1En9ySRPaqWKYB+azvZ
 Ir6SKDPq/FJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="490578032"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jul 2020 01:02:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 01:02:13 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jul 2020 01:02:12 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 01:02:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 30 Jul 2020 01:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUkMSr+rqKUipXSNyAGV7ZRI7lZvlxNaaTrQufTshwZVRYN+3zNkeYuo+cCXCAYEoup8fkRxDj5153QQoM6cBXYwEpH/AdxIu7QHNBl17PbRtsgNkJXfMdyyW25A9UgTJMiEVMoHBrKak4ZcHdX/BBptwlHs+TN7JGRQHcRUt/goDnqWmRs7iN4vsFED3BbOWGduCSOsX7vGmTSxtNsLEJHEcYaS/ottQOYkBkrLT6g5hiD0fmZIhLQKlrX/eYtn7Xys0DWuLHe5qy3uBnE71WM69yqIQ3ncJ06uMa2RcJctvjOwe42fTAZckS9IBDBzrwAL4xfz/P/CHHHcCyToBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OytoeSxkISSPclirR+yJoRs9m+xvNaTmp6C7p1cA0jk=;
 b=lAGe1efjFlNONdRxok9MULQvZsJaeGna9bYZyrkHhtnz3n9WQnR+Fje9W5DtFi+xxkKMbKpMABLnHIJbaiBIHQoEc71u4L+khxg1e5fKOfupHus9xFjLZO+C5hdgAUgskgBU2nL5Bt8R4WaB7bG+o6HDdd2eHxbRCCxFrhrFffmwwuvBAVT4D6oBSP5PmEJEwXBIeFQc3YEJBBIVoDsyKMfjupHuj6gDtw4SSLkljDb/5CQwEp08yZjNPJ1V0CSHxsyl03S1C4Rv0InVqjriToRfxsauuJjmjEqiOEkc8dHsqjvv/+emeECzzuBxxQtaWBk0xNg8U6MEh6NAANoQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OytoeSxkISSPclirR+yJoRs9m+xvNaTmp6C7p1cA0jk=;
 b=zB/f/2N28FIm3w6fAXjRorSdDCpwbu0KO+f9bqxGZQvH0vKtpp1EtEeGMVYquSfakA7dGgoVLVx5bvzzg5OJAddTyYuXQrUQ0XTDcEqPaQ2NVpaZg7lp48rF2FIl3Agwte3a5t6LaVCuMLEpt4a03KnPtx0ZxuHLDKNBWAk5fuc=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3739.namprd11.prod.outlook.com (2603:10b6:5:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Thu, 30 Jul
 2020 08:02:09 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.019; Thu, 30 Jul 2020
 08:02:09 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZZiWhH0ib4T+aUeOy2BFXbTqlKkemFEAgAErLkA=
Date: Thu, 30 Jul 2020 08:02:09 +0000
Message-ID: <DM6PR11MB36421D9A808D401416B72D2D97710@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596020585-11517-3-git-send-email-brent.lu@intel.com>
 <4fe97f63-e552-3b2f-803c-53894b196bfd@linux.intel.com>
In-Reply-To: <4fe97f63-e552-3b2f-803c-53894b196bfd@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.25.81.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11c5c899-84a2-4ac7-c312-08d8345edc2f
x-ms-traffictypediagnostic: DM6PR11MB3739:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3739ECA45067A2968F0E934D97710@DM6PR11MB3739.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5PdFy3vttVZfIe1Stz19KgSHZIwWUg3GrIRMN7cGONcVSXhdZs2+fJloogyPKDxYsQIYMMBiR1S3wkMKAbdaMAx5E41V1ZLlZU07u7SKXjtn22dXaNRlTjP1pZ7TJ2/VL0aYSNn7tsMyI0EMRyy06lp38DIkbLMFsucwYYJZhgJe/6ut+sUKe0hlG7+AFNUXtGUbCGDt1l9GqK9/SV8jxntkTgs+BmReWG53AVqNkMDmhgmrKcvFQyDI5Tev+scd2VPySmjytKRJNrtPJefQFQCto3snNrF80WvZ8cRxpaiE4nW6iiIuCq7M9jUdNFIZS8RuGuYw6qurHPrk5bvbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(5660300002)(52536014)(186003)(7696005)(26005)(76116006)(64756008)(66946007)(86362001)(6506007)(71200400001)(66476007)(66446008)(558084003)(66556008)(110136005)(55016002)(8936002)(7416002)(4326008)(33656002)(2906002)(9686003)(316002)(54906003)(8676002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YG3uKJc69C8GwRe4Kt5S2ptUBG1J9+ZjARDMCTcAhbABYN5dcWmMM6tu1ap+POWgCl02CnH28IyQ4T1tuT+vuSdiNEckWWfgd22RFUjTk/QbOR3aL/JTDy38abxfe284wsaXf7lla98pStxyqIfZ3l48qa7swEnKz1xYBuNZsZ+p1jv//DSmgoXXy8nXXoBuUDdN0iAVKR43QO4RT8ZKhUDKZc9KLWDduaejzfU7/JuuJrD7NPeW6gscxs4W7DesHfDtYLAZsvUnHbfw8jya4xw34Upm/Lmz6zqUI7Qr5LetTYpiL3tnWzQcX4XdvGOn5xnPfLnt+/ztn/nhQJiNlkOOC9ds0DkqyC1ruj8SfUn1GUqgIs5HCv4R/yAA7eumKZtImNctcLSQ0ETI/MiLIQ2p2OWJtyS1cFCRk2IijBF1QmVGBYganKMnCZk6wnVBZoPxcAFqDuTyQsGYZI2umFE34xbkp6wv0/GBN4PFdhvAlzo4phaFNlmJTJrKhFXEYHRfbzONRNIOxJw+hv8BBJL1b6lxpSUgx3cY5+7jeFpOJ61M6JD8PZ2j7tTNc0bm3USRQKeEQj91Km2tCJfRlAb+5o0/UQBV+bd1SMXJQKzMLCFWgolMeGEvqrpVeJBiqunKiLU+SCgKpAkuhMpikw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c5c899-84a2-4ac7-c312-08d8345edc2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 08:02:09.6744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BrCpbk6CqgxpwP8FDB4QlqzljZPp3Rt7drOBANYHsJ2X14QEGy49z9GfkTE0e3wgxxA6GcKYm2pGd0vhm7oYlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3739
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
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

DQo+IA0KPiBJcyB0aGlzIHBhdGNoIHJlcXVpcmVkIGlmIHlvdSd2ZSBhbHJlYWR5IGNvbnN0cmFp
bmVkIHRoZSBwZXJpb2Qgc2l6ZXMgZm9yIHRoZQ0KPiBwbGF0Zm9ybSBkcml2ZXIgaW4gcGF0Y2gx
Pw0KDQpZZXMgb3IgYWxzYSB3aWxsIHNlbGVjdCAzMjAgYXMgZGVmYXVsdCBwZXJpb2Qgc2l6ZSBm
b3IgaXQuDQoNCg0KUmVnYXJkcywNCkJyZW50DQo=
