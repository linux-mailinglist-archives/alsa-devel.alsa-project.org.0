Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF3F83650
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 18:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C6A1667;
	Tue,  6 Aug 2019 18:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C6A1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565107692;
	bh=N56uqX55+NF9Wqnf4rxsuT3uGE4hr0er1D1bkN1voj4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVNs3LKE88Gl6Hg9nN5/+Y+lKM/n6P0FqOJgCLT4Zh+RFEpd11EU1/SfrSUKQhurz
	 q9CCPDGrEV0n3ibXcpCakxJvTD0bFxIEjsrIvID9wzJHBs/fOcGqluN4PyFIcYASi2
	 ElzSOrH2r72+W/XtyvivrLQD9e9cvOdfjbpzpeQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE440F80483;
	Tue,  6 Aug 2019 18:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB14AF80483; Tue,  6 Aug 2019 18:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6A8CF8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 18:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A8CF8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 09:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="174218905"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.113])
 ([10.252.15.113])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2019 09:06:16 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190806005522.22642-7-pierre-louis.bossart@linux.intel.com>
 <03b6091b-af41-ac54-43c7-196a3583a731@intel.com>
 <024b4fb4-bdfa-a6dc-48bb-c070f2ed36b2@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2445b5dc-246c-9c3b-b26e-784032feccf9@intel.com>
Date: Tue, 6 Aug 2019 18:06:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <024b4fb4-bdfa-a6dc-48bb-c070f2ed36b2@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Blauciak@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
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

T24gMjAxOS0wOC0wNiAxNzozNiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC82LzE5IDEwOjI3IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IE9uIDIwMTktMDgt
MDYgMDI6NTUsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc291bmR3aXJlL2NhZGVuY2VfbWFzdGVyLmMgCj4+PiBiL2RyaXZlcnMvc291bmR3aXJl
L2NhZGVuY2VfbWFzdGVyLmMKPj4+IGluZGV4IDVkOTcyOWI0ZDYzNC4uODljNTVlNGJiNzJjIDEw
MDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYwo+Pj4gKysr
IGIvZHJpdmVycy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYwo+Pj4gQEAgLTQ4LDYgKzQ4LDgg
QEAKPj4+IMKgICNkZWZpbmUgQ0ROU19NQ1BfU1NQU1RBVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHhDCj4+PiDCoCAjZGVmaW5lIENETlNfTUNQX0ZSQU1FX1NIQVBFwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAweDEwCj4+PiDCoCAjZGVmaW5lIENETlNfTUNQX0ZSQU1FX1NIQVBFX0lOSVTCoMKgwqDC
oMKgwqDCoCAweDE0Cj4+PiArI2RlZmluZSBDRE5TX01DUF9GUkFNRV9TSEFQRV9DT0xfTUFTS8Kg
wqDCoMKgwqDCoMKgIEdFTk1BU0soMiwgMCkKPj4+ICsjZGVmaW5lIENETlNfTUNQX0ZSQU1FX1NI
QVBFX1JPV19PRkZTRVTCoMKgwqDCoMKgwqDCoCAzCj4+PiDCoCAjZGVmaW5lIENETlNfTUNQX0NP
TkZJR19VUERBVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTgKPj4+IMKgICNkZWZpbmUgQ0RO
U19NQ1BfQ09ORklHX1VQREFURV9CSVTCoMKgwqDCoMKgwqDCoCBCSVQoMCkKPj4+IEBAIC0xNzUs
NyArMTc3LDYgQEAKPj4+IMKgIC8qIERyaXZlciBkZWZhdWx0cyAqLwo+Pj4gwqAgI2RlZmluZSBD
RE5TX0RFRkFVTFRfQ0xLX0RJVklERVLCoMKgwqDCoMKgwqDCoCAwCj4+PiAtI2RlZmluZSBDRE5T
X0RFRkFVTFRfRlJBTUVfU0hBUEXCoMKgwqDCoMKgwqDCoCAweDMwCj4+PiDCoCAjZGVmaW5lIENE
TlNfREVGQVVMVF9TU1BfSU5URVJWQUzCoMKgwqDCoMKgwqDCoCAweDE4Cj4+PiDCoCAjZGVmaW5l
IENETlNfVFhfVElNRU9VVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyMDAwCj4+PiBA
QCAtOTAxLDYgKzkwMiwyMCBAQCBpbnQgc2R3X2NkbnNfcGRpX2luaXQoc3RydWN0IHNkd19jZG5z
ICpjZG5zLAo+Pj4gwqAgfQo+Pj4gwqAgRVhQT1JUX1NZTUJPTChzZHdfY2Ruc19wZGlfaW5pdCk7
Cj4+PiArc3RhdGljIHUzMiBjZG5zX3NldF9pbml0aWFsX2ZyYW1lX3NoYXBlKGludCBuX3Jvd3Ms
IGludCBuX2NvbHMpCj4+PiArewo+Pj4gK8KgwqDCoCB1MzIgdmFsOwo+Pj4gK8KgwqDCoCBpbnQg
YzsKPj4+ICvCoMKgwqAgaW50IHI7Cj4+PiArCj4+PiArwqDCoMKgIHIgPSBzZHdfZmluZF9yb3df
aW5kZXgobl9yb3dzKTsKPj4+ICvCoMKgwqAgYyA9IHNkd19maW5kX2NvbF9pbmRleChuX2NvbHMp
ICYgQ0ROU19NQ1BfRlJBTUVfU0hBUEVfQ09MX01BU0s7Cj4+PiArCj4+PiArwqDCoMKgIHZhbCA9
IChyIDw8IENETlNfTUNQX0ZSQU1FX1NIQVBFX1JPV19PRkZTRVQpIHwgYzsKPj4+ICsKPj4+ICvC
oMKgwqAgcmV0dXJuIHZhbDsKPj4+ICt9Cj4+PiArCj4+Cj4+IEd1ZXNzIHRoaXMgaGF2ZSBiZWVu
IHNhaWQgYWxyZWFkeSwgYnV0IHRoaXMgZnVuY3Rpb24gY291bGQgYmUgCj4+IHNpbXBsaWZpZWQg
LSB1bmxlc3MgeW91IHJlYWxseSB3YW50IHRvIGtlZXAgZXhwbGljaXQgdmFyaWFibGUgCj4+IGRl
Y2xhcmF0aW9uLiBCb3RoICJjIiBhbmQgInIiIGRlY2xhcmF0aW9ucyBjb3VsZCBiZSBtZXJnZWQg
aW50byBzaW5nbGUgCj4+IGxpbmUgd2hpbGUgInZhbCIgaXMgbm90IG5lZWRlZCBhdCBhbGwuCj4+
Cj4+IE9uZSBtb3JlIHRoaW5nIC0gaXMgQU5EIGJpdHdpc2Ugb3AgcmVhbGx5IG5lZWRlZCBmb3Ig
Y29scyBleHBsaWNpdGx5PyAKPj4gV2Uga25vdyBhbGwgY29sIHZhbHVlcyB1cGZyb250IC0gdGhl
c2UgYXJlIHN0YXRpYyBhbmQgZGVjbGFyZWQgaW4gCj4+IGdsb2JhbCB0YWJsZSBuZWFyYnkuIFN0
YXRpYyBkZWNsYXJhdGlvbiB0YWtlcyBjYXJlIG9mICJpbml0aWFsIAo+PiByYW5nZS1jaGVjayIu
IElzIGFub3RoZXIgb25lIG5lY2Vzc2FyeT8KPj4KPj4gTW9yZW92ZXIsIHRoaXMgaXMgYSBfZ2V0
XyBhbmQgY2VydGFpbmx5IG5vdCBhIF9zZXRfIHR5cGUgb2YgZnVuY3Rpb24uIAo+PiBJJ2QgZXZl
biBjb25zaWRlciByZW5hbWluZyBpdCB0bzogImNkbnNfZ2V0X2ZyYW1lX3NoYXBlIiBhcyB0aGlz
IGlzIAo+PiBuZWl0aGVyIGEgX3NldF8gbm9yIGFuIGV4cGxpY2l0IGluaXRpYWwgZnJhbWUgc2hh
cGUgc2V0dGVyLgo+Pgo+PiBJdCBtaWdodCBiZSBldmVuIGhlbHBmdWwgdG8gc3BsaXQgdHdvIHVz
YWdlczoKPj4KPj4gI2RlZmluZSBzZHdfZnJhbWVfc2hhcGUoY29sX2lkeCwgcm93X2lkeCkgXAo+
PiDCoMKgwqDCoMKgKChyb3dfaWR4IDw8IENETlNfTUNQX0ZSQU1FX1NIQVBFX1JPV19PRkZTRVQp
IHwgY29sX2lkeCkKPj4KPj4gdTMyIGNkbnNfZ2V0X2ZyYW1lX3NoYXBlKHUxNiByb3dzLCB1MTYg
Y29scykKPj4gewo+PiDCoMKgwqDCoMKgdTE2IGMsIHI7Cj4+Cj4+IMKgwqDCoMKgwqByID0gc2R3
X2ZpbmRfcm93X2luZGV4KHJvd3MpOwo+PiDCoMKgwqDCoMKgYyA9IHNkd19maW5kX2NvbF9pbmRl
eChjb2xzKTsKPj4KPj4gwqDCoMKgwqDCoHJldHVybiBzZHdfZnJhbWVfc2hhcGUoYywgcik7Cj4+
IH0KPj4KPj4gVGhlIGFib3ZlIG1heSBldmVuIGJlIHNpbXBsaWZpZWQgaW50byBvbmUtbGluZXIu
Cj4gCj4gVGhpcyBpcyBhIGZ1bmN0aW9uIHVzZWQgb25jZSBvbiBzdGFydHVwLCB0aGVyZSBpcyBu
byByZWFsIG5lZWQgdG8gCj4gc2ltcGxpZnkgZnVydGhlci4gVGhlIHNlcGFyYXRlIHZhcmlhYmxl
cyBoZWxwIGFkZCBkZWJ1ZyB0cmFjZXMgYXMgbmVlZGVkIAo+IGFuZCBrZWVwIHRoZSBjb2RlIHJl
YWRhYmxlIHdoaWxlIHNob3dpbmcgaG93IHRoZSB2YWx1ZXMgYXJlIGVuY29kZWQgaW50byAKPiBh
IHJlZ2lzdGVyLgoKRWgsIEkndmUgdGhvdWdodCBpdCdzIGdvbm5hIGJlIGV4cG9zZWQgdG8gdXNl
cnNwYWNlICh2aWEgdWFwaSkgc28gaXQgY2FuIApiZSBmZXRjaGVkIGJ5IHRlc3RzIG9yIHRvb2xz
LgoKSW4gc3VjaCBjYXNlIC0gaWYgdGhlcmUgaXMgYSBzaW5nbGUgdXNhZ2Ugb25seSAtIGd1ZXNz
IGZ1bmN0aW9uIGlzIGZpbmUgCmFzIGlzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
