Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE059BCCD
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 11:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D151664;
	Sat, 24 Aug 2019 11:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D151664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566639127;
	bh=BsO8DCdyhrBNaIfT7fDMDaKADks7IclQYrJ6tGs0w9Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hf6S2E+SIZ0cveui6yE++dUwoW4yQ+zgDbltfPUuJpyUl3Q1jY+ewAWln/fPA9Aww
	 Vfc3fmqs8lLgFN8DCiYLRnUxfyKmGpRNGvJ4C7N+2KLH+biDBi6yfo8xFuA8jV58Sm
	 pZjSmvzcz682nZNqDKdWsg1cuOGQojR0xzW++XYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB8DF803D5;
	Sat, 24 Aug 2019 11:30:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79D6F8036E; Sat, 24 Aug 2019 11:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2A1DF80147
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 11:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A1DF80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 02:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,424,1559545200"; d="scan'208";a="180903221"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2019 02:30:11 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-4-cezary.rojewski@intel.com>
 <dd4c705a-1d75-b71c-8cd9-eec020b57c52@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <cb4c2bfa-cde4-10be-7a2e-8f17e89f8203@intel.com>
Date: Sat, 24 Aug 2019 11:30:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dd4c705a-1d75-b71c-8cd9-eec020b57c52@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 03/35] ASoC: Intel: Skylake: Add
 HARDWARE_CONFIG IPC request
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

T24gMjAxOS0wOC0yMyAyMDozMiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+ICvC
oMKgwqAgd2hpbGUgKG9mZnNldCA8IGJ5dGVzKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCB0bHYgPSAo
c3RydWN0IHNrbF90bHYgKikocGF5bG9hZCArIG9mZnNldCk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDC
oMKgIHN3aXRjaCAodGx2LT50eXBlKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIFNLTF9IV19D
RkdfQ0FWU19WRVI6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNmZy0+Y2F2c192ZXJzaW9u
ID0gKnRsdi0+dmFsdWU7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArCj4+
ICvCoMKgwqDCoMKgwqDCoCBjYXNlIFNLTF9IV19DRkdfRFNQX0NPUkVTOgo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjZmctPmRzcF9jb3JlcyA9ICp0bHYtPnZhbHVlOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBTS0xfSFdf
Q0ZHX01FTV9QQUdFX0JZVEVTOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjZmctPm1lbV9w
YWdlX2J5dGVzID0gKnRsdi0+dmFsdWU7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIFNLTF9IV19DRkdfVE9UQUxfUEhZU19NRU1f
UEFHRVM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNmZy0+dG90YWxfcGh5c19tZW1fcGFn
ZXMgPSAqdGx2LT52YWx1ZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgU0tMX0hXX0NGR19JMlNfQ0FQUzoKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2ZnLT5pMnNfY2Fwcy52ZXJzaW9uID0gdGx2LT52YWx1ZVswXTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSA9IHRsdi0+dmFsdWVbMV07Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNmZy0+aTJzX2NhcHMuY3RybF9jb3VudCA9IHNpemU7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICghc2l6ZSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplICo9IHNp
emVvZigqY2ZnLT5pMnNfY2Fwcy5jdHJsX2Jhc2VfYWRkcik7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNmZy0+aTJzX2NhcHMuY3RybF9iYXNlX2FkZHIgPQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGttZW1kdXAoJnRsdi0+dmFsdWVbMl0sIHNpemUsIEdGUF9LRVJORUwp
Owo+IAo+IHNob3VsZG4ndCB0aGUgc2l6ZSBiZSB0aGF0IG9mIHRoZSBzb3VyY2UgYnVmZmVyIGlu
c3RlYWQgb2YgdGhlIGRlc3RpbmF0aW9uPwo+IAoKSTJTX0NBUFMgYXJlIHJlcHJlc2VudGVkIGJ5
OgoKc3RydWN0IHNrbF9pMnNfY2FwcyB7CgllbnVtIHNrbF9pMnNfdmVyc2lvbiB2ZXJzaW9uOwoJ
dTMyIGN0cmxfY291bnQ7Cgl1MzIgKmN0cmxfYmFzZV9hZGRyOwp9OwoKQXMgeW91IGNhbiBzZWUs
IHNlY29uZCBEV09SRCBjb21pbmcgZnJvbSBWIChUTF9WXykgc3BlY2lmaWVzIG51bWJlciBvZiAK
ZWxlbWVudHMgaW4gYXJyYXkgY3RybF9iYXNlX2FkZHIuIFNvLCB3aGF0IHdlIGRvIGlzIHNldCBp
MnNfY2Fwcy52ZXJzaW9uIAp0byBEV09SRFswXSwgaTJzX2NhcHMuY3RybF9jb3VudCB0byBEV09S
RFsxXSBhbmQgdGhlbiBtdWx0aXBseSBjb3VudCBieSAKdGhlIHNpemUgb2YgZWxlbWVudCB0eXBl
IGFuZCB0aHVzIHdlIGtub3cgaG93IG11Y2ggbWVtb3J5IHRvIGNvcHkuCgo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoIWNmZy0+aTJzX2NhcHMuY3RybF9iYXNlX2FkZHIpIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXhpdDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gKwo+PiArwqDCoMKgwqDC
oMKgwqAgY2FzZSBTS0xfSFdfQ0ZHX0dBVEVXQVlfQ09VTlQ6Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNmZy0+Z2F0ZXdheV9jb3VudCA9ICp0bHYtPnZhbHVlOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBTS0xfSFdfQ0ZH
X0hQX0VCQl9DT1VOVDoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2ZnLT5ocF9lYmJfY291
bnQgPSAqdGx2LT52YWx1ZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgU0tMX0hXX0NGR19MUF9FQkJfQ09VTlQ6Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNmZy0+bHBfZWJiX2NvdW50ID0gKnRsdi0+dmFsdWU7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNl
IFNLTF9IV19DRkdfRUJCX1NJWkVfQllURVM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNm
Zy0+ZWJiX3NpemVfYnl0ZXMgPSAqdGx2LT52YWx1ZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgU0tMX0hXX0NGR19HUERNQV9D
QVBTOgo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBTS0xfSFdfQ0ZHX1VBT0xfQ0FQUzoKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGRlZmF1
bHQ6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvKGlwYy0+ZGV2LCAiVW5yZWNv
Z25pemVkIGh3IHBhcmFtOiAlZFxuIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0bHYtPnR5cGUpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiAKPiBzYW1l
IGZlZWRiYWNrLCBpdCdzIHVzdWFsbHkgYmV0dGVyIHRvIGxpc3QgYWxsIHZhbHVlcyBhbmQgc2tp
cCB0aGVtLCBhbmQgCj4gZmFpbCBiaWcgaWYgeW91IHNlZSBzb21ldGhpbmcgdW5leHBlY3RlZC4K
ClNhbWUgYW5zd2VyIGFzIGZvciBGSVJNV0FSRV9DT05GSUcuCgo+IAo+PiArwqDCoMKgwqDCoMKg
wqAgfQo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBvZmZzZXQgKz0gc2l6ZW9mKCp0bHYpICsgdGx2
LT5sZW5ndGg7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICtleGl0Ogo+PiArwqDCoMKgIGtmcmVlKHBh
eWxvYWQpOwo+PiArwqDCoMKgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQ
TChza2xfaXBjX2h3X2NmZ19nZXQpOwo+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLXNzdC1pcGMuaCAKPj4gYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0
LWlwYy5oCj4+IGluZGV4IGViYzU4NTJlMTVkMC4uZWVmYTUyZjdmOTdhIDEwMDY0NAo+PiAtLS0g
YS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LWlwYy5oCj4+ICsrKyBiL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC1zc3QtaXBjLmgKPj4gQEAgLTc3LDYgKzc3LDcgQEAgZW51bSBz
a2xfYmFzZWZ3X3J1bnRpbWVfcGFyYW0gewo+PiDCoMKgwqDCoMKgIFNLTF9CQVNFRldfQVNUQVRF
X1RBQkxFID0gNCwKPj4gwqDCoMKgwqDCoCBTS0xfQkFTRUZXX0RNQV9DT05UUk9MID0gNSwKPj4g
wqDCoMKgwqDCoCBTS0xfQkFTRUZXX0ZJUk1XQVJFX0NPTkZJRyA9IDcsCj4+ICvCoMKgwqAgU0tM
X0JBU0VGV19IQVJEV0FSRV9DT05GSUcgPSA4LAo+PiDCoCB9Owo+PiDCoCBlbnVtIHNrbF9md19j
ZmdfcGFyYW1zIHsKPj4gQEAgLTE0MSw2ICsxNDIsNTAgQEAgc3RydWN0IHNrbF9md19jZmcgewo+
PiDCoMKgwqDCoMKgIHUzMiBwb3dlcl9nYXRpbmdfcG9saWN5Owo+PiDCoCB9Owo+PiArZW51bSBz
a2xfaHdfY2ZnX3BhcmFtcyB7Cj4+ICvCoMKgwqAgU0tMX0hXX0NGR19DQVZTX1ZFUiwKPj4gK8Kg
wqDCoCBTS0xfSFdfQ0ZHX0RTUF9DT1JFUywKPj4gK8KgwqDCoCBTS0xfSFdfQ0ZHX01FTV9QQUdF
X0JZVEVTLAo+PiArwqDCoMKgIFNLTF9IV19DRkdfVE9UQUxfUEhZU19NRU1fUEFHRVMsCj4+ICvC
oMKgwqAgU0tMX0hXX0NGR19JMlNfQ0FQUywKPj4gK8KgwqDCoCBTS0xfSFdfQ0ZHX0dQRE1BX0NB
UFMsCj4+ICvCoMKgwqAgU0tMX0hXX0NGR19HQVRFV0FZX0NPVU5ULAo+PiArwqDCoMKgIFNLTF9I
V19DRkdfSFBfRUJCX0NPVU5ULAo+PiArwqDCoMKgIFNLTF9IV19DRkdfTFBfRUJCX0NPVU5ULAo+
PiArwqDCoMKgIFNLTF9IV19DRkdfRUJCX1NJWkVfQllURVMsCj4+ICvCoMKgwqAgU0tMX0hXX0NG
R19VQU9MX0NBUFMKPj4gK307Cj4+ICsKPj4gK2VudW0gc2tsX2NhdnNfdmVyc2lvbiB7Cj4+ICvC
oMKgwqAgU0tMX0NBVlNfVkVSXzFfNSA9IDB4MTAwMDUsCj4+ICvCoMKgwqAgU0tMX0NBVlNfVkVS
XzFfOCA9IDB4MTAwMDgsCj4+ICt9Owo+PiArCj4+ICtlbnVtIHNrbF9pMnNfdmVyc2lvbiB7Cj4+
ICvCoMKgwqAgU0tMX0kyU19WRVJfMTVfU0tZTEFLRcKgwqAgPSAweDAwMDAwLAo+PiArwqDCoMKg
IFNLTF9JMlNfVkVSXzE1X0JST1hUT07CoMKgID0gMHgxMDAwMCwKPj4gK8KgwqDCoCBTS0xfSTJT
X1ZFUl8xNV9CUk9YVE9OX1AgPSAweDIwMDAwLAo+PiArwqDCoMKgIFNLTF9JMlNfVkVSXzE4X0tC
TF9DTkzCoMKgID0gMHgzMDAwMCwKPj4gK307Cj4gCj4gVGhlIGVuY29kaW5nIGlzIG9kZC4KPiBE
byB0aGVzZSB2YWx1ZXMgbWVhbiBhbnl0aGluZyAoZS5nLiB0aWVkIHRvIGZpcm13YXJlIGRlZmlu
aXRpb25zPykKCkV4YWN0bHkuIFJpZ2h0IG5vdyBJJ20gbWlycm9yaW5nIEZXIHNpZGUuIERvbid0
IGJsYW1lIG1lIGZvciBlbmNvZGluZywgSSAKa25vdyBpdCdzIHdlaXJkIDogRApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
