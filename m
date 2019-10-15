Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF21D6FBD
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 08:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 850C184C;
	Tue, 15 Oct 2019 08:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 850C184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571122284;
	bh=O9OqJT5Scdt+rFF2QjDx59OLzfmmcRO8ghRcE74g2VE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfvstbB8Ed+wge8ifzjf9+9+x4OltrqOE0ZtNH3Dc1lz3ORNrX4PgQX1XLlvcHX92
	 tf8M9tnaShaeKX47d78eJCYU5bHwTkbDVXstYJkLWJGLFYImXYQaMcXuVZFN1obcg+
	 6TE8obM7A0j8DiCFh7SjhQ/y8ubTE48OizNzbDC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD2BFF804AA;
	Tue, 15 Oct 2019 08:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E856F804AA; Tue, 15 Oct 2019 08:49:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84DAAF8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 08:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84DAAF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qMBxwlhC"
Received: by mail-wr1-x442.google.com with SMTP id r3so22335226wrj.6
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 23:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sSzKkMwmhrAN9gD7Kb6pivioTxsuylXfh/zWix6366c=;
 b=qMBxwlhCJY3XJ/Emylhgf/575n7fAMMSrhOdjbLwcBBxk0JTRSVQxxxQeeSsV7UmqC
 XZYnPJ64xFcx6pRIf/p2S/WhMCxUgFVnyIA4Sa90q9C/ao+ivv6TpR02ndvUtA1rtolT
 DGwm/PbGkubPiz3vp5JkhldWRhGiQWUrZnVltssL8bfAe7ayQL9RurlHiO+v/zkZBNjV
 svlV5cId61nVFzO2jEUkhJwxdxRdxTt+8xOBHM9rxN2PCtsfE487o2qp15j8dkF+u6bO
 lSpKUc7z2TBDRiqUXCV5mUij3DF9S0vDP3/TWwy9varihdkDHrvNSaGhhsu1quu3MVQX
 /X9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sSzKkMwmhrAN9gD7Kb6pivioTxsuylXfh/zWix6366c=;
 b=nQSd5aWa1EuN8mnbTYAuydE8ynhmw0Ru1c2wuGiSF4t1TnnDAoZOy3vLb+RD+XLICa
 wCC5SZYz+uwehWFMiMOhf5b9Sfh6TDrLRGrfHxeXCM4ipt/sLVIwIx9gT27U39zNR+yX
 hQV0ltoVY2rNUWrT8xaoe8kNR4rplp+YJOhXvpl+qgUWLRlKfHV0T/S/DY5zspYELiwn
 0X4i/z21gLSbn81fntVHLPTEv+4dzGmeCy2RLWzZKE/5lk7XMycomD+J4WOMXl5KQeS5
 ucvAw2Np6tExVVzT036/PoGOwmZG6cGrByn4ZE2l3+vaqJf7vprItZ57dFvOxnyXAiZj
 MfIg==
X-Gm-Message-State: APjAAAU4JVu4pwURboPZauObPtfDSRUlir7FzIDcCuTLPHmCD14lY06S
 Ic+45q/TznelPkMUsqQfLf24JGQQZqiAxc8L7a4=
X-Google-Smtp-Source: APXvYqwG6uvhPXMWTXJ0p0Jlmj8H4wrLRrFeVb0zWrJDpu0NB+9byVrwh3ss3vZr08OAba+A06jaUV6v/jLppEXEiME=
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr27526923wrs.137.1571122170335; 
 Mon, 14 Oct 2019 23:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Oct 2019 09:49:19 +0300
Message-ID: <CAEnQRZAsZ=Q=tcqCzVp8bvj4Jme+YTH9GxmMoBgvOT+w6z8iiw@mail.gmail.com>
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

SGVsbG8gTW9yaW1vdG8tc2FuLAoKT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgODo0NSBBTSBLdW5p
bm9yaSBNb3JpbW90bwo8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+IHdyb3RlOgo+
Cj4gQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+Cj4gV2l0aG91dCA8dHlwZXMuaD4g
d2Ugd2lsbCBnZXQgdGhlc2UgZXJyb3IKPgo+IGxpbnV4L2luY2x1ZGUvc291bmQvc29mL2hlYWRl
ci5oOjEyNToyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYdWludDMyX3TigJl1aW50MzJf
dCBzaXplOwo+IGxpbnV4L2luY2x1ZGUvc291bmQvc29mL2hlYWRlci5oOjEzNjoyOiBlcnJvcjog
dW5rbm93biB0eXBlIG5hbWUg4oCYdWludDMyX3TigJl1aW50MzJfdCBzaXplOwo+IGxpbnV4L2lu
Y2x1ZGUvc291bmQvc29mL2hlYWRlci5oOjEzNzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYdWludDMyX3TigJl1aW50MzJfdCBjbWQ7Cj4gLi4uCj4gbGludXgvaW5jbHVkZS9zb3VuZC9z
b2YvZGFpLWlteC5oOjE4OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1aW50MTZfdOKA
mXVpbnQxNl90IHJlc2VydmVkMTsKPiBsaW51eC9pbmNsdWRlL3NvdW5kL3NvZi9kYWktaW14Lmg6
MzA6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVpbnQxNl904oCZdWludDE2X3QgdGRt
X3Nsb3Rfd2lkdGg7Cj4gbGludXgvaW5jbHVkZS9zb3VuZC9zb2YvZGFpLWlteC5oOjMxOjI6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1aW50MTZfdOKAmXVpbnQxNl90IHJlc2VydmVkMjsK
PgoKSSB0aGluayB5b3VyIHBhdGNoIGlzIE9LLCBidXQgeW91IHNob3VsZCB1cGRhdGUgdGhlIGNv
bW1pdCBtZXNzYWdlIGJlY2F1c2UKU3RlcGhlbiBSb3Rod2VsbCBhbHJlYWR5IGZpeGVkIGRhaS1p
bXguaCBjb21waWxhdGlvbiBlcnJvciAgaW4gbGludXgtbmV4dC4KCj4gU2lnbmVkLW9mZi1ieTog
S3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IC0t
LQo+ICBpbmNsdWRlL3NvdW5kL3NvZi9oZWFkZXIuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL3NvZi9oZWFkZXIu
aCBiL2luY2x1ZGUvc291bmQvc29mL2hlYWRlci5oCj4gaW5kZXggMTBmMDBjMC4uMzMyMTQzZiAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NvdW5kL3NvZi9oZWFkZXIuaAo+ICsrKyBiL2luY2x1ZGUv
c291bmQvc29mL2hlYWRlci5oCj4gQEAgLTksNiArOSw3IEBACj4gICNpZm5kZWYgX19JTkNMVURF
X1NPVU5EX1NPRl9IRUFERVJfSF9fCj4gICNkZWZpbmUgX19JTkNMVURFX1NPVU5EX1NPRl9IRUFE
RVJfSF9fCj4KPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gICNpbmNsdWRlIDx1YXBpL3Nv
dW5kL3NvZi9hYmkuaD4KPgo+ICAvKiogXGFkZHRvZ3JvdXAgc29mX3VhcGkgdUFQSQo+IC0tCj4g
Mi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
PiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
