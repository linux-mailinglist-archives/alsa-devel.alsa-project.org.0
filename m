Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49176AE4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836762069;
	Fri, 26 Jul 2019 16:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836762069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564149741;
	bh=EiaHVmYV8/N4gxBdsAvFeUFu7tQGmJUvIU38NfL2CQ8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIZOoFdKA3fnIKyr2lLUKBBuB2mw4jz+VDtZyIIw5zA2i83f7s19ZilWbzMCs6lPV
	 I7zXAKwrfALW5m19aplzz7Sc4XnCznsPRGaOf9Io17XuPNodCekHG5f/HKEwFqAh5R
	 eFnw/SISpfXIq3eP2mjfqNXJ+uMbg58JkjsYUgJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED90F80368;
	Fri, 26 Jul 2019 16:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D64FF800BE; Fri, 26 Jul 2019 16:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08652F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08652F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322045973"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:00:28 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-5-pierre-louis.bossart@linux.intel.com>
 <9d5bc940-eadd-4f82-0bac-6a731369436d@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d231f6b0-555a-8c45-1a9a-215c73171923@linux.intel.com>
Date: Fri, 26 Jul 2019 09:00:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9d5bc940-eadd-4f82-0bac-6a731369436d@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 04/40] soundwire: intel: add debugfs
 register dump
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

CgpPbiA3LzI2LzE5IDQ6MzUgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjM5LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gK3N0YXRpYyB2b2lkIGlu
dGVsX2RlYnVnZnNfaW5pdChzdHJ1Y3Qgc2R3X2ludGVsICpzZHcpCj4+ICt7Cj4+ICvCoMKgwqAg
c3RydWN0IGRlbnRyeSAqcm9vdCA9IHNkdy0+Y2Rucy5idXMuZGVidWdmczsKPj4gKwo+PiArwqDC
oMKgIGlmICghcm9vdCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gKwo+PiArwqDCoMKg
IHNkdy0+ZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImludGVsLXNkdyIsIHJvb3QpOwo+PiArwqDC
oMKgIGlmIChJU19FUlJfT1JfTlVMTChzZHctPmZzKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2
X2VycihzZHctPmNkbnMuZGV2LCAiZGVidWdmcyByb290IGNyZWF0aW9uIGZhaWxlZFxuIik7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBzZHctPmZzID0gTlVMTDsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
bjsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJpbnRl
bC1yZWdpc3RlcnMiLCAwNDAwLCBzZHctPmZzLCBzZHcsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJmludGVsX3JlZ19mb3BzKTsKPj4gKwo+PiArwqDCoMKgIHNkd19jZG5zX2Rl
YnVnZnNfaW5pdCgmc2R3LT5jZG5zLCBzZHctPmZzKTsKPj4gK30KPiAKPiBJIGJlbGlldmUgdGhl
cmUgc2hvdWxkIGJlIGR1bW15IGVxdWl2YWxlbnQgb2YgX2luaXQgYW5kIF9leGl0IGlmIGRlYnVn
ZnMgCj4gaXMgbm90IGVuYWJsZWQgKGlmIHRoZXNlIGFyZSBkZWZpbmVkIGFscmVhZHkgYW5kIEkn
dmUgbWlzc2VkIGl0LCBwbGVhc2UgCj4gaWdub3JlKS4KCkkgdGhpbmsgdGhlIGRpcmVjdGlvbiBp
cyBqdXN0IHRvIGtlZXAgZ29pbmcgaWYgdGhlcmUgaXMgYW4gZXJyb3Igb3IgCmRlYnVmcyBpcyBu
b3QgZW5hYmxlZC4KCj4gCj4+ICtzdGF0aWMgdm9pZCBpbnRlbF9kZWJ1Z2ZzX2V4aXQoc3RydWN0
IHNkd19pbnRlbCAqc2R3KQo+PiArewo+PiArwqDCoMKgIGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2
ZShzZHctPmZzKTsKPj4gK30KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
