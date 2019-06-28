Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5425597E2
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 11:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5774616A8;
	Fri, 28 Jun 2019 11:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5774616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561715429;
	bh=wZxXZ6cOmjE2WuU4fbUt3WqSDA+bNAHHWRZ4lhDYG9Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NakmmUc/PwFeRyDhC/rrt+Jh+6jmmvSDLvuBJ1P0qQT1+IYsjwWXsMboNXHW6YHT9
	 zBG8oPIKVLgDMF+Sj2GVUI7JZdm3heAfR7O4PeFce2zkSeAJ0nG1TcjkbUHr/vNy5Y
	 zNOrshCLWY597guGXTfCfw9cvsTZ8SOliZmS3Cq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0822F896CC;
	Fri, 28 Jun 2019 11:48:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5024CF896B9; Fri, 28 Jun 2019 11:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E34E2F80058
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 11:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34E2F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="MS3nJFuQ"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45ZsQt4qzzz9v0wQ;
 Fri, 28 Jun 2019 11:48:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MS3nJFuQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pZl8gME9hagL; Fri, 28 Jun 2019 11:48:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45ZsQt3hYvz9v0wP;
 Fri, 28 Jun 2019 11:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561715318; bh=WnV7UDb4Snu6Dal6gfhwWBwcbdeIzVY+ODIk60JqE8U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MS3nJFuQi4Hf5KytCdDPMJmuQIqksXtUv+pid9Fl/u0KJYekztCou460LJG5gykDi
 W0Vg4NLAUntrhH3cTTCNfxD8RqTqB2eq1t9hBt3Cvfhtk44yuE1Q/jnMoowZgyadGh
 e0lyr+rsJsM77xp5aZK7bDQEcJSoyrnZzOb0oqME=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CEA88B967;
 Fri, 28 Jun 2019 11:48:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pmeNiNUhoS-G; Fri, 28 Jun 2019 11:48:39 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19CB48B966;
 Fri, 28 Jun 2019 11:48:38 +0200 (CEST)
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190628025055.16242-1-huangfq.daxian@gmail.com>
 <83108dee-72f7-e56f-95f6-26162c9a0ccc@c-s.fr>
 <CABXRUiT6jSP2xL9JyqngS9KBx_=fZ13x0UGGFPnQPrfh-_N5xQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ae51454e-68b1-bc82-8d8f-dbc273166dc3@c-s.fr>
Date: Fri, 28 Jun 2019 11:48:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CABXRUiT6jSP2xL9JyqngS9KBx_=fZ13x0UGGFPnQPrfh-_N5xQ@mail.gmail.com>
Content-Language: fr
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH v2 27/27] sound: ppc: remove unneeded
 memset after dma_alloc_coherent
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

CgpMZSAyOC8wNi8yMDE5IMOgIDExOjExLCBGdXFpYW4gSHVhbmcgYSDDqWNyaXTCoDoKPiBUaGUg
bWVyZ2UgY29tbWl0IGxvZyB0ZWxscyAoZG1hLW1hcHBpbmc6IHplcm8gbWVtb3J5IHJldHVybmVk
IGZyb20KPiBkbWFfYWxsb2NfKiBhbmQgZGVwcmVjYXRpbmcgdGhlIGRtYV96YWxsb2NfY29oZXJl
bnQpLgo+IEkgdXNlZCB0aGlzIGNvbW1pdCBqdXN0IHdhbnQgdG8gc2F5IHRoYXQgZG1hX2FsbG9j
X2NvaGVyZW50ICBoYXMKPiB6ZXJvZWQgdGhlIGFsbG9jYXRlZCBtZW1vcnkuCj4gU29ycnkgZm9y
IHRoaXMgbWlzdGFrZS4KPiAKPiBNYXliZSB0aGlzIGNvbW1pdCA1MThhMmYxOTI1YzMoImRtYS1t
YXBwaW5nOiB6ZXJvIG1lbW9yeSByZXR1cm5lZCBmcm9tCj4gZG1hX2FsbG9jXyoiKSBpcyBjb3Jy
ZWN0LgoKWWVzIHRoYXQgbG9va3MgYXBwcm9wcmlhdGUuIEFuZCBpdCBjb25maXJtcyBpdCB3YXMg
YWxyZWFkeSBkb25lIG9uIApwb3dlcnBjLCBhcyB0aGF0IHBhdGNoIGRvZXNuJ3QgaW5jbHVkZSBh
bnkgY2hhbmdlIGluIHBvd2VycGMgYXJjaC4KCkNocmlzdG9waGUKCj4gCj4gQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IOaWvCAyMDE55bm0NuaciDI45pel6YCx5LqU
IOS4i+WNiDQ6NTnlr6vpgZPvvJoKPiAKPj4KPj4KPj4KPj4gTGUgMjgvMDYvMjAxOSDDoCAwNDo1
MCwgRnVxaWFuIEh1YW5nIGEgw6ljcml0IDoKPj4+IEluIGNvbW1pdCBhZjdkZGQ4YTYyN2MKPj4+
ICgiTWVyZ2UgdGFnICdkbWEtbWFwcGluZy00LjIxJyBvZiBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9y
Zy91c2Vycy9oY2gvZG1hLW1hcHBpbmciKSwKPj4+IGRtYV9hbGxvY19jb2hlcmVudCBoYXMgYWxy
ZWFkeSB6ZXJvZWQgdGhlIG1lbW9yeS4KPj4+IFNvIG1lbXNldCBpcyBub3QgbmVlZGVkLgo+Pgo+
PiBZb3UgYXJlIHJlZmVyaW5nIHRvIGEgbWVyZ2UgY29tbWl0LCBpcyB0aGF0IGNvcnJlY3QgPwo+
Pgo+PiBJIGNhbid0IHNlZSBhbnl0aGluZyByZWxhdGVkIGluIHRoYXQgY29tbWl0LCBjYW4geW91
IHBsZWFzZSBwaW5wb2ludCBpdCA/Cj4+Cj4+IEFzIGZhciBhcyBJIGNhbiBzZWUsIG9uIHBvd2Vy
cGMgdGhlIG1lbW9yeSBoYXMgYWx3YXlzIGJlZW4gemVyb2l6ZWQKPj4gKHNpbmNlIDIwMDUgYXQg
bGVhc3QpLgo+Pgo+PiBDaHJpc3RvcGhlCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRnVxaWFu
IEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgIHNvdW5kL3Bw
Yy9wbWFjLmMgfCAxIC0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3BwYy9wbWFjLmMgYi9zb3VuZC9wcGMvcG1hYy5jCj4+PiBp
bmRleCAxYjExZTUzZjZhNjIuLjFhYjEyZjRmODYzMSAxMDA2NDQKPj4+IC0tLSBhL3NvdW5kL3Bw
Yy9wbWFjLmMKPj4+ICsrKyBiL3NvdW5kL3BwYy9wbWFjLmMKPj4+IEBAIC01Niw3ICs1Niw2IEBA
IHN0YXRpYyBpbnQgc25kX3BtYWNfZGJkbWFfYWxsb2Moc3RydWN0IHNuZF9wbWFjICpjaGlwLCBz
dHJ1Y3QgcG1hY19kYmRtYSAqcmVjLCBpCj4+PiAgICAgICAgaWYgKHJlYy0+c3BhY2UgPT0gTlVM
TCkKPj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4gICAgICAgIHJlYy0+c2l6
ZSA9IHNpemU7Cj4+PiAtICAgICBtZW1zZXQocmVjLT5zcGFjZSwgMCwgcnNpemUpOwo+Pj4gICAg
ICAgIHJlYy0+Y21kcyA9ICh2b2lkIF9faW9tZW0gKilEQkRNQV9BTElHTihyZWMtPnNwYWNlKTsK
Pj4+ICAgICAgICByZWMtPmFkZHIgPSByZWMtPmRtYV9iYXNlICsgKHVuc2lnbmVkIGxvbmcpKChj
aGFyICopcmVjLT5jbWRzIC0gKGNoYXIgKilyZWMtPnNwYWNlKTsKPj4+Cj4+PgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
