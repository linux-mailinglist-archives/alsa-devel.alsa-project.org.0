Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC53A1D8
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 22:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70F1D166B;
	Sat,  8 Jun 2019 22:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70F1D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560024395;
	bh=aD3rIFCR1LqdSfeb4OXphYbFAu5Y6tvGPauVij8FJb0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=va6gA+Nz7LWVBPoQtIBb8slUEIwKfZYkSw0TCbaPWDebdBjrs0SR3QkHNe7uKnzt8
	 oNcM5CyvZQkgs0UX0+I0nLy9GlfFaS9xUvG36YndreVa2AvmyxctnmA5YjuqJjf8Rd
	 Edp1PVzUcb1MX3zYtc5aQ30aveRGqglYBjxz9DwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4836F896F7;
	Sat,  8 Jun 2019 22:04:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06007F896F7; Sat,  8 Jun 2019 22:04:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 343C2F896CE
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 22:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 343C2F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jun 2019 13:04:37 -0700
X-ExtLoop1: 1
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.93.16])
 ([10.251.93.16])
 by orsmga006.jf.intel.com with ESMTP; 08 Jun 2019 13:04:33 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org,
 vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-4-srinivas.kandagatla@linaro.org>
 <a4b527af-c999-829d-c4a0-41f0a6775b65@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <641a22e7-6998-2a6a-bd90-ddf75d0cd9c8@intel.com>
Date: Sat, 8 Jun 2019 22:04:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a4b527af-c999-829d-c4a0-41f0a6775b65@linux.intel.com>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 3/6] soundwire: core: define
	SDW_MAX_PORT
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

Ck9uIDIwMTktMDYtMDcgMTQ6MzEsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+IE9uIDYv
Ny8xOSAzOjU2IEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGFk
ZHMgU0RXX01BWF9QT1JUIHNvIHRoYXQgb3RoZXIgZHJpdmVyIGNhbiB1c2UgaXQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGlu
YXJvLm9yZz4KPj4gLS0tCj4+IMKgIGluY2x1ZGUvbGludXgvc291bmR3aXJlL3Nkdy5oIHwgMSAr
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9zb3VuZHdpcmUvc2R3LmggCj4+IGIvaW5jbHVkZS9saW51eC9zb3VuZHdp
cmUvc2R3LmgKPj4gaW5kZXggYWFjNjhlODc5ZmFlLi44MGNhOTk3ZTRlNWQgMTAwNjQ0Cj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvc291bmR3aXJlL3Nkdy5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgv
c291bmR3aXJlL3Nkdy5oCj4+IEBAIC0zNiw2ICszNiw3IEBAIHN0cnVjdCBzZHdfc2xhdmU7Cj4+
IMKgICNkZWZpbmUgU0RXX0ZSQU1FX0NUUkxfQklUU8KgwqDCoMKgwqDCoMKgIDQ4Cj4+IMKgICNk
ZWZpbmUgU0RXX01BWF9ERVZJQ0VTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMQo+PiArI2RlZmlu
ZSBTRFdfTUFYX1BPUlRTwqDCoMKgIDE0Cj4gCj4gVGhhdCdzIGFuIGFtYmlndW91cyBkZWZpbml0
aW9uLgo+IFlvdSBjYW4gaGF2ZSAxNiBwb3J0cyBwZXIgdGhlIFNvdW5kV2lyZSBzcGVjLCBidXQg
RFAwIGlzIHJlc2VydmVkIGZvciAKPiBjb250cm9sIGFuZCBEUDE1IGlzIGFuIGFsaWFzIGZvciBh
bGwgcG9ydHMgKHNhbWUgaWRlYSBhcyBkZXZpY2UgMTUgZm9yIAo+IGJyb2FkY2FzdCBvcGVyYXRp
b25zIGJ1dCBsaW1pdGVkIHRvIGEgc2luZ2xlIGRldmljZSksIHdoaWNoIGxlYXZlcyAxNCAKPiBw
b3J0cyBmb3IgYXVkaW8gdXNhZ2VzLgo+IAo+IEluIHRoZSBNSVBJIHNwZWNzLCBzcGVjaWZpY2Fs
bHkgdGhlIERpc0NvIHBhcnQsIHRoZSBkaWZmZXJlbmNlIGlzIGNhbGxlZCAKPiBhYm91dCB3aXRo
IHRoZSB0aGUgRFAwIGFuZCBEUG4gbm90YXRpb25zLCBzbyB0aGlzIGNvdWxkIGJlIFNEV19NQVhf
RFBuLiAKPiBBbHRlcm5hdGl2ZWx5IHlvdSBjb3VsZCB1c2UgU0RXX01BWF9BVURJT19QT1JUUyB3
aGljaCBpcyBtb3JlIAo+IHNlbGYtZXhwbGFuYXRvcnkgYW5kIGRvZXMgbm90IHJlcXVpcmUgaW4t
ZGVwdGggZmFtaWxpYXJpdHkgd2l0aCB0aGUgc3BlYy4KPiAKClRoaXMgYW1iaWd1aXR5IHNwcmVh
ZHMgZXZlbiBmdXJ0aGVyLiBMb29rIGF0IHRoZSBuYW1lIG9mICNkZWZpbmUgYmVsb3cuCkRQMCBp
cyBieSBubyBtZWFucyBpbnZhbGlkLiBJdCdzIHNwZWNpZmljIGFuZCBoYXMgc29tZSBvcHRpb25h
bCAKcmVnaXN0ZXJzLCB5ZXMsIGJ1dCB0aGF0J3MgYmVjYXVzZSBvZiBpdHMgZW5nYWdlbWVudCBp
biBCUFQuCgpHaXZlbiB0aGUgZmFjdCBTRFcgZG9lcyBub3QgY2FyZSBhYm91dCB0eXBlIG9mIGRh
dGEgYmVpbmcgdHJhbnNwb3J0ZWQsIApldmVuICJBVURJTyIgc2VlbXMgbWlzbGVhZGluZyBoZXJl
LiBUaG91Z2ggaXQncyBzdGlsbCBiZXR0ZXIgdGhhbiBubyAKc3BlY2lmaWVyIGF0IGFsbC4KCj4+
IMKgICNkZWZpbmUgU0RXX1ZBTElEX1BPUlRfUkFOR0UobinCoMKgwqDCoMKgwqDCoCAoKG4pIDw9
IDE0ICYmIChuKSA+PSAxKQo+PiDCoCAjZGVmaW5lIFNEV19EQUlfSURfUkFOR0VfU1RBUlTCoMKg
wqDCoMKgwqDCoCAxMDAKPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
