Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CA10B729
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 21:06:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D2416EB;
	Wed, 27 Nov 2019 21:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D2416EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574885189;
	bh=nL6CCdex2JG0lAtslN2VfxFjKrd2Y2Y04j0+vwXpl7k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AlSufCr+sxnvJmiozMVdUpU+5RdlvoQeIOiJO0O7V14Oq+Nr0IvUmTDAjqCVPcP7v
	 OjXrfOBTqdLoxm+1RZFx3XOk5J+y89JJd/WgqrJqUqtdHsaIheczflsgB6d8Ptl0uK
	 Jw5eRATqlOnpkB89KSC9j62Y7Up/BRmVrXaS0AWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A41EF80171;
	Wed, 27 Nov 2019 21:04:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2832EF8014D; Wed, 27 Nov 2019 21:04:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67D11F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 21:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D11F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Th/LD79c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574885079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFJCkrBhizBy//kJU6fvc/W0JfuErypqmiPk8bX3qX0=;
 b=Th/LD79c7Yqg0RCPmKo/TK5+BS9e6Ua5WP9obNNixWBKaYHPos4srJXPNaE8r3ggSwWFAW
 7RX1kywC83B5sp5EBgtOZ9IalGeRXf2ZoxxtVUPLVwLo9eqclMbxGCn2RXhuhXZWUncRcE
 JXqyJPqSO2z45/zi100TUQ8TT2qPsqU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-haDzKFq9P_-NVqM3NMaE6g-1; Wed, 27 Nov 2019 15:04:37 -0500
Received: by mail-wm1-f69.google.com with SMTP id p2so660446wma.3
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p6dqP0YZbaYRZgqhQRZg5pNpfBBSzXzTDkH3aUPs9Sc=;
 b=V286MqkWNZvxxtOW5BeaSVAtTmgauNpzQwMDg2tDimhfrLqAsbSKMClvRhaFqbTA4w
 twpBilFM/ni4lRHptzQpYIFkNwkF/j+LAmsFi8wKaHzDJuXJzrL3htoKbaQJ22OcS7wT
 ZlSO8liLETZYLbFx5K3PAl4UjgK/hXVjHn6/ySuKDs6vn+xpfZk8d0yVqA25JgQBHl43
 QQn4qVCWlbMFwy9qyZ8+BEH+SpuMv3iMUoqQmuHPwU6QadLHELZ2lBgQmcWwqp3MlAUK
 I8nwg6UI2W6nQq9kEqtNle7i68fncyv6mYqeonUWcsyAuIrh1nmG08GkaPtquJrGcHE+
 KS6g==
X-Gm-Message-State: APjAAAVz58srR82gi88FUTS/4+/e5OIH08Ng5HxIK1NfbTsK4fy4YGPR
 3Ek2+QmLE0k/5N2R9PKze38SPkFckvElRWAYh2jmrG7bV6z44A0xfzrF9gkbeN5DgiSCNgshID7
 ySHO4jncMj5HimkCRoQcjx9U=
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr5713337wml.99.1574885074050;
 Wed, 27 Nov 2019 12:04:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyyOa1EXicL8iOjs8424sdsN8WhL7uoumvHYuIaS1+eLPDSFa7SPEAeBnfiPSNR+2l/jsG0g==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr5713313wml.99.1574885073679;
 Wed, 27 Nov 2019 12:04:33 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id o10sm7924053wmc.42.2019.11.27.12.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 12:04:33 -0800 (PST)
To: =?UTF-8?Q?Micha=c5=82_Matysiak?= <matysiakmichal@gmail.com>
References: <s5hd0ddwfhg.wl-tiwai@suse.de>
 <8c22afa4-10ca-efc7-5a8c-b927a27959d6@redhat.com>
 <s5hzhghuxbj.wl-tiwai@suse.de> <s5hlfs1uue6.wl-tiwai@suse.de>
 <20191127185237.GA7486@prime> <s5h8so1m8am.wl-tiwai@suse.de>
 <s5h4kypm867.wl-tiwai@suse.de>
 <81af92d6-a7ad-b947-1265-e3d3f7c43b4a@redhat.com>
 <s5h1rttm7k6.wl-tiwai@suse.de>
 <a3f7aedb-4467-2b37-c8f3-f2f6b4fafbf8@redhat.com>
 <20191127200041.GA4972@prime>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <65f66b84-7758-6374-76ad-b0d6d803fcd9@redhat.com>
Date: Wed, 27 Nov 2019 21:04:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191127200041.GA4972@prime>
Content-Language: en-US
X-MC-Unique: haDzKFq9P_-NVqM3NMaE6g-1
X-Mimecast-Spam-Score: 0
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
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

SGksCgpPbiAyNy0xMS0yMDE5IDIxOjAwLCBNaWNoYcWCIE1hdHlzaWFrIHdyb3RlOgo+IE9uIFdl
ZCwgTm92IDI3LCAyMDE5IGF0IDA4OjQ2OjM2UE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6
Cj4+IEhpLAo+Pgo+PiBPbiAyNy0xMS0yMDE5IDIwOjQwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+
PiBPbiBXZWQsIDI3IE5vdiAyMDE5IDIwOjMxOjIwICswMTAwLAo+Pj4gSGFucyBkZSBHb2VkZSB3
cm90ZToKPj4+Pgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gMjctMTEtMjAxOSAyMDoyNywgVGFrYXNo
aSBJd2FpIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIDI3IE5vdiAyMDE5IDIwOjI0OjQ5ICswMTAwLAo+
Pj4+PiBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gV2VkLCAyNyBOb3YgMjAx
OSAxOTo1MjozNyArMDEwMCwKPj4+Pj4+IE1pY2hhxYIgTWF0eXNpYWsgd3JvdGU6Cj4+Pj4+Pj4K
Pj4+Pj4+PiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCAwNjowMDoxN1BNICswMTAwLCBUYWthc2hp
IEl3YWkgd3JvdGU6Cj4+Pj4+Pj4+IE9uIFdlZCwgMjcgTm92IDIwMTkgMTY6NTc6MDQgKzAxMDAs
Cj4+Pj4+Pj4+IFRha2FzaGkgSXdhaSB3cm90ZToKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBPbiBXZWQs
IDI3IE5vdiAyMDE5IDE2OjQ2OjAwICswMTAwLAo+Pj4+Pj4+Pj4gSGFucyBkZSBHb2VkZSB3cm90
ZToKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEhpIFRha2FzaGksCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
PiBPbiAyNy0xMS0yMDE5IDE1OjM5LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+Pj4+Pj4+Pj4+IE9u
IFdlZCwgMjcgTm92IDIwMTkgMTU6MjY6MzcgKzAxMDAsCj4+Pj4+Pj4+Pj4+IE1pY2hhxYIgTWF0
eXNpYWsgd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gSGkKPj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+PiBSZWNlbnRseSBJJ3ZlIGVuY291bnRlcmVkIHRoaXMgZXJyb3IgYW5kIGFzIEhh
bnMgZGUgR29lZGUncyByZXF1ZXN0IEknbQo+Pj4+Pj4+Pj4+Pj4gcmVwb3J0aW5nIHRoaXMgYmFj
ayB0byB5b3UuIFRoaXMgaGFwcGVucyB3aGlsZSBib290aW5nIG15IGxhcHRvcAo+Pj4+Pj4+Pj4+
Pj4gY29ubmVjdGVkIHRvIGRvY2tpbmcgc3RhdGlvbiBhbmQgd2l0aG91dCB1c2luZyBvbmUuCj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4ga2VybmVsOiBXQVJOSU5HOiBDUFU6IDEgUElEOiAzMzAg
YXQgc291bmQvaGRhL2hkYWNfY29tcG9uZW50LmM6MjkwIHNuZF9oZGFjX2Fjb21wX2luaXQrMHhk
ZS8weDEzMCBbc25kX2hkYV9jb3JlXQo+Pj4+Pj4+Pj4+Pj4gVGhlcmUgYXJlIDIgbW9yZSAiY3V0
IGhlcmUiLCBidXQgdGhleSdyZSBhbG1vc3QgaWRlbnRpY2FsIHNvIEkndmUgb25seQo+Pj4+Pj4+
Pj4+Pj4gaW5jbHVkZWQgb25lIGluIHRoaXMgZW1haWwuCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4gRG9uJ3Qga25vdyB3aGF0IHdpbGwgYmUgdmFsdWFibGUgdG8geW91LCBidXQgSSdtIHdpbGxp
bmcgdG8gaGVscCB0ZXN0Cj4+Pj4+Pj4+Pj4+PiB0aGlzIGFuZCBkbyB3aGF0IEknbSB0b2xkLiBT
bywgaG93IGNhbiBJIGhlbHA/Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gTW9yZSBpbmZvIGFi
b3V0IHRoaXMgcGFydGljdWxhciBrZXJuZWwgYW5kIGlzc3VlLCB0aGF0IGxlZCB0byB0aGlzIGlz
IGF0Ogo+Pj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNn
aT9pZD0xNzU3ODkxCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gZG1lc2cgb3V0cHV0Ogo+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IG1pY3JvY29kZTog
bWljcm9jb2RlIHVwZGF0ZWQgZWFybHkgdG8gcmV2aXNpb24gMHgyZiwgZGF0ZSA9IDIwMTktMDIt
MTcKPj4+Pj4+Pj4+Pj4+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IExpbnV4IHZlcnNpb24gNS40
LjAtMC5yYzguZ2l0MC4xLnJoYnoxNzU3ODkxLmZjMzEueDg2XzY0IChtb2NrYnVpbGRAYnVpbGRo
dy0xMC5waHgyLmZlZG9yYXByb2plY3Qub3JnKSAoZ2NjIHZlcnNpb24gOS4yLjEgMjAxOTA4Mjcg
KFJlZCBIYXQgOS4yLjEtMSkgKEdDQykpICMxIFNNUCBXZWQgTm92IDIwIDE0OjUwOjM0IFVUQyAy
MDE5Cj4+Pj4+Pj4+Pj4+PiBOb3YgMjYgMTg6MDU6NDUga2VybmVsOiBDb21tYW5kIGxpbmU6IEJP
T1RfSU1BR0U9KGhkMCxncHQyKS92bWxpbnV6LTUuNC4wLTAucmM4LmdpdDAuMS5yaGJ6MTc1Nzg5
MS5mYzMxLng4Nl82NCByb290PS9kZXYvbWFwcGVyL2ZlZG9yYS1yb290IHJvIHJlc3VtZT0vZGV2
L21hcHBlci9mZWRvcmEtc3dhcCByZC5sdm0ubHY9ZmVkb3JhL3Jvb3QgcmQubHVrcy51dWlkPWx1
a3MtZWZkOGI0MzgtOGY1Ni00MDVhLThjZWEtODhmODNjYTM4ZDJiIHJkLmx2bS5sdj1mZWRvcmEv
c3dhcCByaGdiIHF1aWV0Cj4+Pj4+Pj4+Pj4+PiAuLi4KPj4+Pj4+Pj4+Pj4+IC4uLgo+Pj4+Pj4+
Pj4+Pj4gLi4uCj4+Pj4+Pj4+Pj4+PiBOb3YgMjYgMTg6MDY6MTYga2VybmVsOiAtLS0tLS0tLS0t
LS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+Pj4+Pj4+Pj4+IE5vdiAyNiAxODowNjoxNiBr
ZXJuZWw6IFdBUk5JTkc6IENQVTogMCBQSUQ6IDQ2MSBhdCBzb3VuZC9oZGEvaGRhY19jb21wb25l
bnQuYzoyOTAgc25kX2hkYWNfYWNvbXBfaW5pdCsweGRlLzB4MTMwIFtzbmRfaGRhX2NvcmVdCj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFRoaXMgc2hvdWxkIGhhdmUgYmVlbiBhbHJlYWR5IGZpeGVk
IGJ5IHRoZSByZWNlbnQgY29tbWl0Cj4+Pj4+Pj4+Pj4+IDVhODU4ZTc5YzkxMTMzMDY3OGI1YTli
ZTkxYTI0ODMwZTk0YTBkYzkKPj4+Pj4+Pj4+Pj4gICAgICAgICBBTFNBOiBoZGEgLSBEaXNhYmxl
IGF1ZGlvIGNvbXBvbmVudCBmb3IgbGVnYWN5IE52aWRpYSBIRE1JIGNvZGVjcwo+Pj4+Pj4+Pj4+
PiB3aGljaCBpcyBhbHJlYWR5IGluY2x1ZGVkIGluIExpbnVzIHRyZWUuICBQbGVhc2UgY2hlY2sg
aXQuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBUaGFua3MsIEkndmUgc3RhcnRlZCBhIHNjcmF0Y2gg
a2VybmVsIGJ1aWxkIHdpdGggdGhlIHJlbGV2YW50IHBhdGNoZXMgYWRkZWQsCj4+Pj4+Pj4+Pj4g
Zm9yIHRoZSBGZWRvcmEgdXNlcnMgaGl0dGluZyB0aGlzIHRvIHRlc3QuCj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+PiBUaGUgcmVhc29uIHRoZXkgc3RhcnRlZCBsb29raW5nIGludG8gdGhlaXIgZG1lc2cg
aXMgdGhhdCB0aGVpciBudmlkaWEgR1BVIChoeWJyaWQgZ2Z4IHNldHVwKQo+Pj4+Pj4+Pj4+IHdp
bGwgbm8gbG9uZ2VyIHN1c3BlbmQgd2l0aCByZWNlbnQga2VybmVscywgdGhpcyBpcyB3aXRoIGEg
NS40IGtlcm5lbCB3aGljaCBhbHJlYWR5IGhhcyB0aGUKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+ICJB
TFNBOiBoZGEgLSBGb3JjZSBydW50aW1lIFBNIG9uIE52aWRpYSBIRE1JIGNvZGVjcyIKPj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+IEZpeCBhbmQgZm9yIGdvb2QgbWVhc3VyZSBJJ3ZlIGFscmVhZHkgZ2l2
ZW4gdGhlbSBhIHRlc3Qga2VybmVsIHdpdGggdGhlOgo+Pj4+Pj4+Pj4+ICJBTFNBOiBoZGE6IEFs
bG93IEhEQSB0byBiZSBydW50aW1lIHN1c3BlbmRlZCB3aGVuIGRHUFUgaXMgbm90IGJvdW5kIHRv
IGEgZHJpdmUiCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBwYXRjaCBhZGRlZC4gQnV0IGxvb2tpbmcg
YXQgdGhlIGZpeCBmb3IgdGhlIG9vcHMgSSdtIG5vdCBzdXJlIGlmIGZpeGluZwo+Pj4+Pj4+Pj4+
IHRoZSBvb3BzIGlzIGFsc28gZ29pbmcgdG8gZml4IHRoZSBpc3N1ZSB3aXRoIHRoZSBkR1BVIG5v
IGxvbmdlciBzdXNwZW5kaW5nPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEkgZ3Vlc3MgaXQncyBpcnJl
bGV2YW50IHdpdGggdGhhdCBwcm9ibGVtLCBhcyB0aGlzIGtlcm5lbCB3YXJuaW5nIChub3QKPj4+
Pj4+Pj4+IHJlYWxseSBhbiBPb3BzKSBpcyBqdXN0IGFib3V0IHNraXBwaW5nIHRoZSBtdWx0aXBs
ZSBhdWRpbyBjb21wb25lbnQKPj4+Pj4+Pj4+IHJlZ2lzdHJhdGlvbi4gIEFuZCB0aGUgYXVkaW8g
Y29tcG9uZW50IGlzbid0IHVzZWQgaW4gbm91dmVhdSBzaWRlIG9uCj4+Pj4+Pj4+PiA1LjQueCBh
dCBhbGwsIGFuZCBpdCdzIGp1c3QgYSBwbGFjZWhvbGRlci4gIEJ1dCB3aG8ga25vd3MgdGhlIGJs
YWNrCj4+Pj4+Pj4+PiBtYWdpYyBiZWhpbmQgdGhlIHNjZW5lIDopCj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IC4uLiBhbmQgaWYgdGhpcyBzdGlsbCBkb2Vzbid0IGZpeCB0aGUgcHJvYmxlbSwgcGxlYXNlIGNo
ZWNrIHRoZQo+Pj4+Pj4+PiBydW50aW1lIFBNIHN0YXRlIG9mIGFsbCBIRC1hdWRpbyBjb2RlYyBk
ZXZpY2VzIGFuZCBIRC1hdWRpbyBjb250cm9sbGVyCj4+Pj4+Pj4+IGRldmljZS4gIERvIGFsbCBz
aG93IHRoZSBydW50aW1lLXN1c3BlbmRlZCBidXQgdGhlIHBvd2VyIGNvbnN1bXB0aW9uCj4+Pj4+
Pj4+IGlzIGhpZ2g/ICBPciBpcyBzb21lIGRldmljZSBibG9ja2VkPwo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBCYXNpY2FsbHkgdGhlIGF1ZGlvIGNvbnRyb2xsZXIgY29ycmVzcG9uZGluZyB0byB0aGUgZEdQ
VSBzaG91bGQgaGF2ZQo+Pj4+Pj4+PiBjaGlwLT5idXMua2VlcF9wb3dlciA9IDAsIHdoaWNoIGFs
bG93cyB0aGUgcnVudGltZSBQTS4gIFRoaXMgZmxhZyBpcwo+Pj4+Pj4+PiBjbGVhcmVkIGF0IGF6
eF92eF9ncHVfYm91bmQoKSBvbmx5IGZvciB0aGUgZEdQVS4gIEZvciB0aGUgcHJpbWFyeSBHUFUs
Cj4+Pj4+Pj4+IHdlIG5lZWQgdG8ga2VlcCB0aGUgbGluayBwb3dlciB1bmxlc3MgdGhlIG5vdGlm
aWNhdGlvbiBpcyBkb25lIHZpYSB0aGUKPj4+Pj4+Pj4gYXVkaW8gY29tcG9uZW50IChsaWtlIGk5
MTUgb3IgYW1kZ3B1KS4gIEkgYWxyZWFkeSBzdWJtaXR0ZWQgYSBwYXRjaCB0bwo+Pj4+Pj4+PiBl
bmFibGUgdGhlIGF1ZGlvIGNvbXBvbmVudCBmb3Igbm91dmVhdSBpbiB0aGUgcGFzdCwgYnV0IGl0
J3MgaWdub3JlZCwKPj4+Pj4+Pj4gc28gZmFyLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiB0
aGFua3MsCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRha2FzaGkKPj4+Pj4+Pgo+Pj4+Pj4+IEhpIFRha2Fz
aGkKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIGxpbnV4LW5leHQtMjAxOTExMjcgd2FybmluZyBpbmRlZWQg
ZGlzYXBwZWFyZWQuIFRoYW5rcyEKPj4+Pj4+Pgo+Pj4+Pj4+IFJlc3Qgb2YgcHJvYmxlbXMgZGlk
IG5vdC4gVGhpcyBpcyBteSBvdXRwdXQgZnJvbSBhbHNhLWluZm8uc2gKPj4+Pj4+PiBodHRwOi8v
YWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj05MWJiNzg5YTAxZjllZWQ5MmQwNTM0ZmU4OTUxNjE5MzEy
YjM1NWRhCj4+Pj4+Pj4gRG9uJ3Qga25vdyBpZiBpdCdzIGhlbHBmdWwsIHNvIEknbGwgbGVhdmUg
aXQgaGVyZS4gUG93ZXIgY29uc3VtcHRpb24gaXMKPj4+Pj4+PiBoaWdoLCBiZWNhdXNlIHJ1bnRp
bWUtc3VzcGVuZGVkIGlzIG5vdCBlbmFibGVkL2FjdGl2ZSAoYW5kIGNhbm5vdCBiZQo+Pj4+Pj4+
IGZvcmNlZCkgd2l0aG91dCByZW1vdmluZyBudmlkaWEncyBhdWRpby4KPj4+Pj4+Cj4+Pj4+PiBX
aGF0IGlmIHlvdSBwYXNzIHBvd2VyX3NhdmU9MSB0byBzbmQtaGRhLWludGVsIG9wdGlvbj8KPj4+
Pj4+Cj4+Pj4+PiAgICAgIGVjaG8gLW4gMSA+IC9zeXMvbW9kdWxlL3NuZF9oZGFfaW50ZWwvcGFy
YW1ldGVycy9wb3dlcl9zYXZlCj4+Pj4+Cj4+Pj4+IGFuZCB0aGUgZm9sbG93aW5nLCB0b286Cj4+
Pj4+ICAgICAgICBlY2hvIC1uIDEgPiAvc3lzL21vZHVsZS9zbmRfaGRhX2ludGVsL3BhcmFtZXRl
cnMvcG93ZXJfc2F2ZV9jb250cm9sbGVyCj4+Pj4+Cj4+Pj4+IE90aGVyd2lzZSB0aGUgY29udHJv
bGxlciBkZXZpY2Ugd2lsbCBrZWVwIG9uLgo+Pj4+Cj4+Pj4gVGhhbmsgeW91IGZvciBoZWxwaW5n
IHVzIGdldHRpbmcgdG8gdGhlIHJvb3Qgb2YgdGhpcy4KPj4+Pgo+Pj4+IFRoZXNlIGJvdGggZGVm
YXVsdCB0byAxIHJlc3AuIFkgb24gRmVkb3JhIGtlcm5lbHMsIHNvIEkgZG8gbm90IHRoaW5rCj4+
Pj4gdGhhdCB0aGlzIHdpbGwgaGVscCwgYXMgdGhleSBhcmUgYm90aCBhbHJlYWR5IDEvWS4KPj4+
Cj4+PiBXZWxsLCB0aGUgYWxzYS1pbmZvLnNoIG91dHB1dCBNaWNoYWwgc3VnZ2VzdGVkIHNob3dz
IGRpZmZlcmVudGx5Ogo+Pj4gICAgIGh0dHA6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPTkxYmI3
ODlhMDFmOWVlZDkyZDA1MzRmZTg5NTE2MTkzMTJiMzU1ZGEKPj4+Cj4+PiAgICAgISFMb2FkZWQg
c291bmQgbW9kdWxlIG9wdGlvbnMKPj4+ICAgICAhIS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+Pj4gICAgIC4uLi4KPj4+ICAgICBwb3dlcl9zYXZlIDogMAo+Pj4gICAgIHBvd2VyX3NhdmVf
Y29udHJvbGxlciA6IE4KPj4+Cj4+PiBJZiB0aGVzZSB2YWx1ZXMgYXJlIHRydWUsIG1heWJlIHNv
bWUgZGVza3RvcCB0dW5pbmcgbW9kaWZpZXMgb24gdGhlCj4+PiBmbHk/Cj4+Cj4+IE9oLCB0aGF0
IG1pZ2h0IGV4cGxhaW4gd2h5IHRoZSBmaXhlcyBmb3IgdGhpcyBhcmUgY29uZmlybWVkIGFzIHdv
cmtpbmcgYnkKPj4gc29tZSBvZiBvdXIgdXNlcnMsIGJ1dCBub3QgYnkgYWxsLgo+Pgo+PiBNaWNo
YWwsIGFyZSB5b3UgcGVyaGFwcyB1c2luZyBUTFAgb3Igc29tZSBzaW1pbGFyIHNvZnR3YXJlIHRv
IHR1bmUgLwo+PiBpbXByb3ZlIHBvd2VyLW1hbmFnZW1lbnQgc2V0dGluZ3MgPyAgT3IgZG8geW91
IHBlcmhhcHMgaGF2ZSBzb21lCj4+IGN1c3RvbSBmaWxlcyB1bmRlciAvZXRjL21vZHByb2JlLmNv
bmYuZCBtZXNzaW5nIHdpdGggdGhlc2Ugc2V0dGluZ3M/Cj4+Cj4+IFJlZ2FyZHMsCj4+Cj4+IEhh
bnMKPj4KPiAKPiBPSy4gU28gdGhhdCBleHBsYWlucyBldmVyeXRoaW5nLCBpdCdzIHdvcmtpbmcg
YXMgaW50ZW5kZWQgd2l0aCB0bHAKPiBkaXNhYmxlZC4gSSdtIHVzaW5nIHRscCBhbmQgSSBhc3N1
bWVkLCB0aGF0IGlmIG15IHRscCdzIGNvbmZpZ3VyYXRpb24KPiB3YXMgd29ya2luZyBiZWZvcmUs
IGl0IHNob3VsZCB3b3JrIG5vdy4gRXNwZWNpYWxseSB3aGVuIEkndmUgY2hlY2tlZAo+IGxpdmUg
aXNvcyBhbmQgd2FzIGJyb2tlbiBpbiBleGFjdGx5IHNhbWUgd2F5LiBDbGVhcmx5IEkgd2FzIHdy
b25nLgoKUmlnaHQsIHNvIG9sZGVyIGtlcm5lbHMgZGlkIG5vdCBoYXZlIHN1cHBvcnQgZm9yIGF1
ZGlvIG92ZXIgSERNSS9EUApmb3IgbnZpZGlhIEdQVXMgc28gdGhlIGF1ZGlvIHBhcnQgb2YgdGhl
IEdQVSBkaWQgbm90IGhhdmUgYSBkcml2ZXIKYXR0YWNoZWQuIEluIG5ld2VyIGtlcm5lbHMgdGhl
cmUgaXMgYSBkcml2ZXIgYXR0YWNoZWQsIHNvIG5vdyB0aGUKcG93ZXItbWFuYWdlbWVudCBzZXR0
aW5ncyBvZiB0aGUgaGRhIGRyaXZlciBtYXR0ZXIgZm9yIGFsbG93aW5nIHRoZQpkR1BVIHRvIHN1
c3BlbmQuCgo+IEJJRyBUSEFOSyBZT1UhCgpZb3UncmUgd2VsY29tZS4gTm90ZSB0aGF0IHlvdSBz
aG91bGQgbm90IG5lZWQgVExQIGFueW1vcmUgc2luY2UKRmVkb3JhIDI5LCBhbGwgd29ydGh3aGls
ZSBwb3dlciBzYXZpbmdzIGFyZSBlbmFibGVkIGJ5IGRlZmF1bHQsCmluY2x1ZGluZyB0aGUgSERB
IHBvd2VyIHNhdmluZyBzZXR0aW5ncy4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
