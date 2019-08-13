Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D68BFA7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 19:31:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9CD1669;
	Tue, 13 Aug 2019 19:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9CD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565717517;
	bh=WjQQuiKIh7X97BnMx2btqUiZci68MrNxvFHxya0jLfg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clFTLEhUgWcVD9fTGkZYph4Yte1aH1MlmRRdajEHcVIeerQkAJ1hV1G8ae5NmTmar
	 jQvrNGwuFY3RSbUVuk8rsrAV5gFsEmO0oqti9T3a87OH9SqGhZFfjuzuHVe7kQ0aw+
	 wJdwuunbEWDPOq8ljXlVJyMQwLmk0jcehFkfswUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C5BEF80274;
	Tue, 13 Aug 2019 19:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A58F80273; Tue, 13 Aug 2019 19:30:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA96BF80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 19:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA96BF80120
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 10:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="177864759"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.1.240])
 ([10.252.1.240])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2019 10:29:52 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <95c517ab-7c63-5d13-a03a-1db01812bb69@intel.com>
 <71fb21d0-3083-e590-db83-dbe489a4357e@linaro.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <34a1a317-ac6b-bb1e-6b1b-08209f0d1923@intel.com>
Date: Tue, 13 Aug 2019 19:29:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <71fb21d0-3083-e590-db83-dbe489a4357e@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, spapothi@codeaurora.org
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

T24gMjAxOS0wOC0xMyAxODo1MiwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPiBUaGFua3Mg
Zm9yIHRoZSByZXZpZXcsCj4gCj4gT24gMTMvMDgvMjAxOSAxNzowMywgQ2V6YXJ5IFJvamV3c2tp
IHdyb3RlOgo+PiBPbiAyMDE5LTA4LTEzIDEwOjM1LCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3Rl
Ogo+Pj4gT24gcGxhdGZvcm1zIHdoaWNoIGhhdmUgc21hcnQgc3BlYWtlciBhbXBsaWZpZXJzIGNv
bm5lY3RlZCB2aWEKPj4+IHNvdW5kd2lyZSBhbmQgbW9kZWxlZCBhcyBhdXggZGV2aWNlcyBpbiBB
U29DLCBpbiBzdWNoIHVzZWNhc2VzIG1hY2hpbmUKPj4+IGRyaXZlciBzaG91bGQgYmUgYWJsZSB0
byBnZXQgc2R3IG1hc3RlciBzdHJlYW0gZnJvbSBkYWkgc28gdGhhdCBpdCBjYW4KPj4+IHVzZSB0
aGUgcnVudGltZSBzdHJlYW0gdG8gc2V0dXAgc2xhdmUgc3RyZWFtcy4KPj4+Cj4+PiBzb3VuZHdp
cmUgYWxyZWFkeSBhcyBhIHNldCBmdW5jdGlvbiwgZ2V0IGZ1bmN0aW9uIHdvdWxkIHByb3ZpZGUg
bW9yZQo+Pj4gZmxleGliaWxpdHkgdG8gYWJvdmUgY29uZmlndXJhdGlvbnMuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5h
cm8ub3JnPgo+Pj4gLS0tCgo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqc25kX3NvY19kYWlfZ2V0
X3Nkd19zdHJlYW0oc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgZGlyZWN0aW9uKQo+Pj4g
K3sKPj4+ICvCoMKgwqAgaWYgKGRhaS0+ZHJpdmVyLT5vcHMtPmdldF9zZHdfc3RyZWFtKQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBkYWktPmRyaXZlci0+b3BzLT5nZXRfc2R3X3N0cmVhbShk
YWksIGRpcmVjdGlvbik7Cj4+PiArwqDCoMKgIGVsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gRVJSX1BUUigtRU5PVFNVUFApOwo+Pj4gK30KPj4KPj4gRHJvcCByZWR1bmRhbnQgZWxzZS4K
PiBOb3QgYWxsIHRoZSBkYWkgZHJpdmVycyB3b3VsZCBpbXBsZW1lbnQgdGhpcyBmdW5jdGlvbiwg
SSBndWVzcyBlbHNlIGlzIAo+IG5vdCByZWR1bmRhbnQgaGVyZSEKPiAKPiAtLXNyaW5pCj4+CgpF
aC4gQnkgdGhhdCBJIG1lYW50IGRyb3BwaW5nICJlbHNlIiBrZXl3b3JkIGFuZCByZWR1Y2luZyBp
bmRlbnRhdGlvbiBmb3IgCiJyZXR1cm4gRVJSX1BUUigtRU5PVFNVUFApOyIKCkN6YXJlawpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
