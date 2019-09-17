Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C548B4AC9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 11:38:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F295166B;
	Tue, 17 Sep 2019 11:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F295166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568713135;
	bh=sLvfi/bTZB8hqwdBBGb1eAD+AM8D1U8KjlP50rwmZ8k=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UtOTDzaygce9Xo2SmMdsKBbb6RSBxSsgzp8zyUf9xQSm2Mg/cNuV9jjziX4xNfz1i
	 FQdNrfoGga8iG/uugMRGBg4Pn1Z9n0icQxb4v0F3XUBjd+c1oSJzwH7Iz8K5G9dGUG
	 unU7w1mb9O6cbhd+Bg+nw5l6xLzJVVYr2NGLDZiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55B9F802BD;
	Tue, 17 Sep 2019 11:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0285F80361; Tue, 17 Sep 2019 11:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2277EF801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 11:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2277EF801DA
Received: from mail-ot1-f71.google.com ([209.85.210.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1iA9ux-0006s0-S1
 for alsa-devel@alsa-project.org; Tue, 17 Sep 2019 09:37:04 +0000
Received: by mail-ot1-f71.google.com with SMTP id v51so1441236otb.5
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 02:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EIbijquzMtQBr8kkr1tOGfR+o3tuxAs9+vpk/bBLO3Q=;
 b=btD5sX0pkoL1QmcGrUaXS4KwYehKeLfD6AxpLFow8u6/x3DEcauOE6g4u1lB2RFQIz
 LwatgYe6MUgTAhUwl4txzfwxCp60Q18fKCiRdoNgFMfK+UMmZ844e0qIIh0qsSoqNNzr
 sSL7rZFz3SJobw/VFO1qh+clDq56uwNzvvR95wKmRM6U3atKAR/6ReAYQ6WRHPzyfheV
 jLjFrGtic8oDXEra9nU9kQ+62e621TVdyAnDJj2MztikfZsqBUnm1vAsVFFYOW4GzQWt
 QBgGJXGO86BPdZ/tizeZSyzh77uWW+6YgVgL7MqbnJzfNny9T8ne84t3K0RZ9qSmaAL+
 Xd8Q==
X-Gm-Message-State: APjAAAU1gTRzxdqcNs+gU3v3LhgfXT6GsBMMRkGbtdnhewAR0k0KOqco
 9cwB7qtVB+urUcM9mUsItky/pQSTo6AU/YW4rJ4VEDkeM+QtRyZfRxsbceN0KVi2XozMM7oX2Ey
 OoiDc9ZsEYjFykdrtJ84UvRoV6lOAXYeWq4pocdhCMYuQ0+4lBH7lERjI
X-Received: by 2002:a05:6830:2306:: with SMTP id
 u6mr2117287ote.0.1568713022838; 
 Tue, 17 Sep 2019 02:37:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwicLemrKh18hQPput+im8uQ+JqnJfWBVlweGggNmdSwQZv1LUrL1ZnqK0WlQoEBSHLeeBlQIMwrEGN5/Bcbgo=
X-Received: by 2002:a05:6830:2306:: with SMTP id
 u6mr2117270ote.0.1568713022472; 
 Tue, 17 Sep 2019 02:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190827134756.10807-2-kai.heng.feng@canonical.com>
 <20190828180128.1732-1-kai.heng.feng@canonical.com>
 <20190905213509.GI103977@google.com>
In-Reply-To: <20190905213509.GI103977@google.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 17 Sep 2019 11:36:51 +0200
Message-ID: <CAAd53p5LUat5MVkjbkk+st0TJA96y36keD898ZOepEdsnaiihw@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Linux PCI <linux-pci@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 2/2] ALSA: hda: Allow HDA to be runtime
 suspended when dGPU is not bound
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

SGkgQmpvcm4sCgpPbiBUaHUsIFNlcCA1LCAyMDE5IGF0IDExOjM1IFBNIEJqb3JuIEhlbGdhYXMg
PGhlbGdhYXNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyOSwgMjAxOSBhdCAw
MjowMToyOEFNICswODAwLCBLYWktSGVuZyBGZW5nIHdyb3RlOgo+ID4gSXQncyBhIGNvbW1vbiBw
cmFjdGljZSB0byBsZXQgZEdQVSB1bmJvdW5kIGFuZCB1c2UgUENJIHBsYXRmb3JtIHBvd2VyCj4g
PiBtYW5hZ2VtZW50IHRvIGRpc2FibGUgaXRzIHBvd2VyIHRocm91Z2ggX09GRiBtZXRob2Qgb2Yg
cG93ZXIgcmVzb3VyY2UsCj4gPiB3aGljaCBpcyBsaXN0ZWQgYnkgX1BSMy4KPiA+IFdoZW4gdGhl
IGRHUFUgY29tZXMgd2l0aCBhbiBIREEgZnVuY3Rpb24sIHRoZSBIREEgd29uJ3QgYmUgc3VzcGVu
ZGVkIGlmCj4gPiB0aGUgZEdQVSBpcyB1bmJvdW5kLCBzbyB0aGUgcG93ZXIgcmVzb3VyY2UgY2Fu
J3QgYmUgdHVybmVkIG9mZi4KPgo+IEknbSBub3QgaW52b2x2ZWQgaW4gYXBwbHlpbmcgdGhpcyBw
YXRjaCwgYnV0IGZyb20gdGhlIHBlYW51dCBnYWxsZXJ5Ogo+Cj4gICAtIFRoZSBhYm92ZSBsb29r
cyBsaWtlIGl0IG1pZ2h0IGJlIHR3byBwYXJhZ3JhcGhzIG1pc3NpbmcgYSBibGFuawo+ICAgICBs
aW5lIGJldHdlZW4/ICBPciBtYXliZSBpdCdzIG9uZSBwYXJhZ3JhcGggdGhhdCBuZWVkcyB0byBi
ZQo+ICAgICByZXdyYXBwZWQ/CgpJIHRoaW5rIGl0IGNhbiBiZSBib3RoLiBJJ2xsIHJlcGhyYXNl
IGl0LgoKPgo+ICAgLSBJIGNhbid0IHBhcnNlIHRoZSBmaXJzdCBzZW50ZW5jZS4gIEkgZ3Vlc3Mg
ImRHUFUiIGFuZCAiSERBIiBhcmUKPiAgICAgaGFyZHdhcmUgZGV2aWNlcywgYnV0IEkgZG9uJ3Qg
a25vdyB3aGF0ICJ1bmJvdW5kIiBtZWFucy4gIElzIHRoYXQKPiAgICAgc29tZXRoaW5nIHRvIGRv
IHdpdGggYSBkcml2ZXIgYmVpbmcgYm91bmQgdG8gdGhlIGRHUFU/ICBPciBpcyBpdAo+ICAgICBz
b21lIGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgZEdQVSBhbmQgdGhlIEhEQT8KClllcywgInVuYm91
bmQiIGluIHRoaXMgY29udGV4dCBtZWFucyB0aGUgZEdQVSBpc24ndCBib3VuZCB0byBhIGRyaXZl
ci4KCj4KPiAgIC0gIlBDSSBwbGF0Zm9ybSBwb3dlciBtYW5hZ2VtZW50IiBpcyBzdGlsbCBjb25m
dXNpbmcgLS0gSSB0aGluayB3ZQo+ICAgICBlaXRoZXIgaGF2ZSAiUENJIHBvd2VyIG1hbmFnZW1l
bnQiIHRoYXQgdXNlcyB0aGUgUENJIFBNIENhcGFiaWxpdHkKPiAgICAgKGkuZS4sIHdyaXRpbmcg
UENJX1BNX0NUUkwgYXMgaW4gcGNpX3Jhd19zZXRfcG93ZXJfc3RhdGUoKSkgT1Igd2UKPiAgICAg
aGF2ZSAicGxhdGZvcm0gcG93ZXIgbWFuYWdlbWVudCIgdGhhdCB1c2VzIHNvbWUgb3RoZXIgbWV0
aG9kLAo+ICAgICB0eXBpY2FsbHkgQUNQSS4gIFNpbmNlIHlvdSByZWZlciB0byBfT0ZGIGFuZCBf
UFIzLCBJIGd1ZXNzIHlvdSdyZQo+ICAgICByZWZlcnJpbmcgdG8gcGxhdGZvcm0gcG93ZXIgbWFu
YWdlbWVudCBoZXJlLgoKWWVzLCBJJ2xsIG1ha2UgaXQgY2xlYXJlciBpbiBuZXh0IHZlcnNpb24u
IEl0J3MgaW5kZWVkIHJlZmVycmluZyB0bwpwbGF0Zm9ybSBwb3dlciBtYW5hZ2VtZW50LgoKPgo+
ICAgLSAiSXQncyBjb21tb24gcHJhY3RpY2UgdG8gbGV0IGRHUFUgdW5ib3VuZCIgLS0gZG9lcyB0
aGF0IHJlZmVyIHRvCj4gICAgIHNvbWUgcHJvZ3JhbW1pbmcgdGVjaG5pcXVlIGNvbW1vbiBpbiBk
cml2ZXJzLCBvciBzb21lIHVzZXItbGV2ZWwKPiAgICAgdGhpbmcgbGlrZSB1bmxvYWRpbmcgYSBk
cml2ZXIsIG9yIC4uLj8gIE15IGd1ZXNzIGlzIGl0IHByb2JhYmx5Cj4gICAgIG1lYW5zICJ1bmJp
bmQgdGhlIGRyaXZlciBmcm9tIHRoZSBkR1BVIiBidXQgSSBzdGlsbCBkb24ndCBrbm93Cj4gICAg
IHdoYXQgbWFrZXMgaXQgY29tbW9uIHByYWN0aWNlLgoKWWVzIGl0IG1lYW5zIGtlZXAgZHJpdmVy
IGZvciBkR1BVIHVubG9hZGVkLiBJdCdzIGEgY29tbW9uIHByYWN0aWNlCnNpbmNlIHRoZSBwcm9w
cmlldGFyeSBudmlkaWEua28gZG9lc24ndCBzdXBwb3J0IHJ1bnRpbWUgcG93ZXIKbWFuYWdlbWVu
dCwgc28gd2hlbiB1c2VycyBhcmUgdXNpbmcgaW50ZWdyYXRlZCBHUFUsIHVubG9hZCB0aGUgZEdQ
VQpkcml2ZXIgY2FuIG1ha2UgUENJIGNvcmUgdXNlIHBsYXRmb3JtIHBvd2VyIG1hbmFnZW1lbnQg
dG8gZGlzYWJsZSB0aGUKcG93ZXIgc291cmNlIHRvIHNhdmUgcG93ZXIuCgo+Cj4gVGhpcyBwcm9i
YWJseSBhbGwgbWFrZXMgcGVyZmVjdCBzZW5zZSB0byB0aGUgZ3JhcGhpY3MgY29nbm9zY2VudGks
IGJ1dAo+IGZvciB0aGUgcmVzdCBvZiB1cyB0aGVyZSBhcmUgYSBsb3Qgb2YgZG90cyBoZXJlIHRo
YXQgYXJlIG5vdAo+IGNvbm5lY3RlZC4KCldpbGwgc2VuZCBhIHYyIHdpdGggY2xlYXJlciBkZXNj
cmlwdGlvbi4KS2FpLUhlbmcKCj4KPiA+IENvbW1pdCAzN2EzYTk4ZWY2MDEgKCJBTFNBOiBoZGEg
LSBFbmFibGUgcnVudGltZSBQTSBvbmx5IGZvcgo+ID4gZGlzY3JldGUgR1BVIikgb25seSBhbGxv
d3MgSERBIHRvIGJlIHJ1bnRpbWUtc3VzcGVuZGVkIG9uY2UgR1BVIGlzCj4gPiBib3VuZCwgdG8g
a2VlcCBBUFUncyBIREEgd29ya2luZy4KPiA+Cj4gPiBIb3dldmVyLCBIREEgb24gZEdQVSBpc24n
dCB0aGF0IHVzZWZ1bCBpZiBkR1BVIGlzIHVuYm91bmQuIFNvIGxldCdzCj4gPiByZWxheCB0aGUg
cnVudGltZSBzdXNwZW5kIHJlcXVpcmVtZW50IGZvciBkR1BVJ3MgSERBIGZ1bmN0aW9uLCB0byBz
YXZlCj4gPiBsb3RzIG9mIHBvd2VyLgo+ID4KPiA+IEJ1Z0xpbms6IGh0dHBzOi8vYnVncy5sYXVu
Y2hwYWQubmV0L2J1Z3MvMTg0MDgzNQo+ID4gRml4ZXM6IGI1MTZlYTU4NmQ3MSAoIlBDSTogRW5h
YmxlIE5WSURJQSBIREEgY29udHJvbGxlcnPigJ0pCj4gPiBTaWduZWQtb2ZmLWJ5OiBLYWktSGVu
ZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Cj4gPiAtLS0KPiA+IHYyOgo+ID4g
LSBDaGFuZ2Ugd29yZGluZy4KPiA+IC0gUmViYXNlIHRvIFRpd2FpJ3MgYnJhbmNoLgo+ID4KPiA+
ICBzb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jIHwgNiArKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Nv
dW5kL3BjaS9oZGEvaGRhX2ludGVsLmMgYi9zb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jCj4gPiBp
bmRleCA5MWU3MWJlNDJmYTQuLmMzNjU0ZDIyNzk1YSAxMDA2NDQKPiA+IC0tLSBhL3NvdW5kL3Bj
aS9oZGEvaGRhX2ludGVsLmMKPiA+ICsrKyBiL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKPiA+
IEBAIC0xMjg0LDcgKzEyODQsMTEgQEAgc3RhdGljIHZvaWQgaW5pdF92Z2Ffc3dpdGNoZXJvbyhz
dHJ1Y3QgYXp4ICpjaGlwKQo+ID4gICAgICAgICAgICAgICBkZXZfaW5mbyhjaGlwLT5jYXJkLT5k
ZXYsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICJIYW5kbGUgdmdhX3N3aXRjaGVyb28gYXVk
aW8gY2xpZW50XG4iKTsKPiA+ICAgICAgICAgICAgICAgaGRhLT51c2VfdmdhX3N3aXRjaGVyb28g
PSAxOwo+ID4gLSAgICAgICAgICAgICBjaGlwLT5idXMua2VlcF9wb3dlciA9IDE7IC8qIGNsZWFy
ZWQgaW4gZWl0aGVyIGdwdV9ib3VuZCBvcCBvciBjb2RlYyBwcm9iZSAqLwo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICAvKiBjbGVhcmVkIGluIGVpdGhlciBncHVfYm91bmQgb3Agb3IgY29kZWMgcHJv
YmUsIG9yIHdoZW4gaXRzCj4gPiArICAgICAgICAgICAgICAqIHJvb3QgcG9ydCBoYXMgX1BSMyAo
aS5lLiBkR1BVKS4KPiA+ICsgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgIGNoaXAt
PmJ1cy5rZWVwX3Bvd2VyID0gIXBjaV9wcjNfcHJlc2VudChwKTsKPiA+ICAgICAgICAgICAgICAg
Y2hpcC0+ZHJpdmVyX2NhcHMgfD0gQVpYX0RDQVBTX1BNX1JVTlRJTUU7Cj4gPiAgICAgICAgICAg
ICAgIHBjaV9kZXZfcHV0KHApOwo+ID4gICAgICAgfQo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
