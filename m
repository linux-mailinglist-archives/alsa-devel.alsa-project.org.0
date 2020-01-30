Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA614DBEA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 14:30:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7F31674;
	Thu, 30 Jan 2020 14:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7F31674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580391052;
	bh=M1exlalEMf+TGm2RBaCCxbXwWzu8G4VhiMy9Og8zKY4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItpOkEce4KOD+YqJsy2CtNz1yupgGFQdgNCsTolur3/JEuugHcJwHDmQ6vehIGk6g
	 +4TVN+6Wi8/ivaEdD7+10TT9VijKe7atlpm72lt41Gf0EHWRN4pZCm2qwaZ+rvMMRB
	 LcjqbXcDdOUCzrCi1xMGW24RjZsY5gA80Ijyj5ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81BEFF801EB;
	Thu, 30 Jan 2020 14:29:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14692F80082; Thu, 30 Jan 2020 14:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66C29F80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 14:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C29F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l5AUUKCe"
Received: by mail-wm1-x341.google.com with SMTP id c84so4210926wme.4
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W0UI6gI3zZ5YVRMsBsggz9TV7oIUCrVzyUE7SqHgZ4g=;
 b=l5AUUKCeh1IQ1m03Fwz3LtvuYaoMsHnfmQ/JyMewAKDF2aEKKFU4JXr/EEiRy/yuGB
 7Y6c5kCW+X8uaiupQXquUXtCpay1Y5xivKcTdOv7Thu2Y6g4/yDvapIsqDmqC4W42Vk/
 irj8mobxD02fgOgrGUmdRyla82Bizgloi9S+Muq+tMBO29GBN5JnRdX/qe2l+gp5So2m
 T7WmmLnLrpwoJ++zQ1cQA5+8oRzJiG+k4tc/05FxBzSLLQ4AQyUPh7hX+MhhPNdHwkuf
 LrJUD+gBQYYb4ngnwlXI+yBKj6naocvARLSbCpx2t5zHBt4nnoTkfWM7xWLYPaI0tD47
 zG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W0UI6gI3zZ5YVRMsBsggz9TV7oIUCrVzyUE7SqHgZ4g=;
 b=QJbXsdsW4/59ATEatw9kDEO4qUC6VKPTJMowN3iTm2V4ITnNknc0sZffN1AQkY8onh
 lFFUtOnljZrlc/s5PsgBBFmQjAuCnXEEh2WaFgUUqI6YsE/PaPQ7zTkT3CfEcsfjbniD
 k2/h1gp3x137Ysbz3gQBQJt0/5n20WcjZjkhaF7XCNEbGtWF1rYh5EqkDVYMGzPdyHne
 u6l8TW3kQr/rKXXpOq5kQdLi9Bpy3z7geWrUu0VvdkykYqlZ9I58Fxey8qcM/Xr66Gro
 5+1cDHrZeSmZCPAFZRuV8m/lvooezHjKgQakAGx+JlgG+tvTa+sODND4PZ8uPxheEMtr
 +dnA==
X-Gm-Message-State: APjAAAVTr/lSBm73fWwHg00Rqcse8CdTuXxeQbOwm0kU5d+SouDMfEAl
 YD/ZnsP5TLh4S0fRZ33lVwONHVXb
X-Google-Smtp-Source: APXvYqy8m0eK+5IAC+CgEWMwelM9uNm9y0wF1cixwIS1dsHljYZAbgJNR4aghes0ojOdZaEeqo43Xg==
X-Received: by 2002:a05:600c:228f:: with SMTP id
 15mr6033392wmf.56.1580390936204; 
 Thu, 30 Jan 2020 05:28:56 -0800 (PST)
Received: from schmakbook.localnet (router-kraduha-nat-p.pilsfree.net.
 [212.79.110.127])
 by smtp.gmail.com with ESMTPSA id d12sm7464039wrp.62.2020.01.30.05.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 05:28:55 -0800 (PST)
From: Roman =?utf-8?B?xaBtYWthbA==?= <schmakerisko@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 30 Jan 2020 14:29:08 +0100
Message-ID: <11474778.O9o76ZdvQC@schmakbook>
In-Reply-To: <s5hzhe5cct2.wl-tiwai@suse.de>
References: <2520086.mvXUDI8C0e@schmakbook> <5323169.DvuYhMxLoT@schmakbook>
 <s5hzhe5cct2.wl-tiwai@suse.de>
MIME-Version: 1.0
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
IHByb2JhYmx5IGRvbmUgYnkgQklPUy4KPiAKPiAKPiBUYWthc2hpCgoKT2theSwgc28gYXJlIHRo
ZXJlIGFueSBmdXJ0aGVyIHN0ZXBzIHJlcXVpcmVkIGZyb20gbWUsIG9yIGl0J3MganVzdCBtYXR0
ZXIgb2YgCnRpbWUgZm9yIGRldnMgZm9yIHBpY2sgdGhpcyBidWcgdXA/CgpTb3JyeSBmb3IgYmVp
bmcgYW5ub3lpbmcsIGFzIHNhaWQsIGknbSBuZXcgdG8gdGhpcyA6KQoKUmVnYXJkcwoKUm9tYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
