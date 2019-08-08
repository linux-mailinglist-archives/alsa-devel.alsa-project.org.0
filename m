Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D508599B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 07:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24DF950;
	Thu,  8 Aug 2019 07:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24DF950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565240721;
	bh=i/wHVM/UHIxoYd1HthBYCXGCgG9REXjUwgZLvAz4vw4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qu2o35DkxHJipZtFTqIdMeZ0mZjPyQsAhXOJ+4TXotNuReLANGg5dLG93x+XLKU9m
	 1Q8/s/pvsAOzePezpgeHK3nh+h0ZYxxo5N6VYFMZ01EfTapOxhHz1qI3YUDe5Fa8l4
	 cfGMcmKzFQw5yLIbY6p5yGot9N8LZszbFpL/a7NM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BE7F80534;
	Thu,  8 Aug 2019 07:03:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB31CF80534; Thu,  8 Aug 2019 07:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4B7FF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 07:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B7FF803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kIKtai9H"
Received: by mail-ot1-x342.google.com with SMTP id s20so48127987otp.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Aug 2019 22:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HRUYJOh9TexcVz+uOZFOFXhXnMvxnYw/8YwwYxLKw88=;
 b=kIKtai9HY+4sfS1yNBDNAvu+5CMOs2mghZPY369KzAZ5OCYilhLzKCrPUGac2kfYcw
 XTEo4mZsRy3oaCPhSQYtwrQibCix/oYAxQ25EMgHFdkoI4Gf5ixNppKsOjbyQB08aMcA
 e/TpytEyHbLr+AuBOu1969fdw6l/dz1Z5xpely5PbFHyrxoKzJz6xn9oULWzA87u2y12
 c+wlYEO4m8mnVWBjStQztekMseyIJ6uIYyMmieIS8SnGmaeaGKkZ7Wmt1CUdSb1JlxDv
 97IRYxbxFhK54wz3M7SiZLJB5ZG89OIbgPx8irfbYWh4xjc8y6DMBwj0Yydab+AtszI+
 HOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRUYJOh9TexcVz+uOZFOFXhXnMvxnYw/8YwwYxLKw88=;
 b=kaCQA+UczwKq3XqXqDkMlVeSE+ga8Su6vUDJwwcbLw6O8ibIYo7MDRwu52FwX5UwTM
 KzCRG2DIXfJj5X+/lX2U37+JFKdsb+17AttyhQplOUwfHpUYt4cfpSv6qNKtxUTD/LER
 tHDCA/CoJ5UTy1T6QoOML6K4ULPyMOMhcnNBQR3MVHXbTugyyKgiBJmnqdd7d8z7ya+N
 eWLt/3MMHpuf9H6n8vJH577XvXmj5yV0CN4fhsTgYHsehujqZmvdjabdouhxHXAc4p/K
 phnpV92NB6sI8EC5Lk0xarYi+OgjlphsjpNkr+4ZtCQZBbbX8+1UfRQ+n5zKLeg9gMFq
 b0Zg==
X-Gm-Message-State: APjAAAUmrFLKtyYen5MUkWOdQbDOe3BvP0qh5MA21xz/5YaO1nTxLDMe
 UDkesx9zrn0eZN6aLZ6lQYDKKDCmpnOHeCJ6Fhc=
X-Google-Smtp-Source: APXvYqxJmlvjpvf9rtpkxW+u5flNoJ+MHqspk2ggHszZYgzcHZ6ecm2h4q2Zgy+3jmUD9zJf7PF9HvEVZB5Iz5SVNjE=
X-Received: by 2002:a05:6830:164e:: with SMTP id
 h14mr11751278otr.186.1565240608791; 
 Wed, 07 Aug 2019 22:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAM+cExGffwFD7U--tZqd_PxFwgdy6YA_tZHvw6B3au9KNygEhA@mail.gmail.com>
 <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
 <5e969a5245d6922d28d71a7c453dd6e3f5fd2228.camel@iki.fi>
 <5509faf2dabd477bb2a5a35f249d6ed689611b8e.camel@iki.fi>
 <s5ha7cmmh5f.wl-tiwai@suse.de>
In-Reply-To: <s5ha7cmmh5f.wl-tiwai@suse.de>
From: karina filer <kafiler0911@gmail.com>
Date: Thu, 8 Aug 2019 10:33:17 +0530
Message-ID: <CAM+cExG1iqMYpecdcCi6gJZkiwu8Zm8t0-coMQEKsUQwDmkLGg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Tanu Kaskinen <tanuk@iki.fi>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Alsa-Plugin 1.0.25 License
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

VGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlLgoKLSBLLkZpbGVyCgpPbiBUdWUsIEF1ZyA2LCAyMDE5
IGF0IDk6MTUgUE0gVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPiB3cm90ZToKCj4gT24gVHVl
LCAwNiBBdWcgMjAxOSAxNzozNjowNiArMDIwMCwKPiBUYW51IEthc2tpbmVuIHdyb3RlOgo+ID4K
PiA+IE9uZSBtb3JlIGNvbW1lbnQuLi4KPiA+Cj4gPiBPbiBUdWUsIDIwMTktMDgtMDYgYXQgMTY6
MjAgKzAzMDAsIFRhbnUgS2Fza2luZW4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgMjAxOS0wOC0wNSBh
dCAyMjo0NCArMDUzMCwga2FyaW5hIGZpbGVyIHdyb3RlOgo+ID4gPiA+IEhpIFRlYW0sCj4gPiA+
ID4KPiA+ID4gPiBHcmVldGluZ3MgISEKPiA+ID4gPgo+ID4gPiA+IEkgYW0gZmFjaW5nIGRpZmZp
Y3VsdHkgdG8gdW5kZXJzdGFuZCB0aGUgQWxzYS1QbHVnaW4gTGljZW5zaW5nLAo+IENvdWxkIHlv
dQo+ID4gPiA+IHBsZWFzZSBoZWxwIG1lIHRvIG1ha2UgdW5kZXJzdGFuZD8sIElzIGl0IHVuZGVy
IEdQTCAyLjAgb3IgTEdQTCAyLjEKPiBiZWNhdXNlCj4gPiA+ID4gYWZ0ZXIgZXh0cmFjdGluZyB0
aGUgZm9sZGVyIEkgY2FuIHNlZSAyIGNvcHlpbmcgZmlsZSBvbmUgZm9yIEdQTCBhbmQKPiBvdGhl
cgo+ID4gPiA+IGZvciBMR1BMLgo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6Ly9yZXBvbG9neS5vcmcv
cHJvamVjdC9hbHNhLXBsdWdpbnMvcGFja2FnZXMKPiA+ID4KPiA+ID4gYWxzYS1wbHVnaW5zIHNl
ZW1zIHRvIGxhY2sgYSBSRUFETUUgb3Igb3RoZXIgb3ZlcnZpZXcgZG9jdW1lbnQgYWJvdXQKPiA+
ID4gdGhlIGxpY2Vuc2luZy4uLiBhbHNhLXBsdWdpbnMgaXMgcHJpbWFyaWx5IGxpY2Vuc2VkIHVu
ZGVyIExHUEwgMi4xLCBhbmQKPiA+ID4gdG8gbXkga25vd2xlZGdlIHRoZSBvbmx5IGV4Y2VwdGlv
biBpcyB0aGUgbGlic2FtcGxlcmF0ZSBiYXNlZCByYXRlCj4gPiA+IHBsdWdpbi4gVGhlIGxpY2Vu
c2luZyBpcyBleHBsYWluZWQgaGVyZToKPiA+ID4KPiA+ID4KPiBodHRwczovL2dpdC5hbHNhLXBy
b2plY3Qub3JnLz9wPWFsc2EtcGx1Z2lucy5naXQ7YT1ibG9iO2Y9cmF0ZS9yYXRlX3NhbXBsZXJh
dGUuYwo+ID4gPgo+ID4gPiBTbyB0aGlzIHBhcnRpY2x1YXIgcmF0ZSBwbHVnaW4gaXMgbGljZW5z
ZWQgdW5kZXIgR1BMIDIuMCAidG8gZm9sbG93IHRoZQo+ID4gPiBsaWNlbnNlIG9mIGxpYnNhbXBs
ZXJhdGUiLCB1bmxlc3MgeW91IGhhdmUgYSBjb21tZXJjaWFsIGxpY2Vuc2UgdG8KPiA+ID4gbGli
c2FtcGxlcmF0ZS4gSSBkb24ndCB0aGluayB0aGUgcmF0aW9uYWxlIGZvciB0aGF0IGV4Y2VwdGlv
biBtYWtlcwo+ID4gPiBtdWNoIHNlbnNlIChMR1BMIHdvdWxkIGhhdmUgd29ya2VkIGp1c3QgZmlu
ZSwgYXMgZmFyIGFzIEkgY2FuIHRlbGwpLAo+ID4gPiBidXQgYXQgdGhpcyBwb2ludCByZWxpY2Vu
c2luZyBtYXkgYmUgdmVyeSBkaWZmaWN1bHQgZHVlIHRvIG1hbnkKPiA+ID4gY29udHJpYnV0b3Jz
Lgo+ID4KPiA+IFJlbGljZW5zaW5nIHNob3VsZG4ndCBiZSB0aGF0IGhhcmQgYWZ0ZXIgYWxsLCBp
ZiB0aGF0J3MgZGVzaXJlZCAoSQo+ID4gdGhpbmsgaXQgd291bGQgYmUgYSBnb29kIGlkZWEpLiBO
b3cgdGhhdCBJIGxvb2tlZCwgdGhlcmUgYWN0dWFsbHkKPiA+IGFyZW4ndCBtYW55IGNvbnRyaWJ1
dG9ycyB0byB0aGF0IHBsdWdpbiwgb25seSBUYWthc2hpIGFuZCBKYXJvc2xhdi4KPiA+IERpZWdv
IEUuICdGbGFtZWV5ZXMnIFBldHRlbsOyIGFsc28gaGFzIGEgY29tbWl0LCBidXQgaXQgb25seSBj
aGFuZ2VzIG9uZQo+ID4gbGluZSBpbiB0aGUgYnVpbGQgc3lzdGVtLgo+Cj4gSSBkb24ndCBtaW5k
IHJlbGljZW5zaW5nIGF0IGFsbC4gIEJ1dCB0aGUgb25seSBjb25jZXJuIGlzIHRoYXQgbm8gb25l
Cj4gYnV0IGZvciBsYXd5ZXJzIGNhbiBjb25maXJtIGl0cyB2YWxpZGl0eS4uLgo+Cj4KPiB0aGFu
a3MsCj4KPiBUYWthc2hpCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
