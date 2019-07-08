Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1EE61FFC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2019 16:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E45C1667;
	Mon,  8 Jul 2019 16:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E45C1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562594579;
	bh=InSExjzHTrGAX5XAo0GHjweEyPLYjhB3H0ja9h1AxQs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5teUSvxgjMY+89K7YeSZK5s2OJsT4Uxtd+Wyn2Dbj+cmGVLKD9Qxn+QDBmnWvyqA
	 Xo35mSo3zQQOdow8im/061UmPyONRL+MhVb5s0xrKdzuEmjayBi9buR9jnD6Zhz5Kn
	 m6wDtJocGdvHNgv68xWfcxQiO2wV7L87PQLyE2SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D321FF80269;
	Mon,  8 Jul 2019 16:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B7F3F80268; Mon,  8 Jul 2019 16:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40945F800E2
 for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2019 16:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40945F800E2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 07:01:05 -0700
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="165466229"
Received: from pharlozi-mobl.ger.corp.intel.com (HELO [10.102.89.149])
 ([10.102.89.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 08 Jul 2019 07:01:03 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190626093851.18474-1-pawel.harlozinski@linux.intel.com>
 <d9bd7dcb-4780-1f05-e536-32005f2b0ab6@intel.com>
From: "Harlozinski, Pawel" <pawel.harlozinski@linux.intel.com>
Message-ID: <a45bdc9d-a81e-f1b4-18e4-9b1b412e021c@linux.intel.com>
Date: Mon, 8 Jul 2019 16:01:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d9bd7dcb-4780-1f05-e536-32005f2b0ab6@intel.com>
Content-Language: en-US
Cc: szymonx.mielczarek@intel.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Skylake: Recover BXT FW on
 DSP boot timeout error
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

Ck9uIDYvMjYvMjAxOSA4OjEzIFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0w
Ni0yNiAxMTozOCwgUGF3ZWwgSGFybG96aW5za2kgd3JvdGU6Cj4+IFdoZW4gRFNQIGJvb3RzIHdp
dGggdGltZW91dCBlcnJvciwgcmVpbml0aWFsaXplLCB0cmFuc2Zlcgo+PiBhbmQgYm9vdCBmaXJt
d2FyZSB0byByZWNvdmVyIGF1ZGlvLgo+PgoKZG9uZSBpbiBQQVRDSCB2MgoKCj4gVGhpcyBpcyBz
byBjYWxsZWQgInJlY292ZXJ5Ii4gU2F5ICJ3aHkiIHdlIGRvIGl0LCBub3QganVzdCAid2hhdCIg
dGhlIAo+IHNlcXVlbmNlIGlzLgo+Cj4+IFNpZ25lZC1vZmYtYnk6IFN6eW1vbiBNaWVsY3phcmVr
IDxzenltb254Lm1pZWxjemFyZWtAaW50ZWwuY29tPgo+PiAtLS0KPj4gwqAgc291bmQvc29jL2lu
dGVsL3NreWxha2UvYnh0LXNzdC5jIHwgMTUgKysrKysrKysrKy0tLS0tCj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2ludGVsL3NreWxha2UvYnh0LXNzdC5jIAo+PiBiL3NvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL2J4dC1zc3QuYwo+PiBpbmRleCA0NDBiY2E3YWZiZjEuLmEyODQ0YmRjYTFiOCAx
MDA2NDQKPj4gLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2UvYnh0LXNzdC5jCj4+ICsrKyBi
L3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL2J4dC1zc3QuYwo+PiBAQCAtNDU1LDEzICs0NTUsMTgg
QEAgc3RhdGljIGludCBieHRfc2V0X2RzcF9EMChzdHJ1Y3Qgc3N0X2RzcCAqY3R4LCAKPj4gdW5z
aWduZWQgaW50IGNvcmVfaWQpCj4KPiBXaGF0IGFib3V0IGl0cyBuZWlnaGJvdXIsIGNubF9zZXRf
ZHNwX0QwPwoKCkluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gQ05MIGhhbmRsZXMgRlcgaW5pdCBx
dWl0ZSBkaWZmZXJlbnQgd2F5LApTbyBpbXBsZW1lbnRhdGlvbiBvZiBGVyByZWNvdmVyeSBmb3Ig
Q05MIGhhdmUgdG8gd2FpdCBhdCBsZWFzdCBmb3IgcGF0Y2ggCnVuaWZ5aW5nIGZpcm13YXJlIGxv
YWRpbmcgbWVjaGFuaXNtLgpUaGF0IGlzIGFscmVhZHkgcHJlcGFyZWQgLSBqdXN0IHdhaXRpbmfC
oCBpbiBxdWV1ZSB3aXRoIG90aGVyIGNsZWFudXAgCnBhdGNoZXMgdG8gYmUgc2VuZC4KCj4KPj4g
wqDCoMKgwqDCoCAvKiBJZiBjb3JlIDEgd2FzIHR1cm5lZCBvbiBmb3IgYm9vdGluZyBjb3JlIDAs
IHR1cm4gaXQgb2ZmICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBza2xfZHNwX2NvcmVfcG93ZXJf
ZG93bihjdHgsIFNLTF9EU1BfQ09SRV9NQVNLKDEpKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChyZXQgPT0gMCkgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGN0eC0+ZGV2
LCAiJXM6IERTUCBib290IHRpbWVvdXRcbiIsIF9fZnVuY19fKTsKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X2VycihjdHgtPmRldiwgIkVycm9yIGNvZGU9MHgleDogRlcgc3RhdHVzPTB4
JXhcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuKGN0eC0+ZGV2LAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJEU1AgYm9vdCB0aW1lb3V0OiBFcnJvciBj
b2RlPTB4JXg6IEZXIHN0YXR1cz0weCV4XG4iLAo+Cj4gTG9nIGNoYW5nZSAoLS1sb2dfbGV2ZWwp
IHdpdGhvdXQgbWVudGlvbiBpbiBjb21taXQgbXNnLiBNYXliZSBzcGxpdCAKPiB0aGlzIGludG8g
c2VwYXJhdGUgY29tbWl0PyBUaGUgZW50aXJlIGxvZy1wb2xpc2ggdGhpbmd5IGNvdWxkIGJlIGEg
Cj4gdGhlbWUgZm9yIGEgcGF0Y2hzZXQgYXMgdGhpcyBpcyBub3QgdGhlIG9ubHkgcGxhY2Ugd2hl
cmUgc3VjaCBjaGFuZ2VzIAo+IGFyZSB3ZWxjb21lLgoKClRoaXMgbG9nX2xldmVsIGNoYW5nZSBz
aG91bGQgYmUgcGFydCBvZiB0aGlzIGNvbW1pdCwgYmVjYXVzZSBvZiBhZGRlZCAKcmVjb3Zlcnkg
YWZ0ZXIgYm9vdCB0aW1lb3V0LgpPbmx5IHJlY292ZXJ5IGZhaWwgc2hvdWxkIGJlIGxvZ2dlZCBv
biBlcnIgbGV2ZWwuCgoKPgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNz
dF9kc3Bfc2hpbV9yZWFkKGN0eCwgQlhUX0FEU1BfRVJST1JfQ09ERSksCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3N0X2RzcF9zaGltX3JlYWQoY3R4LCBCWFRfQURTUF9G
V19TVEFUVVMpKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihjdHgtPmRldiwg
IkZhaWxlZCB0byBzZXQgY29yZTAgdG8gRDAgc3RhdGVcbiIpOwo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXQgPSAtRUlPOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBieHRfc3N0X2luaXRfZncoc2ts
LT5kZXYsIHNrbCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuKGN0eC0+ZGV2
LCAiUmVsb2FkIGZ3IHN0YXR1czogJWRcbiIsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChyZXQgPCAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2
X2VycihjdHgtPmRldiwgIkZhaWxlZCB0byBzZXQgY29yZTAgdG8gRDAgc3RhdGVcbiIpOwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU87Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPgo+IERvdWJsZSBtZXNzYWdlIGlzIHVubmVjZXNzYXJ5LCByb3V0aW5lIGlzIHZlcmJvc2Ug
ZW5vdWdoLiBFaXRoZXIgbGVhdmUgCj4gImFsd2F5cyByZXBvcnQgc3R1ZmYiIGFuZCByZXNpZ24g
ZnJvbSBtZW50aW9uaW5nIGFueXRoaW5nIGF0IGFsbCBvbiAKPiBmYWlsdXJlIC1vci0gZG8gaXQg
b25seSBvbiBmYWlsdXJlIGV4cGxpY2l0bHkuCj4KCmRvbmUgaW4gUEFUQ0ggdjIKCgo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIH0KPj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
