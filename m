Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46DC9A8C1
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 09:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320801666;
	Fri, 23 Aug 2019 09:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320801666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566545375;
	bh=7+UOllAshllMXW8u6TVAyq9p3X07ImuhJ6JeX3Qum0U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dhMBfAA1IOPJojGBE8Il+0dYcTYZjGLEY2o838/YkU2+MhmxdpYNkpEqwSFmKiFeE
	 lIfYetSVOw+MH0l+Dy8bahdtZLTRdXhZ2PNgt36PHrwfdC8QsG6ZcvDQYDJR2e5JOF
	 bwfmc/AYVZOWOzghcsEwqYqnXlOSvJlaKAQKHsLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0AC8F80322;
	Fri, 23 Aug 2019 09:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F8BF80141; Fri, 23 Aug 2019 09:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80251F80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 09:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80251F80141
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 00:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; d="scan'208";a="181645316"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga003.jf.intel.com with ESMTP; 23 Aug 2019 00:27:37 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
 <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
 <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
 <99f93211-acfe-cd29-09f9-900dbd848bd3@intel.com>
 <90925296-5cb4-fa87-9c35-a7008f5e8df5@linux.intel.com>
 <3ff82f6b-647f-5f9c-09c7-be42a00c8bd4@intel.com>
 <4722ef7e-0fc7-4ec5-c37c-a0e58961345d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c5f8d006-fe17-9772-c681-13f0ad064172@intel.com>
Date: Fri, 23 Aug 2019 09:27:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4722ef7e-0fc7-4ec5-c37c-a0e58961345d@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: Haswell: Adjust machine
 device private context
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

T24gMjAxOS0wOC0yMiAyMjo0NCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMi8xOSAyOjAyIFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IE9uIDIwMTktMDgt
MjIgMjA6NDQsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiA4LzIy
LzE5IDEyOjE0IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pj4gT24gMjAxOS0wOC0yMiAx
ODo0MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDgv
MjIvMTkgMTE6MDUgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+Pj4+IE9uIDIwMTktMDgt
MjIgMTc6NTgsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+
Pj4+PiBPbiA4LzIyLzE5IDY6MzYgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+Pj4+Pj4g
QXBhcnQgZnJvbSBIYXN3ZWxsIG1hY2hpbmVzLCBhbGwgb3RoZXIgZGV2aWNlcyBoYXZlIHRoZWly
IAo+Pj4+Pj4+PiBwcml2YXRlIGRhdGEKPj4+Pj4+Pj4gc2V0IHRvIHNuZF9zb2NfYWNwaV9tYWNo
IGluc3RhbmNlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDaGFuZ2VzIGZvciBIU1cvIEJEVyBib2FyZHMg
aW50cm9kdWNlZCB3aXRoIHNlcmllczoKPj4+Pj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9jb3Zlci8xMDc4MjAzNS8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gYWRkZWQgc3VwcG9ydCBmb3Ig
ZGFpX2xpbmsgcGxhdGZvcm1fbmFtZSBhZGp1c3RtZW50cyB3aXRoaW4gY2FyZCAKPj4+Pj4+Pj4g
cHJvYmUKPj4+Pj4+Pj4gcm91dGluZXMuIFRoZXNlIHRha2UgZm9yIGdyYW50ZWQgcHJpdmF0ZV9k
YXRhIHBvaW50cyB0bwo+Pj4+Pj4+PiBzbmRfc29jX2FjcGlfbWFjaCB3aGVyZWFzIGZvciBIYXN3
ZWxsLCBpdCdzIHNzdF9wZGF0YSBpbnN0ZWFkLiAKPj4+Pj4+Pj4gQ2hhbmdlCj4+Pj4+Pj4+IHBy
aXZhdGUgY29udGV4dCBvZiBwbGF0Zm9ybV9kZXZpY2UgLSByZXByZXNlbnRpbmcgbWFjaGluZSBi
b2FyZCAKPj4+Pj4+Pj4gLSB0bwo+Pj4+Pj4+PiBhZGRyZXNzIHRoaXMuCj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IEZpeGVzOiBlODcwNTVkNzMyZTMgKCJBU29DOiBJbnRlbDogaGFzd2VsbDogcGxhdGZvcm0g
bmFtZSBmaXh1cCAKPj4+Pj4+Pj4gc3VwcG9ydCIpCj4+Pj4+Pj4+IEZpeGVzOiA3ZTQwZGRjZjk3
NGEgKCJBU29DOiBJbnRlbDogYmR3LXJ0NTY3NzogcGxhdGZvcm0gbmFtZSAKPj4+Pj4+Pj4gZml4
dXAgc3VwcG9ydCIpCj4+Pj4+Pj4+IEZpeGVzOiAyZDA2N2IyODA3ZjkgKCJBU29DOiBJbnRlbDog
YnJvYWR3ZWxsOiBwbGF0Zm9ybSBuYW1lIAo+Pj4+Pj4+PiBmaXh1cCBzdXBwb3J0IikKPj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogQ2V6YXJ5IFJvamV3c2tpIDxjZXphcnkucm9qZXdza2lAaW50ZWwu
Y29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gwqAgc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3Qt
YWNwaS5jIHwgMyArKy0KPj4+Pj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29j
L2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jIAo+Pj4+Pj4+PiBiL3NvdW5kL3NvYy9pbnRlbC9jb21t
b24vc3N0LWFjcGkuYwo+Pj4+Pj4+PiBpbmRleCAxNWYyYjI3ZTY0M2YuLmMzNGY2MjhjNzk4NyAx
MDA2NDQKPj4+Pj4+Pj4gLS0tIGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+
Pj4+Pj4+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWFjcGkuYwo+Pj4+Pj4+PiBA
QCAtMTA5LDExICsxMDksMTIgQEAgaW50IHNzdF9hY3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgCj4+Pj4+Pj4+ICpwZGV2KQo+Pj4+Pj4+PiDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4gwqDC
oMKgwqDCoCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBzc3RfYWNwaSk7Cj4+Pj4+Pj4+ICvC
oMKgwqAgbWFjaC0+cGRhdGEgPSBzc3RfcGRhdGE7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgLyogcmVn
aXN0ZXIgbWFjaGluZSBkcml2ZXIgKi8KPj4+Pj4+Pj4gwqDCoMKgwqDCoCBzc3RfYWNwaS0+cGRl
dl9tYWNoID0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBsYXRmb3JtX2RldmljZV9yZWdp
c3Rlcl9kYXRhKGRldiwgbWFjaC0+ZHJ2X25hbWUsIC0xLAo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3N0X3BkYXRhLCBzaXplb2Yo
KnNzdF9wZGF0YSkpOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbWFjaCwgc2l6ZW9mKCptYWNoKSk7Cj4+Pj4+Pj4KPj4+Pj4+PiBJ
IG5vdyBhZ3JlZSB0aGF0IHRoZSBjb2RlIEkgYWRkZWQgaXMgaW5jb3JyZWN0IGFuZCBwcm9iYWJs
eSAKPj4+Pj4+PiBhY2Nlc3NlcyBtZW1vcnkgb2Zmc2V0cyB0aGF0IGFyZW4ndCByaWdodC4gSSBo
YXZlIGFic29sdXRlbHkgbm8gCj4+Pj4+Pj4gaWRlYSB3aHkgSSBhZGRlZCB0aGlzIGNvbW1lbnQg
dGhhdCAnbGVnYWN5IGRvZXMgbm90IHBhc3MgCj4+Pj4+Pj4gcGFyYW1ldGVycycgd2hlbiBpdCBt
b3N0IGRlZmluaXRpdmVseSBkb2VzLiBHb29kIGNhdGNoIG9uIHlvdXIgc2lkZS4KPj4+Pj4+Pgo+
Pj4+Pj4+IFRoYXQgc2FpZCwgZG9lc24ndCB0aGUgcHJvcG9zZWQgZml4IGludHJvZHVjZSBhbm90
aGVyIGlzc3VlPwo+Pj4+Pj4+Cj4+Pj4+Pj4gSW4gdGhlIG1hY2hpbmUgZHJpdmVycywgeW91IHN0
aWxsIGdldCBwZGF0YSBkaXJlY3RseSwgc28gYXJlbid0IAo+Pj4+Pj4+IHlvdSBtaXNzaW5nIGFu
IGluZGlyZWN0aW9uIHRvIGdldCBiYWNrIHRvIHBkYXRhIGZyb20gbWFjaD8KPj4+Pj4+Pgo+Pj4+
Pj4+IHN0YXRpYyBpbnQgYmR3X3J0NTY3N19ydGRfaW5pdChzdHJ1Y3Qgc25kX3NvY19wY21fcnVu
dGltZSAqcnRkKQo+Pj4+Pj4+IHsKPj4+Pj4+PiDCoMKgwqDCoMKgc3RydWN0IHNuZF9zb2NfY29t
cG9uZW50ICpjb21wb25lbnQgPSAKPj4+Pj4+PiBzbmRfc29jX3J0ZGNvbV9sb29rdXAocnRkLCBE
UlZfTkFNRSk7Cj4+Pj4+Pj4gwqDCoMKgwqDCoHN0cnVjdCBzc3RfcGRhdGEgKnBkYXRhID0gZGV2
X2dldF9wbGF0ZGF0YShjb21wb25lbnQtPmRldik7Cj4+Pj4+Pj4gwqDCoMKgwqDCoHN0cnVjdCBz
c3RfaHN3ICpicm9hZHdlbGwgPSBwZGF0YS0+ZHNwOwo+Pj4+Pj4+Cj4+Pj4+Pj4gPDw8IHNvIGhl
cmUgeW91IHRvb2sgdGhlIHdyb25nIHBvaW50ZXIsIG5vPwo+Pj4+Pj4KPj4+Pj4+IEJvdGggQmF5
dHJhaWwgYW5kIEhhc3dlbGwgYXJlIGVudW1lcmF0ZWQgaW4gYSBiaXQgZGlmZmVyZW50IAo+Pj4+
Pj4gZmFzaGlvbiB0aGFuIFNLTCBlcXVpdmFsZW50cy4KPj4+Pj4+Cj4+Pj4+PiBUaGVyZSBpcyBh
biBpbi1wbGFjZSByZWdpc3RyYXRpb24gZm9yIG1hY2hpbmUgZGV2aWNlIC0gd2hvc2UgCj4+Pj4+
PiBwcml2YXRlX2RhdGEgZ2V0cyB1c2VkIGluIG1hY2hpbmUgcHJvYmUgLSBhbmQgcGNtIGRldmlj
ZSB3aGljaCAKPj4+Pj4+IGhhcHBlbnMgb24gZmlybXdhcmUgbG9hZCBjYWxsYmFjayAKPj4+Pj4+
ICgvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaTo2MykuIF9ydGRfaW5pdCBtYWtlcyB1
c2Ugb2YgdGhlIAo+Pj4+Pj4gbGF0dGVyIG9mIHR3by4KPj4+Pj4KPj4+Pj4gSSBkb24ndCBnZXQg
eW91ciBleHBsYW5hdGlvbnMuIGNhbiB5b3UgZWxhYm9yYXRlIG9uIHdoYXQgdGhpcyBkb2VzIAo+
Pj4+PiBub3cgdGhhdCBwZGF0YSBpcyBubyBsb25nZXIgcGFzc2VkIGFzIGFuIGFyZ3VtZW50IHRv
IHRoZSBtYWNoaW5lIAo+Pj4+PiBkcml2ZXI6Cj4+Pj4+Cj4+Pj4+IHN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50ID0gc25kX3NvY19ydGRjb21fbG9va3VwKHJ0ZCwgCj4+Pj4+IERS
Vl9OQU1FKTsKPj4+Pj4gc3RydWN0IHNzdF9wZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRh
KGNvbXBvbmVudC0+ZGV2KTsKPj4+Pj4KPj4+Pj4gdGhlICdjb21wb25lbnQnIGhlcmUgaXMgbm90
IHRoZSBQQ00gb25lLCBpcyBpdD8KPj4+Pj4KPj4+Pj4KPj4+Pgo+Pj4+IFN1cmUgdGhpbmcuCj4+
Pj4KPj4+PiBDb2RlOgo+Pj4+IMKgwqDCoMKgwqAvKiByZWdpc3RlciBtYWNoaW5lIGRyaXZlciAq
Lwo+Pj4+IMKgwqDCoMKgwqBzc3RfYWNwaS0+cGRldl9tYWNoID0KPj4+PiDCoMKgwqDCoMKgwqDC
oMKgIHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKGRldiwgbWFjaC0+ZHJ2X25hbWUsIC0x
LAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3N0X3BkYXRhLCBzaXplb2YoKnNzdF9wZGF0YSkpOwo+Pj4+Cj4+Pj4gRm91bmQgaW4gc3N0
X2FjcGlfcHJvYmUgKC9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3BpLmM6MTQ1KSAKPj4+
PiBnZW5lcmF0ZXMgbmV3IHBsYXRmb3JtX2RldmljZSAtIHdoaWNoIHJlcHJlc2VudHMgbWFjaGlu
ZSBib2FyZCAtIAo+Pj4+IHdpdGggaXRzIHByaXZhdGUgZGF0YSBzZXQgdG8gcG9pbnRlciB0byBp
bnN0YW5jZSBvZiBzdHJ1Y3Qgc3N0X3BkYXRhIAo+Pj4+IHR5cGUuIFRoaXMgZGF0YSBnZXRzIHVz
ZWQgb24gbWFjaGluZSBib2FyZCBwcm9iZSwgZS5nLjogCj4+Pj4gYnJvYWR3ZWxsX2F1ZGlvX3By
b2JlICgvc291bmQvc29jL2ludGVsL2JvYXJkcy9icm9hZHdlbGwuYzoyNzApLgo+Pj4+IEludm9s
dmVkIHBsYXRmb3JtIGlzIGNhbGxlZDogYnJvYWR3ZWxsLWF1ZGlvLiBSZXF1ZXN0ZWQgcHJpdmF0
ZSBkYXRhIAo+Pj4+IHR5cGUgYnkgYnJvYWR3ZWxsX2F1ZGlvX3Byb2JlOiBzdHJ1Y3Qgc25kX3Nv
Y19hY3BpX21hY2ggKi4gTUlTTUFUQ0guCj4+Pj4KPj4+Pgo+Pj4+IENvZGU6Cj4+Pj4KPj4+PiDC
oMKgwqDCoMKgLyogcmVnaXN0ZXIgUENNIGFuZCBEQUkgZHJpdmVyICovCj4+Pj4gwqDCoMKgwqDC
oHNzdF9hY3BpLT5wZGV2X3BjbSA9Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBwbGF0Zm9ybV9kZXZp
Y2VfcmVnaXN0ZXJfZGF0YShkZXYsIGRlc2MtPmRydl9uYW1lLCAtMSwKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNzdF9wZGF0YSwgc2l6
ZW9mKCpzc3RfcGRhdGEpKTsKPj4+Pgo+Pj4+IEZvdW5kIGluIHNzdF9hY3BpX2Z3X2NiICgvc291
bmQvc29jL2ludGVsL2NvbW1vbi9zc3RfYWNwaV9md19jYjo0NykgCj4+Pj4gZ2VuZXJhdGVzIG5l
dyBwbGF0Zm9ybV9kZXZpY2UgLSB3aGljaCByZXByZXNlbnRzIEhhc3dlbGwgUENNLCB5b3UgCj4+
Pj4gbWF5IHRyZWF0IGl0IGFzIFNreWxha2UgZXF1aXZhbGVudCAtIHdpdGggaXRzIHByaXZhdGUg
ZGF0YSBzZXQgdG8gCj4+Pj4gcG9pbnRlciB0byBpbnN0YW5jZSBvZiBzdHJ1Y3Qgc3N0X3BkYXRh
IHR5cGUuIFRoaXMgZGF0YSBnZXRzIHVzZWQgb24gCj4+Pj4gZGFpIC5pbml0IC0gYnJvYWR3ZWxs
X3J0ZF9pbml0IC0gaW52b2NhdGlvbiB3aGVuIGNhcmQgaXMgCj4+Pj4gaW5zdGFudGlhdGVkIGJ5
IEFTb0MgY29kZS4gQXMgeW91IGNhbiBzZWUgb24gCj4+Pj4gKC9zb3VuZC9zb2MvaW50ZWwvYm9h
cmRzL2Jyb2Fkd2VsbC5jOjE2MiksIHBsYXRmb3JtIHRpZWQgd2l0aCBpdCBpczogCj4+Pj4gaGFz
d2VsbC1wY20tYXVkaW8uIFJlcXVlc3RlZCBwcml2YXRlIGRhdGEgdHlwZSBieSBicm9hZHdlbGxf
cnRkX2luaXQgCj4+Pj4gLSBzdHJ1Y3Qgc3N0X3BkYXRhICouIE1BVENILgo+Pj4KPj4+Cj4+PiB0
aGUgbWFjaGluZSBkcml2ZXJzIHVzZXMgc25kX3NvY19ydGRjb21fbG9va3VwKHJ0ZCwgRFJWX05B
TUUpOwo+Pj4KPj4+IEhvdyBpcyBEUlZfTkFNRSBjb25uZWN0ZWQgdG8gaGFzd2VsbC1wY20tYXVk
aW8/Cj4+Pgo+Pj4gSSBtdXN0IGJlIG1pc3Npbmcgc29tZXRoaW5nIGluIHlvdXIgbG9naWMuCj4+
Pgo+Pgo+PiBQbGVhc2UgY2hlY2tvdXQgc3N0LWFjcGkuYyBmaWxlIGFuZCBzZWUgZGVjbGFyYXRp
b24gb2YgbGVnYWN5IHBsYXRmb3JtIAo+PiBkZXNjcmlwdG9ycy4gU2VlIHRoZSBuYW1lcyBvZiBQ
Q00gZGV2aWNlcyAocGxhdGZvcm0gZGV2aWNlcykgYmVpbmcgCj4+IGRlY2xhcmVkLgo+IAo+IHdo
YXQgaGFwcGVucyBpbiBzc3QtYWNwaS5jIHN0YXlzIGluIHNzdC1hY3BpLmMKPiBJIGRvbid0IGdl
dCBob3cgeW91IHJldHJpZXZlIHRoZSBwZGF0YSBpbiB0aGUgbWFjaGluZSBkcml2ZXIgZnJvbSAK
PiAqYW5vdGhlciogZHJpdmVyLiBEaWZmZXJlbnQgZGV2aWNlcywgZGlmZmVyZW50IHBsYXRmb3Jt
IGRhdGEuCgpEQUkgaXMgdGllZCB3aXRoIHBsYXRmb3JtIGRldmljZSBjYWxsZWQgImhhc3dlbGwt
cGNtLWF1ZGlvIiB3aGVyZWFzIAptYWNoaW5lIGJvYXJkIGlzIHJlcHJlc2VudGVkIGJ5ICJicm9h
ZHdlbGwtYXVkaW8iIHBsYXRmb3JtIGRlaXZjZS4gV2hpY2ggCnBhcnQgaXMgc3RpbGwgdW5jbGVh
cj8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
