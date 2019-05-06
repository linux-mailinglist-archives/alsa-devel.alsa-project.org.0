Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E67C4150B6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FD8F17B3;
	Mon,  6 May 2019 17:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FD8F17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557157967;
	bh=eT07ntW7Q11vkxHHK8kkh5rQwOz10Z8qRj1EnpdDDcU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kO3ktAfBOI1ltXYgXLE3rCAjXtKoKcxZjCIfY0PYru3AbMEMEmZisedO60n4hW0gY
	 Gy0YYcm3nxGEoyHRazJiS7CuD6Y78TMc7K+LPKmBPLp0WVK52TH9Dx5A40esFLqXsi
	 YOZMmtmxpw0tNroGvW8JdtX2AoUSEpOwdaicnR7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E2E8F89723;
	Mon,  6 May 2019 17:50:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00CC9F89705; Mon,  6 May 2019 17:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E41FEF80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E41FEF80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="322036050"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 06 May 2019 08:50:26 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 16A5B580238;
 Mon,  6 May 2019 08:50:26 -0700 (PDT)
To: Hans de Goede <hdegoede@redhat.com>, Nariman <narimantos@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20190504151652.5213-1-user@elitebook-localhost>
 <423c7b83-abd6-4f75-ad3a-7c650b76e8bb@linux.intel.com>
 <6b7111b1-2387-5366-3536-f369a9b0982a@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d9cb3ce3-d97b-a8ce-252f-c7d8455f5ae1@linux.intel.com>
Date: Mon, 6 May 2019 10:50:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6b7111b1-2387-5366-3536-f369a9b0982a@redhat.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, yang.jie@linux.intel.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_5640.c:Refactored if
 statement and removed buffer
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

T24gNS82LzE5IDEwOjQzIEFNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpIFBpZXJyZS1Mb3Vp
cywKPiAKPiBOYXJpbWFuIGFuZCB0aGUgYXV0aG9yIGF1dGhvcnMgb2YgdGhlc2UgcGF0Y2hlcyBh
cmUgYSBncm91cCBvZiBzdHVkZW50cyAKPiBkb2luZwo+IHNvbWUga2VybmVsIHdvcmsgZm9yIG1l
IGFuZCB0aGlzIGlzIGEgd2FybS11cCBhc3NpZ25tZW50IGZvciB0aGVtIHRvIGdldCAKPiB1c2Vk
Cj4gdG8gdGhlIGtlcm5lbCBkZXZlbG9wbWVudCBwcm9jZXNzLgo+IAo+IE9uIDA2LTA1LTE5IDE3
OjIxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4+IMKgIHN0YXRpYyBpbnQgYnl0
X3J0NTY0MF9zdXNwZW5kKHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQpCj4+PiBAQCAtMTI2OCwy
OCArMTI2NiwxMiBAQCBzdGF0aWMgaW50IHNuZF9ieXRfcnQ1NjQwX21jX3Byb2JlKHN0cnVjdCAK
Pj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+IMKgwqDCoMKgwqAgbG9nX3F1aXJrcygmcGRl
di0+ZGV2KTsKPj4+IMKgwqDCoMKgwqAgaWYgKChieXRfcnQ1NjQwX3F1aXJrICYgQllUX1JUNTY0
MF9TU1AyX0FJRjIpIHx8Cj4+PiAtwqDCoMKgwqDCoMKgwqAgKGJ5dF9ydDU2NDBfcXVpcmsgJiBC
WVRfUlQ1NjQwX1NTUDBfQUlGMikpIHsKPj4+IC0KPj4+IC3CoMKgwqDCoMKgwqDCoCAvKiBmaXh1
cCBjb2RlYyBhaWYgbmFtZSAqLwo+Pj4gLcKgwqDCoMKgwqDCoMKgIHNucHJpbnRmKGJ5dF9ydDU2
NDBfY29kZWNfYWlmX25hbWUsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoYnl0
X3J0NTY0MF9jb2RlY19haWZfbmFtZSksCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXMi
LCAicnQ1NjQwLWFpZjIiKTsKPj4+IC0KPj4+IC3CoMKgwqDCoMKgwqDCoCBieXRfcnQ1NjQwX2Rh
aXNbZGFpX2luZGV4XS5jb2RlY19kYWlfbmFtZSA9Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBieXRfcnQ1NjQwX2NvZGVjX2FpZl9uYW1lOwo+Pj4gLcKgwqDCoCB9Cj4+PiArwqDCoMKgwqDC
oMKgwqAgKGJ5dF9ydDU2NDBfcXVpcmsgJiBCWVRfUlQ1NjQwX1NTUDBfQUlGMikpCj4+PiArwqDC
oMKgwqDCoMKgwqAgYnl0X3J0NTY0MF9kYWlzW2RhaV9pbmRleF0uY29kZWNfZGFpX25hbWUgPSAi
cnQ1NjQwLWFpZjIiOwo+Pgo+PiBUaGlzIGlzIG5vdCBlcXVpdmFsZW50LCB5b3UgZG9uJ3QgZGVh
bCB3aXRoIHRoZSAoYnl0X3J0NTY0MF9xdWlyayAmIAo+PiBCWVRfUlQ1NjQwX1NTUDJfQUlGMikg
Y2FzZS4gVGhlIGRlZmF1bHQgaXMgU1NQX0FJRjEKPiAKPiBJIG1pZ2h0IGJlIG1pc3Rha2VuIGhl
cmUsIGJ1dCBsb29rIGNsb3NlciwgdGhlIG9yaWdpbmFsOgo+ICDCoMKgwqDCoGlmICgoYnl0X3J0
NTY0MF9xdWlyayAmIEJZVF9SVDU2NDBfU1NQMl9BSUYyKSB8fAo+IAo+IExpbmUgaXMga2VwdCwg
c28gdGhlIG5ldyBjb2RlIGJsb2NrIGlzOgo+IAo+ICDCoMKgwqDCoGlmICgoYnl0X3J0NTY0MF9x
dWlyayAmIEJZVF9SVDU2NDBfU1NQMl9BSUYyKSB8fAo+ICDCoMKgwqDCoMKgwqDCoCAoYnl0X3J0
NTY0MF9xdWlyayAmIEJZVF9SVDU2NDBfU1NQMF9BSUYyKSkKPiAgwqDCoMKgwqDCoMKgwqAgYnl0
X3J0NTY0MF9kYWlzW2RhaV9pbmRleF0uY29kZWNfZGFpX25hbWUgPSAicnQ1NjQwLWFpZjIiOwo+
IAo+IFdoaWNoIGRvZXMgdGFrZSB0aGUgQllUX1JUNTY0MF9TU1AyX0FJRjIgaW50byBhY2NvdW50
LgoKQWggeWVzLCBteSBtaXN0YWtlLiBMb29rcyBnb29kIHRoZW4uCgo+IAo+Pj4gwqDCoMKgwqDC
oCBpZiAoKGJ5dF9ydDU2NDBfcXVpcmsgJiBCWVRfUlQ1NjQwX1NTUDBfQUlGMSkgfHwKPj4+IC3C
oMKgwqDCoMKgwqDCoCAoYnl0X3J0NTY0MF9xdWlyayAmIEJZVF9SVDU2NDBfU1NQMF9BSUYyKSkg
ewo+Pj4gLQo+Pj4gLcKgwqDCoMKgwqDCoMKgIC8qIGZpeHVwIGNwdSBkYWkgbmFtZSBuYW1lICov
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgc25wcmludGYoYnl0X3J0NTY0MF9jcHVfZGFpX25hbWUsCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoYnl0X3J0NTY0MF9jcHVfZGFpX25hbWUp
LAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVzIiwgInNzcDAtcG9ydCIpOwo+Pj4gLQo+
Pj4gLcKgwqDCoMKgwqDCoMKgIGJ5dF9ydDU2NDBfZGFpc1tkYWlfaW5kZXhdLmNwdV9kYWlfbmFt
ZSA9Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBieXRfcnQ1NjQwX2NwdV9kYWlfbmFtZTsK
Pj4+IC3CoMKgwqAgfQo+Pj4gK8KgwqDCoMKgwqDCoMKgIChieXRfcnQ1NjQwX3F1aXJrICYgQllU
X1JUNTY0MF9TU1AwX0FJRjIpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJ5dF9ydDU2NDBfZGFpc1tk
YWlfaW5kZXhdLmNwdV9kYWlfbmFtZSA9ICJzc3AwLXBvcnQiOwo+Pgo+PiBTYW1lIGhlcmUsIHRo
aXMgaXMgbm90IGVxdWl2YWxlbnQuIHRoZSBTU1AwX0FJRjEgY2FzZSBpcyBub3QgaGFuZGxlZC4K
Pj4gaXQncyBmaW5lIHRvIHJlbW92ZSB0aGUgaW50ZXJtZWRpYXRlIGJ1ZmZlcnMsIGJ1dCB5b3Ug
Y2FuJ3QgcmVtb3ZlIAo+PiBzdXBwb3J0IGZvciAyIG91dCBvZiB0aGUgNCBjb21iaW5hdGlvbnMg
c3VwcG9ydGVkLgo+IAo+IFNhbWUgcmVtYXJrIGhlcmUgZnJvbSBtZSB0b28gOikKPiAKPiBSZWdh
cmRzLAo+IAo+IEhhbnMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
