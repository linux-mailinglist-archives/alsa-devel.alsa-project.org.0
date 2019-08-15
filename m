Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855738F76E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 01:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E94165E;
	Fri, 16 Aug 2019 01:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E94165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565910640;
	bh=VKTlOYyXgKt8jN/MbKkwgR4Z8KlQr3tEendgI7RUDx8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MnZmc2XN4ULXuBvid9bagW6xDZwLBAAgqXq6Ag188QjB1fWUZSo9jQ/A4CQlzR8MA
	 HUlaanQuZSOGdZLmNKjLZzKkLwIRC4XIJJlIBLCDxZxaJfbHlxmc8L9JZxQ3WbeBJs
	 5RJnW3EP7z6xrN5DI+YjkZHPNEh50hsuxSP8FKOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23DEAF80274;
	Fri, 16 Aug 2019 01:08:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15317F80274; Fri, 16 Aug 2019 01:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 754C9F8011F
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 01:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 754C9F8011F
Received: by mail-ua1-f66.google.com with SMTP id m23so1405830uaq.11
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 16:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1FLRDc0UxawqxQMEcJJkW9dZ0hrvrio2PcFYdwXNCDY=;
 b=Iqs7jrPOFeVZfhOrMIAk0tnSaV6P926KaLFgmFNvL1ZmZLTNFWKdgN82UFr/U/aiot
 GSgdJT++QMvN6qQITHmEZQcG/x18oNo61hwrdYpua7nqayi8j6FOSjkoIAWYiyxhhZku
 BIbWzRB4TGa9y0Qgj5rVfOV3t5/fT8wyIzik4INzrT0KaPS0noFHIr4o7CmMhHZRulya
 tpAJQNfnxuYZdjVv/6gdXluuJQdFBjHIBR6IOR0BMgMuT6GoSK98ulLETN8jrAkucfZq
 xx6JJiFGQk7W5F6EVevgx0LEJgUTHfOo4gW6At+VOdlgQ2jakNNZndx++XwewZEyma8E
 HijQ==
X-Gm-Message-State: APjAAAUhtreR/LQ1vs3+80jdKy2p8f4WupX2AwwWg2zX2jiq2bZKNtGj
 U8UlZTsmGywt4XNzPzrEj39/ziLsiDb752YjJPc=
X-Google-Smtp-Source: APXvYqzH5Vs73TKkMMXFqFvdVU6KMzNWFvT0HO8RVylOEfnqdwcaTHH59CM98fc6vCAtkf4cp+ap8Yhfv0VHAjMxWZY=
X-Received: by 2002:ab0:30e8:: with SMTP id d8mr4657336uam.117.1565910526456; 
 Thu, 15 Aug 2019 16:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190815013824.13373-1-jeronimo@borque.com.ar>
 <s5hv9uz9dh3.wl-tiwai@suse.de>
 <CAHNnQd+B5UGKJBq+ikDBYa20vzL=Fj9tDGNeRZGp5qxcSiEDhQ@mail.gmail.com>
 <s5ha7ca9x4x.wl-tiwai@suse.de>
In-Reply-To: <s5ha7ca9x4x.wl-tiwai@suse.de>
From: =?UTF-8?Q?Jer=C3=B3nimo_Borque?= <jeronimo@borque.com.ar>
Date: Thu, 15 Aug 2019 20:08:34 -0300
Message-ID: <CAHNnQdJayqx51EGwh0g9WHpcSi2poQv47-NpZPq=Crrm8p9mvg@mail.gmail.com>
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

RWwganVlLiwgMTUgZGUgYWdvLiBkZSAyMDE5IGEgbGEocykgMTQ6MDYsIFRha2FzaGkgSXdhaSAo
dGl3YWlAc3VzZS5kZSkKZXNjcmliacOzOgoKPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IDE4OjMzOjUw
ICswMjAwLAo+IEplcsOzbmltbyBCb3JxdWUgd3JvdGU6Cj4gPgo+ID4gSGkgVGFrYXNoaSwKPiA+
IE1vZGlmeWluZyBNaWMgTXV0ZS1MRUQgTW9kZSBkb2VzIGluZGVlZCBhbHRlciB0aGUgYmVoYXZp
b3IuIFRoZSB0aGluZyBpcwo+IHRoYXQKPiA+IHRoaXMgZW5kcyBiZWluZyBjb25mdXNpbmcgYXMg
aW4gYWxsIG1hY2hpbmVzIEkndmUgYmVlbiB0ZXN0aW5nIHRoaXMKPiBzZXR0aW5nCj4gPiBNaWMg
TXV0ZS1MRUQgTW9kZSB0byAiRm9sbG93IENhcHR1cmUiIGFjdHVhbGx5IG1ha2VzIGl0IGZvbGxv
dyBtdXRlLCBhcwo+ID4gc2V0dGluZyBpdCB0byAiT24iIHR1cm5zIHRoZSBMRUQgb2ZmLgo+ID4g
VGhlcmUgaXMgb3RoZXIgc2V0dGluZyBjYWxsZWQgIm11dGVfbGVkX3BvbGFyaXR5IiBidXQgdGhp
cyBkb2VzIG5vdAo+IHdvcmssIGFzCj4gPiBjdXJyZW50bHkgbWljIG11dGUgTEVEIGFuZCBtdXRl
IExFRCBkbyBub3QgZm9sbG93IHRoZSBzYW1lIGxvZ2ljLgo+ID4gV2hhdCBJIHRoaW5rIG1heSBi
ZSBjYXVzaW5nIGNvbmZ1c2lvbiBpcyAiY3h0X3VwZGF0ZV9ncGlvX2xlZCIgImVuYWJsZWQiCj4g
PiBwYXJhbWV0ZXIuIFNldHRpbmcgImVuYWJsZWQiIHRvICJ0cnVlIiBzZXRzIHRoZSBHUElPIHBp
biB0byAwIGNhdXNpbmcKPiB0aGUgbGVkCj4gPiB0byBiZSB0dXJuZWQgb2ZmLiBJIHRoaW5rICJl
bmFibGVkIiB1c2VkIHRvIHJlZmVyIHRvIHRoZSBpbnB1dCBjYXB0dXJlIG9yCj4gPiBvdXRwdXQg
c3RhdHVzIGFuZCBub3QgdG8gdGhlIExFRCBiZWluZyBsaXQgb3Igbm90LiBPdXRwdXQgb3IgaW5w
dXQgbm90Cj4gZW5hYmxlZAo+ID4gKGVuYWJsZWQ9PWZhbHNlKSBjYXVzZWQgdGhlIExFRCB0byBi
ZSB0dXJuZWQgb24uCj4gPiBUaGlzIGxvZ2ljIGluIHRoZSBmdW5jdGlvbiBuZWdhdGVzIGl0IG9u
IHRoZSBHUElPIG91dHB1dC4KPiA+Cj4gPiBpZiAoZW5hYmxlZCkKPiA+ICAgICBzcGVjLT5ncGlv
X2xlZCAmPSB+bWFzazsKPiA+IGVsc2UKPiA+ICAgICBzcGVjLT5ncGlvX2xlZCB8PSBtYXNrOwo+
ID4KPiA+IE1heSBiZSBJIGNhbiBkbyBhIG1vcmUgY29tcHJlaGVuc2l2ZSBmaXgsIHJldmVyc2lu
ZyB0aGUgYmVoYXZpb3Igb2YKPiA+ICJjeHRfdXBkYXRlX2dwaW9fbGVkIiAiZW5hYmxlZCIgcGFy
YW1ldGVyIHRvIHJlZmVyIHRoZSBHUElPIG91dHB1dCB2YWx1ZQo+ICgKPiA+IGVuYWJsZWQ9PXRy
dWUgPT4gR1BJTyBwaW4gb3V0cHV0IGhpZ2ggKQo+ID4gVGhlbiBhbHNvIG1vZGlmeSB0aGUgY2Fs
bCB0byAiY3h0X3VwZGF0ZV9ncGlvX2xlZCIgaW4KPiA+ICJjeHRfZml4dXBfZ3Bpb19tdXRlX2hv
b2siIHRvIG1ha2UgaXQgd29yayBjb25zaXN0ZW50bHkuCj4KPiBPSywgaWYgdGhlICJPbiIgdHVy
bnMgdGhlIExFRCBvZmYsIGl0J3MgaW5kZWVkIGludmVydGVkLgo+IFRoZW4gd2UnZCBuZWVkIHRv
IGNvbnNpZGVyIGJvdGggZml4aW5nIHRoZSBpbnZlcnRlZCBiZWhhdmlvciBhbmQgdGhlCj4gZGVm
YXVsdCBtaWMtbXV0ZSBtb2RlLgo+Cj4gQ291bGQgeW91IGNvbmZpcm0gdGhlIGZvbGxvd2luZz8K
Pgo+IC0gV2hpY2ggbW9kZWxzIGFuZCBjb2RlY3MgYXJlIGNoZWNrZWQ/Cj4KCkkndmUgdGVzdGVk
IG9uIEhQIFpCb29rIDE1VSBHMyAoQ29uZXhhbnQgQ1gyMDcyNCkgYW5kIEhQIFByb2Jvb2sgNDQw
IEc0CihDb25leGFudCBDWDgyMDApCgoKPiAtIEdQSU8gcGluIGhpZ2ggPSBtaWMgTEVEIG9uIG9y
IG9mZj8KPgoKIEdQSU8gcGluIGhpZ2ggPSBtaWMgTEVEIG9uCgoKPiAtIEhvdyBpcyB0aGUgZXhw
ZWN0ZWQgYmVoYXZpb3Igb24gV2luZG93cz8KPiAgICBNdXRlIGlzIG9uIHdoZW4gbWljIGlzIG11
dGVkLCBvciBtdXRlLW9uIHdoZW4gbWljIGlzIHJlYWR5PwoKCk11dGUgbGVkIGlzIG9uIHdoZW4g
bWljIGlzIG11dGVkLgoKClRoYW5rcywKSmVyw7NuaW1vCgoKPgo+IHRoYW5rcywKPgo+IFRha2Fz
aGkKPgo+ID4KPiA+IFRoYW5rcywKPiA+IEplcsOzbmltbwo+ID4KPiA+IEVsIGp1ZS4sIDE1IGRl
IGFnby4gZGUgMjAxOSBhIGxhKHMpIDAyOjU4LCBUYWthc2hpIEl3YWkgKHRpd2FpQHN1c2UuZGUp
Cj4gPiBlc2NyaWJpw7M6Cj4gPgo+ID4gICAgIE9uIFRodSwgMTUgQXVnIDIwMTkgMDM6Mzg6MjQg
KzAyMDAsCj4gPiAgICAgPGplcm9uaW1vQGJvcnF1ZS5jb20uYXI+IHdyb3RlOgo+ID4gICAgID4K
PiA+ICAgICA+IEZyb206IEplcm9uaW1vIEJvcnF1ZSA8amVyb25pbW9AYm9ycXVlLmNvbS5hcj4K
PiA+ICAgICA+Cj4gPiAgICAgPiAiZW5hYmxlZCIgcGFyYW1ldGVyIGhpc3RvcmljYWxseSByZWZl
cnJlZCB0byB0aGUgZGV2aWNlIGlucHV0IG9yCj4gPiAgICAgPiBvdXRwdXQsIG5vdCB0byB0aGUg
bGVkIGluZGljYXRvci4gQWZ0ZXIgdGhlIGNoYW5nZXMgYWRkZWQgd2l0aCB0aGUKPiA+ICAgICA+
IGxlZCBoZWxwZXIgZnVuY3Rpb25zIHRoZSBtaWMgbXV0ZSBsZWQgbG9naWMgcmVmZXJzIHRvIHRo
ZSBsZWQgYW5kCj4gbm90Cj4gPiAgICAgPiB0byB0aGUgbWljIGlucHV0IHdoaWNoIGNhdXNlZCBs
ZWQgaW5kaWNhdG9yIHRvIGJlIG5lZ2F0ZWQgKE1pYyBtdXRlCj4gPiAgICAgPiBsZWQgd2FzIG9u
IHdoZW4gdGhlIGlucHV0IGVuYWJsZWQpIEZpeGluZyBpdCBpbiB0aGUgY2FsbCB0bwo+ID4gICAg
ID4gY3h0X3VwZGF0ZV9ncGlvX2xlZCBhdCB0aGUgY3h0X2dwaW9fbWljbXV0ZV91cGRhdGUgaG9v
ay4KPiA+ICAgICA+IE1heWJlIG1vcmUgY2hhbmdlcyBhcmUgcmVxdWlyZWQgdG8gYmUgY29uc2lz
dGVudCBldmVyeXdoZXJlLgo+ID4gICAgID4KPiA+ICAgICA+IFNpZ25lZC1vZmYtYnk6IEplcm9u
aW1vIEJvcnF1ZSA8amVyb25pbW9AYm9ycXVlLmNvbS5hcj4KPiA+Cj4gPiAgICAgQ291bGQgeW91
IGNoZWNrIHdoaWNoIHZhbHVlIHlvdSBoYXZlIGluICJNaWMgTXV0ZS1MRUQgTW9kZSIgbWl4ZXIK
PiA+ICAgICBlbGVtZW50PyAgSSBndWVzcyBpdCdzICJGb2xsb3cgTXV0ZSIuICBJZiBzbywgY2hh
bmdlIGl0IHRvICJGb2xsb3cKPiA+ICAgICBDYXB0dXJlIi4KPiA+Cj4gPiAgICAgSWYgdGhpcyB3
b3JrcywgaXQgbWVhbnMgdGhhdCB0aGUgZHJpdmVyIHdvcmtzIGFzIGV4cGVjdGVkIGJ1dCB0aGUK
PiA+ICAgICBwcm9ibGVtIGlzIG9ubHkgYWJvdXQgdGhlIGRlZmF1bHQgdmFsdWUuICBUaGUgZGVm
YXVsdCB2YWx1ZSBzZXQgaW4KPiB0aGUKPiA+ICAgICBnZW5lcmljIHBhcnNlciBpcyBiYXNlZCBv
biBvdGhlciBtYWNoaW5lJ3Mgc3RhbmRhcmQgKExFRCBvbiBhdCBtaWMKPiA+ICAgICBvZmYpLCB3
aGlsZSBzb21lIG1hY2hpbmVzIG1pZ2h0IGV4cGVjdCBkaWZmZXJlbnRseS4gIE9uIHN1Y2gKPiBt
YWNoaW5lcywKPiA+ICAgICB3ZSBuZWVkIHRvIHNldCB0aGUgZGlmZmVyZW50IHZhbHVlIGluaXRp
YWxseSBpbiB0aGUgcXVpcmsgZml4dXAuCj4gPgo+ID4gICAgIHRoYW5rcywKPiA+Cj4gPiAgICAg
VGFrYXNoaQo+ID4KPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
