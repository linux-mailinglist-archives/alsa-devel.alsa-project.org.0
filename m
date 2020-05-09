Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F31CBF57
	for <lists+alsa-devel@lfdr.de>; Sat,  9 May 2020 10:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C61615E2;
	Sat,  9 May 2020 10:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C61615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589013947;
	bh=abW5VG96J65SHMf9egIeHlWdDyBa7TNPCDdvM9WVo2E=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0ZnK7UUfBr5x5CxTCFfDjyOP4cXiA/qgErwZgKcy/xXBBCjSZNY9vG2RKK13B5D0
	 PakhQxRpBmyCM7GscUizClouJ1YLCuomxuWW189+Uvhugowmwy5t1nlpL44gc+lnrQ
	 ZZ+Tu1m/PWcrMvijpGnLLMj40CwMXQB19BqcDF1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8905F80162;
	Sat,  9 May 2020 10:44:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 994B8F8015F; Sat,  9 May 2020 10:44:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E339FF800E7
 for <alsa-devel@alsa-project.org>; Sat,  9 May 2020 10:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E339FF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="KQddPI1s"
IronPort-SDR: 4mg10aT/yGZMhtudN9hrxVDebvoqVirZG6Db27aHaoYV9cNDaa5cASghzo0G2IHiYF+w8yF8eE
 bVdIpdOFRZ7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2020 01:43:51 -0700
IronPort-SDR: 5RAiEP3Msq+AnSC6dq778tupoOX+bLA0Oe4tacb0W9cO+BNRPitomqrOPRAh3FOdqfs2rgD6FL
 s50TBwy25SPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,371,1583222400"; d="scan'208";a="340039825"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 09 May 2020 01:43:50 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 9 May 2020 01:43:50 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 9 May 2020 01:43:49 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.56) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sat, 9 May 2020 01:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH3ZPXkUf0EJ8USBHYnT1dN+S5suc6CKeCpYuvj0hMJQ3YCoOciH9e+OGA1cd+Bkkzg9b4DPDHJd9fhEaRLoLcTsnNdAHh4nEyViLgUJg+0SbwiwywL4A/0TXpf+ECzIcZ0jh9/S2u8lTqj7k1XOSs7IqzkVsqI2Cc6CbJiF7UERwbgVoQrZ2tfCf36wBVeJ0AKnLfM7sBc1xDzIUjzBsWLGbselMieeDnFsMIoBqt/zrB4ZSz+SqmwsRel6/jZ6HsC0QekkgyVUOTw2CEUNAEyXz4hRSOyHH9GnaQ/p5sMfZAZ5iHDL25+PB4j3UiEu4S1ALZyBBYWmT2vb825x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abW5VG96J65SHMf9egIeHlWdDyBa7TNPCDdvM9WVo2E=;
 b=cxzgfso9b83p9qdsf0ssVHG2kXtaRItDHFXeA/7XlRg693ioSITQx7bQZI3+VRxaxPSRrgNIfG7twy4URuB2gXaEk6FyoqnIbJH7uSsqZpjC9cVlE8UPIkCW8A6ST+95R7mYPr9jcmKujf5j0PuyW4CLXqoOrXCsYfPPDhV3NLN8+yzxu0kV+o2YeKdte+inL+XaW7YBZl68w8B7bZzhwxjesLMLj+5oiRBVdwtBild5UX7C8yR79EuqVrTlVD/NmfjYKk21UhoOUDmXkDMKPea3q4lMddCe3vnWHqH/DOLyniN4Qpq0MFT279hKv+9K00j2p5Ale0Eyo2BQqvENVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abW5VG96J65SHMf9egIeHlWdDyBa7TNPCDdvM9WVo2E=;
 b=KQddPI1shOYnt47CKRPyC28EaIAVJPfN6pQj4xiTCRItb7mqPP+C8M4rtNCrNSbLx0ph740Nu5/IWmz9Vm68cGcyl/vfpCEh0yso60phYAg8JEdE8wCLNeKi/XBUzkot9bY73ZvsMNmfL5X4E05brL/Gp5OjWL2a9FhA28Ibxac=
Received: from BYAPR11MB2614.namprd11.prod.outlook.com (2603:10b6:a02:cc::27)
 by BYAPR11MB3750.namprd11.prod.outlook.com (2603:10b6:a03:f9::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Sat, 9 May
 2020 08:43:48 +0000
Received: from BYAPR11MB2614.namprd11.prod.outlook.com
 ([fe80::b5a8:5dc3:d999:46e3]) by BYAPR11MB2614.namprd11.prod.outlook.com
 ([fe80::b5a8:5dc3:d999:46e3%7]) with mapi id 15.20.2958.034; Sat, 9 May 2020
 08:43:48 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "libin.yang@linux.intel.com"
 <libin.yang@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
Thread-Topic: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
Thread-Index: AQHWGRhiH/9GZfwFqEKekVlquHpT8KiGrcAAgABLYYCAAJkZIIAIlO2AgAELaLCADOdDAIABbt2g
Date: Sat, 9 May 2020 08:43:48 +0000
Message-ID: <BYAPR11MB2614A4DB593EE2A077876F8490A30@BYAPR11MB2614.namprd11.prod.outlook.com>
References: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
 <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
 <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
 <BYAPR11MB2614DF61F17186141D35059C90D00@BYAPR11MB2614.namprd11.prod.outlook.com>
 <45ac8cce-e925-e795-0bca-4b924360cf9a@perex.cz>
 <BYAPR11MB2614D0F1F4470C9572FBB72A90AB0@BYAPR11MB2614.namprd11.prod.outlook.com>
 <f0b87412-4df9-72ed-354c-a125f0c41cc4@perex.cz>
In-Reply-To: <f0b87412-4df9-72ed-354c-a125f0c41cc4@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmY5ODJmOTMtMTlhOC00MjMzLThhOWItZTcxOTA0ZTllYzA3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVzViT0oxeTIwSDd2dTNxSG1wNU9YRlVqZ0tWXC9UOTYyd09WekVnZ0ZkU2NzbVVndFwvTHlkYU5wZzV5WU1aMUVpIn0=
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b798162a-32d2-430e-9538-08d7f3f517cc
x-ms-traffictypediagnostic: BYAPR11MB3750:
x-microsoft-antispam-prvs: <BYAPR11MB37508E5ED3DB6EFF8B2DEE3E90A30@BYAPR11MB3750.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03982FDC1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AiRPMVJ97EzCYUjBNSOkvwhGZb1+eGhrJeZPR0119rK44/VsWsVZJ9Keu/X0ALnKa0zBMBXL33jS04v4PzoRPGWVWfI9FXS/Igbq9h9FVMQ+jvfM/bAYYv/XDp9cOAraG5tQmfpf6Pf9Ct/gVdhEC8zEleSVO+8XiAIYS6OMqjNCl4nP+LMSUqrQ6aLQTXunSKUB6n6KAgX1rzI7xoSU2zOWWQ9Gwap5ev0kYZod7PrzGHrKp3ZOiXsAsJO1R1idjGvPfD0XsJpf7etzWKE5YwHjxDfrrxaJXhA8b2s+Ykfik6EH15YrCtvk//09lxWZb4W1b+OAebB8wiaX5VRgD+BYwZGxI6w9s0THli/C++h8jk+2DcAcbfrP6KAYJBe37ydXhpez+rY+ax9m8aabtVNh2x2Ah8wVBwUKhhZGHIazAky9orc67o6SIk52ABaujsbhu/BEjtihDewIZF7tuxfAgwGzM9cDq7NnC2yOgCT0VQBygkK7xy/a1gjHpDfsW2qkCgXy5ZrDwKrBeiQ1ntwsotpCRjWOTaMYqiupmY2j/Jf8Wytrn1qTi8iBPIZzqV94Tt3i9IJWup0JI/O39bl5J55DQncf+6D9zVxos8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(33430700001)(5660300002)(66946007)(110136005)(4744005)(86362001)(7696005)(478600001)(33656002)(8936002)(966005)(8676002)(33440700001)(6506007)(76116006)(52536014)(66446008)(66476007)(66556008)(64756008)(26005)(55016002)(71200400001)(316002)(186003)(2906002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kJsthPwvkoOCtypWRqMLTG4/1PpwgKhjz4aa3nOkmahQtzKnc+tI+jjJkGFgtwRLoVQohmgdXne6pA4O5exd0rlZPS4qjRSWf3cuqOlU1bnOfcKmFGBUIib8qPQhg1wGBLBj3Gx4WoFs9Viie57SHKqeIEYZCGvH+sSMqpCXpmTmCPD7K0x9gvSxAJVDFZV7H042dgGaGQ//8QQrxXNm+UViluHKBCyTeaj7QNwT9/nNMZem/lnA/zSiJtJZFI5cfCdnetw8wW1zIkY454z1rMlMTrH+QNrD91R32qyPGiLdWc0+DAeuHt8IkJ3hyom8IqaZMI488c67yw5OupZHyZjwEXCow7igIUPW6uSUSSaBMnPwHVWsZ+wgO5NdlimeSFg934mpPcKMBQRaIOhkVE0DMp74OzuYeDGDykRcgAD2aXcbN5k0QzCpEKypR7DrW0Agm+bDfR+y/Ok3/EaGz3f7hyPqHThsfqsVuAMfcps=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b798162a-32d2-430e-9538-08d7f3f517cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2020 08:43:48.7045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AF7gKNcUnLmwso4OMs5/NbK3Qxoh9YmB7PQvGyAp20BQLCX8FzMpyXUfUyp/eYJozbW+5i6EOXL+OiPaT6K/+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3750
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

SGkgSmFyb3NsYXYsDQoNCj4gPg0KPiA+IFllcywgaXQgd29ya3Mgd2l0aCB5b3VyIG5ldyBzdWdn
ZXN0aW9uIG5vdy4NCj4gPg0KPiA+IERvIHlvdSB0aGluayB0aGlzIHBhdGNoIGlzIG5lY2Vzc2Fy
eSBvciBub3Q/IFdpdGggdGhpcyBwYXRjaCB3ZSBjYW4NCj4gPiB1c2UgdGhlIHN0eWxlIG9mOg0K
PiA+IEVuYWJsZVNlcXVlbmNlIFsNCj4gPiAgICAgIGNtZDEgYXJnMQ0KPiA+ICAgICAgY21zMiBh
cmcyDQo+ID4gXQ0KPiANCj4gVGhlIHBhdGNoIGNoYW5nZXMgdGhlIGNvbnNpc3RlbmN5IGluIHRo
ZSBpZCB2YWx1ZXMgZm9yIHRoZSBhcnJheSByZXByZXNlbnRhdGlvbg0KPiBpbiBtZW1vcnkgKHNv
IHlvdSBjYW5ub3QgYWRkcmVzcyB0aGVtKS4gSSB0cmllZCB0byBtb3ZlIHRoaXMgY2hhbmdlIHRv
IHRoZSByaWdodA0KPiBwbGFjZSAoVUNNIGNvbmRpdGlvbnMpOg0KPiANCj4gaHR0cHM6Ly9naXRo
dWIuY29tL3BlcmV4Zy9hbHNhLWxpYi9jb21taXRzL2FycmF5LW1lcmdlDQo+IA0KPiBDb3VsZCB5
b3UgY2hlY2sgdGhpcyB0cmVlPyBUaGUgbGFzdCBjb21taXQgaW1wbGVtZW50cyB0aGUgbWVyZ2Ug
b3BlcmF0aW9uIGZvcg0KPiB0aGUgYmxvY2sgZnJvbSB0aGUgY29uZGl0aW9uIHRyZWUgdG8gdGhl
IHBhcmVudCB0cmVlLiBBbHNvIHRoZSAiYmVmb3JlIiBhbmQNCj4gImFmdGVyIiBoaW50cyBzaG91
bGQgYmUgYWNjZXB0ZWQsIHRvby4NCg0KSSBkaWQgdGhlIHNtb2tlIHRlc3Qgb24geW91ciBwYXRj
aC4gSXQgd29ya3MuDQoNClJlZ2FyZHMsDQpMaWJpbg0KDQo+IA0KPiAJCQkJCUphcm9zbGF2DQo+
IA0KPiAtLQ0KPiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6Pg0KPiBMaW51eCBTb3Vu
ZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4NCg==
