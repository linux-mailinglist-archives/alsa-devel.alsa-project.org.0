Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428214A3BE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 13:22:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1CC83D;
	Mon, 27 Jan 2020 13:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1CC83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580127759;
	bh=MY7TOdqzUGBGDofGi/Qt+V76mFau7mADidL3DKMPvVk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GazNn9+Sp9kbNxdsi+wfUcEV5tqv1+ouGiSJhETgOMF1MiAE6hgz4tQYwmYkE+dHr
	 44Ax+CSqqjY1Vo+7TywIs7IxGvRd3Dnw2yTzT8IZTh2Y4VA4WI5wLDD3su1jqcG832
	 d7Klm1kg7CO2e9hx/h1mFNZSVb8qEUf5NfRYdMsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8948F80256;
	Mon, 27 Jan 2020 13:20:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF3E9F80254; Mon, 27 Jan 2020 13:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3AE0F80218
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 13:20:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3AE0F80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 04:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="223227835"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 04:20:13 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-8-cezary.rojewski@intel.com>
 <20e4b888-0766-f211-9adf-4f6794a39f4a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <50fb13cf-1c91-f8ab-5661-5bb08a12d381@intel.com>
Date: Mon, 27 Jan 2020 13:20:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20e4b888-0766-f211-9adf-4f6794a39f4a@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 07/12] ASoC: SOF: Implement Probe IPC API
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

T24gMjAyMC0wMS0yNCAyMDo1NSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+ICsv
KioKPj4gKyAqIHNvZl9pcGNfcHJvYmVfZG1hX2FkZCAtIGF0dGFjaCB0byBzcGVjaWZpZWQgZG1h
cwo+PiArICogQHNkZXY6wqDCoMKgIFNPRiBzb3VuZCBkZXZpY2UKPj4gKyAqIEBkbWE6wqDCoMKg
IExpc3Qgb2Ygc3RyZWFtcyAoZG1hcykgdG8gYXR0YWNoIHRvCj4+ICsgKiBAbnVtX2RtYTrCoMKg
wqAgTnVtYmVyIG9mIGVsZW1lbnRzIGluIEBkbWEKPj4gKyAqCj4+ICsgKiBDb250cmFyeSB0byBl
eHRyYWN0aW9uLCBpbmplY3Rpb24gc3RyZWFtcyBhcmUgbmV2ZXIgYXNzaWduZWQKPj4gKyAqIG9u
IGluaXQuIEJlZm9yZSBhdHRlbXB0aW5nIGFueSBkYXRhIGluamVjdGlvbiwgaG9zdCBpcyByZXNw
b25zaWJsZQo+PiArICogZm9yIHNwZWNpZnlpbmcgc3RyZWFtcyB3aGljaCB3aWxsIGJlIGxhdGVy
IHVzZWQgdG8gdHJhbnNmZXIgZGF0YQo+PiArICogdG8gY29ubmVjdGVkIHByb2JlIHBvaW50cy4K
Pj4gKyAqLwo+PiAraW50IHNvZl9pcGNfcHJvYmVfZG1hX2FkZChzdHJ1Y3Qgc25kX3NvZl9kZXYg
KnNkZXYsCj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc29mX3Byb2JlX2RtYSAqZG1hLCBzaXpl
X3QgbnVtX2RtYSkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qgc29mX2lwY19wcm9iZV9kbWFfYWRk
X3BhcmFtcyAqbXNnOwo+PiArwqDCoMKgIHN0cnVjdCBzb2ZfaXBjX3JlcGx5IHJlcGx5Owo+PiAr
wqDCoMKgIHNpemVfdCBieXRlcyA9IHNpemVvZigqZG1hKSAqIG51bV9kbWE7Cj4+ICvCoMKgwqAg
aW50IHJldDsKPj4gKwo+PiArwqDCoMKgIG1zZyA9IGttYWxsb2Moc2l6ZW9mKCptc2cpICsgYnl0
ZXMsIEdGUF9LRVJORUwpOwo+PiArwqDCoMKgIGlmICghbXNnKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FTk9NRU07Cj4+ICvCoMKgwqAgbXNnLT5oZHIuc2l6ZSA9IHNpemVvZigqbXNnKTsK
Pj4gK8KgwqDCoCBtc2ctPm51bV9lbGVtcyA9IG51bV9kbWE7Cj4+ICvCoMKgwqAgbXNnLT5oZHIu
Y21kID0gU09GX0lQQ19HTEJfUFJPQkUgfCBTT0ZfSVBDX1BST0JFX0RNQV9BREQ7Cj4+ICvCoMKg
wqAgbWVtY3B5KCZtc2ctPmRtYVswXSwgZG1hLCBieXRlcyk7Cj4+ICsKPj4gK8KgwqDCoCByZXQg
PSBzb2ZfaXBjX3R4X21lc3NhZ2Uoc2Rldi0+aXBjLCBtc2ctPmhkci5jbWQsIG1zZywKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbXNnLT5oZHIuc2l6ZSArIGJ5dGVzLCAmcmVwbHksIHNpemVv
ZihyZXBseSkpOwo+PiArwqDCoMKgIGtmcmVlKG1zZyk7Cj4+ICvCoMKgwqAgcmV0dXJuIHJldDsK
Pj4gK30KPj4gK0VYUE9SVF9TWU1CT0woc29mX2lwY19wcm9iZV9kbWFfYWRkKTsKPj4gKwo+PiAr
LyoqCj4+ICsgKiBzb2ZfaXBjX3Byb2JlX2RtYV9yZW1vdmUgLSBkZXRhY2ggZnJvbSBzcGVjaWZp
ZWQgZG1hcwo+PiArICogQHNkZXY6wqDCoMKgwqDCoMKgwqAgU09GIHNvdW5kIGRldmljZQo+PiAr
ICogQHN0cmVhbV90YWc6wqDCoMKgIExpc3Qgb2Ygc3RyZWFtIHRhZ3MgdG8gZGV0YWNoIGZyb20K
Pj4gKyAqIEBudW1fc3RyZWFtX3RhZzrCoMKgwqAgTnVtYmVyIG9mIGVsZW1lbnRzIGluIEBzdHJl
YW1fdGFnCj4+ICsgKgo+PiArICogSG9zdCBzZW5kcyBETUFfUkVNT1ZFIHJlcXVlc3QgdG8gZnJl
ZSBwcmV2aW91c2x5IGF0dGFjaGVkIHN0cmVhbQo+PiArICogZnJvbSBiZWluZyBvY2N1cGllZCBm
b3IgaW5qZWN0aW9uLiBFYWNoIGRldGFjaCBvcGVyYXRpb24gc2hvdWxkCj4+ICsgKiBtYXRjaCBl
cXVpdmFsZW50IERNQV9BREQuIERldGFjaCBvbmx5IHdoZW4gYWxsIHByb2JlcyB0aWVkIHRvCj4+
ICsgKiBnaXZlbiBzdHJlYW0gaGF2ZSBiZWVuIGRpc2Nvbm5lY3RlZC4KPj4gKyAqLwo+PiAraW50
IHNvZl9pcGNfcHJvYmVfZG1hX3JlbW92ZShzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYsCj4+ICvC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgKnN0cmVhbV90YWcsIHNpemVfdCBudW1fc3RyZWFt
X3RhZykKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qgc29mX2lwY19wcm9iZV9kbWFfcmVtb3ZlX3Bh
cmFtcyAqbXNnOwo+PiArwqDCoMKgIHN0cnVjdCBzb2ZfaXBjX3JlcGx5IHJlcGx5Owo+PiArwqDC
oMKgIHNpemVfdCBieXRlcyA9IHNpemVvZigqc3RyZWFtX3RhZykgKiBudW1fc3RyZWFtX3RhZzsK
Pj4gK8KgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqAgbXNnID0ga21hbGxvYyhzaXplb2Yo
Km1zZykgKyBieXRlcywgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgaWYgKCFtc2cpCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gK8KgwqDCoCBtc2ctPmhkci5zaXplID0gc2l6
ZW9mKCptc2cpOwo+PiArwqDCoMKgIG1zZy0+bnVtX2VsZW1zID0gbnVtX3N0cmVhbV90YWc7Cj4+
ICvCoMKgwqAgbXNnLT5oZHIuY21kID0gU09GX0lQQ19HTEJfUFJPQkUgfCBTT0ZfSVBDX1BST0JF
X0RNQV9SRU1PVkU7Cj4+ICvCoMKgwqAgbWVtY3B5KCZtc2ctPnN0cmVhbV90YWdbMF0sIHN0cmVh
bV90YWcsIGJ5dGVzKTsKPj4gKwo+PiArwqDCoMKgIHJldCA9IHNvZl9pcGNfdHhfbWVzc2FnZShz
ZGV2LT5pcGMsIG1zZy0+aGRyLmNtZCwgbXNnLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBt
c2ctPmhkci5zaXplICsgYnl0ZXMsICZyZXBseSwgc2l6ZW9mKHJlcGx5KSk7Cj4+ICvCoMKgwqAg
a2ZyZWUobXNnKTsKPj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+PiArfQo+PiArRVhQT1JUX1NZTUJP
TChzb2ZfaXBjX3Byb2JlX2RtYV9yZW1vdmUpOwo+IAo+IGEgbG90IG9mIHRoZSBjb2RlIGlzIGlk
ZW50aWNhbCB3aXRoIG9ubHkgbWlub3IgZGlmZmVyZW5jZSBpbiBudW1fZWxlbXMgCj4gYW5kIHRo
ZSBmbGFncywgY291bGQgd2UgdXNlIGhlbHBlciBmdW5jdGlvbnMgaGVyZT8KPiAKPiBUaGlzIHdv
dWxkIGhlbHAgYnR3IHdoZW4gd2UgdHJhbnNpdGlvbiB0byB0aGUgbXVsdGktY2xpZW50IHN1cHBv
cnQsIHdlJ2QgCj4gb25seSBuZWVkIHRvIHVwZGF0ZSB0aGUgSVBDIHN0dWZmIGluIGZldyBsb2Nh
dGlvbnMuCj4gCgpTdHJ1Y3R1cmVzIHVzZWQgaW4gdGhlIGlwYyBoYW5kbGVycyBhcmUgZGlmZmVy
ZW50LCB0aGF0IGlzIHdoeSBvbmx5IApfSU5GTyByZXF1ZXN0cyBhcmUgY29tYmluZWQuIE1heWJl
IEknbSBqdXN0IGJsaW5kIG9yIG5vdCBlbm91Z2ggdGVhIApkcnVuayB0b2RheS4KCj4+ICsgKiBD
b3B5cmlnaHQoYykgMjAxOSBJbnRlbCBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4K
PiAKPiAyMDE5LTIwMjAuIEhhcHB5IE5ldyBZZWFyLgo+IAo+IEknZCBwcmVmZXIgaXQgaWYgd2Ug
aGF2ZSB0aGUgbmV3IGhlYWRlciBmaWxlIGluIGEgc2VwYXJhdGUgcGF0Y2ggYWRkZWQgCj4gZmly
c3QsIEkgZmluZCBpdCBvZGQgdG8gcmV2aWV3IGFuIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIGhl
YWRlciBhZGRlZCAKPiBsYXN0Lgo+IAoKVXBkYXRlZCB0aGUgaGVhZGVycyBpbiB2Mi4gcHJvYmUu
YyBhbmQgLmggYXJlIGFkZGVkIHNpbXVsdGFuZW91c2x5IGluIAp0aGlzIHBhdGNoLiBJIGRvIG5v
dCBzZWUgdGhlIHByb2JsZW0gd2l0aCB0aGUgcGF0Y2hzZXQgc3RydWN0dXJlLiBDb2RlIAppcyBy
YXRoZXIgc21hbGwsIGRpdmlkaW5nIGl0IGZ1cnRoZXIgY2FuIG1ha2UgaXQganVzdCBoYXJkZXIg
dG8gcmV2aWV3LgoKQ3phcmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
