Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E276B5C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D6B2076;
	Fri, 26 Jul 2019 16:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D6B2076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564150785;
	bh=pRwZGigrXh88dJ7t/HIWm27YvKgCinPYdLE6LSXVddU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HIRJ0vG3TSc+2ygrQS5WvoO/U+TJr/K8JDgfAx3YTynfaYr6e23u9zghRt+JrBgWC
	 sfzgE9pPpRELkdiUGHO9ZmDftN6RjzPgTeCihCaqdGPiosPG4w3qR+b9GGdPoqr7ss
	 3Ii/sCfOY248x1potLy0DWj7/qB59+HPoYExQRek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAE4F800E8;
	Fri, 26 Jul 2019 16:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A5D7F80393; Fri, 26 Jul 2019 16:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD9CBF800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD9CBF800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322051074"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:17:52 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-24-pierre-louis.bossart@linux.intel.com>
 <492d7897-973d-f207-46d5-f2f554645df7@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <68948dd2-e131-7ef2-3067-ea5286e2f6d0@linux.intel.com>
Date: Fri, 26 Jul 2019 09:17:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <492d7897-973d-f207-46d5-f2f554645df7@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 23/40] soundwire: stream: fix disable
 sequence
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

CgpPbiA3LzI2LzE5IDU6MTQgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gLcKgwqDCoCByZXR1cm4g
ZG9fYmFua19zd2l0Y2goc3RyZWFtKTsKPj4gK8KgwqDCoCByZXQgPSBkb19iYW5rX3N3aXRjaChz
dHJlYW0pOwo+PiArwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZf
ZXJyKGJ1cy0+ZGV2LCAiQmFuayBzd2l0Y2ggZmFpbGVkOiAlZFxuIiwgcmV0KTsKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgLyogbWFr
ZSBzdXJlIGFsdGVybmF0ZSBiYW5rIChwcmV2aW91cyBjdXJyZW50KSBpcyBhbHNvIGRpc2FibGVk
ICovCj4+ICvCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShtX3J0LCAmc3RyZWFtLT5tYXN0ZXJf
bGlzdCwgc3RyZWFtX25vZGUpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGJ1cyA9IG1fcnQtPmJ1czsK
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIERpc2FibGUgcG9ydChzKSAqLwo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0ID0gc2R3X2VuYWJsZV9kaXNhYmxlX3BvcnRzKG1fcnQsIGZhbHNlKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9l
cnIoYnVzLT5kZXYsICJEaXNhYmxlIHBvcnQocykgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4g
K8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiDCoCAvKioKPj4K
PiAKPiBXaGlsZSBub3QgZGlyZWN0bHkgY29ubmVjdGVkIHRvIHRoaXMgY29tbWl0LCBJIHNlZSB0
aGF0IHlvdSBkbzoKPiBsaW5rX2Zvcl9lYWNoX2VudHJ5KG1fcnQsICZzdHJlYW0tPm1hc3Rlcl9s
aXN0LCBzdHJlYW1fbm9kZSkKPiAKPiBxdWl0ZSBvZnRlbiBpbiAvc3RyZWFtLmMgY29kZS4gSGVs
cGZ1bCBtYWNybyB3b3VsZCBwcm92ZSB1c2VmdWwuCgpZZXMsIGJ1dCB0aGUgZmxpcCBzaWRlIGlz
IHRoYXQgcGVvcGxlIG5lZWQgdG8gbG9vayBhdCB3aGF0IHRoZSBtYWNybyAKZG9lcyB0byBmaWd1
cmUgaXQgb3V0LCB3aGlsZSBldmVyeW9uZSBrbm93cyB3aGF0IGxpc3RfZm9yX2VhY2hfZW50cnko
KSAKbWVhbnMuIE5vdCBzdXJlIGFib3V0IHRoaXMgb25lLgpBbmQgb24gdG9wIG9mIHRoaXMgd2Un
bGwgcHJvYmFibHkgaGF2ZSB0byByZXdvcmsgdGhpcyBjb2RlIHRvIGhhdmUgYSAKYmFja2dyb3Vu
ZCBjb3B5IG9mIHRoZSBjdXJyZW50IGJhbmsgaW4gdGhlIGFsdGVybmF0ZSBiYW5rIHNvIGl0J2Qg
cmF0aGVyIApsZWF2ZSBpdCBzaW1wbGUgZm9yIG5vdy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
