Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47676AA0
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01DD2206D;
	Fri, 26 Jul 2019 15:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01DD2206D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564149610;
	bh=CLj5/w/5t/5DA7YiQsaIc85bzon/BEcEzPa1XZeQang=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P6RKj6D4GV4A4K6D1j68omXVsuYabvLX5GDsJ7gfXRCo+ZGlUBHV1DcRahADLxDE/
	 o3FbIXz9bUkqZB8OisQTNUKiYndMpEBla0jKfL1OAEOzfJ9+nlz5Lj/MQeszD6u3Ej
	 Doqy7Z8Zwc4rviMYzFHi5EXlDhZWNlnhd1hk9x3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71886F80368;
	Fri, 26 Jul 2019 15:58:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAAB3F803D5; Fri, 26 Jul 2019 15:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BDF5F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 15:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BDF5F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 06:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322045174"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 06:58:36 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-4-pierre-louis.bossart@linux.intel.com>
 <500e2f21-3ec9-342c-ab4d-e222d9adb42c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b557d2ac-2229-d24e-6d64-e426a2a96dfa@linux.intel.com>
Date: Fri, 26 Jul 2019 08:58:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <500e2f21-3ec9-342c-ab4d-e222d9adb42c@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 03/40] soundwire: cadence_master: align
 debugfs to 8 digits
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

CgpPbiA3LzI2LzE5IDQ6MzggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjM5LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gU1FVQVNITUUKPj4KPj4g
U2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgCj4+IDxwaWVycmUtbG91aXMuYm9z
c2FydEBsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3NvdW5kd2lyZS9jYWRl
bmNlX21hc3Rlci5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc291bmR3aXJlL2NhZGVu
Y2VfbWFzdGVyLmMgCj4+IGIvZHJpdmVycy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYwo+PiBp
bmRleCA5MWU4YmFjYjgzZTMuLjlmNjExYTFmZmYwYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9z
b3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYwo+PiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9jYWRl
bmNlX21hc3Rlci5jCj4+IEBAIC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIHNzaXplX3QgY2Ruc19z
cHJpbnRmKHN0cnVjdCBzZHdfY2RucyAqY2RucywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjaGFyICpidWYsIHNpemVfdCBwb3MsIHVuc2lnbmVkIGludCByZWcpCj4+IMKg
IHsKPj4gwqDCoMKgwqDCoCByZXR1cm4gc2NucHJpbnRmKGJ1ZiArIHBvcywgUkRfQlVGIC0gcG9z
LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlNHhcdCU0eFxuIiwgcmVnLCBjZG5zX3Jl
YWRsKGNkbnMsIHJlZykpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlNHhcdCU4eFxu
IiwgcmVnLCBjZG5zX3JlYWRsKGNkbnMsIHJlZykpOwo+PiDCoCB9Cj4+IMKgIHN0YXRpYyBzc2l6
ZV90IGNkbnNfcmVnX3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyICp1c2VyX2J1
ZiwKPj4KPiAKPiBTaG91bGQganVzdCBiZSBtZXJnZWQgdG9nZXRoZXIgd2l0aCB0aGUgaW50cm9k
dWNpbmcgY29tbWl0LiBHdWVzcyBpdCdzIAo+IHBvc3RlZCB1bmludGVudGlvbmFsbHkuCgpZZXAs
IEkgbWlzc2VkIHRoaXMsIHdpbGwgc3F1YXNoIGluIHRoZSB1cGRhdGVzIGFzIGludGVuZGVkLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
