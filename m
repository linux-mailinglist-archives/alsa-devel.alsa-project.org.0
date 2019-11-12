Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0EF8F9A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 13:23:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 482321669;
	Tue, 12 Nov 2019 13:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 482321669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573561413;
	bh=FmPoezD53dU92vNNt8axCFeNv9D54wBl881HAqMTDHE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/kFi43yfVCskZGa8gGKttD1zV/XA94uEasrsJTO0TKdJbG/BTrw9EWL5AhSVOVMW
	 te8/6vty3UhZBnMCnZ+f8+4ybMFCvbvrT7AyGYhrI+L/BXL3OrjswAagjcC8l+MOBM
	 ujUgwUr2E9tmTqagz71cTcm3XT7Qr1y9BPPOjw30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7986AF8048F;
	Tue, 12 Nov 2019 13:21:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93B9FF80483; Tue, 12 Nov 2019 13:21:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEC6F80144
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 13:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEC6F80144
Received: from [111.196.69.240] (helo=[192.168.1.103])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1iUVB1-0004Fc-O9; Tue, 12 Nov 2019 12:21:44 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191111144502.22910-1-hui.wang@canonical.com>
 <s5h7e46whpi.wl-tiwai@suse.de> <s5hzhh2v1pw.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <cf190a1c-ec4c-0031-f1af-c3bfdd1acc85@canonical.com>
Date: Tue, 12 Nov 2019 20:21:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5hzhh2v1pw.wl-tiwai@suse.de>
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

Ck9uIDIwMTkvMTEvMTIg5LiK5Y2IMTI6MDQsIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBNb24s
IDExIE5vdiAyMDE5IDE2OjMzOjQ1ICswMTAwLAo+IFRha2FzaGkgSXdhaSB3cm90ZToKPj4gT24g
TW9uLCAxMSBOb3YgMjAxOSAxNTo0NTowMiArMDEwMCwKPj4gSHVpIFdhbmcgd3JvdGU6Cj4+PiBX
aXRoIHRoZSBjb21taXQgN2Y2NDFlMjZhNmRmICgiQUxTQTogaGRhL2hkbWkgLSBDb25zaWRlciBl
bGRfdmFsaWQKPj4+IHdoZW4gcmVwb3J0aW5nIGphY2sgZXZlbnQiKSwgdGhlIGRyaXZlciBjaGVj
a3MgZWxkX3ZhbGlkIGJlZm9yZQo+Pj4gcmVwb3J0aW5nIEphY2sgc3RhdGUsIHRoaXMgZml4ZXMg
dGhlIDQgSERNSS9EUCBhdWRpbyBkZXZpY2VzIGlzc3VlLgo+Pj4KPj4+IEJ1dCByZWNlbnRseSBz
b21lIHVzZXJzIGNvbXBsYWluZWQgdGhhdCB0aGUgaGRtaSBhdWRpbyBvbiB0aGVpcgo+Pj4gbWFj
aGluZXMgY291bGRuJ3Qgd29yayBhbnltb3JlIHdpdGggdGhpcyBjb21taXQuIE9uIHRoZWlyIG1h
Y2hpbmVzLAo+Pj4gdGhlIG1vbml0b3JfcHJlc2VudCBpcyAxIHdoaWxlIHRoZSBlbGRfdmFsaWQg
aXMgMCB3aGVuIHBsdWdnaW5nIGEKPj4+IG1vbml0b3IsIGFuZCB0aGUgaGRtaSBhdWRpbyBjb3Vs
ZCB3b3JrIGV2ZW4gdGhlIGVsZF92YWxpZCBpcyAwLgo+Pj4KPj4+IFRvIG1ha2UgdGhlIGhkbWkg
YXVkaW8gd29yayBhZ2FpbiBvbiB0aG9zZSBtYWNoaW5lcywgYWRkaW5nIGEgbW9kdWxlCj4+PiBw
YXJhbWV0ZXIsIGlmIHVzcnMgd2FudCB0byBza2lwIHRoZSBjaGVja2luZyBlbGRfdmFsaWQsIHRo
ZXkKPj4+IGNvdWxkIHNldCBjaGVja2luZ19lbGRfdmFsaWQ9MCB3aGVuIGxvYWRpbmcgdGhlIG1v
ZHVsZS4gQW5kIHRoaXMKPj4+IHBhcmFtZXRlciBvbmx5IGFwcGxpZXMgdG8gc2Vuc2VfdmlhX3Zl
cmJzLCBmb3IgdGhvc2UgZ2V0dGluZyBlbGQgdmlhCj4+PiBjb21wb25lbnQsIG5vIG5lZWQgdG8g
YXBwbHkgdGhpcyBwYXJhbWV0ZXIgc2luY2UgaXQgaXMgaW1wb3NzaWJsZQo+Pj4gdGhhdCBwcmVz
ZW50IGlzIDEgd2hpbGUgZWxkX3ZhbGlkIGlzIDAuCj4+Pgo+Pj4gQnVnTGluazogaHR0cHM6Ly9i
dWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xODM0NzcxCj4+PiBGaXhlczogN2Y2NDFlMjZhNmRmICgi
QUxTQTogaGRhL2hkbWkgLSBDb25zaWRlciBlbGRfdmFsaWQgd2hlbiByZXBvcnRpbmcgamFjayBl
dmVudCIpCj4+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBIdWkgV2FuZyA8aHVpLndhbmdAY2Fub25pY2FsLmNvbT4KPj4gV2VsbCwgdGhpcyBzb3J0IG9m
IG1vZHVsZSBvcHRpb24gaXMgcmF0aGVyIGEgbGFzdCByZXNvcnQsIHNvIEkKPj4gaGVzaXRhdGUg
dG8gYXBwbHkgdGhpcy4KPj4KPj4gVGhlIGJ1ZyByZXBvcnRzIGluIHRoZSBhYm92ZSBhcmUgYSBi
aXQgaGFyZCB0byBkaWdlc3QgcXVpY2tseS4KPj4gQ291bGQgeW91IHRlbGwgZXhhY3RseSB3aGlj
aCBoYXJkd2FyZSAoYW5kIGRyaXZlcnMpIHNob3cgdGhlIHByb2JsZW0/Cj4+Cj4+IEZXSVcsIGFt
ZGdwdSBkcml2ZXIgYWxyZWFkeSBnb3QgdGhlIGF1ZGlvLWNvbXBvbmVudCBiaW5kaW5nIHJlY2Vu
dGx5LAo+PiBzbyB0aGlzIHByb2JsZW0gc2hvdWxkbid0IGJlIHRyaWdnZXJlZCwgYXQgbGVhc3Qg
aW4gdGhpcyBjb2RlIHBhdGguCj4+IEFuZCwgZm9yIG5vdXZlYXUgYW5kIHJhZGVvbiwgSSBhbHJl
YWR5IHN1Ym1pdHRlZCB0aGUgcGF0Y2hlcyB0bwo+PiBzdXBwb3J0IHRoZSBhdWRpby1jb21wb25l
bnQgYmluZGluZywgYnV0IGJ5IHNvbWUgcmVhc29uIHRoZXkgaGF2ZW4ndAo+PiBiZWVuIG1lcmdl
ZCB0byB0aGUgdXBzdHJlYW0uICBJbiB0aGF0IGNhc2UsIHdlJ2QgbmVlZCB0byBwaW5nIERSTQo+
PiBndXlzLgoKSSBrbm93IHRoZSBhbWRncHUgZHJpdmVyIGFscmVhZHkgc3VwcG9ydGVkIGF1ZGlv
LWNvbXBvbmVudCwgSSBndWVzcyBpdCAKd2lsbCBmaXggdGhpcyBwcm9ibGVtLiBCdXQgaXQgaXMg
bm90IGVhc3kgdG8gYmFja3BvcnQgdGhlIHJlbGF0ZWQgCnBhdGNoZXMgdG8gdWJ1bnR1IDQuMTUg
YW5kIDUuMCBrZXJuZWxzLiBJdCB3aWxsIGJlIGJldHRlciBpZiB3ZSBjb3VsZCAKZmlndXJlIG91
dCBhIGZpeCBmb3Igc2Vuc2VfdmlhX3ZlcmJzKCkgdG9vLiA6LSkKCgo+IE9uIHRoZSBzZWNvbmQg
dGhvdWdodCwgSSB3b25kZXIgd2hldGhlciBlbGRfdmFsaWQgd291bGQgYmUgY29ycmVjdGVkCj4g
bGF0ZXIgYnkgdGhlIGdyYXBoaWNzIHNpZGUgYXQgYWxsLiAgSWYgeWVzLCBpdCdzIGEgdGltaW5n
IGlzc3VlLCBhbmQKPiBpdCBjYW4gYmUgY29ycmVjdGVkIHdpdGggdGhlIHJlcG9sbGluZy4KPgo+
IEEgdG90YWxseSB1bnRlc3RlZCBwYXRjaCBpcyBiZWxvdy4KCkkgd2lsbCBidWlsZCBhIHRlc3Rp
bmcga2VybmVsIHdpdGggdGhpcyBwYXRjaCBhbmQgbGV0IHRoZSBidWcgcmVwb3J0ZXIgCnRlc3Qg
aXQuCgpUaGFua3MsCgpIdWkuCgoKPgo+IHRoYW5rcywKPgo+IFRha2FzaGkKPgo+IC0tLSBhL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jCj4gKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9oZG1p
LmMKPiBAQCAtMTU0OSwxOSArMTU0OSwyNSBAQCBzdGF0aWMgYm9vbCBoZG1pX3ByZXNlbnRfc2Vu
c2VfdmlhX3ZlcmJzKHN0cnVjdCBoZG1pX3NwZWNfcGVyX3BpbiAqcGVyX3BpbiwKPiAgIAkJCWRv
X3JlcG9sbCA9IHRydWU7Cj4gICAJfQo+ICAgCj4gLQlpZiAoZG9fcmVwb2xsKQo+ICsJZG9fcmVw
b2xsIHw9IHJlcG9sbCAmJiBlbGQtPmVsZF92YWxpZCAhPSBlbGQtPm1vbml0b3JfcHJlc2VudDsK
PiArCWlmIChkb19yZXBvbGwpIHsKPiAgIAkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZwZXJfcGlu
LT53b3JrLCBtc2Vjc190b19qaWZmaWVzKDMwMCkpOwo+IC0JZWxzZQo+ICsJCXJldCA9IGZhbHNl
Owo+ICsJfSBlbHNlIHsKPiAgIAkJdXBkYXRlX2VsZChjb2RlYywgcGVyX3BpbiwgZWxkKTsKPiAt
Cj4gLQlyZXQgPSAhcmVwb2xsIHx8ICFlbGQtPm1vbml0b3JfcHJlc2VudCB8fCBlbGQtPmVsZF92
YWxpZDsKPiArCQlwZXJfcGluLT5yZXBvbGxfY291bnQgPSAwOwo+ICsJCXJldCA9IHRydWU7Cj4g
Kwl9Cj4gICAKPiAgIAlqYWNrID0gc25kX2hkYV9qYWNrX3RibF9nZXQoY29kZWMsIHBpbl9uaWQp
Owo+ICAgCWlmIChqYWNrKSB7Cj4gICAJCWphY2stPmJsb2NrX3JlcG9ydCA9ICFyZXQ7Cj4gLQkJ
amFjay0+cGluX3NlbnNlID0gKGVsZC0+bW9uaXRvcl9wcmVzZW50ICYmIGVsZC0+ZWxkX3ZhbGlk
KSA/Cj4gLQkJCUFDX1BJTlNFTlNFX1BSRVNFTkNFIDogMDsKPiArCQlpZiAocmV0KSB7Cj4gKwkJ
CWphY2stPnBpbl9zZW5zZSA9IChlbGQtPm1vbml0b3JfcHJlc2VudCAmJiBlbGQtPmVsZF92YWxp
ZCkgPwo+ICsJCQkJQUNfUElOU0VOU0VfUFJFU0VOQ0UgOiAwOwo+ICsJCX0KPiAgIAl9Cj4gKwo+
ICAgCW11dGV4X3VubG9jaygmcGVyX3Bpbi0+bG9jayk7Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0K
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
