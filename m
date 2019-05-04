Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A741386B
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 11:27:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B589918AD;
	Sat,  4 May 2019 11:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B589918AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556962066;
	bh=P7YvmXdiAhdIzCcdRbHRtZkh3xfp7m2rGCWw5qZXf/g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuQBRRbirV8y+nie8VolFy0faViiBQqJQFmd9Wnbzamep9w1ltD1S1gJs+6TiTFLd
	 2mf1xEo7a9BwXDT14gMohm0Ah+Q1eXQw1FXpYKN70kALTn5lLi2F0uOnFVZNxeHAgF
	 L7qKuy70O8b/ECP621fBuetNDvwXyoJRgZImAPCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFB6F896AA;
	Sat,  4 May 2019 11:26:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CC70F896C7; Sat,  4 May 2019 11:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85B1CF8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 11:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B1CF8075A
Received: from [123.112.68.93] (helo=[192.168.1.107])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hMqvb-0006xr-2g; Sat, 04 May 2019 09:25:55 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20190430065711.14977-1-hui.wang@canonical.com>
 <s5hh8aghro8.wl-tiwai@suse.de>
 <b0c859a8-3f7f-2948-2fc8-f657adf3c804@canonical.com>
 <s5h36lzj27d.wl-tiwai@suse.de>
 <1be4853e-05cd-fc87-8db6-7ba17ee009ab@canonical.com>
 <s5ha7g4ua92.wl-tiwai@suse.de>
 <4611984b-c80f-8aa4-a760-72343572470e@canonical.com>
 <s5himurr0no.wl-tiwai@suse.de>
 <a1c69f75-da2b-8ac0-9dfa-34958cdb5fd8@canonical.com>
 <s5hzho2lmal.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <dda15837-1da9-8b68-853b-ccd513d3e93d@canonical.com>
Date: Sat, 4 May 2019 17:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hzho2lmal.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/hdmi - Don't report Jack event
 if no need to do that
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

Ck9uIDIwMTkvNS80IOS4i+WNiDM6MTgsIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBTYXQsIDA0
IE1heSAyMDE5IDA0OjQ1OjM2ICswMjAwLAo+IEh1aSBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDE5
LzUvMyDkuIvljYgxMTo1NywgVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pj4gT24gRnJpLCAwMyBNYXkg
MjAxOSAwNjowNTowOSArMDIwMCwKPj4+IEh1aSBXYW5nIHdyb3RlOgo+Pgo+IFJpZ2h0Li4uCj4K
Pj4gQW5kIGluc3BpcmVkIGJ5IHlvdXIgY2hhbmdlLCBtYXliZSB3ZSBqdXN0IG1ha2UgdGhpcyBj
aGFuZ2UsIHRoZW4gaXQKPj4gaXMgZW5vdWdoIHRvIGZpeCB0aGUgZmFsc2VseSByZXBvcnQgaXNz
dWUgaGVyZS4KPj4KPj4gQEAgLTE1NTEsOCArMTU1MSwxMSBAQCBzdGF0aWMgYm9vbCBoZG1pX3By
ZXNlbnRfc2Vuc2VfdmlhX3ZlcmJzKHN0cnVjdCBoZG1pX3NwZWNfcGVyX3BpbiAqcGVyX3BpbiwK
Pj4gICAJcmV0ID0gIXJlcG9sbCB8fCAhZWxkLT5tb25pdG9yX3ByZXNlbnQgfHwgZWxkLT5lbGRf
dmFsaWQ7Cj4+ICAgCWphY2sgPSBzbmRfaGRhX2phY2tfdGJsX2dldChjb2RlYywgcGluX25pZCk7
Cj4+IC0JaWYgKGphY2spCj4+ICsJaWYgKGphY2spIHsKPj4gICAJCWphY2stPmJsb2NrX3JlcG9y
dCA9ICFyZXQ7Cj4+ICsJCWphY2stPnBpbl9zZW5zZSA9IChlbGQtPm1vbml0b3JfcHJlc2VudCAm
JiBlbGQtPmVsZF92YWxpZCkgPwo+PiArCQkJQUNfUElOU0VOU0VfUFJFU0VOQ0UgOiAwOwo+PiAr
CX0KPj4KPj4gYmVjYXVzZSBpbiB0aGUgc25kX2hkYV9waW5fc2Vuc2UoKSwgdGhlIGphY2tfZGly
dHkgaXMgc2V0IHRvIDAsIHRoZW4KPj4gd2UgY2hhbmdlIHRoZSBqYWNrLT5waW5fc2Vuc2UswqAg
YW5kIGluIHRoZSByZXBvcnRfc3luYygpIGl0IHdpbGwKPj4gZGVjaWRlIHRoZSBqYWNrIHN0YXRl
IGFjY29yZGluZyB0byB0aGUgamFjay0+cGluX3NlbnNlIHdlIGNoYW5nZWQuCj4gT0ssIHRoYXQg
c2hvdWxkIHdvcmssIGp1c3Qgb3ZlcnJpZGluZyBhbmQgY29ycmVjdGluZyB0aGUgcGluX3NlbnNl
Lgo+Cj4gSSBndWVzcyB0aGUgb25seSBtaXNzaW5nIGNvZGUgcGF0aCBpcyB0aGUgY2FzZSB3aGVy
ZSBqYWNrLT5kaXJ0eSBpcwo+IHNldCBtYW51YWxseSB3aXRob3V0IHRoZSBjYWxsYmFjayBjYWxs
IHZpYQo+IHNuZF9oZGFfamFja19zZXRfZGlydHlfYWxsKCkuICBUaHJvdWdoIGEgcXVpY2sgZ2xh
bmNlLCBpdCdzIGNhbGxlZAo+IGZyb20gdGhlIGNvbW1vbiByZXN1bWUgY29kZSwgaGRhX2NhbGxf
Y29kZWNfcmVzdW1lKCkuICBCdXQsIGFnYWluLAo+IEhETUkgY29kZWMgaGFzIGl0cyBvd24gcmVz
dW1lIHRvIHJlZnJlc2ggcGluIGRldGVjdGlvbgo+IChnZW5lcmljX2hkbWlfcmVzdW1lKCkpLCBh
bmQgdGhlIGNoYW5nZWQgY29kZS1wYXRoIHNob3VsZCBiZQo+IGludm9sdmVkLgo+Cj4gVGhlIHJl
c3QgY2FsbGVycyBvZiBzbmRfaGRhX2phY2tfc2V0X2RpcnR5X2FsbCgpIGFyZSB0aGUgcG9sbGlu
ZyBtb2RlCj4gYW5kIHRoZSB1bnNvbCBldmVudCBoYW5kbGVyIGZvciB0aGUgb2xkIEhETUkgY29k
ZWNzLCBib3RoIG9mIHdoaWNoIHdlCj4gZG9uJ3QgY2FyZSBtdWNoLgo+Cj4gVGhhdCBzYWlkLCB5
b3VyIG1pbmltYWwgY2hhbmdlIGxvb2tzIGdvb2QgdG8gbWUsIGFuZCBJJ2xsIGhhcHBpbHkKPiBh
cHBseSBhcyBsb25nIGFzIGl0J3MgdGVzdGVkLiAgT2YgY291cnNlLCBpdCBuZWVkcyBzb21lIG1v
cmUgY2FyZWZ1bAo+IGNvbW1lbnRzIGFib3V0IHRoZSBiZWhhdmlvci4KCk9LLMKgIGFmdGVyIHRl
c3RpbmcgaXQsIEkgd2lsbCBzZW5kIHRoZSBwYXRjaCB0byByZXZpZXcuCgpUaGFua3MuCgoKPgo+
Cj4gVGhhbmtzIQo+Cj4gVGFrYXNoaQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
