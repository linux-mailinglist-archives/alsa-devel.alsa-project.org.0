Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EE10B62C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 19:54:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0358F16E3;
	Wed, 27 Nov 2019 19:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0358F16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574880871;
	bh=S6rYIa0W9djUkcFdG2NcZptMFZxN7Jh4YIITqEgmBP4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=je5PxVwl4LeAxTNySNnYmHx9CrXSGYMMCe82d0JlYW53GSgT+lOPfnX8anf/PHLO/
	 SDvGcDCudMfjA7agBZY4ElK4e+VFvedjTaVGYRauRprjA76uNO4qJtpIIcqLSewSL+
	 +a1ccq1kmGRWKhu/sBVicrbXNRQYFTzI68RJtwjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44918F80109;
	Wed, 27 Nov 2019 19:52:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7554FF8014D; Wed, 27 Nov 2019 19:52:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5107F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 19:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5107F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fYj+vaHo"
Received: by mail-lf1-x142.google.com with SMTP id m30so16166082lfp.8
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VQB5xOl6PUhSSXjIIKLgulble9hz5f4Kdt2ZdPl5E5s=;
 b=fYj+vaHo195/TX+W6dM1du6nmYqbdHrNqtE+yrMCtygS0gQe9omdchlGMTZ3IK8cSS
 6ozgI4w1DHt5aOENwspQaYSmU03YJAb+tYInf4ddqm9YXfrJquV4MF9Mr3d4uWoxfwyZ
 VNbc6g8HdrRRE19B+DkitedVqdahTLCqan9ps8zjlBmx/PDyK0DfGyMxmEKEqY+y0jQs
 kolIX1Ow332DiRwT+hxp0Z8jpYCjqx5/dpX9t679Gq6gVGgUIrot5tuC3wKiI/Lr2kvY
 h/jOAuiMseCffG9D3HS307axgqDpbkiYISDiG1V+ct76Z4Dig2np9QFKQ/FQwAUbr3/G
 Vkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VQB5xOl6PUhSSXjIIKLgulble9hz5f4Kdt2ZdPl5E5s=;
 b=lsOJOuyzLDke90WpxXouyxeDN/TqviwWtjUvAXkR4WOAQbb7cUpXacho1eculLYIIV
 KRAsE7Y7rc3MZzz2EsXGMMF0u/zjMvAuJ4zO9WkeCwcncjiq1q/Gms/Mz82qa+gUWD3K
 I43PQI6vZRTKHVzPtfdg4F9P6pgNP6Tlb7JFwJ0dF1N6GqKPUGTHsBonmk9FLhta347Y
 yPaUhGQtDa6MWTMRSXp1bxW4quF8SjJmj+QG0bUmzfPUiFmI2f5Uh/xd41Jrom006cBp
 YGqWFe/VbUCkeIpGuARc0cnMB8wTF+MHYqU8D3lhD2mClbN3kyCXy11n4KjXLQi9guQj
 yK2Q==
X-Gm-Message-State: APjAAAU7baRhNHcMfX9hHMRapx82SJlFdsdWAp0Nt93tTKK9QQW2AqnZ
 wt9N/MUl68E9efKik4jpJ7c=
X-Google-Smtp-Source: APXvYqw2wE4GlLAyoNQ0GjWCIULDVaUeZ24oBaMaA72cGFojO9FAUOKTKjO5y8n4C5+7AolIdKpkPQ==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr19730210lfk.67.1574880760084; 
 Wed, 27 Nov 2019 10:52:40 -0800 (PST)
Received: from prime (host-178-216-91-25.sta.tvknaszapraca.pl. [178.216.91.25])
 by smtp.gmail.com with ESMTPSA id w71sm8559515lff.0.2019.11.27.10.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:52:39 -0800 (PST)
Date: Wed, 27 Nov 2019 19:52:37 +0100
From: =?utf-8?Q?Micha=C5=82?= Matysiak <matysiakmichal@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191127185237.GA7486@prime>
References: <20191127142637.GB33700@prime> <s5hd0ddwfhg.wl-tiwai@suse.de>
 <8c22afa4-10ca-efc7-5a8c-b927a27959d6@redhat.com>
 <s5hzhghuxbj.wl-tiwai@suse.de> <s5hlfs1uue6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hlfs1uue6.wl-tiwai@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6MDA6MTdQTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IE9uIFdlZCwgMjcgTm92IDIwMTkgMTY6NTc6MDQgKzAxMDAsCj4gVGFrYXNoaSBJd2Fp
IHdyb3RlOgo+ID4gCj4gPiBPbiBXZWQsIDI3IE5vdiAyMDE5IDE2OjQ2OjAwICswMTAwLAo+ID4g
SGFucyBkZSBHb2VkZSB3cm90ZToKPiA+ID4gCj4gPiA+IEhpIFRha2FzaGksCj4gPiA+IAo+ID4g
PiBPbiAyNy0xMS0yMDE5IDE1OjM5LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gPiA+ID4gT24gV2Vk
LCAyNyBOb3YgMjAxOSAxNToyNjozNyArMDEwMCwKPiA+ID4gPiBNaWNoYcWCIE1hdHlzaWFrIHdy
b3RlOgo+ID4gPiA+Pgo+ID4gPiA+PiBIaQo+ID4gPiA+Pgo+ID4gPiA+PiBSZWNlbnRseSBJJ3Zl
IGVuY291bnRlcmVkIHRoaXMgZXJyb3IgYW5kIGFzIEhhbnMgZGUgR29lZGUncyByZXF1ZXN0IEkn
bQo+ID4gPiA+PiByZXBvcnRpbmcgdGhpcyBiYWNrIHRvIHlvdS4gVGhpcyBoYXBwZW5zIHdoaWxl
IGJvb3RpbmcgbXkgbGFwdG9wCj4gPiA+ID4+IGNvbm5lY3RlZCB0byBkb2NraW5nIHN0YXRpb24g
YW5kIHdpdGhvdXQgdXNpbmcgb25lLgo+ID4gPiA+Pgo+ID4gPiA+PiBrZXJuZWw6IFdBUk5JTkc6
IENQVTogMSBQSUQ6IDMzMCBhdCBzb3VuZC9oZGEvaGRhY19jb21wb25lbnQuYzoyOTAgc25kX2hk
YWNfYWNvbXBfaW5pdCsweGRlLzB4MTMwIFtzbmRfaGRhX2NvcmVdCj4gPiA+ID4+IFRoZXJlIGFy
ZSAyIG1vcmUgImN1dCBoZXJlIiwgYnV0IHRoZXkncmUgYWxtb3N0IGlkZW50aWNhbCBzbyBJJ3Zl
IG9ubHkKPiA+ID4gPj4gaW5jbHVkZWQgb25lIGluIHRoaXMgZW1haWwuCj4gPiA+ID4+Cj4gPiA+
ID4+IERvbid0IGtub3cgd2hhdCB3aWxsIGJlIHZhbHVhYmxlIHRvIHlvdSwgYnV0IEknbSB3aWxs
aW5nIHRvIGhlbHAgdGVzdAo+ID4gPiA+PiB0aGlzIGFuZCBkbyB3aGF0IEknbSB0b2xkLiBTbywg
aG93IGNhbiBJIGhlbHA/Cj4gPiA+ID4+Cj4gPiA+ID4+IE1vcmUgaW5mbyBhYm91dCB0aGlzIHBh
cnRpY3VsYXIga2VybmVsIGFuZCBpc3N1ZSwgdGhhdCBsZWQgdG8gdGhpcyBpcyBhdDoKPiA+ID4g
Pj4gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNzU3ODkxCj4g
PiA+ID4+Cj4gPiA+ID4+IGRtZXNnIG91dHB1dDoKPiA+ID4gPj4KPiA+ID4gPj4gTm92IDI2IDE4
OjA1OjQ1IGtlcm5lbDogbWljcm9jb2RlOiBtaWNyb2NvZGUgdXBkYXRlZCBlYXJseSB0byByZXZp
c2lvbiAweDJmLCBkYXRlID0gMjAxOS0wMi0xNwo+ID4gPiA+PiBOb3YgMjYgMTg6MDU6NDUga2Vy
bmVsOiBMaW51eCB2ZXJzaW9uIDUuNC4wLTAucmM4LmdpdDAuMS5yaGJ6MTc1Nzg5MS5mYzMxLng4
Nl82NCAobW9ja2J1aWxkQGJ1aWxkaHctMTAucGh4Mi5mZWRvcmFwcm9qZWN0Lm9yZykgKGdjYyB2
ZXJzaW9uIDkuMi4xIDIwMTkwODI3IChSZWQgSGF0IDkuMi4xLTEpIChHQ0MpKSAjMSBTTVAgV2Vk
IE5vdiAyMCAxNDo1MDozNCBVVEMgMjAxOQo+ID4gPiA+PiBOb3YgMjYgMTg6MDU6NDUga2VybmVs
OiBDb21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9KGhkMCxncHQyKS92bWxpbnV6LTUuNC4wLTAucmM4
LmdpdDAuMS5yaGJ6MTc1Nzg5MS5mYzMxLng4Nl82NCByb290PS9kZXYvbWFwcGVyL2ZlZG9yYS1y
b290IHJvIHJlc3VtZT0vZGV2L21hcHBlci9mZWRvcmEtc3dhcCByZC5sdm0ubHY9ZmVkb3JhL3Jv
b3QgcmQubHVrcy51dWlkPWx1a3MtZWZkOGI0MzgtOGY1Ni00MDVhLThjZWEtODhmODNjYTM4ZDJi
IHJkLmx2bS5sdj1mZWRvcmEvc3dhcCByaGdiIHF1aWV0Cj4gPiA+ID4+IC4uLgo+ID4gPiA+PiAu
Li4KPiA+ID4gPj4gLi4uCj4gPiA+ID4+IE5vdiAyNiAxODowNjoxNiBrZXJuZWw6IC0tLS0tLS0t
LS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4gPiA+PiBOb3YgMjYgMTg6MDY6MTYga2Vy
bmVsOiBXQVJOSU5HOiBDUFU6IDAgUElEOiA0NjEgYXQgc291bmQvaGRhL2hkYWNfY29tcG9uZW50
LmM6MjkwIHNuZF9oZGFjX2Fjb21wX2luaXQrMHhkZS8weDEzMCBbc25kX2hkYV9jb3JlXQo+ID4g
PiA+Cj4gPiA+ID4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIGFscmVhZHkgZml4ZWQgYnkgdGhlIHJl
Y2VudCBjb21taXQKPiA+ID4gPiA1YTg1OGU3OWM5MTEzMzA2NzhiNWE5YmU5MWEyNDgzMGU5NGEw
ZGM5Cj4gPiA+ID4gICAgICBBTFNBOiBoZGEgLSBEaXNhYmxlIGF1ZGlvIGNvbXBvbmVudCBmb3Ig
bGVnYWN5IE52aWRpYSBIRE1JIGNvZGVjcwo+ID4gPiA+IHdoaWNoIGlzIGFscmVhZHkgaW5jbHVk
ZWQgaW4gTGludXMgdHJlZS4gIFBsZWFzZSBjaGVjayBpdC4KPiA+ID4gCj4gPiA+IFRoYW5rcywg
SSd2ZSBzdGFydGVkIGEgc2NyYXRjaCBrZXJuZWwgYnVpbGQgd2l0aCB0aGUgcmVsZXZhbnQgcGF0
Y2hlcyBhZGRlZCwKPiA+ID4gZm9yIHRoZSBGZWRvcmEgdXNlcnMgaGl0dGluZyB0aGlzIHRvIHRl
c3QuCj4gPiA+IAo+ID4gPiBUaGUgcmVhc29uIHRoZXkgc3RhcnRlZCBsb29raW5nIGludG8gdGhl
aXIgZG1lc2cgaXMgdGhhdCB0aGVpciBudmlkaWEgR1BVIChoeWJyaWQgZ2Z4IHNldHVwKQo+ID4g
PiB3aWxsIG5vIGxvbmdlciBzdXNwZW5kIHdpdGggcmVjZW50IGtlcm5lbHMsIHRoaXMgaXMgd2l0
aCBhIDUuNCBrZXJuZWwgd2hpY2ggYWxyZWFkeSBoYXMgdGhlCj4gPiA+IAo+ID4gPiAiQUxTQTog
aGRhIC0gRm9yY2UgcnVudGltZSBQTSBvbiBOdmlkaWEgSERNSSBjb2RlY3MiCj4gPiA+IAo+ID4g
PiBGaXggYW5kIGZvciBnb29kIG1lYXN1cmUgSSd2ZSBhbHJlYWR5IGdpdmVuIHRoZW0gYSB0ZXN0
IGtlcm5lbCB3aXRoIHRoZToKPiA+ID4gIkFMU0E6IGhkYTogQWxsb3cgSERBIHRvIGJlIHJ1bnRp
bWUgc3VzcGVuZGVkIHdoZW4gZEdQVSBpcyBub3QgYm91bmQgdG8gYSBkcml2ZSIKPiA+ID4gCj4g
PiA+IHBhdGNoIGFkZGVkLiBCdXQgbG9va2luZyBhdCB0aGUgZml4IGZvciB0aGUgb29wcyBJJ20g
bm90IHN1cmUgaWYgZml4aW5nCj4gPiA+IHRoZSBvb3BzIGlzIGFsc28gZ29pbmcgdG8gZml4IHRo
ZSBpc3N1ZSB3aXRoIHRoZSBkR1BVIG5vIGxvbmdlciBzdXNwZW5kaW5nPwo+ID4gCj4gPiBJIGd1
ZXNzIGl0J3MgaXJyZWxldmFudCB3aXRoIHRoYXQgcHJvYmxlbSwgYXMgdGhpcyBrZXJuZWwgd2Fy
bmluZyAobm90Cj4gPiByZWFsbHkgYW4gT29wcykgaXMganVzdCBhYm91dCBza2lwcGluZyB0aGUg
bXVsdGlwbGUgYXVkaW8gY29tcG9uZW50Cj4gPiByZWdpc3RyYXRpb24uICBBbmQgdGhlIGF1ZGlv
IGNvbXBvbmVudCBpc24ndCB1c2VkIGluIG5vdXZlYXUgc2lkZSBvbgo+ID4gNS40LnggYXQgYWxs
LCBhbmQgaXQncyBqdXN0IGEgcGxhY2Vob2xkZXIuICBCdXQgd2hvIGtub3dzIHRoZSBibGFjawo+
ID4gbWFnaWMgYmVoaW5kIHRoZSBzY2VuZSA6KQo+IAo+IC4uLiBhbmQgaWYgdGhpcyBzdGlsbCBk
b2Vzbid0IGZpeCB0aGUgcHJvYmxlbSwgcGxlYXNlIGNoZWNrIHRoZQo+IHJ1bnRpbWUgUE0gc3Rh
dGUgb2YgYWxsIEhELWF1ZGlvIGNvZGVjIGRldmljZXMgYW5kIEhELWF1ZGlvIGNvbnRyb2xsZXIK
PiBkZXZpY2UuICBEbyBhbGwgc2hvdyB0aGUgcnVudGltZS1zdXNwZW5kZWQgYnV0IHRoZSBwb3dl
ciBjb25zdW1wdGlvbgo+IGlzIGhpZ2g/ICBPciBpcyBzb21lIGRldmljZSBibG9ja2VkPwo+IAo+
IEJhc2ljYWxseSB0aGUgYXVkaW8gY29udHJvbGxlciBjb3JyZXNwb25kaW5nIHRvIHRoZSBkR1BV
IHNob3VsZCBoYXZlCj4gY2hpcC0+YnVzLmtlZXBfcG93ZXIgPSAwLCB3aGljaCBhbGxvd3MgdGhl
IHJ1bnRpbWUgUE0uICBUaGlzIGZsYWcgaXMKPiBjbGVhcmVkIGF0IGF6eF92eF9ncHVfYm91bmQo
KSBvbmx5IGZvciB0aGUgZEdQVS4gIEZvciB0aGUgcHJpbWFyeSBHUFUsCj4gd2UgbmVlZCB0byBr
ZWVwIHRoZSBsaW5rIHBvd2VyIHVubGVzcyB0aGUgbm90aWZpY2F0aW9uIGlzIGRvbmUgdmlhIHRo
ZQo+IGF1ZGlvIGNvbXBvbmVudCAobGlrZSBpOTE1IG9yIGFtZGdwdSkuICBJIGFscmVhZHkgc3Vi
bWl0dGVkIGEgcGF0Y2ggdG8KPiBlbmFibGUgdGhlIGF1ZGlvIGNvbXBvbmVudCBmb3Igbm91dmVh
dSBpbiB0aGUgcGFzdCwgYnV0IGl0J3MgaWdub3JlZCwKPiBzbyBmYXIuCj4gCj4gCj4gdGhhbmtz
LAo+IAo+IFRha2FzaGkKCkhpIFRha2FzaGkKCk9uIGxpbnV4LW5leHQtMjAxOTExMjcgd2Fybmlu
ZyBpbmRlZWQgZGlzYXBwZWFyZWQuIFRoYW5rcyEKClJlc3Qgb2YgcHJvYmxlbXMgZGlkIG5vdC4g
VGhpcyBpcyBteSBvdXRwdXQgZnJvbSBhbHNhLWluZm8uc2gKaHR0cDovL2Fsc2EtcHJvamVjdC5v
cmcvZGIvP2Y9OTFiYjc4OWEwMWY5ZWVkOTJkMDUzNGZlODk1MTYxOTMxMmIzNTVkYQpEb24ndCBr
bm93IGlmIGl0J3MgaGVscGZ1bCwgc28gSSdsbCBsZWF2ZSBpdCBoZXJlLiBQb3dlciBjb25zdW1w
dGlvbiBpcwpoaWdoLCBiZWNhdXNlIHJ1bnRpbWUtc3VzcGVuZGVkIGlzIG5vdCBlbmFibGVkL2Fj
dGl2ZSAoYW5kIGNhbm5vdCBiZQpmb3JjZWQpIHdpdGhvdXQgcmVtb3ZpbmcgbnZpZGlhJ3MgYXVk
aW8uCgpSZWdhcmRzLApNaWNoYcWCIE1hdHlzaWFrCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
