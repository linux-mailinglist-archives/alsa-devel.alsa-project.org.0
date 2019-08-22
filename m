Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472399ABB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 19:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDDFB1664;
	Thu, 22 Aug 2019 19:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDDFB1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566494191;
	bh=NQ2t5qY63AotX2LFkQSypggQpFBxjWrZPTxLXKIUgmM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oY+hi1+r2rNDGsDtoBA0BMZdOiz9wtIsHe0EUfD+jdOHp+Ivc7pckGLwRaD31kGmr
	 TfVmsNNDHNBIjZhi9aeVo9HTS3NeeFEY+nYExQVEVTXOLKYvEWy63sG/GQNss6DBEP
	 M2JT7u/+6bxvfsp+TwA5POKLhUVzkD2My+xPTih0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67985F803D5;
	Thu, 22 Aug 2019 19:14:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0805AF8036E; Thu, 22 Aug 2019 19:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D951F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 19:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D951F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 10:14:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="180445167"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.2.209])
 ([10.252.2.209])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2019 10:14:35 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
 <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
 <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <99f93211-acfe-cd29-09f9-900dbd848bd3@intel.com>
Date: Thu, 22 Aug 2019 19:14:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: Haswell: Adjust machine
 device private context
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMjAxOS0wOC0yMiAxODo0MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMi8xOSAxMTowNSBBTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+PiBPbiAyMDE5LTA4
LTIyIDE3OjU4LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gOC8y
Mi8xOSA2OjM2IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pj4gQXBhcnQgZnJvbSBIYXN3
ZWxsIG1hY2hpbmVzLCBhbGwgb3RoZXIgZGV2aWNlcyBoYXZlIHRoZWlyIHByaXZhdGUgZGF0YQo+
Pj4+IHNldCB0byBzbmRfc29jX2FjcGlfbWFjaCBpbnN0YW5jZS4KPj4+Pgo+Pj4+IENoYW5nZXMg
Zm9yIEhTVy8gQkRXIGJvYXJkcyBpbnRyb2R1Y2VkIHdpdGggc2VyaWVzOgo+Pj4+IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTA3ODIwMzUvCj4+Pj4KPj4+PiBhZGRlZCBzdXBw
b3J0IGZvciBkYWlfbGluayBwbGF0Zm9ybV9uYW1lIGFkanVzdG1lbnRzIHdpdGhpbiBjYXJkIHBy
b2JlCj4+Pj4gcm91dGluZXMuIFRoZXNlIHRha2UgZm9yIGdyYW50ZWQgcHJpdmF0ZV9kYXRhIHBv
aW50cyB0bwo+Pj4+IHNuZF9zb2NfYWNwaV9tYWNoIHdoZXJlYXMgZm9yIEhhc3dlbGwsIGl0J3Mg
c3N0X3BkYXRhIGluc3RlYWQuIENoYW5nZQo+Pj4+IHByaXZhdGUgY29udGV4dCBvZiBwbGF0Zm9y
bV9kZXZpY2UgLSByZXByZXNlbnRpbmcgbWFjaGluZSBib2FyZCAtIHRvCj4+Pj4gYWRkcmVzcyB0
aGlzLgo+Pj4+Cj4+Pj4gRml4ZXM6IGU4NzA1NWQ3MzJlMyAoIkFTb0M6IEludGVsOiBoYXN3ZWxs
OiBwbGF0Zm9ybSBuYW1lIGZpeHVwIAo+Pj4+IHN1cHBvcnQiKQo+Pj4+IEZpeGVzOiA3ZTQwZGRj
Zjk3NGEgKCJBU29DOiBJbnRlbDogYmR3LXJ0NTY3NzogcGxhdGZvcm0gbmFtZSBmaXh1cCAKPj4+
PiBzdXBwb3J0IikKPj4+PiBGaXhlczogMmQwNjdiMjgwN2Y5ICgiQVNvQzogSW50ZWw6IGJyb2Fk
d2VsbDogcGxhdGZvcm0gbmFtZSBmaXh1cCAKPj4+PiBzdXBwb3J0IikKPj4+PiBTaWduZWQtb2Zm
LWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gwqAgc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jIHwgMyArKy0KPj4+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jIAo+Pj4+IGIv
c291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+Pj4gaW5kZXggMTVmMmIyN2U2NDNm
Li5jMzRmNjI4Yzc5ODcgMTAwNjQ0Cj4+Pj4gLS0tIGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9z
c3QtYWNwaS5jCj4+Pj4gKysrIGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+
Pj4gQEAgLTEwOSwxMSArMTA5LDEyIEBAIGludCBzc3RfYWNwaV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqAgcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgc3N0X2FjcGkpOwo+Pj4+ICvCoMKgwqAgbWFjaC0+cGRhdGEg
PSBzc3RfcGRhdGE7Cj4+Pj4gwqDCoMKgwqDCoCAvKiByZWdpc3RlciBtYWNoaW5lIGRyaXZlciAq
Lwo+Pj4+IMKgwqDCoMKgwqAgc3N0X2FjcGktPnBkZXZfbWFjaCA9Cj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKGRldiwgbWFjaC0+ZHJ2X25hbWUs
IC0xLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzc3RfcGRhdGEsIHNpemVvZigqc3N0X3BkYXRhKSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hY2gsIHNpemVvZigqbWFjaCkp
Owo+Pj4KPj4+IEkgbm93IGFncmVlIHRoYXQgdGhlIGNvZGUgSSBhZGRlZCBpcyBpbmNvcnJlY3Qg
YW5kIHByb2JhYmx5IGFjY2Vzc2VzIAo+Pj4gbWVtb3J5IG9mZnNldHMgdGhhdCBhcmVuJ3Qgcmln
aHQuIEkgaGF2ZSBhYnNvbHV0ZWx5IG5vIGlkZWEgd2h5IEkgCj4+PiBhZGRlZCB0aGlzIGNvbW1l
bnQgdGhhdCAnbGVnYWN5IGRvZXMgbm90IHBhc3MgcGFyYW1ldGVycycgd2hlbiBpdCAKPj4+IG1v
c3QgZGVmaW5pdGl2ZWx5IGRvZXMuIEdvb2QgY2F0Y2ggb24geW91ciBzaWRlLgo+Pj4KPj4+IFRo
YXQgc2FpZCwgZG9lc24ndCB0aGUgcHJvcG9zZWQgZml4IGludHJvZHVjZSBhbm90aGVyIGlzc3Vl
Pwo+Pj4KPj4+IEluIHRoZSBtYWNoaW5lIGRyaXZlcnMsIHlvdSBzdGlsbCBnZXQgcGRhdGEgZGly
ZWN0bHksIHNvIGFyZW4ndCB5b3UgCj4+PiBtaXNzaW5nIGFuIGluZGlyZWN0aW9uIHRvIGdldCBi
YWNrIHRvIHBkYXRhIGZyb20gbWFjaD8KPj4+Cj4+PiBzdGF0aWMgaW50IGJkd19ydDU2NzdfcnRk
X2luaXQoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCkKPj4+IHsKPj4+IMKgwqDCoMKg
wqBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCA9IHNuZF9zb2NfcnRkY29tX2xv
b2t1cChydGQsIAo+Pj4gRFJWX05BTUUpOwo+Pj4gwqDCoMKgwqDCoHN0cnVjdCBzc3RfcGRhdGEg
KnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0YShjb21wb25lbnQtPmRldik7Cj4+PiDCoMKgwqDCoMKg
c3RydWN0IHNzdF9oc3cgKmJyb2Fkd2VsbCA9IHBkYXRhLT5kc3A7Cj4+Pgo+Pj4gPDw8IHNvIGhl
cmUgeW91IHRvb2sgdGhlIHdyb25nIHBvaW50ZXIsIG5vPwo+Pgo+PiBCb3RoIEJheXRyYWlsIGFu
ZCBIYXN3ZWxsIGFyZSBlbnVtZXJhdGVkIGluIGEgYml0IGRpZmZlcmVudCBmYXNoaW9uIAo+PiB0
aGFuIFNLTCBlcXVpdmFsZW50cy4KPj4KPj4gVGhlcmUgaXMgYW4gaW4tcGxhY2UgcmVnaXN0cmF0
aW9uIGZvciBtYWNoaW5lIGRldmljZSAtIHdob3NlIAo+PiBwcml2YXRlX2RhdGEgZ2V0cyB1c2Vk
IGluIG1hY2hpbmUgcHJvYmUgLSBhbmQgcGNtIGRldmljZSB3aGljaCBoYXBwZW5zIAo+PiBvbiBm
aXJtd2FyZSBsb2FkIGNhbGxiYWNrICgvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaTo2
MykuIAo+PiBfcnRkX2luaXQgbWFrZXMgdXNlIG9mIHRoZSBsYXR0ZXIgb2YgdHdvLgo+IAo+IEkg
ZG9uJ3QgZ2V0IHlvdXIgZXhwbGFuYXRpb25zLiBjYW4geW91IGVsYWJvcmF0ZSBvbiB3aGF0IHRo
aXMgZG9lcyBub3cgCj4gdGhhdCBwZGF0YSBpcyBubyBsb25nZXIgcGFzc2VkIGFzIGFuIGFyZ3Vt
ZW50IHRvIHRoZSBtYWNoaW5lIGRyaXZlcjoKPiAKPiBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQg
KmNvbXBvbmVudCA9IHNuZF9zb2NfcnRkY29tX2xvb2t1cChydGQsIERSVl9OQU1FKTsKPiBzdHJ1
Y3Qgc3N0X3BkYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoY29tcG9uZW50LT5kZXYpOwo+
IAo+IHRoZSAnY29tcG9uZW50JyBoZXJlIGlzIG5vdCB0aGUgUENNIG9uZSwgaXMgaXQ/Cj4gCj4g
CgpTdXJlIHRoaW5nLgoKQ29kZToKCS8qIHJlZ2lzdGVyIG1hY2hpbmUgZHJpdmVyICovCglzc3Rf
YWNwaS0+cGRldl9tYWNoID0KCQlwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0YShkZXYsIG1h
Y2gtPmRydl9uYW1lLCAtMSwKCQkJCQkgICAgICBzc3RfcGRhdGEsIHNpemVvZigqc3N0X3BkYXRh
KSk7CgpGb3VuZCBpbiBzc3RfYWNwaV9wcm9iZSAoL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0
LWFjcGkuYzoxNDUpIApnZW5lcmF0ZXMgbmV3IHBsYXRmb3JtX2RldmljZSAtIHdoaWNoIHJlcHJl
c2VudHMgbWFjaGluZSBib2FyZCAtIHdpdGggCml0cyBwcml2YXRlIGRhdGEgc2V0IHRvIHBvaW50
ZXIgdG8gaW5zdGFuY2Ugb2Ygc3RydWN0IHNzdF9wZGF0YSB0eXBlLiAKVGhpcyBkYXRhIGdldHMg
dXNlZCBvbiBtYWNoaW5lIGJvYXJkIHByb2JlLCBlLmcuOiBicm9hZHdlbGxfYXVkaW9fcHJvYmUg
Cigvc291bmQvc29jL2ludGVsL2JvYXJkcy9icm9hZHdlbGwuYzoyNzApLgpJbnZvbHZlZCBwbGF0
Zm9ybSBpcyBjYWxsZWQ6IGJyb2Fkd2VsbC1hdWRpby4gUmVxdWVzdGVkIHByaXZhdGUgZGF0YSAK
dHlwZSBieSBicm9hZHdlbGxfYXVkaW9fcHJvYmU6IHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCAq
LiBNSVNNQVRDSC4KCgpDb2RlOgoKCS8qIHJlZ2lzdGVyIFBDTSBhbmQgREFJIGRyaXZlciAqLwoJ
c3N0X2FjcGktPnBkZXZfcGNtID0KCQlwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0YShkZXYs
IGRlc2MtPmRydl9uYW1lLCAtMSwKCQkJCQkgICAgICBzc3RfcGRhdGEsIHNpemVvZigqc3N0X3Bk
YXRhKSk7CgpGb3VuZCBpbiBzc3RfYWNwaV9md19jYiAoL3NvdW5kL3NvYy9pbnRlbC9jb21tb24v
c3N0X2FjcGlfZndfY2I6NDcpIApnZW5lcmF0ZXMgbmV3IHBsYXRmb3JtX2RldmljZSAtIHdoaWNo
IHJlcHJlc2VudHMgSGFzd2VsbCBQQ00sIHlvdSBtYXkgCnRyZWF0IGl0IGFzIFNreWxha2UgZXF1
aXZhbGVudCAtIHdpdGggaXRzIHByaXZhdGUgZGF0YSBzZXQgdG8gcG9pbnRlciB0byAKaW5zdGFu
Y2Ugb2Ygc3RydWN0IHNzdF9wZGF0YSB0eXBlLiBUaGlzIGRhdGEgZ2V0cyB1c2VkIG9uIGRhaSAu
aW5pdCAtIApicm9hZHdlbGxfcnRkX2luaXQgLSBpbnZvY2F0aW9uIHdoZW4gY2FyZCBpcyBpbnN0
YW50aWF0ZWQgYnkgQVNvQyBjb2RlLiAKQXMgeW91IGNhbiBzZWUgb24gKC9zb3VuZC9zb2MvaW50
ZWwvYm9hcmRzL2Jyb2Fkd2VsbC5jOjE2MiksIHBsYXRmb3JtIAp0aWVkIHdpdGggaXQgaXM6IGhh
c3dlbGwtcGNtLWF1ZGlvLiBSZXF1ZXN0ZWQgcHJpdmF0ZSBkYXRhIHR5cGUgYnkgCmJyb2Fkd2Vs
bF9ydGRfaW5pdCAtIHN0cnVjdCBzc3RfcGRhdGEgKi4gTUFUQ0guCgoKQ3phcmVrCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
