Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B840596FC
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 11:12:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7641685;
	Fri, 28 Jun 2019 11:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7641685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561713147;
	bh=B52Zpwqiit5sVEsdmdfxXuFQE0hSAOIjDFfOB5q7DrQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cWt+A5rurm3jK9LXo8Vksa0oDuhFeRXz9/Y3TPpKVf5zP2Z+GNLO7p71VUbUnUfa1
	 Lq3VvOttOpOX5yKAVKIEvLPlRBMyNTGtEFsvlAnJl2c51irN//I/Mlv/7YUIyBx8is
	 78y+5SQ2pbSVrMdtf8h6XmZr9bzUXmmwrnQ7HRS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 675CDF896B9;
	Fri, 28 Jun 2019 11:11:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A708F896B7; Fri, 28 Jun 2019 11:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68595F896B7
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 11:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68595F896B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="StQri7Ff"
Received: by mail-yw1-xc42.google.com with SMTP id y185so3164281ywy.8
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NYW6PlEeaH367Jvr1ZMSoo3Aj5m51ktezngndfggtvY=;
 b=StQri7FfBnbBGEumveJwe5nkZAxrnsl671ui5e4oGfnTsl6m3afqK8KoJktb7l92/5
 npAV5CxaY7ELNtmAqoi55qQvXqnPFo4n9uX1BUNUb4t/dwYtyeQ/M7EXSrB/v0zRegJE
 P8e0j9feRAtEl3LJ8zHZ7pplU8UWCoy5zEZKLE3lZFonv0QcEwAQCmBlTUpcPzCpORaU
 KWr3K/480ZFGenmaWVLmNgEVOZh9JAXlLCQJS/VVNfNlmf9I31Ygk4UJv7rV/7N3txa1
 fb3GUv4xRMJn7E6lc58vZ0lrTIQBrPETcl9F7RauB7UNsjwvdYHz6nVtH4zpR7o3zpzr
 JYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NYW6PlEeaH367Jvr1ZMSoo3Aj5m51ktezngndfggtvY=;
 b=TWFu1WK+1pMBYauidDzWcODvXrpHS5zt6bFAIwwqkAqR3TwoO9y/QsirxgiGn7iKiI
 BX/e/56RyVpHgoZTbT+I97PYqdwfKsaueqK8c1CkYNMaS+Ue7NNojX0ramU8H8/4KfBM
 cgc0E2zRlN0Gnft8ldVDtv2NhMRvhiDMQgbTYjhhwwdiDSQ/SbNb989s0i/kBYYePsRx
 rb04JHJfLDnhosdvQXQsSVNxQoUBxLlPXekK6FOyL6FBEj6j4/uM8BbPgHXZ+KYY0kT/
 TeUYHheBBGMaMzStRKf4cTXVEbYaWiKB73YsUdQjkEYonOGxeNSg4NvpgBC7y2F7C+QU
 72zA==
X-Gm-Message-State: APjAAAVKNwSB8N8emhMY24+GAk/u3JLX/YAHlBwmdHfjVTAH0UkL0Vho
 u4aNeCHvL8cAkVF4+RsZYwJikNkK8NL/KvBdIKM=
X-Google-Smtp-Source: APXvYqwdZqvPFf/v+xf0c8m2QQzjwkm9pBnQirbxjOXTyW1AetvGjdJMH0+2ZUJRnpOn1unVXGCt7KHq84C5BQbqQa4=
X-Received: by 2002:a0d:e1d7:: with SMTP id k206mr5230972ywe.229.1561713079518; 
 Fri, 28 Jun 2019 02:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190628025055.16242-1-huangfq.daxian@gmail.com>
 <83108dee-72f7-e56f-95f6-26162c9a0ccc@c-s.fr>
In-Reply-To: <83108dee-72f7-e56f-95f6-26162c9a0ccc@c-s.fr>
From: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Fri, 28 Jun 2019 17:11:08 +0800
Message-ID: <CABXRUiT6jSP2xL9JyqngS9KBx_=fZ13x0UGGFPnQPrfh-_N5xQ@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhlIG1lcmdlIGNvbW1pdCBsb2cgdGVsbHMgKGRtYS1tYXBwaW5nOiB6ZXJvIG1lbW9yeSByZXR1
cm5lZCBmcm9tCmRtYV9hbGxvY18qIGFuZCBkZXByZWNhdGluZyB0aGUgZG1hX3phbGxvY19jb2hl
cmVudCkuCkkgdXNlZCB0aGlzIGNvbW1pdCBqdXN0IHdhbnQgdG8gc2F5IHRoYXQgZG1hX2FsbG9j
X2NvaGVyZW50ICBoYXMKemVyb2VkIHRoZSBhbGxvY2F0ZWQgbWVtb3J5LgpTb3JyeSBmb3IgdGhp
cyBtaXN0YWtlLgoKTWF5YmUgdGhpcyBjb21taXQgNTE4YTJmMTkyNWMzKCJkbWEtbWFwcGluZzog
emVybyBtZW1vcnkgcmV0dXJuZWQgZnJvbQpkbWFfYWxsb2NfKiIpIGlzIGNvcnJlY3QuCgpDaHJp
c3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4g5pa8IDIwMTnlubQ25pyIMjjm
l6XpgLHkupQg5LiL5Y2INDo1OeWvq+mBk++8mgoKPgo+Cj4KPiBMZSAyOC8wNi8yMDE5IMOgIDA0
OjUwLCBGdXFpYW4gSHVhbmcgYSDDqWNyaXQgOgo+ID4gSW4gY29tbWl0IGFmN2RkZDhhNjI3Ywo+
ID4gKCJNZXJnZSB0YWcgJ2RtYS1tYXBwaW5nLTQuMjEnIG9mIGdpdDovL2dpdC5pbmZyYWRlYWQu
b3JnL3VzZXJzL2hjaC9kbWEtbWFwcGluZyIpLAo+ID4gZG1hX2FsbG9jX2NvaGVyZW50IGhhcyBh
bHJlYWR5IHplcm9lZCB0aGUgbWVtb3J5Lgo+ID4gU28gbWVtc2V0IGlzIG5vdCBuZWVkZWQuCj4K
PiBZb3UgYXJlIHJlZmVyaW5nIHRvIGEgbWVyZ2UgY29tbWl0LCBpcyB0aGF0IGNvcnJlY3QgPwo+
Cj4gSSBjYW4ndCBzZWUgYW55dGhpbmcgcmVsYXRlZCBpbiB0aGF0IGNvbW1pdCwgY2FuIHlvdSBw
bGVhc2UgcGlucG9pbnQgaXQgPwo+Cj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgb24gcG93ZXJwYyB0
aGUgbWVtb3J5IGhhcyBhbHdheXMgYmVlbiB6ZXJvaXplZAo+IChzaW5jZSAyMDA1IGF0IGxlYXN0
KS4KPgo+IENocmlzdG9waGUKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8
aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIHNvdW5kL3BwYy9wbWFjLmMg
fCAxIC0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvc291bmQvcHBjL3BtYWMuYyBiL3NvdW5kL3BwYy9wbWFjLmMKPiA+IGluZGV4IDFiMTFl
NTNmNmE2Mi4uMWFiMTJmNGY4NjMxIDEwMDY0NAo+ID4gLS0tIGEvc291bmQvcHBjL3BtYWMuYwo+
ID4gKysrIGIvc291bmQvcHBjL3BtYWMuYwo+ID4gQEAgLTU2LDcgKzU2LDYgQEAgc3RhdGljIGlu
dCBzbmRfcG1hY19kYmRtYV9hbGxvYyhzdHJ1Y3Qgc25kX3BtYWMgKmNoaXAsIHN0cnVjdCBwbWFj
X2RiZG1hICpyZWMsIGkKPiA+ICAgICAgIGlmIChyZWMtPnNwYWNlID09IE5VTEwpCj4gPiAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gICAgICAgcmVjLT5zaXplID0gc2l6ZTsKPiA+
IC0gICAgIG1lbXNldChyZWMtPnNwYWNlLCAwLCByc2l6ZSk7Cj4gPiAgICAgICByZWMtPmNtZHMg
PSAodm9pZCBfX2lvbWVtICopREJETUFfQUxJR04ocmVjLT5zcGFjZSk7Cj4gPiAgICAgICByZWMt
PmFkZHIgPSByZWMtPmRtYV9iYXNlICsgKHVuc2lnbmVkIGxvbmcpKChjaGFyICopcmVjLT5jbWRz
IC0gKGNoYXIgKilyZWMtPnNwYWNlKTsKPiA+Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbHNhLWRldmVsCg==
