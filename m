Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A635F124382
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 10:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3930E1655;
	Wed, 18 Dec 2019 10:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3930E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576662170;
	bh=R0T88sO8q9H1KG5iq22TPz/kvsuWFg24uSX6phOLFDc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgBaaOv/2QCmb9urFcETnAaKHbYEa7ZRtVkRUFoXZkSfvTXFNzRDSqCbGsDQwoIIA
	 jMZdmCCmoERjtG9h1iFwSiE2gvHVY4qiaclpz9tUnDnUgN9Rj/wctzZWzdqevxQYgY
	 YSdWvjsAeF2s60xF8Vbgq2Ym8SsdT2oFS3nwGPPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77471F8022C;
	Wed, 18 Dec 2019 10:41:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BDADF8022C; Wed, 18 Dec 2019 10:41:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by alsa1.perex.cz (Postfix) with ESMTP id 0A171F80088
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 10:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A171F80088
Received: from [10.10.222.226] (unknown [194.162.236.226])
 by mail.bugwerft.de (Postfix) with ESMTPSA id D98CA281DD0;
 Wed, 18 Dec 2019 09:34:30 +0000 (UTC)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org>
 <c3885b01-e6ec-1b67-6e48-69e3fc40bb62@linux.intel.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <96d1182a-d9ba-78ce-c483-6be5389e3aba@zonque.org>
Date: Wed, 18 Dec 2019 10:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c3885b01-e6ec-1b67-6e48-69e3fc40bb62@linux.intel.com>
Content-Language: en-US
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org
Subject: Re: [alsa-devel] [PATCH 06/10] mfd: Add core driver for AD242x A2B
 transceivers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgUGllcnJlLAoKVGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcyEKCk9uIDEyLzE3LzE5IDg6
MTYgUE0sIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+IGlzIHRoZSBkYXRhc2hlZXQgcHVi
bGljPyBJIHRob3VnaHQgaXQgd2FzIG9ubHkgYXZhaWxhYmxlIHVuZGVyIE5EQS4KCkl0IHdhcyB1
bnRpbCByZWNlbnRseSwgYnV0IGl0IGlzIG5vdyBwdWJsaWM6CgoKaHR0cHM6Ly93d3cuYW5hbG9n
LmNvbS9tZWRpYS9lbi90ZWNobmljYWwtZG9jdW1lbnRhdGlvbi91c2VyLWd1aWRlcy9BRDI0Mnhf
VFJNX1JldjEuMS5wZGYKCj4+ICvCoMKgwqAgbWFzdGVyLT5zeW5jX2NsayA9IGRldm1fY2xrX2dl
dChkZXYsICJzeW5jIik7Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihtYXN0ZXItPnN5bmNfY2xrKSkg
ewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gUFRSX0VSUihtYXN0ZXItPnN5bmNfY2xrKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IHN5bmMgY2xrOiAlZFxuIiwg
cmV0KTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCB9Cj4+
ICsKPj4gK8KgwqDCoCBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLCAiY2xv
Y2stZnJlcXVlbmN5IiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZtYXN0
ZXItPnN5bmNfY2xrX3JhdGUpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBjbGtfc2V0X3Jh
dGUobWFzdGVyLT5zeW5jX2NsaywgbWFzdGVyLT5zeW5jX2Nsa19yYXRlKTsKPiAKPiBzaG91bGRu
J3QgeW91IGNoZWNrIHRoZSByYXRlIGJlZm9yZSBzZXR0aW5nIGl0Pwo+Cj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAocmV0IDwgMCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRl
diwgIkNhbm5vdCBzZXQgc3luYyBjbG9jayByYXRlOiAlZFxuIiwgcmV0KTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDC
oCB9Cj4+ICsKPj4gK8KgwqDCoCBtYXN0ZXItPnN5bmNfY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUo
bWFzdGVyLT5zeW5jX2Nsayk7Cj4+ICvCoMKgwqAgaWYgKG1hc3Rlci0+c3luY19jbGtfcmF0ZSAh
PSA0NDEwMCAmJiBtYXN0ZXItPnN5bmNfY2xrX3JhdGUgIT0KPj4gNDgwMDApIHsKPj4gK8KgwqDC
oMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiU1lOQyBjbG9jayByYXRlICVkIGlzIGludmFsaWRcbiIs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hc3Rlci0+c3luY19jbGtfcmF0ZSk7Cj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDCoCB9Cj4gCj4gdGhpcyBpcyBh
IGJpdCBvZGQsIHlvdSBzZXQgdGhlIHJhdGUgaW4gY2FzZSB0aGVyZSBpcyBhIHByb3BlcnR5IGJ1
dCBnZXQKPiBpdCBhbnl3YXlzLiB0aGUgbGFzdCBibG9jayBjb3VsZCBiZSBhbiBlbHNlPwoKVGhl
IGlkZWEgaXM6IGlmICdjbG9jay1mcmVxdWVuY3knIGlzIGdpdmVuLCB3ZSB1c2UgaXQgdG8gc2V0
IHRoZSBjbG9jaywKb3RoZXJ3aXNlIHdlIHJlbHkgb24gdGhlIGNsb2NrIGhhdmluZyBvbmUgb2Yg
dGhlIHR3byBhbGxvd2VkIHJhdGVzLiBUaGlzCndheSwgd2UgYWxzbyBjYXRjaCBzZXR1cHMgd2hl
cmUgdGhlIGNsb2NrIHByb3ZpZGVyIGNhbm5vdCBnZW5lcmF0ZWQgdGhlCmRlc2lyZWQgZnJlcXVl
bmN5LCBvciB3aGVyZSB0aGUgdmFsdWUgb2YgJ2Nsb2NrLWZyZXF1ZW5jeScgaXMgaWxsZWdhbC4K
Cj4+ICvCoMKgwqAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKG1hc3Rlci0+c3luY19jbGspOwo+
PiArwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwg
ImZhaWxlZCB0byBlbmFibGUgc3luYyBjbGs6ICVkXG4iLCByZXQpOwo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCAvKiBNYXN0ZXIgbm9k
ZSBzZXR1cCAqLwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gcmVnbWFwX3dyaXRlKHJlZ21hcCwgQUQy
NDJYX0NPTlRST0wsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFEMjQyWF9DT05U
Uk9MX01TVFIgfCBBRDI0MlhfQ09OVFJPTF9TT0ZUUlNUKTsKPj4gK8KgwqDCoCBpZiAocmV0IDwg
MCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBh
ZDI0Mnhfd2FpdF9mb3JfaXJxKG1hc3RlciwgJm1hc3Rlci0+cnVuX2NvbXBsZXRpb24sIDEwKTsK
PiAKPiB3aGF0IGlzIDEwPwoKTWlsbGlzZWNvbmRzLiBUaGUgcGFyYW1ldGVyIG5lZWRzIHRvIGdl
dCBhIGJldHRlciBuYW1lIEkgZmlndXJlLgoKClRoYW5rcywKRGFuaWVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
