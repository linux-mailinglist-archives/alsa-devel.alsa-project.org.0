Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDE333FD5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 09:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC01167E;
	Tue,  4 Jun 2019 09:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC01167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559632766;
	bh=iOjUraZ/qENDMnDYM6cO1LBrQ6S4CeALZoCK+6TAM2o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sAUCk3Qa6DJ1aSY1ZnoEuceRdU3gIxOwGekVlIiLJw7K3RuON+gL3wtv4FPE0T2Wj
	 t2oUHw7M++kR6ZqQSdstOsPT2dDy7Ay1xjwwBn8OaCRaXCSz4nutvC/Oc4MESkiRAZ
	 JBZfVlYh76Wox/4Kt1pB22Qum0d2YZbzPiRX+Kw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06B61F896F8;
	Tue,  4 Jun 2019 09:17:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 844E6F896F7; Tue,  4 Jun 2019 09:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 190C5F80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 190C5F80054
Received: by mail-lj1-f196.google.com with SMTP id a21so3421391ljh.7
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uXFhS7Fhht2cVxXQgdevMCQkg9IO5A4+7VWwz6q4IHQ=;
 b=R39j+Y3SljEr/BbqegeBYeisRqEFavSHZDy0elXJNxMjSBj3rPbrCEQn86shcd1WaU
 vwQhPNjGLNqfy77Up53FixrgaNMFIuie3AT4hfugvKCEuVQsFwgZp/r0rq5tKuIqWj37
 YxDYLH03VcxzBprUsbYq+JXxjAWnTwq8RNcnwbfQNJHCspaQZmVBv0ihyrwomU26UcJa
 JGM1b4DtJ60AnBKYMd8y86OAovu0aPxlWe8C9W9cUsgluhF1rxV58hFvCG+PQyc8OUcM
 9Lk6xUCXRvtDpFofkgkJeUc4l7DodDsAj3rpS03cO1/TejtZ8yOYlaWRcVOoYIQY5/IW
 2mog==
X-Gm-Message-State: APjAAAU1aQLfah9JLzAbKeWceEfwCK8RfmZA9UQ5dmkRicOQq0R6vkdc
 6Z3HQFIjLOnEirPad+CUfkSIo+07Db5AqBX9iUk=
X-Google-Smtp-Source: APXvYqyyZ2LjfsWzKbQvADxUxY+XiY/8hXkqr4Kstn7jTiKw8xfdZP/KjDVpKZALARnI7yGQkBB7ySKrnAGa0wizxpk=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr4591585ljg.65.1559632655971;
 Tue, 04 Jun 2019 00:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-3-geert@linux-m68k.org>
 <15499.1559298884@warthog.procyon.org.uk>
In-Reply-To: <15499.1559298884@warthog.procyon.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2019 09:17:23 +0200
Message-ID: <CAMuHMdX57DKCMpLXdtZPE-w0esUNVv9-SwYjmT5=m+u9ryAiHQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 linux-block@vger.kernel.org, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH] rxrpc: Fix uninitialized error code in
	rxrpc_send_data_packet()
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

SGkgRGF2aWQsCgpPbiBGcmksIE1heSAzMSwgMjAxOSBhdCAxMjozNSBQTSBEYXZpZCBIb3dlbGxz
IDxkaG93ZWxsc0ByZWRoYXQuY29tPiB3cm90ZToKPiBIZXJlJ3MgbXkgdGFrZSBvbiB0aGUgcGF0
Y2guCj4KPiBEYXZpZAo+IC0tLQo+IHJ4cnBjOiBGaXggdW5pbml0aWFsaXplZCBlcnJvciBjb2Rl
IGluIHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQoKQo+Cj4gV2l0aCBnY2MgNC4xOgo+Cj4gICAgIG5l
dC9yeHJwYy9vdXRwdXQuYzogSW4gZnVuY3Rpb24g4oCYcnhycGNfc2VuZF9kYXRhX3BhY2tldOKA
mToKPiAgICAgbmV0L3J4cnBjL291dHB1dC5jOjMzODogd2FybmluZzog4oCYcmV04oCZIG1heSBi
ZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgo+Cj4gSW5kZWVkLCBpZiB0aGUg
Zmlyc3QganVtcCB0byB0aGUgc2VuZF9mcmFnbWVudGFibGUgbGFiZWwgaXMgbWFkZSwgYW5kCj4g
dGhlIGFkZHJlc3MgZmFtaWx5IGlzIG5vdCBoYW5kbGVkIGluIHRoZSBzd2l0Y2goKSBzdGF0ZW1l
bnQsIHJldCB3aWxsIGJlCj4gdXNlZCB1bmluaXRpYWxpemVkLgo+Cj4gRml4IHRoaXMgYnkgQlVH
KCknaW5nIGFzIGlzIGRvbmUgaW4gb3RoZXIgcGxhY2VzIGluIHJ4cnBjIHdoZXJlIGludGVybmFs
Cj4gc3VwcG9ydCBmb3IgZnV0dXJlIGFkZHJlc3MgZmFtaWxpZXMgd2lsbCBuZWVkIGFkZGluZy4g
IEl0IHNob3VsZCBub3QgYmUKPiBwb3NzaWJsZSB0byByZWFjaCB0aGlzIG5vcm1hbGx5IGFzIHRo
ZSBhZGRyZXNzIGZhbWlsaWVzIGFyZSBjaGVja2VkCj4gdXAtZnJvbnQuCj4KPiBGaXhlczogNWE5
MjRiODk1MWY4MzViNSAoInJ4cnBjOiBEb24ndCBzdG9yZSB0aGUgcnhycGMgaGVhZGVyIGluIHRo
ZSBUeCBxdWV1ZSBza19idWZmcyIpCj4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSG93ZWxscyA8ZGhv
d2VsbHNAcmVkaGF0LmNvbT4KCkknbSBub3Qgc3VjaCBhIGJpZyBmYW4gb2YgQlVHKCksIHNvIEkn
ZCBnbyBmb3IgcmV0ID0gLUVBRk5PU1VQUE9SVCwgYnV0IGdpdmVuCnJ4cnBjIGlzIGFscmVhZHkg
ZnVsbCBvZiBCVUcoKSBjYWxscywgSSBndWVzcyBpdCBpcyBhbiBhY2NlcHRhYmxlIHNvbHV0aW9u
LgoKPiAtLS0KPiBkaWZmIC0tZ2l0IGEvbmV0L3J4cnBjL291dHB1dC5jIGIvbmV0L3J4cnBjL291
dHB1dC5jCj4gaW5kZXggMDA0Yzc2MmMyZThkLi42ZjJiNGZiNGIwYWEgMTAwNjQ0Cj4gLS0tIGEv
bmV0L3J4cnBjL291dHB1dC5jCj4gKysrIGIvbmV0L3J4cnBjL291dHB1dC5jCj4gQEAgLTUyMyw2
ICs1MjMsOSBAQCBpbnQgcnhycGNfc2VuZF9kYXRhX3BhY2tldChzdHJ1Y3QgcnhycGNfY2FsbCAq
Y2FsbCwgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgI2VuZGlmCj4gKwo+ICsgICAgICAgZGVmYXVsdDoKPiArICAgICAg
ICAgICAgICAgQlVHKCk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChyZXQgPCAwKQoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
