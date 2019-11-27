Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67210B707
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 20:49:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BF9816D4;
	Wed, 27 Nov 2019 20:48:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BF9816D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574884158;
	bh=Y3VZImmCrvHdxs4LpJVgsl0NdX82Xh+BSOV6Qi9YUUs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vBHRXETqNfuEuKdJ/ceTjWtTSTD2JUASvlF+ZXl/sNX2cf9AI5MvaNRi86GpUpk7o
	 OQkufjPqI3Spsu5VfS3GFaCr4AkxEvJrYKfaYpVxzBHWAO2nAhmNMRyXzElWVCx25K
	 SxgHDCAGh72tibAS4v7vtOGjx/IbP+odkhdIpisk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D49CF8019B;
	Wed, 27 Nov 2019 20:47:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A6A4F801DB; Wed, 27 Nov 2019 20:47:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F150CF80171
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 20:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F150CF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ucNkbY0y"
Received: by mail-lf1-x142.google.com with SMTP id y19so18122559lfl.9
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 11:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=r8UPJBA+/SI89VNzOvhhkET/b3Kj/gUuivH5AmYNy+k=;
 b=ucNkbY0yury8+EGcenJiMP3kAJIcvurx3WZtSMYvkaIEGC2VGiFDFK88vfYrF1K0gb
 r2mCkyF8OUp6Q2kUvxLoWlNhPSMPwdrUqRkoQkpwg7s2IOqoMdWKtGojkj+z7P8is1SX
 qLSWTc1Wm9UML+lbSHkoM9+PqB9bet2O+UCAfilaFPvXEnbtIHbrKvPN4z7wt0/u9b37
 O8BV0il1aXR6Jp5jE28LDdzzXWR6b4lL9rodAoPlbflFEsfHcPxT+6rI0Z2Dcd6Ec62B
 vCFhZY1p7U5qFNeahQmtWDiQxy74ybq+NVRsNM9/lPfc9o+3XE5u629dB1DoC/WTxuAx
 Q9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r8UPJBA+/SI89VNzOvhhkET/b3Kj/gUuivH5AmYNy+k=;
 b=b4//zG9YWqSane4pk5IH0b31YDfBHHJOEHJd4AaNDrZUss9upowTJwMbu//cBfzZn5
 EqcFvTbejj8X1/jwJ0M9C5oQCQ/HojYgRq0CIOhu4GAVw06VvmC6qOHN5mg1+n0y5j35
 8E/5heJG8P6dWmiMarLIYT7WTta0YUbFeFYV2Z+DLygAHXmpR+uUQ6a6TjWAXIsE6PPW
 PppfdbnkG+yf3WTfNs3d+Nc5HP7/vS0IIbxbwngVPZYo6Zahaq0CQL140cPVfl+JVhN1
 Yt/eIp8CxjD0pTmoGLycsPIFIAV5HM0AJoMDJF1VZsCH5xnEDHgFSPicOh71PPk/Bb7G
 a9bg==
X-Gm-Message-State: APjAAAW4v0ybxAGW9PcJaTzld5nHn9sNSzp2zSFTsQWZc8F2MD0liKON
 OouRf1lDjmOGVW5qg6ylyAY=
X-Google-Smtp-Source: APXvYqySfAik+nce94DV0Y71EwIi+YA1bryClts5T1eWAhTK2cvfIWPzJAICzKEm6PxJYJs6yaM9vA==
X-Received: by 2002:ac2:4adc:: with SMTP id m28mr6264434lfp.26.1574884045577; 
 Wed, 27 Nov 2019 11:47:25 -0800 (PST)
Received: from prime (host-178-216-91-25.sta.tvknaszapraca.pl. [178.216.91.25])
 by smtp.gmail.com with ESMTPSA id m26sm8529065lfc.90.2019.11.27.11.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 11:47:25 -0800 (PST)
Date: Wed, 27 Nov 2019 20:47:22 +0100
From: =?utf-8?Q?Micha=C5=82?= Matysiak <matysiakmichal@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191127194722.GA14893@prime>
References: <20191127142637.GB33700@prime> <s5hd0ddwfhg.wl-tiwai@suse.de>
 <8c22afa4-10ca-efc7-5a8c-b927a27959d6@redhat.com>
 <s5hzhghuxbj.wl-tiwai@suse.de> <s5hlfs1uue6.wl-tiwai@suse.de>
 <20191127185237.GA7486@prime> <s5h8so1m8am.wl-tiwai@suse.de>
 <s5h4kypm867.wl-tiwai@suse.de>
 <81af92d6-a7ad-b947-1265-e3d3f7c43b4a@redhat.com>
 <s5h1rttm7k6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h1rttm7k6.wl-tiwai@suse.de>
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

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDg6NDA6NDFQTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IE9uIFdlZCwgMjcgTm92IDIwMTkgMjA6MzE6MjAgKzAxMDAsCj4gSGFucyBkZSBHb2Vk
ZSB3cm90ZToKPiA+IAo+ID4gSGksCj4gPiAKPiA+IE9uIDI3LTExLTIwMTkgMjA6MjcsIFRha2Fz
aGkgSXdhaSB3cm90ZToKPiA+ID4gT24gV2VkLCAyNyBOb3YgMjAxOSAyMDoyNDo0OSArMDEwMCwK
PiA+ID4gVGFrYXNoaSBJd2FpIHdyb3RlOgo+ID4gPj4KPiA+ID4+IE9uIFdlZCwgMjcgTm92IDIw
MTkgMTk6NTI6MzcgKzAxMDAsCj4gPiA+PiBNaWNoYcWCIE1hdHlzaWFrIHdyb3RlOgo+ID4gPj4+
Cj4gPiA+Pj4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6MDA6MTdQTSArMDEwMCwgVGFrYXNo
aSBJd2FpIHdyb3RlOgo+ID4gPj4+PiBPbiBXZWQsIDI3IE5vdiAyMDE5IDE2OjU3OjA0ICswMTAw
LAo+ID4gPj4+PiBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gT24gV2Vk
LCAyNyBOb3YgMjAxOSAxNjo0NjowMCArMDEwMCwKPiA+ID4+Pj4+IEhhbnMgZGUgR29lZGUgd3Jv
dGU6Cj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+PiBIaSBUYWthc2hpLAo+ID4gPj4+Pj4+Cj4gPiA+Pj4+
Pj4gT24gMjctMTEtMjAxOSAxNTozOSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+ID4gPj4+Pj4+PiBP
biBXZWQsIDI3IE5vdiAyMDE5IDE1OjI2OjM3ICswMTAwLAo+ID4gPj4+Pj4+PiBNaWNoYcWCIE1h
dHlzaWFrIHdyb3RlOgo+ID4gPj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+IEhpCj4gPiA+Pj4+Pj4+Pgo+
ID4gPj4+Pj4+Pj4gUmVjZW50bHkgSSd2ZSBlbmNvdW50ZXJlZCB0aGlzIGVycm9yIGFuZCBhcyBI
YW5zIGRlIEdvZWRlJ3MgcmVxdWVzdCBJJ20KPiA+ID4+Pj4+Pj4+IHJlcG9ydGluZyB0aGlzIGJh
Y2sgdG8geW91LiBUaGlzIGhhcHBlbnMgd2hpbGUgYm9vdGluZyBteSBsYXB0b3AKPiA+ID4+Pj4+
Pj4+IGNvbm5lY3RlZCB0byBkb2NraW5nIHN0YXRpb24gYW5kIHdpdGhvdXQgdXNpbmcgb25lLgo+
ID4gPj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+IGtlcm5lbDogV0FSTklORzogQ1BVOiAxIFBJRDogMzMw
IGF0IHNvdW5kL2hkYS9oZGFjX2NvbXBvbmVudC5jOjI5MCBzbmRfaGRhY19hY29tcF9pbml0KzB4
ZGUvMHgxMzAgW3NuZF9oZGFfY29yZV0KPiA+ID4+Pj4+Pj4+IFRoZXJlIGFyZSAyIG1vcmUgImN1
dCBoZXJlIiwgYnV0IHRoZXkncmUgYWxtb3N0IGlkZW50aWNhbCBzbyBJJ3ZlIG9ubHkKPiA+ID4+
Pj4+Pj4+IGluY2x1ZGVkIG9uZSBpbiB0aGlzIGVtYWlsLgo+ID4gPj4+Pj4+Pj4KPiA+ID4+Pj4+
Pj4+IERvbid0IGtub3cgd2hhdCB3aWxsIGJlIHZhbHVhYmxlIHRvIHlvdSwgYnV0IEknbSB3aWxs
aW5nIHRvIGhlbHAgdGVzdAo+ID4gPj4+Pj4+Pj4gdGhpcyBhbmQgZG8gd2hhdCBJJ20gdG9sZC4g
U28sIGhvdyBjYW4gSSBoZWxwPwo+ID4gPj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+IE1vcmUgaW5mbyBh
Ym91dCB0aGlzIHBhcnRpY3VsYXIga2VybmVsIGFuZCBpc3N1ZSwgdGhhdCBsZWQgdG8gdGhpcyBp
cyBhdDoKPiA+ID4+Pj4+Pj4+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5j
Z2k/aWQ9MTc1Nzg5MQo+ID4gPj4+Pj4+Pj4KPiA+ID4+Pj4+Pj4+IGRtZXNnIG91dHB1dDoKPiA+
ID4+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+PiBOb3YgMjYgMTg6MDU6NDUga2VybmVsOiBtaWNyb2NvZGU6
IG1pY3JvY29kZSB1cGRhdGVkIGVhcmx5IHRvIHJldmlzaW9uIDB4MmYsIGRhdGUgPSAyMDE5LTAy
LTE3Cj4gPiA+Pj4+Pj4+PiBOb3YgMjYgMTg6MDU6NDUga2VybmVsOiBMaW51eCB2ZXJzaW9uIDUu
NC4wLTAucmM4LmdpdDAuMS5yaGJ6MTc1Nzg5MS5mYzMxLng4Nl82NCAobW9ja2J1aWxkQGJ1aWxk
aHctMTAucGh4Mi5mZWRvcmFwcm9qZWN0Lm9yZykgKGdjYyB2ZXJzaW9uIDkuMi4xIDIwMTkwODI3
IChSZWQgSGF0IDkuMi4xLTEpIChHQ0MpKSAjMSBTTVAgV2VkIE5vdiAyMCAxNDo1MDozNCBVVEMg
MjAxOQo+ID4gPj4+Pj4+Pj4gTm92IDI2IDE4OjA1OjQ1IGtlcm5lbDogQ29tbWFuZCBsaW5lOiBC
T09UX0lNQUdFPShoZDAsZ3B0Mikvdm1saW51ei01LjQuMC0wLnJjOC5naXQwLjEucmhiejE3NTc4
OTEuZmMzMS54ODZfNjQgcm9vdD0vZGV2L21hcHBlci9mZWRvcmEtcm9vdCBybyByZXN1bWU9L2Rl
di9tYXBwZXIvZmVkb3JhLXN3YXAgcmQubHZtLmx2PWZlZG9yYS9yb290IHJkLmx1a3MudXVpZD1s
dWtzLWVmZDhiNDM4LThmNTYtNDA1YS04Y2VhLTg4ZjgzY2EzOGQyYiByZC5sdm0ubHY9ZmVkb3Jh
L3N3YXAgcmhnYiBxdWlldAo+ID4gPj4+Pj4+Pj4gLi4uCj4gPiA+Pj4+Pj4+PiAuLi4KPiA+ID4+
Pj4+Pj4+IC4uLgo+ID4gPj4+Pj4+Pj4gTm92IDI2IDE4OjA2OjE2IGtlcm5lbDogLS0tLS0tLS0t
LS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiA+Pj4+Pj4+PiBOb3YgMjYgMTg6MDY6MTYg
a2VybmVsOiBXQVJOSU5HOiBDUFU6IDAgUElEOiA0NjEgYXQgc291bmQvaGRhL2hkYWNfY29tcG9u
ZW50LmM6MjkwIHNuZF9oZGFjX2Fjb21wX2luaXQrMHhkZS8weDEzMCBbc25kX2hkYV9jb3JlXQo+
ID4gPj4+Pj4+Pgo+ID4gPj4+Pj4+PiBUaGlzIHNob3VsZCBoYXZlIGJlZW4gYWxyZWFkeSBmaXhl
ZCBieSB0aGUgcmVjZW50IGNvbW1pdAo+ID4gPj4+Pj4+PiA1YTg1OGU3OWM5MTEzMzA2NzhiNWE5
YmU5MWEyNDgzMGU5NGEwZGM5Cj4gPiA+Pj4+Pj4+ICAgICAgIEFMU0E6IGhkYSAtIERpc2FibGUg
YXVkaW8gY29tcG9uZW50IGZvciBsZWdhY3kgTnZpZGlhIEhETUkgY29kZWNzCj4gPiA+Pj4+Pj4+
IHdoaWNoIGlzIGFscmVhZHkgaW5jbHVkZWQgaW4gTGludXMgdHJlZS4gIFBsZWFzZSBjaGVjayBp
dC4KPiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+IFRoYW5rcywgSSd2ZSBzdGFydGVkIGEgc2NyYXRjaCBr
ZXJuZWwgYnVpbGQgd2l0aCB0aGUgcmVsZXZhbnQgcGF0Y2hlcyBhZGRlZCwKPiA+ID4+Pj4+PiBm
b3IgdGhlIEZlZG9yYSB1c2VycyBoaXR0aW5nIHRoaXMgdG8gdGVzdC4KPiA+ID4+Pj4+Pgo+ID4g
Pj4+Pj4+IFRoZSByZWFzb24gdGhleSBzdGFydGVkIGxvb2tpbmcgaW50byB0aGVpciBkbWVzZyBp
cyB0aGF0IHRoZWlyIG52aWRpYSBHUFUgKGh5YnJpZCBnZnggc2V0dXApCj4gPiA+Pj4+Pj4gd2ls
bCBubyBsb25nZXIgc3VzcGVuZCB3aXRoIHJlY2VudCBrZXJuZWxzLCB0aGlzIGlzIHdpdGggYSA1
LjQga2VybmVsIHdoaWNoIGFscmVhZHkgaGFzIHRoZQo+ID4gPj4+Pj4+Cj4gPiA+Pj4+Pj4gIkFM
U0E6IGhkYSAtIEZvcmNlIHJ1bnRpbWUgUE0gb24gTnZpZGlhIEhETUkgY29kZWNzIgo+ID4gPj4+
Pj4+Cj4gPiA+Pj4+Pj4gRml4IGFuZCBmb3IgZ29vZCBtZWFzdXJlIEkndmUgYWxyZWFkeSBnaXZl
biB0aGVtIGEgdGVzdCBrZXJuZWwgd2l0aCB0aGU6Cj4gPiA+Pj4+Pj4gIkFMU0E6IGhkYTogQWxs
b3cgSERBIHRvIGJlIHJ1bnRpbWUgc3VzcGVuZGVkIHdoZW4gZEdQVSBpcyBub3QgYm91bmQgdG8g
YSBkcml2ZSIKPiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+IHBhdGNoIGFkZGVkLiBCdXQgbG9va2luZyBh
dCB0aGUgZml4IGZvciB0aGUgb29wcyBJJ20gbm90IHN1cmUgaWYgZml4aW5nCj4gPiA+Pj4+Pj4g
dGhlIG9vcHMgaXMgYWxzbyBnb2luZyB0byBmaXggdGhlIGlzc3VlIHdpdGggdGhlIGRHUFUgbm8g
bG9uZ2VyIHN1c3BlbmRpbmc/Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gSSBndWVzcyBpdCdzIGlycmVs
ZXZhbnQgd2l0aCB0aGF0IHByb2JsZW0sIGFzIHRoaXMga2VybmVsIHdhcm5pbmcgKG5vdAo+ID4g
Pj4+Pj4gcmVhbGx5IGFuIE9vcHMpIGlzIGp1c3QgYWJvdXQgc2tpcHBpbmcgdGhlIG11bHRpcGxl
IGF1ZGlvIGNvbXBvbmVudAo+ID4gPj4+Pj4gcmVnaXN0cmF0aW9uLiAgQW5kIHRoZSBhdWRpbyBj
b21wb25lbnQgaXNuJ3QgdXNlZCBpbiBub3V2ZWF1IHNpZGUgb24KPiA+ID4+Pj4+IDUuNC54IGF0
IGFsbCwgYW5kIGl0J3MganVzdCBhIHBsYWNlaG9sZGVyLiAgQnV0IHdobyBrbm93cyB0aGUgYmxh
Y2sKPiA+ID4+Pj4+IG1hZ2ljIGJlaGluZCB0aGUgc2NlbmUgOikKPiA+ID4+Pj4KPiA+ID4+Pj4g
Li4uIGFuZCBpZiB0aGlzIHN0aWxsIGRvZXNuJ3QgZml4IHRoZSBwcm9ibGVtLCBwbGVhc2UgY2hl
Y2sgdGhlCj4gPiA+Pj4+IHJ1bnRpbWUgUE0gc3RhdGUgb2YgYWxsIEhELWF1ZGlvIGNvZGVjIGRl
dmljZXMgYW5kIEhELWF1ZGlvIGNvbnRyb2xsZXIKPiA+ID4+Pj4gZGV2aWNlLiAgRG8gYWxsIHNo
b3cgdGhlIHJ1bnRpbWUtc3VzcGVuZGVkIGJ1dCB0aGUgcG93ZXIgY29uc3VtcHRpb24KPiA+ID4+
Pj4gaXMgaGlnaD8gIE9yIGlzIHNvbWUgZGV2aWNlIGJsb2NrZWQ/Cj4gPiA+Pj4+Cj4gPiA+Pj4+
IEJhc2ljYWxseSB0aGUgYXVkaW8gY29udHJvbGxlciBjb3JyZXNwb25kaW5nIHRvIHRoZSBkR1BV
IHNob3VsZCBoYXZlCj4gPiA+Pj4+IGNoaXAtPmJ1cy5rZWVwX3Bvd2VyID0gMCwgd2hpY2ggYWxs
b3dzIHRoZSBydW50aW1lIFBNLiAgVGhpcyBmbGFnIGlzCj4gPiA+Pj4+IGNsZWFyZWQgYXQgYXp4
X3Z4X2dwdV9ib3VuZCgpIG9ubHkgZm9yIHRoZSBkR1BVLiAgRm9yIHRoZSBwcmltYXJ5IEdQVSwK
PiA+ID4+Pj4gd2UgbmVlZCB0byBrZWVwIHRoZSBsaW5rIHBvd2VyIHVubGVzcyB0aGUgbm90aWZp
Y2F0aW9uIGlzIGRvbmUgdmlhIHRoZQo+ID4gPj4+PiBhdWRpbyBjb21wb25lbnQgKGxpa2UgaTkx
NSBvciBhbWRncHUpLiAgSSBhbHJlYWR5IHN1Ym1pdHRlZCBhIHBhdGNoIHRvCj4gPiA+Pj4+IGVu
YWJsZSB0aGUgYXVkaW8gY29tcG9uZW50IGZvciBub3V2ZWF1IGluIHRoZSBwYXN0LCBidXQgaXQn
cyBpZ25vcmVkLAo+ID4gPj4+PiBzbyBmYXIuCj4gPiA+Pj4+Cj4gPiA+Pj4+Cj4gPiA+Pj4+IHRo
YW5rcywKPiA+ID4+Pj4KPiA+ID4+Pj4gVGFrYXNoaQo+ID4gPj4+Cj4gPiA+Pj4gSGkgVGFrYXNo
aQo+ID4gPj4+Cj4gPiA+Pj4gT24gbGludXgtbmV4dC0yMDE5MTEyNyB3YXJuaW5nIGluZGVlZCBk
aXNhcHBlYXJlZC4gVGhhbmtzIQo+ID4gPj4+Cj4gPiA+Pj4gUmVzdCBvZiBwcm9ibGVtcyBkaWQg
bm90LiBUaGlzIGlzIG15IG91dHB1dCBmcm9tIGFsc2EtaW5mby5zaAo+ID4gPj4+IGh0dHA6Ly9h
bHNhLXByb2plY3Qub3JnL2RiLz9mPTkxYmI3ODlhMDFmOWVlZDkyZDA1MzRmZTg5NTE2MTkzMTJi
MzU1ZGEKPiA+ID4+PiBEb24ndCBrbm93IGlmIGl0J3MgaGVscGZ1bCwgc28gSSdsbCBsZWF2ZSBp
dCBoZXJlLiBQb3dlciBjb25zdW1wdGlvbiBpcwo+ID4gPj4+IGhpZ2gsIGJlY2F1c2UgcnVudGlt
ZS1zdXNwZW5kZWQgaXMgbm90IGVuYWJsZWQvYWN0aXZlIChhbmQgY2Fubm90IGJlCj4gPiA+Pj4g
Zm9yY2VkKSB3aXRob3V0IHJlbW92aW5nIG52aWRpYSdzIGF1ZGlvLgo+ID4gPj4KPiA+ID4+IFdo
YXQgaWYgeW91IHBhc3MgcG93ZXJfc2F2ZT0xIHRvIHNuZC1oZGEtaW50ZWwgb3B0aW9uPwo+ID4g
Pj4KPiA+ID4+ICAgIGVjaG8gLW4gMSA+IC9zeXMvbW9kdWxlL3NuZF9oZGFfaW50ZWwvcGFyYW1l
dGVycy9wb3dlcl9zYXZlCj4gPiA+Cj4gPiA+IGFuZCB0aGUgZm9sbG93aW5nLCB0b286Cj4gPiA+
ICAgICAgZWNobyAtbiAxID4gL3N5cy9tb2R1bGUvc25kX2hkYV9pbnRlbC9wYXJhbWV0ZXJzL3Bv
d2VyX3NhdmVfY29udHJvbGxlcgo+ID4gPgo+ID4gPiBPdGhlcndpc2UgdGhlIGNvbnRyb2xsZXIg
ZGV2aWNlIHdpbGwga2VlcCBvbi4KPiA+IAo+ID4gVGhhbmsgeW91IGZvciBoZWxwaW5nIHVzIGdl
dHRpbmcgdG8gdGhlIHJvb3Qgb2YgdGhpcy4KPiA+IAo+ID4gVGhlc2UgYm90aCBkZWZhdWx0IHRv
IDEgcmVzcC4gWSBvbiBGZWRvcmEga2VybmVscywgc28gSSBkbyBub3QgdGhpbmsKPiA+IHRoYXQg
dGhpcyB3aWxsIGhlbHAsIGFzIHRoZXkgYXJlIGJvdGggYWxyZWFkeSAxL1kuCj4gCj4gV2VsbCwg
dGhlIGFsc2EtaW5mby5zaCBvdXRwdXQgTWljaGFsIHN1Z2dlc3RlZCBzaG93cyBkaWZmZXJlbnRs
eToKPiAgIGh0dHA6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPTkxYmI3ODlhMDFmOWVlZDkyZDA1
MzRmZTg5NTE2MTkzMTJiMzU1ZGEKPiAKPiAgICEhTG9hZGVkIHNvdW5kIG1vZHVsZSBvcHRpb25z
Cj4gICAhIS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgLi4uLgo+ICAgcG93ZXJfc2F2
ZSA6IDAKPiAgIHBvd2VyX3NhdmVfY29udHJvbGxlciA6IE4KPiAKPiBJZiB0aGVzZSB2YWx1ZXMg
YXJlIHRydWUsIG1heWJlIHNvbWUgZGVza3RvcCB0dW5pbmcgbW9kaWZpZXMgb24gdGhlCj4gZmx5
Pwo+IAo+IAo+IFRha2FzaGkKCkknbGwgY2hlY2sgaXQgaW4gYSBmZXcuIFRoaXMgd2FzIGxpbnV4
IG5leHQgd2l0aCBjb25maWcgZnJvbSBzb21lIGZlZG9yYQpyYXdoaWRlIGtlcm5lbC4gRG9uJ3Qg
a25vdyBpZiB0aGlzIHZhbHVlcyBhcmUgbGlrZSBkZWZhdWx0cyBmcm9tCkYzMSwgYW5kIEkgZGlk
bid0IGV4ZWMgYWxzYS1pbmZvLnNoIG9uIEhhbnMgZGUgR29lZGUncyBrZXJuZWwsIHNvIEknbGwK
YWRkIHRoaXMgYWxzby4KCk1pY2hhxYIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
