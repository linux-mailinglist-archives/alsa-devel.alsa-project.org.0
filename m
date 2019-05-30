Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82130382
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 22:46:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0D511669;
	Thu, 30 May 2019 22:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0D511669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559249174;
	bh=Y8of5Y9IHYYBC7GigpRae9e7+x0nk5S3zoYiJL3mNGk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZ09NL1S7UxZLkwGkxaWQW11CeApzCTiVLZXNw3pF9HhaRiJZCtvX+1CjcPeQ2yKI
	 w4Fz0SCcd3aFt8OG0QdH3zqp16AeNFIrVSBtbIAa1G8Cxd59rdKd3WvhJffg7eQg/k
	 Vz9LQt5keltXGpo/QXYS9eKH3uV0jWQ45vMkRppc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA38F896F8;
	Thu, 30 May 2019 22:44:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A32E2F896F8; Thu, 30 May 2019 22:44:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 875F6F80C1B
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 22:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 875F6F80C1B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 13:44:21 -0700
X-ExtLoop1: 1
Received: from jzhu45-mobl.amr.corp.intel.com (HELO [10.252.204.19])
 ([10.252.204.19])
 by fmsmga008.fm.intel.com with ESMTP; 30 May 2019 13:44:20 -0700
To: =?UTF-8?B?S292w6FjcyBUYW3DoXM=?= <kepszlok@zohomail.eu>,
 alsa-devel@alsa-project.org
References: <20190530185245.10872-1-kepszlok@zohomail.eu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eab8f759-404b-bb7b-3d85-be1b85663aec@linux.intel.com>
Date: Thu, 30 May 2019 15:44:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530185245.10872-1-kepszlok@zohomail.eu>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH V2] ASoC: Intel: Baytrail: add quirk for
 Aegex 10 (RU2) tablet
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

CgpPbiA1LzMwLzE5IDE6NTIgUE0sIEtvdsOhY3MgVGFtw6FzIHdyb3RlOgo+IFRoaXMgdGFibGV0
IGhhcyBhbiBpbmNvcnJlY3QgYWNwaSBpZGVudGlmaWVyIGp1c3QgbGlrZQo+IFRoaW5rcGFkMTAg
dGFibGV0LCB3aGljaCBpcyB3aHkgaXQgaXMgdHJ5aW5nIHRvIGxvYWQgdGhlIFJUNTY0MCBkcml2
ZXIKPiBpbnN0ZWFkIG9mIHRoZSBSVDU3NjIgZHJpdmVyLiBUaGUgUlQ1NjQwIGRyaXZlciwgb24g
dGhlIG90aGVyIGhhbmQsIGNoZWNrcwo+IHRoZSBoYXJkd2FyZSBJRCwgc28gbm8gZHJpdmVyIGFy
ZSBsb2FkZWQgZHVyaW5nIGJvb3QuIFRoaXMgZml4IHJlc29sdmVzIHRvCj4gbG9hZCB0aGUgUlQ1
NjcyIGRyaXZlciBvbiB0aGlzIHRhYmxldCBkdXJpbmcgYm9vdC4gSXQgYWxzbyBwcm92aWRlcyB0
aGUKPiBjb3JyZWN0IElPIGNvbmZpZ3VyYXRpb24sIGxpa2UgdGhlIGphY2sgZGV0ZWN0IG1vZGUg
MywgZm9yIDEuOFYgcHVsbHVwLiBJCj4gd291bGQgbGlrZSB0byB0aGFuayBQaWVycmUtTG91aXMg
Qm9zc2FydCBmb3IgaGVscGluZyB3aXRoIHRoaXMgcGF0Y2guCgp5b3UncmUgYWxtb3N0IGRvbmUg
Oi0pCgpXZSBuZWVkIHRvIGhhdmUgeW91IFNpZ25lZC1vZmYtYnkgdGFnLCBpdCdzIGEgcmVxdWly
ZW1lbnQgZm9yIGtlcm5lbCAKcGF0Y2hlcyAob3RoZXIgb3Blbi1zb3VyY2UgcHJvZ3JhbXMgaGF2
ZSB0aGUgc2FtZSBleHBlY3RhdGlvbnMpLgoKc2VlIApodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sIApzZWN0aW9uIDEx
LgoKWW91IGNhbiBhZGQgdGhpcyB3aXRoICdnaXQgY29tbWl0IC0tYW1lbmQgLS1zaWdub2ZmJwoK
YW5kIHRoZSBkaWZmcyB0byBiZSBpbnZlcnRlZCAoeW91IHJlbW92ZWQgbGluZXMgaW5zdGVhZCBv
ZiBhZGRpbmcgdGhlbSkuCgp1c3VhbGx5IHlvdSBnZW5lcmF0ZSB0aGUgcGF0Y2ggd2l0aCBnaXQg
Zm9ybWF0LXBhdGNoIC0xCmFuZCB0aGVuIHJ1biAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0
cmljdCAwMDAxKi5wYXRjaAoKPiAKPiAtLS0KPiAgIHNvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMg
ICAgICAgICAgICAgICAgICAgICB8IDE0ICstLS0tLS0tLS0tLS0tCj4gICAuLi4vaW50ZWwvY29t
bW9uL3NvYy1hY3BpLWludGVsLWJ5dC1tYXRjaC5jICAgfCAxOSArLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMgYi9zb3VuZC9zb2MvY29k
ZWNzL3J0NTY3MC5jCj4gaW5kZXggMzdjY2UwNDM5NTY4Li45YTAzNzEwOGIxYWUgMTAwNjQ0Cj4g
LS0tIGEvc291bmQvc29jL2NvZGVjcy9ydDU2NzAuYwo+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3Mv
cnQ1NjcwLmMKPiBAQCAtMjg4MiwxOCArMjg4Miw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1p
X3N5c3RlbV9pZCBkbWlfcGxhdGZvcm1faW50ZWxfcXVpcmtzW10gPSB7Cj4gICAJCQkJCQkgUlQ1
NjcwX0RFVl9HUElPIHwKPiAgIAkJCQkJCSBSVDU2NzBfSkRfTU9ERTMpLAo+ICAgCX0sCj4gLQl7
Cj4gLQkJLmNhbGxiYWNrID0gcnQ1NjcwX3F1aXJrX2NiLAo+IC0JCS5pZGVudCA9ICJBZWdleCAx
MCB0YWJsZXQgKFJVMikiLAo+IC0JCS5tYXRjaGVzID0gewo+IC0JCQlETUlfTUFUQ0goRE1JX1NZ
U19WRU5ET1IsICJBRUdFWCIpLAo+IC0JCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwg
IlJVMiIpLAo+IC0JCX0sCj4gLQkJLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVkIGxvbmcgKikoUlQ1
NjcwX0RNSUNfRU4gfAo+IC0JCQkJCQkgUlQ1NjcwX0RNSUMyX0lOUiB8Cj4gLQkJCQkJCSBSVDU2
NzBfREVWX0dQSU8gfAo+IC0JCQkJCQkgUlQ1NjcwX0pEX01PREUzKSwKPiAtCX0sCj4gICAJe30K
PiAgIH07Cj4gICAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNw
aS1pbnRlbC1ieXQtbWF0Y2guYyBiL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc29jLWFjcGktaW50
ZWwtYnl0LW1hdGNoLmMKPiBpbmRleCBjZmVkNThjMjNlMGIuLmZlODEyYTkwOWRiNCAxMDA2NDQK
PiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1hY3BpLWludGVsLWJ5dC1tYXRjaC5j
Cj4gKysrIGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2gu
Ywo+IEBAIC0yMiw3ICsyMiw2IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGJ5dF9tYWNoaW5lX2lk
Owo+ICAgCj4gICAjZGVmaW5lIEJZVF9USElOS1BBRF8xMCAgMQo+ICAgI2RlZmluZSBCWVRfUE9W
X1AxMDA2VyAgIDIKPiAtI2RlZmluZSBCWVRfQUVHRVhfMTAgICAgIDMKPiAgIAo+ICAgc3RhdGlj
IGludCBieXRfdGhpbmtwYWQxMF9xdWlya19jYihjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCAq
aWQpCj4gICB7Cj4gQEAgLTM2LDEyICszNSw2IEBAIHN0YXRpYyBpbnQgYnl0X3Bvdl9wMTAwNndf
cXVpcmtfY2IoY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmlkKQo+ICAgCXJldHVybiAxOwo+
ICAgfQo+ICAgCj4gLXN0YXRpYyBpbnQgYnl0X2FlZ2V4MTBfcXVpcmtfY2IoY29uc3Qgc3RydWN0
IGRtaV9zeXN0ZW1faWQgKmlkKQo+IC17Cj4gLQlieXRfbWFjaGluZV9pZCA9IEJZVF9BRUdFWF8x
MDsKPiAtCXJldHVybiAxOwo+IC19Cj4gLQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lz
dGVtX2lkIGJ5dF90YWJsZVtdID0gewo+ICAgCXsKPiAgIAkJLmNhbGxiYWNrID0gYnl0X3RoaW5r
cGFkMTBfcXVpcmtfY2IsCj4gQEAgLTgyLDE4ICs3NSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZG1pX3N5c3RlbV9pZCBieXRfdGFibGVbXSA9IHsKPiAgIAkJCURNSV9FWEFDVF9NQVRDSChETUlf
Qk9BUkRfTkFNRSwgIjBFNTciKSwKPiAgIAkJfSwKPiAgIAl9LAo+IC0Jewo+IC0JCS8qIEFlZ2V4
IDEwIHRhYmxldCAoUlUyKSAqLwo+IC0JCS5jYWxsYmFjayA9IGJ5dF9hZWdleDEwX3F1aXJrX2Ni
LAo+IC0JCS5tYXRjaGVzID0gewo+IC0JCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJBRUdF
WCIpLAo+IC0JCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIlJVMiIpLAo+IC0JCX0s
Cj4gLQl9LAo+ICAgCXsgfQo+ICAgfTsKPiAgIAo+IC0vKiBUaGUgVGhpbmthcGQgMTAgYW5kIEFl
Z2V4IDEwIHRhYmxldHMgaGF2ZSB0aGUgc2FtZSBJRCBwcm9ibGVtICovCj4gICBzdGF0aWMgc3Ry
dWN0IHNuZF9zb2NfYWNwaV9tYWNoIGJ5dF90aGlua3BhZF8xMCA9IHsKPiAgIAkuaWQgPSAiMTBF
QzU2NDAiLAo+ICAgCS5kcnZfbmFtZSA9ICJjaHQtYnN3LXJ0NTY3MiIsCj4gQEAgLTEyMCw3ICsx
MDQsNiBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfYWNwaV9tYWNoICpieXRfcXVpcmsodm9pZCAq
YXJnKQo+ICAgCj4gICAJc3dpdGNoIChieXRfbWFjaGluZV9pZCkgewo+ICAgCWNhc2UgQllUX1RI
SU5LUEFEXzEwOgo+IC0JY2FzZSBCWVRfQUVHRVhfMTA6Cj4gICAJCXJldHVybiAmYnl0X3RoaW5r
cGFkXzEwOwo+ICAgCWNhc2UgQllUX1BPVl9QMTAwNlc6Cj4gICAJCXJldHVybiAmYnl0X3Bvdl9w
MTAwNnc7Cj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
