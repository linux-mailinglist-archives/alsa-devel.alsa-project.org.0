Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5AA10B700
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 20:48:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616F616F4;
	Wed, 27 Nov 2019 20:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616F616F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574884112;
	bh=nyGpMHaPnYgLpMF5hTFQ5Yue/JILyvUUTmaMugFvpX8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BhjL7MC+tcSwmB8tiSGh9SznjR6aamfbp0SbzIEexVFpXPYHGY1ecWEHzBAM1xF0T
	 ijorBvOtbOY2IScRJvGhO4VbNohHhPkOIpdDgdYxzvV0ZFi8c0XZW/Iv0x3EEcG5hW
	 MMVrTJ4DiaTdwNylrEejtoWAJnq0hLBn9cqLsOSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3523FF8016F;
	Wed, 27 Nov 2019 20:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C61F8014D; Wed, 27 Nov 2019 20:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 531D7F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 20:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 531D7F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="g9UlESFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574884001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1aT8sBSfZC1cGowQh/yA1kv2TBxZi68O9kjHgC8wVk=;
 b=g9UlESFsJDsjF0vBKeo70VX/Zolrz+0yvUhC7YtChpvhiBjwoA3nD1ojh5k38iO53x91In
 1SRe5UCrX8Gd50CuTZ4f4w9PXzMnq5Q2tt/ZITPJj+gMHTsQ1JPhH/C9gpmL7pn6R7hDGU
 qVFG9+SNZceHU5iwtB2AAsgCVexyWzk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-mhkFpubWPC-BmyeGsWThHQ-1; Wed, 27 Nov 2019 14:46:39 -0500
Received: by mail-wm1-f71.google.com with SMTP id y125so1629690wmg.1
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 11:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nhXbg82bSBqpdH/AtLZgoisMNWJSuTLSgkik2CHjVr8=;
 b=dRgAoEjnDvxknAaXJoiuRebRMyZyws+Yv2t/8Xex6MKt5qEDsLnZA096kdYzrfYo06
 Rwr2yiCvgOTjVrYmm6QejtThHLSmi4FT41fP2R5voaXdD4rlCqCGQWPXiJVQPv8celBv
 754AFWYm3iaFfIwfHcBfidlrmUFMAXGVIe//0aTd3GjjDPUlXKabGY2vy3zNxOzvD8ns
 Nms4X0vN1vsQO8HvoZ2D+5mOAU6VZ6WM7j6cq03tjX4sdb9wbhCJxSGoS9+C/UepOPuO
 FaQ0ms9rVRSKlH5ucPpFVvp9XSEVR5HjuITLJTba4ya+IGCC3scfgztZ4k6N6FNV1JNT
 QZ5Q==
X-Gm-Message-State: APjAAAV8OMAOiTKWbYCQE04iWu+uiwWmxz2EESBSTCEjY1BlHGl92XBc
 /jU41vxm3o8XX/S2XqcgKTXIGvtlOo1bkeHPq/6GzhO+6dydmgYj5OAoMkc3zLHcjEd+EqXowAl
 r7Cu7w73ViRgYSe7EyOFqJbY=
X-Received: by 2002:a7b:c936:: with SMTP id h22mr6425436wml.115.1574883997809; 
 Wed, 27 Nov 2019 11:46:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtBxajbPxi4v7BDhbqeGl4eiKac6a0bWoipJeYr4x3mUdQ/r2B+0pI7HkiiFuE1uweMCgKew==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr6425419wml.115.1574883997503; 
 Wed, 27 Nov 2019 11:46:37 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id t12sm2638857wrs.96.2019.11.27.11.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 11:46:36 -0800 (PST)
To: Takashi Iwai <tiwai@suse.de>
References: <20191127142637.GB33700@prime> <s5hd0ddwfhg.wl-tiwai@suse.de>
 <8c22afa4-10ca-efc7-5a8c-b927a27959d6@redhat.com>
 <s5hzhghuxbj.wl-tiwai@suse.de> <s5hlfs1uue6.wl-tiwai@suse.de>
 <20191127185237.GA7486@prime> <s5h8so1m8am.wl-tiwai@suse.de>
 <s5h4kypm867.wl-tiwai@suse.de>
 <81af92d6-a7ad-b947-1265-e3d3f7c43b4a@redhat.com>
 <s5h1rttm7k6.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a3f7aedb-4467-2b37-c8f3-f2f6b4fafbf8@redhat.com>
Date: Wed, 27 Nov 2019 20:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <s5h1rttm7k6.wl-tiwai@suse.de>
Content-Language: en-US
X-MC-Unique: mhkFpubWPC-BmyeGsWThHQ-1
X-Mimecast-Spam-Score: 0
Cc: MichaX2 Matysiak <matysiakmichal@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

SGksCgpPbiAyNy0xMS0yMDE5IDIwOjQwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gV2VkLCAy
NyBOb3YgMjAxOSAyMDozMToyMCArMDEwMCwKPiBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+Pgo+PiBI
aSwKPj4KPj4gT24gMjctMTEtMjAxOSAyMDoyNywgVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pj4gT24g
V2VkLCAyNyBOb3YgMjAxOSAyMDoyNDo0OSArMDEwMCwKPj4+IFRha2FzaGkgSXdhaSB3cm90ZToK
Pj4+Pgo+Pj4+IE9uIFdlZCwgMjcgTm92IDIwMTkgMTk6NTI6MzcgKzAxMDAsCj4+Pj4gTWljaGHF
giBNYXR5c2lhayB3cm90ZToKPj4+Pj4KPj4+Pj4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6
MDA6MTdQTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pj4+Pj4gT24gV2VkLCAyNyBOb3Yg
MjAxOSAxNjo1NzowNCArMDEwMCwKPj4+Pj4+IFRha2FzaGkgSXdhaSB3cm90ZToKPj4+Pj4+Pgo+
Pj4+Pj4+IE9uIFdlZCwgMjcgTm92IDIwMTkgMTY6NDY6MDAgKzAxMDAsCj4+Pj4+Pj4gSGFucyBk
ZSBHb2VkZSB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSGkgVGFrYXNoaSwKPj4+Pj4+Pj4KPj4+
Pj4+Pj4gT24gMjctMTEtMjAxOSAxNTozOSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pj4+Pj4+Pj4g
T24gV2VkLCAyNyBOb3YgMjAxOSAxNToyNjozNyArMDEwMCwKPj4+Pj4+Pj4+IE1pY2hhxYIgTWF0
eXNpYWsgd3JvdGU6Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBIaQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4gUmVjZW50bHkgSSd2ZSBlbmNvdW50ZXJlZCB0aGlzIGVycm9yIGFuZCBhcyBIYW5zIGRlIEdv
ZWRlJ3MgcmVxdWVzdCBJJ20KPj4+Pj4+Pj4+PiByZXBvcnRpbmcgdGhpcyBiYWNrIHRvIHlvdS4g
VGhpcyBoYXBwZW5zIHdoaWxlIGJvb3RpbmcgbXkgbGFwdG9wCj4+Pj4+Pj4+Pj4gY29ubmVjdGVk
IHRvIGRvY2tpbmcgc3RhdGlvbiBhbmQgd2l0aG91dCB1c2luZyBvbmUuCj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+PiBrZXJuZWw6IFdBUk5JTkc6IENQVTogMSBQSUQ6IDMzMCBhdCBzb3VuZC9oZGEvaGRh
Y19jb21wb25lbnQuYzoyOTAgc25kX2hkYWNfYWNvbXBfaW5pdCsweGRlLzB4MTMwIFtzbmRfaGRh
X2NvcmVdCj4+Pj4+Pj4+Pj4gVGhlcmUgYXJlIDIgbW9yZSAiY3V0IGhlcmUiLCBidXQgdGhleSdy
ZSBhbG1vc3QgaWRlbnRpY2FsIHNvIEkndmUgb25seQo+Pj4+Pj4+Pj4+IGluY2x1ZGVkIG9uZSBp
biB0aGlzIGVtYWlsLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gRG9uJ3Qga25vdyB3aGF0IHdpbGwg
YmUgdmFsdWFibGUgdG8geW91LCBidXQgSSdtIHdpbGxpbmcgdG8gaGVscCB0ZXN0Cj4+Pj4+Pj4+
Pj4gdGhpcyBhbmQgZG8gd2hhdCBJJ20gdG9sZC4gU28sIGhvdyBjYW4gSSBoZWxwPwo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4gTW9yZSBpbmZvIGFib3V0IHRoaXMgcGFydGljdWxhciBrZXJuZWwgYW5k
IGlzc3VlLCB0aGF0IGxlZCB0byB0aGlzIGlzIGF0Ogo+Pj4+Pj4+Pj4+IGh0dHBzOi8vYnVnemls
bGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTc1Nzg5MQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4gZG1lc2cgb3V0cHV0Ogo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gTm92IDI2IDE4OjA1OjQ1IGtl
cm5lbDogbWljcm9jb2RlOiBtaWNyb2NvZGUgdXBkYXRlZCBlYXJseSB0byByZXZpc2lvbiAweDJm
LCBkYXRlID0gMjAxOS0wMi0xNwo+Pj4+Pj4+Pj4+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IExp
bnV4IHZlcnNpb24gNS40LjAtMC5yYzguZ2l0MC4xLnJoYnoxNzU3ODkxLmZjMzEueDg2XzY0ICht
b2NrYnVpbGRAYnVpbGRody0xMC5waHgyLmZlZG9yYXByb2plY3Qub3JnKSAoZ2NjIHZlcnNpb24g
OS4yLjEgMjAxOTA4MjcgKFJlZCBIYXQgOS4yLjEtMSkgKEdDQykpICMxIFNNUCBXZWQgTm92IDIw
IDE0OjUwOjM0IFVUQyAyMDE5Cj4+Pj4+Pj4+Pj4gTm92IDI2IDE4OjA1OjQ1IGtlcm5lbDogQ29t
bWFuZCBsaW5lOiBCT09UX0lNQUdFPShoZDAsZ3B0Mikvdm1saW51ei01LjQuMC0wLnJjOC5naXQw
LjEucmhiejE3NTc4OTEuZmMzMS54ODZfNjQgcm9vdD0vZGV2L21hcHBlci9mZWRvcmEtcm9vdCBy
byByZXN1bWU9L2Rldi9tYXBwZXIvZmVkb3JhLXN3YXAgcmQubHZtLmx2PWZlZG9yYS9yb290IHJk
Lmx1a3MudXVpZD1sdWtzLWVmZDhiNDM4LThmNTYtNDA1YS04Y2VhLTg4ZjgzY2EzOGQyYiByZC5s
dm0ubHY9ZmVkb3JhL3N3YXAgcmhnYiBxdWlldAo+Pj4+Pj4+Pj4+IC4uLgo+Pj4+Pj4+Pj4+IC4u
Lgo+Pj4+Pj4+Pj4+IC4uLgo+Pj4+Pj4+Pj4+IE5vdiAyNiAxODowNjoxNiBrZXJuZWw6IC0tLS0t
LS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+Pj4+Pj4+Pj4+IE5vdiAyNiAxODowNjox
NiBrZXJuZWw6IFdBUk5JTkc6IENQVTogMCBQSUQ6IDQ2MSBhdCBzb3VuZC9oZGEvaGRhY19jb21w
b25lbnQuYzoyOTAgc25kX2hkYWNfYWNvbXBfaW5pdCsweGRlLzB4MTMwIFtzbmRfaGRhX2NvcmVd
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIGFscmVhZHkgZml4ZWQg
YnkgdGhlIHJlY2VudCBjb21taXQKPj4+Pj4+Pj4+IDVhODU4ZTc5YzkxMTMzMDY3OGI1YTliZTkx
YTI0ODMwZTk0YTBkYzkKPj4+Pj4+Pj4+ICAgICAgICBBTFNBOiBoZGEgLSBEaXNhYmxlIGF1ZGlv
IGNvbXBvbmVudCBmb3IgbGVnYWN5IE52aWRpYSBIRE1JIGNvZGVjcwo+Pj4+Pj4+Pj4gd2hpY2gg
aXMgYWxyZWFkeSBpbmNsdWRlZCBpbiBMaW51cyB0cmVlLiAgUGxlYXNlIGNoZWNrIGl0Lgo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBUaGFua3MsIEkndmUgc3RhcnRlZCBhIHNjcmF0Y2gga2VybmVsIGJ1aWxk
IHdpdGggdGhlIHJlbGV2YW50IHBhdGNoZXMgYWRkZWQsCj4+Pj4+Pj4+IGZvciB0aGUgRmVkb3Jh
IHVzZXJzIGhpdHRpbmcgdGhpcyB0byB0ZXN0Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgcmVhc29u
IHRoZXkgc3RhcnRlZCBsb29raW5nIGludG8gdGhlaXIgZG1lc2cgaXMgdGhhdCB0aGVpciBudmlk
aWEgR1BVIChoeWJyaWQgZ2Z4IHNldHVwKQo+Pj4+Pj4+PiB3aWxsIG5vIGxvbmdlciBzdXNwZW5k
IHdpdGggcmVjZW50IGtlcm5lbHMsIHRoaXMgaXMgd2l0aCBhIDUuNCBrZXJuZWwgd2hpY2ggYWxy
ZWFkeSBoYXMgdGhlCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICJBTFNBOiBoZGEgLSBGb3JjZSBydW50aW1l
IFBNIG9uIE52aWRpYSBIRE1JIGNvZGVjcyIKPj4+Pj4+Pj4KPj4+Pj4+Pj4gRml4IGFuZCBmb3Ig
Z29vZCBtZWFzdXJlIEkndmUgYWxyZWFkeSBnaXZlbiB0aGVtIGEgdGVzdCBrZXJuZWwgd2l0aCB0
aGU6Cj4+Pj4+Pj4+ICJBTFNBOiBoZGE6IEFsbG93IEhEQSB0byBiZSBydW50aW1lIHN1c3BlbmRl
ZCB3aGVuIGRHUFUgaXMgbm90IGJvdW5kIHRvIGEgZHJpdmUiCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IHBh
dGNoIGFkZGVkLiBCdXQgbG9va2luZyBhdCB0aGUgZml4IGZvciB0aGUgb29wcyBJJ20gbm90IHN1
cmUgaWYgZml4aW5nCj4+Pj4+Pj4+IHRoZSBvb3BzIGlzIGFsc28gZ29pbmcgdG8gZml4IHRoZSBp
c3N1ZSB3aXRoIHRoZSBkR1BVIG5vIGxvbmdlciBzdXNwZW5kaW5nPwo+Pj4+Pj4+Cj4+Pj4+Pj4g
SSBndWVzcyBpdCdzIGlycmVsZXZhbnQgd2l0aCB0aGF0IHByb2JsZW0sIGFzIHRoaXMga2VybmVs
IHdhcm5pbmcgKG5vdAo+Pj4+Pj4+IHJlYWxseSBhbiBPb3BzKSBpcyBqdXN0IGFib3V0IHNraXBw
aW5nIHRoZSBtdWx0aXBsZSBhdWRpbyBjb21wb25lbnQKPj4+Pj4+PiByZWdpc3RyYXRpb24uICBB
bmQgdGhlIGF1ZGlvIGNvbXBvbmVudCBpc24ndCB1c2VkIGluIG5vdXZlYXUgc2lkZSBvbgo+Pj4+
Pj4+IDUuNC54IGF0IGFsbCwgYW5kIGl0J3MganVzdCBhIHBsYWNlaG9sZGVyLiAgQnV0IHdobyBr
bm93cyB0aGUgYmxhY2sKPj4+Pj4+PiBtYWdpYyBiZWhpbmQgdGhlIHNjZW5lIDopCj4+Pj4+Pgo+
Pj4+Pj4gLi4uIGFuZCBpZiB0aGlzIHN0aWxsIGRvZXNuJ3QgZml4IHRoZSBwcm9ibGVtLCBwbGVh
c2UgY2hlY2sgdGhlCj4+Pj4+PiBydW50aW1lIFBNIHN0YXRlIG9mIGFsbCBIRC1hdWRpbyBjb2Rl
YyBkZXZpY2VzIGFuZCBIRC1hdWRpbyBjb250cm9sbGVyCj4+Pj4+PiBkZXZpY2UuICBEbyBhbGwg
c2hvdyB0aGUgcnVudGltZS1zdXNwZW5kZWQgYnV0IHRoZSBwb3dlciBjb25zdW1wdGlvbgo+Pj4+
Pj4gaXMgaGlnaD8gIE9yIGlzIHNvbWUgZGV2aWNlIGJsb2NrZWQ/Cj4+Pj4+Pgo+Pj4+Pj4gQmFz
aWNhbGx5IHRoZSBhdWRpbyBjb250cm9sbGVyIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGRHUFUgc2hv
dWxkIGhhdmUKPj4+Pj4+IGNoaXAtPmJ1cy5rZWVwX3Bvd2VyID0gMCwgd2hpY2ggYWxsb3dzIHRo
ZSBydW50aW1lIFBNLiAgVGhpcyBmbGFnIGlzCj4+Pj4+PiBjbGVhcmVkIGF0IGF6eF92eF9ncHVf
Ym91bmQoKSBvbmx5IGZvciB0aGUgZEdQVS4gIEZvciB0aGUgcHJpbWFyeSBHUFUsCj4+Pj4+PiB3
ZSBuZWVkIHRvIGtlZXAgdGhlIGxpbmsgcG93ZXIgdW5sZXNzIHRoZSBub3RpZmljYXRpb24gaXMg
ZG9uZSB2aWEgdGhlCj4+Pj4+PiBhdWRpbyBjb21wb25lbnQgKGxpa2UgaTkxNSBvciBhbWRncHUp
LiAgSSBhbHJlYWR5IHN1Ym1pdHRlZCBhIHBhdGNoIHRvCj4+Pj4+PiBlbmFibGUgdGhlIGF1ZGlv
IGNvbXBvbmVudCBmb3Igbm91dmVhdSBpbiB0aGUgcGFzdCwgYnV0IGl0J3MgaWdub3JlZCwKPj4+
Pj4+IHNvIGZhci4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gdGhhbmtzLAo+Pj4+Pj4KPj4+Pj4+IFRh
a2FzaGkKPj4+Pj4KPj4+Pj4gSGkgVGFrYXNoaQo+Pj4+Pgo+Pj4+PiBPbiBsaW51eC1uZXh0LTIw
MTkxMTI3IHdhcm5pbmcgaW5kZWVkIGRpc2FwcGVhcmVkLiBUaGFua3MhCj4+Pj4+Cj4+Pj4+IFJl
c3Qgb2YgcHJvYmxlbXMgZGlkIG5vdC4gVGhpcyBpcyBteSBvdXRwdXQgZnJvbSBhbHNhLWluZm8u
c2gKPj4+Pj4gaHR0cDovL2Fsc2EtcHJvamVjdC5vcmcvZGIvP2Y9OTFiYjc4OWEwMWY5ZWVkOTJk
MDUzNGZlODk1MTYxOTMxMmIzNTVkYQo+Pj4+PiBEb24ndCBrbm93IGlmIGl0J3MgaGVscGZ1bCwg
c28gSSdsbCBsZWF2ZSBpdCBoZXJlLiBQb3dlciBjb25zdW1wdGlvbiBpcwo+Pj4+PiBoaWdoLCBi
ZWNhdXNlIHJ1bnRpbWUtc3VzcGVuZGVkIGlzIG5vdCBlbmFibGVkL2FjdGl2ZSAoYW5kIGNhbm5v
dCBiZQo+Pj4+PiBmb3JjZWQpIHdpdGhvdXQgcmVtb3ZpbmcgbnZpZGlhJ3MgYXVkaW8uCj4+Pj4K
Pj4+PiBXaGF0IGlmIHlvdSBwYXNzIHBvd2VyX3NhdmU9MSB0byBzbmQtaGRhLWludGVsIG9wdGlv
bj8KPj4+Pgo+Pj4+ICAgICBlY2hvIC1uIDEgPiAvc3lzL21vZHVsZS9zbmRfaGRhX2ludGVsL3Bh
cmFtZXRlcnMvcG93ZXJfc2F2ZQo+Pj4KPj4+IGFuZCB0aGUgZm9sbG93aW5nLCB0b286Cj4+PiAg
ICAgICBlY2hvIC1uIDEgPiAvc3lzL21vZHVsZS9zbmRfaGRhX2ludGVsL3BhcmFtZXRlcnMvcG93
ZXJfc2F2ZV9jb250cm9sbGVyCj4+Pgo+Pj4gT3RoZXJ3aXNlIHRoZSBjb250cm9sbGVyIGRldmlj
ZSB3aWxsIGtlZXAgb24uCj4+Cj4+IFRoYW5rIHlvdSBmb3IgaGVscGluZyB1cyBnZXR0aW5nIHRv
IHRoZSByb290IG9mIHRoaXMuCj4+Cj4+IFRoZXNlIGJvdGggZGVmYXVsdCB0byAxIHJlc3AuIFkg
b24gRmVkb3JhIGtlcm5lbHMsIHNvIEkgZG8gbm90IHRoaW5rCj4+IHRoYXQgdGhpcyB3aWxsIGhl
bHAsIGFzIHRoZXkgYXJlIGJvdGggYWxyZWFkeSAxL1kuCj4gCj4gV2VsbCwgdGhlIGFsc2EtaW5m
by5zaCBvdXRwdXQgTWljaGFsIHN1Z2dlc3RlZCBzaG93cyBkaWZmZXJlbnRseToKPiAgICBodHRw
Oi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj05MWJiNzg5YTAxZjllZWQ5MmQwNTM0ZmU4OTUxNjE5
MzEyYjM1NWRhCj4gCj4gICAgISFMb2FkZWQgc291bmQgbW9kdWxlIG9wdGlvbnMKPiAgICAhIS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgIC4uLi4KPiAgICBwb3dlcl9zYXZlIDogMAo+
ICAgIHBvd2VyX3NhdmVfY29udHJvbGxlciA6IE4KPiAKPiBJZiB0aGVzZSB2YWx1ZXMgYXJlIHRy
dWUsIG1heWJlIHNvbWUgZGVza3RvcCB0dW5pbmcgbW9kaWZpZXMgb24gdGhlCj4gZmx5PwoKT2gs
IHRoYXQgbWlnaHQgZXhwbGFpbiB3aHkgdGhlIGZpeGVzIGZvciB0aGlzIGFyZSBjb25maXJtZWQg
YXMgd29ya2luZyBieQpzb21lIG9mIG91ciB1c2VycywgYnV0IG5vdCBieSBhbGwuCgpNaWNoYWws
IGFyZSB5b3UgcGVyaGFwcyB1c2luZyBUTFAgb3Igc29tZSBzaW1pbGFyIHNvZnR3YXJlIHRvIHR1
bmUgLwppbXByb3ZlIHBvd2VyLW1hbmFnZW1lbnQgc2V0dGluZ3MgPyAgT3IgZG8geW91IHBlcmhh
cHMgaGF2ZSBzb21lCmN1c3RvbSBmaWxlcyB1bmRlciAvZXRjL21vZHByb2JlLmNvbmYuZCBtZXNz
aW5nIHdpdGggdGhlc2Ugc2V0dGluZ3M/CgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
