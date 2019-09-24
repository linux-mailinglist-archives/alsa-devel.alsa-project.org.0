Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5847FBC92B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 15:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4D2D169E;
	Tue, 24 Sep 2019 15:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4D2D169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569333083;
	bh=MqwlicxPIsodVGcIt6buvUwHrYvfPcEW9AH9wt2baoQ=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqWhERUhoHbrFZuYdjKwKsE328iG4P6pLbUEGMVpZSna5LhzKZ4jSh0PA3IJeZKbH
	 vGytjy9NdZ+wspyriVWDRgR0U5cCtRzM/oQCD4hvAvgAdRXqsS45kcnJloFc0YwiZr
	 /kKlVR8gAY6h+vUzY+eRJHjWLtnf9MhvqmbB9q7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F6E1F803F4;
	Tue, 24 Sep 2019 15:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CAFFF8045F; Tue, 24 Sep 2019 15:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2634F80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 15:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2634F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qrFF08GM"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ODnVTU007283;
 Tue, 24 Sep 2019 08:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1569332971;
 bh=wlf0k6q11YWF2CV7+UT1OgrwEXRuUHF8gp6AQkDh358=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=qrFF08GMDxOye7WG0RH3e56Y5ilCZOm8A7B0nPFHA5NE2eOPoAisP9hkx0j3wTAji
 nu2dr/hTAhXvPQDyMlT95N9OFQIQINMBDUZIv0yZz7x+1FEXPZo96T/2C62UWdnNL0
 DOyuNXFkifMRlSYFoxSqLuR1LtKMQFa2qAty6jdw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ODnVdg115409
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Sep 2019 08:49:31 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 08:49:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 08:49:24 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ODnS8I064604;
 Tue, 24 Sep 2019 08:49:29 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
References: <20190924114146.8116-1-peter.ujfalusi@ti.com>
Message-ID: <cb9368c5-3cf7-e87f-665d-52d6593dc693@ti.com>
Date: Tue, 24 Sep 2019 16:50:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924114146.8116-1-peter.ujfalusi@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [RFC] ASoC: soc-pcm: Use different sequence for
 start/stop trigger
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

CgpPbiAyNC8wOS8yMDE5IDE0LjQxLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPiBPbiBzdHJlYW0g
c3RvcCBjdXJyZW50bHkgd2Ugc3RvcCB0aGUgRE1BIGZpcnN0IGZvbGxvd2VkIGJ5IHRoZSBDUFUg
REFJLgo+IFRoaXMgY2FuIGNhdXNlIHVuZGVyZmxvdyAocGxheWJhY2spIG9yIG92ZXJmbG93IChj
YXB0dXJlKSBvbiB0aGUgREFJIHNpZGUKPiBhcyB0aGUgRE1BIGlzIG5vIGxvbmdlciBmZWVkaW5n
IGRhdGEgd2hpbGUgdGhlIERBSSBpcyBzdGlsbCBhY3RpdmUuCj4gSXQgY2FuIGJlIG9ic2VydmVk
IGVhc2lseSBpZiB0aGUgREFJIHNpZGUgZG9lcyBub3QgaGF2ZSBGSUZPIChvciBpdCBpcwo+IGRp
c2FibGVkKSB0byBzdXJ2aXZlIHRoZSB0aW1lIHdoaWxlIHRoZSBETUEgaXMgc3RvcHBlZCwgYnV0
IHN0aWxsIGNhbgo+IGhhcHBlbiBvbiByZWxhdGl2ZWx5IHNsb3cgQ1BVcyB3aGVuIHJlbGF0aXZl
bHkgaGlnaCBzYW1wbGluZyByYXRlIGlzIHVzZWQ6Cj4gdGhlIEZJRk8gaXMgZHJhaW5lZCBiZXR3
ZWVuIHRoZSB0aW1lIHRoZSBETUEgaXMgc3RvcHBlZCBhbmQgdGhlIERBSSBpcwo+IHN0b3BwZWQu
Cj4gCj4gSXQgY2FuIG9ubHkgZml4ZWQgYnkgdXNpbmcgZGlmZmVyZW50IHNlcXVlbmNlIHdpdGhp
biB0cmlnZ2VyIGZvciAnc3RvcCcgYW5kCj4gJ3N0YXJ0JzoKPiBjYXNlIFNORFJWX1BDTV9UUklH
R0VSX1NUQVJUOgo+IGNhc2UgU05EUlZfUENNX1RSSUdHRVJfUkVTVU1FOgo+IGNhc2UgU05EUlZf
UENNX1RSSUdHRVJfUEFVU0VfUkVMRUFTRToKPiAJU3RhcnQgRE1BIGZpcnN0IGZvbGxvd2VkIGJ5
IENQVSBEQUkgKGN1cnJlbnRseSB1c2VkIHNlcXVlbmNlKQo+IAo+IGNhc2UgU05EUlZfUENNX1RS
SUdHRVJfU1RPUDoKPiBjYXNlIFNORFJWX1BDTV9UUklHR0VSX1NVU1BFTkQ6Cj4gY2FzZSBTTkRS
Vl9QQ01fVFJJR0dFUl9QQVVTRV9QVVNIOgo+IAlTdG9wIENQVSBEQUkgZmlyc3QgZm9sbG93ZWQg
YnkgRE1BCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNp
QHRpLmNvbT4KPiAtLS0KPiBIaSwKPiAKPiBvbiBhIG5ldyBUSSBwbGF0Zm9ybSAoajcyMWUpIHdo
ZXJlIHdlIGNhbiBkaXNhYmxlIHRoZSBNY0FTUCBGSUZPICh0aGUgQ1BVIGRhaSkKPiBzaW5jZSB0
aGUgVURNQSArIFBETUEgcHJvdmlkZXMgdGhlIGJ1ZmZlcmluZyBJIGhhdmUgc3RhcnRlZCB0byBz
ZWUgZXJyb3IKPiBpbnRlcnJ1cHRzIHJpZ2h0IGFmdGVyIHBjbV90cmlnZ2VyOlNUT1AgYW5kIGlu
IHJhcmUgY2FzZXMgZXZlbiBvbiBQQVVTRSB0aGF0Cj4gTWNBU1AgdW5kZXJydW5zLgo+IEkgd2Fz
IGFsc28gYWJsZSB0byByZXByb2R1Y2UgdGhlIHNhbWUgaXNzdWUgb24gYW0zMzV4IGJvYXJkLCBi
dXQgaXQgaXMgbXVjaAo+IGhhcmRlciB0byB0cmlnZ2VyIGl0Lgo+IAo+IFdpdGggdGhpcyBwYXRj
aCB0aGUgdW5kZXJydW4gYWZ0ZXIgdHJpZ2dlcjpTVE9QIGlzIGdvbmUuCj4gCj4gSWYgSSB0aGlu
ayBhYm91dCB0aGUgaXNzdWUsIEknbSBub3Qgc3VyZSB3aHkgaXQgd2FzIG5vdCBub3RpY2VkIGJl
Zm9yZSBhcyB0aGUKPiBiZWhhdmlvciBtYWtlcyBzZW5zZToKPiB3ZSBzdG9wIHRoZSBETUEgZmly
c3QgdGhlbiB3ZSBzdG9wIHRoZSBDUFUgREFJLiBJZiBiZXR3ZWVuIHRoZSBETUEgc3RvcCBhbmQg
REFJCj4gc3RvcCB3ZSB3b3VsZCBuZWVkIGEgc2FtcGxlIGluIHRoZSBEQUkgKHdoaWNoIGlzIHN0
aWxsIHJ1bm5pbmcpIHRoZW4gZm9yIHN1cmUgd2UKPiB3aWxsIHVuZGVycnVuIGluIHRoZSBIVyAo
b3Igb3ZlcnJ1biBpbiBjYXNlIG9mIGNhcHR1cmUpLgo+IAo+IFdoZW4gSSBydW4gdGhlIEFMU0Eg
Y29uZm9ybWFuY2UgdGVzdCBbMV0gaXQgaXMgZWFzaWVyIHRvIHRyaWdnZXIuCj4gCj4gTm90IHN1
cmUgaWYgYW55b25lIGVsc2UgaGF2ZSBzZWVuIHN1Y2ggdW5kZXJydW4vb3ZlcnJ1biB3aGVuIHN0
b3BwaW5nIGEgc3RyZWFtLAo+IGJ1dCB0aGUgZmFjdCB0aGF0IEkgaGF2ZSBzZWVuIGl0IHdpdGgg
Ym90aCBVRE1BK1BETUEgYW5kIEVETUEgb24gZGlmZmVyZW50Cj4gcGxhdGZvcm1zIG1ha2VzIG1l
IHdvbmRlciBpZiB0aGUgaXNzdWUgY2FuIGJlIHNlZW4gb24gb3RoZXIgcGxhdGZvcm1zIGFzIHdl
bGwuCj4gCj4gWzFdIGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9z
L3BsYXRmb3JtL2F1ZGlvdGVzdC8rL21hc3Rlci9hbHNhX2NvbmZvcm1hbmNlX3Rlc3QubWQKPiAK
PiBSZWdhcmRzLAo+IFBldGVyCj4gLS0tCj4gIHNvdW5kL3NvYy9zb2MtcGNtLmMgfCA2NiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDYyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9zb2MtcGNtLmMgYi9zb3VuZC9zb2Mvc29jLXBjbS5jCj4gaW5kZXggZTE2M2RkZTVl
YWIxLi5jOTY0MzBlNzA3NTIgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3NvYy1wY20uYwo+ICsr
KyBiL3NvdW5kL3NvYy9zb2MtcGNtLmMKPiBAQCAtMTA0Nyw3ICsxMDQ3LDcgQEAgc3RhdGljIGlu
dCBzb2NfcGNtX2h3X2ZyZWUoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0pCj4g
IAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBzb2NfcGNtX3RyaWdnZXIoc3RydWN0
IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sIGludCBjbWQpCj4gK3N0YXRpYyBpbnQgc29j
X3BjbV90cmlnZ2VyX3N0YXJ0KHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLCBp
bnQgY21kKQo+ICB7Cj4gIAlzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnRkID0gc3Vic3Ry
ZWFtLT5wcml2YXRlX2RhdGE7Cj4gIAlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVu
dDsKPiBAQCAtMTA1NiwyNCArMTA1Niw2MCBAQCBzdGF0aWMgaW50IHNvY19wY21fdHJpZ2dlcihz
dHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwgaW50IGNtZCkKPiAgCXN0cnVjdCBz
bmRfc29jX2RhaSAqY29kZWNfZGFpOwo+ICAJaW50IGksIHJldDsKPiAgCj4gKwlmb3JfZWFjaF9y
dGRjb20ocnRkLCBydGRjb20pIHsKPiArCQljb21wb25lbnQgPSBydGRjb20tPmNvbXBvbmVudDsK
PiArCj4gKwkJcmV0ID0gc25kX3NvY19jb21wb25lbnRfdHJpZ2dlcihjb21wb25lbnQsIHN1YnN0
cmVhbSwgY21kKTsKPiArCQlpZiAocmV0IDwgMCkKPiArCQkJcmV0dXJuIHJldDsKPiArCX0KPiAr
Cj4gIAlmb3JfZWFjaF9ydGRfY29kZWNfZGFpKHJ0ZCwgaSwgY29kZWNfZGFpKSB7Cj4gIAkJcmV0
ID0gc25kX3NvY19kYWlfdHJpZ2dlcihjb2RlY19kYWksIHN1YnN0cmVhbSwgY21kKTsKPiAgCQlp
ZiAocmV0IDwgMCkKPiAgCQkJcmV0dXJuIHJldDsKPiAgCX0KPiAgCj4gLQlmb3JfZWFjaF9ydGRj
b20ocnRkLCBydGRjb20pIHsKPiAtCQljb21wb25lbnQgPSBydGRjb20tPmNvbXBvbmVudDsKPiAr
CXNuZF9zb2NfZGFpX3RyaWdnZXIoY3B1X2RhaSwgc3Vic3RyZWFtLCBjbWQpOwoKcmV0ID0gc25k
X3NvY19kYWlfdHJpZ2dlcihjcHVfZGFpLCBzdWJzdHJlYW0sIGNtZCk7Cgo+ICsJaWYgKHJldCA8
IDApCj4gKwkJcmV0dXJuIHJldDsKPiAgCj4gLQkJcmV0ID0gc25kX3NvY19jb21wb25lbnRfdHJp
Z2dlcihjb21wb25lbnQsIHN1YnN0cmVhbSwgY21kKTsKPiArCWlmIChydGQtPmRhaV9saW5rLT5v
cHMtPnRyaWdnZXIpIHsKPiArCQlyZXQgPSBydGQtPmRhaV9saW5rLT5vcHMtPnRyaWdnZXIoc3Vi
c3RyZWFtLCBjbWQpOwo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQlyZXR1cm4gcmV0Owo+ICAJfQo+
ICAKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHNvY19wY21fdHJpZ2dlcl9z
dG9wKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLCBpbnQgY21kKQo+ICt7Cj4g
KwlzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnRkID0gc3Vic3RyZWFtLT5wcml2YXRlX2Rh
dGE7Cj4gKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudDsKPiArCXN0cnVjdCBz
bmRfc29jX3J0ZGNvbV9saXN0ICpydGRjb207Cj4gKwlzdHJ1Y3Qgc25kX3NvY19kYWkgKmNwdV9k
YWkgPSBydGQtPmNwdV9kYWk7Cj4gKwlzdHJ1Y3Qgc25kX3NvY19kYWkgKmNvZGVjX2RhaTsKPiAr
CWludCBpLCByZXQ7Cj4gKwo+ICAJc25kX3NvY19kYWlfdHJpZ2dlcihjcHVfZGFpLCBzdWJzdHJl
YW0sIGNtZCk7CgpyZXQgPSBzbmRfc29jX2RhaV90cmlnZ2VyKGNwdV9kYWksIHN1YnN0cmVhbSwg
Y21kKTsKCgo+ICAJaWYgKHJldCA8IDApCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gKwlmb3JfZWFj
aF9ydGRfY29kZWNfZGFpKHJ0ZCwgaSwgY29kZWNfZGFpKSB7Cj4gKwkJcmV0ID0gc25kX3NvY19k
YWlfdHJpZ2dlcihjb2RlY19kYWksIHN1YnN0cmVhbSwgY21kKTsKPiArCQlpZiAocmV0IDwgMCkK
PiArCQkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gKwlmb3JfZWFjaF9ydGRjb20ocnRkLCBydGRj
b20pIHsKPiArCQljb21wb25lbnQgPSBydGRjb20tPmNvbXBvbmVudDsKPiArCj4gKwkJcmV0ID0g
c25kX3NvY19jb21wb25lbnRfdHJpZ2dlcihjb21wb25lbnQsIHN1YnN0cmVhbSwgY21kKTsKPiAr
CQlpZiAocmV0IDwgMCkKPiArCQkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gIAlpZiAocnRkLT5k
YWlfbGluay0+b3BzLT50cmlnZ2VyKSB7Cj4gIAkJcmV0ID0gcnRkLT5kYWlfbGluay0+b3BzLT50
cmlnZ2VyKHN1YnN0cmVhbSwgY21kKTsKPiAgCQlpZiAocmV0IDwgMCkKPiBAQCAtMTA4Myw2ICsx
MTE5LDI4IEBAIHN0YXRpYyBpbnQgc29jX3BjbV90cmlnZ2VyKHN0cnVjdCBzbmRfcGNtX3N1YnN0
cmVhbSAqc3Vic3RyZWFtLCBpbnQgY21kKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRp
YyBpbnQgc29jX3BjbV90cmlnZ2VyKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFt
LCBpbnQgY21kKQo+ICt7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXN3aXRjaCAoY21kKSB7Cj4gKwlj
YXNlIFNORFJWX1BDTV9UUklHR0VSX1NUQVJUOgo+ICsJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9S
RVNVTUU6Cj4gKwljYXNlIFNORFJWX1BDTV9UUklHR0VSX1BBVVNFX1JFTEVBU0U6Cj4gKwkJcmV0
ID0gc29jX3BjbV90cmlnZ2VyX3N0YXJ0KHN1YnN0cmVhbSwgY21kKTsKPiArCQlicmVhazsKPiAr
CWNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1RPUDoKPiArCWNhc2UgU05EUlZfUENNX1RSSUdHRVJf
U1VTUEVORDoKPiArCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfUEFVU0VfUFVTSDoKPiArCQlyZXQg
PSBzb2NfcGNtX3RyaWdnZXJfc3RvcChzdWJzdHJlYW0sIGNtZCk7Cj4gKwkJYnJlYWs7Cj4gKwlk
ZWZhdWx0Ogo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICsKPiArCXJldHVybiByZXQ7Cj4g
K30KPiArCj4gIHN0YXRpYyBpbnQgc29jX3BjbV9iZXNwb2tlX3RyaWdnZXIoc3RydWN0IHNuZF9w
Y21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4gIAkJCQkgICBpbnQgY21kKQo+ICB7Cj4gCgotIFDD
qXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
