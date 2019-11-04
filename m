Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B864EEC91
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 22:58:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F186A1723;
	Mon,  4 Nov 2019 22:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F186A1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572904727;
	bh=KsvNlPv6F+ZpLP2FsOW+fkmZycBf5TAqAthVu6GE++s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWhr5OHPt0lp8gVzh+tpuXed3G+6VFLeJXRxfayOD9zLcjN/01RSpUSG0nsmTi2Gq
	 goH38Anx1J5dEEWTW+Gh4hnmB++lZmNrIoFEt71lYyDghxVptp1qFW5zIS/KT4Syvx
	 ZWE0bnc3FCvR2boQ0I/ws0iZ6OD+EjGpPxUCrcYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D25F804FE;
	Mon,  4 Nov 2019 22:56:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C354F805FB; Mon,  4 Nov 2019 22:56:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B8BF804FD
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 22:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B8BF804FD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 13:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="226888844"
Received: from trowland-mobl.amr.corp.intel.com (HELO [10.254.97.182])
 ([10.254.97.182])
 by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2019 13:56:11 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-14-pierre-louis.bossart@linux.intel.com>
 <42403ea0-e337-81b6-f11a-2a32c1473750@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0374d162-2cea-2fca-ec12-a0377130c711@linux.intel.com>
Date: Mon, 4 Nov 2019 15:46:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <42403ea0-e337-81b6-f11a-2a32c1473750@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 13/14] soundwire: intel: free all resources
 on hw_free()
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

CgpPbiAxMS80LzE5IDI6MDggUE0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTEw
LTIzIDIzOjI4LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gTWFrZSBzdXJlIGFsbCBj
YWxscyB0byB0aGUgU291bmRXaXJlIHN0cmVhbSBBUEkgYXJlIGRvbmUgYW5kIGludm9sdmUKPj4g
Y2FsbGJhY2sKPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFuZGVyIFdhbmcgPHJhbmRlci53YW5nQGxp
bnV4LmludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgCj4+
IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2
ZXJzL3NvdW5kd2lyZS9pbnRlbC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb3VuZHdpcmUvaW50ZWwuYyBiL2Ry
aXZlcnMvc291bmR3aXJlL2ludGVsLmMKPj4gaW5kZXggYWYyNGZhMDQ4YWRkLi5jYWQxYzBiNjRl
ZTMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc291bmR3aXJlL2ludGVsLmMKPj4gKysrIGIvZHJp
dmVycy9zb3VuZHdpcmUvaW50ZWwuYwo+PiBAQCAtNTQ4LDYgKzU0OCwyNSBAQCBzdGF0aWMgaW50
IGludGVsX3BhcmFtc19zdHJlYW0oc3RydWN0IHNkd19pbnRlbCAKPj4gKnNkdywKPj4gwqDCoMKg
wqDCoCByZXR1cm4gLUVJTzsKPj4gwqAgfQo+PiArc3RhdGljIGludCBpbnRlbF9mcmVlX3N0cmVh
bShzdHJ1Y3Qgc2R3X2ludGVsICpzZHcsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IGxpbmtfaWQpCj4+ICt7Cj4+ICvCoMKgwqAg
c3RydWN0IHNkd19pbnRlbF9saW5rX3JlcyAqcmVzID0gc2R3LT5saW5rX3JlczsKPj4gK8KgwqDC
oCBzdHJ1Y3Qgc2R3X2ludGVsX3N0cmVhbV9mcmVlX2RhdGEgZnJlZV9kYXRhOwo+PiArCj4+ICvC
oMKgwqAgZnJlZV9kYXRhLnN1YnN0cmVhbSA9IHN1YnN0cmVhbTsKPj4gK8KgwqDCoCBmcmVlX2Rh
dGEuZGFpID0gZGFpOwo+PiArwqDCoMKgIGZyZWVfZGF0YS5saW5rX2lkID0gbGlua19pZDsKPj4g
Kwo+PiArwqDCoMKgIGlmIChyZXMtPm9wcyAmJiByZXMtPm9wcy0+ZnJlZV9zdHJlYW0gJiYgcmVz
LT5kZXYpCj4gCj4gQ2FuIHJlcy0+ZGV2IGV2ZW4gYmUgbnVsbD8KCmluIGVycm9yIGNhc2VzIHll
cy4gdGhpcyAncmVzJyBzdHJ1Y3R1cmUgaXMgc2V0dXAgYnkgdGhlIERTUCBkcml2ZXIsIGFuZCAK
aXQgY291bGQgYmUgd3Jvbmcgb3Igbm90IHNldC4KCk5vdGUgdGhhdCBpbiB0aGUgcHJldmlvdXMg
c29sdXRpb24gd2UgdGVzdGVkIHRoZSByZXMtPmFyZyBwb2ludGVyLCB3ZSAKZGlkIGZpbmQgYSBj
YXNlIHdoZXJlIHdlIGNvdWxkIG9vcHMgaGVyZS4KCj4gCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmVzLT5vcHMtPmZyZWVfc3RyZWFtKHJlcy0+ZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZmcmVlX2RhdGEpOwo+PiArCj4+ICvCoMKg
wqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gwqAgLyoKPj4gwqDCoCAqIGJhbmsgc3dpdGNoIHJv
dXRpbmVzCj4+IMKgwqAgKi8KPj4gQEAgLTgxNiw2ICs4MzUsNyBAQCBzdGF0aWMgaW50Cj4+IMKg
IGludGVsX2h3X2ZyZWUoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sIHN0cnVj
dCAKPj4gc25kX3NvY19kYWkgKmRhaSkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBzZHdf
Y2RucyAqY2RucyA9IHNuZF9zb2NfZGFpX2dldF9kcnZkYXRhKGRhaSk7Cj4+ICvCoMKgwqAgc3Ry
dWN0IHNkd19pbnRlbCAqc2R3ID0gY2Ruc190b19pbnRlbChjZG5zKTsKPj4gwqDCoMKgwqDCoCBz
dHJ1Y3Qgc2R3X2NkbnNfZG1hX2RhdGEgKmRtYTsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiBA
QCAtODIzLDEyICs4NDMsMjggQEAgaW50ZWxfaHdfZnJlZShzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJl
YW0gCj4+ICpzdWJzdHJlYW0sIHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpKQo+PiDCoMKgwqDCoMKg
IGlmICghZG1hKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87Cj4+ICvCoMKgwqAg
cmV0ID0gc2R3X2RlcHJlcGFyZV9zdHJlYW0oZG1hLT5zdHJlYW0pOwo+PiArwqDCoMKgIGlmIChy
ZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGFpLT5kZXYsICJzZHdfZGVwcmVwYXJl
X3N0cmVhbTogZmFpbGVkICVkIiwgcmV0KTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7
Cj4+ICvCoMKgwqAgfQo+PiArCj4gCj4gSSB1bmRlcnN0YW5kIHRoYXQgeW91IHdhbnQgdG8gYmUg
dHJhbnNwYXJlbnQgdG8gY2FsbGVyIHdpdGggZmFpbHVyZSAKPiByZWFzb25zIHZpYSBkZXZfZXJy
L193YXJuLiBIb3dldmVyLCBzZHdfZGVwcmVwYXJlX3N0cmVhbSBhbHJlYWR5IGR1bXBzIAo+IGFs
bCB0aGUgbG9ncyB3ZSBuZWVkLiBUaGUgc2FtZSBhcHBsaWVzIGZvciBtb3N0IG9mIHRoZSBvdGhl
ciBjYWxscyAoYW5kIAo+IG5vdCBqdXN0IGluIHRoaXMgcGF0Y2guLikuCj4gCj4gRG8gd2UgcmVh
bGx5IG5lZWQgdG8gYmUgdGhhdCB2ZXJib3NlPyBNYXliZSBqdXN0IGFncmVlIG9uIGNhbGxlciAt
b3ItIAo+IHN1YmplY3QgYmVpbmcgdGhlIHNvdXJjZSBmb3IgdGhlIG1lc3NhZ2luZywgYWxpZ24g
ZXhpc3RpbmcgdXNhZ2VzIGFuZCAKPiB0aHVzIHByZXZlbnRpbmcgZnVydGhlciBkdXBsaWNhdGlv
bj8KPiAKPiBOb3QgZm9yY2luZyBhbnl0aGluZywganVzdCBhc2tpbmcgZm9yIHlvdXIgb3Bpbmlv
biBvbiB0aGlzLgoKdGhlIHNkd19wcmVwYXJlL2RlcHJlcGFyZV9zdHJlYW0gY2FsbHMgcHJvdmlk
ZSBlcnJvciBsb2dzLCBidXQgdGhleSBhcmUgCm5vdCBtYXBwZWQgdG8gc3BlY2lmaWMgZGV2aWNl
cy9kYWlzIChwcl9lcnIgdnMuIGRldl9kYmcpLiBJIGZvdW5kIGl0IHdhcyAKZWFzaWVyIHRvIGNo
ZWNrIGZvciB3aGljaCBkYWkgdGhlIGVycm9yIHdhcyByZXBvcnRlZC4KCldlIGFyZSBhbHNvIGlu
IHRoZSBtaWRkbGUgb2YgaW50ZWdyYXRpb24gd2l0aCBuZXcgaGFyZHdhcmUvYm9hcmRzLCBhbmQg
CmVycmluZyBvbiB0aGUgc2lkZSBvZiBtb3JlIHRyYWNlcyB3aWxsIGhlbHAgZXZlcnlvbmUgaW52
b2x2ZWQuIFdlIGNhbiAKcmV2aXNpdCBsYXRlciB3aGljaCBvbmVzIGFyZSBzdHJpY3RseSBuZWNl
c3NhcnkuCgo+IAo+PiDCoMKgwqDCoMKgIHJldCA9IHNkd19zdHJlYW1fcmVtb3ZlX21hc3Rlcigm
Y2Rucy0+YnVzLCBkbWEtPnN0cmVhbSk7Cj4+IC3CoMKgwqAgaWYgKHJldCA8IDApCj4+ICvCoMKg
wqAgaWYgKHJldCA8IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGFpLT5kZXYs
ICJyZW1vdmUgbWFzdGVyIGZyb20gc3RyZWFtICVzIGZhaWxlZDogJWRcbiIsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRtYS0+c3RyZWFtLT5uYW1lLCByZXQpOwo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCB9Cj4+IC3CoMKgwqAgcmV0dXJuIHJldDsKPj4g
K8KgwqDCoCByZXQgPSBpbnRlbF9mcmVlX3N0cmVhbShzZHcsIHN1YnN0cmVhbSwgZGFpLCBzZHct
Pmluc3RhbmNlKTsKPj4gK8KgwqDCoCBpZiAocmV0IDwgMCkgewo+PiArwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycihkYWktPmRldiwgImludGVsX2ZyZWVfc3RyZWFtOiBmYWlsZWQgJWQiLCByZXQpOwo+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDC
oCBzZHdfcmVsZWFzZV9zdHJlYW0oZG1hLT5zdHJlYW0pOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJu
IDA7Cj4+IMKgIH0KPiAKPiBHaXZlbiB0aGUgc3RydWN0dXJlIG9mIHRoaXMgZnVuY3Rpb24sIHNo
b3VsZG4ndCB0aGUgZ2VuZXJpYyBmbG93IGJlIAo+IGhhbmRsZWQgYnkgdXBwZXIgbGF5ZXIgaS5l
LiBwYXJ0IG9mIHNkdyBjb3JlPy4gQXBhcnQgZnJvbSAKPiBpbnRlbF9mcmVlX3N0cmVhbSwgdGhl
IHJlc3QgbG9va3MgcHJldHR5IGdlbmVyaWMgdG8gbWUgYW5kIHRoaXMgc29sZSAKPiBjYWxsIGNv
dWxkIGVhc2lseSBiZSBleHRyYWN0ZWQgaW50byBvcHMuCgpUaGUgbWFwcGluZyBiZXR3ZWVuIERB
SSBhbmQgc3RyZWFtIGlzIG5vdCBuZWNlc3NhcmlseSB0aGUgc2FtZSBmb3IgYWxsIApwbGF0Zm9y
bXMsIHdlIGp1c3QgaGFkIHRoaXMgZGlzY3Vzc2lvbiB3aGlsZSByZXZpZXdpbmcgdGhlIFFDT00g
cGF0Y2hlcyAKbGFzdCB3ZWVrLiB3aGV0aGVyIHlvdSByZWxlYXNlIHRoZSByZXNvdXJjZXMgaW4g
Lmh3X2ZyZWUoKSBvciAKLnNodXRkb3duKCkgaXMgYWxzbyBwbGF0Zm9ybSBkZXBlbmRlbnQuCgpB
bHNvIHRoaXMgY29kZSB3aWxsIGNoYW5nZSB3aGVuIHdlIHN1cHBvcnQgdGhlIG11bHRpLUNQVSBk
YWlzLCBtb3JlIHdvcmsgCndpbGwgYmUgaGFuZGxlZCBhdCB0aGUgZGFpbGluayBsZXZlbCB0aGFu
IGF0IHRoZSBkYWkuCldlIGNhbiAoYW5kIHdpbGwpIHJlZmFjdG9yIGF0IGEgbGF0ZXIgcG9pbnQu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
