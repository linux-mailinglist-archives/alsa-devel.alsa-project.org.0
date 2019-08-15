Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35A8F0AE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 18:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6FFC845;
	Thu, 15 Aug 2019 18:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6FFC845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565886964;
	bh=8fqQ5GoPLdajb/t22GXgQxL44rbb4X5kOqy4y57J4M0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XFqJYcqmCIjqUo8NOg4XWi8kRJe1C1G5J3Zp7CKZT5TvWOV5Up1odVitkOTV6AHC7
	 3FyGmEnBK8nzqgvloczuXfp/NIEecGnzqiYmej5IZJJrG1SHwJ7KsgkFv7+2npKGc6
	 FmmBVTcUVGd0NdP4VcnlXtK9djULZxH2Qdm0Vr10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A73F8044C;
	Thu, 15 Aug 2019 18:34:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F1C5F80274; Thu, 15 Aug 2019 18:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 709ABF8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 18:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709ABF8015B
Received: by mail-vk1-f196.google.com with SMTP id x20so504305vkd.6
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 09:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+J7+uuG7YhQob1RyY96ZlqIM0yfV+E9La0KzJcwKvM=;
 b=A/Khhv5TVikclECNX65M7whRA2t3XjU9VCV+PY6pQdckwfTevsuJ3sXe4yxAdz7gBh
 F/YCSWL09BhiAwRW1URt1dQHseNT1ohjOsYd9vDeAcZtZPo+ypyUz4+ARH+LBd8ms7Ek
 tgL9bmDC0wH3jyHK8o4m04zY2EBrHDESh7eqpe8r8WEnDHYEreX0cj7pDc+Z6xJ4kHOJ
 6H7faQijluJvUYOluNfdRuOp9ShbHvOosIeToXio/CZzXw5sknykU2MXf7QuQ/HcASny
 QhF0W0ZeN8zr352GTppeTAhEJlv8h216LYT+n5l2eB2N9nFF4f/WyjwET1wP9s61OEM7
 eoug==
X-Gm-Message-State: APjAAAXpwTkeUAy8kcJSfuTH4AUoVfHKtZdjDQeORwU5PqOryB/YLmM3
 tjb/y+rnKljqFIaD8js9mwUpBECYXFRY8pwcbOU=
X-Google-Smtp-Source: APXvYqzrPu6PHd1a26kJUfqiia8+9ZpV26VJRIyCa7h11U+cPcpGrUbFVi225rJxDObpBE0eFtPx8/ZzUwydmfYc/MM=
X-Received: by 2002:a1f:4304:: with SMTP id q4mr1167456vka.3.1565886847009;
 Thu, 15 Aug 2019 09:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190815013824.13373-1-jeronimo@borque.com.ar>
 <s5hv9uz9dh3.wl-tiwai@suse.de>
In-Reply-To: <s5hv9uz9dh3.wl-tiwai@suse.de>
From: =?UTF-8?Q?Jer=C3=B3nimo_Borque?= <jeronimo@borque.com.ar>
Date: Thu, 15 Aug 2019 13:33:50 -0300
Message-ID: <CAHNnQd+B5UGKJBq+ikDBYa20vzL=Fj9tDGNeRZGp5qxcSiEDhQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - Fixes inverted Conexant GPIO
	mic mute led
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

SGkgVGFrYXNoaSwKTW9kaWZ5aW5nIE1pYyBNdXRlLUxFRCBNb2RlIGRvZXMgaW5kZWVkIGFsdGVy
IHRoZSBiZWhhdmlvci4gVGhlIHRoaW5nIGlzCnRoYXQgdGhpcyBlbmRzIGJlaW5nIGNvbmZ1c2lu
ZyBhcyBpbiBhbGwgbWFjaGluZXMgSSd2ZSBiZWVuIHRlc3RpbmcgdGhpcwpzZXR0aW5nIE1pYyBN
dXRlLUxFRCBNb2RlIHRvICJGb2xsb3cgQ2FwdHVyZSIgYWN0dWFsbHkgbWFrZXMgaXQgZm9sbG93
Cm11dGUsIGFzIHNldHRpbmcgaXQgdG8gIk9uIiB0dXJucyB0aGUgTEVEIG9mZi4KVGhlcmUgaXMg
b3RoZXIgc2V0dGluZyBjYWxsZWQgIm11dGVfbGVkX3BvbGFyaXR5IiBidXQgdGhpcyBkb2VzIG5v
dCB3b3JrLAphcyBjdXJyZW50bHkgbWljIG11dGUgTEVEIGFuZCBtdXRlIExFRCBkbyBub3QgZm9s
bG93IHRoZSBzYW1lIGxvZ2ljLgpXaGF0IEkgdGhpbmsgbWF5IGJlIGNhdXNpbmcgY29uZnVzaW9u
IGlzICJjeHRfdXBkYXRlX2dwaW9fbGVkIiAiZW5hYmxlZCIKcGFyYW1ldGVyLiBTZXR0aW5nICJl
bmFibGVkIiB0byAidHJ1ZSIgc2V0cyB0aGUgR1BJTyBwaW4gdG8gMCBjYXVzaW5nIHRoZQpsZWQg
dG8gYmUgdHVybmVkIG9mZi4gSSB0aGluayAiZW5hYmxlZCIgdXNlZCB0byByZWZlciB0byB0aGUg
aW5wdXQgY2FwdHVyZQpvciBvdXRwdXQgc3RhdHVzIGFuZCBub3QgdG8gdGhlIExFRCBiZWluZyBs
aXQgb3Igbm90LiBPdXRwdXQgb3IgaW5wdXQgbm90CmVuYWJsZWQgKGVuYWJsZWQ9PWZhbHNlKSBj
YXVzZWQgdGhlIExFRCB0byBiZSB0dXJuZWQgb24uClRoaXMgbG9naWMgaW4gdGhlIGZ1bmN0aW9u
IG5lZ2F0ZXMgaXQgb24gdGhlIEdQSU8gb3V0cHV0LgoKaWYgKGVuYWJsZWQpCiAgICBzcGVjLT5n
cGlvX2xlZCAmPSB+bWFzazsKZWxzZQogICAgc3BlYy0+Z3Bpb19sZWQgfD0gbWFzazsKCk1heSBi
ZSBJIGNhbiBkbyBhIG1vcmUgY29tcHJlaGVuc2l2ZSBmaXgsIHJldmVyc2luZyB0aGUgYmVoYXZp
b3Igb2YKImN4dF91cGRhdGVfZ3Bpb19sZWQiICJlbmFibGVkIiBwYXJhbWV0ZXIgdG8gcmVmZXIg
dGhlIEdQSU8gb3V0cHV0IHZhbHVlICgKZW5hYmxlZD09dHJ1ZSA9PiBHUElPIHBpbiBvdXRwdXQg
aGlnaCApClRoZW4gYWxzbyBtb2RpZnkgdGhlIGNhbGwgdG8gImN4dF91cGRhdGVfZ3Bpb19sZWQi
IGluCiJjeHRfZml4dXBfZ3Bpb19tdXRlX2hvb2siIHRvIG1ha2UgaXQgd29yayBjb25zaXN0ZW50
bHkuCgpUaGFua3MsCkplcsOzbmltbwoKCkVsIGp1ZS4sIDE1IGRlIGFnby4gZGUgMjAxOSBhIGxh
KHMpIDAyOjU4LCBUYWthc2hpIEl3YWkgKHRpd2FpQHN1c2UuZGUpCmVzY3JpYmnDszoKCj4gT24g
VGh1LCAxNSBBdWcgMjAxOSAwMzozODoyNCArMDIwMCwKPiA8amVyb25pbW9AYm9ycXVlLmNvbS5h
cj4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogSmVyb25pbW8gQm9ycXVlIDxqZXJvbmltb0Bib3JxdWUu
Y29tLmFyPgo+ID4KPiA+ICJlbmFibGVkIiBwYXJhbWV0ZXIgaGlzdG9yaWNhbGx5IHJlZmVycmVk
IHRvIHRoZSBkZXZpY2UgaW5wdXQgb3IKPiA+IG91dHB1dCwgbm90IHRvIHRoZSBsZWQgaW5kaWNh
dG9yLiBBZnRlciB0aGUgY2hhbmdlcyBhZGRlZCB3aXRoIHRoZQo+ID4gbGVkIGhlbHBlciBmdW5j
dGlvbnMgdGhlIG1pYyBtdXRlIGxlZCBsb2dpYyByZWZlcnMgdG8gdGhlIGxlZCBhbmQgbm90Cj4g
PiB0byB0aGUgbWljIGlucHV0IHdoaWNoIGNhdXNlZCBsZWQgaW5kaWNhdG9yIHRvIGJlIG5lZ2F0
ZWQgKE1pYyBtdXRlCj4gPiBsZWQgd2FzIG9uIHdoZW4gdGhlIGlucHV0IGVuYWJsZWQpIEZpeGlu
ZyBpdCBpbiB0aGUgY2FsbCB0bwo+ID4gY3h0X3VwZGF0ZV9ncGlvX2xlZCBhdCB0aGUgY3h0X2dw
aW9fbWljbXV0ZV91cGRhdGUgaG9vay4KPiA+IE1heWJlIG1vcmUgY2hhbmdlcyBhcmUgcmVxdWly
ZWQgdG8gYmUgY29uc2lzdGVudCBldmVyeXdoZXJlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpl
cm9uaW1vIEJvcnF1ZSA8amVyb25pbW9AYm9ycXVlLmNvbS5hcj4KPgo+IENvdWxkIHlvdSBjaGVj
ayB3aGljaCB2YWx1ZSB5b3UgaGF2ZSBpbiAiTWljIE11dGUtTEVEIE1vZGUiIG1peGVyCj4gZWxl
bWVudD8gIEkgZ3Vlc3MgaXQncyAiRm9sbG93IE11dGUiLiAgSWYgc28sIGNoYW5nZSBpdCB0byAi
Rm9sbG93Cj4gQ2FwdHVyZSIuCj4KPiBJZiB0aGlzIHdvcmtzLCBpdCBtZWFucyB0aGF0IHRoZSBk
cml2ZXIgd29ya3MgYXMgZXhwZWN0ZWQgYnV0IHRoZQo+IHByb2JsZW0gaXMgb25seSBhYm91dCB0
aGUgZGVmYXVsdCB2YWx1ZS4gIFRoZSBkZWZhdWx0IHZhbHVlIHNldCBpbiB0aGUKPiBnZW5lcmlj
IHBhcnNlciBpcyBiYXNlZCBvbiBvdGhlciBtYWNoaW5lJ3Mgc3RhbmRhcmQgKExFRCBvbiBhdCBt
aWMKPiBvZmYpLCB3aGlsZSBzb21lIG1hY2hpbmVzIG1pZ2h0IGV4cGVjdCBkaWZmZXJlbnRseS4g
IE9uIHN1Y2ggbWFjaGluZXMsCj4gd2UgbmVlZCB0byBzZXQgdGhlIGRpZmZlcmVudCB2YWx1ZSBp
bml0aWFsbHkgaW4gdGhlIHF1aXJrIGZpeHVwLgo+Cj4KPiB0aGFua3MsCj4KPiBUYWthc2hpCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
