Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A737F5033
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 16:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8558682B;
	Fri,  8 Nov 2019 16:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8558682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573228282;
	bh=QXgbSRFkbtoKnFg++a7W8ar6YUVkaWlhvz3d/O8sFwI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HawZXQ2b8EKAllriW8cRxvMfsfqZDv7unSKqIFNnOb19oc9t7BqZ2GcWYK0rksPET
	 AJEfB3GK4RQgBC3wVjkJIprm3JXiZz5AD6G87zAQ9NWEeWGPBxd00udrj5vZymNPON
	 RZG0opuZ9Hq799XGMMRi0IVzZYgSxPlc0a+kgbYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4DA6F805FF;
	Fri,  8 Nov 2019 16:48:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA36EF805A1; Fri,  8 Nov 2019 16:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9378CF800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 16:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9378CF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Nov 2019 07:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; d="scan'208";a="377794934"
Received: from nupoorko-mobl1.amr.corp.intel.com (HELO [10.251.157.201])
 ([10.251.157.201])
 by orsmga005.jf.intel.com with ESMTP; 08 Nov 2019 07:47:42 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-14-pierre-louis.bossart@linux.intel.com>
 <42403ea0-e337-81b6-f11a-2a32c1473750@intel.com>
 <0374d162-2cea-2fca-ec12-a0377130c711@linux.intel.com>
 <20191108041435.GV952516@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6daf0d90-a5f9-d510-f458-879528500134@linux.intel.com>
Date: Fri, 8 Nov 2019 08:39:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191108041435.GV952516@vkoul-mobl>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, jank@cadence.com,
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

CgpPbiAxMS83LzE5IDEwOjE0IFBNLCBWaW5vZCBLb3VsIHdyb3RlOgo+IE9uIDA0LTExLTE5LCAx
NTo0NiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+IE9uIDExLzQvMTkgMjowOCBQTSwg
Q2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4gT24gMjAxOS0xMC0yMyAyMzoyOCwgUGllcnJlLUxv
dWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4gQEAgLTgxNiw2ICs4MzUsNyBAQCBzdGF0aWMgaW50Cj4+
Pj4gIMKgIGludGVsX2h3X2ZyZWUoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0s
IHN0cnVjdAo+Pj4+IHNuZF9zb2NfZGFpICpkYWkpCj4+Pj4gIMKgIHsKPj4+PiAgwqDCoMKgwqDC
oCBzdHJ1Y3Qgc2R3X2NkbnMgKmNkbnMgPSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+
Pj4+ICvCoMKgwqAgc3RydWN0IHNkd19pbnRlbCAqc2R3ID0gY2Ruc190b19pbnRlbChjZG5zKTsK
Pj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3Qgc2R3X2NkbnNfZG1hX2RhdGEgKmRtYTsKPj4+PiAgwqDC
oMKgwqDCoCBpbnQgcmV0Owo+Pj4+IEBAIC04MjMsMTIgKzg0MywyOCBAQCBpbnRlbF9od19mcmVl
KHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbQo+Pj4+ICpzdWJzdHJlYW0sIHN0cnVjdCBzbmRfc29j
X2RhaSAqZGFpKQo+Pj4+ICDCoMKgwqDCoMKgIGlmICghZG1hKQo+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU87Cj4+Pj4gK8KgwqDCoCByZXQgPSBzZHdfZGVwcmVwYXJlX3N0cmVh
bShkbWEtPnN0cmVhbSk7Cj4+Pj4gK8KgwqDCoCBpZiAocmV0KSB7Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGRldl9lcnIoZGFpLT5kZXYsICJzZHdfZGVwcmVwYXJlX3N0cmVhbTogZmFpbGVkICVkIiwg
cmV0KTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+PiArwqDCoMKgIH0KPj4+
PiArCj4+Pgo+Pj4gSSB1bmRlcnN0YW5kIHRoYXQgeW91IHdhbnQgdG8gYmUgdHJhbnNwYXJlbnQg
dG8gY2FsbGVyIHdpdGggZmFpbHVyZQo+Pj4gcmVhc29ucyB2aWEgZGV2X2Vyci9fd2Fybi4gSG93
ZXZlciwgc2R3X2RlcHJlcGFyZV9zdHJlYW0gYWxyZWFkeSBkdW1wcwo+Pj4gYWxsIHRoZSBsb2dz
IHdlIG5lZWQuIFRoZSBzYW1lIGFwcGxpZXMgZm9yIG1vc3Qgb2YgdGhlIG90aGVyIGNhbGxzIChh
bmQKPj4+IG5vdCBqdXN0IGluIHRoaXMgcGF0Y2guLikuCj4gCj4gSSB0aGluayB0aGlzIGlzIGEg
dmFsaWQgY29uY2VybiEgSW4gbGludXggd2UgZG8gbm90IGRvIHRoYXQsIGZvciBleGFtcGxlCj4g
d2UgYXNrIHBlb3BsZSB0byBub3QgbG9nIGVycm9ycyBvbiBrbWFsbG9jIGFzIGl0IHdpbGwgYmUg
bG9nZ2VkIG9uCj4gZmFpbHVyZXMgc28gZHJpdmVycyBkbyBub3QgbmVlZCB0byBkbyB0aGF0Lgo+
IAo+Pj4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gYmUgdGhhdCB2ZXJib3NlPyBNYXliZSBqdXN0IGFn
cmVlIG9uIGNhbGxlciAtb3ItCj4+PiBzdWJqZWN0IGJlaW5nIHRoZSBzb3VyY2UgZm9yIHRoZSBt
ZXNzYWdpbmcsIGFsaWduIGV4aXN0aW5nIHVzYWdlcyBhbmQKPj4+IHRodXMgcHJldmVudGluZyBm
dXJ0aGVyIGR1cGxpY2F0aW9uPwo+Pj4KPj4+IE5vdCBmb3JjaW5nIGFueXRoaW5nLCBqdXN0IGFz
a2luZyBmb3IgeW91ciBvcGluaW9uIG9uIHRoaXMuCj4+Cj4+IHRoZSBzZHdfcHJlcGFyZS9kZXBy
ZXBhcmVfc3RyZWFtIGNhbGxzIHByb3ZpZGUgZXJyb3IgbG9ncywgYnV0IHRoZXkgYXJlIG5vdAo+
PiBtYXBwZWQgdG8gc3BlY2lmaWMgZGV2aWNlcy9kYWlzIChwcl9lcnIgdnMuIGRldl9kYmcpLiBJ
IGZvdW5kIGl0IHdhcyBlYXNpZXIKPj4gdG8gY2hlY2sgZm9yIHdoaWNoIGRhaSB0aGUgZXJyb3Ig
d2FzIHJlcG9ydGVkLgo+IAo+IFdlbGwgaW4gdGhhdCBjYXNlIHdlIHNob3VsZCBmaXggcHJfZXJy
LCB0aGVyZSBhcmUgb25seSAxNyBpbnN0YW5jZXMgb2YKPiB0aGVzZSBpbiBjb3JlLCBhbmQgZmV3
IG9mIHRoZW0gYXJlIGp1c3RpZmllZCBpbiBjb3JlIChubyBkZXYgcG9pbnRlcikKPiBhbmQgMTEg
aW4gc3RyZWFtIChmZXcgb2YgdGhlbSB2YWxpZCAobm8gc3RyZWFtIHBvaW50ZXIpIGJ1dCByZXN0
IGNhbiBiZQo+IGNvbnZlcnRlZCB0byB1c2UgZGV2X2VyciEgRXZlbiB0aGVuIHRoZXkgcHJpbnQg
c3RyZWFtIG5hbWUsIHNvIGNoZWNraW5nCj4gZXJyb3IgaXMgbm90IGp1c3RpZmllZCBhcmd1bWVu
dCEKCnRoZSBzdHJlYW0gaGFzIG5vIG5vdGlvbiBvZiBkZXZpY2UsIGl0IGNhbiBiZSBtYWRlIG9m
IG11bHRpcGxlIGRldmljZXMsIApzbyB3aGljaCBvbmUgd291bGQgeW91IGNob29zZT8KCj4gCj4+
IFdlIGFyZSBhbHNvIGluIHRoZSBtaWRkbGUgb2YgaW50ZWdyYXRpb24gd2l0aCBuZXcgaGFyZHdh
cmUvYm9hcmRzLCBhbmQKPj4gZXJyaW5nIG9uIHRoZSBzaWRlIG9mIG1vcmUgdHJhY2VzIHdpbGwg
aGVscCBldmVyeW9uZSBpbnZvbHZlZC4gV2UgY2FuCj4+IHJldmlzaXQgbGF0ZXIgd2hpY2ggb25l
cyBhcmUgc3RyaWN0bHkgbmVjZXNzYXJ5Lgo+IAo+IE5hYWggeW91IGFyZSBoYXZpbmcgZHVwbGlj
YXRlIGxvZ3MsIGl0IGRvZXMgKm5vdCogaGVscCBpbiBkZWJ1ZyBzZWVtcwo+IDEwMDAgbGluZSBs
b2dzIGFuZCBmZXcgbGluZXMgY29udmV5aW5nIGR1cGxpY2F0ZSBpbmZvLCBJIHdvdWxkIHJhdGhl
cgo+IGhhdmUgZWFjaCBsaW5lIHVuaXF1ZSBzbyB0aGF0IEkgZG9udCBoYXZlIHRvIHNraXAgZHVw
bGljYXRlIG9uZXMgd2hpbGUKPiBkZWJ1Z2dpbmchCgpUaGV5IGFyZSBub3QgYWxsIGR1cGxpY2F0
ZXMuCgpBZ2FpbiwgaWYgSSByZW1vdmUgdGhlIGxvZ3MgaW4gc3RyZWFtLmMsIHRoZW4gSSBkbyBs
b3NlIHZhbHVhYmxlIAppbmZvcm1hdGlvbiBvbiBiYWQgc3RhdGUgbWFjaGluZXMgdHJhbnNpdGlv
bnMsIGV0Yy4gQW4gZXJyb3IgY29kZSBpcyBub3QgCmVub3VnaCB0byByZWNvbnN0cnVjdCB0aGUg
aXNzdWVzIGZyb20gaW50ZWwuYwoKSWYgSSByZW1vdmUgdGhlIGxvZ3MgaW4gaW50ZWwuYywgSSBj
YW4ndCBrbm93IHdoaWNoIGRhaSBoYWQgYW4gZXJyb3IgYW5kIAp3aGF0IGNhdXNlZCBpdC4KCnNl
cmlvdXNseSwgdGhlc2UgYXJlIGFsbCBkZXRhaWxzLCB5b3UgaGF2ZSBvdmVyIDUwIHBhdGNoZXMg
dG8gcmV2aWV3IAp3aXRoIGEgY29tcGxldGUgcmV3b3JrIG9mIHRoaXMgc3Vic3lzdGVtIGFuZCB3
ZSBhcmd1ZSBhYm91dCBkZXZfZXJyIAp2ZXJib3NpdHk/Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
