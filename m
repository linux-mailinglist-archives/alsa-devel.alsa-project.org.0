Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FF14DBB8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 14:28:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46BC167E;
	Thu, 30 Jan 2020 14:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46BC167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580390890;
	bh=SzQYdKfQXREl1StkhAYvtp72JuGz4cZSR/E1L6si8DE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHVByMraoVcAhxVlEuxkYKlTpcW6yMokCdXHKdilw0SLDdQ8dhGV7MIlWpcvRGp0X
	 L2vgJd14sLnyMVSI7sXl4WUbNUfV9ZfZwRElqhIPFJBL3KpLYMwIUnqo8YcCftL69Z
	 KQp2rMA6/Ns//8mffORBzFtqJEGDIdR9uup3mk1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 822ABF801F7;
	Thu, 30 Jan 2020 14:25:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBD9CF80150; Thu, 30 Jan 2020 14:17:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E60A0F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 14:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60A0F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W1XwzAZI"
Received: by mail-wr1-x441.google.com with SMTP id w15so4009848wru.4
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 05:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5T8LzzRsOm8cpmkE6dP/UqvJHvqM4oik3hzcCAgW8QI=;
 b=W1XwzAZIiTHXa6XWRvyzy+kKiby5kJKu+ahGns7asia+Bw/GMDXYz40EXT3lru8Fq9
 kJALqYv9JQ8S7ruwUc653qtUKpMnmNVhA6QHPi+6jKqO8r/Llg8biioAPp+skrDDe2Jj
 cKBnDBVqTNhTvuYxz/bjc/SXuKh50TuBZ/euD9INpSmzVkr9LTJHph/9QY7jKIT+Ih6y
 ALzyNoJ9nNZK5BG6T3Igcu/wAeLEnOUogWh7+ycuxGAzHWmobynJs019jLCbCkqFUvvL
 yt/wgENDuVPGlbZ+pEl4xb4uvrSR4CNb0SCOB/+4msP3iEZjsXtLWfJFVOPrHpelWZQ9
 tpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5T8LzzRsOm8cpmkE6dP/UqvJHvqM4oik3hzcCAgW8QI=;
 b=ZdXr8y/h2Mc4Eva3+fPAN/aQUaEM1LJRr8XkIx8ec2HrLoMRJt5q4WARR2lIMRGsRO
 EUAU0jSC8N1h12LvWPqtbQU5wGVXzpWXsrokkghkYITc2haT6AilowbCZ6OYFGbdcuEb
 nQEirtSk7w9E9i+E7qE3z8S33GkdPnyJkHrek8CSVKKaUdIZJu0faxz9Q2OQmmCQq+kE
 fUDNl+8geA+9R55ru6AocWOmrhlstOvZLilzO0YeJLnYaSle3qt8EdkqozW9CYdI+k4E
 LdeHDPLUvBstJjtR6byMKkoG6Sgcy0mrx9eTOrZSDrUdssxdw6E7EbqpNAioN/kRv1SR
 4e/w==
X-Gm-Message-State: APjAAAVzI5/lKmeJSDpqp4Q2A4gi+zFXKBVB59XKPTzfy+W+w8nQJ5YB
 pDsyomy7ur44RrnQqV2GzrR1Qn3f
X-Google-Smtp-Source: APXvYqz4KzzrBKOGE+TVlSkzjR/29D93SevggEVxbw704dMb/wnpA8eFSENi5wqXeWHdWEppNq74hQ==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr5655339wrv.108.1580390224685; 
 Thu, 30 Jan 2020 05:17:04 -0800 (PST)
Received: from schmakbook.localnet (router-kraduha-nat-p.pilsfree.net.
 [212.79.110.127])
 by smtp.gmail.com with ESMTPSA id z10sm6055008wmk.31.2020.01.30.05.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 05:17:03 -0800 (PST)
From: Roman =?utf-8?B?xaBtYWthbA==?= <schmakerisko@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 30 Jan 2020 14:17:16 +0100
Message-ID: <4504540.GXAFRqVoOG@schmakbook>
In-Reply-To: <s5hzhe5cct2.wl-tiwai@suse.de>
References: <2520086.mvXUDI8C0e@schmakbook> <5323169.DvuYhMxLoT@schmakbook>
 <s5hzhe5cct2.wl-tiwai@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Jan 2020 14:25:24 +0100
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [CX2075] No sound after suspend/resume from
	front	speaker
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

RG5lIMSNdHZydGVrIDMwLiBsZWRuYSAyMDIwIDE0OjA3OjUzIENFVCwgVGFrYXNoaSBJd2FpIG5h
cHNhbChhKToKPiBPbiBUaHUsIDMwIEphbiAyMDIwIDEzOjA3OjQ2ICswMTAwLAo+IAo+IFJvbWFu
IMWgbWFrYWwgd3JvdGU6Cj4gPiBEbmUgxI10dnJ0ZWsgMzAuIGxlZG5hIDIwMjAgMTI6NTc6MzIg
Q0VULCBUYWthc2hpIEl3YWkgbmFwc2FsKGEpOgo+ID4gPiBPbiBUaHUsIDMwIEphbiAyMDIwIDEy
OjQyOjAxICswMTAwLAo+ID4gPiAKPiA+ID4gUm9tYW4gxaBtYWthbCB3cm90ZToKPiA+ID4gPiBE
bmUgc3TFmWVkYSAyOS4gbGVkbmEgMjAyMCAxMjozMzowNiBDRVQganN0ZSBuYXBzYWwoYSk6Cj4g
PiA+ID4gPiBPbiBTYXQsIDI1IEphbiAyMDIwIDIzOjMwOjMyICswMTAwLAo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBSb21hbiDFoG1ha2FsIHdyb3RlOgo+ID4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IHRoaXMgc3RpbGwgc2VlbSB0byBiZSBhbiBpc3N1ZS4gQWZ0ZXIgc3RhcnR1
cCBldmVyeXRoaW5nIHdvcmtzCj4gPiA+ID4gPiA+IHdlbGwKPiA+ID4gPiA+ID4gdW50aWwKPiA+
ID4gPiA+ID4gdGhlIGxhcHRvcCBnb2VzIHRvIHN1c3BlbmQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiBUcmllZCBwcmV0dHkgbXVjaCBldmVyeXRoaW5nIGJhc2ljIHVzZXIgY2FuIGRvICh1bm11
dGVzLCBybW1vZHMKPiA+ID4gPiA+ID4gYW5kIHNvCj4gPiA+ID4gPiA+IG9uKSwKPiA+ID4gPiA+
ID4gc3RpbGwgbm8gd2F5IHRvIHdha2UgdGhlIG91dHB1dC4gQUxTQSBzZWVtcyB0byBiZSB0aGlu
a2luZywgdGhhdAo+ID4gPiA+ID4gPiBvdXRwdXQgaXMKPiA+ID4gPiA+ID4gYWN0aXZlLCB5b3Ug
Y2FuIHNldCB2b2x1bWUgYW5kIHN0dWZmLCBidXQgbm90aGluZyBoYXBwZW5zLgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gQUxTQSBpbmZvOgo+ID4gPiA+ID4gPiBodHRwOi8vYWxzYS1wcm9qZWN0
Lm9yZy9kYi8/Zj05ZDFlZTgxZmUwMzdhY2I1M2NhMzgxZjJkZTI3YmU0MjBmODMKPiA+ID4gPiA+
ID4gYTM3Mwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gUmVsYXRlZCBsaW5rczoKPiA+ID4gPiA+
ID4gaHR0cHM6Ly93d3cucmVkZGl0LmNvbS9yL2FyY2hsaW51eC9jb21tZW50cy80bnd6dWEvCj4g
PiA+ID4gPiA+IG5vX3NvdW5kX2FmdGVyX3N1c3BlbmRfa2lsbGluZ19vcl9yZXN0YXJ0aW5nLwo+
ID4gPiA+ID4gPiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9saW51
eC8rYnVnLzE2MTI5MTYKPiA+ID4gPiA+ID4gaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvY2dpLWJp
bi9idWdyZXBvcnQuY2dpP2J1Zz04NTE0MDQKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIGZpcnN0
IHRoaW5nIHRvIGNoZWNrIGlzIHRvIGNvbXBhcmUgYWxzYS1pbmZvLnNoIG91dHB1dHMgYmVmb3Jl
Cj4gPiA+ID4gPiBhbmQKPiA+ID4gPiA+IGFmdGVyIHRoZSBzdXNwZW5kLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBBbHNvIHBhc3Mgc25kX2hkYV9jb2RlYy5kdW1wX2NvZWY9MSBtb2R1bGUgb3B0aW9u
IHRvIGVuYWJsZSB0aGUgQ09FRgo+ID4gPiA+ID4gZHVtcC4gIFRoaXMgd2lsbCBnaXZlIG1vcmUg
aW5mb3JtYXRpb24gaW4gYWxzYS1pbmZvLnNoIG91dHB1dHMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gVGFrYXNoaQo+ID4gPiA+IAo+ID4gPiA+IE9rYXksIGkgZGlkIHNvbWUgY29t
cGFyaW5nIHdpdGggbW9kdWxlIG9wdGlvbiBlbmFibGVkLgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4g
PiA+IFNvdW5kIHdvcmtpbmcKPiA+ID4gPiBodHRwOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj1h
ZGZiMGIzYWQ1ZDliOGQ4ODI4OWFjN2UzNWI3NDIyNTRiZWI3NTg4Cj4gPiA+ID4gCj4gPiA+ID4g
U291bmQgbm90IHdvcmtpbmc6Cj4gPiA+ID4gaHR0cDovL2Fsc2EtcHJvamVjdC5vcmcvZGIvP2Y9
Yzc5NmIxNGRmMGVmYjAwNzlhZWYxZGY1ZjcwNzY0MTk0Y2ZmOGQ0ZAo+ID4gPiA+IAo+ID4gPiA+
IFdoYXQncyB3aWVyZCB0byBtZSBpcywgdGhhdCBvbiB0aGUgcm93IDUyMSB0aGVyZSBpcyBjaGFu
Z2UgaW4gYXBsYXkKPiA+ID4gPiBTdWJkZXZpY2VzIGZyb20gMS8xIHRvIDAvMS4KPiA+ID4gPiAK
PiA+ID4gPiBBbHNvLCBzdGF0ZS5QQ0ggY29udHJvbCAxOCBzaG93cyBjaGFuZ2UgaW4gcGxheWJh
Y2sgY2hhbm5lbCBtYXAuCj4gPiA+ID4gCj4gPiA+ID4gQW55IG90aGVyIHRoaW5nIGkgY2FuIGNo
ZWNrIG9yIHRyeSB0byBkb2ZvciBkZWJ1Z2luZz8KPiA+ID4gCj4gPiA+IFlvdSBwYXNzZWQgYSB3
cm9uZyBvcHRpb24uICBUaGUgb3B0aW9uIGlzIGZvciBzbmRfaGRhX2NvZGVjIG1vZHVsZS4KPiA+
ID4gCj4gPiA+IFNvIGVpdGhlciBjcmVhdGUgYSBtb2Rwcm9iZS5kLyouY29uZiBmaWxlIGNvbnRh
aW5pbmc6Cj4gPiA+ICAgb3B0aW9ucyBzbmRfaGRhX2NvZGVjIGR1bXBfY29lZj0xCj4gPiA+IAo+
ID4gPiBvciBwYXNzIHNuZF9oZGFfY29kZWMuZHVtcF9jb2VmPTEgYXQgYm9vdCBjbWRsaW5lIG9w
dGlvbi4KPiA+ID4gCj4gPiA+IEJUVywgaXQnZCBiZSBiZXR0ZXIgdG8gZ2V0IHRoZSBvdXRwdXRz
IHdpdGggLS1uby11cGxvYWQgb3B0aW9uIG9mCj4gPiA+IGFsc2EtaW5mby5zaCwgYW5kIGF0dGFj
aCB0aGVtLgo+ID4gPiAKPiA+ID4gTGFzdCBidXQgbm90IGxlYXN0LCBwbGVhc2UgZG9uJ3QgZHJv
cCBDYyB0byBNTCB1bmxlc3MgeW91IG5lZWQgdG8gZG8KPiA+ID4gc28uCj4gPiA+IAo+ID4gPiAK
PiA+ID4gdGhhbmtzLAo+ID4gPiAKPiA+ID4gVGFrYXNoaQo+ID4gCj4gPiBBbHJpZ2h0LCBteSBi
YWQsIGknbSBuZXcgdG8gdGhpcy4KPiA+IAo+ID4gQXR0YWNoaW5nIGFsc2FpbmZvcyB3aXRoIHBy
b3BlciBtb2R1bGUgb3B0aW9ucywgbm8gYmlnIGRpZmZlcmVuY2UgdGhvdWdoLgo+IAo+IE9LLCBz
byBpdCBoYXMgdGhlIGNvZGVjIGhhcyBDT0VGIHRoaW5ncyBhbmQgdGhlcmUgaXMgbm8gc2lnbmlm
aWNhbnQKPiBkaWZmZXJlbmNlIGJldHdlZW4gdGhvc2UgdHdvIG91dHB1dHMuICBJdCBpbXBsaWVz
IHRoYXQgc29tZXRoaW5nCj4gb3V0c2lkZSBIRC1hdWRpbyBidXMgaXMgbmVlZGVkIGFuZCBpdCdz
IHByb2JhYmx5IGRvbmUgYnkgQklPUy4KPiAKPiAKPiBUYWthc2hpCgpPSywgc28gdGhpcyBtZWFu
cyB0aGF0IHRoaXMgcmVwb3J0IGlzIGludmFsaWQgYW5kIGtlcm5lbCBkZXZlbG9wZXJzIHNob3Vs
ZCAKY2hlY2sgdGhpcyBvdXQ/CgpIb3cgc2hvdWxkIGkgcHJvY2VlZCBub3c/CgpUaGFua3MKUm9t
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
