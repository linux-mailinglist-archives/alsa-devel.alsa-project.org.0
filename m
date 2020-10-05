Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC8282EDB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 04:37:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F371E1838;
	Mon,  5 Oct 2020 04:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F371E1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601865429;
	bh=AV/5O8zAFzGAhspQbsLuubINdeqobSwaxaGcm/brkkA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8XM3Kxv+UXN8NEZt81312N3A0dAjg55ILEf4/A4XGTDXcS8CTzeobAs23QWn1tIw
	 fwzNTGrwA0jcEgQecEk+eDsaAiSAVIPanpxMWLBt7BnOKfXLRO9eSQb2tRgN4W8UGv
	 JlQAX1TXSMFRJPxOeo58XpLriHD/5FLfmZlFjztc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 798A0F80260;
	Mon,  5 Oct 2020 04:35:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 121C9F80260; Mon,  5 Oct 2020 04:35:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 766D1F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 04:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 766D1F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="g2KcVL3o"
IronPort-SDR: Zmbqb+C0kMGgduxJvJvvUXzCJ3fusbm8j0XnZHF794tUu6dfu4Rxm1SmFCptoiCnb8hgHLO1UB
 fN0YIaeuTldA==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="164169374"
X-IronPort-AV: E=Sophos;i="5.77,337,1596524400"; d="scan'208";a="164169374"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 19:35:11 -0700
IronPort-SDR: rL2mCs2xidTCT8xNTQNapB3zwHRnJAzDnlDA2CKHraUS/fhg1pz1mEwSsgNjfMZlDloRkd0rvU
 G+mPHXlu9olA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,337,1596524400"; d="scan'208";a="515846834"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2020 19:35:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Oct 2020 19:35:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 4 Oct 2020 19:35:10 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.59) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 4 Oct 2020 19:35:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj7kwRhOvJnentj1Qj21wcVOr5Bcs+glz3Dx+X15SwLiTevZPIuTA5eqWhLZ3JVGFOONDz345XCo3EMfYYWIkGe6C6w7CJjpSbzfq98Uy/7jcqQ0y1dxmBThGbCKw+cEylRlk5Ueac9oR7iovqgS/5UFHIcC+HAZ/JK6yIp7wv13zLd8kCXnFbwDyfurR5R3YAsMe1yy2jfBYmuoQ4GXyLVxARWLeXAP/t7MGqjiCkUBX/f7C9KstvV1RBkS+G6TGr/awvTRI/HDRZMBjN02nI1q8eP2ot4kb9EJFcLKeYbr5L/MRuWaqauEpJH5j1OTKjQuK90PHdzXTqNLE9Msuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV/5O8zAFzGAhspQbsLuubINdeqobSwaxaGcm/brkkA=;
 b=jPm7mDVuJER/8/jnZYALeVxjQWWnI+flfTapVQylEIMpWRzL3cgjwCeXTPyB0JwADTujkRMmXtA5OSvyiszbJvqkUEur7IZICKcy393PX2BSgzFdYt+UQQ6YU6/Har2Js1TRfcewKz8obEXV4lu7oWkwoRIVu2lQNS0SCqfcb+ib+GJD/apqzo/C4o9Lo4jYPiATSNSPzl6gC8l33EkpfYXNDuS2M6kUT7OMtmv8e8Evon77+MMv4ecG1YbKW8kdh6OguKQAimB9SGOkajkgtNxVCx4mCcmHaSP/2Ig+kSkl2F4uB4SCamJzw7HqGDwIe/34KC1FCZOrrjRkaR63ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV/5O8zAFzGAhspQbsLuubINdeqobSwaxaGcm/brkkA=;
 b=g2KcVL3oewQAfWMUyCn65sf2J3XuYQsIPyKrkTv5etikBPtg/kf3uyQePABvEwpnvz9JWPKb0ZlMopcHrjmfwZGJ0dMK6zuixpN2DCW1u+CngT9pPZ0bZbx5jtz8j302dh/hLwGm6fCchRnLRLawcDtROQZhsPY4qTP3l2Ifc7w=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM5PR11MB1803.namprd11.prod.outlook.com (2603:10b6:3:10f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Mon, 5 Oct 2020 02:35:09 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::6d10:7101:a24a:74d4]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::6d10:7101:a24a:74d4%2]) with mapi id 15.20.3433.038; Mon, 5 Oct 2020
 02:35:09 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Topic: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Thread-Index: AQHWl3xDvKWSWQdJ60eB+Xz3B/EyS6mCt1aAgACajwCAAG80gIAAzN2AgAEKx4CAAriPAA==
Date: Mon, 5 Oct 2020 02:35:09 +0000
Message-ID: <8e0bb7b90d689f98fc2dd861b4444fda9b36bab8.camel@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
 <20201001130245.GB2378679@kroah.com>
 <f3fa8df9fc8bcd789167f61b6c9d4df66b9b85c1.camel@intel.com>
 <20201002045357.GA34005@kroah.com>
 <ad38db14921dc5afb424db1ecac53053f15bb753.camel@intel.com>
 <20201003090201.GC114893@kroah.com>
In-Reply-To: <20201003090201.GC114893@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [192.198.151.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1742063-d19b-4774-8b9b-08d868d74732
x-ms-traffictypediagnostic: DM5PR11MB1803:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1803A9E43450DA13535ABD58E80C0@DM5PR11MB1803.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XimmaTq6NdITfCURIrbn6ZdI0YcuoMGwmD5Sl8o+poUdCMjENGznk3cUEfLlpZFJBvlseDw7GJN01BjE7qOM8ly7LRRZnYAb1n7uTm0vmf4lQIGEHyRFi+7hlMXqjGjyvHAYtGE3yveAt8feLXHCQC/QpdapPyIbDp/gGOSjvWpVj4VuL4nP7I5um9oQDlbAYmLG5UeQ8c4vLZNDwVlrXfcmSHhcmVv+YhQ271dzq3LH2CWuR6+m4l9xAi2YSqoTxvzAujtRAkFOPso+BLe4e70c46RxVswaPI2wSkzwElHYbYfEXMP8dRj6fsT85wak
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(8936002)(71200400001)(6916009)(2906002)(186003)(86362001)(36756003)(8676002)(6486002)(76116006)(91956017)(6506007)(66556008)(64756008)(66446008)(26005)(83380400001)(4326008)(6512007)(316002)(54906003)(66476007)(478600001)(5660300002)(66946007)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pZcDZcNiWKhzDYfDoPpXZSwqqpLkhi5tK7LCLL+jPuo4zu7kpVUGSvbMTomf/ElE5HpbIJW6XalsxoIpfePZZge5GL8wpBXpC7OJJHJe5bmwNUSgn6dseLZ2Z+S4w3jVCIGWASY3puh4xK2RqDDz2odAZ9d0lJMcysA2m/2rfXqj2+exbMn1DoUuxwMcRAojejdk5GwTGveJPJuWIDogjQISPHBjHVmZvUxyobdr5WcFqb9Rdl1tEjFWk3tkZApdxGgrDA4cGygaTxMZJLrm4LMlC5FGRFwN8uZc34VYFdCRGQm+s/1kHlKD/3tc7OE/+6zStze9e/30kD+yoI/V5XDaIp+68ObpJsWDS1ilzPv6Err9QV+DT+UI0Fyti1B06kOneylEPXkv0vRJZxMxs0dkToyI19UPWYPispbExtb2mXvSZudevk949PD7VamYwdmlRZOPni0LHozRkXdCyans8eoRefy8YUIRhY7TeklHpa5v7YXhLbh4Jhvo2hvtHr2cI66YvgjuxUDy77SsnZeudvd7EtfupOjoV+69Q1+3zEwjxR/XmrQ+q9F8oeVTxg7Xsbt9fdYhRgzFg8xiD+H6NUazH5LOWUo6IeEBNpzBtE6fTr9WNnRvbzg7KL8C+38DKMU6jyrPtbuD/mlP6w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4F198A5CFA2F142ADBA98D7B366A2AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1742063-d19b-4774-8b9b-08d868d74732
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 02:35:09.3028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYR41ia8zu8+MLLNrT987EIfBpHbQJNWWbc2lVaKCPS6laBfCH33WMbyuLtg8w4J6rWIlpK/BHxyw7917eTDD7EMogVS/+R+6UTsfesi18M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1803
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
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

T24gU2F0LCAyMDIwLTEwLTAzIGF0IDExOjAyICswMjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gRnJpLCBPY3QgMDIsIDIwMjAgYXQgMDU6MDc6MTNQTSArMDAwMCwg
U3JpZGhhcmFuLCBSYW5qYW5pIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAyMC0xMC0wMiBhdCAwNjo1
MyArMDIwMCwgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gPiB3cm90ZToNCj4gPiA+IE9u
IFRodSwgT2N0IDAxLCAyMDIwIGF0IDEwOjE2OjAwUE0gKzAwMDAsIFNyaWRoYXJhbiwgUmFuamFu
aQ0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwgMjAyMC0xMC0wMSBhdCAxNTowMiArMDIw
MCwgR3JlZyBLSCB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAwMzo1
MDo0N1BNIC0wNzAwLCBEYXZlIEVydG1hbiB3cm90ZToNCj4gPiA+ID4gPiA+IEZyb206IFJhbmph
bmkgU3JpZGhhcmFuIDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+IEEgY2xpZW50IGluIHRoZSBTT0YgKFNvdW5kIE9wZW4gRmlybXdh
cmUpIGNvbnRleHQgaXMgYQ0KPiA+ID4gPiA+ID4gZGV2aWNlIHRoYXQgbmVlZHMgdG8gY29tbXVu
aWNhdGUgd2l0aCB0aGUgRFNQIHZpYSBJUEMNCj4gPiA+ID4gPiA+IG1lc3NhZ2VzLiBUaGUgU09G
IGNvcmUgaXMgcmVzcG9uc2libGUgZm9yIHNlcmlhbGl6aW5nIHRoZQ0KPiA+ID4gPiA+ID4gSVBD
IG1lc3NhZ2VzIHRvIHRoZSBEU1AgZnJvbSB0aGUgZGlmZmVyZW50IGNsaWVudHMuIE9uZQ0KPiA+
ID4gPiA+ID4gZXhhbXBsZSBvZiBhbiBTT0YgY2xpZW50IHdvdWxkIGJlIGFuIElQQyB0ZXN0IGNs
aWVudCB0aGF0DQo+ID4gPiA+ID4gPiBmbG9vZHMgdGhlIERTUCB3aXRoIHRlc3QgSVBDIG1lc3Nh
Z2VzIHRvIHZhbGlkYXRlIGlmIHRoZQ0KPiA+ID4gPiA+ID4gc2VyaWFsaXphdGlvbiB3b3JrcyBh
cyBleHBlY3RlZC4gTXVsdGktY2xpZW50IHN1cHBvcnQgd2lsbA0KPiA+ID4gPiA+ID4gYWxzbyBh
ZGQgdGhlIGFiaWxpdHkgdG8gc3BsaXQgdGhlIGV4aXN0aW5nIGF1ZGlvIGNhcmRzDQo+ID4gPiA+
ID4gPiBpbnRvIG11bHRpcGxlIG9uZXMsIHNvIGFzIHRvIGUuZy4gdG8gZGVhbCB3aXRoIEhETUkg
d2l0aCBhDQo+ID4gPiA+ID4gPiBkZWRpY2F0ZWQgY2xpZW50IGluc3RlYWQgb2YgYWRkaW5nIEhE
TUkgdG8gYWxsIGNhcmRzLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGlu
dHJvZHVjZXMgZGVzY3JpcHRvcnMgZm9yIFNPRiBjbGllbnQgZHJpdmVyDQo+ID4gPiA+ID4gPiBh
bmQgU09GIGNsaWVudCBkZXZpY2UgYWxvbmcgd2l0aCBBUElzIGZvciByZWdpc3RlcmluZw0KPiA+
ID4gPiA+ID4gYW5kIHVucmVnaXN0ZXJpbmcgYSBTT0YgY2xpZW50IGRyaXZlciwgc2VuZGluZyBJ
UENzIGZyb20NCj4gPiA+ID4gPiA+IGEgY2xpZW50IGRldmljZSBhbmQgYWNjZXNzaW5nIHRoZSBT
T0YgY29yZSBkZWJ1Z2ZzIHJvb3QNCj4gPiA+ID4gPiA+IGVudHJ5Lg0KPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiBBbG9uZyB3aXRoIHRoaXMsIGFkZCBhIGNvdXBsZSBvZiBuZXcgbWVtYmVycyB0
byBzdHJ1Y3QNCj4gPiA+ID4gPiA+IHNuZF9zb2ZfZGV2IHRoYXQgd2lsbCBiZSB1c2VkIGZvciBt
YWludGFpbmluZyB0aGUgbGlzdCBvZg0KPiA+ID4gPiA+ID4gY2xpZW50cy4NCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDwNCj4gPiA+
ID4gPiA+IHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFJhbmphbmkgU3JpZGhhcmFuIDwNCj4gPiA+ID4gPiA+IHJhbmphbmku
c3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbQ0KPiA+ID4gPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBG
cmVkIE9oIDxmcmVkLm9oQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEZyZWQgT2ggPGZyZWQub2hAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBFcnRtYW4gPGRhdmlkLm0uZXJ0bWFuQGludGVsLmNvbT4NCj4gPiA+ID4g
PiA+IC0tLQ0KPiA+ID4gPiA+ID4gIHNvdW5kL3NvYy9zb2YvS2NvbmZpZyAgICAgIHwgIDE5ICsr
KysrKw0KPiA+ID4gPiA+ID4gIHNvdW5kL3NvYy9zb2YvTWFrZWZpbGUgICAgIHwgICAzICsNCj4g
PiA+ID4gPiA+ICBzb3VuZC9zb2Mvc29mL2NvcmUuYyAgICAgICB8ICAgMiArDQo+ID4gPiA+ID4g
PiAgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmMgfCAxMTcNCj4gPiA+ID4gPiA+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ICBzb3VuZC9zb2Mvc29m
L3NvZi1jbGllbnQuaCB8ICA2NSArKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ICBz
b3VuZC9zb2Mvc29mL3NvZi1wcml2LmggICB8ICAgNiArKw0KPiA+ID4gPiA+ID4gIDYgZmlsZXMg
Y2hhbmdlZCwgMjEyIGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmMNCj4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmgNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBB
cyB5b3UgYXJlIGNyZWF0aW5nIG5ldyBzeXNmcyBkaXJlY3RvcmllcywgeW91IHNob3VsZCBoYXZl
DQo+ID4gPiA+ID4gc29tZQ0KPiA+ID4gPiA+IGRvY3VtZW50YXRpb24gZm9yIHRoZW0gOigNCj4g
PiA+ID4gSGkgR3JlZywNCj4gPiA+ID4gDQo+ID4gPiA+IFdlIGFyZSBub3QgYWRkaW5nIGFueSBz
eXNmcyBlbnRyaWVzIGluIHRoaXMgc2VyaWVzLiANCj4gPiA+IA0KPiA+ID4gWW91IGFkZGVkIGRp
cmVjdG9yaWVzIGluIHN5c2ZzLCByaWdodD8NCj4gPiBIaSBHcmVnLA0KPiA+IA0KPiA+IFdlIGFy
ZSBub3QgYWRkaW5nIGFueSBzeXNmcyBkaXJlY3Rvcmllcy4NCj4gDQo+IFJlYWxseT8gIFRoZW4g
d2hhdCBkb2VzIGNyZWF0aW5nIHRoZXNlIG5ldyBkZXZpY2VzIGRvIGluIHN5c2ZzPyAgSWYNCj4g
bm90aGluZywgdGhlbiB3aHkgYXJlIHRoZXkgYmVpbmcgdXNlZCBhdCBhbGw/ICA6KQ0KPiANCj4g
PiBUaGUgb25seSBjaGFuZ2UgaW4gdGhlIC9zeXMgZGlyZWN0b3J5IHdpbGwgYmUgdGhlIG5ldyBh
bmNpbGxhcnkNCj4gPiBkZXZpY2VzIGNyZWF0ZWQgaW4gdGhlIC9zeXMvYnVzL2FuY2lsbGFyeS9k
ZXZpY2VzIGRpcmVjdG9yeSBpZQ0KPiA+IHNuZF9zb2ZfY2xpZW50LmlwY190ZXN0LjAgYW5kIHNu
ZF9zb2ZfY2xpZW50LmlwY190ZXN0LjEuDQo+IA0KPiBUaGF0IGlzIHdoYXQgSSB3YXMgcmVmZXJy
aW5nIHRvLg0KPiANCj4gPiBJbiB0aGUgZm9sbG93aW5nIHBhdGNoZXMsIHdlJ3JlIGFkZGluZyBk
ZWJ1Z2ZzIGVudHJpZXMgZm9yIHRoZSBpcGMNCj4gPiB0ZXN0IGNsaWVudHMgYnV0IG5vIG90aGVy
IHN5c2ZzIGNoYW5nZXMuDQo+ID4gDQo+ID4gSXMgaXQgcmVxdWlyZWQgdG8gYWRkIGRvY3VtZW50
YXRpb24gZm9yIHRoZXNlIGFzIHdlbGw/DQo+IA0KPiBXaHkgd291bGQgeW91IG5vdCBkb2N1bWVu
dCB0aGVtPyAgSWYgeW91IGRvbid0IGRvIGFueXRoaW5nIHdpdGggdGhlc2UNCj4gZGV2aWNlcywg
dGhlbiB3aHkgZXZlbiB1c2UgdGhlbT8gIGRlYnVnZnMgZG9lcyBub3QgcmVxdWlyZSBzeXNmcw0K
PiBlbnRyaWVzLCBzbyBJIGZhaWwgdG8gc2VlIHRoZSBuZWVkIGZvciB1c2luZyB0aGlzIGFwaSBh
dCBhbGwgaGVyZS4uLg0KSGkgR3JlZywNCg0KUGFyZG9uIG15IGlnbm9yYW5jZSBoZXJlIGEgYml0
LiBUeXBpY2FsbHksIHdoZW4gcmVnaXN0ZXJpbmcgcGxhdGZvcm0NCmRldmljZXMsIHdlJ3ZlIG5v
dCBhZGRlZCBhbnkgZG9jdW1lbnRhdGlvbiB0byBoaWdobGlnaHQgaG93IHRoZXkgYXJlDQp1c2Vk
LiBPZiBjb3Vyc2UgdGhhdHMgbm8gZXhjdXNlIGZvciBub3QgZG9pbmcgdGhpcyByaWdodC4NCg0K
QnV0IGp1c3QgdG8gY2xhcmlmeSBzbyB0aGF0IHdlIGNhbiBmaXggdGhpcyBwcm9wZXJseSBpbiB0
aGUgbmV4dA0KdmVyc2lvbiwgYXJlIHdlIGV4cGVjdGVkIHRvIGFkZCBkb2N1bWVudGF0aW9uIGZv
ciB0aGUgZGlyZWN0b3JpZXMgYWRkZWQNCmluIHRoZSAvc3lzL2J1cyAoaWUgL3N5cy9idXMvYW5j
aWxsYXJ5LCAvc3lzL2J1cy9hbmNpbGxhcnkvZGV2aWNlcywNCi9zeXMvYnVzL2FuY2lsbGFyeS9k
cml2ZXJzIGV0YykgYW5kIGFsc28gZm9yIHRoZSBkZXZpY2VzIGFuZCBkcml2ZXJzDQphZGRlZCBi
eSB0aGUgU09GIGRyaXZlcj8NCg0KVGhhbmtzLA0KUmFuamFuaQ0K
