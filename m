Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6336FA2
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 11:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E826820;
	Thu,  6 Jun 2019 11:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E826820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559812548;
	bh=2P1MO6/AKTxlLT1NX5UQN6e5b4OfOEUtSvel7d1LpGA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSR6UY2CxkD4W8lrwrrltVcCYvh6GTpoREYlMSVKAx5E2xFLMmvJA0AMjbcNKP6C3
	 xkQSGt66lgSb19UX7RLMU8HTS2tR3Kn7XLcnWYk9HH+hDMu14s71qJd7nyCqtS1lRO
	 fmtdCWRLn56d6HXr9AR11k4AVNTNtWYw6P2AwqFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8560F896FE;
	Thu,  6 Jun 2019 11:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 209DEF896F7; Thu,  6 Jun 2019 11:14:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9B37F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 11:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B37F80768
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 02:13:53 -0700
X-ExtLoop1: 1
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2019 02:13:53 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.227]) by
 IRSMSX154.ger.corp.intel.com ([169.254.12.45]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 10:13:52 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "Nicholas.Kazlauskas@amd.com"
 <Nicholas.Kazlauskas@amd.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "Harry.Wentland@amd.com"
 <Harry.Wentland@amd.com>
Thread-Topic: Linking ALSA playback devices and DRM connectors
Thread-Index: AQHVGub3qPpDIp0ZmkGUsrmQWEy2vqaLifwAgAK/x4A=
Date: Thu, 6 Jun 2019 09:13:51 +0000
Message-ID: <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
In-Reply-To: <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <16891106A53CAF4DA96BEA4EBDA5A24C@intel.com>
MIME-Version: 1.0
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [alsa-devel] Linking ALSA playback devices and DRM connectors
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVHVlLCAyMDE5LTA2LTA0IGF0IDE3OjE1ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAwNC4wNi4xOSB1bSAxNzowNSBzY2hyaWViIFNlciwgU2ltb246DQo+ID4gSGksDQo+
ID4gDQo+ID4gSSdtIHRyeWluZyB0byBsaW5rIEFMU0EgcGxheWJhY2sgZGV2aWNlcyBhbmQgRFJN
IGNvbm5lY3RvcnMuIEluIG90aGVyDQo+ID4gd29yZHMsIEknZCBsaWtlIHRvIGJlIGFibGUgdG8g
a25vdyB3aGljaCBBTFNBIGRldmljZSBJIHNob3VsZCBvcGVuIHRvDQo+ID4gcGxheSBhdWRpbyBv
biBhIGdpdmVuIGNvbm5lY3Rvci4NCj4gPiANCj4gPiBVbmZvcnR1bmF0ZWx5LCBJIGhhdmVuJ3Qg
Zm91bmQgYSB3YXkgdG8gZXh0cmFjdCB0aGlzIGluZm9ybWF0aW9uLiBJDQo+ID4ga25vdyAvcHJv
Yy9hc291bmQvY2FyZE4vZWxkKiBleHBvc2UgdGhlIEVESUQtbGlrZSBkYXRhLiBIb3dldmVyIGJ5
DQo+ID4gbG9va2luZyBhdCB0aGUgQUxTQSBBUEkgKGFsc286IGFwbGF5IC1sIGFuZCAtTCkgSSBj
YW4ndCBmaW5kIGEgd2F5IHRvDQo+ID4gZmlndXJlIG91dCB3aGljaCBQQ00gZGV2aWNlIG1hcHMg
dG8gdGhlIEVMRC4NCj4gPiANCj4gPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPiANCj4gSXMg
dGhhdCBhY3R1YWxseSBmaXhlZCBvbiBhbGwgaGFyZHdhcmU/IE9yIGRvIHdlIG1heWJlIGhhdmUg
c29tZSANCj4gaGFyZHdhcmUgd2l0aCBvbmx5IG9uZSBhdWRpbyBjb2RlYyBhbmQgbXVsdGlwbGUg
Y29ubmVjdG9ycz8NCj4gDQo+ID4gSWYgbm90LCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0
byBleHBvc2UgdGhpcz8NCj4gPiANCj4gPiAtIEEgc3ltbGluayB0byB0aGUgQUxTQSBhdWRpbyBQ
Q00gZGV2aWNlIGluDQo+ID4gICAgL3N5cy9jbGFzcy9kcm0vY2FyZE4tQ09OTkVDVE9SPw0KPiA+
IC0gQSBzeW1saW5rIHRvIHRoZSBEUk0gY29ubmVjdG9yIGluIC9zeXMvY2xhc3Mvc291bmQvcGNt
Kj8NCj4gDQo+IElmIGl0J3MgZml4ZWQgdGhhbiB0aG9zZSB0d28gb3B0aW9ucyBzb3VuZCBzYW5l
IHRvIG1lLg0KPiANCj4gPiAtIEEgRFJNIGNvbm5lY3RvciBwcm9wZXJ0eT8NCj4gDQo+IElmIGl0
J3MgY29uZmlndXJhYmxlIHRoYW4gdGhhdCBzb3VuZHMgbGlrZSBhIGdvb2Qgb3B0aW9uIHRvIG1l
Lg0KDQpJJ20gc3RpbGwgbm90IHN1cmUgd2hldGhlciB0aGlzIGlzIGZpeGVkIG9uIGFsbCBoYXJk
d2FyZSBvciBub3QuDQoNClZpbGxlLCBvbiB0aGlzIG9sZCBJbnRlbCBodywgaXMgdGhlIHNpbmds
ZSBjb25uZWN0b3IgdGhhdCBnZXRzIHRoZQ0KYXVkaW8gY29uZmlndXJhYmxlPw0KDQpBZGRpdGlv
bmFsIHRob3VnaHQ6IHNpbmNlIEkgbmVlZCB0aGlzIGZvciB0aGUgSUdUIHRlc3Qgc3VpdGUgSSBk
b24ndA0KcmVhbGx5IGNhcmUgaG93IHRoaXMgaW5mbyBpcyBleHBvc2VkIGFzIGxvbmcgYXMgaXQn
cyBleHBvc2VkLCBidXQgb3RoZXINCnVzZXJzcGFjZSBwcm9ncmFtcyAoREVzKSBhcmUgcHJvYmFi
bHkgaW50ZXJlc3RlZCBpbiB0aGlzIGluZm9ybWF0aW9uDQp0b28uIFRoaXMgd291bGQgYWxsb3cg
dXNlcnMgdG8gYWN0dWFsbHkgaGF2ZSB0aGUgbmFtZSBvZiB0aGUgbW9uaXRvciBpbg0KdGhlIGF1
ZGlvIG91dHB1dCBzZWxlY3Rpb24gVUkuIEhhdmluZyBzb21ldGhpbmcgdGhhdCBkb2Vzbid0IGRl
cGVuZCBvbg0Kc3lzZnMgd291bGQgYmUgYmV0dGVyIGZvciB0aGlzLg0KDQpXb3VsZCB0aGVyZSBi
ZSBhIHdheSB0byBleHBvc2Ugc29tZSBpbmZvIGFib3V0IHRoZSBtb25pdG9yIGluIHRoZSBBTFNB
DQpBUEk/DQoNCj4gQW55d2F5IGFkZGVkIG91ciBEQyB0ZWFtLCBzdHVmZiBsaWtlIHRoYXQgaXMg
dGhlaXIgY29uc3RydWN0aW9uIHNpdGUuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+
IA0KPiA+IC0gU29tZWhvdyBleHBvc2UgdGhlIGNvbm5lY3RvciBuYW1lIHZpYSB0aGUgQUxTQSBB
UEk/DQo+ID4gLSBFeHBvc2UgdGhlIGNvbm5lY3RvciBFRElEIHZpYSBBTFNBPw0KPiA+IC0gT3Ro
ZXIgaWRlYXM/DQo+ID4gDQo+ID4gVGhhbmtzIQ0KPiA+IA0KPiA+IFNpbW9uIFNlcg0KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
