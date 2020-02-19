Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7140A163CD3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 06:59:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBF8416CC;
	Wed, 19 Feb 2020 06:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBF8416CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582091946;
	bh=UocwJhfU+gHKzwUDgsvF5KkAVukTH+FASMxndeWoBR0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kUkL6w6O7O+q/yU9vaWLEJEuPOuMSUW+tWZv45Du0/oGVdXqKV3RCBPVU4XH7IYdj
	 zyjXQTKD3Wg5/ZV6npXlyYuVxoEogdLjQB/o+3z0mOmw0SAfgvnNQkFbpHMWslslm5
	 lex+GPLmLILS2eA6Vib9HUAkyfXVYfLIX8l+HRVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C95ACF801F4;
	Wed, 19 Feb 2020 06:57:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A159BF80172; Wed, 19 Feb 2020 06:57:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6AB6F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 06:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6AB6F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="BrvRDbbU"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 21:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,459,1574150400"; d="scan'208";a="434363909"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 18 Feb 2020 21:57:14 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Feb 2020 21:57:14 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Feb 2020 21:57:14 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 18 Feb 2020 21:57:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 18 Feb 2020 21:57:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEUeEJwKOGkmybkeGHSQiM3p+qjUxcfiRb3Xy80Uk66dUM/F4gj3OFcxNdXAgFtuJmfvmVUl++cPg8r/WBuGjeUTiFtRdTHfSR01DwGqeM4djvZUUql2TX+9c7HdLIwE7eKrqiDCI5ASrhbIqQ8WN1NozjJCxWRvn336j1eGjgMarzWKmhqfcvE4a8Pvt0mixWQfjXEDdsRE6P4Ff2xBAEXPnhXKWmgMDVYk5nRAhyYmXZb00cHU1NLSoB9KvBKr8bYNUAyTYQe6xw5vfaSSPy0oq22Wu8pobtRQgDazJGTS3E6Q+9uQCqQle4cCJ6sevVb4q5g3qSxldtFI8T1IAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UocwJhfU+gHKzwUDgsvF5KkAVukTH+FASMxndeWoBR0=;
 b=TTqRGVYAM7viiENkzELxUbt/CCgmhBrCGGuvc6MJGYe2lqGYsXciGcjxrL/N64tiBC8e6bL7sS2TLYSR+uaO+TYzJhm/j9X2Z+YanqYGdEoXMyRcAYVJ1nQcJVaR3JXieCmPY1W8gPQKNzrIrRALzOQNmRm+iuw9fxo885p7+jXrsqWjhAISDZca1ye6vWbD91g5oUXk6oC1JzNcNrlAuVegA4mKumBzZd2i25ynoj5eC99e3wpwcmwz1Wow7uN4TH8AvUFa+a10Jb2ITQToIq0w/oZ7EFYWwGxTA9q84+pXL8LJlCanXN1Y1zxp2ca1wEL/vtMYXexV1L8GXOfjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UocwJhfU+gHKzwUDgsvF5KkAVukTH+FASMxndeWoBR0=;
 b=BrvRDbbUmvyRpf5H02X4T3ctGiV8mnIQ52nCx2LoZQnWIS/IFQnS7M59t/ybhbZvWPNGyp84JRri3mIo8MtaJ5maMwYaMXOKq67fxKfoaMIgOD4jHZ5E8lFXci+b49W2I4fReKlwgRviUlMloVYbAR/jCgynIwcZlkg08+Huxbw=
Received: from SN6PR11MB2670.namprd11.prod.outlook.com (52.135.96.25) by
 SN6PR11MB2621.namprd11.prod.outlook.com (52.135.92.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Wed, 19 Feb 2020 05:57:12 +0000
Received: from SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::d9a3:52a2:97d7:89ec]) by SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::d9a3:52a2:97d7:89ec%4]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 05:57:12 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "Sridharan, Ranjani"
 <ranjani.sridharan@intel.com>
Subject: RE: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
Thread-Topic: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
Thread-Index: AQHV3+tuqX6FpQoz5UK6Rt5tUMk2f6gUfeSAgAE8rrCAAHbDgIAARPoAgAAJp4CAAAclgIAAAzgAgADQ7wCACoXWgA==
Date: Wed, 19 Feb 2020 05:57:11 +0000
Message-ID: <SN6PR11MB2670FA720AB341183478A00B97100@SN6PR11MB2670.namprd11.prod.outlook.com>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
 <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
 <CAFQqKeWHDyyd_YBBaD6P2sCL5OCNEsiUU6B7eUwtiLv8GZU0yg@mail.gmail.com>
 <2eeca7fe-aec9-c680-5d61-930de18b952b@linux.intel.com>
 <CAFQqKeXK3OG7KXaHGUuC75sxWrdf11xJooC7XsDCOyd6KUgPTQ@mail.gmail.com>
 <c9dbcdd8-b943-94a6-581f-7bbebe8c6d25@linux.intel.com>
 <AM6PR10MB22630C79D08CE74878A6A096801B0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM6PR10MB22630C79D08CE74878A6A096801B0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWJiOWRhMWMtNTdmOC00MzY4LWJkMzYtYzhhNWNiZGFlMGZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC9HVEtnVnJueExUaWppTVlHMTU3Mjl0SW00UXZNMjIwazg1ODg1VGlxQTBkS3BlREw0Nkc1a2hWaEpRdVRCRVAifQ==
x-ctpclassification: CTP_NT
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [192.55.52.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a67b037-f774-489f-5332-08d7b5009036
x-ms-traffictypediagnostic: SN6PR11MB2621:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB26219488ACC0BBBAE4E9AA0397100@SN6PR11MB2621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(376002)(396003)(39860400002)(199004)(189003)(8676002)(33656002)(7416002)(8936002)(110136005)(186003)(316002)(54906003)(81156014)(4326008)(66446008)(52536014)(66476007)(64756008)(5660300002)(66556008)(6506007)(26005)(76116006)(66946007)(81166006)(55016002)(9686003)(6636002)(7696005)(2906002)(86362001)(478600001)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR11MB2621;
 H:SN6PR11MB2670.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3WcBUnFBjiF1jKAxel51eNgNtu0MQVAbPhTEdsa8j02Wi3IV3NtY0ZFot0zIf9i+6J85sPwse7v3SGv9/CwrrjwIs2oMJKanQgml48H+JBKM702uLIYyGNNLNUFyhEbt8CqUFjwYkxqW5o5pSV+VFDeqgQcIpEqmB1BmL+KkWw7IDaoT+fXQUOgq7JbhJU5EL+uuXY/lvRVyhP8zJVrz8E960jpQNDrF0G1imjOQfp38WRidYC5b4SynVr9xJP5bDGsQuhJJxt3Aqmz/3FDeGegIheEM2b6OGhYzyp0Pk+ZrrIXuj2ndqvI79c4RTWOzm0hVROqu9qoPkXwBv7iGbIB1WrAICnFkO1s7aQrE4z+ruktTUVZ1QZmB8lhvi0Xzxfptzus8HOoFs2/O5WbWEiPMKh+vif0dbNOkHAyM6deYr6jyBeXs9pS0nkjXGmtR
x-ms-exchange-antispam-messagedata: eyqj2S8Sy46Anlq3t82J5o7p1M29NolOS1rO1meKn8b5g6mPv8XwXWc1v+2Zz6POnFawotki+8e3GNQTgs+uKMXMGHscjdjtAlbzgb62im2S1RLC6LuynVzM1yxqyZKoN+GiBcO/T+Yc6/QC9UJpRQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a67b037-f774-489f-5332-08d7b5009036
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 05:57:11.8372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bERvND9MHGEHxk4gh2+s2vZ8QT+cBcmvDtpy/NbIJ4kL2H9ENy6uxhdmMf0S4RuAOYCEgTgAPv+xgdI/t9uEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2621
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Support
 Opensource <Support.Opensource@diasemi.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "cychiang@google.com" <cychiang@google.com>
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

PiANCj4gQW0gbm90IGdvaW5nIHRvIG1ha2UgbXlzZWxmIHBvcHVsYXIgaGVyZS4gSXQncyBNQ0xL
IGFuZCBGU1lOQyAob3IgV0NMSyBhcw0KPiBpdCdzIHRlcm1lZCBmb3Igb3VyIGRldmljZSkgdGhh
dCBpcyByZXF1aXJlZCBmb3IgU1JNIHRvIGxvY2sgaW4gdGhlIFBMTC4NCj4gDQo+IFNvIGZhciBJ
J3ZlIG5vdCBmb3VuZCBhIHdheSBpbiB0aGUgY29kZWMgZHJpdmVyIHRvIGJlIGFibGUgdG8gZ2V0
IGFyb3VuZCB0aGlzLg0KPiBJIHNwZW50IGEgdmVyeSBsb25nIHRpbWUgd2l0aCBTYXRoeWEgaW4g
dGhlIGVhcmx5IGRheXMgKEFwb2xsbyBMYWtlKSBsb29raW5nIGF0DQo+IG9wdGlvbnMgYnV0IG5v
dGhpbmcgd291bGQgZml0IHdoaWNoIGlzIHdoeSBJIGhhdmUgdGhlIHNvbHV0aW9uIHRoYXQncyBp
biBwbGFjZQ0KPiByaWdodCBub3cuIFdlIGNvdWxkIHByb2JhYmx5IHJlZHVjZSB0aGUgbnVtYmVy
IG9mIHJlY2hlY2tzIGJlZm9yZQ0KPiB0aW1lb3V0IGluIHRoZSBkcml2ZXIgYnV0IHRoYXQncyBy
ZWFsbHkganVzdCBwYXBlcmluZyBvdmVyIHRoZSBjcmFjayBhbmQgdGhlcmUncw0KPiBzdGlsbCB0
aGUgcG9zc2liaWxpdHkgb2Ygbm9pc2UgbGF0ZXIgd2hlbiBTUk0gZmluYWxseSBkb2VzIGxvY2su
DQoNCkhpIEFkYW0sDQoNCkZvciBHb29nbGUgQ1RTIHJlcXVpcmVtZW50ICgyMDBtcyBjb2xkIG91
dHB1dCBsYXRlbmN5KSwgd2UgcGxhbiB0byB1cGxvYWQgYQ0KcGF0Y2ggd2hpY2ggcmVkdWNlcyB0
aGUgcmVjaGVjayBudW1iZXIgdG8gNCBhbmQgaW50ZXJ2YWwgdG8gMjBtcyBzbyB0aGUgdG90YWwN
CmRlbGF5IGhlcmUgd291bGQgYmUgODBtcyBmb3Igb3VyIHBsYXRmb3JtLiBXZSB0aGluayB0aGUg
dGltZSBpcyBzdGlsbCBzdWZmaWNpZW50DQpmb3Igb3RoZXIgcGxhdGZvcm1zIHRvIGdlbmVyYXRl
IGEgc3RhYmxlIFdDTEsgYW5kIGZvciB0aGUgY29kZWMgU1JNIHRvIGxvY2sgYnV0DQpzdGlsbCBu
ZWVkcyB5b3VyIGNvbmZpcm1hdGlvbi4gSG93IGRvIHlvdSB0aGluaz8NCg0KDQpSZWdhcmRzLA0K
QnJlbnQNCg0K
