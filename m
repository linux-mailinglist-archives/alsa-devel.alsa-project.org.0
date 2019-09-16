Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D8B401F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 20:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB911673;
	Mon, 16 Sep 2019 20:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB911673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568657769;
	bh=u0pfl4PUG/WwINj1dZEzl1v82h6Vk8BNk+ZmhPRtMc0=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acJkOYM8CTTurHWhVQqVIbSXpWDc+ydRQPjKoEorBEQ0jthDj0zehqN8nfomxmbbo
	 1cx/B8XtLskMjFGB/9O1M7V0pJFvx82a0y/XSSftDupKrc7CY6+cI1CnrTi87xDOE+
	 QqhswYPZ0VHgXZP8cC4iq0MltP+d7AqcIZFc2FjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C2BF80535;
	Mon, 16 Sep 2019 20:14:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42836F80506; Mon, 16 Sep 2019 20:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A088F801DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 20:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A088F801DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 11:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; d="scan'208";a="361605341"
Received: from jvhicko1-mobl2.amr.corp.intel.com (HELO [10.254.104.227])
 ([10.254.104.227])
 by orsmga005.jf.intel.com with ESMTP; 16 Sep 2019 11:14:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
References: <20190813213227.5163-1-pierre-louis.bossart@linux.intel.com>
 <20190813213227.5163-2-pierre-louis.bossart@linux.intel.com>
 <20190904071108.GI2672@vkoul-mobl>
 <dc16e4d8-1d95-542c-869e-bdefc37d059b@linux.intel.com>
Message-ID: <4734e29e-859d-745b-5cc6-ce70ca6e6c99@linux.intel.com>
Date: Mon, 16 Sep 2019 13:14:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dc16e4d8-1d95-542c-869e-bdefc37d059b@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/6] soundwire: fix startup sequence for
 Intel/Cadence
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

Cj4+PiBAQCAtMTA0Myw4ICsxMDQzLDYgQEAgc3RhdGljIGludCBpbnRlbF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlIAo+Pj4gKnBkZXYpCj4+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfaW5pdDsKPj4+IC3CoMKgwqAgcmV0ID0gc2R3X2Nk
bnNfZW5hYmxlX2ludGVycnVwdCgmc2R3LT5jZG5zKTsKPj4+IC0KPj4+IMKgwqDCoMKgwqAgLyog
UmVhZCB0aGUgUERJIGNvbmZpZyBhbmQgaW5pdGlhbGl6ZSBjYWRlbmNlIFBESSAqLwo+Pj4gwqDC
oMKgwqDCoCBpbnRlbF9wZGlfaW5pdChzZHcsICZjb25maWcpOwo+Pj4gwqDCoMKgwqDCoCByZXQg
PSBzZHdfY2Ruc19wZGlfaW5pdCgmc2R3LT5jZG5zLCBjb25maWcpOwo+Pj4gQEAgLTEwNjIsNiAr
MTA2MCwxOCBAQCBzdGF0aWMgaW50IGludGVsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
Cj4+PiAqcGRldikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9pbml0Owo+Pj4gwqDC
oMKgwqDCoCB9Cj4+PiArwqDCoMKgIHJldCA9IHNkd19jZG5zX2VuYWJsZV9pbnRlcnJ1cHQoJnNk
dy0+Y2Rucyk7Cj4+PiArwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycihzZHctPmNkbnMuZGV2LCAiY2Fubm90IGVuYWJsZSBpbnRlcnJ1cHRzXG4iKTsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9pbml0Owo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiAr
wqDCoMKgIHJldCA9IHNkd19jZG5zX2V4aXRfcmVzZXQoJnNkdy0+Y2Rucyk7Cj4+PiArwqDCoMKg
IGlmIChyZXQgPCAwKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihzZHctPmNkbnMuZGV2
LCAidW5hYmxlIHRvIGV4aXQgYnVzIHJlc2V0IHNlcXVlbmNlXG4iKTsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBnb3RvIGVycl9pbml0Owo+Pgo+PiBEb24ndCB5b3Ugd2FudCB0byBkaXNhYmxlIGludGVy
cnVwdHMgYXQgbGVhc3QuLi4gYmVmb3JlIHlvdSByZXR1cm4KPj4gZXJyb3I/IGVycl9pbml0IGRv
ZXMgYnVzIGNsZWFudXAgYW5kIG5vdCBjb250cm9sbGVyIG9uZQo+IAo+IHllcyBnb29kIHBvaW50
LCBsZXQgbWUgbG9vayBhdCB0aGlzLgoKVGhlIGV4aXN0aW5nIGNvZGUgaGFzIG5vIGludGVycnVw
dCBkaXNhYmxlIHNlcXVlbmNlLgoKSSB3aWxsIGFkZCB0aGlzIGltcHJvdmVkIGVycm9yIGhhbmRs
aW5nIGluIGEgZm9sbG93LXVwIHBhdGNoLCBhZnRlciB0aGUgCmNhcGFiaWxpdHkgdG8gZGlzYWJs
ZSBpbnRlcnJ1cHRzIGlzIGFkZGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
