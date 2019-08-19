Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5F94F7B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 22:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 628BA166E;
	Mon, 19 Aug 2019 22:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 628BA166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566248390;
	bh=1IOXJGiIVIpgr9zNKVqfwZ5b7XEPePhJ2Skuy8C73Jo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jCaOoetUQtEJLDZ7NQhg92gF8TP7vWbvF1aJ+LpEcfmzzNS7SSe6riJTY2f/miWcE
	 AIufLyIQWeBtycXGNqJSOaS7Tv6lH+/mrLr0PR9BsqXntrnSRp9/XfNITQrWUr79U7
	 cp4pwLZkCGR2zXcFWO+AdA+bCMVmRHoOF5t2CALI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4BB6F802E0;
	Mon, 19 Aug 2019 22:58:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FB9CF802BE; Mon, 19 Aug 2019 22:58:03 +0200 (CEST)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1B99F802BE
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 22:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B99F802BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 13:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,406,1559545200"; d="scan'208";a="179532720"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 19 Aug 2019 13:47:58 -0700
Received: from rpwillin-mobl.amr.corp.intel.com (unknown [10.251.25.30])
 by linux.intel.com (Postfix) with ESMTP id 10D2F5803FA;
 Mon, 19 Aug 2019 13:47:57 -0700 (PDT)
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-3-pierre-louis.bossart@linux.intel.com>
 <c8c78674-7af8-4577-9e18-da85c064b345@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4fe0c027-9c6c-1e76-5fb0-7325fbab48a2@linux.intel.com>
Date: Mon, 19 Aug 2019 10:21:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c8c78674-7af8-4577-9e18-da85c064b345@intel.com>
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

T24gOC8xNy8xOSAxMDoyMSBBTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+IE9uIDIwMTktMDgt
MTUgMTc6NDQsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+PiBGcm9tOiBEYW5pZWwgQmFs
dXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Cj4+Cj4+IEFkZCBzdXBwb3J0IGZvciB0aGUgYXVk
aW8gRFNQIGhhcmR3YXJlIGZvdW5kIG9uIE5YUCBpLk1YOCBwbGF0Zm9ybS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCAKPj4gPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxp
bnV4LmludGVsLmNvbT4KPj4gK3N0YXRpYyB2b2lkIGlteDhfZ2V0X3JlcGx5KHN0cnVjdCBzbmRf
c29mX2RldiAqc2RldikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qgc25kX3NvZl9pcGNfbXNnICpt
c2cgPSBzZGV2LT5tc2c7Cj4+ICvCoMKgwqAgc3RydWN0IHNvZl9pcGNfcmVwbHkgcmVwbHk7Cj4+
ICvCoMKgwqAgaW50IHJldCA9IDA7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIW1zZykgewo+PiArwqDC
oMKgwqDCoMKgwqAgZGV2X3dhcm4oc2Rldi0+ZGV2LCAidW5leHBlY3RlZCBpcGMgaW50ZXJydXB0
XG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8Kg
wqDCoCAvKiBnZXQgcmVwbHkgKi8KPj4gK8KgwqDCoCBzb2ZfbWFpbGJveF9yZWFkKHNkZXYsIHNk
ZXYtPmhvc3RfYm94Lm9mZnNldCwgJnJlcGx5LCAKPj4gc2l6ZW9mKHJlcGx5KSk7Cj4+ICsKPj4g
K8KgwqDCoCBpZiAocmVwbHkuZXJyb3IgPCAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBtZW1jcHko
bXNnLT5yZXBseV9kYXRhLCAmcmVwbHksIHNpemVvZihyZXBseSkpOwo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0ID0gcmVwbHkuZXJyb3I7Cj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKgwqDC
oMKgIC8qIHJlcGx5IGhhcyBjb3JyZWN0IHNpemU/ICovCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
cmVwbHkuaGRyLnNpemUgIT0gbXNnLT5yZXBseV9zaXplKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldl9lcnIoc2Rldi0+ZGV2LCAiZXJyb3I6IHJlcGx5IGV4cGVjdGVkICV6dSBnb3Qg
JXUgCj4+IGJ5dGVzXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1zZy0+
cmVwbHlfc2l6ZSwgcmVwbHkuaGRyLnNpemUpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXQgPSAtRUlOVkFMOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqDCoMKgwqDC
oCAvKiByZWFkIHRoZSBtZXNzYWdlICovCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobXNnLT5yZXBs
eV9zaXplID4gMCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc29mX21haWxib3hfcmVhZChz
ZGV2LCBzZGV2LT5ob3N0X2JveC5vZmZzZXQsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG1zZy0+cmVwbHlfZGF0YSwgbXNnLT5yZXBseV9zaXplKTsKPj4gK8Kg
wqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBtc2ctPnJlcGx5X2Vycm9yID0gcmV0Owo+PiArfQo+IAo+
IEFzc3VtaW5nIHJlcGx5Lmhkci5zaXplIGlzIGNvbWluZyBmcm9tIEhXIElQQyByZWdzLCBtc2cg
b2JqZWN0IGlzIAo+IHJlcHJlc2VudGluZyBhcHBsaWNhdGlvbiBzaWRlIC0gU1csIGtlcm5lbC4g
SWYgc28sIGlzIG1zZy0+cmVwbHlfc2l6ZSAKPiB2YWx1ZSBhbiBlc3RpbWF0ZWQgc2l6ZSAod2hp
Y2ggY2FuIGJlIG92ZXJlc3RpbWF0ZWQgc2luY2UgZXhhY3Qgc2l6ZSBtYXkgCj4gYmUgdW5rbm93
biBieSB0aGUgaG9zdCkgLW9yLSB0aGUgZXhhY3Qgc2l6ZSBvZiBpbmNvbWluZyBJUEMgcmVwbHk/
Cj4gCj4gVGhlIGVzdGltYXRlZC1jYXNlIGlzIHVzdWFsbHkgcGVybWlzc2l2ZSBhcyBsb25nIGFz
IGFzc3VtZWQgc2l6ZSBpcyA+PSAKPiByZXBseS5oZHIuc2l6ZSAtIGRldl9lcnIgbmVlZGVkLiBJ
biB0aGUgZXhhY3QtY2FzZSwgaXQgc2hvdWxkIGJlIHZpZXdlZCAKPiBhcyBhIHJlcXVpcmVtZW50
LiBJZiBzdWNoICJyZXF1aXJlbWVudCIgZmFpbHMsIGlzIGl0IHZhbGlkIHRvIHJlYWQgCj4gbWFp
bGJveCByZWdhcmRsZXNzPyBJcyB0aGlzIHRvIGV4dHJhY3Qgc29tZSBlcnJvci1kZWJ1ZyBwYXls
b2FkIHNlbnQgYnkgRlc/Cj4gCj4gSnVzdCBjdXJpb3VzLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGNv
cnJlY3QgbWUgaGVyZSwgUGllcnJlLgoKSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSBxdWVz
dGlvbi4gVGhlcmUgaXMgbm8gdXNlIG9mIEhXIElQQyAKcmVnaXN0ZXJzIChhcyBkb25lIGluIFNL
TCkgc2luY2UgdGhpcyBpcyBub3QgcG9ydGFibGUgYWNyb3NzIGhhcmR3YXJlLiAKVGhlcmUgKm1h
eSogYmUgaW5mb3JtYXRpb24gc2VudCBvdmVyIElQQyByZWdpc3RlcnMgYnV0IHRoYXQgd291bGQg
aGF2ZSAKdG8gYmUgZG9uZSBpbiBwbGF0Zm9ybS1zcGVjaWZpYyB3YXlzIC0gYXMgd2lsbCBiZSBk
b25lIGZvciBJbnRlbCB0byBlLmcuIAphdm9pZCB1c2luZyBtZW1vcnkgd2luZG93cyB0aGF0IG1h
eSBub3QgYmUgcG93ZXJlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
