Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5002E5A13B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 18:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEE971664;
	Fri, 28 Jun 2019 18:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEE971664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561740296;
	bh=QCrl7uM5PliORIGxGPfr/8rT0y6bQRgTqQr+VHnD0fs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4RQNeCchl5GqeuyXWjKkxtjdBOrMTN/q7mloL/I04JdjdEVORu6GE/dSYMH9xyu/
	 r3abIOHfnV45Pr3rid1a4LaNwqKjtINhnMGbZs1XS8vg6keVwfaWZGsdTY7Jr6yW34
	 pU7qv5IZVGjoEfgrGgKUySBEI0hmUGxsoGtC0+F4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B16F896B7;
	Fri, 28 Jun 2019 18:43:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE348F896B9; Fri, 28 Jun 2019 18:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9545AF80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9545AF80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q9RTCSQn"
Received: by mail-oi1-x243.google.com with SMTP id a127so4727058oii.2
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QFpm0UumsX4I37gj4rXPxQSbpBWGeOyG5IyhPSbjXkU=;
 b=q9RTCSQnZxpTkNaRIo3OFvfTXF0T70elNpWwXG6dQojmPGV3ToN5VmSJp1wsOrc+16
 41ha3a13CdvAhsI+OmoYnjkOHIyDRf/5yJBpD9LN0zcc8GNL0DadTGOCeo2t+smzWm/L
 DvLfIYiSyc4GZ/0zur4lHkHXbRdSAvnJ+BF31t2AXTKqlrovWOxRgPnna+6dZbs/CLUc
 vJvPJyLvid3Z/ATKqRbyhwl6/DFYYmp8zY3OnuhSV06DztcwHiJ5FvM+fR5FZqIzED4N
 QpFKBe21HlFd/zae9hTsV+aMbgOCYN6Gji1xu7bnana2WAFvaxE9xUVnpdh8BhfS1XYw
 5dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QFpm0UumsX4I37gj4rXPxQSbpBWGeOyG5IyhPSbjXkU=;
 b=iem4mQ3ny5AJqQwhBnxmmSsMzFUnulK7G4hRH5BeH2t04fBaNvV4JvPBl6ca/DWR3R
 vu2jkAfSF8nBuRqYn1Vg76BDq3cWn3U5zO+BhwuUicDOkt1+WU13WjzClzRRknBC3MjY
 9lfc7UMDa84+jqzcM6nwJQiRAIQUVTbY6DBobtVJptrQpr4HnR+qKSUXhP2r8oMa/WnP
 8DqKDC5VAHVe9nAvagasqs6A80k+NvQGnPiG/o9s03dP9N9BuFEFXw7SiM+nj3w+pg7k
 uDyft+qvAWpK4oRvx9VO1NK+HpW4cgsr1lB8hLDRYDLNYJio//04rvIG9weci41bOl7Y
 1cIA==
X-Gm-Message-State: APjAAAVK2gs7CuzPCVa6I7dl0EIueGFI9W7b1e4so7/SGP6kChCmIjh2
 Mj7/KmEoJh3vxA6IDR8fuzUgX1SuWUdBy0Yd940ugw==
X-Google-Smtp-Source: APXvYqyPz5KQWvD+eakc5Lbbg9Fv9cJ+JpDlnFXrqCXzg3AuNaADqkkNAfxo1NOd5rgX2ljaHm/mIqQDuVCP+JsY+FA=
X-Received: by 2002:aca:c7c6:: with SMTP id x189mr2102706oif.4.1561740183467; 
 Fri, 28 Jun 2019 09:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <156097935391.32250.14918304155094222078.malonedeb@chaenomeles.canonical.com>
 <156113479576.29306.8491703251507627705.malone@gac.canonical.com>
 <B0FDD5B2-EA6F-4ABC-8BF5-6231AA31EB70@canonical.com>
 <s5hh88a6pig.wl-tiwai@suse.de>
 <4E6239D9-3A70-4D66-9F88-453EB268DA2A@canonical.com>
In-Reply-To: <4E6239D9-3A70-4D66-9F88-453EB268DA2A@canonical.com>
From: Connor McAdams <conmanx360@gmail.com>
Date: Fri, 28 Jun 2019 12:42:52 -0400
Message-ID: <CAM8Agx0Mx+B3VeANVkO+3EZAuRPZ8z-GB0npeJwWPvQ54YaMxg@mail.gmail.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] ca0132 audio in Ubuntu 19.04 only after Windows 10
 started, missing ctefx-r3di.bin
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

SG0uLi4gbm90IHN1cmUgdGhlIGZpcm13YXJlIHdpbGwgZml4IHRoaXMgaXNzdWUsIGFzIGl0IGZh
bGxzIGJhY2sgdG8KdGhlIGRlZmF1bHQgY3RlZnguYmluIGZpcm13YXJlIHdoaWNoIHNob3VsZCB3
b3JrIGZpbmUuIEJ1dCBpdCdzIHdvcnRoCmEgc2hvdC4KCkhpcyBjYXJkIGxvb2tzIGxpa2UgaXQn
cyBiZWluZyBpZGVudGlmaWVkIHByb3Blcmx5LCBhbmQgSSd2ZSBoYWQKcmVwb3J0cyBmcm9tIG90
aGVycyB3aXRoIHRoZSBzYW1lIG1vdGhlcmJvYXJkIGNvZGVjcyBub3QgaGF2aW5nCmlzc3Vlcy4K
ClRoZXJlJ3Mgbm90IHRvbyBtdWNoIHRoYXQgSSBjYW4gcmVhbGx5IHRyb3VibGVzaG9vdCB3aXRo
IHRoZXNlIGNhcmRzLAphcyBJIGxhY2sgdGhlIGRvY3VtZW50YXRpb24uIEFsbCB0aGF0IEkga25v
dyBpcyBmcm9tIGNhcHR1cmluZyB0aGUgSERBCnZlcmJzIGZyb20gYSBXaW5kb3dzIHZpcnR1YWwg
bWFjaGluZSB3aXRoIFBDSSBwYXNzdGhyb3VnaC4KClRoZSBvbmx5IHRoaW5nIEkgY2FuIHJlYWxs
eSB0aGluayBvZiBpcyBHUElPIHBvdGVudGlhbGx5LCBidXQgdGhhdAp3b3VsZCBiZSByZS1zZXQg
d2hlbiB0aGUgTGludXggZHJpdmVyIGlzIGJvb3RlZCB1cC4gSSBrbm93IHNvbWUgdXNlcnMKaGF2
ZSB0byBkbyBhIGZ1bGwgb24gc2h1dGRvd24gdG8gY2xlYXIgdGhlIGNhcmRzIGludGVybmFsIG1l
bW9yeSBmb3IKaXQgdG8gd29yayBpbiBMaW51eCwgYnV0IGl0IHNvdW5kcyBsaWtlIGhlIG1heSBo
YXZlIGFscmVhZHkgZG9uZSB0aGF0LgoKSSdsbCBsb29rIGludG8gdGhpcyBhIGxpdHRsZSBiaXQg
d2hlbiBJIGdldCBzb21lIHRpbWUsIGJ1dCB0aGUgaXNzdWUKaXMgdGhhdCBJIGRvbid0IGhhdmUg
dG9vIG1hbnkgb3B0aW9ucy9pZGVhcyBvbiB3aGF0IGNvdWxkIGJlCnBvdGVudGlhbGx5IHdyb25n
LgoKT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgNToyOSBBTSBLYWktSGVuZyBGZW5nCjxrYWkuaGVu
Zy5mZW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gYXQgMTc6MTMsIFRha2FzaGkgSXdhaSA8
dGl3YWlAc3VzZS5kZT4gd3JvdGU6Cj4KPiA+IE9uIEZyaSwgMjggSnVuIDIwMTkgMDg6MzU6NTEg
KzAyMDAsCj4gPiBLYWktSGVuZyBGZW5nIHdyb3RlOgo+ID4+IEhpIENvbm5vciwKPiA+Pgo+ID4+
IFRoZSBidWcgd2FzIGZpbGVkIGF0IExhdW5jaHBhZCBbMV0sIEkgdGhpbmsgdGhlIG1vc3Qgbm90
YWJsZSBlcnJvciBpcwo+ID4+IFsgICAgMy43Njg2NjddIHNuZF9oZGFfaW50ZWwgMDAwMDowMDox
Zi4zOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IKPiA+PiBjdGVmeC1yM2RpLmJpbiBmYWlsZWQg
d2l0aCBlcnJvciAtMgo+ID4+Cj4gPj4gVGhlIGZpcm13YXJlIGlzIGluZGVlZCBsaXN0ZWQgaW4g
cGF0Y2hfY2EwMTMyLmMsIGJ1dCBsb29rcyBsaWtlCj4gPj4gdGhlcmXigJlzIG5vICBjb3JyZXNw
b25kaW5nIGZpbGUgaW4gbGludXgtZmlybXdhcmUuCj4gPgo+ID4gRllJLCB0aGUgZmlybXdhcmUg
aXMgZm91bmQgaW4gYWxzYS1maXJtd2FyZSBnaXQgcmVwbyBmb3Igbm93Lgo+Cj4gR290IGl0LCB0
aGFua3MgZm9yIHRoZSBpbmZvLiBEaWRu4oCZdCBrbm93IHRoZXJl4oCZcyBhbHNhLWZpcm13YXJl
IHJlcG8uCj4KPiBLYWktSGVuZwo+Cj4gPgo+ID4KPiA+IFRha2FzaGkKPgo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
