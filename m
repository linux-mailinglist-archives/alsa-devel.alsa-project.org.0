Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0367ACDE6
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 14:57:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D841658;
	Sun,  8 Sep 2019 14:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D841658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567947420;
	bh=J3we+bTNiaVpPHORwJRQvYLM829nHHnxQ6omV1Z7sys=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAXI24LZSJo0h3F94I95Yh3dI9e2Z0HnaXmUkwzaUeN5se5iobnM2VkSYUVcVvQhr
	 2PguybNrA19VMkjFy3FagtEv5f1HBxvJaucOLWiUnfvfsaIZw7SqaHJJ4YJX2vuq7B
	 Y/hkFQTKoQl+C5p2aatodLoRL7yV3+8KQIlQ9ZIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63841F80157;
	Sun,  8 Sep 2019 14:55:16 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65DF3F80368; Sun,  8 Sep 2019 14:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF61AF80157
 for <Alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 14:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF61AF80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YzKqgQtT"
Received: by mail-lj1-x229.google.com with SMTP id a22so10121823ljd.0
 for <Alsa-devel@alsa-project.org>; Sun, 08 Sep 2019 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ZT5uDB8jHPC7sU/ZaL9T6dOTyQ0Q9ZIygdi24xwcQ8=;
 b=YzKqgQtTKMIDyWsf59rdWW8Erh/FCwIs1zq4Momh1edI8SsmHzeKusVgvU/Kbt4Ofx
 Q6Q7meWXL2k597eOReaobxpr0A0gZ9k5SIoLnQTNqQPxBaTjbAOgeaxW3ztuFw3s1/12
 k7afFpFKLogyGvRh9Z9YYAhKDT0cbT6PONJFil2VpqQ2of9u6hZy+Fby1a77D9zJnRJr
 tIId0sogVwkQCstg1DM1gEQb4aDkxZxmpkSA4wxBnj9Iki+r4eHgrXUnYklZp2TUqBY3
 x75pH1Fw6xxI56GPVYzMBlV3HrrSWG+uPwycTFUbq+qMIHj/RAAV0QKi01nSEVg1SHaN
 MEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ZT5uDB8jHPC7sU/ZaL9T6dOTyQ0Q9ZIygdi24xwcQ8=;
 b=j5xBW5cOLYzIaE4riGL8kDd6l8DDo2a/eNP5HwCHNoj7ZcQJDKTxGJnLqOKyFe40WB
 2p+x6tgPWnNW4slwC6BgF+OPQ7IJc+8KAzrCjMDGVzwVYOSNV/jEqseddHRFc8JYtS/A
 BVJX74XZQBjQwuUmwi2acPGIggiXTLhj9ZhGgccmA4EJlH7HwyMAf4uD2NMwA+fywt7W
 Xs+68lvHUyDOn4OqfP0RjTtQpovrzZ2wJ6pVKeaaxzCXQPjE2T7cwXMSajTWNeW+eIKW
 q9AG5fEuNqLwXRJ+h4gLqCy4hdPJuNCPRllEOYxemYIzx0U3lZx4rAlAzfjgur71riHZ
 +BXw==
X-Gm-Message-State: APjAAAW15jhnzTKuSeVfPBFbd32a+oH6TBogyShYMH+ID9aFN7GLA3Im
 YKa33r7Vz8OatKZTGDsbjztds/IHvG7ias5e/ko=
X-Google-Smtp-Source: APXvYqyOJ+2hwtmxB+HFuJsbldXMkWaZRnPk4USdEoy1v3At7wFOkdWMlS+QVUswjTKQqJJ0mIEzo3LG+XJy2oTaeqs=
X-Received: by 2002:a2e:7d08:: with SMTP id y8mr2041466ljc.125.1567947308681; 
 Sun, 08 Sep 2019 05:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <CADsNRHsGeM3bMv3Xh++QbZXeR1PBr30VkzoweyCqMKeAguXRUg@mail.gmail.com>
 <c3986f3fde3a2e008d9c2d81542aaacf9d751e62.camel@iki.fi>
In-Reply-To: <c3986f3fde3a2e008d9c2d81542aaacf9d751e62.camel@iki.fi>
From: Eric Desjardins <desjare@gmail.com>
Date: Sun, 8 Sep 2019 08:54:57 -0400
Message-ID: <CADsNRHvEkD4Vhtq+EPt+qLVebwhuniqyK3J1zUnGu-jQ5=2d5A@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] 5.1 to stereo using libasound
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

VGhhbmtzLCBteSBmaWxlIGRpZG4ndCB1c2UgdGhlIGRlZmF1bHQgY2hhbm5lbCBtYXAuCldoZXJl
IGFyZSB0aGUgZGVmYXVsdHMgYXJlIGRlZmluZWQ/CgpNYW55IHRoYW5rcyEKRXJpYwoKTGUgZGlt
LiA4IHNlcHQuIDIwMTkgw6AgMDM6NDgsIFRhbnUgS2Fza2luZW4gPHRhbnVrQGlraS5maT4gYSDD
qWNyaXQgOgoKPiBPbiBTYXQsIDIwMTktMDktMDcgYXQgMTA6MDcgLTA0MDAsIEVyaWMgRGVzamFy
ZGlucyB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IEkgYW0gcGxheWluZyBhIG1rdiB3aXRoIDUuMSBj
aGFubmVscyBmcm9tIGEgbWt2LiBJIGNvbmZpZ3VyZSBsaWJhc291bmQKPiBmb3IKPiA+IDYgY2hh
bm5lbHMgYW5kIEkgZmVlZCB0aGVtIGludGVybGVhdmUgYXVkaW8gdXNpbmcgc25kX3BjbV93cml0
ZWkuIEkgdXNlCj4gdGhlCj4gPiBkZWZhdWx0IHB1bHNlIGF1ZGlvIGRldmljZS4KPiA+Cj4gPiBT
byBmYXIsIG5vdGhpbmcgaXMgd3JvbmcuIEhvd2V2ZXIsIEkgZG8gbm90IGVhciB0aGluZ3MgY29y
cmVjdGx5LiBJCj4gbGlzdGVuCj4gPiB0aGlzIG9uIG15IHN0ZXJlbyBzcGVha2VyLiBUaGVyZSBp
cyBubyBtaXhkb3duIHRvIHN0ZXJlbyBhbmQgSSB3YXMKPiA+IHdvbmRlcmluZyBob3cgdG8gZG8g
dGhhdC4gSSB0cmllZCB0byB1c2UgY2htYXAgYXBpIGJ1dCBhbnl0aGluZyBJIHRyeSBvbgo+ID4g
dGhlIGRlZmF1bHQgZGV2aWNlIHJldHVybnMgYW4gZXJyb3IuCj4gPgo+ID4gSSB3YXMgd29uZGVy
aW5nIHdoYXQgd2FzIHRoZSBjb3JyZWN0IHdheSB0byBkbyB0aGF0Pwo+ID4gVXNpbmcgdGhlIG1p
eGluZyBhcGk/Cj4gPiBIb3cgZG8gd2UgZGV0ZWN0IHRoYXQgbXkgZGV2aWNlIG91dHB1dCBzdGVy
ZW8gaWYgY2htYXAgZG9lc24ndCB3b3JrPwo+ID4KPiA+IEkgYW0gb24gYSB1YnVudHUgMTguMDQg
bGludXggYm94Lgo+Cj4gVGhlIHB1bHNlIHBsdWdpbiB0YWtlcyB5b3VyIGF1ZGlvIGFuZCBzZW5k
cyBpdCB0byBQdWxzZUF1ZGlvIHdpdGhvdXQKPiBhbnkgbW9kaWZpY2F0aW9uLiBUaGUgQUxTQSBB
UEkgZG9lc24ndCBhbGxvdyB0aGUgYXBwbGljYXRpb24gdG8gdGVsbAo+IHRoZSBjaGFubmVsIG1h
cCBvZiB0aGUgc3RyZWFtLCBzbyBpZiB5b3Ugc2VuZCA2IGNoYW5uZWxzLCB0aGUgcHVsc2UKPiBw
bHVnaW4gYXNzdW1lcyB0aGF0IHlvdSBhcmUgdXNpbmcgdGhlIGRlZmF1bHQgNS4xIGNoYW5uZWwg
bWFwIChmcm9udC0KPiBsZWZ0LGZyb250LXJpZ2h0LHJlYXItbGVmdCxyZWFyLXJpZ2h0LGZyb250
LWNlbnRlcixsZmUpLgo+Cj4gVGhlIFB1bHNlQXVkaW8gZGFlbW9uIHRoZW4gZG93bm1peGVzIHRo
ZSBhdWRpbyB0byBzdGVyZW8gaW4gc29tZSB3YXkKPiAodGhlIGRldGFpbHMgZGVwZW5kIG9uIFB1
bHNlQXVkaW8gY29uZmlndXJhdGlvbikuIFlvdSBjYW4ndCBkZXRlY3QgZnJvbQo+IHlvdXIgQUxT
QSBhcHBsaWNhdGlvbiB3aGV0aGVyIHRoZSBkZXZpY2UgdGhhdCBQdWxzZUF1ZGlvIGlzIHVzaW5n
IGlzIGEKPiBzdGVyZW8gZGV2aWNlIG9yIHNvbWV0aGluZyBlbHNlLgo+Cj4gU2luY2UgaXQncyBh
cHBhcmVudGx5IG5vdCB3b3JraW5nIGFzIHlvdSBleHBlY3QsIGRvZXMgeW91ciBhcHBsaWNhdGlv
bgo+IHVzZSB0aGUgZGVmYXVsdCA1LjEgY2hhbm5lbCBtYXAgdGhhdCBJIG1lbnRpb25lZCBhYm92
ZT8gSXMgUHVsc2VBdWRpbwo+IGNvbmZpZ3VyZWQgdG8gZG8gcmVtaXhpbmcgKCJwdWxzZWF1ZGlv
IC0tZHVtcC1jb25mIiBzaG91bGQgc2hvdwo+ICJlbmFibGUtcmVtaXhpbmcgPSB5ZXMiKT8KPgo+
IC0tCj4gVGFudQo+Cj4gaHR0cHM6Ly93d3cucGF0cmVvbi5jb20vdGFudWsKPiBodHRwczovL2xp
YmVyYXBheS5jb20vdGFudWsKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
