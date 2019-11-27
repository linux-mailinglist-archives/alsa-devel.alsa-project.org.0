Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 875A110B2A7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 16:47:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA9F1709;
	Wed, 27 Nov 2019 16:47:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA9F1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574869675;
	bh=RV1GuGdrPlBTJW4zNFpbB8ZqKmyHtpH6pI+Cg1i111Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sw+otG7WVaVCCsUDW58jkyhuD60DbW0ubPC7BIOAN13a1G0C9/1vtpnUEj74OUhaV
	 IvOZ4/XWb9zoQav3HkxRiTtGjWwW1oLbpRCNo7EXfAtxMVYtqBlVvBFm6roFLsMJrB
	 MsUUidDrXHL9xO45iNzLlhiCTCl2+qbvzabJhzyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6238EF80171;
	Wed, 27 Nov 2019 16:46:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 818CEF8014D; Wed, 27 Nov 2019 16:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2B62F80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 16:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B62F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Nkim8vod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574869565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ubOHdBi0/EA08upXM+K+StCMkn5s//S4IWLT4liaKU=;
 b=Nkim8vod5CeT4JNbo8XrU/d72UTvtCbQKe8m6p3UIc67COv7g7xcwQubnedwNmu4iyTqG6
 lrU1HHYU51F6XSnhEQ8rWAXbA257vZTU+e54pnobKGer3M03YsFGEJvhDsNq/MLMB00Q0N
 psWZGcriJ8ThWFO43SkLGLDOeA+/OOE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-XNBlajtCPTyb5klPlVIOQw-1; Wed, 27 Nov 2019 10:46:03 -0500
Received: by mail-wm1-f72.google.com with SMTP id f16so2556977wmb.2
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 07:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Y4SDM8EzHnSo1ELMSE84iuB9El7RD95N7ATPgg/X6Y=;
 b=FV0nnhkDx54KRxwAGbhZIdJ6z9w3A876tkFGjfkxbo99vAE1aCtauDdyBgsDBeVBZJ
 mE3W2wmxSI0wXH5/ZHifjEr/t/9QcNFW70pVYPitTovQ2SmdO55TFErfyZCGc4TdRDNQ
 M8DrMtWdqo9Ieu/yyK0NeXiR40sWmZX0xatmuHyhq4oE3YHNpavVRaP0na5A7Wk+wV3u
 rDDmyYqwvX+554FgLefmdxjt+Di4LhGs9Ch0HLK2J9fGkNbNroZu04RXVQ2PVHMr9k9B
 6zViKYn/ZEhW5B0CXI3G/fkYRuRlWpwikgFsbYRVBpz9OJJYjs1ZVzFIGdieB5MQBv4i
 hTbw==
X-Gm-Message-State: APjAAAXbka55Dm7OXILcOsafbSvCB8YNxDsqWxclvAIGVeee3R2T3bno
 cM0P09t0mOsAkQGhytS7/ZLpk3AFRA+dFrxgvkYVn0fJU3Wwx86mjO2YShXuSOCc4bSyChCPbuZ
 46XmJkwwyaxADdQ11apQpC1w=
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr33579277wrm.278.1574869561890; 
 Wed, 27 Nov 2019 07:46:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxsyA3EdJGTdJpCLW4R2QaeZmWj3ZhAL6WQNyxl+Matn2WglHk3SM8GAICmawNBdQOFfBxFOw==
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr33579249wrm.278.1574869561656; 
 Wed, 27 Nov 2019 07:46:01 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id i127sm7527734wma.35.2019.11.27.07.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 07:46:00 -0800 (PST)
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Micha=c5=82_Matysiak?=
 <matysiakmichal@gmail.com>
References: <20191127142637.GB33700@prime> <s5hd0ddwfhg.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8c22afa4-10ca-efc7-5a8c-b927a27959d6@redhat.com>
Date: Wed, 27 Nov 2019 16:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <s5hd0ddwfhg.wl-tiwai@suse.de>
Content-Language: en-US
X-MC-Unique: XNBlajtCPTyb5klPlVIOQw-1
X-Mimecast-Spam-Score: 0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] kernel oops related to the new HDA audio handling
	for DP MST
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgVGFrYXNoaSwKCk9uIDI3LTExLTIwMTkgMTU6MzksIFRha2FzaGkgSXdhaSB3cm90ZToKPiBP
biBXZWQsIDI3IE5vdiAyMDE5IDE1OjI2OjM3ICswMTAwLAo+IE1pY2hhxYIgTWF0eXNpYWsgd3Jv
dGU6Cj4+Cj4+IEhpCj4+Cj4+IFJlY2VudGx5IEkndmUgZW5jb3VudGVyZWQgdGhpcyBlcnJvciBh
bmQgYXMgSGFucyBkZSBHb2VkZSdzIHJlcXVlc3QgSSdtCj4+IHJlcG9ydGluZyB0aGlzIGJhY2sg
dG8geW91LiBUaGlzIGhhcHBlbnMgd2hpbGUgYm9vdGluZyBteSBsYXB0b3AKPj4gY29ubmVjdGVk
IHRvIGRvY2tpbmcgc3RhdGlvbiBhbmQgd2l0aG91dCB1c2luZyBvbmUuCj4+Cj4+IGtlcm5lbDog
V0FSTklORzogQ1BVOiAxIFBJRDogMzMwIGF0IHNvdW5kL2hkYS9oZGFjX2NvbXBvbmVudC5jOjI5
MCBzbmRfaGRhY19hY29tcF9pbml0KzB4ZGUvMHgxMzAgW3NuZF9oZGFfY29yZV0KPj4gVGhlcmUg
YXJlIDIgbW9yZSAiY3V0IGhlcmUiLCBidXQgdGhleSdyZSBhbG1vc3QgaWRlbnRpY2FsIHNvIEkn
dmUgb25seQo+PiBpbmNsdWRlZCBvbmUgaW4gdGhpcyBlbWFpbC4KPj4KPj4gRG9uJ3Qga25vdyB3
aGF0IHdpbGwgYmUgdmFsdWFibGUgdG8geW91LCBidXQgSSdtIHdpbGxpbmcgdG8gaGVscCB0ZXN0
Cj4+IHRoaXMgYW5kIGRvIHdoYXQgSSdtIHRvbGQuIFNvLCBob3cgY2FuIEkgaGVscD8KPj4KPj4g
TW9yZSBpbmZvIGFib3V0IHRoaXMgcGFydGljdWxhciBrZXJuZWwgYW5kIGlzc3VlLCB0aGF0IGxl
ZCB0byB0aGlzIGlzIGF0Ogo+PiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcu
Y2dpP2lkPTE3NTc4OTEKPj4KPj4gZG1lc2cgb3V0cHV0Ogo+Pgo+PiBOb3YgMjYgMTg6MDU6NDUg
a2VybmVsOiBtaWNyb2NvZGU6IG1pY3JvY29kZSB1cGRhdGVkIGVhcmx5IHRvIHJldmlzaW9uIDB4
MmYsIGRhdGUgPSAyMDE5LTAyLTE3Cj4+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IExpbnV4IHZl
cnNpb24gNS40LjAtMC5yYzguZ2l0MC4xLnJoYnoxNzU3ODkxLmZjMzEueDg2XzY0IChtb2NrYnVp
bGRAYnVpbGRody0xMC5waHgyLmZlZG9yYXByb2plY3Qub3JnKSAoZ2NjIHZlcnNpb24gOS4yLjEg
MjAxOTA4MjcgKFJlZCBIYXQgOS4yLjEtMSkgKEdDQykpICMxIFNNUCBXZWQgTm92IDIwIDE0OjUw
OjM0IFVUQyAyMDE5Cj4+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IENvbW1hbmQgbGluZTogQk9P
VF9JTUFHRT0oaGQwLGdwdDIpL3ZtbGludXotNS40LjAtMC5yYzguZ2l0MC4xLnJoYnoxNzU3ODkx
LmZjMzEueDg2XzY0IHJvb3Q9L2Rldi9tYXBwZXIvZmVkb3JhLXJvb3Qgcm8gcmVzdW1lPS9kZXYv
bWFwcGVyL2ZlZG9yYS1zd2FwIHJkLmx2bS5sdj1mZWRvcmEvcm9vdCByZC5sdWtzLnV1aWQ9bHVr
cy1lZmQ4YjQzOC04ZjU2LTQwNWEtOGNlYS04OGY4M2NhMzhkMmIgcmQubHZtLmx2PWZlZG9yYS9z
d2FwIHJoZ2IgcXVpZXQKPj4gLi4uCj4+IC4uLgo+PiAuLi4KPj4gTm92IDI2IDE4OjA2OjE2IGtl
cm5lbDogLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4+IE5vdiAyNiAxODow
NjoxNiBrZXJuZWw6IFdBUk5JTkc6IENQVTogMCBQSUQ6IDQ2MSBhdCBzb3VuZC9oZGEvaGRhY19j
b21wb25lbnQuYzoyOTAgc25kX2hkYWNfYWNvbXBfaW5pdCsweGRlLzB4MTMwIFtzbmRfaGRhX2Nv
cmVdCj4gCj4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIGFscmVhZHkgZml4ZWQgYnkgdGhlIHJlY2Vu
dCBjb21taXQKPiA1YTg1OGU3OWM5MTEzMzA2NzhiNWE5YmU5MWEyNDgzMGU5NGEwZGM5Cj4gICAg
ICBBTFNBOiBoZGEgLSBEaXNhYmxlIGF1ZGlvIGNvbXBvbmVudCBmb3IgbGVnYWN5IE52aWRpYSBI
RE1JIGNvZGVjcwo+IHdoaWNoIGlzIGFscmVhZHkgaW5jbHVkZWQgaW4gTGludXMgdHJlZS4gIFBs
ZWFzZSBjaGVjayBpdC4KClRoYW5rcywgSSd2ZSBzdGFydGVkIGEgc2NyYXRjaCBrZXJuZWwgYnVp
bGQgd2l0aCB0aGUgcmVsZXZhbnQgcGF0Y2hlcyBhZGRlZCwKZm9yIHRoZSBGZWRvcmEgdXNlcnMg
aGl0dGluZyB0aGlzIHRvIHRlc3QuCgpUaGUgcmVhc29uIHRoZXkgc3RhcnRlZCBsb29raW5nIGlu
dG8gdGhlaXIgZG1lc2cgaXMgdGhhdCB0aGVpciBudmlkaWEgR1BVIChoeWJyaWQgZ2Z4IHNldHVw
KQp3aWxsIG5vIGxvbmdlciBzdXNwZW5kIHdpdGggcmVjZW50IGtlcm5lbHMsIHRoaXMgaXMgd2l0
aCBhIDUuNCBrZXJuZWwgd2hpY2ggYWxyZWFkeSBoYXMgdGhlCgoiQUxTQTogaGRhIC0gRm9yY2Ug
cnVudGltZSBQTSBvbiBOdmlkaWEgSERNSSBjb2RlY3MiCgpGaXggYW5kIGZvciBnb29kIG1lYXN1
cmUgSSd2ZSBhbHJlYWR5IGdpdmVuIHRoZW0gYSB0ZXN0IGtlcm5lbCB3aXRoIHRoZToKIkFMU0E6
IGhkYTogQWxsb3cgSERBIHRvIGJlIHJ1bnRpbWUgc3VzcGVuZGVkIHdoZW4gZEdQVSBpcyBub3Qg
Ym91bmQgdG8gYSBkcml2ZSIKCnBhdGNoIGFkZGVkLiBCdXQgbG9va2luZyBhdCB0aGUgZml4IGZv
ciB0aGUgb29wcyBJJ20gbm90IHN1cmUgaWYgZml4aW5nCnRoZSBvb3BzIGlzIGFsc28gZ29pbmcg
dG8gZml4IHRoZSBpc3N1ZSB3aXRoIHRoZSBkR1BVIG5vIGxvbmdlciBzdXNwZW5kaW5nPwoKQW55
d2F5cyBsZXRzIHdhaXQgZm9yIE1pY2hhbCBvciBvdGhlciBGZWRvcmEgdXNlcnMgdG8gdGVzdCBh
bmQgc2VlIGZyb20gdGhlcmUuCgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
