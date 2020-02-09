Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD8156A23
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Feb 2020 13:47:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33CC11686;
	Sun,  9 Feb 2020 13:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33CC11686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581252453;
	bh=U9dd2zJM8YtJ0rJeCJPvzJK5EkYhq14Fui3X6c/J3JY=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4uj1ZV5BdD0c6mEpDlG+dpv5AIWefprQrESb8f3ecZn3YFmetqMIZgkydkthOAbK
	 MAJ42vOHTe0FdBZHLOKnakorYNMCIudxwJF1YPFDgWEP6xKzgyXKI5oeI9I72NDGF3
	 sx3QWwEB4Wj8x0GgAzZ5kgGEJNfpL2sjOMNZV2+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F64F80146;
	Sun,  9 Feb 2020 13:45:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C56FBF80145; Sun,  9 Feb 2020 13:45:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD666F80089
 for <alsa-devel@alsa-project.org>; Sun,  9 Feb 2020 13:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD666F80089
Received: from [162.213.32.131] (helo=[0.0.0.0])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1j0lxu-0002AN-FB; Sun, 09 Feb 2020 12:45:40 +0000
From: Hui Wang <hui.wang@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20191104224812.3393-1-ranjani.sridharan@linux.intel.com>
 <20191104224812.3393-3-ranjani.sridharan@linux.intel.com>
 <a87bce63-0413-d475-9b3c-19aa0f803232@perex.cz>
 <d141c18c-6c65-453f-86fd-0735a044954f@canonical.com>
Message-ID: <f8c8aa01-082a-8b00-cd6a-7d12af810559@canonical.com>
Date: Sun, 9 Feb 2020 20:45:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d141c18c-6c65-453f-86fd-0735a044954f@canonical.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: SOF: topology: set trigger
 order for FE DAI link
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

QWZ0ZXIgY2hlcnJ5LXBpY2sgdGhpcyBjb21taXQgKGFjYmYyNzc0NmVjZmE5NmIyOTBiNTRjYzdm
MDUyNzM0ODJlYTEyOGEgCkFTb0M6IHBjbTogdXBkYXRlIEZFL0JFIHRyaWdnZXIgb3JkZXIgYmFz
ZWQgb24gdGhlIGNvbW1hbmQpIHRvIDUuNCAKc3RhYmxlIGtlcm5lbCwgdGhlIHNvZiBkcml2ZXIg
d29ya3MuCgpPbiAyMDIwLzIvOSDkuIvljYg1OjMxLCBIdWkgV2FuZyB3cm90ZToKPgo+IE9uIDIw
MTkvMTEvMTkg5LiK5Y2INjo0NCwgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOgo+PiBEbmUgMDQuIDEx
LiAxOSB2IDIzOjQ4IFJhbmphbmkgU3JpZGhhcmFuIG5hcHNhbChhKToKPj4+IFNldCB0cmlnZ2Vy
IG9yZGVyIGZvciBGRSBEQUkgbGlua3MgdG8gU05EX1NPQ19EUENNX1RSSUdHRVJfUE9TVAo+Pj4g
dG8gdHJpZ2dlciB0aGUgQkUgREFJJ3MgYmVmb3JlIHRoZSBGRSBEQUkncy4gVGhpcyBwcmV2ZW50
cyB0aGUKPj4+IHhydW5zIHNlZW4gb24gcGxheWJhY2sgcGlwZWxpbmVzIHVzaW5nIHRoZSBsaW5r
IERNQS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5z
cmlkaGFyYW5AbGludXguaW50ZWwuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdWlz
IEJvc3NhcnQgCj4+PiA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+Pj4g
LS0tCj4+PiDCoCBzb3VuZC9zb2Mvc29mL3RvcG9sb2d5LmMgfCA0ICsrKysKPj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29j
L3NvZi90b3BvbG9neS5jIGIvc291bmQvc29jL3NvZi90b3BvbG9neS5jCj4+PiBpbmRleCBlMGUy
YWU3MzQ2MzIuLmU3MDc2NjkyMTE5YiAxMDA2NDQKPj4+IC0tLSBhL3NvdW5kL3NvYy9zb2YvdG9w
b2xvZ3kuYwo+Pj4gKysrIGIvc291bmQvc29jL3NvZi90b3BvbG9neS5jCj4+PiBAQCAtMjk1MSw2
ICsyOTUxLDEwIEBAIHN0YXRpYyBpbnQgc29mX2xpbmtfbG9hZChzdHJ1Y3QgCj4+PiBzbmRfc29j
X2NvbXBvbmVudCAqc2NvbXAsIGludCBpbmRleCwKPj4+IMKgwqDCoMKgwqAgaWYgKCFsaW5rLT5u
b19wY20pIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsaW5rLT5ub25hdG9taWMgPSB0cnVlOwo+
Pj4gwqAgK8KgwqDCoMKgwqDCoMKgIC8qIHNldCB0cmlnZ2VyIG9yZGVyICovCj4+PiArwqDCoMKg
wqDCoMKgwqAgbGluay0+dHJpZ2dlclswXSA9IFNORF9TT0NfRFBDTV9UUklHR0VSX1BPU1Q7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgbGluay0+dHJpZ2dlclsxXSA9IFNORF9TT0NfRFBDTV9UUklHR0VS
X1BPU1Q7Cj4+PiArCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbm90aGluZyBtb3JlIHRvIGRv
IGZvciBGRSBkYWkgbGlua3MgKi8KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+
IMKgwqDCoMKgwqAgfQo+Pj4KPj4KPj4gSXQgc2VlbXMgdGhhdCB0aGlzIHBhdGNoIGJyZWFrcyB0
aGUgc2lnbmVkIDEuMyBmaXJtd2FyZS4gVGVzdGVkIG9uIAo+PiBMZW5vdm8gQ2FyYm9uIFgxIDd0
aCBnZW4uCj4+Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90aGVzb2Zwcm9qZWN0L3NvZi9pc3N1ZXMv
MjEwMgo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBKYXJvc2xh
dgo+Pgo+IEFsc28gbWV0IHRoaXMgcHJvYmxlbSwgdGhpcyBwYXRjaCBpcyBtZXJnZWQgdG8gNS40
IHN0YWJsZSBrZXJuZWwsIHdoZW4gCj4gSSBydW4gdGhlIDUuNCBzdGFibGUga2VybmVsIG9uIHRo
ZSBMZW5vdm8gQ2FyYm9uIHgxIDd0aCBnZW4gb3IgRGVsbCAKPiBEbWljIG1hY2hpbmVzLMKgIHRo
ZSBzb2YgZHJpdmVyIHdpbGwgcHJpbnQgZXJyb3IgbG9ncyByZXBlYXRlZGx5IGFuZCAKPiB0aGUg
c29mIGZhaWxzIHRvIHdvcmsuIEkgdHJpZWQgd2l0aCBib3RoIDEuMyBhbmQgMS40IGZpcm13YXJl
LiBJZiBJIAo+IHJldmVydGVkIHRoaXMgcGF0Y2ggZnJvbSA1LjQgc3RhYmxlIGtlcm5lbCwgdGhl
IHNvZiBkcml2ZXIgd2lsbCB3b3JrIAo+IHdpdGggYm90aCAxLjMgYW5kIDEuNCBmaXJtd2FyZS4K
Pgo+IEkgYWxzbyB0cmllZCB0aGUgNS41LXJjMSBrZXJuZWwsIHRoaXPCoCBrZXJuZWwgYWxyZWFk
eSBpbmNsdWRlcyB0aGlzIAo+IHBhdGNoLCBidXQgdGhlcmUgaXMgbm8gaXNzdWUgZm9yIHRoaXMg
a2VybmVsLCB0aGUgc29mIGRyaXZlciB3b3JrcyAKPiB3ZWxsLiBTbyBsb29rcyBsaWtlIG9ubHkg
YmFja3BvcnQgdGhpcyBwYXRjaCB0byA1LjQgc3RhYmxlIGtlcm5lbCBpcyAKPiBub3QgZW5vdWdo
LCBlaXRoZXIgd2UgcmV2ZXJ0IHRoaXMgcGF0Y2ggb3Igd2UgYmFja3BvcnQgbW9yZSBwYXRjaGVz
IHRvIAo+IDUuNCBzdGFibGUga2VybmVsLgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
