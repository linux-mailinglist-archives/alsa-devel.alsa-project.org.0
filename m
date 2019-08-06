Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B429F8357F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48051852;
	Tue,  6 Aug 2019 17:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48051852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565106076;
	bh=l1LoMMLCpaMB1JnestJTfvQXQ3+2gOI1uxqhvXJN7IY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JCbBNWji91yctF5mIIWw4Kxq/rg1KcKW7+JdeuOy9tG9xUYg/VwEpgyS3g5pUZmUx
	 Z2y6qmbWD45dwfxB/NxMGLP0w3ltoiIPMxD+/tFWm6gb/IILPfXxOKj5U9kbS0Kf9n
	 vbyJbCxxgkEx9L2FvbOl5AixDRryuM9pdWubUpmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D8FF804CB;
	Tue,  6 Aug 2019 17:39:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7757CF80483; Tue,  6 Aug 2019 17:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85185F8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85185F8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="165019429"
Received: from tremilla-mobl1.amr.corp.intel.com (HELO [10.251.15.130])
 ([10.251.15.130])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2019 08:39:24 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190806005522.22642-10-pierre-louis.bossart@linux.intel.com>
 <a52b4fbd-1d97-d8b8-dd2c-fac30c6add4b@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <346425e0-0001-ecbc-c79a-c1372d0b4fcc@linux.intel.com>
Date: Tue, 6 Aug 2019 10:39:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a52b4fbd-1d97-d8b8-dd2c-fac30c6add4b@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Blauciak@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 09/17] soundwire: stream: remove
 unnecessary variable initializations
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

CgpPbiA4LzYvMTkgMTA6MzEgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTA2IDAyOjU1LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gQEAgLTE0OTMsNiArMTQ5
MywxMSBAQCBzdGF0aWMgaW50IF9zZHdfcHJlcGFyZV9zdHJlYW0oc3RydWN0IAo+PiBzZHdfc3Ry
ZWFtX3J1bnRpbWUgKnN0cmVhbSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDC
oCB9Cj4+ICvCoMKgwqAgaWYgKCFidXMpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHByX2VycigiQ29u
ZmlndXJhdGlvbiBlcnJvciBpbiAlc1xuIiwgX19mdW5jX18pOwo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FSU5WQUw7Cj4+ICvCoMKgwqAgfQo+PiArCj4gCj4gVGhpcyBzaG91bGQgcHJvYmFi
bHkgYmUgbG9jYXRlZCBpbiBzZXBhcmF0ZSBwYXRoIC0gbm90IGF0IGFsbCBhbiAKPiBpbml0aWFs
aXphdGlvbiByZW1vdmFsLgoKSXQncyBhIGNvbnNlcXVlbmNlIG9mIHRoZSBpbml0aWFsaXphdGlv
biByZW1vdmFsOiBiZWNhdXNlIHdlIGFyZSAKcmVtb3ZpbmcgdGhlIGRlZmF1bHQgaW5pdCwgdGhl
cmUgaXMgYSByaXNrIHRoYXQgdGhlIGxvb3AganVzdCBiZWZvcmUgZG8gCm5vdCBzZXQgaXQsIHNv
IGl0J3MgcmVxdWlyZWQgdG8gdHJhcCB0aGUgY2FzZSB3aGVyZSB0aGUgdmFyaWFibGUgaW4gbm90
IAppbml0aWFsaXplZC4KCj4gCj4+IEBAIC0xNTczLDYgKzE1NzgsMTEgQEAgc3RhdGljIGludCBf
c2R3X2VuYWJsZV9zdHJlYW0oc3RydWN0IAo+PiBzZHdfc3RyZWFtX3J1bnRpbWUgKnN0cmVhbSkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgaWYgKCFi
dXMpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHByX2VycigiQ29uZmlndXJhdGlvbiBlcnJvciBpbiAl
c1xuIiwgX19mdW5jX18pOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICvC
oMKgwqAgfQo+PiArCj4gCj4gU2FtZSBoZXJlLgoKc2FtZSByZXBseQoKPiAKPj4gQEAgLTE2Mzks
MTMgKzE2NTAsMTQgQEAgc3RhdGljIGludCBfc2R3X2Rpc2FibGVfc3RyZWFtKHN0cnVjdCAKPj4g
c2R3X3N0cmVhbV9ydW50aW1lICpzdHJlYW0pCj4+IMKgwqDCoMKgwqAgcmV0ID0gZG9fYmFua19z
d2l0Y2goc3RyZWFtKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkgewo+PiAtwqDCoMKgwqDC
oMKgwqAgZGV2X2VycihidXMtPmRldiwgIkJhbmsgc3dpdGNoIGZhaWxlZDogJWRcbiIsIHJldCk7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBwcl9lcnIoIkJhbmsgc3dpdGNoIGZhaWxlZDogJWRcbiIsIHJl
dCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoMKgwqDCoMKgIH0KPiAK
PiBIZXJlIHRvby4KCm5vLCBzYW1lIHRoaW5nLCB0aGUgYnVzIHZhcmlhYmxlIGlzIGluaXRpYWxp
emVkIGluIGxvb3BzIHNvIHRvb2xzIHdpbGwgCnJlcG9ydCBhIHBvc3NpYmxlIHBhdGggd2hlcmUg
YnVzLT5kZXYgaXMgYW4gaW52YWxpZCBkZXJlZmVyZW5jZS4KCj4gSSBtaWdodCBoYXZlIG1pc3Nl
ZCBzb21ldGhpbmcgdGhvdWdoIEkgYmV0IHlvdSBnb3QgbXkgcG9pbnQuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
