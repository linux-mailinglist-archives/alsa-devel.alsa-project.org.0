Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D010515D883
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:31:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADB91670;
	Fri, 14 Feb 2020 14:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADB91670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581687075;
	bh=sWiSxN3kj43esy93vKlyUd9FQEWZZUFgv4Y3L2MkrIA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZS5pGQ6+Vh3BJXYyoiuRDxLkHKyfXhxEQ5IAT+YjLPATalEWgpM2eh+Vr+sSGbvXJ
	 ZAXzTvBDarr0IE+RZgfCn3Vr1FQv3/dPg050dgTzDnuxvTKUz3CKWjtcq2MrRqhxml
	 1HAydsHPYiXCIw4TJWKLGVvbnoO1epxW4MZbDZHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D47F80138;
	Fri, 14 Feb 2020 14:29:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23CAF8014F; Fri, 14 Feb 2020 14:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B837F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B837F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h7/4yVPH"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01EDTKXa099510;
 Fri, 14 Feb 2020 07:29:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581686960;
 bh=1YS7Dkb1NYS+Vzab+7zXb9xNzi0c4pGXQtzL6NFwZhc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=h7/4yVPH0A6KJFxhyxVLluQi0F9+60YTXSitCcA0UnEgri/DNniNo6puJqBm9KDkj
 kGx9TFADBxIQRs1X+KpBZ4IG9fDIMqj4aix+NUbc882FKAiGpCN7NQ/52GHtuaS04K
 DPYIt+BEJdmvf8Ftta9sjdPFqI2slB/jOfEAazSQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01EDTKNn089420
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Feb 2020 07:29:20 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 07:29:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 07:29:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01EDTGm2035852;
 Fri, 14 Feb 2020 07:29:17 -0600
To: Tony Lindgren <tony@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
Date: Fri, 14 Feb 2020 15:29:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212144620.GJ64767@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, "Arthur D ." <spinal.by@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: cpcap: Implement set_tdm_slot for
 voice call support
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

SGkgVG9ueSwKCk9uIDEyLzAyLzIwMjAgMTYuNDYsIFRvbnkgTGluZGdyZW4gd3JvdGU6Cj4gKiBQ
ZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29tPiBbMjAwMjEyIDA5OjE4XToKPj4g
T24gMTEvMDIvMjAyMCAyMC4xMCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPj4+ICtzdGF0aWMgaW50
IGNwY2FwX3ZvaWNlX3NldF90ZG1fc2xvdChzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwKPj4+ICsJ
CQkJICAgIHVuc2lnbmVkIGludCB0eF9tYXNrLCB1bnNpZ25lZCBpbnQgcnhfbWFzaywKPj4+ICsJ
CQkJICAgIGludCBzbG90cywgaW50IHNsb3Rfd2lkdGgpCj4+PiArewo+Pj4gKwlzdHJ1Y3Qgc25k
X3NvY19jb21wb25lbnQgKmNvbXBvbmVudCA9IGRhaS0+Y29tcG9uZW50Owo+Pj4gKwlzdHJ1Y3Qg
Y3BjYXBfYXVkaW8gKmNwY2FwID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9u
ZW50KTsKPj4+ICsJaW50IGVyciwgdHNfbWFzaywgbWFzazsKPj4+ICsJYm9vbCB2b2ljZV9jYWxs
Owo+Pj4gKwo+Pj4gKwkvKgo+Pj4gKwkgKiBQcmltaXRpdmUgdGVzdCBmb3Igdm9pY2UgY2FsbCwg
cHJvYmFibHkgbmVlZHMgbW9yZSBjaGVja3MKPj4+ICsJICogbGF0ZXIgb24gZm9yIDE2LWJpdCBj
YWxscyBkZXRlY3RlZCwgQmx1ZXRvb3RoIGhlYWRzZXQgZXRjLgo+Pj4gKwkgKi8KPj4+ICsJaWYg
KHR4X21hc2sgPT0gMCAmJiByeF9tYXNrID09IDEgJiYgc2xvdF93aWR0aCA9PSA4KQo+Pj4gKwkJ
dm9pY2VfY2FsbCA9IHRydWU7Cj4+PiArCWVsc2UKPj4+ICsJCXZvaWNlX2NhbGwgPSBmYWxzZTsK
Pj4KPj4gWW91IG9ubHkgaGF2ZSB2b2ljZSBjYWxsIGlmIG9ubHkgcnggc2xvdDAgaXMgaW4gdXNl
Pwo+IAo+IFllYWggc28gaXQgc2VlbXMuIFRoZW4gdGhlcmUncyB0aGUgbW9kZW0gdG8gd2xjb3Jl
IGJsdWV0b290aCBwYXRoIHRoYXQKPiBJIGhhdmUgbm90IGxvb2tlZCBhdC4gQnV0IHByZXN1bWFi
bHkgdGhhdCdzIGFnYWluIGp1c3QgY29uZmlndXJpbmcgc29tZQo+IHRkbSBzbG90IG9uIHRoZSBQ
TUlDLgo+IAo+PiBJZiB5b3UgcmVjb3JkIG1vbm8gb24gdGhlIHZvaWNlIERBSSwgdGhlbiByeF9t
YXNrIGlzIGFsc28gMSwgbm8/Cj4gCj4gSXQgaXMgYWJvdmUgOikgQnV0IG1heWJlIEkgZG9uJ3Qg
Zm9sbG93IHdoYXQgeW91J3JlIGFza2luZyBoZXJlCgpJZiB5b3UgYXJlY3JvZCAtRHZvaWNlX3Bj
bSAtYzEgLWZTOCA+IC9kZXYvbnVsbAp0aGVuIGl0IGlzIHJlYXNvbmFibGUgdGhhdCB0aGUgbWFj
aGluZSBkcml2ZXIgd2lsbCBzZXQgcnhfbWFzayA9IDEKCj4gYW5kIG1heWJlIHlvdSBoYXZlIHNv
bWUgYmV0dGVyIGNoZWNrIGluIG1pbmQuCgpOb3Qgc3VyZSwgYnV0IHJlbHlpbmcgb24gc2V0X3Rk
bV9zbG90cyB0byBkZWNpZGUgaWYgd2UgYXJlIGluIGEgY2FsbApjYXNlIGRvZXMgbm90IHNvdW5k
IHJpZ2h0LgoKPiBJIGhhdmUgbm8gaWRlYSB3aGVyZSB3ZSB3b3VsZCBpbXBsZW1lbnQgcmVjb3Jk
aW5nIHZvaWNlIGNhbGxzIGZvcgo+IGV4YW1wbGUsIEkgZ3Vlc3MgbWNic3AgY291bGQgZG8gdGhh
dCBzb21ld2hlcmUgdG8gZHVtcCBvdXQgYSB0ZG0gc2xvdAo+IHNwZWNpZmljIHRyYWZmaWMuCgpO
ZWVkIHRvIGNoZWNrIGhvdyB0aGluZ3MgYXJlIHdpcmVkIGFuZCBob3cgdGhleSBleHBlY3RlZCB0
byB3b3JrIDspCgo+Pj4gKwo+Pj4gKwl0c19tYXNrID0gMHg3IDw8IENQQ0FQX0JJVF9NSUMyX1RJ
TUVTTE9UMDsKPj4+ICsJdHNfbWFzayB8PSAweDcgPDwgQ1BDQVBfQklUX01JQzFfUlhfVElNRVNM
T1QwOwo+Pj4gKwo+Pj4gKwltYXNrID0gKHR4X21hc2sgJiAweDcpIDw8IENQQ0FQX0JJVF9NSUMy
X1RJTUVTTE9UMDsKPj4+ICsJbWFzayB8PSAocnhfbWFzayAmIDB4NykgPDwgQ1BDQVBfQklUX01J
QzFfUlhfVElNRVNMT1QwOwo+Pj4gKwo+Pj4gKwllcnIgPSByZWdtYXBfdXBkYXRlX2JpdHMoY3Bj
YXAtPnJlZ21hcCwgQ1BDQVBfUkVHX0NESSwKPj4+ICsJCQkJIHRzX21hc2ssIG1hc2spOwo+Pj4g
KwlpZiAoZXJyKQo+Pj4gKwkJcmV0dXJuIGVycjsKPj4+ICsKPj4+ICsJZXJyID0gY3BjYXBfc2V0
X3NhbXByYXRlKGNwY2FwLCBDUENBUF9EQUlfVk9JQ0UsIHNsb3Rfd2lkdGggKiAxMDAwKTsKPj4+
ICsJaWYgKGVycikKPj4+ICsJCXJldHVybiBlcnI7Cj4+Cj4+IFlvdSB3aWxsIGFsc28gc2V0IHRo
ZSBzYW1wbGluZyByYXRlIGZvciB2b2ljZSBpbgo+PiBjcGNhcF92b2ljZV9od19wYXJhbXMoKSwg
YnV0IHRoYXQgaXMgZm9yIG5vcm1hbCBwbGF5YmFjay9jYXB0dXJlLCByaWdodD8KPiAKPiBZZWFo
IHNvIG5vcm1hbCBwbGF5YmFjay9jYXB0dXJlIGlzIGFscmVhZHkgd29ya2luZyB3aXRoIGNwY2Fw
IGNvZGVjIGRyaXZlcgo+IHdpdGggbWFpbmxpbmUgTGludXguIFRoZSB2b2ljZSBjYWxsIG5lZWRz
IHRvIHNldCByYXRlIHRvIDgwMDAuCgpCdXQgaWYgeW91IGhhdmUgYSB2b2ljZSBjYWxsIGluaXRp
YXRlZCBzaG91bGQgbm90IHRoZSByYXRlIGJlIHNldCBieSB0aGUKc2V0X3N5c2NsaygpPwoKCj4+
PiArCj4+PiArCWVyciA9IGNwY2FwX3ZvaWNlX2NhbGwoY3BjYXAsIGRhaSwgdm9pY2VfY2FsbCk7
Cj4+PiArCWlmIChlcnIpCj4+PiArCQlyZXR1cm4gZXJyOwo+Pgo+PiBJdCBmZWVscyBsaWtlIHRo
YXQgdGhlc2Ugc2hvdWxkIGJlIGRvbmUgdmlhIERBUE0gd2l0aCBjb2RlYyB0byBjb2RlYyByb3V0
ZT8KPiAKPiBTdXJlIGlmIHlvdSBoYXZlIHNvbWUgYmV0dGVyIHdheSBvZiBkb2luZyBpdCA6KSBE
byB5b3UgaGF2ZSBhbiBleGFtcGxlIHRvCj4gcG9pbnQgbWUgdG8/CgpTb21ldGhpbmcgYWxvbmcg
dGhlIGxpbmVzIG9mOgpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9waXBlcm1haWwv
YWxzYS1kZXZlbC8yMDIwLUZlYnJ1YXJ5LzE2MjkxNS5odG1sCgpUaGUgaXQgaXMgYSBtYXR0ZXIg
b2YgYnVpbGRpbmcgYW5kIGNvbm5lY3RpbmcgdGhlIERBUE0gcm91dGVzIGJldHdlZW4KdGhlIHR3
byBjb2RlYyBhbmQgd2l0aCBhIGZsaXAgb2YgdGhlIHN3aXRjaCB5b3Ugd291bGQgaGF2ZSBhdWRp
byBmbG93aW5nCmJldHdlZW4gdGhlbS4KCj4gCj4gUmVnYXJkcywKPiAKPiBUb255Cj4gCgotIFDD
qXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
