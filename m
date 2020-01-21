Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A321143B89
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 12:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 000691683;
	Tue, 21 Jan 2020 12:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 000691683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579604507;
	bh=CgtlWSlujZZQqhfvC+wPOBkn6RjYcpX+BHyItDY0p8E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/3AAnwHn1LxQqhQ9vlgoBaR2z30eDmPhPPA72R7HtYiH25txFCTSXeNThsBPzgkO
	 KPTjEYTV7ZP6nQm4+E0D1kywmCNTX3LaiH975eyC55v02/LuUem66825SbFeJc0XEC
	 Hll6M/JomWERSNh/ry9LM085mERch5uxOecLZm3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A4BF8015B;
	Tue, 21 Jan 2020 12:00:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C34FDF801ED; Tue, 21 Jan 2020 12:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F2BBF8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 11:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F2BBF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="TRfYA+EJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=DRWn4/oyjvu9yg0fXuOpzvAmZIC+840Xa7G9eSFCcpM=; b=TRfYA+EJNOrozpXROLKwvE2s1+
 yqjrM5NR8lTtV/4z/7RDt7Okk0dXInTmlzvX2Km/UlMMQ5WQJQQ0z7qxdDoeQtv6uw83RbXQa5G9G
 1e75NFhoLNyzB2U0dcwZI1MLAFjmDspCNQJfWsaA8ZChyYCjZMtElINOZoVtZSfiaadQ=;
Received: from [10.8.10.223] (helo=work)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1itrGJ-000EcW-2y; Tue, 21 Jan 2020 13:59:59 +0300
Message-ID: <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
From: Alexander Tsoy <alexander@tsoy.me>
To: Tobias <toszlanyi@yahoo.de>, alsa-devel@alsa-project.org
Date: Tue, 21 Jan 2020 13:59:57 +0300
In-Reply-To: <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
 <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <697208e751dcbcc70cf00af7b625a4109b9c66cb.camel@tsoy.me>
 <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] USB Audio Interface / Denon MC7000 and MC8000
 controller
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

UGxlYXNlIHRyeSB0aGUgcGF0Y2ggYmVsb3cuIE1ha2Ugc3VyZSB0aGF0IG5vIG90aGVyIHBhdGNo
ZXMgYXJlIGFwcGxpZWQuCgpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5jIGIvc291bmQv
dXNiL3F1aXJrcy5jCmluZGV4IDgyMTg0MDM2NDM3Yi4uNzI2NGY1N2QzMTg4IDEwMDY0NAotLS0g
YS9zb3VuZC91c2IvcXVpcmtzLmMKKysrIGIvc291bmQvdXNiL3F1aXJrcy5jCkBAIC0xNTUzLDYg
KzE1NTMsMTMgQEAgdm9pZCBzbmRfdXNiX2N0bF9tc2dfcXVpcmsoc3RydWN0IHVzYl9kZXZpY2Ug
KmRldiwgdW5zaWduZWQgaW50IHBpcGUsCiAJICAgICYmIChyZXF1ZXN0dHlwZSAmIFVTQl9UWVBF
X01BU0spID09IFVTQl9UWVBFX0NMQVNTKQogCQltc2xlZXAoMjApOwogCisJLyoKKwkgKiBEZW5v
biBNQzcwMDAKKwkgKi8KKwlpZiAoY2hpcC0+dXNiX2lkID09IFVTQl9JRCgweDE1ZTQsIDB4ODAw
NCkgJiYKKwkgICAgKHJlcXVlc3R0eXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfQ0xB
U1MpCisJCW1zbGVlcCgyMCk7CisKIAkvKiBab29tIFIxNi8yNCwgTG9naXRlY2ggSDY1MGUsIEph
YnJhIDU1MGEgbmVlZHMgYSB0aW55IGRlbGF5IGhlcmUsCiAJICogb3RoZXJ3aXNlIHJlcXVlc3Rz
IGxpa2UgZ2V0L3NldCBmcmVxdWVuY3kgcmV0dXJuIGFzIGZhaWxlZCBkZXNwaXRlCiAJICogYWN0
dWFsbHkgc3VjY2VlZGluZy4KCgrQkiDQktGCLCAyMS8wMS8yMDIwINCyIDA5OjE3ICswMTAwLCBU
b2JpYXMg0L/QuNGI0LXRgjoKPiBUaGFua3MgYSBsb3QgZm9yIHRoZSBoaW50IEFsZXhhbmRlci4g
QW55aG93LCBJIGFtIG5vdCBzdXJlIHdoZXJlIHRvIHB1dCAKPiB0aGF0Lgo+IEFsc28gVGFrYXNo
aSBJd2FpIHdhcyBpbnZvbHZlZCBhbHJlYWR5IGFuZCBJIHdvdWxkIGxpa2UgdG8gcHJldmVudCAK
PiBtaXhpbmcgdXAgdGhpbmdzIG9yIGRvdWJsZSB3b3JrLgo+IAo+IFBsZWFzZSBhZHZpc2UgaW4g
ZGV0YWlsIHdoYXQgSSB3b3VsZCBuZWVkIHRvIGRvIGFzIEkgYW0gbm90IGEgcHJvZ3JhbW1lci4K
PiAKPiBUaGFua3MgYSBsb3QuCj4gVG9iaWFzCj4gCj4gQW0gMjAuMDEuMjAgdW0gMDk6MjIgc2No
cmllYiBBbGV4YW5kZXIgVHNveToKPiA+INCSINCh0LEsIDE0LzEyLzIwMTkg0LIgMDk6MjQgKzAx
MDAsIFRvYmlhcyDQv9C40YjQtdGCOgo+ID4gPiBIZWxsbyBkZWFyIEFMU0EgZGV2ZWxvcGVycy4K
PiA+ID4gCj4gPiA+IEkgaGF2ZSBwdXJjaGFzZWQgYSBNQzcwMDAgY29udHJvbGxlciBpbiBvcmRl
ciB0byBjb250cm9sIE1JWFhYIG9uCj4gPiA+IFVidW50dQo+ID4gPiAxNi4wNC4gQWNjb3JkaW5n
IHRvIHRoZSBEZW5vbiBzcGVjaWZpY2F0aW9uIHRoZSBjb250cm9sbGVyIHNob3VsZAo+ID4gPiBo
YXZlCj4gPiA+IGJlZW4gY2xhc3MgY29tcGxpYW50IGJ1dCB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRo
IHRoZSBBdWRpbyBpbnRlcmZhY2UKPiA+ID4gdG8KPiA+ID4gd29yayBwcm9wZXJseSBnaXZpbmcg
Zm9sbG93aW5nIG1lc3NhZ2UgLi4uCj4gPiA+IAo+ID4gPiAkIGRtZXNnCj4gPiA+IC4uLgo+ID4g
PiA+IFsgICA3NC41MjI4MzFdIHVzYiAxLTEuMzogbmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBu
dW1iZXIgNiB1c2luZwo+ID4gPiA+IHhoY2lfaGNkCj4gPiA+IFsgICA3NC42MjM3ODRdIHVzYiAx
LTEuMzogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTE1ZTQsCj4gPiA+IGlkUHJvZHVj
dD04MDA0Cj4gPiA+IFsgICA3NC42MjM3ODldIHVzYiAxLTEuMzogTmV3IFVTQiBkZXZpY2Ugc3Ry
aW5nczogTWZyPTEsIFByb2R1Y3Q9MiwKPiA+ID4gU2VyaWFsTnVtYmVyPTMKPiA+ID4gWyAgIDc0
LjYyMzc5M10gdXNiIDEtMS4zOiBQcm9kdWN0OiBERU5PTiBESiBNQzcwMDAKPiA+ID4gWyAgIDc0
LjYyMzc5Nl0gdXNiIDEtMS4zOiBNYW51ZmFjdHVyZXI6IERFTk9OIERKCj4gPiA+IFsgICA3NC42
MjM3OThdIHVzYiAxLTEuMzogU2VyaWFsTnVtYmVyOiAyMDE2MDMKPiA+ID4gWyAgIDc0LjYyNTEz
NF0gdXNiIDEtMS4zOiBjbG9jayBzb3VyY2UgNjUgaXMgbm90IHZhbGlkLCBjYW5ub3QgdXNlCj4g
PiA+IAo+ID4gPiAifHx8Y2xvY2sgc291cmNlIDY1IGlzIG5vdCB2YWxpZCwgY2Fubm90IHVzZSIg
aXMgcmVwZWF0ZWQKPiA+ID4gdW5jb3VudGFibGUKPiA+ID4gdGltZXMgdGhlbgo+ID4gPiAKPiA+
IFBsZWFzZSB0cnkgdG8gYWRkIGRlbGF5IGFmdGVyIGVhY2ggY2xhc3MgY29udHJvbCByZXF1ZXN0
IGluCj4gPiBzbmRfdXNiX2N0bF9tc2dfcXVpcmsoKToKPiA+IAo+ID4gICAgICBpZiAoY2hpcC0+
dXNiX2lkID09IFVTQl9JRCgweDE1ZTQsIDB4ODAwNCkgJiYKPiA+ICAgICAgICAgIChyZXF1ZXN0
dHlwZSAmIFVTQl9UWVBFX01BU0spID09IFVTQl9UWVBFX0NMQVNTKQo+ID4gICAgICAgICAgbXNs
ZWVwKDIwKTsKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
