Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C7F6B52
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Nov 2019 21:28:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4545F166D;
	Sun, 10 Nov 2019 21:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4545F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573417732;
	bh=NRAkyQQt70+LEzOfXfZcHJrUMjw4RmlxQZ66Z4kZ9eY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DSdqwHSId7WZB+Dk9l3KOT0MjPRpcT9wBYh+sSVMXAd5ehf0AXnDc5OGdQd7US8cz
	 TZuFy10lEFpEyMfs4WHjcbup48B6uOCOu/23K2kx6W3ZCnNI6YFssUxRu7sAllTQcm
	 om3dAh9jNcHrV9WRXP4ps9AvG3LACrAmivFxJW1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E03F8049A;
	Sun, 10 Nov 2019 21:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C45F80483; Sun, 10 Nov 2019 21:27:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay9.mail.vrmd.de (relay9.mail.vrmd.de [81.28.224.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3FACF800D3
 for <alsa-devel@alsa-project.org>; Sun, 10 Nov 2019 21:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3FACF800D3
Received: from [62.216.205.77] (helo=ubuntu)
 by relay2.mail.vrmd.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <beerml@sigma6audio.de>)
 id 1iTtnU-0007vK-Ag; Sun, 10 Nov 2019 21:26:56 +0100
From: Michael Beer <beerml@sigma6audio.de>
To: Jean-Paul Argudo <jpa@argudo.org>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>
In-Reply-To: <20191109123634.GA22893@workstation>
Message-ID: <20191110202655.Horde.AHDANiLCL08qiJAakxmvd8i@ubuntu>
User-Agent: Horde Application Framework 5
Date: Sun, 10 Nov 2019 20:26:55 +0000
MIME-Version: 1.0
X-Relay-User: beerml@sigma6audio.de
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] snd-bebob : from kernel 4.13 to 5.3.19 and .20
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

CgoiVGFrYXNoaSBTYWthbW90byIgPG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPiDigJMgTm92ZW1i
ZXIgOSwgMjAxOSAxOjM4IFBNCj4gSGksCj4gCj4gSSdtIHNvcnJ5IHRvIGJlIGxhdGUgZm9yIHJl
cGx5IGJ1dCBJIGhhdmUgYSBzaG9ydCB2YWNhdGlvbiBpbiB0aGlzIHdlZWsuCj4gCj4gT24gV2Vk
LCBPY3QgMzAsIDIwMTkgYXQgMDM6NDA6MDNQTSArMDEwMCwgSmVhbi1QYXVsIEFyZ3VkbyB3cm90
ZToKPiA+ID4gKiAvcHJvYy9hc291bmQvY2FyZFgvZmlyZXdpcmUvZmlybXdhcmUKPiA+IAo+ID4g
JCBjYXQgL3Byb2MvYXNvdW5kL2NhcmQzL2ZpcmV3aXJlL2Zpcm13YXJlIAo+ID4gTWFudWZhY3R1
cmVyOiBicmlkZ2VDbwo+ID4gUHJvdG9jb2wgVmVyOiAxCj4gPiBCdWlsZCBWZXI6IDAKPiA+IEdV
SUQ6IDB4MDAxMzBFMDEwMDA0Mzk0Qwo+ID4gTW9kZWwgSUQ6IDB4MDIKPiA+IE1vZGVsIFJldjog
MQo+ID4gRmlybXdhcmUgRGF0ZTogMjAwNjEyMDcKPiA+IEZpcm13YXJlIFRpbWU6IDE0MDgyNgo+
ID4gRmlybXdhcmUgSUQ6IDB4MAo+ID4gRmlybXdhcmUgVmVyOiAxNjg1MDE5NAo+ID4gQmFzZSBB
ZGRyOiAweDIwMDgwMDAwCj4gPiBNYXggU2l6ZTogMTU3Mjg2NAo+ID4gTG9hZGVyIERhdGU6IDIw
MDUxMDE5Cj4gPiBMb2FkZXIgVGltZTogMDk0OTUyCj4gCj4gQmVmb3JlIHZhY2F0aW9uIEkgbWFk
ZSBhcnJhbmdlbWVudCB0byBidXkgRm9jdXNyaXRlIFNhZmZpcmUgTEUgaW4gdXNlZAo+IG1hcmtl
dCBhbmQgdG9kYXkgaXQgYXJyaXZlZC4gQXMgbG9uZyBhcyBJIGNhbiBzZWUsIHRoZSB1bml0IHVz
ZXMgdGhlIHNhbWUKPiBmaXJtd2FyZSB3aGljaCB5b3VyIHVuaXQgdXNlcy4KPiAKPiA+Pj4gQXQg
c3RhcnR1cCBpdCBsaWdodHMgZ3JlZW4gb2ssIGJ1dCBubyBzb3VuZCBpcyBwbGF5YWJsZSwgdGhl
biB0aGUKPiA+Pj4gbGlnaHRzIHR1cm4gb3JhbmdlIChsaWtlIGl0IGlzIHdoZW4gaXQncyBub3Qg
d29ya2luZyksIEkgaGVhciBhCj4gPj4+ICJyZWxheSBzb3VuZCIgKGEgZWxlY3RyaWMgY2xpYyBv
ZiBhIHJlbGF5KSwgdGhlbiwgdGhlIFNhZmZpcmUgTEUKPiA+Pj4gZGlzYXBlYXJzIGZyb20gdGhl
IHNvdW5kIG1lbnUgaW4gVWJ1bnR1IHNvdW5kIG1lbnUuCj4gCj4gSSBjYW4gcmVnZW5lcmF0ZSB0
aGlzIHBoZW5vbWVuYS4KPiAKPiA+Pj4gSSBjYW4gc2VlIHRoaXMgaW4gZG1lc2c6Cj4gPj4+IAo+
ID4+PiBbIDE5LjA4MzU4M10gc25kLWJlYm9iIGZ3MS4wOiBEZXRlY3QgZGlzY29udGludWl0eSBv
ZiBDSVA6IDEwIDUwCj4gPj4+IFsgMTkuNzQ2NjY1XSBzbmQtYmVib2IgZncxLjA6IERldGVjdCBk
aXNjb250aW51aXR5IG9mIENJUDogQTAgQTgKPiA+Pj4gLi4uCj4gPj4+IFsgMjg0Ljk2NTUwOF0g
c25kLWJlYm9iIGZ3MS4wOiBEZXRlY3QgZGlzY29udGludWl0eSBvZiBDSVA6IEQwIDEwCj4gPj4+
IFsgMjg1LjQ2OTM0OF0gc25kLWJlYm9iIGZ3MS4wOiBEZXRlY3QgZGlzY29udGludWl0eSBvZiBD
SVA6IDY4IEE4Cj4gPj4+IFsgMjg1Ljk2NTE3NF0gc25kLWJlYm9iIGZ3MS4wOiBEZXRlY3QgZGlz
Y29udGludWl0eSBvZiBDSVA6IDIwIDYwCj4gPj4+IFsgMjg1Ljk4MTYxOF0gZmlyZXdpcmVfY29y
ZSAwMDAwOjA1OjAxLjA6IHBoeSBjb25maWc6IG5ldyByb290PWZmYzEsCj4gPj4+IGdhcF9jb3Vu
dD01Cj4gPj4+IFsgMjkwLjEwMzk4Ml0gZmlyZXdpcmVfY29yZSAwMDAwOjA1OjAxLjA6IHBoeSBj
b25maWc6IG5ldyByb290PWZmYzEsCj4gZ2FwX2NvdW50PTUKPiAKPiBJIGNhbiBzZWUgYXMgd2Vs
bC4KPiAKPiBUaGVuLCBJIHJlYWxpemVkIHRoYXQgdGhlc2UgZGlzY29udGludWl0eSBvY2N1cnMg
aW4gcGFja2V0IHN0cmVhbWluZwo+IG9mICdzZWNvbmQgb3IgbGF0ZXInLiBJbiBzaG9ydCwgb25j
ZSBkaXNjb25uZWN0aW9uIG9mIHBhY2tldCBzdHJlYW1pbmcsCj4gdGhlIHVuaXQgdHJhbnNmZXJz
IHBhY2tldHMgd2l0aCBkaXNjb250aW51aXR5IGluIHBhY2tldCBzdHJlYW1pbmcgb2YKPiByZWNv
bm5lY3Rpb24uIEZ1cnRoZXJtb3JlLCB0aGUgZGlzY29udGludWl0eSBpcyBpbiB0aGUgZWFybHkg
aXNvYwo+IGN5Y2xlcyBvZiBwYWNrZXQgc3RyZWFtaW5nLgo+IAo+IEkndmUgYWxyZWFkeSBjb21t
aXQgdG8gYXZvaWQgdGhlIGRldGVjdGlvbiBvZiBkaXNjb250aW51aXR5IGluIHJlY2VudAo+IGNv
bW1pdCBmb3IgdjUuNSBrZXJuZWwgKHVuZGVyIGRldmVsb3BtZW50KToKPiBnaXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGl3YWkvc291bmQuZ2l0L2NvbW1pdC9zb3VuZC9m
aXJld2lyZS9iZWJvYgo+IAo+IEluIHRoaXMgcGF0Y2gsIGlzb2MgcGFja2V0cyBmcm9tIHRoZSBk
ZXZpY2UgYXJlIGNhcHR1cmVkIGVub3VnaCBhZnRlcgo+IGNvbm5lY3Rpb24gdG8gc2tpcCBlYXJs
eSBjeWNsZXMgb2YgcGFja2V0IHN0cmVhbWluZywgdGh1cyB0aGUKPiBkaXNjb250aW51aXR5IGlz
IG5vdCBkZXRlY3RlZC4KPiAKPiBBcyBsb25nIGFzIEkgdGVzdGVkLCB0aGlzIHZlcnNpb24gb2Yg
QUxTQSBCZUJvQiBkcml2ZXIgd29ya3Mgd2VsbCB3aXRoCj4gdGhlIGRldmljZS4gSSdkIGxpa2Ug
eW91IHRvIHRlc3Qgd2l0aCBiYWNrcG9ydCBkcml2ZXJzIGFzIHdlbGw6Cj4gZ2l0aHViLmNvbS90
YWthc3dpZS9zbmQtZmlyZXdpcmUtaW1wcm92ZQo+IAo+IAo+IFJlZ2FyZHMKPiAKPiBUYWthc2hp
IFNha2Ftb3RvCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
Zwo+IG1haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
