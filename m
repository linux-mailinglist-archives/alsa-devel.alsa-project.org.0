Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503AED8F0E
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 13:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D01D815E2;
	Wed, 16 Oct 2019 13:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D01D815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571224438;
	bh=p4QaABNgesJaF3FXigazRZ2MBJtR8f/9Se6dbN6rItg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xx2bAuRTOCLVnb0IUGvDXLfIlRz3XQnf0uBL5eTM00ul+Rmu6HSGs/KiH6rU7PXtE
	 jPO1MN8ZtktQD0v2FALQsiDSrDOU0F0QgFaDTEt5HxsFxgnsAxgTdimodAn/JbcVP7
	 piDrnkpa6RtT6msvOuny/cr1aQ1KxHY0tx6Ofybg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80598F80362;
	Wed, 16 Oct 2019 13:12:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5157F80362; Wed, 16 Oct 2019 13:12:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A007F8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 13:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A007F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gqMnE4f/"
Received: by mail-wm1-x344.google.com with SMTP id r19so2462175wmh.2
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nrMycvm/TZl3jJZmVZTvx/He0214xW5FqKNP+hxfLIg=;
 b=gqMnE4f/qoqVvdLxsy9u8JkqKlmYCHzOtLKq32whWOzqEXPL5iX9ImvaYOvGHWhRXL
 qe29dLLpB08/acFcKHAOLDoUDzVfa5flISXLONwRNZUV40hH/YqZ8n/MSZfMUsgu7vSw
 44G7lbkPCYS5eOyNIqPrzwBSnegV4oyhd5uMVsnJIjYbGnY5BckZpwVSCNq4AtqAiCn/
 If9ZEw/H7TFDGtPmGPJxqvXUBNJDHkoIbUHiKJ1iefAOgDYmBF4bTk2zK9f2DEY/kLwj
 WbThEyEsTqepJtiasQsdlKgiMbEwQyjV31yCFiyqdg9SQeKNwzNUi0SSPbt5oTj/7dM1
 mV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nrMycvm/TZl3jJZmVZTvx/He0214xW5FqKNP+hxfLIg=;
 b=QXVOye7qMF2i0zPkOwQMAmuLvrgW6szgB0ousVbjBQB/UheZV7+YRmdGmytsmUobSd
 6BZO7vtZsd706WPDjbuqgRJioyc3ri3qRdlNrdcyHIPvb+bDK62TJ5sGfjQJMT9BS7s2
 iioZRl6AxRDspFYyrBSYXvgcsFNSSeEpoHXZG2J475lcTqqi+ub34cI6sZMs6oUQvbiM
 1z2rEsV6FEJ0FpFIPiWOxlspdFRjf0dfUf4cB5PL9MnFVbhRT7Q4b+/rTmFW+oWfteVG
 US/6kmUMR3DWuwN+lZ+P9VIWd8xHkd9UU70fktWT6tfpU85Xs1p0ZCFxPHDNjDSeMPGU
 MHnw==
X-Gm-Message-State: APjAAAVR2qt7RzkMmFsbtSDWjJ6lj0RCtWKvlkyE6oSNMW79GjeUn91w
 aLMGBJut1Vb6GGvpL7vte/zL/jSfh59wBNA6cXA=
X-Google-Smtp-Source: APXvYqwo6jAZTCmB/FNu55aRKaWe7nERisYH4YsQGYMn1/W4TrcQZHzyz1AfOPao7+JLaoNmaFfH479+HQx7xsAYtFg=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr2755359wmo.73.1571224328329; 
 Wed, 16 Oct 2019 04:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZAsZ=Q=tcqCzVp8bvj4Jme+YTH9GxmMoBgvOT+w6z8iiw@mail.gmail.com>
 <877e564ht5.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZDtwFoXQ2H_j1v-95Pnh=QzZFX86jHk1RTq1oqSO+5jRw@mail.gmail.com>
 <93911ba6-370e-4b93-d3c2-81081b1be0aa@linux.intel.com>
 <87o8yhwn3d.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8yhwn3d.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 16 Oct 2019 14:11:57 +0300
Message-ID: <CAEnQRZDEZySYWzJ9gifVAiZ0qOxDe_w9zMxgsLbN0URmpcYCAw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sof: include types.h at header.h
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

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMzoyOCBBTSBLdW5pbm9yaSBNb3JpbW90bwo8a3VuaW5v
cmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+IHdyb3RlOgo+Cj4KPiBIaSBQaWVycmUtTG91aXMK
Pgo+ID4gPj4+PiBXaXRob3V0IDx0eXBlcy5oPiB3ZSB3aWxsIGdldCB0aGVzZSBlcnJvcgo+ID4g
Pj4+Pgo+ID4gPj4+PiBsaW51eC9pbmNsdWRlL3NvdW5kL3NvZi9oZWFkZXIuaDoxMjU6MjogZXJy
b3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVpbnQzMl904oCZdWludDMyX3Qgc2l6ZTsKPiA+ID4+
Pj4gbGludXgvaW5jbHVkZS9zb3VuZC9zb2YvaGVhZGVyLmg6MTM2OjI6IGVycm9yOiB1bmtub3du
IHR5cGUgbmFtZSDigJh1aW50MzJfdOKAmXVpbnQzMl90IHNpemU7Cj4gPiA+Pj4+IGxpbnV4L2lu
Y2x1ZGUvc291bmQvc29mL2hlYWRlci5oOjEzNzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYdWludDMyX3TigJl1aW50MzJfdCBjbWQ7Cj4gPiA+Pj4+IC4uLgo+ID4gPj4+PiBsaW51eC9p
bmNsdWRlL3NvdW5kL3NvZi9kYWktaW14Lmg6MTg6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1l
IOKAmHVpbnQxNl904oCZdWludDE2X3QgcmVzZXJ2ZWQxOwo+ID4gPj4+PiBsaW51eC9pbmNsdWRl
L3NvdW5kL3NvZi9kYWktaW14Lmg6MzA6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVp
bnQxNl904oCZdWludDE2X3QgdGRtX3Nsb3Rfd2lkdGg7Cj4gPiA+Pj4+IGxpbnV4L2luY2x1ZGUv
c291bmQvc29mL2RhaS1pbXguaDozMToyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYdWlu
dDE2X3TigJl1aW50MTZfdCByZXNlcnZlZDI7Cj4gKHNuaXApCj4gPiB0aGlzIGlzIGEgZmlsZSBz
aGFyZWQgd2l0aCB0aGUgZmlybXdhcmUsIHdlIHNob3VsZG4ndCBoYXZlIHRvIGFkZAo+ID4gbGlu
dXggc3BlY2lmaWMgc3R1ZmYgaW4gdGhlcmUuCj4gPgo+ID4gQWxzbyBJIGRvbid0IGtub3cgaG93
IHlvdSBnZXQgdGhvc2UgZXJyb3JzLCB3ZSd2ZSBiZWVuIHVzaW5nIHRoaXMgZmlsZQo+ID4gZm9y
IHNvbWUgdGltZSwgY2FuIHlvdSBjbGFyaWZ5IGhvdyB0aGlzIGVycm9yIGhhcHBlbnM/Cj4KPiBJ
IGhhZCBnb3QgdGhpcyBlcnJvciBieSB1c2luZyAibWFrZSBhbGx5ZXNjb25maWciIGFuZCBjb21w
aWxlIGZvciB4ODYuCgpTb3JyeSwgSSd2ZSBlYXJsaWVyIHNlbnQgYW4gZW1wdHkgbWVzc2FnZS4K
Ck9rLCB0aGVuIElTdGVwaGVuJ3MgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGFuZCB3ZSBzaG91bGQg
bm90IHRvdWNoCmluY2x1ZGUvc291bmQvc29mL2hlYWRlci5oCgpUaGF0IG1lYW5zIE1hcmsgbmVl
ZHMgdG8gZHJvcCBNb3JpbW90by1zYW4ncyBwYXRjaC4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
