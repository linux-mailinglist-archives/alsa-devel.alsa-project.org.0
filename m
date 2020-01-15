Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA3813C7F1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 16:35:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC4917AF;
	Wed, 15 Jan 2020 16:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC4917AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579102538;
	bh=sV+CaPAtdJEmtlb1rjVSEijaBnjDN76s7QyvRXBKxGo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ga92abIP4aZU8T5RpJLBLKMKpH6PrcRUziKepA4SA+wfQJNn4OmEx4qsr23aM3zvW
	 qKIqqakpSs7UBE5lUbVDqJcmfV9BA/U3Qn2ZvHHL1DlgVDfgJSCcWpC9jTqC3V0d1/
	 r1CA4lYBvylzf9hJYPpn+PTYSqxQieTe1+dHRDU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99A1FF801F7;
	Wed, 15 Jan 2020 16:33:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC202F801EB; Wed, 15 Jan 2020 16:33:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FC72F800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 16:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC72F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="SUGRu5OM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=5QpAOiuXL0w06koWvSCpd7aO5OMVCafivpL9cXieuvw=; b=SUGRu5OMRGZ9wskrO80agFIHDB
 Ke+VxnAcHvx86JQg/+yMHVdWvXStxbq4aUomdynlWv5EYJDKxTcbWQOX+V2SdTIjphNj+GKjldLZw
 50CHpT3aM9umwZqahOSRystQppZ8edvle8S2GreaEa90IJanh/5mrpiArx9TamWcjJVc=;
Received: from [10.8.10.223] (helo=work)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1irkft-0005P8-T7; Wed, 15 Jan 2020 18:33:41 +0300
Message-ID: <9a0016059514fec8b8ae0e179c032cb2485df04d.camel@tsoy.me>
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, Robert Giaraffa <Robert.Giaraffa@silabs.com>
Date: Wed, 15 Jan 2020 18:33:40 +0300
In-Reply-To: <s5hzhurfp5w.wl-tiwai@suse.de>
References: <BN7PR11MB2755B1BC150703C0DFC2DA919CCC0@BN7PR11MB2755.namprd11.prod.outlook.com>
 <s5hy3aeuy4v.wl-tiwai@suse.de>
 <DM6PR11MB2761AF2D51CECFC2951C97259CCD0@DM6PR11MB2761.namprd11.prod.outlook.com>
 <s5hzhurfp5w.wl-tiwai@suse.de>
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [alsa-devel] [EXT] Re: Simultaneous play/record on implicit
 feedback device causes 'endpoint in use' error
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

0JIg0J/RgiwgMDIvMTEvMjAxOCDQsiAxNjo1NyArMDEwMCwgVGFrYXNoaSBJd2FpINC/0LjRiNC1
0YI6Cj4gT24gV2VkLCAzMSBPY3QgMjAxOCAyMDo0NTowNyArMDEwMCwKPiBSb2JlcnQgR2lhcmFm
ZmEgd3JvdGU6Cj4gPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHByb21wdCByZXNwb25z
ZS4KPiA+IAo+ID4gSSB0ZXN0ZWQgdGhlIENQMjYxNSBhbmQgRmFzdCBUcmFjayBVbHRyYSBieSBy
dW5uaW5nIGFwbGF5IGFuZAo+ID4gYXJlY29yZAo+ID4gc2VxdWVudGlhbGx5IG9uIG15IFJQaTIg
djQuMTQuNzIgKHdpdGggcGF0Y2hlZCBzbmQtdXNiLWF1ZGlvLmtvCj4gPiB0aGF0IGluY2x1ZGVz
Cj4gPiBpbXBsaWNpdCBmZWVkYmFjayBxdWlyayBmb3IgQ1AyNjE1KS4gIEFsdGhvdWdoIHRoZXJl
IHdlcmUgbWlub3IKPiA+IGRpZmZlcmVuY2VzIGluCj4gPiB0aGUgc3lzdGVtIGxvZ3MgZm9yIHRo
ZSB0d28gZGV2aWNlcyAoZS5nLiDigJhjYW5ub3Qgc3VibWl0IHVyYuKAmSksIGJ1dAo+ID4gb3Ro
ZXJ3aXNlCj4gPiBib3RoIGRldmljZXMgYmVoYXZlZCB0aGUgc2FtZTogd2hpY2hldmVyIG9wZXJh
dGlvbiBpcyBzdGFydGVkIGxhc3QKPiA+IHJlc3VsdGVkIGluCj4gPiB0aGUgJ0VuZHBvaW50IGFs
cmVhZHkgaW4gdXNlJyBlcnJvciwgcmVnYXJkbGVzcyBvZgo+ID4gc2VxdWVuY2UuICBEZXRhaWxl
ZCBpbmZvCj4gPiBiZWxvdzoKPiAKPiBPSywgc28gd2Ugb2J2aW91c2x5IGRvbid0IHN1cHBvcnQg
dGhlIGZ1bGwgZHVwbGV4IGluIHRoaXMgbW9kZS4KPiAKPiBBcyBhIGZpcnN0IHN0ZXAsIGNvdWxk
IHlvdSB0cnkgdGhlIHNpbXBsZSBwYXRjaCBiZWxvdywgYW5kIHRlc3QgaW4gYQo+IHNlcXVlbmNl
IHJlY29yZCAtPiBwbGF5YmFjaz8gIEF0IGxlYXN0IGl0IHNob3VsZCBza2lwIHRoZSBjaGVjaywg
YW5kCj4gcHJvY2VlZCBmdXJ0aGVyLgo+IAo+IAo+IHRoYW5rcywKPiAKPiBUYWthc2hpCj4gCj4g
LS0tIGEvc291bmQvdXNiL3BjbS5jCj4gKysrIGIvc291bmQvdXNiL3BjbS5jCj4gQEAgLTYzOSw2
ICs2MzksMTAgQEAgc3RhdGljIGludCBjb25maWd1cmVfc3luY19lbmRwb2ludChzdHJ1Y3QKPiBz
bmRfdXNiX3N1YnN0cmVhbSAqc3VicykKPiAgCQkJCQkJICAgc3Vicy0+Y3VyX2F1ZGlvZm10LAo+
ICAJCQkJCQkgICBOVUxMKTsKPiAgCj4gKwlpZiAoc3Vicy0+c3luY19lbmRwb2ludC0+dHlwZSA9
PSBTTkRfVVNCX0VORFBPSU5UX1RZUEVfREFUQSAmJgo+ICsJICAgIHN1YnMtPnN5bmNfZW5kcG9p
bnQtPnVzZV9jb3VudCkKPiArCQlyZXR1cm4gMDsKPiArCj4gIAkvKiBUcnkgdG8gZmluZCB0aGUg
YmVzdCBtYXRjaGluZyBhdWRpb2Zvcm1hdC4gKi8KPiAgCWxpc3RfZm9yX2VhY2hfZW50cnkoZnAs
ICZzeW5jX3N1YnMtPmZtdF9saXN0LCBsaXN0KSB7Cj4gIAkJaW50IHNjb3JlID0gbWF0Y2hfZW5k
cG9pbnRfYXVkaW9mb3JtYXRzKHN1YnMsCgpXZWxsLCB0aGlzIHdvcmtzLi4uIHNvcnQgb2Y6Cgpb
ICAxMDcuMzY4MjE4XSB1c2IgNS0xOiBzZXR0aW5nIHVzYiBpbnRlcmZhY2UgMjoxClsgIDEwNy4z
NjgyMjVdIHVzYiA1LTE6IENyZWF0aW5nIG5ldyBjYXB0dXJlIGRhdGEgZW5kcG9pbnQgIzgxClsg
IDEwNy44MzQxMzldIHVzYiA1LTE6IFNldHRpbmcgcGFyYW1zIGZvciBlcCAjODEgKHR5cGUgMCwg
MTIgdXJicyksCnJldD0wClsgIDEwNy44MzQyNzJdIHVzYiA1LTE6IFN0YXJ0aW5nIGRhdGEgRVAg
QDAwMDAwMDAwYTgwMmI4ZWYKWyAgMTEwLjI5Njc3M10gdXNiIDUtMTogc2V0dGluZyB1c2IgaW50
ZXJmYWNlIDE6MQpbICAxMTAuMjk2Nzc5XSB1c2IgNS0xOiBDcmVhdGluZyBuZXcgcGxheWJhY2sg
ZGF0YSBlbmRwb2ludCAjMQpbICAxMTAuMjk2ODExXSB1c2IgNS0xOiBSZS11c2luZyBFUCA4MSBp
biBpZmFjZSAyLDEgQDAwMDAwMDAwYTgwMmI4ZWYKWyAgMTEwLjI5ODM4MV0gdXNiIDUtMTogU2V0
dGluZyBwYXJhbXMgZm9yIGVwICMxICh0eXBlIDAsIDEyIHVyYnMpLApyZXQ9MApbICAxMTAuMjk4
Mzg1XSB1c2IgNS0xOiBTdGFydGluZyBkYXRhIEVQIEAwMDAwMDAwMGIyZTRmNTNmClsgIDExMC4z
MDA1ODVdIHVzYiA1LTE6IFN0YXJ0aW5nIHN5bmMgRVAgQDAwMDAwMDAwYTgwMmI4ZWYKCgpidXQg
YXBsYXkgYWJvcnRzIGFmdGVyIHNldmVyYWwgc2Vjb25kczoKCiQgTEFORz1DIGFwbGF5IC1jIDQg
LXIgNDgwMDAgLWYgUzMyX0xFIC1EIGh3Ok00LDAgdGVzdDQ4MDAwLndhdiAKUGxheWluZyBXQVZF
ICd0ZXN0NDgwMDAud2F2JyA6IFNpZ25lZCAzMiBiaXQgTGl0dGxlIEVuZGlhbiwgUmF0ZSA0ODAw
MApIeiwgQ2hhbm5lbHMgNAphcGxheTogcGNtX3dyaXRlOjIwNTM6IHdyaXRlIGVycm9yOiBJbnB1
dC9vdXRwdXQgZXJyb3IKCgoKQW5kIGFuIGludGVyZXN0aW5nIG5vdGU6IGphY2sgaXMgdGhlIG9u
bHkgYXBwIHRoYXQgY2FuIHVzZSB0aGUgY2FyZAp3aXRoIGltcGxpY2l0IGZlZWRiYWNrIGluIGZ1
bGwgZHVwbGV4IG1vZGUgZXZlbiB3aXRob3V0IHRoYXQgcGF0Y2guCgoKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cDovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
