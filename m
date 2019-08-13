Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9968C15A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 21:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8161A1680;
	Tue, 13 Aug 2019 21:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8161A1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565723813;
	bh=1mVO74xcaqYNtcsGPGRL8xMn0hJDE7mXa4NoLoArI7Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SqHvGoIpzpD025uhPF+pWqUkohhKIRccDyGs8CAI4l9dH9h8h55l34svq4neUbaK5
	 5Kwd0JmWNj2/HZeTtHFw1NDFP2aPHNS9/wRlA8j0NhcyPzp3KLtJOuzURShGJME+Tc
	 zQq69utuWn9PzdqRTkL0r71fum9Uv2KC4s4hnHgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FD3F80273;
	Tue, 13 Aug 2019 21:15:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 440EEF80273; Tue, 13 Aug 2019 21:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A02D4F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 21:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02D4F80120
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 12:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="200586463"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2019 12:15:00 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
 by linux.intel.com (Postfix) with ESMTP id D9969580372;
 Tue, 13 Aug 2019 12:14:58 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
Date: Tue, 13 Aug 2019 14:15:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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

T24gOC8xMy8xOSAxOjA2IFBNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+IAo+IAo+IE9u
IDEzLzA4LzIwMTkgMTg6NTEsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+PiBPbiA4LzEz
LzE5IDExOjUwIEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+Pj4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3LAo+Pj4KPj4+IE9uIDEzLzA4LzIwMTkgMTU6NDQsIFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IHdyb3RlOgo+Pj4+IE9uIDgvMTMvMTkgMzozNSBBTSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3
cm90ZToKPj4+Pj4gT24gcGxhdGZvcm1zIHdoaWNoIGhhdmUgc21hcnQgc3BlYWtlciBhbXBsaWZp
ZXJzIGNvbm5lY3RlZCB2aWEKPj4+Pj4gc291bmR3aXJlIGFuZCBtb2RlbGVkIGFzIGF1eCBkZXZp
Y2VzIGluIEFTb0MsIGluIHN1Y2ggdXNlY2FzZXMgbWFjaGluZQo+Pj4+PiBkcml2ZXIgc2hvdWxk
IGJlIGFibGUgdG8gZ2V0IHNkdyBtYXN0ZXIgc3RyZWFtIGZyb20gZGFpIHNvIHRoYXQgaXQgY2Fu
Cj4+Pj4+IHVzZSB0aGUgcnVudGltZSBzdHJlYW0gdG8gc2V0dXAgc2xhdmUgc3RyZWFtcy4KPj4+
Pgo+Pj4+IHVzaW5nIHRoZSBfc2V0X3Nkd19zdHJlYW0/IEkgZG9uJ3QgZnVsbHkgZ2V0IHRoZSBz
ZXF1ZW5jZSB3aXRoIHRoZSAKPj4+PiB3b3JkaW5nIGFib3ZlLgo+Pj4KPj4+IFllcywgdXNpbmcg
c2V0X3Nkd19zdHJlYW0oKS4KPj4KPj4gTWF5YmUgSSBhbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJl
LCBidXQgSSBkb24ndCBzZWUgd2hlcmUgdGhlIAo+PiBzZXRfc2R3X3N0cmVhbSgpIGlzIGNhbGxl
ZC4KPiAKPiBzb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4gSXQgd2FzIHRvbyBxdWljayByZXBseS4g
Oi0pCj4gSSB3YXMgc3VwcG9zZSB0byBzYXkgc2R3X3N0cmVhbV9hZGRfc2xhdmUoKSBpbnN0ZWFk
IG9mIHNldF9zZHdfc3RyZWFtKCkuCgpvaywgc28gZ2V0X3Nkd19zdHJlYW0oKSBhbmQgc2V0X3Nk
d19zdHJlYW0oKSBhcmUgbm90IG1lYW50IHRvIGJlIG1pcnJvcnMgCm9yIGJvdGggaW1wbGVtZW50
ZWQuIEl0J3MganVzdCBhIGhlbHBlciB0byByZXNwZWN0aXZlbHkgZ2V0IGEgY29udGV4dCBvciAK
c2V0IGEgY29udGV4dCBidXQgYSBnZXQtbW9kaWZ5LXNldCB0eXBlIG9mIG9wZXJhdGlvbiBpcyBu
b3QgZXhwZWN0ZWQuCgpEbyBJIGdldCB0aGlzIHJpZ2h0PwoKPiAKPiBBcyBBdXggZGV2aWNlIGlz
IGRhaWxlc3MgdGhlcmUgaXMgbm8gd2F5IHRvIGdldCBob2xkIG9mIHNkdyBzdHJlYW0gCj4gcnVu
dGltZSBmb3Igc2xhdmUgZGV2aWNlIGFzc29jaWF0ZWQgd2l0aCBpdC4KPiAKPiBIYXZpbmcgc25k
X3NvY19kYWlfZ2V0X3Nkd19zdHJlYW0oKSB3b3VsZCBoZWxwIG1hY2hpbmUgZHJpdmVyIHRvIGdl
dCAKPiBob2xkIG9mIHNkd19zdHJlYW1fcnVudGltZSBmcm9tIGNvbnRyb2xsZXIgZGFpIGFuZCBz
ZXR1cCBzbGF2ZSBzdHJlYW1zIAo+IHVzaW5nIHNkd19zdHJlYW1fYWRkX3NsYXZlKCkuCj4gCj4g
Cj4gdGhhbmtzLAo+IHNyaW5pCj4gCj4gCj4+Cj4+IEFsc28gSSBkb24ndCBmdWxseSBnZXQgdGhl
IHJ1bGUuIHNldF9zZHdfc3RyZWFtKCkgbG9va3MgcmVxdWlyZWQsIAo+PiBnZXRfc2R3X3N0cmVh
bSgpIGlzIG9wdGlvbmFsLCBpcyB0aGlzIHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nPwo+Pgo+Pj4+
Cj4+Pj4+Cj4+Pj4+IHNvdW5kd2lyZSBhbHJlYWR5IGFzIGEgc2V0IGZ1bmN0aW9uLCBnZXQgZnVu
Y3Rpb24gd291bGQgcHJvdmlkZSBtb3JlCj4+Pj4+IGZsZXhpYmlsaXR5IHRvIGFib3ZlIGNvbmZp
Z3VyYXRpb25zLgo+Pj4+Cj4+Pj4gSSBhbSBub3QgY2xlYXIgaWYgeW91IGFyZSBhc2tpbmcgZm9y
IGJvdGggdG8gYmUgdXNlZCwgb3IgZ2V0IG9ubHkgb3IgCj4+Pj4gc2V0IG9ubHk/Cj4+Pgo+Pj4g
SXQgZGVwZW5kcyBvbiB0aGUgdXNlY2FzZSwgaW4gZGI4NDVjIHVzZWNhc2XCoCBbMV0gYXMgQXV4
IGRldmljZSBpcyAKPj4+IGRhaSBsZXNzLCBtYWNoaW5lIGRyaXZlciBpcyB1c2luZyBnZXQgZnVu
Y3Rpb24gdG8gZ2V0IGhvbGQgb2YgbWFzdGVyIAo+Pj4gc3RyZWFtIHNvIHRoYXQgaXQgY2FuIHNl
dHVwIHNsYXZlIHBvcnQgY29uZmlnLgo+Pj4KPj4+Cj4+PiBMb29rcyBsaWtlIHRoZXJlIGlzIGEg
dHlwbyBpbiBhYm92ZSBsaWtlCj4+Pgo+Pj4gVGhpcyB3YXMgc3VwcG9zZWQgdG8gYmUgInNvdW5k
d2lyZSBhbHJlYWR5IGhhcyBhIHNldCBmdW5jdGlvbiwgZ2V0IAo+Pj4gZnVuY3Rpb24gd291bGQg
cHJvdmlkZSBtb3JlIGZsZXhpYmlsaXR5IHRvIGFib3ZlIGNvbmZpZ3VyYXRpb25zIgo+Pj4KPj4+
IFsxXSAKPj4+IGh0dHBzOi8vZ2l0LmxpbmFyby5vcmcvbGFuZGluZy10ZWFtcy93b3JraW5nL3F1
YWxjb21tL2tlcm5lbC5naXQvdHJlZS9zb3VuZC9zb2MvcWNvbS9kYjg0NWMuYz9oPWludGVncmF0
aW9uLWxpbnV4LXFjb21sdCAKPj4+Cj4+Pgo+Pj4gdGhhbmtzLAo+Pj4gc3JpbmkKPj4+Cj4+Pj4K
Pj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMu
a2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+Pj4+PiAtLS0KPj4+Pj4gwqAgaW5jbHVkZS9zb3VuZC9z
b2MtZGFpLmggfCAxMCArKysrKysrKysrCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL3NvYy1kYWku
aCBiL2luY2x1ZGUvc291bmQvc29jLWRhaS5oCj4+Pj4+IGluZGV4IGRjNDhmZTA4MWEyMC4uMWUw
MWY0YTMwMmUwIDEwMDY0NAo+Pj4+PiAtLS0gYS9pbmNsdWRlL3NvdW5kL3NvYy1kYWkuaAo+Pj4+
PiArKysgYi9pbmNsdWRlL3NvdW5kL3NvYy1kYWkuaAo+Pj4+PiBAQCAtMjAyLDYgKzIwMiw3IEBA
IHN0cnVjdCBzbmRfc29jX2RhaV9vcHMgewo+Pj4+PiDCoMKgwqDCoMKgIGludCAoKnNldF9zZHdf
c3RyZWFtKShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdm9pZCAqc3RyZWFtLCBpbnQgZGlyZWN0aW9uKTsKPj4+Pj4gK8KgwqDCoCB2b2lk
ICooKmdldF9zZHdfc3RyZWFtKShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwgaW50IGRpcmVjdGlv
bik7Cj4+Pj4+IMKgwqDCoMKgwqAgLyoKPj4+Pj4gwqDCoMKgwqDCoMKgICogREFJIGRpZ2l0YWwg
bXV0ZSAtIG9wdGlvbmFsLgo+Pj4+PiDCoMKgwqDCoMKgwqAgKiBDYWxsZWQgYnkgc29jLWNvcmUg
dG8gbWluaW1pc2UgYW55IHBvcHMuCj4+Pj4+IEBAIC00MTAsNCArNDExLDEzIEBAIHN0YXRpYyBp
bmxpbmUgaW50IAo+Pj4+PiBzbmRfc29jX2RhaV9zZXRfc2R3X3N0cmVhbShzdHJ1Y3Qgc25kX3Nv
Y19kYWkgKmRhaSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PVFNVUFA7Cj4+
Pj4+IMKgIH0KPj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqc25kX3NvY19kYWlfZ2V0X3Nkd19z
dHJlYW0oc3RydWN0IHNuZF9zb2NfZGFpIAo+Pj4+PiAqZGFpLAo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgZGlyZWN0aW9uKQo+
Pj4+PiArewo+Pj4+PiArwqDCoMKgIGlmIChkYWktPmRyaXZlci0+b3BzLT5nZXRfc2R3X3N0cmVh
bSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBkYWktPmRyaXZlci0+b3BzLT5nZXRfc2R3
X3N0cmVhbShkYWksIGRpcmVjdGlvbik7Cj4+Pj4+ICvCoMKgwqAgZWxzZQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVOT1RTVVBQKTsKPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+
PiDCoCAjZW5kaWYKPj4+Pj4KPj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKPj4+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
