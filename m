Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C11FFFDC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 08:54:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46631168C;
	Mon, 18 Nov 2019 08:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46631168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574063643;
	bh=8+V2ovhrnpC+monRdp8DBFJiibP1/nhXLMHMNOOb/8c=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KwOZnnhNELd7N6tPO4zDMBZ3sZxB5Kvbz9YH9YmQEqn/9AHwrLgG5yR2j7Zgyoekp
	 +oDvD4FxtXHXAlbrci1jfl9BNnULUf00zs7tf2UVQ3xq3XNXkvWt4i1bEhBuSil2fC
	 QaVdiH3/CWfTLqoNtnSz0yb9ATyktLBk/i7D0IZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B822F800F1;
	Mon, 18 Nov 2019 08:52:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DECE7F800F1; Mon, 18 Nov 2019 08:52:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68D79F800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 08:52:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D79F800F1
Received: from 61-220-137-34.hinet-ip.hinet.net ([61.220.137.34]
 helo=[10.101.195.16]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1iWbpW-0005e4-7i; Mon, 18 Nov 2019 07:52:14 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191111144502.22910-1-hui.wang@canonical.com>
 <s5h7e46whpi.wl-tiwai@suse.de> <s5hzhh2v1pw.wl-tiwai@suse.de>
 <cf190a1c-ec4c-0031-f1af-c3bfdd1acc85@canonical.com>
 <5af71ae2-2a1e-cb75-cfce-7228c433a957@canonical.com>
 <s5himnh3bfe.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <d5dd18ca-401a-e2da-8118-f1200a39e1e9@canonical.com>
Date: Mon, 18 Nov 2019 15:52:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5himnh3bfe.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/hdmi - add a parameter to let
 users decide if checking the eld_valid
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

Ck9uIDIwMTkvMTEvMTgg5LiL5Y2IMzoxMiwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIE1vbiwg
MTggTm92IDIwMTkgMDU6NDA6NTIgKzAxMDAsCj4gSHVpIFdhbmcgd3JvdGU6Cj4+Cj4+IE9uIDIw
MTkvMTEvMTIg5LiL5Y2IODoyMSwgSHVpIFdhbmcgd3JvdGU6Cj4+PiBPbiAyMDE5LzExLzEyIOS4
iuWNiDEyOjA0LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+Pj4gT24gTW9uLCAxMSBOb3YgMjAxOSAx
NjozMzo0NSArMDEwMCwKPj4+PiBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+Pj4+IE9uIE1vbiwgMTEg
Tm92IDIwMTkgMTU6NDU6MDIgKzAxMDAsCj4+Pj4+IEh1aSBXYW5nIHdyb3RlOgo+PiBbc25pcF0K
Pj4+PiBPbiB0aGUgc2Vjb25kIHRob3VnaHQsIEkgd29uZGVyIHdoZXRoZXIgZWxkX3ZhbGlkIHdv
dWxkIGJlIGNvcnJlY3RlZAo+Pj4+IGxhdGVyIGJ5IHRoZSBncmFwaGljcyBzaWRlIGF0IGFsbC7C
oCBJZiB5ZXMsIGl0J3MgYSB0aW1pbmcgaXNzdWUsIGFuZAo+Pj4+IGl0IGNhbiBiZSBjb3JyZWN0
ZWQgd2l0aCB0aGUgcmVwb2xsaW5nLgo+Pj4+Cj4+Pj4gQSB0b3RhbGx5IHVudGVzdGVkIHBhdGNo
IGlzIGJlbG93Lgo+Pj4gSSB3aWxsIGJ1aWxkIGEgdGVzdGluZyBrZXJuZWwgd2l0aCB0aGlzIHBh
dGNoIGFuZCBsZXQgdGhlIGJ1Zwo+Pj4gcmVwb3J0ZXIgdGVzdCBpdC4KPj4+Cj4+PiBUaGFua3Ms
Cj4+Pgo+Pj4gSHVpLgo+PiBIZWxsbyBUYWthc2hpLAo+Pgo+PiBUZXN0ZWQgdGhlIHBhdGNoLMKg
IGl0IGRpZG4ndCB3b3JrLiBUaGUgZHJpdmVyIGFsd2F5cyBmYWlsZWQgdG8gcmVhZAo+PiB0aGUg
c3BlYWtlciBhbGxvY2F0aW9uIGZyb20gc25kX2hkbWlfZ2V0X2VsZF9hdGkoKS4KPj4KPj4gVGhp
cyBpcyB0aGUgZG1lc2cgYWZ0ZXIgYWRkaW5nIHRoZSBwYXRjaDoKPj4KPj4gaHR0cHM6Ly9sYXVu
Y2hwYWRsaWJyYXJpYW4ubmV0LzQ1MTQyMDgxOS9kbWVzZyAoYm90aCBwcmVzZW5jZSBhbmQKPj4g
ZWxkX3ZhbGlkIGJpdHMgYXJlIHNldCwgYnV0IGNhbid0IGdldCB0aGUgc3BlYWtlcl9hbGxvYykK
PiBTbyBpdCdzIGxpa2VseSBhIGJ1ZyBpbiB0aGUgZ3JhcGhpY3MgZHJpdmVyIDopCj4KPiBJbiBh
bnl3YXksIGl0IGluZGljYXRlcyB0aGF0IGl0J3Mgbm90IGFib3V0IGVsZF92YWxpZCBjaGVjayBp
dHNlbGYuCj4gVGhlIGVsZF92YWxpZCB3YXMgcmV0dXJuZWQgY29ycmVjdGx5IHRvZ2V0aGVyIHdp
dGggdGhlIG1vbml0b3JfcHJlc2VudAo+IGZsYWcuCj4KPiBJIGd1ZXNzIHRoZSBzeXN0ZW0gd29y
a2VkIGNhc3VhbGx5IHdpdGggeW91ciBwYXRjaCB0byBpZ25vcmUgZWxkX3ZhbGlkCj4gYmVjYXVz
ZSB3ZSBkb24ndCBjYXJlIG11Y2ggYWJvdXQgdGhlIGNoYW5uZWwgbWFwcGluZyBpZiBjaGFubmVs
cyA8PSAyLgo+IElPVywgYW5vdGhlciB3b3JrYXJvdW5kIHdvdWxkIGJlIHRvIGlnbm9yZSB0aGUg
ZXJyb3IgaWYgY2hhbm5lbHMgPD0KPiAyLgo+Cj4gQnV0IEkgd29uZGVyIHdoZXRoZXIgdGhpcyBz
dGF0ZSBwZXJzaXN0cyBhZnRlciB0aGlzIHJlc3VtZSBtb21lbnQuCj4gQ291bGQgeW91IGNoZWNr
IHdoYXQgaGFwcGVucyBpZiB5b3UgdW5sb2FkIC8gcmVsb2FkIHRoZSBIRC1hdWRpbwo+IGRyaXZl
cj8gIERvZXMgdGhlIHJlYWQgb2Ygc3BrX2FsbG9jIHN0aWxsIGZhaWw/CgpPSywgd2lsbCB0ZXN0
IGl0LgoKVGhhbmtzLAoKSHVpLgoKPgo+Cj4gdGhhbmtzLAo+Cj4gVGFrYXNoaQo+Cj4+IFJlZ2Fy
ZHMsCj4+Cj4+IEh1aS4KPj4KPj4KPj4+Cj4+Pj4gdGhhbmtzLAo+Pj4+Cj4+Pj4gVGFrYXNoaQo+
Pj4+Cj4+Pj4gLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9oZG1pLmMKPj4+PiArKysgYi9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX2hkbWkuYwo+Pj4+IEBAIC0xNTQ5LDE5ICsxNTQ5LDI1IEBAIHN0YXRp
YyBib29sCj4+Pj4gaGRtaV9wcmVzZW50X3NlbnNlX3ZpYV92ZXJicyhzdHJ1Y3QgaGRtaV9zcGVj
X3Blcl9waW4gKnBlcl9waW4sCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvX3Jl
cG9sbCA9IHRydWU7Cj4+Pj4gIMKgwqDCoMKgwqAgfQo+Pj4+ICDCoCAtwqDCoMKgIGlmIChkb19y
ZXBvbGwpCj4+Pj4gK8KgwqDCoCBkb19yZXBvbGwgfD0gcmVwb2xsICYmIGVsZC0+ZWxkX3ZhbGlk
ICE9IGVsZC0+bW9uaXRvcl9wcmVzZW50Owo+Pj4+ICvCoMKgwqAgaWYgKGRvX3JlcG9sbCkgewo+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWR1bGVfZGVsYXllZF93b3JrKCZwZXJfcGluLT53
b3JrLCBtc2Vjc190b19qaWZmaWVzKDMwMCkpOwo+Pj4+IC3CoMKgwqAgZWxzZQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCByZXQgPSBmYWxzZTsKPj4+PiArwqDCoMKgIH0gZWxzZSB7Cj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCB1cGRhdGVfZWxkKGNvZGVjLCBwZXJfcGluLCBlbGQpOwo+Pj4+IC0KPj4+
PiAtwqDCoMKgIHJldCA9ICFyZXBvbGwgfHwgIWVsZC0+bW9uaXRvcl9wcmVzZW50IHx8IGVsZC0+
ZWxkX3ZhbGlkOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwZXJfcGluLT5yZXBvbGxfY291bnQgPSAw
Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSB0cnVlOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICDC
oCDCoMKgwqDCoMKgIGphY2sgPSBzbmRfaGRhX2phY2tfdGJsX2dldChjb2RlYywgcGluX25pZCk7
Cj4+Pj4gIMKgwqDCoMKgwqAgaWYgKGphY2spIHsKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGph
Y2stPmJsb2NrX3JlcG9ydCA9ICFyZXQ7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGphY2stPnBpbl9z
ZW5zZSA9IChlbGQtPm1vbml0b3JfcHJlc2VudCAmJiBlbGQtPmVsZF92YWxpZCkgPwo+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFDX1BJTlNFTlNFX1BSRVNFTkNFIDogMDsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKHJldCkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGphY2st
PnBpbl9zZW5zZSA9IChlbGQtPm1vbml0b3JfcHJlc2VudCAmJgo+Pj4+IGVsZC0+ZWxkX3ZhbGlk
KSA/Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBQ19QSU5TRU5TRV9QUkVT
RU5DRSA6IDA7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiAgwqDCoMKgwqDCoCB9Cj4+Pj4g
Kwo+Pj4+ICDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmcGVyX3Bpbi0+bG9jayk7Cj4+Pj4gIMKg
wqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+PiAgwqAgfQo+Pj4+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+
IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
