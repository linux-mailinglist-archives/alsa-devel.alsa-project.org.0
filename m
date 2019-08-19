Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F794FDD
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 23:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC009166B;
	Mon, 19 Aug 2019 23:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC009166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566250077;
	bh=0lKzej9GZN6gGHtl2N1S6bG3tMhOo2rV0OxImvwCqxU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tS3JKDHOrSNlJkX++LCO1/F+VPOq5JfR2o+ouEvBOz0iahZ9A/7OCSUsDpifVUVLl
	 icw5hW21CEWI7aGQjl9LGvpAPqfdypKg/0mGvXnLK6tN3TgOBZEYnXjdP3/P8OJGXh
	 T2jYUJYEXN9tYS7k2DhC7iqR+njxqdpZFsKsIMOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC0EF802BE;
	Mon, 19 Aug 2019 23:26:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30588F802BE; Mon, 19 Aug 2019 23:26:11 +0200 (CEST)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE625F802E0
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 23:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE625F802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 14:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,406,1559545200"; d="scan'208";a="177986477"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.27.116])
 ([10.252.27.116])
 by fmsmga008.fm.intel.com with ESMTP; 19 Aug 2019 14:16:03 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-3-pierre-louis.bossart@linux.intel.com>
 <c8c78674-7af8-4577-9e18-da85c064b345@intel.com>
 <4fe0c027-9c6c-1e76-5fb0-7325fbab48a2@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <0f089035-c5b5-0af9-2e72-00ec773cd056@intel.com>
Date: Mon, 19 Aug 2019 23:16:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4fe0c027-9c6c-1e76-5fb0-7325fbab48a2@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: imx: Add i.MX8 HW support
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

T24gMjAxOS0wOC0xOSAxNzoyMSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gT24gOC8x
Ny8xOSAxMDoyMSBBTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+PiBPbiAyMDE5LTA4LTE1IDE3
OjQ0LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+IEZyb206IERhbmllbCBCYWx1dGEg
PGRhbmllbC5iYWx1dGFAbnhwLmNvbT4KPj4+Cj4+PiBBZGQgc3VwcG9ydCBmb3IgdGhlIGF1ZGlv
IERTUCBoYXJkd2FyZSBmb3VuZCBvbiBOWFAgaS5NWDggcGxhdGZvcm0uCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgo+Pj4gU2lnbmVk
LW9mZi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgCj4+PiA8cGllcnJlLWxvdWlzLmJvc3NhcnRA
bGludXguaW50ZWwuY29tPgo+Pj4gK3N0YXRpYyB2b2lkIGlteDhfZ2V0X3JlcGx5KHN0cnVjdCBz
bmRfc29mX2RldiAqc2RldikKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBzbmRfc29mX2lwY19t
c2cgKm1zZyA9IHNkZXYtPm1zZzsKPj4+ICvCoMKgwqAgc3RydWN0IHNvZl9pcGNfcmVwbHkgcmVw
bHk7Cj4+PiArwqDCoMKgIGludCByZXQgPSAwOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoIW1zZykg
ewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl93YXJuKHNkZXYtPmRldiwgInVuZXhwZWN0ZWQgaXBj
IGludGVycnVwdFxuIik7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gK8KgwqDCoCB9
Cj4+PiArCj4+PiArwqDCoMKgIC8qIGdldCByZXBseSAqLwo+Pj4gK8KgwqDCoCBzb2ZfbWFpbGJv
eF9yZWFkKHNkZXYsIHNkZXYtPmhvc3RfYm94Lm9mZnNldCwgJnJlcGx5LCAKPj4+IHNpemVvZihy
ZXBseSkpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAocmVwbHkuZXJyb3IgPCAwKSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgbWVtY3B5KG1zZy0+cmVwbHlfZGF0YSwgJnJlcGx5LCBzaXplb2YocmVwbHkp
KTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSByZXBseS5lcnJvcjsKPj4+ICvCoMKgwqAgfSBl
bHNlIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCAvKiByZXBseSBoYXMgY29ycmVjdCBzaXplPyAqLwo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXBseS5oZHIuc2l6ZSAhPSBtc2ctPnJlcGx5X3NpemUp
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoc2Rldi0+ZGV2LCAiZXJyb3I6
IHJlcGx5IGV4cGVjdGVkICV6dSBnb3QgJXUgCj4+PiBieXRlc1xuIiwKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbXNnLT5yZXBseV9zaXplLCByZXBseS5oZHIuc2l6ZSk7Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIH0KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCAvKiByZWFkIHRoZSBtZXNzYWdlICovCj4+
PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1zZy0+cmVwbHlfc2l6ZSA+IDApCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzb2ZfbWFpbGJveF9yZWFkKHNkZXYsIHNkZXYtPmhvc3RfYm94Lm9mZnNl
dCwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1zZy0+cmVw
bHlfZGF0YSwgbXNnLT5yZXBseV9zaXplKTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDC
oCBtc2ctPnJlcGx5X2Vycm9yID0gcmV0Owo+Pj4gK30KPj4KPj4gQXNzdW1pbmcgcmVwbHkuaGRy
LnNpemUgaXMgY29taW5nIGZyb20gSFcgSVBDIHJlZ3MsIG1zZyBvYmplY3QgaXMgCj4+IHJlcHJl
c2VudGluZyBhcHBsaWNhdGlvbiBzaWRlIC0gU1csIGtlcm5lbC4gSWYgc28sIGlzIG1zZy0+cmVw
bHlfc2l6ZSAKPj4gdmFsdWUgYW4gZXN0aW1hdGVkIHNpemUgKHdoaWNoIGNhbiBiZSBvdmVyZXN0
aW1hdGVkIHNpbmNlIGV4YWN0IHNpemUgCj4+IG1heSBiZSB1bmtub3duIGJ5IHRoZSBob3N0KSAt
b3ItIHRoZSBleGFjdCBzaXplIG9mIGluY29taW5nIElQQyByZXBseT8KPj4KPj4gVGhlIGVzdGlt
YXRlZC1jYXNlIGlzIHVzdWFsbHkgcGVybWlzc2l2ZSBhcyBsb25nIGFzIGFzc3VtZWQgc2l6ZSBp
cyA+PSAKPj4gcmVwbHkuaGRyLnNpemUgLSBkZXZfZXJyIG5lZWRlZC4gSW4gdGhlIGV4YWN0LWNh
c2UsIGl0IHNob3VsZCBiZSAKPj4gdmlld2VkIGFzIGEgcmVxdWlyZW1lbnQuIElmIHN1Y2ggInJl
cXVpcmVtZW50IiBmYWlscywgaXMgaXQgdmFsaWQgdG8gCj4+IHJlYWQgbWFpbGJveCByZWdhcmRs
ZXNzPyBJcyB0aGlzIHRvIGV4dHJhY3Qgc29tZSBlcnJvci1kZWJ1ZyBwYXlsb2FkIAo+PiBzZW50
IGJ5IEZXPwo+Pgo+PiBKdXN0IGN1cmlvdXMsIHBsZWFzZSBmZWVsIGZyZWUgdG8gY29ycmVjdCBt
ZSBoZXJlLCBQaWVycmUuCj4gCj4gSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSBxdWVzdGlv
bi4gVGhlcmUgaXMgbm8gdXNlIG9mIEhXIElQQyAKPiByZWdpc3RlcnMgKGFzIGRvbmUgaW4gU0tM
KSBzaW5jZSB0aGlzIGlzIG5vdCBwb3J0YWJsZSBhY3Jvc3MgaGFyZHdhcmUuIAo+IFRoZXJlICpt
YXkqIGJlIGluZm9ybWF0aW9uIHNlbnQgb3ZlciBJUEMgcmVnaXN0ZXJzIGJ1dCB0aGF0IHdvdWxk
IGhhdmUgCj4gdG8gYmUgZG9uZSBpbiBwbGF0Zm9ybS1zcGVjaWZpYyB3YXlzIC0gYXMgd2lsbCBi
ZSBkb25lIGZvciBJbnRlbCB0byBlLmcuIAo+IGF2b2lkIHVzaW5nIG1lbW9yeSB3aW5kb3dzIHRo
YXQgbWF5IG5vdCBiZSBwb3dlcmVkLgoKVExEUjoKV2FzIHdvbmRlcmluZyBhYm91dCBzb2ZfbWFp
bGJveF9yZWFkIGJlaW5nIGludm9rZWQgcmVnYXJkbGVzcyBvZiAKc2l6ZS1jaGVjayBvdXRjb21l
IChkZXZfZXJyIHJlcG9ydHMgc2l6ZSBtaXNtYXRjaCBhZnRlciBhbGwpLgoKR2l2ZW4geW91ciBh
bnN3ZXIsIGd1ZXNzIHRoZSBlcnJvci1wYXlsb2FkIG1heSBzdGlsbCBiZSBzZW50IGJhY2sgc28g
Cml0J3MgcHJlZmVyYWJsZSB0byByZWFkIHRoZSB1cGxpbmsgZGVzcGl0ZSB0aGUgdW5leHBlY3Rl
ZCBjaXJjdW1zdGFuY2VzIAotIHNpemUgbWlzbWF0Y2guCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
