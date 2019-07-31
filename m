Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A47C15E
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 14:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 120B416E6;
	Wed, 31 Jul 2019 14:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 120B416E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564576315;
	bh=oOIwN0h3aMb4CwrvaQn4e4JC9lpVt4jjfSfpN1niPu0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKR28bJ0iXOr7YCnBdx3wl5kaCW0k2BkP/uUxNNDXuDFaD4e03YmKQQXnhY+Hzqbh
	 Mv+S9rc8GGEe6ehtW2AhAUKOWJ+WNkp1wNYnEKc4JFW4mQ8jC6tKfTa+OnIEY1MxjB
	 mgNzOzhSkLMSyonMAu1rhZJcfUoh8HS3wJE36WSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B899F800C0;
	Wed, 31 Jul 2019 14:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 650B9F80483; Wed, 31 Jul 2019 14:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B79CFF80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 14:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B79CFF80133
X-Originating-IP: 88.168.111.231
Received: from localhost (lpr83-1-88-168-111-231.fbx.proxad.net
 [88.168.111.231]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 364B860015;
 Wed, 31 Jul 2019 12:29:54 +0000 (UTC)
Date: Wed, 31 Jul 2019 14:29:53 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Message-ID: <20190731122953.2u3iabd6gkn7jv7k@flea>
References: <20190603174735.21002-1-codekipper@gmail.com>
 <CAP03XepJVPge5sz4WcmK8pp2jHAPJdGb6v6A3R0DzSf5O6qj-g@mail.gmail.com>
 <CAEKpxBmxAQKgDhvjpczAWwNtNhYRs07wjMSnr8nqHk1XxMT=nw@mail.gmail.com>
 <2092329.vleAuWJ0xl@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2092329.vleAuWJ0xl@jernej-laptop>
User-Agent: NeoMutt/20180716
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christopher Obbard <chris@64studio.com>, Chen-Yu Tsai <wens@csie.org>,
 Liam Girdwood <lgirdwood@gmail.com>, codekipper@gmail.com,
 linux-sunxi@googlegroups.com, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v4 6/9] ASoC: sun4i-i2s:
 Add multi-lane functionality
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDc6NTc6MTBQTSArMDIwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IERuZSB0b3JlaywgMDQuIGp1bmlqIDIwMTkgb2IgMTE6Mzg6NDQgQ0VTVCBqZSBD
b2RlIEtpcHBlciBuYXBpc2FsKGEpOgo+ID4gT24gVHVlLCA0IEp1biAyMDE5IGF0IDExOjAyLCBD
aHJpc3RvcGhlciBPYmJhcmQgPGNocmlzQDY0c3R1ZGlvLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFR1
ZSwgNCBKdW4gMjAxOSBhdCAwOTo0MywgQ29kZSBLaXBwZXIgPGNvZGVraXBwZXJAZ21haWwuY29t
PiB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIDQgSnVuIDIwMTkgYXQgMDk6NTgsIE1heGltZSBSaXBh
cmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBNb24s
IEp1biAwMywgMjAxOSBhdCAwNzo0NzozMlBNICswMjAwLCBjb2Rla2lwcGVyQGdtYWlsLmNvbSB3
cm90ZToKPiA+ID4gPiA+ID4gRnJvbTogTWFyY3VzIENvb3BlciA8Y29kZWtpcHBlckBnbWFpbC5j
b20+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoZSBpMnMgYmxvY2sgc3VwcG9ydHMgbXVsdGkt
bGFuZSBpMnMgb3V0cHV0IGhvd2V2ZXIgdGhpcwo+ID4gPiA+ID4gPiBmdW5jdGlvbmFsaXR5Cj4g
PiA+ID4gPiA+IGlzIG9ubHkgcG9zc2libGUgaW4gZWFybGllciBTb0NzIHdoZXJlIHRoZSBwaW5z
IGFyZSBleHBvc2VkIGFuZCBmb3IKPiA+ID4gPiA+ID4gdGhlIGkycyBibG9jayB1c2VkIGZvciBI
RE1JIGF1ZGlvIG9uIHRoZSBsYXRlciBTb0NzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUbyBl
bmFibGUgdGhpcyBmdW5jdGlvbmFsaXR5LCBhbiBvcHRpb25hbCBwcm9wZXJ0eSBoYXMgYmVlbiBh
ZGRlZCB0bwo+ID4gPiA+ID4gPiB0aGUgYmluZGluZ3MuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBDb29wZXIgPGNvZGVraXBwZXJAZ21haWwuY29tPgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEknZCBsaWtlIHRvIGhhdmUgTWFyaydzIGlucHV0IG9uIHRoaXMsIGJ1
dCBJJ20gcmVhbGx5IHdvcnJpZWQgYWJvdXQKPiA+ID4gPiA+IHRoZSBpbnRlcmFjdGlvbiB3aXRo
IHRoZSBwcm9wZXIgVERNIHN1cHBvcnQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gT3VyIGZ1bmRhbWVu
dGFsIGlzc3VlIGlzIHRoYXQgdGhlIGNvbnRyb2xsZXIgY2FuIGhhdmUgdXAgdG8gOAo+ID4gPiA+
ID4gY2hhbm5lbHMsIGJ1dCBlaXRoZXIgb24gNCBsaW5lcyAoaW5zdGVhZCBvZiAxKSwgb3IgOCBj
aGFubmVscyBvbiAxCj4gPiA+ID4gPiAobGlrZSBwcm9wZXIgVERNKSAob3IgYW55IGNvbWJpbmF0
aW9uIGJldHdlZW4gdGhlIHR3bywgYnV0IHRoYXQgc2hvdWxkCj4gPiA+ID4gPiBiZSBwcmV0dHkg
cmFyZSkuCj4gPiA+ID4KPiA+ID4gPiBJIHVuZGVyc3RhbmQuLi5tYXliZSB0aGUgVERNIG5lZWRz
IHRvIGJlIGV4dGVuZGVkIHRvIHN1cHBvcnQgdGhpcyB0bwo+ID4gPiA+IGNvbnNpZGVyIGNoYW5u
ZWwgbWFwcGluZyBhbmQgbXVsdGlwbGUgdHJhbnNmZXIgbGluZXMuIEkgd2FzIHRoaW5raW5nCj4g
PiA+ID4gYWJvdXQgdGhlIGxhdGVyIHdoZW4gc29tZW9uZSB3YXMgcmVxdWVzdGluZyBzdXBwb3J0
IG9uIElJUkMgYSB3aGlsZQo+ID4gPiA+IGFnbywgSSB0aG91Z2h0IG1hc2tpbmcgbWlnaHQgb2Yg
YmVlbiBhIHNvbHV0aW9uLiBUaGVzZSBjYW4gd2FpdCBhcyB0aGUKPiA+ID4gPiBvbmx5IGNvbnN1
bWVyIGF0IHRoZSBtb21lbnQgaXMgTGlicmVFTEVDIGFuZCB3ZSBjYW4gcGF0Y2ggaXQgdGhlcmUu
Cj4gPiA+Cj4gPiA+IEhpIE1hcmN1cywKPiA+ID4KPiA+ID4gRldJVywgdGhlIFRJIE1jQVNQIGRy
aXZlciBoYXMgc3VwcG9ydCBmb3IgVERNICYgKGkgdGhpbms/KSBtdWx0aXBsZQo+ID4gPiB0cmFu
c2ZlciBsaW5lcyB3aGljaCBhcmUgY2FsbGVkIHNlcmlhbGl6ZXJzLgo+ID4gPiBNYXliZSB0aGlz
IGNhbiBoZWxwIHdpdGggaW5zcGlyYXRpb24/Cj4gPiA+IHNlZQo+ID4gPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9zCj4gPiA+IG91bmQvc29jL3RpL2RhdmluY2ktbWNhc3AuYyBzYW1wbGUgRFRTOgo+ID4gPgo+
ID4gPiAmbWNhc3AwIHsKPiA+ID4KPiA+ID4gICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47Cj4g
PiA+ICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiA+ICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOwo+ID4gPiAgICAgcGluY3RybC0wID0gPCZtY2FzcDBfcGlucz47Cj4gPiA+Cj4gPiA+ICAg
ICBvcC1tb2RlID0gPDA+Owo+ID4gPiAgICAgdGRtLXNsb3RzID0gPDg+Owo+ID4gPiAgICAgc2Vy
aWFsLWRpciA9IDwKPiA+ID4KPiA+ID4gICAgICAgICAyIDAgMSAwCj4gPiA+ICAgICAgICAgMCAw
IDAgMAo+ID4gPiAgICAgICAgIDAgMCAwIDAKPiA+ID4gICAgICAgICAwIDAgMCAwCj4gPiA+ICAg
ICA+Cj4gPiA+ICAgICA+Owo+ID4gPgo+ID4gPiAgICAgdHgtbnVtLWV2dCA9IDwxPjsKPiA+ID4g
ICAgIHJ4LW51bS1ldnQgPSA8MT47Cj4gPiA+Cj4gPiA+IH07Cj4gPiA+Cj4gPiA+IENoZWVycyEK
PiA+Cj4gPiBUaGFua3MsIHRoaXMgbG9va3MgZ29vZC4KPgo+IEkgd291bGQgcmVhbGx5IGxpa2Ug
dG8gc2VlIHRoaXMgaXNzdWUgcmVzb2x2ZWQsIGJlY2F1c2UgSERNSSBhdWRpbyBzdXBwb3J0IGlu
Cj4gbWFpbmxpbmUgTGludXggZm9yIHRob3NlIFNvQ3MgaXMgbG9uZyBvdmVyZHVlLgo+Cj4gSG93
ZXZlciwgdGhlcmUgaXMgYSBwb3NzaWJpbGl0eSB0byBzdGlsbCBhZGQgSERNSSBhdWRpbyBzdXBv
cnQgKHN0ZXJlbyBvbmx5KQo+IGV2ZW4gaWYgdGhpcyBpc3N1ZSBpcyBub3QgY29tcGxldGVseSBz
b2x2ZWQuIElmIHdlIGFncmVlIHRoYXQgY29uZmlndXJhdGlvbiBvZgo+IGNoYW5uZWxzIHdvdWxk
IGJlIHNvbHZlZCB3aXRoIGFkZGl0aW9uYWwgcHJvcGVydHkgYXMgQ2hyaXN0b3BoZXIgc3VnZ2Vz
dGVkLAo+IHN1cHBvcnQgZm9yID4yIGNoYW5uZWxzIGNhbiBiZSBsZWZ0IGZvciBhIGxhdGVyIHRp
bWUgd2hlbiBzdXBwb3J0IGZvciB0aGF0Cj4gcHJvcGVydHkgd291bGQgYmUgaW1wbGVtZW50ZWQu
IEN1cnJlbnRseSwgc3RlcmVvIEhETUkgYXVkaW8gc3VwcG9ydCBjYW4gYmUKPiBhZGRlZCB3aXRo
IGEgZmV3IHBhdGNoZXMuCj4KPiBJIHRoaW5rIGFsbCBJMlMgY29yZXMgYXJlIHJlYWxseSB0aGUg
c2FtZSwgbm8gbWF0dGVyIGlmIGludGVybmFsbHkgY29ubmVjdGVkCj4gdG8gSERNSSBjb250cm9s
bGVyIG9yIHJvdXRlZCB0byBwaW5zLCBzbyBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHVzZSBzYW1l
Cj4gY29tcGF0aWJsZSBmb3IgYWxsIG9mIHRoZW0uIEl0J3MganVzdCB0aGF0IHRob3NlIEkyUyBj
b3JlcyB3aGljaCBhcmUgcm91dGVkIHRvCj4gcGlucyBjYW4gdXNlIG9ubHkgb25lIGxhbmUgYW5k
ID4yIGNoYW5uZWxzIGNhbiBiZSB1c2VkIG9ubHkgaW4gVERNIG1vZGUgb2YKPiBvcGVyYXRpb24s
IGlmIEkgdW5kZXJzdGFuZCB0aGlzIGNvcnJlY3RseS4KPgo+IE5ldyBwcm9wZXJ0eSB3b3VsZCBo
YXZlIHRvIGJlIG9wdGlvbmFsLCBzbyBpdCdzIG9taXNzaW9uIHdvdWxkIHJlc3VsdCBpbiBzYW1l
Cj4gY2hhbm5lbCBjb25maWd1cmF0aW9uIGFzIGl0IGlzIGFscmVhZHkgcHJlc2VudCwgdG8gcHJl
c2VydmUgY29tcGF0aWJpbGl0eSB3aXRoCj4gb2xkIGRldmljZSB0cmVlcy4gQW5kIHRoaXMgbW9k
ZSBpcyBhbHJlYWR5IHN1ZmZpY2llbnQgZm9yIHN0ZXJlbyBIRE1JIGF1ZGlvCj4gc3VwcG9ydC4K
ClllYWgsIGl0IGxvb2tzIGxpa2UgYSBnb29kIHBsYW4uCgo+IFNpZGUgbm90ZTogSERNSSBhdWRp
byB3aXRoIGN1cnJlbnQgc3VuNGktaTJzIGRyaXZlciBoYXMgYSBkZWxheSAoYWJvdXQgYQo+IHNl
Y29uZCksIHN1cHBvc2VkbHkgYmVjYXVzZSBEVyBIRE1JIGNvbnRyb2xsZXIgYXV0b21hdGljYWxs
eSBnZW5lcmF0ZXMgQ1RTCj4gdmFsdWUgYmFzZWQgb24gSTJTIGNsb2NrIChhdXRvIENUUyB2YWx1
ZSBnZW5lcmF0aW9uIGlzIGVuYWJsZWQgcGVyIERlc2lnbldhcmUKPiByZWNvbWVuZGF0aW9uIGZv
ciBEVyBIRE1JIEkyUyBpbnRlcmZhY2UpLgoKSXMgdGhhdCBhIGNvbnN0YW50IGRlbGF5IGR1cmlu
ZyB0aGUgYXVkaW8gcGxheWJhY2ssIG9yIG9ubHkgYXQgc3RhcnR1cD8KCj4gSTJTIGRyaXZlciBm
cm9tIEJTUCBMaW51eCBzb2x2ZXMgdGhhdCBieSBoYXZpbmcgSTJTIGNsb2NrIG91dHB1dAo+IGVu
YWJsZWQgYWxsIHRoZSB0aW1lLiBTaG91bGQgdGhpcyBiZSBmbGFnZ2VkIHdpdGggc29tZSBhZGRp
dGlvbmFsCj4gcHJvcGVydHkgaW4gRFQ/CgpJJ2Qgc2F5IHRoYXQgaWYgdGhlIGNvZGVjIGhhcyB0
aGF0IHJlcXVpcmVtZW50LCB0aGVuIGl0IHNob3VsZCBiZQpiZXR3ZWVuIHRoZSBjb2RlYyBhbmQg
dGhlIERBSSwgdGhlIERUIGRvZXNuJ3QgcmVhbGx5IGhhdmUgYW55dGhpbmcgdG8KZG8gd2l0aCB0
aGlzLgoKTWF4aW1lCgotLQpNYXhpbWUgUmlwYXJkLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
