Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F4691A62
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 02:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1961672;
	Mon, 19 Aug 2019 02:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1961672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566173011;
	bh=SermIRYX84dRRahgkv0j1ISQl+M81c0rppBk33/GOTM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ltnOPJndNnBXS4OdOJ4ioP76fmReVJLerZo/z0xpbMS84zUwvt/g8qxYeS9lnEPGK
	 UqBkvr7u5BWcI0/9EHgQGZf4MLXU7kECYqIohnFLQBpZGlN61tbadx47LZDsW3rkW1
	 J4XuMmtnnyEPAZd6SBYGGEutJrz2ufaD42BqGiuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E277F8036D;
	Mon, 19 Aug 2019 02:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B29F80321; Mon, 19 Aug 2019 02:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EA49F801D9
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 02:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA49F801D9
Received: by mail-vk1-f194.google.com with SMTP id r13so20181vke.12
 for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2019 17:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lywJlCLAeAKftJJXWFJ+g7vJE4gk4k5uyV1pBXPGGlY=;
 b=VbG8z+fkGg3utTJDG1PDRG4yg2Fm6goTMlJ8xqUmvtgFVdxd8Isrwr6vc2Q4SOi48s
 NMeWN6aBGLgUjxrJh6qVcCmh2nDPJB/G0qa8g4zvi2NC+Hgoqn1YSxOOM+j2N8KzyWaD
 ob6duY4InVSzvHzKLTy6AbGhr84C6r0h8oSH6d9JPL8o67pVV12Oes/FQlpleFYG/irs
 DPK2HoXEBzWZdorYlbwmh/CPTxAk9avLg2dPeFQalNddsfOux/keQRNBbsZXxgnY/Fgo
 gCIuzUyoS/8ghwOEP43Qt+zpL5dnVu2yAJ8T8yzeC7yGGbwqm6BjZ2fu3pr3Fv/e0Sgg
 U3WQ==
X-Gm-Message-State: APjAAAUaLDVFh+ODcKisvRtL3ytxHs0qEtv44yNky/zz4xzMjw7fwfQP
 kjUvdx4G6gN4pMNr+Zoh53zCOtNpZDM5bHSvN5O/dw9l
X-Google-Smtp-Source: APXvYqwT7NLhWdVH8ICUb1YV3sxwOJzzzbJiFkR6S1Z0npbPPJfbQ75ZJDkk7XDmJzUDlndb2bbaMjqMLd9rNbBa6WQ=
X-Received: by 2002:ac5:c4cc:: with SMTP id a12mr5009957vkl.28.1566172893993; 
 Sun, 18 Aug 2019 17:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <s5himqx8tzj.wl-tiwai@suse.de>
 <20190818212302.27430-1-jeronimo@borque.com.ar>
In-Reply-To: <20190818212302.27430-1-jeronimo@borque.com.ar>
From: =?UTF-8?Q?Jer=C3=B3nimo_Borque?= <jeronimo@borque.com.ar>
Date: Sun, 18 Aug 2019 21:01:17 -0300
Message-ID: <CAHNnQdJMQes-3Goug-W0003M2fKn9wfbS173wAPCyVfedsj7Bg@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH v2] ALSA: hda - Fixes inverted Conexant
	GPIO mic mute led
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

SSdtIHNvcnJ5LiBJJ3ZlIHNlbnQgYSB3cm9uZyBwYXRjaCBmaWxlLgpJJ2xsIHJlc3VibWl0IHRo
ZSByaWdodCBwYXRjaCBzaG9ydGx5LgpUaGFua3MsCkplcsOzbmltbwoKRWwgZG9tLiwgMTggZGUg
YWdvLiBkZSAyMDE5IGEgbGEocykgMTg6MjMsIDxqZXJvbmltb0Bib3JxdWUuY29tLmFyPgplc2Ny
aWJpw7M6Cgo+IEZyb206IEplcm9uaW1vIEJvcnF1ZSA8amVyb25pbW9AYm9ycXVlLmNvbS5hcj4K
Pgo+ICJlbmFibGVkIiBwYXJhbWV0ZXIgaGlzdG9yaWNhbGx5IHJlZmVycmVkIHRvIHRoZSBkZXZp
Y2UgaW5wdXQgb3IKPiBvdXRwdXQsIG5vdCB0byB0aGUgbGVkIGluZGljYXRvci4gQWZ0ZXIgdGhl
IGNoYW5nZXMgYWRkZWQgd2l0aCB0aGUgbGVkCj4gaGVscGVyIGZ1bmN0aW9ucyB0aGUgbWljIG11
dGUgbGVkIGxvZ2ljIHJlZmVycyB0byB0aGUgbGVkIGFuZCBub3QgdG8KPiB0aGUgbWljIGlucHV0
IHdoaWNoIGNhdXNlZCBsZWQgaW5kaWNhdG9yIHRvIGJlIG5lZ2F0ZWQuCj4gRml4aW5nIGxvZ2lj
IGluIGN4dF91cGRhdGVfZ3Bpb19sZWQgYW5kIHVwZGF0ZWQKPiBjeHRfZml4dXBfZ3Bpb19tdXRl
X2hvb2sKPiBBbHNvIHVwZGF0ZWQgZGVidWcgbWVzc2FnZXMgdG8gZWFzZSBmdXJ0aGVyIGRlYnVn
Z2luZyBpZiBuZWNlc3NhcnkuCj4KPiBTdWdnZXN0ZWQtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlA
c3VzZS5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBKZXJvbmltbyBCb3JxdWUgPGplcm9uaW1vQGJvcnF1
ZS5jb20uYXI+Cj4gLS0tCj4gIHNvdW5kL3BjaS9oZGEvcGF0Y2hfY29uZXhhbnQuYyB8IDE3ICsr
KysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9jb25leGFudC5j
Cj4gYi9zb3VuZC9wY2kvaGRhL3BhdGNoX2NvbmV4YW50LmMKPiBpbmRleCAxNDI5OGVmNDViMjEu
LmQxYzkzZGZhMTU4YiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX2NvbmV4YW50
LmMKPiArKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX2NvbmV4YW50LmMKPiBAQCAtNjExLDE4ICs2
MTEsMjAgQEAgc3RhdGljIHZvaWQgY3h0X2ZpeHVwX2hwX2dhdGVfbWljX2phY2soc3RydWN0Cj4g
aGRhX2NvZGVjICpjb2RlYywKPgo+ICAvKiB1cGRhdGUgTEVEIHN0YXR1cyB2aWEgR1BJTyAqLwo+
ICBzdGF0aWMgdm9pZCBjeHRfdXBkYXRlX2dwaW9fbGVkKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVj
LCB1bnNpZ25lZCBpbnQKPiBtYXNrLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ym9vbCBlbmFibGVkKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBsZWRf
b24pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBjb25leGFudF9zcGVjICpzcGVjID0gY29kZWMtPnNw
ZWM7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgb2xkdmFsID0gc3BlYy0+Z3Bpb19sZWQ7Cj4KPiAg
ICAgICAgIGlmIChzcGVjLT5tdXRlX2xlZF9wb2xhcml0eSkKPiAtICAgICAgICAgICAgICAgZW5h
YmxlZCA9ICFlbmFibGVkOwo+ICsgICAgICAgICAgICAgICBsZWRfb24gPSAhbGVkX29uOwo+Cj4g
LSAgICAgICBpZiAoZW5hYmxlZCkKPiAtICAgICAgICAgICAgICAgc3BlYy0+Z3Bpb19sZWQgJj0g
fm1hc2s7Cj4gLSAgICAgICBlbHNlCj4gKyAgICAgICBpZiAobGVkX29uKQo+ICAgICAgICAgICAg
ICAgICBzcGVjLT5ncGlvX2xlZCB8PSBtYXNrOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAg
ICAgICBzcGVjLT5ncGlvX2xlZCAmPSB+bWFzazsKPiArICAgICAgIGNvZGVjX2RiZyhjb2RlYywg
Im1hc2s6JWQgZW5hYmxlZDolZCBncGlvX2xlZDolZFxuCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgbWFzaywgbGVkX29uLCBzcGVjLT5ncGlvX2xlZCk7Cj4gICAgICAgICBpZiAoc3BlYy0+Z3Bp
b19sZWQgIT0gb2xkdmFsKQo+ICAgICAgICAgICAgICAgICBzbmRfaGRhX2NvZGVjX3dyaXRlKGNv
ZGVjLCAweDAxLCAwLCBBQ19WRVJCX1NFVF9HUElPX0RBVEEsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3BlYy0+Z3Bpb19sZWQpOwo+IEBAIC02MzMsOCArNjM1LDggQEAg
c3RhdGljIHZvaWQgY3h0X2ZpeHVwX2dwaW9fbXV0ZV9ob29rKHZvaWQKPiAqcHJpdmF0ZV9kYXRh
LCBpbnQgZW5hYmxlZCkKPiAgewo+ICAgICAgICAgc3RydWN0IGhkYV9jb2RlYyAqY29kZWMgPSBw
cml2YXRlX2RhdGE7Cj4gICAgICAgICBzdHJ1Y3QgY29uZXhhbnRfc3BlYyAqc3BlYyA9IGNvZGVj
LT5zcGVjOwo+IC0KPiAtICAgICAgIGN4dF91cGRhdGVfZ3Bpb19sZWQoY29kZWMsIHNwZWMtPmdw
aW9fbXV0ZV9sZWRfbWFzaywgZW5hYmxlZCk7Cj4gKyAgICAgICAvKiBtdXRlZCAtPiBMRUQgb24g
Ki8KPiArICAgICAgIGN4dF91cGRhdGVfZ3Bpb19sZWQoY29kZWMsIHNwZWMtPmdwaW9fbXV0ZV9s
ZWRfbWFzaywgIWVuYWJsZWQpOwo+ICB9Cj4KPiAgLyogdHVybiBvbi9vZmYgbWljLW11dGUgTEVE
IHZpYSBHUElPIHBlciBjYXB0dXJlIGhvb2sgKi8KPiBAQCAtNjU2LDcgKzY1OCw2IEBAIHN0YXRp
YyB2b2lkIGN4dF9maXh1cF9tdXRlX2xlZF9ncGlvKHN0cnVjdCBoZGFfY29kZWMKPiAqY29kZWMs
Cj4gICAgICAgICAgICAgICAgIHsgMHgwMSwgQUNfVkVSQl9TRVRfR1BJT19ESVJFQ1RJT04sIDB4
MDMgfSwKPiAgICAgICAgICAgICAgICAge30KPiAgICAgICAgIH07Cj4gLSAgICAgICBjb2RlY19p
bmZvKGNvZGVjLCAiYWN0aW9uOiAlZCBncGlvX2xlZDogJWRcbiIsIGFjdGlvbiwKPiBzcGVjLT5n
cGlvX2xlZCk7Cj4KPiAgICAgICAgIGlmIChhY3Rpb24gPT0gSERBX0ZJWFVQX0FDVF9QUkVfUFJP
QkUpIHsKPiAgICAgICAgICAgICAgICAgc3BlYy0+Z2VuLnZtYXN0ZXJfbXV0ZS5ob29rID0gY3h0
X2ZpeHVwX2dwaW9fbXV0ZV9ob29rOwo+IC0tCj4gMi4yMS4wCj4KPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
