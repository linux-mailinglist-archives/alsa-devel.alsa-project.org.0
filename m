Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 680DB10B726
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 21:02:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9BA916E3;
	Wed, 27 Nov 2019 21:01:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9BA916E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574884954;
	bh=tK2bfRR1VZJaa0pHDAoVU1Ec0OclwXtmFEWDyl4rV4I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/BL43yvPr1VO9KP3TwMFKxaZR/ujJBTszt38Rn23dc87qgHSDg4tw4PLDMhhJM4e
	 tBIE0LrMuts9JCxwtJz0dJz1DrMW6fLI+OzrSLv5HVkhk8Ro9mikyeBDBGXVWohi2x
	 UvEV8gP7l80S/nxSrZjDsTebmFQrvDnXx4vtIE0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91845F8014D;
	Wed, 27 Nov 2019 21:00:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6ECFF8014D; Wed, 27 Nov 2019 21:00:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E811F80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 21:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E811F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LAcnDgvq"
Received: by mail-lf1-x144.google.com with SMTP id m30so16315947lfp.8
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wkuMmdwEb+osvgYUjhNRrhxm3izKcQJ53khbgEUtwas=;
 b=LAcnDgvq4AtfllS3U06oS5ONHlGEjzNe9QRiTlgi2T3DNefzzvSxxHGQMyt+5YcU7E
 AiM7fhFZYE/U96TzreJ3IokJAXK3SM6Tdu/eC1f00wYLX0LU0uURY4LB03oZgNYiQT3F
 rs8C9YTm7NvwTCjsMgfFVra9+YTk3tdlHhe+vTifIqoOVZdh5fCbJacsIBdahThgEdxM
 sEWoAJDbNC+ypt2MelCX82Wj0S1anMfDVnaRN8PnBAC+Vb8WPxW5tsOd4Wdwy4bc7Alk
 eOEp+AE7o17qL0dkzV54mjHLbrFA0+J/APlburn7w0z4twMyxm17U9nzVOR3elathhAR
 8xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wkuMmdwEb+osvgYUjhNRrhxm3izKcQJ53khbgEUtwas=;
 b=eWB0MhwEkEH/U/XV9lho0UVarhlXzsGF63bIgtxszXWhURnkumCcYZm9O+HRYmCaNG
 1ggxvE8W4YnGEQ6qlPy1AxZbgB9f9/oE+Br+IdwOqetPFG0/Ra31odGiUkcgSVlhlQOI
 wLdEDKrNvrnfi7l3absL08flLqOLEm6mlMj1EXaCNn6TB5gVxTwbDdHZJc0cFZ1KtxR7
 SDIxxiqq5HESPe8EsapcSqVsMnrcFQtLbf88A0T62WZw9x+4rx1C+sBgWxY7nqlxKVqJ
 pZ8/yUmjPVkBn+zlZZoKwpmNkOGi/WvyYPMvaEog9C2S1sOA7LmLViJpY793dwF9071e
 dqzg==
X-Gm-Message-State: APjAAAW9KyqLwNFP5OEPgvh/Nq10Z4r+g2nClO7i8diaNkUzHd8gWHk1
 RyNMCjXUGY1T6I4yb54q/48=
X-Google-Smtp-Source: APXvYqwAVi2fh1sEKuwzTtgIAHZMElzSwxmqf4nWOuCcmm4I7ju6wRUQeQfS5trJNaVL/t2NMlkrog==
X-Received: by 2002:ac2:4357:: with SMTP id o23mr30562644lfl.51.1574884844432; 
 Wed, 27 Nov 2019 12:00:44 -0800 (PST)
Received: from prime (host-178-216-91-25.sta.tvknaszapraca.pl. [178.216.91.25])
 by smtp.gmail.com with ESMTPSA id r12sm7443263lfc.28.2019.11.27.12.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 12:00:44 -0800 (PST)
Date: Wed, 27 Nov 2019 21:00:41 +0100
From: =?utf-8?Q?Micha=C5=82?= Matysiak <matysiakmichal@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20191127200041.GA4972@prime>
References: <s5hd0ddwfhg.wl-tiwai@suse.de>
 <8c22afa4-10ca-efc7-5a8c-b927a27959d6@redhat.com>
 <s5hzhghuxbj.wl-tiwai@suse.de> <s5hlfs1uue6.wl-tiwai@suse.de>
 <20191127185237.GA7486@prime> <s5h8so1m8am.wl-tiwai@suse.de>
 <s5h4kypm867.wl-tiwai@suse.de>
 <81af92d6-a7ad-b947-1265-e3d3f7c43b4a@redhat.com>
 <s5h1rttm7k6.wl-tiwai@suse.de>
 <a3f7aedb-4467-2b37-c8f3-f2f6b4fafbf8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3f7aedb-4467-2b37-c8f3-f2f6b4fafbf8@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDg6NDY6MzZQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBIaSwKPgo+IE9uIDI3LTExLTIwMTkgMjA6NDAsIFRha2FzaGkgSXdhaSB3cm90ZToK
PiA+IE9uIFdlZCwgMjcgTm92IDIwMTkgMjA6MzE6MjAgKzAxMDAsCj4gPiBIYW5zIGRlIEdvZWRl
IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSwKPiA+ID4KPiA+ID4gT24gMjctMTEtMjAxOSAyMDoyNywg
VGFrYXNoaSBJd2FpIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgMjcgTm92IDIwMTkgMjA6MjQ6NDkg
KzAxMDAsCj4gPiA+ID4gVGFrYXNoaSBJd2FpIHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9u
IFdlZCwgMjcgTm92IDIwMTkgMTk6NTI6MzcgKzAxMDAsCj4gPiA+ID4gPiBNaWNoYcWCIE1hdHlz
aWFrIHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBh
dCAwNjowMDoxN1BNICswMTAwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24g
V2VkLCAyNyBOb3YgMjAxOSAxNjo1NzowNCArMDEwMCwKPiA+ID4gPiA+ID4gPiBUYWthc2hpIEl3
YWkgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCAyNyBOb3Yg
MjAxOSAxNjo0NjowMCArMDEwMCwKPiA+ID4gPiA+ID4gPiA+IEhhbnMgZGUgR29lZGUgd3JvdGU6
Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IEhpIFRha2FzaGksCj4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIDI3LTExLTIwMTkgMTU6MzksIFRha2FzaGkg
SXdhaSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBXZWQsIDI3IE5vdiAyMDE5IDE1OjI2
OjM3ICswMTAwLAo+ID4gPiA+ID4gPiA+ID4gPiA+IE1pY2hhxYIgTWF0eXNpYWsgd3JvdGU6Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gSGkKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBSZWNlbnRseSBJJ3ZlIGVuY291bnRlcmVk
IHRoaXMgZXJyb3IgYW5kIGFzIEhhbnMgZGUgR29lZGUncyByZXF1ZXN0IEknbQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gcmVwb3J0aW5nIHRoaXMgYmFjayB0byB5b3UuIFRoaXMgaGFwcGVucyB3aGls
ZSBib290aW5nIG15IGxhcHRvcAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gY29ubmVjdGVkIHRvIGRv
Y2tpbmcgc3RhdGlvbiBhbmQgd2l0aG91dCB1c2luZyBvbmUuCj4gPiA+ID4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4ga2VybmVsOiBXQVJOSU5HOiBDUFU6IDEgUElEOiAzMzAg
YXQgc291bmQvaGRhL2hkYWNfY29tcG9uZW50LmM6MjkwIHNuZF9oZGFjX2Fjb21wX2luaXQrMHhk
ZS8weDEzMCBbc25kX2hkYV9jb3JlXQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gVGhlcmUgYXJlIDIg
bW9yZSAiY3V0IGhlcmUiLCBidXQgdGhleSdyZSBhbG1vc3QgaWRlbnRpY2FsIHNvIEkndmUgb25s
eQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaW5jbHVkZWQgb25lIGluIHRoaXMgZW1haWwuCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gRG9uJ3Qga25vdyB3aGF0IHdp
bGwgYmUgdmFsdWFibGUgdG8geW91LCBidXQgSSdtIHdpbGxpbmcgdG8gaGVscCB0ZXN0Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiB0aGlzIGFuZCBkbyB3aGF0IEknbSB0b2xkLiBTbywgaG93IGNhbiBJ
IGhlbHA/Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gTW9yZSBp
bmZvIGFib3V0IHRoaXMgcGFydGljdWxhciBrZXJuZWwgYW5kIGlzc3VlLCB0aGF0IGxlZCB0byB0
aGlzIGlzIGF0Ogo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQu
Y29tL3Nob3dfYnVnLmNnaT9pZD0xNzU3ODkxCj4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gZG1lc2cgb3V0cHV0Ogo+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IG1pY3JvY29kZTogbWljcm9j
b2RlIHVwZGF0ZWQgZWFybHkgdG8gcmV2aXNpb24gMHgyZiwgZGF0ZSA9IDIwMTktMDItMTcKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IE5vdiAyNiAxODowNTo0NSBrZXJuZWw6IExpbnV4IHZlcnNpb24g
NS40LjAtMC5yYzguZ2l0MC4xLnJoYnoxNzU3ODkxLmZjMzEueDg2XzY0IChtb2NrYnVpbGRAYnVp
bGRody0xMC5waHgyLmZlZG9yYXByb2plY3Qub3JnKSAoZ2NjIHZlcnNpb24gOS4yLjEgMjAxOTA4
MjcgKFJlZCBIYXQgOS4yLjEtMSkgKEdDQykpICMxIFNNUCBXZWQgTm92IDIwIDE0OjUwOjM0IFVU
QyAyMDE5Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBOb3YgMjYgMTg6MDU6NDUga2VybmVsOiBDb21t
YW5kIGxpbmU6IEJPT1RfSU1BR0U9KGhkMCxncHQyKS92bWxpbnV6LTUuNC4wLTAucmM4LmdpdDAu
MS5yaGJ6MTc1Nzg5MS5mYzMxLng4Nl82NCByb290PS9kZXYvbWFwcGVyL2ZlZG9yYS1yb290IHJv
IHJlc3VtZT0vZGV2L21hcHBlci9mZWRvcmEtc3dhcCByZC5sdm0ubHY9ZmVkb3JhL3Jvb3QgcmQu
bHVrcy51dWlkPWx1a3MtZWZkOGI0MzgtOGY1Ni00MDVhLThjZWEtODhmODNjYTM4ZDJiIHJkLmx2
bS5sdj1mZWRvcmEvc3dhcCByaGdiIHF1aWV0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAuLi4KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IC4uLgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLi4uCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBOb3YgMjYgMTg6MDY6MTYga2VybmVsOiAtLS0tLS0tLS0tLS1bIGN1dCBo
ZXJlIF0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IE5vdiAyNiAxODowNjoxNiBr
ZXJuZWw6IFdBUk5JTkc6IENQVTogMCBQSUQ6IDQ2MSBhdCBzb3VuZC9oZGEvaGRhY19jb21wb25l
bnQuYzoyOTAgc25kX2hkYWNfYWNvbXBfaW5pdCsweGRlLzB4MTMwIFtzbmRfaGRhX2NvcmVdCj4g
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHNob3VsZCBoYXZlIGJl
ZW4gYWxyZWFkeSBmaXhlZCBieSB0aGUgcmVjZW50IGNvbW1pdAo+ID4gPiA+ID4gPiA+ID4gPiA+
IDVhODU4ZTc5YzkxMTMzMDY3OGI1YTliZTkxYTI0ODMwZTk0YTBkYzkKPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICAgQUxTQTogaGRhIC0gRGlzYWJsZSBhdWRpbyBjb21wb25lbnQgZm9yIGxlZ2Fj
eSBOdmlkaWEgSERNSSBjb2RlY3MKPiA+ID4gPiA+ID4gPiA+ID4gPiB3aGljaCBpcyBhbHJlYWR5
IGluY2x1ZGVkIGluIExpbnVzIHRyZWUuICBQbGVhc2UgY2hlY2sgaXQuCj4gPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiA+IFRoYW5rcywgSSd2ZSBzdGFydGVkIGEgc2NyYXRjaCBrZXJu
ZWwgYnVpbGQgd2l0aCB0aGUgcmVsZXZhbnQgcGF0Y2hlcyBhZGRlZCwKPiA+ID4gPiA+ID4gPiA+
ID4gZm9yIHRoZSBGZWRvcmEgdXNlcnMgaGl0dGluZyB0aGlzIHRvIHRlc3QuCj4gPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IFRoZSByZWFzb24gdGhleSBzdGFydGVkIGxvb2tpbmcg
aW50byB0aGVpciBkbWVzZyBpcyB0aGF0IHRoZWlyIG52aWRpYSBHUFUgKGh5YnJpZCBnZnggc2V0
dXApCj4gPiA+ID4gPiA+ID4gPiA+IHdpbGwgbm8gbG9uZ2VyIHN1c3BlbmQgd2l0aCByZWNlbnQg
a2VybmVscywgdGhpcyBpcyB3aXRoIGEgNS40IGtlcm5lbCB3aGljaCBhbHJlYWR5IGhhcyB0aGUK
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gIkFMU0E6IGhkYSAtIEZvcmNlIHJ1
bnRpbWUgUE0gb24gTnZpZGlhIEhETUkgY29kZWNzIgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gPiBGaXggYW5kIGZvciBnb29kIG1lYXN1cmUgSSd2ZSBhbHJlYWR5IGdpdmVuIHRo
ZW0gYSB0ZXN0IGtlcm5lbCB3aXRoIHRoZToKPiA+ID4gPiA+ID4gPiA+ID4gIkFMU0E6IGhkYTog
QWxsb3cgSERBIHRvIGJlIHJ1bnRpbWUgc3VzcGVuZGVkIHdoZW4gZEdQVSBpcyBub3QgYm91bmQg
dG8gYSBkcml2ZSIKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gcGF0Y2ggYWRk
ZWQuIEJ1dCBsb29raW5nIGF0IHRoZSBmaXggZm9yIHRoZSBvb3BzIEknbSBub3Qgc3VyZSBpZiBm
aXhpbmcKPiA+ID4gPiA+ID4gPiA+ID4gdGhlIG9vcHMgaXMgYWxzbyBnb2luZyB0byBmaXggdGhl
IGlzc3VlIHdpdGggdGhlIGRHUFUgbm8gbG9uZ2VyIHN1c3BlbmRpbmc/Cj4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gSSBndWVzcyBpdCdzIGlycmVsZXZhbnQgd2l0aCB0aGF0IHByb2Js
ZW0sIGFzIHRoaXMga2VybmVsIHdhcm5pbmcgKG5vdAo+ID4gPiA+ID4gPiA+ID4gcmVhbGx5IGFu
IE9vcHMpIGlzIGp1c3QgYWJvdXQgc2tpcHBpbmcgdGhlIG11bHRpcGxlIGF1ZGlvIGNvbXBvbmVu
dAo+ID4gPiA+ID4gPiA+ID4gcmVnaXN0cmF0aW9uLiAgQW5kIHRoZSBhdWRpbyBjb21wb25lbnQg
aXNuJ3QgdXNlZCBpbiBub3V2ZWF1IHNpZGUgb24KPiA+ID4gPiA+ID4gPiA+IDUuNC54IGF0IGFs
bCwgYW5kIGl0J3MganVzdCBhIHBsYWNlaG9sZGVyLiAgQnV0IHdobyBrbm93cyB0aGUgYmxhY2sK
PiA+ID4gPiA+ID4gPiA+IG1hZ2ljIGJlaGluZCB0aGUgc2NlbmUgOikKPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IC4uLiBhbmQgaWYgdGhpcyBzdGlsbCBkb2Vzbid0IGZpeCB0aGUgcHJvYmxl
bSwgcGxlYXNlIGNoZWNrIHRoZQo+ID4gPiA+ID4gPiA+IHJ1bnRpbWUgUE0gc3RhdGUgb2YgYWxs
IEhELWF1ZGlvIGNvZGVjIGRldmljZXMgYW5kIEhELWF1ZGlvIGNvbnRyb2xsZXIKPiA+ID4gPiA+
ID4gPiBkZXZpY2UuICBEbyBhbGwgc2hvdyB0aGUgcnVudGltZS1zdXNwZW5kZWQgYnV0IHRoZSBw
b3dlciBjb25zdW1wdGlvbgo+ID4gPiA+ID4gPiA+IGlzIGhpZ2g/ICBPciBpcyBzb21lIGRldmlj
ZSBibG9ja2VkPwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQmFzaWNhbGx5IHRoZSBhdWRp
byBjb250cm9sbGVyIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGRHUFUgc2hvdWxkIGhhdmUKPiA+ID4g
PiA+ID4gPiBjaGlwLT5idXMua2VlcF9wb3dlciA9IDAsIHdoaWNoIGFsbG93cyB0aGUgcnVudGlt
ZSBQTS4gIFRoaXMgZmxhZyBpcwo+ID4gPiA+ID4gPiA+IGNsZWFyZWQgYXQgYXp4X3Z4X2dwdV9i
b3VuZCgpIG9ubHkgZm9yIHRoZSBkR1BVLiAgRm9yIHRoZSBwcmltYXJ5IEdQVSwKPiA+ID4gPiA+
ID4gPiB3ZSBuZWVkIHRvIGtlZXAgdGhlIGxpbmsgcG93ZXIgdW5sZXNzIHRoZSBub3RpZmljYXRp
b24gaXMgZG9uZSB2aWEgdGhlCj4gPiA+ID4gPiA+ID4gYXVkaW8gY29tcG9uZW50IChsaWtlIGk5
MTUgb3IgYW1kZ3B1KS4gIEkgYWxyZWFkeSBzdWJtaXR0ZWQgYSBwYXRjaCB0bwo+ID4gPiA+ID4g
PiA+IGVuYWJsZSB0aGUgYXVkaW8gY29tcG9uZW50IGZvciBub3V2ZWF1IGluIHRoZSBwYXN0LCBi
dXQgaXQncyBpZ25vcmVkLAo+ID4gPiA+ID4gPiA+IHNvIGZhci4KPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gdGhhbmtzLAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gVGFrYXNoaQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBIaSBUYWthc2hpCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IE9uIGxpbnV4LW5leHQtMjAxOTExMjcgd2FybmluZyBpbmRlZWQgZGlzYXBw
ZWFyZWQuIFRoYW5rcyEKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gUmVzdCBvZiBwcm9ibGVtcyBk
aWQgbm90LiBUaGlzIGlzIG15IG91dHB1dCBmcm9tIGFsc2EtaW5mby5zaAo+ID4gPiA+ID4gPiBo
dHRwOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj05MWJiNzg5YTAxZjllZWQ5MmQwNTM0ZmU4OTUx
NjE5MzEyYjM1NWRhCj4gPiA+ID4gPiA+IERvbid0IGtub3cgaWYgaXQncyBoZWxwZnVsLCBzbyBJ
J2xsIGxlYXZlIGl0IGhlcmUuIFBvd2VyIGNvbnN1bXB0aW9uIGlzCj4gPiA+ID4gPiA+IGhpZ2gs
IGJlY2F1c2UgcnVudGltZS1zdXNwZW5kZWQgaXMgbm90IGVuYWJsZWQvYWN0aXZlIChhbmQgY2Fu
bm90IGJlCj4gPiA+ID4gPiA+IGZvcmNlZCkgd2l0aG91dCByZW1vdmluZyBudmlkaWEncyBhdWRp
by4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXaGF0IGlmIHlvdSBwYXNzIHBvd2VyX3NhdmU9MSB0byBz
bmQtaGRhLWludGVsIG9wdGlvbj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgZWNobyAtbiAxID4g
L3N5cy9tb2R1bGUvc25kX2hkYV9pbnRlbC9wYXJhbWV0ZXJzL3Bvd2VyX3NhdmUKPiA+ID4gPgo+
ID4gPiA+IGFuZCB0aGUgZm9sbG93aW5nLCB0b286Cj4gPiA+ID4gICAgICAgZWNobyAtbiAxID4g
L3N5cy9tb2R1bGUvc25kX2hkYV9pbnRlbC9wYXJhbWV0ZXJzL3Bvd2VyX3NhdmVfY29udHJvbGxl
cgo+ID4gPiA+Cj4gPiA+ID4gT3RoZXJ3aXNlIHRoZSBjb250cm9sbGVyIGRldmljZSB3aWxsIGtl
ZXAgb24uCj4gPiA+Cj4gPiA+IFRoYW5rIHlvdSBmb3IgaGVscGluZyB1cyBnZXR0aW5nIHRvIHRo
ZSByb290IG9mIHRoaXMuCj4gPiA+Cj4gPiA+IFRoZXNlIGJvdGggZGVmYXVsdCB0byAxIHJlc3Au
IFkgb24gRmVkb3JhIGtlcm5lbHMsIHNvIEkgZG8gbm90IHRoaW5rCj4gPiA+IHRoYXQgdGhpcyB3
aWxsIGhlbHAsIGFzIHRoZXkgYXJlIGJvdGggYWxyZWFkeSAxL1kuCj4gPgo+ID4gV2VsbCwgdGhl
IGFsc2EtaW5mby5zaCBvdXRwdXQgTWljaGFsIHN1Z2dlc3RlZCBzaG93cyBkaWZmZXJlbnRseToK
PiA+ICAgIGh0dHA6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPTkxYmI3ODlhMDFmOWVlZDkyZDA1
MzRmZTg5NTE2MTkzMTJiMzU1ZGEKPiA+Cj4gPiAgICAhIUxvYWRlZCBzb3VuZCBtb2R1bGUgb3B0
aW9ucwo+ID4gICAgISEtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgIC4uLi4KPiA+
ICAgIHBvd2VyX3NhdmUgOiAwCj4gPiAgICBwb3dlcl9zYXZlX2NvbnRyb2xsZXIgOiBOCj4gPgo+
ID4gSWYgdGhlc2UgdmFsdWVzIGFyZSB0cnVlLCBtYXliZSBzb21lIGRlc2t0b3AgdHVuaW5nIG1v
ZGlmaWVzIG9uIHRoZQo+ID4gZmx5Pwo+Cj4gT2gsIHRoYXQgbWlnaHQgZXhwbGFpbiB3aHkgdGhl
IGZpeGVzIGZvciB0aGlzIGFyZSBjb25maXJtZWQgYXMgd29ya2luZyBieQo+IHNvbWUgb2Ygb3Vy
IHVzZXJzLCBidXQgbm90IGJ5IGFsbC4KPgo+IE1pY2hhbCwgYXJlIHlvdSBwZXJoYXBzIHVzaW5n
IFRMUCBvciBzb21lIHNpbWlsYXIgc29mdHdhcmUgdG8gdHVuZSAvCj4gaW1wcm92ZSBwb3dlci1t
YW5hZ2VtZW50IHNldHRpbmdzID8gIE9yIGRvIHlvdSBwZXJoYXBzIGhhdmUgc29tZQo+IGN1c3Rv
bSBmaWxlcyB1bmRlciAvZXRjL21vZHByb2JlLmNvbmYuZCBtZXNzaW5nIHdpdGggdGhlc2Ugc2V0
dGluZ3M/Cj4KPiBSZWdhcmRzLAo+Cj4gSGFucwo+CgpPSy4gU28gdGhhdCBleHBsYWlucyBldmVy
eXRoaW5nLCBpdCdzIHdvcmtpbmcgYXMgaW50ZW5kZWQgd2l0aCB0bHAKZGlzYWJsZWQuIEknbSB1
c2luZyB0bHAgYW5kIEkgYXNzdW1lZCwgdGhhdCBpZiBteSB0bHAncyBjb25maWd1cmF0aW9uCndh
cyB3b3JraW5nIGJlZm9yZSwgaXQgc2hvdWxkIHdvcmsgbm93LiBFc3BlY2lhbGx5IHdoZW4gSSd2
ZSBjaGVja2VkCmxpdmUgaXNvcyBhbmQgd2FzIGJyb2tlbiBpbiBleGFjdGx5IHNhbWUgd2F5LiBD
bGVhcmx5IEkgd2FzIHdyb25nLgoKQklHIFRIQU5LIFlPVSEKCk1pY2hhxYIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
