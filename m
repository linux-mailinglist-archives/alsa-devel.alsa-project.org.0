Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2F7BD77
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32CC216E7;
	Wed, 31 Jul 2019 11:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32CC216E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564566116;
	bh=TlWxm/EKyn1RxqtjUI2qWBAZueqCYTlquDV/6p0CQko=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfWolsvW3HwvQuNN0MGCJN1kY4bnIO71SMbMt53h17xI/YkOCK6oeTcIqwbaedYPl
	 NYvK7lrrxCkGDkfIk9i2uCwKI0MmPyBMGhfH2tXpkxXFfQo0lmPuGAnIx4YKepEUgw
	 +e9p12riyQMqpbvp5HakBjL9x3r+4qwOO9QwfF/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C81B6F80133;
	Wed, 31 Jul 2019 11:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 138D5F8048E; Wed, 31 Jul 2019 10:49:48 +0200 (CEST)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF25AF80483
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 10:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF25AF80483
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dvsn.net header.i=@dvsn.net
 header.b="m1m6/K4q"
Received: by mail-wm1-x344.google.com with SMTP id x15so59858839wmj.3
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dvsn.net; s=dvsn;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xonSTUYLk1hvJQTWUNZKtfy7B5Yrbm8EdGjY1nkt2x8=;
 b=m1m6/K4qxTWy2Csb1+zDneyYMSDkB/cFgTvmh8N1euL4MRD4+sa0WDBfHvBj/Rh8Ea
 L5szdRth3FneGtyCVNTEq/YipbXhx6pmXwh0DLshOZb3LJ241HZ4AYe4jF6da4/i/tgF
 h0nEA/RY35m9PU+70vGnvODtn0kfqnYeF3vCzuKolNWCcttbku+EExqfQZi0m4LQEIS9
 KJI6LXDb2L1IGJndw3ud4F5aJqOITLZLs6nFtGYvHM1zryseXTyZeOnD86f5sJubu5GB
 MEKBPmg/pqMC8VqvNaiTqFVucK/8Kw2DY//ShCjJ7EtBtZ8h97AVp4B8+dPkSAwgU1CP
 oKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xonSTUYLk1hvJQTWUNZKtfy7B5Yrbm8EdGjY1nkt2x8=;
 b=X944lSVGYt9gbB3yS9xtYkVJC+HdRciEQPnsluVL1mH9VYTUMxtrE2nhP8KqhBWws4
 2VGPbth43pfG1GIi75c+6kHXZq9bWhLMobHYtr37mZ3m+emULae9G73J2uDhI7umbK3v
 Ffksgn4/g1/YZF9s9zqXm5O6dTgOrUKLsNvPtXGA2KuYFXYTpPt16ZpNfqowilBzbWFE
 nnBlW2prbUtQwecv9NvY+LUko172isAOvTe81Pn6zuYbUu6qoGzCvRYf5vSmceSqJBfc
 3brqIko0kNahctI10H8Co/nG/IhQnyRpB6Zeo1xrST17XveSJlaHcld/atni11c6ifi8
 XcHg==
X-Gm-Message-State: APjAAAULXfnjSqVcvKZJE+DELc210nx6JGhKxY09nH6tOA71Tw+aXcTC
 DPgPPmkqk5WYIKWKC0X1iQ0=
X-Google-Smtp-Source: APXvYqyw/TwgTHPI2mENy6Lp06oFBvuELRJ347XaeXssOe4TbK/AjN8lqCK052Gmx3nbO8l5v5tWvA==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr66876329wmg.65.1564562371136; 
 Wed, 31 Jul 2019 01:39:31 -0700 (PDT)
Received: from andymacbookpro.lan ([146.87.63.139])
 by smtp.gmail.com with ESMTPSA id j6sm93254445wrx.46.2019.07.31.01.39.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 01:39:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Andrew Davison <andy@dvsn.net>
In-Reply-To: <s5hwofysip0.wl-tiwai@suse.de>
Date: Wed, 31 Jul 2019 09:39:29 +0100
Message-Id: <A58CDE11-C670-479B-BFE5-F4DFDCDD6639@dvsn.net>
References: <CAPk8ziH=P8ST6Ao54NycgiZePDr=T0+L6uVxA=c+pvhjZZCbPA@mail.gmail.com>
 <s5hwoge9ifo.wl-tiwai@suse.de>
 <4EDB552A-AE60-4270-8CE2-33A3CE1F4F5D@dvsn.net>
 <s5hwofysip0.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Wed, 31 Jul 2019 11:19:42 +0200
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Patch Update for OpenFrame Sigmatel STAC9202
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

Cj4gT24gMzEgSnVsIDIwMTksIGF0IDA5OjM3LCBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+
IHdyb3RlOgo+IAo+IE9uIFdlZCwgMzEgSnVsIDIwMTkgMTA6MzY6MTMgKzAyMDAsCj4gQW5kcmV3
IERhdmlzb24gd3JvdGU6Cj4+IAo+PiBIaSBUYWthc2hpLAo+PiAKPj4gVGhhbmsgeW91IHZlcnkg
bXVjaCBmb3IgeW91ciByZXNwb25zZS4gV2XigJl2ZSBtYW5hZ2VkIHRvIHVzZSB0aGlzIGNvbmZp
Z3VyYXRpb24gdmlhIGhkYS1qYWNrLXJldGFzazoKPj4gCj4+IFtjb2RlY10KPj4gMHg4Mzg0NzYz
MiAweDAwMDAwMTAwIDAKPj4gCj4+IFtwaW5jZmddCj4+IDB4MDcgMHgwMWM1ZTE1MAo+PiAweDA4
IDB4MDE0NTExMzAKPj4gMHgwYSAweDkwMTcwMTUwCj4+IDB4MGIgMHgwMmExOTAyMAo+PiAweDBj
IDB4MDE4MTMwMjEKPj4gMHgwZCAweDAzMjE0MDNmCj4+IDB4MTAgMHg1MDA3MDFmMAo+PiAweDEx
IDB4OTAzMzAxMjIKPj4gMHgxNSAweDUwYTAwMWYxCj4+IAo+PiBUaGlzIGNvcnJlY3RzIHRoZSBi
ZWhhdmlvdXIgb2YgdGhlIEhQIGRldGVjdGlvbiBhbmQgbXV0ZXMgKGFuZCB1bm11dGVzKSB0aGUg
Y29ycmVjdCBvdXRwdXRzLCBidXQgbGVhdmVzIHVzIHdpdGggYSBjcmFja2xpbmcgc291bmQgZnJv
bSB0aGUgaW50ZXJuYWwgc3BlYWtlcnMgd2hpY2ggc291bmRzIGxpa2Ugc3lzdGVtIGludGVyZmVy
ZW5jZSBub2lzZS4gSXTigJlzIGFzIGlmIHNvbWV0aGluZyBoYXMgYmVlbiBsZWZ0IGZsb2F0aW5n
IGFuZCB0aGUgYW1wbGlmaWNhdGlvbiBmb3IgdGhlIGludGVybmFsIHNwZWFrZXJzIGhhcyBub3Qg
YmVlbiBzaHV0IG9mZi4gSeKAmW0gbWFraW5nIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhpcyBpcyBy
ZWxhdGVkIHRvIHRoZSAweGZmYmMwMTAwIHlvdSBtZW50aW9uLgo+PiAKPj4gV2hhdCB3b3VsZCBi
ZSBvdXIgbmV4dCBjb3Vyc2Ugb2YgYWN0aW9uIHRvIGNvcnJlY3QgdGhlIGNyYWNrbGluZz8KPiAK
PiBBcyBtZW50aW9uZWQsIHlvdSBtaWdodCBuZWVkIHRvIGNvbnRyb2wgR1BJTyBhcyB3ZWxsLiAg
VHJ5IHRvIGFkanVzdAo+IHRoZSBHUElPIHBpbiB2aWEgaGRhLXZlcmIuCj4gCgpXb3VsZCB5b3Ug
YmUgYWJsZSB0byBwcm92aWRlIGFuIGV4YW1wbGUgb2YgaG93IHRvIGRvIHRoaXM/IEnigJltIG5v
dCBzdXJlIHdoZXJlIHRvIHN0YXJ0IG9uIHRoYXQgb25lLgoKVGhhbmtzLAoKICAgIEEuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
