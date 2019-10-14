Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE876DA545
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 08:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8629F6;
	Thu, 17 Oct 2019 08:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8629F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571292243;
	bh=8AHoOhtWC4GOFBiMHNlsnUsj2I11f+pk2Uzve2aguAg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QsCy4xbbEcaHmeITsAqtp8I8VY1Oa4Vif8NhvIXB63nlzYuoIQMEH/CAQFGzlMiNU
	 jFHcSOEHeA0uSaBZ3tgFdD7WaJmpPOkvij39/jksxuuLIcm/oWW8dh+KYlr6FtOJu+
	 4jsOb+EPDzT8YgZFgLAKVzY9OIXo6Ot954VWv1bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F6EF80528;
	Thu, 17 Oct 2019 08:02:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10091F80362; Mon, 14 Oct 2019 04:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2B18F80138
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 04:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B18F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EIG49NZp"
Received: by mail-vk1-xa44.google.com with SMTP id d126so3232776vkb.1
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 19:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cmSr3QVmOjwoGFkUkKHWk/BchEWTm8QkPKzJN8q9wV0=;
 b=EIG49NZpCyOVgJI9Dg2FI+hjZI+D35jdNL2EetqfXRvJ7FqW96Vw97MOSDbD9Hay22
 jOOZn0nopfIBNT8BkfYuEkPoWfwBeLWYFQtEYiOrDPcZjeT7/1AMNdWpwi0CnCLy9g4H
 ZNKrJCugLkXe6Z0LMxhfq3NTfriotuKXDEDfnqoK90WtaSM2xUSY+Nmn+WtYSivDtxes
 2UxiYq5OlPzUJDGeNH4ThlDUxuEhb+mtUUgLmwmE1lMmL7fhjsuyPenlsaK83c58e/zm
 KaYufcSUHX2+nseihCOXRb1qQ5/4utOsncd9bpGJ+poncRvws1uC7rUeNvk7oX0CUzaB
 KZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cmSr3QVmOjwoGFkUkKHWk/BchEWTm8QkPKzJN8q9wV0=;
 b=iUwNqAp52UcyEHiXUWZId40wlig4pmKmGH0BWL1sypOaVnA9qcsxlddftUvQpYFiij
 vhRYTWkGwZ+t+uz7u6NlBFPdOuN4pHOUaIx9NSORrRfRXe8gFB51W+PXVWCAogJYIG7X
 yEEGfMrTNJDiP+tObJdo+heMFScdjGGN0xoet1pfJzorBp04LvBhBd0ZHOATJFf3VKu+
 Buc+P+4VXyWJlt1ea8ZSjme5KvpCkrzKsbefRcJFMikl08LPK+67nU6m/my2co8222AS
 0/I+XuaFlbN0o5RPivU8FWXUuplXszkKboW7QL7XvzLrDxl+FmweF3zRwcdlrqf9REES
 ssLQ==
X-Gm-Message-State: APjAAAVhmRCcC9re1Pd9fpiw4NOId4Gv7wkklGVJ2Z4hpc+iSPeskkXq
 FMtdBf2hXp439G3B9RgeZ41yYWINEBw3lTm45NQ1gA==
X-Google-Smtp-Source: APXvYqwsV6RyYI8hZ9RpGB8rf0Tm/f+OY4z5B+9MGThivz/awSTluJv/n3equLcckwGfJADbkRhysuZbnHM0eDCiGoM=
X-Received: by 2002:a1f:b202:: with SMTP id b2mr14644930vkf.59.1571021300600; 
 Sun, 13 Oct 2019 19:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <8f933cee57fc4420875e1e2ba14f1937@realtek.com>
 <20191010142019.GC4741@sirena.org.uk>
 <408b28994a044dfd91b832e4cef1cadb@realtek.com>
In-Reply-To: <408b28994a044dfd91b832e4cef1cadb@realtek.com>
From: Jimmy Cheng-Yi Chiang <cychiang@google.com>
Date: Mon, 14 Oct 2019 10:47:54 +0800
Message-ID: <CAFv8NwKXm8-P=P9QST7nrYwsTvtTMBch_O3qOENk1cD5o-0G5Q@mail.gmail.com>
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
X-Mailman-Approved-At: Thu, 17 Oct 2019 08:02:16 +0200
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: export r0 and temperature
	config
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

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgOTo0NiBBTSBTaHVtaW5nIFvojIPmm7jpiphdIDxzaHVt
aW5nZkByZWFsdGVrLmNvbT4gd3JvdGU6Cj4KPiA+IE9uIFR1ZSwgT2N0IDA4LCAyMDE5IGF0IDA5
OjMzOjI0QU0gKzAwMDAsIFNodW1pbmcgW+iMg+abuOmKmF0gd3JvdGU6Cj4gPiA+IEluIGNocm9t
ZWJvb2sgY2FzZSwgdGhlIG1hY2hpbmUgZHJpdmVyIHdpbGwgZ2V0IHRoZQo+ID4gPiByMCBjYWxp
YnJhdGlvbiBkYXRhIGFuZCB0ZW1wZXJhdHVyZSBmcm9tIFZQRC4KPiA+ID4gVGhlcmVmb3JlLCB0
aGUgY29kZWMgZXhwb3J0cyByMCBhbmQgdGVtcGVyYXR1cmUgY29uZmlnIEFQSSBmb3IgaXQuCj4g
Pgo+ID4gVGhpcyBkb2Vzbid0IHNlZW0gdG8gYXBwbHkgYWdhaW5zdCBjdXJyZW50IGNvZGUsIHBs
ZWFzZSBjaGVjayBhbmQgcmVzZW5kLgo+Cj4gVGhhbmtzIE1hcmsuIEkgd2lsbCBjaGVjayB3aXRo
IEdvb2dsZSB3aGV0aGVyIHN0aWxsIHVzaW5nIHRoaXMgbWV0aG9kLiBJZiBzbywgSSB3aWxsIHJl
c2VuZCB0aGUgcGF0Y2guCgpIaSBNYXJrIGFuZCBTaHVtaW5nLApUaGFuayB5b3UgZm9yIHRoZSBz
dWdnZXN0aW9uLiBJIGFncmVlIHRoYXQgaXQgaXMgYmV0dGVyIHRvIHVzZSBkZXZpY2UKcHJvcGVy
dHkgdG8gcGFzcyByMCBhbmQgdGVtcGVyYXR1cmUgdGhyb3VnaCBkZXZpY2UgcHJvcGVydHkuCkkg
YW0gd29ya2luZyBvbiBjb3JlYm9vdCBjaGFuZ2VzIHRvIHBhcnNlIGRhdGEgZnJvbSBWUEQsIGFu
ZCBzZXQgZGV2aWNlIHByb3BlcnR5CiJydDEwMTEsdGVtcGVyYXR1cmVfY2FsaWIiIGFuZCAicmVh
bHRlayxyMF9jYWxpYiIuCkkgdGhpbmsgdGhlIHBhdGNoIGluIHJ0MTAxMSBkcml2ZXIgd2lsbCBi
ZSBtdWNoIHNpbXBsZXIgb25jZSB3ZSBoYXZlCnRoYXQgZGV2aWNlIHByb3BlcnR5IHJlYWR5LgpB
bmQgdGhlcmUgd2lsbCBiZSBubyBtYWNoaW5lIGRyaXZlciBjaGFuZ2UgbmVlZGVkLgoKVGhhbmtz
IQoKCj4KPiA+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHBy
aW50aW5nIHRoaXMgZS1tYWlsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
