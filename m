Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE00D6FE4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 09:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 387329F6;
	Tue, 15 Oct 2019 09:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 387329F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571123398;
	bh=3NOL4jfk0gKhh+tNHsv1tnOgOolQ9V4ntl5Vu1ht+eU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WKQarV3JU9Rl9HjLLYru1NDRcllvOt82bmhDa9UaITFE1N4QfFrxSSmw9+yQhKuXV
	 YrH1RLiZsI58ry7UaEaG+VqOsBr3x2ILSQ33vgnZi8LzBBtu/Xe1uYJz5eBkQ2224y
	 0qe3Q4huahlrwvRvi4Qk2v94SwrtI0LkyOuWdGdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C78F804AA;
	Tue, 15 Oct 2019 09:08:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC38BF804AA; Tue, 15 Oct 2019 09:08:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34A12F8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 09:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34A12F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LdGOE1Vh"
Received: by mail-wm1-x341.google.com with SMTP id y135so1597962wmc.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oslaV2my9GzLs8qEq5sxfues3BGFxSl/z3ofkyZLH2M=;
 b=LdGOE1Vhtime6CMGv/XAX//y3AFkW2r7FqCXt3t+OhjkU7wTPrVLV3XyeQMR+1z423
 y9b9wNosfwDkCDBqmRe0tyvC0UWqsrK4bR4D7UF9IiI6CUJzHb5IFAlnHdI2PbM4O8/P
 W6cfDZtKSFltV3vVrZ64giD3LYKa7GcdmVPCNhlWfZfoRKjSbRrZEBk8xSSdkzS8IKie
 Vslk35eVRVtvTZPL3gqdkHmMW4vKW7zjDGjZ5CqI514+CsPdySdSPOeZc5gqQcyrP5nl
 umBp9TS1ZKTkFyUBDCac8Qe+db7CDPjb43WK8bFBSOvgMgLzWRNdgCz6xraZ+igbikM1
 9YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oslaV2my9GzLs8qEq5sxfues3BGFxSl/z3ofkyZLH2M=;
 b=KrnRPupKyn6cm2bak/CWjQ+P7+57t0soAK6bd2sZEowBy6Jfz/xlXtHUt4FtNmdenh
 RXzxl4M9mSo1N8dIlsoang5l78xNGzKX69NPKFjvqbPasODRueQYNsPjhCUcNGGlNdY4
 aLGuPkPZ1hbGNGCZlMk3e0JAOPqqtKwMUMIIZB6L3XRFLowWw555IiaWNe4aPQnwwxNr
 fAnWiW+glMFP9LowP6ByKTpN6ZqpXStkwuZafHHBKZ5Gu+RmNLYLI89/i06J9yBcsNs+
 Zzo/OlkDULWbNeotpPiUTwVFFqf4060YlWfn31ZzTiPqJOCWXYZemyavwkJmDJ6epbGO
 jo5g==
X-Gm-Message-State: APjAAAXYk85ypkqy5MhthfnQpOZMEdTvSdUjtHfUx0ZsZ3rgiXWA6spO
 dqs8HN2qs6hlZU8rrNKf7yHrHjqfGC55KEbHF3U=
X-Google-Smtp-Source: APXvYqzqeyHzjQJ6S4tvXzwufZgHCpVzvis0DzNvZUOH02MhuQQIOYHar99b8IWbPhyfh4sgezL3qNQTtzxKPdxCGtM=
X-Received: by 2002:a1c:e48a:: with SMTP id b132mr18748373wmh.13.1571123287771; 
 Tue, 15 Oct 2019 00:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZAsZ=Q=tcqCzVp8bvj4Jme+YTH9GxmMoBgvOT+w6z8iiw@mail.gmail.com>
 <877e564ht5.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e564ht5.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Oct 2019 10:07:55 +0300
Message-ID: <CAEnQRZDtwFoXQ2H_j1v-95Pnh=QzZFX86jHk1RTq1oqSO+5jRw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgOTo1NyBBTSBLdW5pbm9yaSBNb3JpbW90bwo8a3VuaW5v
cmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+IHdyb3RlOgo+Cj4KPiBIaSBEYW5pZWwKPgo+ID4g
PiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gPiA+Cj4gPiA+IFdpdGhvdXQgPHR5
cGVzLmg+IHdlIHdpbGwgZ2V0IHRoZXNlIGVycm9yCj4gPiA+Cj4gPiA+IGxpbnV4L2luY2x1ZGUv
c291bmQvc29mL2hlYWRlci5oOjEyNToyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYdWlu
dDMyX3TigJl1aW50MzJfdCBzaXplOwo+ID4gPiBsaW51eC9pbmNsdWRlL3NvdW5kL3NvZi9oZWFk
ZXIuaDoxMzY6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVpbnQzMl904oCZdWludDMy
X3Qgc2l6ZTsKPiA+ID4gbGludXgvaW5jbHVkZS9zb3VuZC9zb2YvaGVhZGVyLmg6MTM3OjI6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1aW50MzJfdOKAmXVpbnQzMl90IGNtZDsKPiA+ID4g
Li4uCj4gPiA+IGxpbnV4L2luY2x1ZGUvc291bmQvc29mL2RhaS1pbXguaDoxODoyOiBlcnJvcjog
dW5rbm93biB0eXBlIG5hbWUg4oCYdWludDE2X3TigJl1aW50MTZfdCByZXNlcnZlZDE7Cj4gPiA+
IGxpbnV4L2luY2x1ZGUvc291bmQvc29mL2RhaS1pbXguaDozMDoyOiBlcnJvcjogdW5rbm93biB0
eXBlIG5hbWUg4oCYdWludDE2X3TigJl1aW50MTZfdCB0ZG1fc2xvdF93aWR0aDsKPiA+ID4gbGlu
dXgvaW5jbHVkZS9zb3VuZC9zb2YvZGFpLWlteC5oOjMxOjI6IGVycm9yOiB1bmtub3duIHR5cGUg
bmFtZSDigJh1aW50MTZfdOKAmXVpbnQxNl90IHJlc2VydmVkMjsKPiA+ID4KPiA+Cj4gPiBJIHRo
aW5rIHlvdXIgcGF0Y2ggaXMgT0ssIGJ1dCB5b3Ugc2hvdWxkIHVwZGF0ZSB0aGUgY29tbWl0IG1l
c3NhZ2UgYmVjYXVzZQo+ID4gU3RlcGhlbiBSb3Rod2VsbCBhbHJlYWR5IGZpeGVkIGRhaS1pbXgu
aCBjb21waWxhdGlvbiBlcnJvciAgaW4gbGludXgtbmV4dC4KPgo+IEkgc2VlLiBUaGFua3MKPgo+
IEJ1dCBobW0uLi4gSSBjb3VsZG4ndCBmaW5kIGl0IGF0IGxpbnV4LW5leHQvbWFzdGVyIHRvZGF5
Li4uCj4gTm90IHlldCBtZXJnZWQgPwoKWWVzLCB0aGlzIGlzIHN0cmFuZ2UuIEkndmUgc2VudCBh
biBlbWFpbCB0byBTdGVwaGVuIGFuZAphbHNvIGFkZGVkIHlvdSB0byBDYy4KCkJ1dCwgeW91ciBw
YXRjaCBpcyBzdGlsbCB2YWxpZCBiZWNhdXNlIFN0ZXBoZW4gdXNlZCArI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+CmluIGRhaS1pbXguaCBhbmQgeW91IGFyZSBub3cgZml4aW5nIHRoZSBnZW5lcmlj
IHNpdHVhdGlvbiBieSBpbmNsdWRpbmcgaXQgaW4KaGVhZGVyLmguCgpMZXRzIHNlZSBpZiBTdGVw
aGVuIGNhbiBjbGFyaWZ5IHRoZSBzaXR1YXRpb24uIFBlcmhhcHMgd2UgY2FuIGRyb3AgaGlzIHBh
dGNoCmFuZCBvbmx5IGhhdmUgeW91cnMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
