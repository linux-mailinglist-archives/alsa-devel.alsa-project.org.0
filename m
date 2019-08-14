Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD668CEFE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 11:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B681673;
	Wed, 14 Aug 2019 11:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B681673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565773542;
	bh=8z9BE2cDD2LxNYwfp5kAiykragmsR11gCJvISqyKpDk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iEKrgl3M4hX5wLXA8eJg2JXjef0pv0dkIpD0pWyo/r2Pj8asyGcTQBw10DP0y7CEE
	 zQ1uJeO+7puFqlamlGTUalc71O8NZ5kZ95pZBaDlMG85G5a3pl3GrMII5CEJo3BIf1
	 aeO/F1RXBZrRvBnWAUUP6lrAAfN57SPwTaRNNBcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70BC2F80446;
	Wed, 14 Aug 2019 11:03:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB5D1F8048D; Wed, 14 Aug 2019 11:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F741F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 11:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F741F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q//okcr2"
Received: by mail-lj1-x242.google.com with SMTP id l14so1425310ljj.9
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GeeM10QL+PlKdTTdajiUgNYKAysRWONknFw7/BXOzz8=;
 b=Q//okcr2qvIkPG7ZD9aY3pbMgMVby5WdUQloYY1Xo43qDpVOucUGR0elIoYXwKkL9j
 8Yktm6lev1ny9/U/0FYHfCO/3YeyggCJJzF/4LZfk1HfL3nk6YnK4StBEiSyCzyl3bGh
 cDj3CSfET2Z0euj5yT286HsXxwzXvdcRjXdJyCIKQ/lh+bM+Rj3onYGoqU3ZsQGka74/
 UqY4mCmgxQGxA7UavNxwPWkP38MG7iQkcoF4K1WvL3s2HogOD4zwT6f2ZKZMLZAkISIs
 2nl0+9XRC+noMVbCpLsadUjWuCYTIAYTcpwLDMS23T5ypWwzcTE7KlIfHoTdqxJW4gsF
 gLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GeeM10QL+PlKdTTdajiUgNYKAysRWONknFw7/BXOzz8=;
 b=l6eCTwoEAffKMqtGQefBZubZZ9ggbwM23tew5wkDn5UeSDgChryTsS6TtorgO7XwAQ
 rq+artPCencIjXmKfNKSU0kEVd9CdQek8K4u5SKu3nu/3a13m9JxciAFqdJCa3yrPBoC
 qSBH7JpcfgvlUEpgEKqKXqxgOh+RKu4zb34LacxG92Su+MeEC7pv11ld9hveB4gtIDej
 7sIc9hODd/mo6UOgJb7pcEgdE5gp49wYfnIwtyHJmVc6MKUuBE7LGMSnYunpUntTt7QJ
 v/vaT8QBIvvIB/vXRKhKe0shnuWMOuPyQPQMlWTf/CDY3XhjQ2p46urcF7KgT76JBJHS
 vMNg==
X-Gm-Message-State: APjAAAXSM8rXIwx+OsjsH65VK06fqMJo/tH7RyHk6MMqmfr6T5cZbIHQ
 V8oTgRhrbCJvk2POn+7VVC00vzKyEfAMk1ruUiiYBA==
X-Google-Smtp-Source: APXvYqxZs4VpjO4Q/Y9NDFC8T6oU4FSnVEUWvGpuAB/Ra4r8IZP549jer0SM/xv1p3Gtrkbn3Q4Bb+PJb1sRPXpCRv8=
X-Received: by 2002:a2e:720c:: with SMTP id n12mr656662ljc.53.1565773430959;
 Wed, 14 Aug 2019 02:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-15-codekipper@gmail.com>
 <4297791.2mJM636zur@jernej-laptop>
In-Reply-To: <4297791.2mJM636zur@jernej-laptop>
From: Code Kipper <codekipper@gmail.com>
Date: Wed, 14 Aug 2019 11:03:39 +0200
Message-ID: <CAEKpxBmsLKt_mKFC3=wR9n+hK9njhh7drLV2EMrzKahv=s4dTw@mail.gmail.com>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 14/15] ASoc: sun4i-i2s:
 Add 20, 24 and 32 bit support
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

T24gV2VkLCAxNCBBdWcgMjAxOSBhdCAxMDoyOCwgSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2ty
YWJlY0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkhCj4KPiBEbmUgc3JlZGEsIDE0LiBhdmd1c3Qg
MjAxOSBvYiAwODowODo1MyBDRVNUIGplIGNvZGVraXBwZXJAZ21haWwuY29tCj4gbmFwaXNhbChh
KToKPiA+IEZyb206IE1hcmN1cyBDb29wZXIgPGNvZGVraXBwZXJAZ21haWwuY29tPgo+ID4KPiA+
IEV4dGVuZCB0aGUgZnVuY3Rpb25hbGl0eSBvZiB0aGUgZHJpdmVyIHRvIGluY2x1ZGUgc3VwcG9y
dCBvZiAyMCBhbmQKPiA+IDI0IGJpdHMgcGVyIHNhbXBsZSBmb3IgdGhlIGVhcmxpZXIgU29Dcy4K
PiA+Cj4gPiBOZXdlciBTb0NzIGNhbiBhbHNvIGhhbmRsZSAzMmJpdCBzYW1wbGVzLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBDb29wZXIgPGNvZGVraXBwZXJAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgc291bmQvc29jL3N1bnhpL3N1bjRpLWkycy5jIHwgMjEgKysrKysrKysrKysrKysr
KysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdW54aS9zdW40aS1pMnMuYyBiL3Nv
dW5kL3NvYy9zdW54aS9zdW40aS1pMnMuYwo+ID4gaW5kZXggYTcxOTY5MTY3MDUzLi5kM2M4Nzg5
ZjcwYmIgMTAwNjQ0Cj4gPiAtLS0gYS9zb3VuZC9zb2Mvc3VueGkvc3VuNGktaTJzLmMKPiA+ICsr
KyBiL3NvdW5kL3NvYy9zdW54aS9zdW40aS1pMnMuYwo+ID4gQEAgLTY5MCw2ICs2OTAsMTEgQEAg
c3RhdGljIGludCBzdW40aV9pMnNfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbQo+
ID4gKnN1YnN0cmVhbSwgY2FzZSAxNjoKPiA+ICAgICAgICAgICAgICAgd2lkdGggPSBETUFfU0xB
VkVfQlVTV0lEVEhfMl9CWVRFUzsKPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICBj
YXNlIDIwOgo+ID4gKyAgICAgY2FzZSAyNDoKPiA+ICsgICAgIGNhc2UgMzI6Cj4KPiBwYXJhbXNf
cGh5c2ljYWxfd2lkdGgoKSByZXR1cm5zIDMyIGFsc28gZm9yIDIwIGFuZCAyNC1iaXQgZm9ybWF0
cywgc28gZHJvcCAyMAo+IGFuZCAyNC4KQUNLCj4KPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVqCj4K
PiA+ICsgICAgICAgICAgICAgd2lkdGggPSBETUFfU0xBVkVfQlVTV0lEVEhfNF9CWVRFUzsKPiA+
ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICBkZWZhdWx0Ogo+ID4gICAgICAgICAgICAg
ICBkZXZfZXJyKGRhaS0+ZGV2LCAiVW5zdXBwb3J0ZWQgcGh5c2ljYWwgc2FtcGxlIHdpZHRoOgo+
ICVkXG4iLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHBhcmFtc19waHlzaWNhbF93aWR0aChw
YXJhbXMpKTsKPiA+IEBAIC0xMDE1LDYgKzEwMjAsMTMgQEAgc3RhdGljIGludCBzdW40aV9pMnNf
ZGFpX3Byb2JlKHN0cnVjdCBzbmRfc29jX2RhaQo+ID4gKmRhaSkgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4KPiA+ICsjZGVmaW5lIFNVTjRJX0ZPUk1BVFMgICAgICAgIChTTkRSVl9QQ01fRk1UQklUX1Mx
Nl9MRSB8IFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0ZNVEJJVF9TMjBf
TEUgfCBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xF
KQo+ID4gKwo+ID4gKyNkZWZpbmUgU1VOOElfRk9STUFUUyAgICAgICAgKFNVTjRJX0ZPUk1BVFMg
fCBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFKQo+
ID4gKwo+ID4gIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIHN1bjRpX2kyc19kYWkg
PSB7Cj4gPiAgICAgICAucHJvYmUgPSBzdW40aV9pMnNfZGFpX3Byb2JlLAo+ID4gICAgICAgLmNh
cHR1cmUgPSB7Cj4gPiBAQCAtMTAyMiwxNCArMTAzNCwxNCBAQCBzdGF0aWMgc3RydWN0IHNuZF9z
b2NfZGFpX2RyaXZlciBzdW40aV9pMnNfZGFpID0gewo+ID4gICAgICAgICAgICAgICAuY2hhbm5l
bHNfbWluID0gMiwKPiA+ICAgICAgICAgICAgICAgLmNoYW5uZWxzX21heCA9IDIsCj4gPiAgICAg
ICAgICAgICAgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfMTkyMDAwLAo+ID4gLSAgICAg
ICAgICAgICAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+ID4gKyAgICAgICAg
ICAgICAuZm9ybWF0cyA9IFNVTjRJX0ZPUk1BVFMsCj4gPiAgICAgICB9LAo+ID4gICAgICAgLnBs
YXliYWNrID0gewo+ID4gICAgICAgICAgICAgICAuc3RyZWFtX25hbWUgPSAiUGxheWJhY2siLAo+
ID4gICAgICAgICAgICAgICAuY2hhbm5lbHNfbWluID0gMiwKPiA+ICAgICAgICAgICAgICAgLmNo
YW5uZWxzX21heCA9IDIsCj4gPiAgICAgICAgICAgICAgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRF
XzgwMDBfMTkyMDAwLAo+ID4gLSAgICAgICAgICAgICAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRC
SVRfUzE2X0xFLAo+ID4gKyAgICAgICAgICAgICAuZm9ybWF0cyA9IFNVTjRJX0ZPUk1BVFMsCj4g
PiAgICAgICB9LAo+ID4gICAgICAgLm9wcyA9ICZzdW40aV9pMnNfZGFpX29wcywKPiA+ICAgICAg
IC5zeW1tZXRyaWNfcmF0ZXMgPSAxLAo+ID4gQEAgLTE1MDUsNiArMTUxNywxMSBAQCBzdGF0aWMg
aW50IHN1bjRpX2kyc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4gPiAqcGRldikgZ290
byBlcnJfcG1fZGlzYWJsZTsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBpZiAoaTJzLT52YXJp
YW50LT5oYXNfZm10X3NldF9scmNrX3BlcmlvZCkgewo+ID4gKyAgICAgICAgICAgICBzb2NfZGFp
LT5wbGF5YmFjay5mb3JtYXRzID0gU1VOOElfRk9STUFUUzsKPiA+ICsgICAgICAgICAgICAgc29j
X2RhaS0+Y2FwdHVyZS5mb3JtYXRzID0gU1VOOElfRk9STUFUUzsKPiA+ICsgICAgIH0KPiA+ICsK
PiA+ICAgICAgIGlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJhbGx3aW5uZXIscGxheWJhY2stY2hh
bm5lbHMiLAo+ICZ2YWwpKSB7Cj4gPiAgICAgICAgICAgICAgIGlmICh2YWwgPj0gMiAmJiB2YWwg
PD0gOCkKPgo+Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
