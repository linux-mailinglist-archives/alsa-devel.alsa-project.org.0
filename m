Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FE911061B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 21:45:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B0091669;
	Tue,  3 Dec 2019 21:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B0091669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575405931;
	bh=zoMWgTfRo196Q344RsdieSEUL6TNuVv6LpEZCeADCvs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4vjv/6Kf02nqrAXXBNjpmERcAGQjQ2uOnkuY3r3490/OGSI5z7918oUkKs402WwW
	 vZYs+rNjBU2EyGBfU0zzMC3Pvll4ya7/ER1Y9WIeU0xugAzqkdEU6RwhlT9A+eil4t
	 ZfofHUgHXNEz68n6fRBdtSQ1d/3sSTMDqsVngOGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8EE7F8015A;
	Tue,  3 Dec 2019 21:43:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD9DFF8015A; Tue,  3 Dec 2019 21:43:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C47E8F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 21:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C47E8F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="URJ0GdbW"
Received: by mail-qv1-xf43.google.com with SMTP id b18so2163585qvy.3
 for <alsa-devel@alsa-project.org>; Tue, 03 Dec 2019 12:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NTs4mMuCkVgNMcWVN7CkShBFgDZXH20YBZaHdHma1/Q=;
 b=URJ0GdbWBA17jxox9K3a8f66G97DAKSsUzNjn6YFeGB1ShQO3Ghy7sgFxB9O/8KDrm
 9fvxYUg35M3l7y0GpFXlIRtmED2bynLaT5OukcosyJi2vibsgg/g1aJI7tGOiMuaYGWH
 82Me4DUgKnCgwH1RZ1NFizmtvivVZaBx0sT0EqIwKTTLhfzDjuvxApx4OWHiO0t479ki
 4mFqOQpTLLHkO89sFxVrFK7k2O9nIaOw0eLZpE6+Ralv/KXYXjlbUqPrjOZ9Xjx6ewqK
 wsna4zQoxMO2IQCEUpWra7gXEMvfErbKqjUx52D/DWNINrxNdDKueUpByrsm2SLONZkF
 2PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NTs4mMuCkVgNMcWVN7CkShBFgDZXH20YBZaHdHma1/Q=;
 b=M3vyIDUUw+dhoNPxY98fKe0+GkIPZHM9iGs2mmHlVycCqJCfj7AB+nfL/5jUdJDtbT
 kPcI9dvVp1JUkcG/AzXvBjS/bO03A/CeVFlTffnqBc0HggGvKEUvbDYhRp6Pk9rcnf3f
 WGrTKFX/6VXSq4RAOqliIYIUsnluoKxD7blGhSpdS8R4AbXeU3V/V1rjYo8Wilxt/bvZ
 Kym9YdL9M11nUpAm4LdXNjwNWIlP+2Xigm06B4Hn0EpkXk6ktGjStLsBP0VeD6+Z4I4E
 tw2i8AVx8JgYRyYyL44zAhlW4UqK7IKmf5j8pq8g8ekyk/XzkugbxUnkD4zTlSV31Rx3
 3MJA==
X-Gm-Message-State: APjAAAUVeWZ20sKhL3zNINU2/8ZYWHrMuDSK/WXK3Vj/xJ9CANgjgauI
 f+Qi+N5Y2SFap8r7UWxl6vOJNwW6qx6rznfthZL4dg==
X-Google-Smtp-Source: APXvYqwgOe3MUxBsH7R5w7eRYl5HKQayA0O+rXnZufNmnV9p47SelUhlQDPEi/XUJpjmlwO/h690lu/eT4lLGTCPyRY=
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr6861888qvb.198.1575405820279; 
 Tue, 03 Dec 2019 12:43:40 -0800 (PST)
MIME-Version: 1.0
References: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
 <6b310509-212e-b887-5e3a-483a740d2d1c@ab3.no>
In-Reply-To: <6b310509-212e-b887-5e3a-483a740d2d1c@ab3.no>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 3 Dec 2019 12:43:28 -0800
Message-ID: <CAOReqxj3P4Kvf5YwTXoEzHd9hURBOP4ySEjURsO7LjK+vbpQTw@mail.gmail.com>
To: =?UTF-8?Q?Mads_L=C3=B8nsethagen?= <mads@ab3.no>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] Headset button mapping in the kernel
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

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMToxMyBBTSBNYWRzIEzDuG5zZXRoYWdlbiA8bWFkc0Bh
YjMubm8+IHdyb3RlOgoKPiBPbiAyNS4xMS4yMDE5IDIwOjI1LCBDdXJ0aXMgTWFsYWluZXkgd3Jv
dGU6Cj4gPiBIZWxsbyBBTFNBIERldnMsCj4gPgo+ID4gSSBhbSBsb29raW5nIHRvIGdldCBzb21l
IGZlZWRiYWNrL2lkZWFzIG9uIGEgcG9zc2libGUgY2hhbmdlIHRvCj4gPiBoZWFkc2V0IGJ1dHRv
biBtYXBwaW5nLiBMb2NhbGx5IHdlIGFyZSBjYXJyeWluZyBwYXRjaGVzIHRoYXQgaW1wbGVtZW50
Cj4gPiB0aGUgbWFwcGluZ3MgaW4gdGhlIG1hY2hpbmUgZHJpdmVyICh3aGljaCB3ZSB1bmRlcnN0
YW5kIHlvdSBkbyBub3QKPiA+IHdhbnQgdXBzdHJlYW0uKSBXZSBhcmUgbG9va2luZyB0byBzZWUg
aWYgd2UgY2FuIGFkZCBhIG5ldyBBUEkKPiA+IChzb21ldGhpbmcgbGlrZSBhIHN5c2ZzIHBhdGgg
cG90ZW50aWFsbHkpIHRvIGhhdmUgdXNlcnNwYWNlIHBhc3MgaW4KPiA+IHRoZSBtYXBwaW5nLCBp
ZiBpdCBjaG9vc2VzIHRvLCBzbyB0aGUgbWFwcGluZyBjYW4gc3RpbGwgYmUgZG9uZSBpbiB0aGUK
PiA+IGtlcm5lbC4gVGhhdCB3YXkgd2UgY2FuIGNhcnJ5IGp1c3QgdGhlIGNvbmZpZyBsb2NhbGx5
IGFuZCByZW1vdmUgc29tZQo+ID4gb2YgdGhlIGtlcm5lbCBwYXRjaGVzIHdlIGFyZSBjYXJyeWlu
ZyBsb2NhbGx5LiBUaGFua3MuCj4gPgo+ID4gQ3VydGlzCj4gPgo+Cj4gSGkgTWFkcywKCkFwb2xv
Z2llcywgYXBwYXJlbnRseSBteSBzcGFtIGZpbHRlciBncmFiYmVkIHlvdXIgZW1haWwgZnJvbSBt
ZSAoYmFjayB0bwphZGp1c3RpbmcgdGhlIHJ1bGVzLikKCj4gU29ycnkgZm9yIHRoZSB0b3AgcG9z
dGluZyBpbiBteSBsYXN0IG1haWwuCj4KPiBJIGp1c3Qgd29uZGVyZWQsIGRvIHRoaXMgaGF2ZSBh
bnl0aGluZyB0byBkbyB3aXRoIGhlYWRwaG9uZXMgdGhhdCBoYXMKPiBwaHlzaWNhbCBidXR0b25z
IG9uIHRoZSBoZWFkcGhvbmUgd2lyZSBpdHNlbGY/IEUuZyB0aGUgQm9zZSBRQzI1IGlzIGEKPiBw
YWlyIG9mIGhlYWRwaG9uZXMgdGhhdCBoYXMgZm91ciBidXR0b25zIG9uIHRoZSB3aXJlLCBhbmQg
YXMgZmFyIGFzIEkKPiBjYW4gc2VlIHRoZXJlJ3Mgbm8gd2F5IG9mIGdldHRpbmcgdGhvc2UgYnV0
dG9ucyB0byB3b3JrIGluIHZhbmlsbGEgTGludXgKPiBmb3Igbm93LCBidXQgaXQgd29ya3MgaW4g
QW5kcm9pZCBhbmQgV2luZG93cyAxMC4KPgoKTm8gdGhpcyBpcyByZWxhdGVkIHRvIENocm9tZU9T
IGRldmljZSBoZWFkc2V0IGJ1dHRvbiBtYXBwaW5nLCBidXQgaG9wZWZ1bGx5CmFuZHJvaWQgd2ls
bCBwaWNrIHRoaXMgdXAgYXMgd2VsbC4KWWVzLCB0aGVzZSBidXR0b25zIGFyZSB0aGUgb25lcyBJ
IGFtIGRpc2N1c3NpbmcuIEN1cnJlbnRseSBpbiBDaHJvbWVPUyAoYW5kCmxpa2VseSBpbiBBbmRy
b2lkIGFzIHdlbGwpIHdlIGNhcnJ5IHBhdGNoZXMgc3VjaCBhcwpodHRwczovL2Nocm9taXVtLXJl
dmlldy5nb29nbGVzb3VyY2UuY29tL2MvY2hyb21pdW1vcy90aGlyZF9wYXJ0eS9rZXJuZWwvKy8x
MDMzNDY1LwpJdCBhcHBlYXJzIHNvbWUgaGF2ZSBzdGFydGVkIGxhbmRpbmcKdXBzdHJlYW0gYWUw
OWE0NzgzYjljYWY5MzA3ZjMwM2VmMDM5ZjgyOTdjZTAzNzFmZSAoIkFTb0M6IEludGVsOiBIZWFk
c2V0CmJ1dHRvbiBzdXBwb3J0IGluIGthYnlsYWtlIG1hY2hpbmUgZHJpdmVyIikgYnV0IGl0IHdv
dWxkIGJlIGdyZWF0IGlmIHdlIGhhZAphIHdheSBmb3IgdXNlcnNwYWNlIHRvIGNvbmZpZ3VyZSB0
aGVzZSBidXR0b25zIHNpbWlsYXIgdG8gaG93IHdlIGhhbmRsZQpVQ01zLgoKSSBhc2tlZCBhYm91
dCB0aGlzIG9uIHRoaXMgbWFpbGluZyBsaXN0IGJlZm9yZVsxXSwgYmVjYXVzZSBJIGRvbid0IGV2
ZW4KPiBrbm93IHdoaWNoIGNvbXBvbmVudCBzaG91bGQgYmUgcmVzcG9uc2libGUgZm9yIGdlbmVy
YXRpbmcgYnV0dG9uIGV2ZW50cy4KPiBTaG91bGQgaXQgaGF2ZSBhbnl0aGluZyB0byBkbyB3aXRo
IGFsc2E/IElzIHRoZSBidXR0b24gbWFwcGluZyB5b3UncmUKPiBhc2tpbmcgYWJvdXQgaGVyZSBh
Ym91dCB0aGUgc2FtZSB0aGluZz8gRG8gYW55b25lIGtub3cgaG93IG9uZSBzaG91bGQgZ28KPiBh
Ym91dCBzdXBwb3J0aW5nIHRoZXNlIGtpbmQgb2YgYnV0dG9uIGV2ZW50cyBvbiBkZXNrdG9wIExp
bnV4Pwo+Cj4gVGhpcyBwcm9qZWN0IHdpbGwgaGF2ZSB0byBiZSB0aWVkIHRvIEFMU0EgaW4gc29t
ZSBmYXNoaW9uIChhcyB5b3UgY2FuIHNlZQppdCBpcyB0aWVkIHRvIHRoZSBqYWNrIHdoaWNoIGlz
IGFuIEFMU0EgY29uY2VwdCksIGJ1dCBJIHN0aWxsIGhhdmUgdG8gZG8KdGhlIGRlc2lnbiBkb2Nz
LiBJbiB0aGVvcnksIHRoaXMgd2lsbCBlbmFibGUgdmFuaWxsYSBsaW51eCB0byBiZSBjb25maWd1
cmVkCmZvciBhbnkgaGVhZHNldCBidXR0b25zIG9uY2UgZG9uZS4KCj4gLSBNYWRzCj4KPiBbMV0K
Pgo+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL3BpcGVybWFpbC9hbHNhLWRldmVs
LzIwMTktT2N0b2Jlci8xNTc3MDIuaHRtbAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
