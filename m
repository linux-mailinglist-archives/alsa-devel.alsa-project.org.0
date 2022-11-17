Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E94062D0D6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 02:51:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B08B16A6;
	Thu, 17 Nov 2022 02:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B08B16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668649868;
	bh=6SSI4pA2w0OKq30Z0UKxLXGlgjeEQfzUgA+SkuL0eaY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2B7hEgwUctakEBBFC8XuAlNZoZ1wE7bQhXC/ZiCxRsRCx2bTvifkZXacHJULhJzr
	 1aHLoscphExWfA3jICXgIOOrRoSAbNJv2ygzjgxUb8BaOSotZTR6fhOFzHvwj4lzzK
	 Qxd4CNQU9GEcWYI+cf5mPjzvBWXjDXbNO52Bxjvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49F3DF80089;
	Thu, 17 Nov 2022 02:50:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9EF5F80169; Thu, 17 Nov 2022 02:50:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 6DA13F80089
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 02:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA13F80089
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2AH1nFSu9008166,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2AH1nFSu9008166
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Thu, 17 Nov 2022 09:49:15 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Thu, 17 Nov 2022 09:49:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 17 Nov 2022 09:49:55 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Thu, 17 Nov 2022 09:49:55 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt711-sdca: fix the latency time of clock stop
 prepare state machine transitions
Thread-Topic: [PATCH] ASoC: rt711-sdca: fix the latency time of clock stop
 prepare state machine transitions
Thread-Index: AQHY+ZpH35+uDd3hME6AqeXGnm5xwK5BEkAAgAE/rTA=
Date: Thu, 17 Nov 2022 01:49:55 +0000
Message-ID: <e819e88e2bba484a9cb0f835b310842d@realtek.com>
References: <20221116090318.5017-1-shumingf@realtek.com>
 <52a87839-d94d-7ace-50b7-04fec82427be@linux.intel.com>
In-Reply-To: <52a87839-d94d-7ace-50b7-04fec82427be@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzExLzE2IOS4i+WNiCAxMDowMDowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

PiA+IER1ZSB0byB0aGUgaGFyZHdhcmUgYmVoYXZpb3IsIGl0IHRha2VzIHNvbWUgdGltZSBmb3Ig
Q0JKDQo+IGRldGVjdGlvbi9pbXBlZGFuY2Ugc2Vuc2luZy9kZS1ib3VuY2UuDQo+ID4gVGhlIENs
b2NrU3RvcF9Ob3RGaW5pc2hlZCBmbGFnIHdpbGwgYmUgcmFpc2VkIHVudGlsIHRoZXNlIGZ1bmN0
aW9ucyBhcmUNCj4gY29tcGxldGVkLg0KPiANCj4gVGhhdCdzIGZpbmUuDQo+IA0KPiA+IEluIENs
b2NrU3RvcE1vZGUwIG1vZGUgY2FzZSwgdGhlIFNkVyBjb250cm9sbGVyIG1pZ2h0IGNoZWNrIHRo
aXMgZmxhZw0KPiA+IGZyb20gRDMgdG8gRDAgd2hlbiB0aGUgamFjayBkZXRlY3Rpb24gaW50ZXJy
dXB0IGhhcHBlbmVkLg0KPiANCj4gVGhhdCdzIG1vcmUgY29uZnVzaW5nLiBUaGUgY2xvY2sgc3Rv
cCBzZXF1ZW5jZSBpcyBvbmx5IHVzZWQgaW4gdHJhbnNpdGlvbnMgZnJvbQ0KPiBEMCB0byBEMy4g
VGhlIHRpbWVvdXQgaXMgb25seSBtZWFudCB0byBzaWduYWwgaG93IGxvbmcgdGhlIGNvbnRyb2xs
ZXIgZHJpdmVyDQo+IG5lZWRzIHRvIGNoZWNrIHRoZSBkZXZpY2UgaXMgcmVhZHkgYmVmb3JlIHN0
b3BwaW5nIHRoZSBjbG9jay4gVGhlIHJlc3VtZQ0KPiBvcGVyYXRpb24gZG9lcyBub3QgcmVxdWly
ZSBhbnkgaW50ZXJhY3Rpb24gYmV0d2VlbiBjb250cm9sbGVyIGFuZCBkZXZpY2UNCj4gZHJpdmVy
cy4NCj4gDQo+IElzIHRoaXMgYW4gaW52ZXJzaW9uIGluIHRoZSB3b3JkaW5nLCBvciBhIHJlcXVp
cmVtZW50IGZvciB0aGUgY29udHJvbGxlciBkcml2ZXIgdG8NCj4gZG8gc29tZXRoaW5nIGR1cmlu
ZyB0aGUgcmVzdW1lIHNlcXVlbmNlIGZyb20gRDMgdG8gRDA/DQoNCkkgd3JvdGUgaXQgd3Jvbmds
eS4gSXQgaXMgaW4gdGhlIGNsb2NrIHN0b3AgY2FzZSwgbm90IENsb2NrU3RvcE1vZGUwLg0KVGhp
cyBpc3N1ZSB3YXMgcmVwb3J0ZWQgYnkgQU1ELg0KSWYgdGhlIGphY2sgaXMgcGx1Z2dlZCBpbi9w
bHVnZ2VkIG91dCB3aGVuIFNkVyBjb250cm9sbGVyIGlzIGluIEQzIHN0YXRlLCB0aGUgY29udHJv
bGxlciB3aWxsIHJlY2VpdmUgdGhlIHdha2UgZXZlbnQuDQpUaGV5IHdpbGwgZXhlY3V0ZSB0aGUg
Y2xvY2sgc3RvcCBleGl0IHNlcXVlbmNlLg0KDQo=
