Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D94A2DC32
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 13:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8BE416E5;
	Wed, 29 May 2019 13:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8BE416E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559130720;
	bh=RR07TjWsMtuhdQhOZlSg97Gsxh7xIdvNkpVKS/5V1R4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJIFVZyO1gjTUs1FkmTHwWKHt959ahTwsQW5jxaYzsgWMUadAnRPdUw9K4xLM9MSq
	 WC360Rb6F2wqrZ5jIdP9ZSn0xl6azTpmcaS5B8221daoXIId8uSZDfjToon1iJxyxZ
	 0Kq/Q70BLVWI19+oI/FVipvRq7c1ZnpPuKPKJP2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6626FF896E0;
	Wed, 29 May 2019 13:50:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3412F896E4; Wed, 29 May 2019 13:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F628F8065A
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 13:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F628F8065A
Received: by mail-qk1-f195.google.com with SMTP id d15so1215805qkl.4
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 04:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XHkHtWbVB+TvovZz7oPuGTHVIANZlI/EFu3bjVNoQjY=;
 b=dKLLWl/dWOdCKcod0ZF0UAqmDEd5c8u/IWJJ6Z+dokgJClszRnfDb3d2t7T6xgYKUX
 pOQTA4k5/gF9vw7WHzEYlPrHR7p4AEWvDqfVAM+iLFn6u6fpKHKUWQxX/VpVaEZNhDBE
 UNiy9307u+7r3DnSb7vBh92RcxeShND1EvE6WgJUhpWBHNO5/GCL53Ws5YvClTp8d8px
 nH03rdzyBxlxbCnIIGsuzTmw+Y662m3jP1ki6UnO0nHMoqWo6+/7xSQu83mf80+zO9zF
 f0g9tjXPUR8Hn0iyvQ5KGglD5rkx2fIM9y1eptT5xdQ4Nbr47aoe/NGgiiCEzN/f2tz8
 5tfQ==
X-Gm-Message-State: APjAAAWGFebJOHzjziCZF/ASnKi2JjlsQmve1Ypl70FJ0OwruoNEm6t6
 /xhxkz8jU8Pc/LPg1PGGa2soTTTYYlY8y+eYiEI=
X-Google-Smtp-Source: APXvYqwIv+NsvZQNU3e96RUtDw8gxMBWuYuQiiajDZ8QFDNiZsSZdie+JkLoe/OtQ843s/6drkk2QB+tL4D41jq4Vho=
X-Received: by 2002:a37:bb85:: with SMTP id
 l127mr27919584qkf.285.1559130609026; 
 Wed, 29 May 2019 04:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-3-geert@linux-m68k.org>
In-Reply-To: <20190528142424.19626-3-geert@linux-m68k.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 May 2019 13:49:52 +0200
Message-ID: <CAK8P3a1wTED5Aet_9AjY9VFFrutkV2xK6C13vroTLd0vpcoo9w@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-block <linux-block@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Networking <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 Jamal Hadi Salim <jhs@mojatatu.com>, David Howells <dhowells@redhat.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Jiri Pirko <jiri@mellanox.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Joe Perches <joe@perches.com>, "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH 2/5] rxrpc: Fix uninitialized error code in
	rxrpc_send_data_packet()
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNDoyNCBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IFdpdGggZ2NjIDQuMToKPgo+ICAgICBuZXQvcnhy
cGMvb3V0cHV0LmM6IEluIGZ1bmN0aW9uIOKAmHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXTigJk6Cj4g
ICAgIG5ldC9yeHJwYy9vdXRwdXQuYzozMzg6IHdhcm5pbmc6IOKAmHJldOKAmSBtYXkgYmUgdXNl
ZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KPgo+IEluZGVlZCwgaWYgdGhlIGZpcnN0
IGp1bXAgdG8gdGhlIHNlbmRfZnJhZ21lbnRhYmxlIGxhYmVsIGlzIG1hZGUsIGFuZAo+IHRoZSBh
ZGRyZXNzIGZhbWlseSBpcyBub3QgaGFuZGxlZCBpbiB0aGUgc3dpdGNoKCkgc3RhdGVtZW50LCBy
ZXQgd2lsbCBiZQo+IHVzZWQgdW5pbml0aWFsaXplZC4KPgo+IEZpeCB0aGlzIGJ5IGluaXRpYWxp
emluZyBlcnIgdG8gemVybyBiZWZvcmUgdGhlIGp1bXAsIGxpa2UgaXMgYWxyZWFkeQo+IGRvbmUg
Zm9yIHRoZSBqdW1wIHRvIHRoZSBkb25lIGxhYmVsLgo+Cj4gRml4ZXM6IDVhOTI0Yjg5NTFmODM1
YjUgKCJyeHJwYzogRG9uJ3Qgc3RvcmUgdGhlIHJ4cnBjIGhlYWRlciBpbiB0aGUgVHggcXVldWUg
c2tfYnVmZnMiKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+Cj4gLS0tCj4gV2hpbGUgdGhpcyBpcyBub3QgYSByZWFsIGZhbHNlLXBvc2l0
aXZlLCBJIGJlbGlldmUgaXQgY2Fubm90IGNhdXNlIGhhcm0KPiBpbiBwcmFjdGljZSwgYXMgQUZf
UlhSUEMgY2Fubm90IGJlIHVzZWQgd2l0aCBvdGhlciB0cmFuc3BvcnQgZmFtaWxpZXMKPiB0aGFu
IElQdjQgYW5kIElQdjYuCgpUaGlzIGxvb2tzIGxpa2UgYSB2YXJpYW50IG9mIHRoZSBpbmZhbW91
cyBidWcKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTg1MDEK
CldoYXQgSSBkb24ndCB1bmRlcnN0YW5kIGlzIHdoeSBjbGFuZyBmYWlscyB0byB3YXJuIGFib3V0
IGl0IHdpdGgKLVdzb21ldGltZXMtdW5pbml0aWFsaXplZC4KKGNjIGNsYW5nLWJ1aWx0LWxpbnV4
IG1haWxpbmcgbGlzdCkuCgogICAgICBBcm5kCgo+ICBuZXQvcnhycGMvb3V0cHV0LmMgfCA0ICsr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL25ldC9yeHJwYy9vdXRwdXQuYyBiL25ldC9yeHJwYy9vdXRwdXQuYwo+IGlu
ZGV4IDAwNGM3NjJjMmU4ZDA2M2MuLjE0NzNkNzc0ZDY3MTAwYzUgMTAwNjQ0Cj4gLS0tIGEvbmV0
L3J4cnBjL291dHB1dC5jCj4gKysrIGIvbmV0L3J4cnBjL291dHB1dC5jCj4gQEAgLTQwMyw4ICs0
MDMsMTAgQEAgaW50IHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQoc3RydWN0IHJ4cnBjX2NhbGwgKmNh
bGwsIHN0cnVjdCBza19idWZmICpza2IsCj4KPiAgICAgICAgIC8qIHNlbmQgdGhlIHBhY2tldCB3
aXRoIHRoZSBkb24ndCBmcmFnbWVudCBiaXQgc2V0IGlmIHdlIGN1cnJlbnRseQo+ICAgICAgICAg
ICogdGhpbmsgaXQncyBzbWFsbCBlbm91Z2ggKi8KPiAtICAgICAgIGlmIChpb3ZbMV0uaW92X2xl
biA+PSBjYWxsLT5wZWVyLT5tYXhkYXRhKQo+ICsgICAgICAgaWYgKGlvdlsxXS5pb3ZfbGVuID49
IGNhbGwtPnBlZXItPm1heGRhdGEpIHsKPiArICAgICAgICAgICAgICAgcmV0ID0gMDsKPiAgICAg
ICAgICAgICAgICAgZ290byBzZW5kX2ZyYWdtZW50YWJsZTsKPiArICAgICAgIH0KPgo+ICAgICAg
ICAgZG93bl9yZWFkKCZjb25uLT5wYXJhbXMubG9jYWwtPmRlZnJhZ19zZW0pOwo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
