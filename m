Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65890FFD91
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 05:42:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2083168B;
	Mon, 18 Nov 2019 05:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2083168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574052170;
	bh=mqfN7zERI6cbpZnSARBgnmX/Stb2/d+b82HHAd5oE4Y=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ujQK9CO45R2XSO95WrrfHOhytMKYQ94oAHhVcE6SUaiFREapkod7REE3zG5d+/EuH
	 l84iSVfXiUmCVH8tZfNV30BqQW44cifvZziYBYxZ+w4WQSVOIyAPa/QP/GG6afUd3S
	 FFG1PcfEVij0hUbRvidhPSbg38rXak3N63GX/ehQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6AB1F8011A;
	Mon, 18 Nov 2019 05:41:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF9AF8013B; Mon, 18 Nov 2019 05:41:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9ACFF800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 05:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9ACFF800F1
Received: from 61-220-137-34.hinet-ip.hinet.net ([61.220.137.34]
 helo=[10.101.195.16]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1iWYqP-0003kk-4e; Mon, 18 Nov 2019 04:40:57 +0000
From: Hui Wang <hui.wang@canonical.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20191111144502.22910-1-hui.wang@canonical.com>
 <s5h7e46whpi.wl-tiwai@suse.de> <s5hzhh2v1pw.wl-tiwai@suse.de>
 <cf190a1c-ec4c-0031-f1af-c3bfdd1acc85@canonical.com>
Message-ID: <5af71ae2-2a1e-cb75-cfce-7228c433a957@canonical.com>
Date: Mon, 18 Nov 2019 12:40:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cf190a1c-ec4c-0031-f1af-c3bfdd1acc85@canonical.com>
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

Ck9uIDIwMTkvMTEvMTIg5LiL5Y2IODoyMSwgSHVpIFdhbmcgd3JvdGU6Cj4KPiBPbiAyMDE5LzEx
LzEyIOS4iuWNiDEyOjA0LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+IE9uIE1vbiwgMTEgTm92IDIw
MTkgMTY6MzM6NDUgKzAxMDAsCj4+IFRha2FzaGkgSXdhaSB3cm90ZToKPj4+IE9uIE1vbiwgMTEg
Tm92IDIwMTkgMTU6NDU6MDIgKzAxMDAsCj4+PiBIdWkgV2FuZyB3cm90ZToKPgpbc25pcF0KPj4g
T24gdGhlIHNlY29uZCB0aG91Z2h0LCBJIHdvbmRlciB3aGV0aGVyIGVsZF92YWxpZCB3b3VsZCBi
ZSBjb3JyZWN0ZWQKPj4gbGF0ZXIgYnkgdGhlIGdyYXBoaWNzIHNpZGUgYXQgYWxsLsKgIElmIHll
cywgaXQncyBhIHRpbWluZyBpc3N1ZSwgYW5kCj4+IGl0IGNhbiBiZSBjb3JyZWN0ZWQgd2l0aCB0
aGUgcmVwb2xsaW5nLgo+Pgo+PiBBIHRvdGFsbHkgdW50ZXN0ZWQgcGF0Y2ggaXMgYmVsb3cuCj4K
PiBJIHdpbGwgYnVpbGQgYSB0ZXN0aW5nIGtlcm5lbCB3aXRoIHRoaXMgcGF0Y2ggYW5kIGxldCB0
aGUgYnVnIHJlcG9ydGVyIAo+IHRlc3QgaXQuCj4KPiBUaGFua3MsCj4KPiBIdWkuCgpIZWxsbyBU
YWthc2hpLAoKVGVzdGVkIHRoZSBwYXRjaCzCoCBpdCBkaWRuJ3Qgd29yay4gVGhlIGRyaXZlciBh
bHdheXMgZmFpbGVkIHRvIHJlYWQgdGhlIApzcGVha2VyIGFsbG9jYXRpb24gZnJvbSBzbmRfaGRt
aV9nZXRfZWxkX2F0aSgpLgoKVGhpcyBpcyB0aGUgZG1lc2cgYWZ0ZXIgYWRkaW5nIHRoZSBwYXRj
aDoKCmh0dHBzOi8vbGF1bmNocGFkbGlicmFyaWFuLm5ldC80NTE0MjA4MTkvZG1lc2cgKGJvdGgg
cHJlc2VuY2UgYW5kIAplbGRfdmFsaWQgYml0cyBhcmUgc2V0LCBidXQgY2FuJ3QgZ2V0IHRoZSBz
cGVha2VyX2FsbG9jKQoKUmVnYXJkcywKCkh1aS4KCgo+Cj4KPj4KPj4gdGhhbmtzLAo+Pgo+PiBU
YWthc2hpCj4+Cj4+IC0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jCj4+ICsrKyBiL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jCj4+IEBAIC0xNTQ5LDE5ICsxNTQ5LDI1IEBAIHN0YXRp
YyBib29sIAo+PiBoZG1pX3ByZXNlbnRfc2Vuc2VfdmlhX3ZlcmJzKHN0cnVjdCBoZG1pX3NwZWNf
cGVyX3BpbiAqcGVyX3BpbiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9fcmVwb2xs
ID0gdHJ1ZTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAgaWYgKGRvX3JlcG9sbCkKPj4g
K8KgwqDCoCBkb19yZXBvbGwgfD0gcmVwb2xsICYmIGVsZC0+ZWxkX3ZhbGlkICE9IGVsZC0+bW9u
aXRvcl9wcmVzZW50Owo+PiArwqDCoMKgIGlmIChkb19yZXBvbGwpIHsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHNjaGVkdWxlX2RlbGF5ZWRfd29yaygmcGVyX3Bpbi0+d29yaywgbXNlY3NfdG9famlm
ZmllcygzMDApKTsKPj4gLcKgwqDCoCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBmYWxz
ZTsKPj4gK8KgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdXBkYXRlX2VsZChj
b2RlYywgcGVyX3BpbiwgZWxkKTsKPj4gLQo+PiAtwqDCoMKgIHJldCA9ICFyZXBvbGwgfHwgIWVs
ZC0+bW9uaXRvcl9wcmVzZW50IHx8IGVsZC0+ZWxkX3ZhbGlkOwo+PiArwqDCoMKgwqDCoMKgwqAg
cGVyX3Bpbi0+cmVwb2xsX2NvdW50ID0gMDsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IHRydWU7
Cj4+ICvCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIGphY2sgPSBzbmRfaGRhX2phY2tfdGJsX2dl
dChjb2RlYywgcGluX25pZCk7Cj4+IMKgwqDCoMKgwqAgaWYgKGphY2spIHsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGphY2stPmJsb2NrX3JlcG9ydCA9ICFyZXQ7Cj4+IC3CoMKgwqDCoMKgwqDCoCBq
YWNrLT5waW5fc2Vuc2UgPSAoZWxkLT5tb25pdG9yX3ByZXNlbnQgJiYgZWxkLT5lbGRfdmFsaWQp
ID8KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUNfUElOU0VOU0VfUFJFU0VOQ0UgOiAwOwo+
PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBq
YWNrLT5waW5fc2Vuc2UgPSAoZWxkLT5tb25pdG9yX3ByZXNlbnQgJiYgCj4+IGVsZC0+ZWxkX3Zh
bGlkKSA/Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUNfUElOU0VOU0VfUFJF
U0VOQ0UgOiAwOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIH0KPj4gKwo+PiDC
oMKgwqDCoMKgIG11dGV4X3VubG9jaygmcGVyX3Bpbi0+bG9jayk7Cj4+IMKgwqDCoMKgwqAgcmV0
dXJuIHJldDsKPj4gwqAgfQo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
