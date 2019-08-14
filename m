Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1FE8D58E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 16:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5311660;
	Wed, 14 Aug 2019 16:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5311660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565791519;
	bh=r5j1wcpU+GAriDYO928DyhCL/jtT3G0S2d5tetuAaY0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXuUlCKLe+fBjMq4H1CxHorwu88fA2WhJLG84XxV1i0roWshigdU4cQfgXE3t1oM8
	 q9heBR2A7l72DjeeO2zS/dc0DvSCxuOVs+Sp6HVnfw3A4bCBIWFWEYYXaB4Og8O5ST
	 SkPwK6jM/e2keVbTCuk3SXGspJqlkZcfsnO4+fPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AC30F803F4;
	Wed, 14 Aug 2019 16:03:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AC36F80446; Wed, 14 Aug 2019 16:03:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE427F80214
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 16:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE427F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 07:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,385,1559545200"; d="scan'208";a="376051764"
Received: from dthummal-mobl.amr.corp.intel.com (HELO [10.254.111.70])
 ([10.254.111.70])
 by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2019 07:03:46 -0700
To: Vinod Koul <vkoul@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190806005522.22642-7-pierre-louis.bossart@linux.intel.com>
 <03b6091b-af41-ac54-43c7-196a3583a731@intel.com>
 <024b4fb4-bdfa-a6dc-48bb-c070f2ed36b2@linux.intel.com>
 <2445b5dc-246c-9c3b-b26e-784032feccf9@intel.com>
 <20190814043139.GV12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0e40ecee-d081-3cee-3e95-cd3c0f3e5b30@linux.intel.com>
Date: Wed, 14 Aug 2019 09:03:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814043139.GV12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Blauciak@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 06/17] soundwire: cadence_master: use
 firmware defaults for frame shape
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

Cj4+Pj4+ICtzdGF0aWMgdTMyIGNkbnNfc2V0X2luaXRpYWxfZnJhbWVfc2hhcGUoaW50IG5fcm93
cywgaW50IG5fY29scykKPj4+Pj4gK3sKPj4+Pj4gK8KgwqDCoCB1MzIgdmFsOwo+Pj4+PiArwqDC
oMKgIGludCBjOwo+Pj4+PiArwqDCoMKgIGludCByOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgciA9
IHNkd19maW5kX3Jvd19pbmRleChuX3Jvd3MpOwo+Pj4+PiArwqDCoMKgIGMgPSBzZHdfZmluZF9j
b2xfaW5kZXgobl9jb2xzKSAmIENETlNfTUNQX0ZSQU1FX1NIQVBFX0NPTF9NQVNLOwo+Pj4+PiAr
Cj4+Pj4+ICvCoMKgwqAgdmFsID0gKHIgPDwgQ0ROU19NQ1BfRlJBTUVfU0hBUEVfUk9XX09GRlNF
VCkgfCBjOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgcmV0dXJuIHZhbDsKPj4+Pj4gK30KPj4+Pj4g
Kwo+Pj4+Cj4+Pj4gR3Vlc3MgdGhpcyBoYXZlIGJlZW4gc2FpZCBhbHJlYWR5LCBidXQgdGhpcyBm
dW5jdGlvbiBjb3VsZCBiZQo+Pj4+IHNpbXBsaWZpZWQgLSB1bmxlc3MgeW91IHJlYWxseSB3YW50
IHRvIGtlZXAgZXhwbGljaXQgdmFyaWFibGUKPj4+PiBkZWNsYXJhdGlvbi4gQm90aCAiYyIgYW5k
ICJyIiBkZWNsYXJhdGlvbnMgY291bGQgYmUgbWVyZ2VkIGludG8KPj4+PiBzaW5nbGUgbGluZSB3
aGlsZSAidmFsIiBpcyBub3QgbmVlZGVkIGF0IGFsbC4KPj4+Pgo+Pj4+IE9uZSBtb3JlIHRoaW5n
IC0gaXMgQU5EIGJpdHdpc2Ugb3AgcmVhbGx5IG5lZWRlZCBmb3IgY29scwo+Pj4+IGV4cGxpY2l0
bHk/IFdlIGtub3cgYWxsIGNvbCB2YWx1ZXMgdXBmcm9udCAtIHRoZXNlIGFyZSBzdGF0aWMgYW5k
Cj4+Pj4gZGVjbGFyZWQgaW4gZ2xvYmFsIHRhYmxlIG5lYXJieS4gU3RhdGljIGRlY2xhcmF0aW9u
IHRha2VzIGNhcmUgb2YKPj4+PiAiaW5pdGlhbCByYW5nZS1jaGVjayIuIElzIGFub3RoZXIgb25l
IG5lY2Vzc2FyeT8KPj4+Pgo+Pj4+IE1vcmVvdmVyLCB0aGlzIGlzIGEgX2dldF8gYW5kIGNlcnRh
aW5seSBub3QgYSBfc2V0XyB0eXBlIG9mCj4+Pj4gZnVuY3Rpb24uIEknZCBldmVuIGNvbnNpZGVy
IHJlbmFtaW5nIGl0IHRvOiAiY2Ruc19nZXRfZnJhbWVfc2hhcGUiCj4+Pj4gYXMgdGhpcyBpcyBu
ZWl0aGVyIGEgX3NldF8gbm9yIGFuIGV4cGxpY2l0IGluaXRpYWwgZnJhbWUgc2hhcGUKPj4+PiBz
ZXR0ZXIuCj4+Pj4KPj4+PiBJdCBtaWdodCBiZSBldmVuIGhlbHBmdWwgdG8gc3BsaXQgdHdvIHVz
YWdlczoKPj4+Pgo+Pj4+ICNkZWZpbmUgc2R3X2ZyYW1lX3NoYXBlKGNvbF9pZHgsIHJvd19pZHgp
IFwKPj4+PiAgwqDCoMKgwqDCoCgocm93X2lkeCA8PCBDRE5TX01DUF9GUkFNRV9TSEFQRV9ST1df
T0ZGU0VUKSB8IGNvbF9pZHgpCj4+Pj4KPj4+PiB1MzIgY2Ruc19nZXRfZnJhbWVfc2hhcGUodTE2
IHJvd3MsIHUxNiBjb2xzKQo+Pj4+IHsKPj4+PiAgwqDCoMKgwqDCoHUxNiBjLCByOwo+Pj4+Cj4+
Pj4gIMKgwqDCoMKgwqByID0gc2R3X2ZpbmRfcm93X2luZGV4KHJvd3MpOwo+Pj4+ICDCoMKgwqDC
oMKgYyA9IHNkd19maW5kX2NvbF9pbmRleChjb2xzKTsKPj4+Pgo+Pj4+ICDCoMKgwqDCoMKgcmV0
dXJuIHNkd19mcmFtZV9zaGFwZShjLCByKTsKPj4+PiB9Cj4+Pj4KPj4+PiBUaGUgYWJvdmUgbWF5
IGV2ZW4gYmUgc2ltcGxpZmllZCBpbnRvIG9uZS1saW5lci4KPj4+Cj4+PiBUaGlzIGlzIGEgZnVu
Y3Rpb24gdXNlZCBvbmNlIG9uIHN0YXJ0dXAsIHRoZXJlIGlzIG5vIHJlYWwgbmVlZCB0bwo+Pj4g
c2ltcGxpZnkgZnVydGhlci4gVGhlIHNlcGFyYXRlIHZhcmlhYmxlcyBoZWxwIGFkZCBkZWJ1ZyB0
cmFjZXMgYXMgbmVlZGVkCj4+PiBhbmQga2VlcCB0aGUgY29kZSByZWFkYWJsZSB3aGlsZSBzaG93
aW5nIGhvdyB0aGUgdmFsdWVzIGFyZSBlbmNvZGVkIGludG8KPj4+IGEgcmVnaXN0ZXIuCj4+Cj4+
IEVoLCBJJ3ZlIHRob3VnaHQgaXQncyBnb25uYSBiZSBleHBvc2VkIHRvIHVzZXJzcGFjZSAodmlh
IHVhcGkpIHNvIGl0IGNhbiBiZQo+PiBmZXRjaGVkIGJ5IHRlc3RzIG9yIHRvb2xzLgo+IAo+IFVh
cGk/IEkgZG9udCBzZWUgYW55dGhpbmcgaW4gdGhpcyBvciBvdGhlciBzZXJpZXMgcG9zdGVkLCBk
aWQgSSBtaXNzCj4gc29tZXRoaW5nPyBBbHNvIEkgYW0gbm90IHN1cmUgSSBsaWtlIHRoZSBpZGVh
IG9mIGV4cG9zaW5nIHRoZXNlIHRvCj4gdXNlcmxhbmQhCgpWaW5vZCwgdGhhdCB3YXMgbmV2ZXIg
dGhlIGludGVudCwgYW5kIENlemFyeSBhZ3JlZWQsIHNlZSBmb2xsb3dpbmcgbGluZQoKPiAKPj4K
Pj4gSW4gc3VjaCBjYXNlIC0gaWYgdGhlcmUgaXMgYSBzaW5nbGUgdXNhZ2Ugb25seSAtIGd1ZXNz
IGZ1bmN0aW9uIGlzIGZpbmUgYXMKPj4gaXMuCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
