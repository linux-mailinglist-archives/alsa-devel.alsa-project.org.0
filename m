Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81D34C31
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 17:26:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812221697;
	Tue,  4 Jun 2019 17:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812221697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559661999;
	bh=2/ncw1BzlRqWYd6uk2bsrhM56Mt6lCKMLcjLYnhqFmM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wnq1nZaU4hb70iv/hxzPZiIBpr5mMPA9LkU19YYxACLRMZKQcYWUUJl+3I9QFKuNH
	 Tol98FD2Nlg7VLFoN1NHa8/7PLf2BYRkNdqfuk/2ex0j0Y9GpQlgPEoSBTXedz+4VB
	 AeAx/vHe/Pa60SUGwikr+YONFEy43/NwGjwpQtQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE42FF896F8;
	Tue,  4 Jun 2019 17:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E762AF896F7; Tue,  4 Jun 2019 17:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05AA0F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 17:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05AA0F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch
 header.b="MI7CJxkC"
Received: by mail-oi1-x231.google.com with SMTP id e189so9128835oib.11
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2MDK+m+FuX9/PN6wX5kGSON+cyTcWRcURp05UkjBF9I=;
 b=MI7CJxkCZNurpd0Qjzerd+fQ7mG1VIMVugMoTj/H0iLkqCmQbsrQN9k3r3YZ1oMwUl
 D0lhUpfAvJel09AW9IjjhIeHFwojfnGSp/5SfHGGwwWpVenRHqgRfpQ/FCZY0fGYF2g9
 4YcICARur9dBWIEyYm1T3MlKrpOTX1l6i++mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2MDK+m+FuX9/PN6wX5kGSON+cyTcWRcURp05UkjBF9I=;
 b=KGXT+ZXFtsM0Vb+FQf4bLsYNlEuoxNyDogjQ20PHI9WTSUsSxhSPo1uUsjEDYdG3eh
 PahNfhAL7ll43q9mMXsSdP9K3Gz6XC5eqijM3WBQqwRlGbl7kY/RXN4Keo8k3ktNyeMB
 DwTL9fkhQ0li6dGgV48pbjL901lquqWcAcJ3OEbWI32dQIJO7DNAiSAUXjqgWEi5L7PT
 dtF9jm8i1akurpQgS8Sj9GRZS1hY56tkuFD0rgYUwfAfRYz00eeoYIjziUq2p+sA1xAk
 WA+jA3eUQEfgPeiHDtvsW9/OQJ/x3CAMB4dvrdVX4xEW5TtpmBiRVMJel/E1JTXFHtzV
 ljyg==
X-Gm-Message-State: APjAAAUQAFkR7FXo9TJYSfVUFJuDdfD2JF5gi0dJeBaW1q+3KNdh+3hY
 ovpHfcPsGb4ycDsvQBqbp2CGNmlymEAw7NdnHU5qCw==
X-Google-Smtp-Source: APXvYqwZcX0oT63VlccXPtEgj7alySpMMoRwsRSRx+g2TPQnYO7w0760NIP428jwz+RI9zMqW034ZmrebUBSM9Grzhg=
X-Received: by 2002:aca:e4c8:: with SMTP id b191mr4909798oih.110.1559661886581; 
 Tue, 04 Jun 2019 08:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
In-Reply-To: <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Jun 2019 17:24:35 +0200
Message-ID: <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ser,
 Simon" <simon.ser@intel.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Subject: Re: [alsa-devel] Linking ALSA playback devices and DRM connectors
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

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCA1OjE1IFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFtIDA0LjA2LjE5IHVtIDE3OjA1
IHNjaHJpZWIgU2VyLCBTaW1vbjoKPiA+IEhpLAo+ID4KPiA+IEknbSB0cnlpbmcgdG8gbGluayBB
TFNBIHBsYXliYWNrIGRldmljZXMgYW5kIERSTSBjb25uZWN0b3JzLiBJbiBvdGhlcgo+ID4gd29y
ZHMsIEknZCBsaWtlIHRvIGJlIGFibGUgdG8ga25vdyB3aGljaCBBTFNBIGRldmljZSBJIHNob3Vs
ZCBvcGVuIHRvCj4gPiBwbGF5IGF1ZGlvIG9uIGEgZ2l2ZW4gY29ubmVjdG9yLgo+ID4KPiA+IFVu
Zm9ydHVuYXRlbHksIEkgaGF2ZW4ndCBmb3VuZCBhIHdheSB0byBleHRyYWN0IHRoaXMgaW5mb3Jt
YXRpb24uIEkKPiA+IGtub3cgL3Byb2MvYXNvdW5kL2NhcmROL2VsZCogZXhwb3NlIHRoZSBFRElE
LWxpa2UgZGF0YS4gSG93ZXZlciBieQo+ID4gbG9va2luZyBhdCB0aGUgQUxTQSBBUEkgKGFsc286
IGFwbGF5IC1sIGFuZCAtTCkgSSBjYW4ndCBmaW5kIGEgd2F5IHRvCj4gPiBmaWd1cmUgb3V0IHdo
aWNoIFBDTSBkZXZpY2UgbWFwcyB0byB0aGUgRUxELgo+ID4KPiA+IEFtIEkgbWlzc2luZyBzb21l
dGhpbmc/Cj4KPiBJcyB0aGF0IGFjdHVhbGx5IGZpeGVkIG9uIGFsbCBoYXJkd2FyZT8gT3IgZG8g
d2UgbWF5YmUgaGF2ZSBzb21lCj4gaGFyZHdhcmUgd2l0aCBvbmx5IG9uZSBhdWRpbyBjb2RlYyBh
bmQgbXVsdGlwbGUgY29ubmVjdG9ycz8KPgo+ID4KPiA+IElmIG5vdCwgd2hhdCB3b3VsZCBiZSB0
aGUgYmVzdCB3YXkgdG8gZXhwb3NlIHRoaXM/Cj4gPgo+ID4gLSBBIHN5bWxpbmsgdG8gdGhlIEFM
U0EgYXVkaW8gUENNIGRldmljZSBpbgo+ID4gICAgL3N5cy9jbGFzcy9kcm0vY2FyZE4tQ09OTkVD
VE9SPwo+ID4gLSBBIHN5bWxpbmsgdG8gdGhlIERSTSBjb25uZWN0b3IgaW4gL3N5cy9jbGFzcy9z
b3VuZC9wY20qPwo+Cj4gSWYgaXQncyBmaXhlZCB0aGFuIHRob3NlIHR3byBvcHRpb25zIHNvdW5k
IHNhbmUgdG8gbWUuCj4KPiA+IC0gQSBEUk0gY29ubmVjdG9yIHByb3BlcnR5Pwo+Cj4gSWYgaXQn
cyBjb25maWd1cmFibGUgdGhhbiB0aGF0IHNvdW5kcyBsaWtlIGEgZ29vZCBvcHRpb24gdG8gbWUu
Cj4KPiBBbnl3YXkgYWRkZWQgb3VyIERDIHRlYW0sIHN0dWZmIGxpa2UgdGhhdCBpcyB0aGVpciBj
b25zdHJ1Y3Rpb24gc2l0ZS4KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4gPiAtIFNvbWVo
b3cgZXhwb3NlIHRoZSBjb25uZWN0b3IgbmFtZSB2aWEgdGhlIEFMU0EgQVBJPwo+ID4gLSBFeHBv
c2UgdGhlIGNvbm5lY3RvciBFRElEIHZpYSBBTFNBPwo+ID4gLSBPdGhlciBpZGVhcz8KCkkgdGhp
bmsgb24gb3VyIE1TVCBodyB5b3UgZ2V0IGEgY29tYmluYXRpb24gb2YgQ1JUQ3MgeCBDT05ORUNU
T1JzIG9uCnRoZSBhbHNhIHNpZGUuIEkuZS4gZm9yIGV2ZXJ5IHBhaXIgb2YgY29ubmVjdG9yIGFu
ZCBjcnRjIHlvdSBnZXQgYQpzZXBhcmF0ZSBhbHNhIHBpbi4gVGhpcyBpcyBiZWNhdXNlIHdpdGgg
bXN0LCB5b3UgY291bGQgaGF2ZSB1cCB0bwpudW1fY3J0Y3Mgc3RyZWFtcyBvbiBhIHNpbmdsZSBj
b25uZWN0b3IuIE5vdCBzdXJlIGhvdyB0byBtb2RlbCB0aGF0LgoKQmlnZ2VyIHF1ZXN0aW9uOiBI
b3cgZG8geW91IHdhbnQgdG8gbWFrZSB0aGUgY29vcGVyYXRpb24gaGFwcGVuPwpUaGVyZSdzIGJl
ZW4gc29tZSBpZGVhcyBmbG9hdGluZyBhYm91dCBtYWtpbmcgdGhlIGhkbWkgY29ubmVjdGlvbgpi
ZXR3ZWVuIGRybSBhbmQgYWxzYSBzb21laG93IHJlcHJlc2VudGVkIGluIHRoZSBjb2RlLCBidXQg
bm90aGluZyBldmVyCnJlYWxseSBoYXBwZW5lZC4gdGhlcmUncyBkcm1fYXVkaW9fY29tcG9uZW50
LmgsIGJ1dCB0aGF0J3MganVzdCB0aGUKaW50ZXJmYWNlLCBpdCBkb2Vzbid0IHJlYWxseSBzb2x2
ZSBob3cgdG8gbWFrZSB0aGUgY29ubmVjdGlvbi4gQWxzbwpvbmx5IHVzZWQgYnkgaTkxNS9oZGEu
Ci1EYW5pZWwKCgoKPiA+IFRoYW5rcyEKPiA+Cj4gPiBTaW1vbiBTZXIKPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
