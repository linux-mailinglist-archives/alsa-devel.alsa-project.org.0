Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132B76B94
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2B4B206E;
	Fri, 26 Jul 2019 16:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2B4B206E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564151205;
	bh=lH//aek6zYVGDimsc8G5p0/CtcGqE1Ag5n272eYyO2s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r+6er0di8KztW5P9FrDzD3Q1VvMtum/GNrz0ZZrdSYSA1CNUVbnuVnRkw+vT0Lbn+
	 TaUjQBl1po3J5kNfDvif72LTosnXba1JSEKCj9MmLj+yD6RNAmTqx64ykWiniMk27G
	 VsBF+rJsToZCMX50N4kcShLOmtVOz/gnSM6lntNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 226BDF80368;
	Fri, 26 Jul 2019 16:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59E75F80393; Fri, 26 Jul 2019 16:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F455F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F455F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322052065"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:24:51 -0700
To: Bard liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
 <f38a5e3a-c797-ae53-f0d4-31ac46ec360b@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <616012b9-d4a2-b980-68e6-d9ba7e6d819b@linux.intel.com>
Date: Fri, 26 Jul 2019 09:24:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f38a5e3a-c797-ae53-f0d4-31ac46ec360b@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 26/40] soundwire: cadence_master: fix
 divider setting in clock register
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

CgpPbiA3LzI2LzE5IDEyOjE5IEFNLCBCYXJkIGxpYW8gd3JvdGU6Cj4gCj4gT24gNy8yNi8yMDE5
IDc6NDAgQU0sIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+PiBGcm9tOiBSYW5kZXIgV2Fu
ZyA8cmFuZGVyLndhbmdAbGludXguaW50ZWwuY29tPgo+Pgo+PiBUaGUgZXhpc3RpbmcgY29kZSB1
c2VzIGFuIE9SIG9wZXJhdGlvbiB3aGljaCB3b3VsZCBtaXggdGhlIG9yaWdpbmFsCj4+IGRpdmlk
ZXIgc2V0dGluZyB3aXRoIHRoZSBuZXcgb25lLCByZXN1bHRpbmcgaW4gYW4gaW52YWxpZAo+PiBj
b25maWd1cmF0aW9uIHRoYXQgY2FuIG1ha2UgY29kZWNzIGhhbmcuCj4+Cj4+IEFkZCB0aGUgbWFz
ayBkZWZpbml0aW9uIGFuZCB1c2UgY2Ruc191cGRhdGVsIHRvIHVwZGF0ZSBkaXZpZGVyCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJhbmRlciBXYW5nIDxyYW5kZXIud2FuZ0BsaW51eC5pbnRlbC5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IAo+PiA8cGllcnJlLWxvdWlz
LmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9zb3VuZHdpcmUv
Y2FkZW5jZV9tYXN0ZXIuYyB8IDEyICsrKysrKystLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYyAKPj4gYi9kcml2ZXJzL3NvdW5kd2lyZS9jYWRl
bmNlX21hc3Rlci5jCj4+IGluZGV4IDEwZWJjZWYyZTg0ZS4uMThjNmFjMDI2ZTg1IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rlci5jCj4+ICsrKyBiL2RyaXZl
cnMvc291bmR3aXJlL2NhZGVuY2VfbWFzdGVyLmMKPj4gQEAgLTU3LDYgKzU3LDcgQEAKPj4gwqAg
I2RlZmluZSBDRE5TX01DUF9TU1BfQ1RSTDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MjgKPj4g
wqAgI2RlZmluZSBDRE5TX01DUF9DTEtfQ1RSTDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MzAK
Pj4gwqAgI2RlZmluZSBDRE5TX01DUF9DTEtfQ1RSTDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4
MzgKPj4gKyNkZWZpbmUgQ0ROU19NQ1BfQ0xLX01DTEtEX01BU0vCoMKgwqDCoMKgwqDCoCBHRU5N
QVNLKDcsIDApCj4+IMKgICNkZWZpbmUgQ0ROU19NQ1BfU1RBVMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAweDQwCj4+IEBAIC05ODgsOSArOTg5LDExIEBAIGludCBzZHdfY2Ruc19pbml0
KHN0cnVjdCBzZHdfY2RucyAqY2RucykKPj4gwqDCoMKgwqDCoCAvKiBTZXQgY2xvY2sgZGl2aWRl
ciAqLwo+PiDCoMKgwqDCoMKgIGRpdmlkZXLCoMKgwqAgPSAocHJvcC0+bWNsa19mcmVxIC8gcHJv
cC0+bWF4X2Nsa19mcmVxKSAtIDE7Cj4+IMKgwqDCoMKgwqAgdmFsID0gY2Ruc19yZWFkbChjZG5z
LCBDRE5TX01DUF9DTEtfQ1RSTDApOwo+IAo+IAo+IERvIHdlIHN0aWxsIG5lZWQgdG8gcmVhZCBj
ZG5zX3JlYWRsKGNkbnMsIENETlNfTUNQX0NMS19DVFJMMCkKPiAKPiBhZnRlciB0aGlzIGNoYW5n
ZT8KCm5vIEkgZG9uJ3QgdGhpbmsgd2UgZG8gaW5kZWVkLgo+IAo+IAo+PiAtwqDCoMKgIHZhbCB8
PSBkaXZpZGVyOwo+PiAtwqDCoMKgIGNkbnNfd3JpdGVsKGNkbnMsIENETlNfTUNQX0NMS19DVFJM
MCwgdmFsKTsKPj4gLcKgwqDCoCBjZG5zX3dyaXRlbChjZG5zLCBDRE5TX01DUF9DTEtfQ1RSTDEs
IHZhbCk7Cj4+ICsKPj4gK8KgwqDCoCBjZG5zX3VwZGF0ZWwoY2RucywgQ0ROU19NQ1BfQ0xLX0NU
UkwwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIENETlNfTUNQX0NMS19NQ0xLRF9NQVNL
LCBkaXZpZGVyKTsKPj4gK8KgwqDCoCBjZG5zX3VwZGF0ZWwoY2RucywgQ0ROU19NQ1BfQ0xLX0NU
UkwxLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIENETlNfTUNQX0NMS19NQ0xLRF9NQVNL
LCBkaXZpZGVyKTsKPj4gwqDCoMKgwqDCoCBwcl9lcnIoInBsYjogbWNsayAlZCBtYXhfZnJlcSAl
ZCBkaXZpZGVyICVkIHJlZ2lzdGVyICV4XG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cHJvcC0+bWNsa19mcmVxLAoKYW5kIHRoaXMgbG9nIG5lZWRzIHRvIGdvIGF3YXkgb3IgZG9uZSBp
biBhIGJldHRlciB3YXksIEkgbWlzc2VkIHRoaXMuCgo+PiBAQCAtMTA2NCw4ICsxMDY3LDcgQEAg
aW50IGNkbnNfYnVzX2NvbmYoc3RydWN0IHNkd19idXMgKmJ1cywgc3RydWN0IAo+PiBzZHdfYnVz
X3BhcmFtcyAqcGFyYW1zKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWNwX2Nsa2N0cmxfb2ZmID0g
Q0ROU19NQ1BfQ0xLX0NUUkwwOwo+PiDCoMKgwqDCoMKgIG1jcF9jbGtjdHJsID0gY2Ruc19yZWFk
bChjZG5zLCBtY3BfY2xrY3RybF9vZmYpOwo+IAo+IAo+IFNhbWUgaGVyZS4KCnllcC4KCj4gCj4g
Cj4+IC3CoMKgwqAgbWNwX2Nsa2N0cmwgfD0gZGl2aWRlcjsKPj4gLcKgwqDCoCBjZG5zX3dyaXRl
bChjZG5zLCBtY3BfY2xrY3RybF9vZmYsIG1jcF9jbGtjdHJsKTsKPj4gK8KgwqDCoCBjZG5zX3Vw
ZGF0ZWwoY2RucywgbWNwX2Nsa2N0cmxfb2ZmLCBDRE5TX01DUF9DTEtfTUNMS0RfTUFTSywgCj4+
IGRpdmlkZXIpOwo+PiDCoMKgwqDCoMKgIHByX2VycigicGxiOiBtY2xrICogMiAlZCBjdXJyX2Ry
X2ZyZXEgJWQgZGl2aWRlciAlZCByZWdpc3RlciAleFxuIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHByb3AtPm1jbGtfZnJlcSAqIFNEV19ET1VCTEVfUkFURV9GQUNUT1IsCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
