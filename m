Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9691C151F
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 15:46:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB9616A3;
	Fri,  1 May 2020 15:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB9616A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588340805;
	bh=5kX4NwlC0g29xwx5b7gaem4MZd7tWizodGxEu+WYli8=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n3BvRR+xUSSVhwpSTQTiUfs6roUogrF/aXPOUJviIt3PXGJg5VNeq/vrLYIc4sPgB
	 v5s58R4B8I2Mdqfod305kqjpaurHVNWHiKBJenGmNCaCgo9VoBxhoWJysL0TexvKMF
	 bVtaSv4XeTr0c7nrgv4vJKkzS7UlbMEPStxu3Mfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0D6F800B6;
	Fri,  1 May 2020 15:45:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A4C4F8022B; Fri,  1 May 2020 15:44:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FD9FF800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 15:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD9FF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="mq1Yg+Tn"
IronPort-SDR: CkqlwHHDXEHmEpsIS8yx7J0n/2lYIyL6B3dmslcNs9TPetsoCBE+zqIOFkRHAufDJ4mATkuQYG
 0MoWXhXj/bJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 06:44:45 -0700
IronPort-SDR: 0BeeCBNImV61vBshGcYmB3ujnEicW074m1MIVMynLck8aOBlusxyUPl5iuPcXYvHySeThI1JV0
 Ab8ZPp7Z8/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="433315871"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by orsmga005.jf.intel.com with ESMTP; 01 May 2020 06:44:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 1 May 2020 06:44:44 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 1 May 2020 06:44:43 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 1 May 2020 06:44:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 1 May 2020 06:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIRBF+XnqNc5TYqKU8zR9aWtS1k70psrWGPw9mClelIFBbd6k8Bx2+wSZ8k9EecLjCwwcfmqBdu8oNBse7FdgWdzo8MvxUAVW9sR5/a/rjJcxYMNKIWqiHpURuWTPz2l6aXVRY+2gFedlsbaxs4oSxfqWzy5nk3MvbVG0JweUInQ2lrvt3/5OPoyoVKjWbtLIhWUj98FEH1INeXr6fP+DCg/FEY7FrF3vYOfTp+bPlbquTlBSggco/mIBd4Xvrykw6Cmfb9FbDXqqeDCEBH4NWWzzBF9dbJbzqyXf+YGVdCM8NCZQgBYdXOkNyBTyuMaMUpNS9KcYkvDJTmiz/++ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kX4NwlC0g29xwx5b7gaem4MZd7tWizodGxEu+WYli8=;
 b=dimhsPl91jtLQuJw/mZ+TlhXPptOKsZEAtA6lphyQzxZECMcEIGKzfioDm2gcVmIgj/aU607iYNHEe6zcor+2qkZF51l7A3m8C6GtSlITgRBjqy+Fr/5UhVPM9l+amvAfav4+uHRo1lWnzTp3WJd8kjxTGRBpIyNjEZs7s1ujAp84E2M01Ds96MGbx5SZI4SaOqmOkWqXI+jB+URGJZlBZQJL4sloQD6lr5UMmlpPFPI0+GBjnywiG3d4mIgK68aa3cjljYIxVVQ1ZLnDMyZOEcGmx64GynkQnNYXvT5b/JNCoDVk8kubh7PxY3IIHdNmIuFfh4FdLQ5SfNC6DoEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kX4NwlC0g29xwx5b7gaem4MZd7tWizodGxEu+WYli8=;
 b=mq1Yg+TnBjpRVz5yYCi7xPnlCvMX3JPvRFNqHsbpPZk5wVZ/ig90P4JTtgUh2RfvE/I2KzfIxLyjD41bnXUDjOSF1d8S7Dq1MCrgZ0jCh5pHM7IYeB7U0rEFYRXUxHcwqJRxS5fXMPFwfC3MMKtaCs6TY37hj0LDFbNQWV3NxIY=
Received: from BYAPR11MB2614.namprd11.prod.outlook.com (2603:10b6:a02:cc::27)
 by BYAPR11MB2968.namprd11.prod.outlook.com (2603:10b6:a03:90::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 13:44:42 +0000
Received: from BYAPR11MB2614.namprd11.prod.outlook.com
 ([fe80::b5a8:5dc3:d999:46e3]) by BYAPR11MB2614.namprd11.prod.outlook.com
 ([fe80::b5a8:5dc3:d999:46e3%7]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 13:44:41 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "libin.yang@linux.intel.com"
 <libin.yang@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
Thread-Topic: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
Thread-Index: AQHWGRhiH/9GZfwFqEKekVlquHpT8KiGrcAAgABLYYCAAJkZIIAIlO2AgAELaLA=
Date: Fri, 1 May 2020 13:44:41 +0000
Message-ID: <BYAPR11MB2614D0F1F4470C9572FBB72A90AB0@BYAPR11MB2614.namprd11.prod.outlook.com>
References: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
 <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
 <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
 <BYAPR11MB2614DF61F17186141D35059C90D00@BYAPR11MB2614.namprd11.prod.outlook.com>
 <45ac8cce-e925-e795-0bca-4b924360cf9a@perex.cz>
In-Reply-To: <45ac8cce-e925-e795-0bca-4b924360cf9a@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDQ5Y2NlY2MtMGZmMC00NGJmLTlhNzUtMzAyMjAzYTc2ZDc3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS0ZZMzE4dFhUUFwvSnRcL21sUzNhYmdRbGNxNitjbGlqenE2XC9jMzB2Um5LRTZzalc3Rjg5R1crcm9iaWl3dWNrMyJ9
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23f57e78-8d3d-4425-7ddc-08d7edd5cd01
x-ms-traffictypediagnostic: BYAPR11MB2968:
x-microsoft-antispam-prvs: <BYAPR11MB2968F53115C5CE8CA56C8E6090AB0@BYAPR11MB2968.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0390DB4BDA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8gkfLEoXwt+EJz4h9IWCqqZv+0NutgMo7AGeQsx88alA5SKLpUExaSRo5tzWEvS+cSq650QT6rCnqjXsIJeJRour2xxqMpiuS3+yz0IDQAqT+PMLld5AQI+0ANtAdW2Oz3BYyN6m6jeoAFwGGUmvJXgwDssOpTvH7ncYdsdz12DWEqs0igyOYHVvpHHO/kqvujd8Oaq89NA8dLWbrMWTdDSLscrozqxgVlM2HWVLEIgq7afGeCIpuXzk5o1ZaTyJwfrAEwmRxgApArze/u2fEk/M0ykdHp4VOR/XZpUiAUr8QYs4L0n9buyj6jG01BmgFPNAdOf15c/SYoel64lc4MUMV9lvuVLxG++OA5NcRcg/jcwmI7XfGBAjJ/qx2q/V8T9DPkUU04fPt4yKBgPPNTrEaXhTxyUOOrJ7kw552m0JmIQQ8PKNKC46fcyitV4a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(316002)(110136005)(55016002)(186003)(26005)(86362001)(33656002)(478600001)(5660300002)(64756008)(66946007)(52536014)(66476007)(66446008)(76116006)(66556008)(6506007)(8676002)(2906002)(71200400001)(7696005)(9686003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: iAqbmgPSt9PHAWEot8WTBRPTDYPyb9AQj6Na/33cTqiPsn3aMTO122u4anzHRisSomzD3KUA24xksKK+ielssVaMhnt9hFiIYzOHfAgZTxEnW/IJY5j9/fHTEbTFWWEj+olaDZu01smgjCODmTM15wZAo7FUkBYDH1uWMx88AVXNqgSUdl80h9gByjNslmCbiuYhdoAXyBHUgKZnmqbMNFByQ9AHyLrGqMfOBb7G6Necmfig17FwKzCiTEYqctbroWvMEyB8eqP5WPO97rPQbobJRaY+j3NLnl9Ijz4afqrn5rnF88SnAzOyISxtt7NH45EeVbAksNKSbkta5pVCnshgIPmRqSqrM+mXac0Fz9M6nwQnfOG4C33MjnDeeN80e4zUgOtLM41cjljEL7FpFo+siM9kE1QL45zwCWie2TVAEDoO1yGa3EH2IKRiJ4Uikc7dz7Yb8Z1f2QyqcuqF0R48LDhi+naXkaCPebMUVSU+2GarJpg0PiDO073noDtYMJBlj3rj5I3FuSoezoSX0mvtdGZE6RdiCwXY0J1v2YdI93EyzIfawciuNQNwCdKxSuHVG6ZuGjiYZ/dpPH+O6+zGkZLkYQ9cia2VhwFiYl3woRb+T8DWRH9Qk4avdA6yzETaoJGQESIIBCVEMhsZQyaJjUQ3FZLvR2EDknYm494f7ApfXyFryhn+KkYdP364XnaSTL1SCxu4nUiHXj6WX+6vMmxkiXHpNj3G/aRW99bMopspqImayPHwIppxtx+F3c8di8QgwN1OVjfUh8m6N727HZVvjO6DXVfdurN+704=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f57e78-8d3d-4425-7ddc-08d7edd5cd01
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2020 13:44:41.8479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJMGwZ99IY7QuLjE/KlmUUUi49FSy5kCPl8CuMkjyUD1eNdeU0FyPRBrq55er4Ndn6YOoogVRcQQuvlrX6GSVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2968
X-OriginatorOrg: intel.com
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

SGkgSmFyb3NsYXYsDQoNCj4gDQo+IEVuYWJsZVNlcXVlbmNlIFsNCj4gICAgY21kMSBhcmcxDQo+
ICAgIGNtczIgYXJnMg0KPiBdDQo+IA0KPiBpcyBleHBhbmRlZCB0bzoNCj4gDQo+IEVuYWJsZVNl
cXVlbmNlIHsNCj4gICAgMCBjbWQxDQo+ICAgIDEgYXJnMQ0KPiAgICAyIGNtZDINCj4gICAgMyBh
cmcyDQo+IH0NCj4gDQo+IG9yDQo+IA0KPiBFbmFibGVTZXF1ZW5jZS4wIGNtZDENCj4gRW5hYmxl
U2VxdWVuY2UuMSBhcmcxDQo+IEVuYWJsZVNlcXVlbmNlLjIgY21kMg0KPiBFbmFibGVTZXF1ZW5j
ZS4zIGFyZzINCj4gDQo+IFNvIGlmIHlvdSBsaWtlIHRvIGFkZCBhIG5ldyBzZXF1ZW5jZSB3aGlj
aCBpcyBvdXRzaWRlIHRoZSBkZWNsYXJlZCBhcnJheSwgdGhlbg0KPiB5b3UgbmVlZCB0byBhZGQg
dGhpczoNCj4gDQo+IEVuYWJsZVNlcXVlbmNlIHsgY21kaWQzIGNtZDMgYXJnaWQzIGFyZzMgfQ0K
PiANCj4gb3IgKG1heWJlIG1vcmUgcmVhZGFibGUpOg0KPiANCj4gRW5hYmxlU2VxdWVuY2UgeyBj
bWRpZDM9Y21kMyBhcmdpZDM9YXJnMyB9DQo+IA0KPiBvcjoNCj4gDQo+IEVuYWJsZVNlcXVlbmNl
LmNtZGlkMyBjbWQzDQo+IEVuYWJsZVNlcXVlbmNlLmFyZ2lkMyBhcmczDQo+IA0KPiBUaGUgaWRz
IG5hbWVzIGNhbiBiZSBhbnl0aGluZyBidXQgdGhleSBtdXN0IGJlIHVuaXF1ZSBpbiB0aGUgYmxv
Y2sgKHRyZWUgbGVhZikuDQo+IA0KPiBUaGUgZGVjbGFyYXRpb24gb3JkZXIgbWF0dGVycyBpbiB0
aGlzIGNvbnRleHQgKF9hcmdfIG11c3QgYmUgcmlnaHQgYmVoaW5kIF9jbWRfDQo+IGZvciB0aGUg
c2VxdWVuY2VzKS4gTm90ZSB0aGF0IHRoZSBmdW5jdGlvbnMgd2hpY2ggd29ya3Mgb24gdG9wIG9m
IHRoZQ0KPiBjb25maWd1cmF0aW9uIHRyZWUgKGxpa2UgdGhlIGluLXBsYWNlIGV2YWx1YXRpb24g
LSBJZiBibG9ja3MpIGFyZSBleGVjdXRlZCBvbiB0b3ANCj4gb2YgdGhpcyB0cmVlICh3aGljaCBp
cyBwYXJzZWQgYXQgZmlyc3QpISBLZWVwIGl0IGluIHRoZSBtaW5kLg0KDQpZZXMsIGl0IHdvcmtz
IHdpdGggeW91ciBuZXcgc3VnZ2VzdGlvbiBub3cuIA0KDQpEbyB5b3UgdGhpbmsgdGhpcyBwYXRj
aCBpcyBuZWNlc3Nhcnkgb3Igbm90PyBXaXRoIHRoaXMgcGF0Y2ggd2UgY2FuIHVzZSB0aGUNCnN0
eWxlIG9mOg0KRW5hYmxlU2VxdWVuY2UgWw0KICAgIGNtZDEgYXJnMQ0KICAgIGNtczIgYXJnMg0K
XQ0KDQpSZWdhcmRzLA0KTGliaW4NCg0KPiANCj4gCQkJCQlKYXJvc2xhdg0KPiANCj4gLS0NCj4g
SmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gTGludXggU291bmQgTWFpbnRhaW5l
cjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuDQo=
