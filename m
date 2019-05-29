Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D52D779
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 10:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EA05169C;
	Wed, 29 May 2019 10:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EA05169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559117688;
	bh=+62ckRCn046fYD+jKp8qh9NqYsER9E19OOLQQ8uF0YE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V7cZvttqo+fGbAYggKj1rAKxb3i3WExBXoPh5RNlJJPiMIz9vU3se41WD+wwEpA9B
	 H97sZZrVXfHPdkw7lL5g8aeir+oW1vj3AzP0fmBZuCJD+N5PMLZP8SxKTuUrwt2w99
	 gE5BMnjPLqpGSl+KUg+CjhLRcyxQBOIqiO2kmnrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C60BF896E4;
	Wed, 29 May 2019 10:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B52FF896E4; Wed, 29 May 2019 10:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 807CDF806E5
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 10:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 807CDF806E5
Received: by mail-lj1-f194.google.com with SMTP id z5so1479627lji.10
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 01:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a0don3TTA7MOPbrbjinj58BbWNizus2TjnpcpEnZ6h0=;
 b=LrwLRTLE38wyIqwA/6wExIQ47C1+PmT2rVAd1nm+NhDVS6is9MW9y4e7qEDiN8MEz3
 DEaHcqpA6FM2KWZJFTR1WaK3UfQ/s+oHlx0AaQOc8d7VU2gNzd3lBHHwJ8as/Fos+h17
 nPdXYZEB2sGIxYT0IiBOqKhhadEinUgyy4xricS4oA2HaCVbViW5VA1k+EbjDd5hS3um
 r0vhbMLHjOyD6+lE++ZbFNnOa89U853hAr6kegXCPzlXzAqoy9w1VMBTH2thqzQT4r2g
 wY4CEuVCgs4b7Yxyo2Pn0ZLFxuikrIURajoMpX7bpZtjrFmKI7mt4siC0x9FwBrfSM02
 jVmQ==
X-Gm-Message-State: APjAAAVNNZuEspgXhGXfZJCBVBNEUKW2c17Cf0uIbSl/N/7wUOPxrPeq
 6x6EbVPCzl80x6+g0aPPLQSkECu0610eFclp2+4=
X-Google-Smtp-Source: APXvYqz+i9F0zk6NyMyWBavDhJq5T11k3LBK2MrgZ55YQ542TgvrWEs81N68J92wCzTKGRLDj79yXuvelmq9XTmatnU=
X-Received: by 2002:a05:651c:150:: with SMTP id
 c16mr67589499ljd.65.1559117578478; 
 Wed, 29 May 2019 01:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-2-geert@linux-m68k.org>
 <4b666e32-04b6-228a-691d-0745fa48a57f@lightnvm.io>
In-Reply-To: <4b666e32-04b6-228a-691d-0745fa48a57f@lightnvm.io>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2019 10:12:45 +0200
Message-ID: <CAMuHMdVtM9NWSXbWE=XKOt3fiQdjWaDvLiYdXbbri-buDn7jpg@mail.gmail.com>
To: =?UTF-8?Q?Matias_Bj=C3=B8rling?= <mb@lightnvm.io>
Cc: linux-block@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 David Howells <dhowells@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/5] lightnvm: Fix uninitialized pointer in
	nvm_remove_tgt()
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

SGkgTWF0aWFzLAoKT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6MDggQU0gTWF0aWFzIEJqw7hy
bGluZyA8bWJAbGlnaHRudm0uaW8+IHdyb3RlOgo+IE9uIDUvMjgvMTkgNDoyNCBQTSwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gV2l0aCBnY2MgNC4xOgo+ID4KPiA+ICAgICAgZHJpdmVy
cy9saWdodG52bS9jb3JlLmM6IEluIGZ1bmN0aW9uIOKAmG52bV9yZW1vdmVfdGd04oCZOgo+ID4g
ICAgICBkcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYzo1MTA6IHdhcm5pbmc6IOKAmHTigJkgaXMgdXNl
ZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KPiA+Cj4gPiBJbmRlZWQsIGlmIG5vIE5W
TSBkZXZpY2VzIGhhdmUgYmVlbiByZWdpc3RlcmVkLCB0IHdpbGwgYmUgYW4KPiA+IHVuaW5pdGlh
bGl6ZWQgcG9pbnRlciwgYW5kIG1heSBiZSBkZXJlZmVyZW5jZWQgbGF0ZXIuICBBIGNhbGwgdG8K
PiA+IG52bV9yZW1vdmVfdGd0KCkgY2FuIGJlIHRyaWdnZXJlZCBmcm9tIHVzZXJzcGFjZSBieSBp
c3N1aW5nIHRoZQo+ID4gTlZNX0RFVl9SRU1PVkUgaW9jdGwgb24gdGhlIGxpZ2h0bnZtIGNvbnRy
b2wgZGV2aWNlLgo+ID4KPiA+IEZpeCB0aGlzIGJ5IHByZWluaXRpYWxpemluZyB0IHRvIE5VTEwu
Cj4gPgo+ID4gRml4ZXM6IDg0M2YyZWRiZGRlMDg1YjQgKCJsaWdodG52bTogZG8gbm90IHJlbW92
ZSBpbnN0YW5jZSB1bmRlciBnbG9iYWwgbG9jayIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
bGlnaHRudm0vY29yZS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9saWdodG52bS9j
b3JlLmMgYi9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYwo+ID4gaW5kZXggMGRmNzQ1NDgzMmVmZTA4
Mi4uYWEwMTdmNDhlYjhjNTg4YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbGlnaHRudm0vY29y
ZS5jCj4gPiArKysgYi9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYwo+ID4gQEAgLTQ5Miw3ICs0OTIs
NyBAQCBzdGF0aWMgdm9pZCBfX252bV9yZW1vdmVfdGFyZ2V0KHN0cnVjdCBudm1fdGFyZ2V0ICp0
LCBib29sIGdyYWNlZnVsKQo+ID4gICAgKi8KPiA+ICAgc3RhdGljIGludCBudm1fcmVtb3ZlX3Rn
dChzdHJ1Y3QgbnZtX2lvY3RsX3JlbW92ZSAqcmVtb3ZlKQo+ID4gICB7Cj4gPiAtICAgICBzdHJ1
Y3QgbnZtX3RhcmdldCAqdDsKPiA+ICsgICAgIHN0cnVjdCBudm1fdGFyZ2V0ICp0ID0gTlVMTDsK
PiA+ICAgICAgIHN0cnVjdCBudm1fZGV2ICpkZXY7Cj4gPgo+ID4gICAgICAgZG93bl9yZWFkKCZu
dm1fbG9jayk7Cj4gPgo+Cj4gVGhhbmtzIEdlZXJ0LiBXb3VsZCB5b3UgbGlrZSBtZSB0byBjYXJy
eSB0aGUgcGF0Y2g/CgpZZXMgcGxlYXNlLiBUaGFua3MhCgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
