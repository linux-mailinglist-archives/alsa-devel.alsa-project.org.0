Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E60D8EDF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 13:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A97671654;
	Wed, 16 Oct 2019 13:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A97671654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571223846;
	bh=Vg8Bj2CJNkNzSkisOHp1qp32ka8JSBsOb9utwh9DDEA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=blarvu43SIA+RPUhhfuDQXNvm/wi9GM2exwms0Cv5Cml6As6CN8yz48GE7aPmPrH8
	 rfnC3sA55sTWNVoe25NbcSXo/B/7etxSEa8dddMpmedDlEZeQd1tVTPmk/MPuwPGps
	 eU5hgAwXUbRpKBGmdcW+3fv2kOvorTFRFbbRedv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 462D5F80323;
	Wed, 16 Oct 2019 13:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E98B4F80362; Wed, 16 Oct 2019 13:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55F8EF80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 13:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F8EF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NCpzc9CE"
Received: by mail-wm1-x343.google.com with SMTP id i16so2421560wmd.3
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6TnyruJNVx6ER2jTYjftbmVl31X4S3LEaQJe+CNcXgU=;
 b=NCpzc9CEnVV6r3afA31DnekhMWsFWhCUV1k0dKynm+k+QGrhD5DNArYmbCs0smXBVH
 EfLDXgfR/shJrejX1GEO7wJqHMca29lclkA3eBuKKYt+odHkmsrm1rDnKgd1hnEHyZ3D
 KhqfdwW5Lo30HjW60gqDz58ijUjjNceMo892HGH+xXzKAURKzZC7Soba5lrJzQg+lQ15
 DZ5ZZUvvrUtpWVXdJgIgmJL5iis075xHlo1nUIEHS7e6oKXrpJ+8oHIxJWNX27BGrkOR
 ua7I063cOf27ZxEpQZCWXknwYBa0Pz3se/p5fqnYvxvGA1isneDfzp0rOpqyt69QH65n
 Vr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6TnyruJNVx6ER2jTYjftbmVl31X4S3LEaQJe+CNcXgU=;
 b=IdHLLOpaE0k1kwiWbQmzRf4LtukEDr1TguhnypcYhH0sCrmrcqi7e9tHkRprd//j7p
 W4WlsmO3vcxJOmkAObDthd8v0MURMZ/A5X6XeZnxUsTWUzuITeFxstH6VFCzZGGMyTRZ
 rP+dY32C3Vyp0RTB6p7hKb/2G9kZ4illsSN5T1xG66rVcrZpoFOsGYtpucIn8+iWqcS0
 pqWXUt7DR4xm4sVhBSVClhfws5vigxcB+ClfaRZ35jHsFUZPzvXUtYOetUSvlfxJV356
 Bm4XfDEymNa/3rV9fjgk4duf2qw0S6xZRXqKqnxufcqms5K+ZNYrN1ShK8+cZOQm2vrY
 NrHg==
X-Gm-Message-State: APjAAAX84pzimic8JOsYRs8Se2tgCMyCoqfL+UN+c34UrLc5EoKnTiAS
 qI2ko6Ymp1u2BWTiG8Tbg2bUpJgY60Gs3VyOwEo=
X-Google-Smtp-Source: APXvYqykkUnC2VF5xJfFzW27e7kIVDcvdsV59pt+sj3qpQnIvZvXWTYXHxRQYcQpsYSeDY8du+dl3b43clMfzKPVvdQ=
X-Received: by 2002:a1c:e48a:: with SMTP id b132mr2943709wmh.13.1571223736423; 
 Wed, 16 Oct 2019 04:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZAsZ=Q=tcqCzVp8bvj4Jme+YTH9GxmMoBgvOT+w6z8iiw@mail.gmail.com>
 <877e564ht5.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZDtwFoXQ2H_j1v-95Pnh=QzZFX86jHk1RTq1oqSO+5jRw@mail.gmail.com>
 <93911ba6-370e-4b93-d3c2-81081b1be0aa@linux.intel.com>
 <87o8yhwn3d.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8yhwn3d.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 16 Oct 2019 14:02:04 +0300
Message-ID: <CAEnQRZAe20xzGXEDcXczcna9dFP+XFCR3sOBrVyMQK+F85aO9g@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sof: include types.h at header.h
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

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMzoyOCBBTSBLdW5pbm9yaSBNb3JpbW90bwo8a3VuaW5v
cmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+IHdyb3RlOgo+Cj4KPiBIaSBQaWVycmUtTG91aXMK
Pgo+ID4gPj4+PiBXaXRob3V0IDx0eXBlcy5oPiB3ZSB3aWxsIGdldCB0aGVzZSBlcnJvcgo+ID4g
Pj4+Pgo+ID4gPj4+PiBsaW51eC9pbmNsdWRlL3NvdW5kL3NvZi9oZWFkZXIuaDoxMjU6MjogZXJy
b3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVpbnQzMl904oCZdWludDMyX3Qgc2l6ZTsKPiA+ID4+
Pj4gbGludXgvaW5jbHVkZS9zb3VuZC9zb2YvaGVhZGVyLmg6MTM2OjI6IGVycm9yOiB1bmtub3du
IHR5cGUgbmFtZSDigJh1aW50MzJfdOKAmXVpbnQzMl90IHNpemU7Cj4gPiA+Pj4+IGxpbnV4L2lu
Y2x1ZGUvc291bmQvc29mL2hlYWRlci5oOjEzNzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYdWludDMyX3TigJl1aW50MzJfdCBjbWQ7Cj4gPiA+Pj4+IC4uLgo+ID4gPj4+PiBsaW51eC9p
bmNsdWRlL3NvdW5kL3NvZi9kYWktaW14Lmg6MTg6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1l
IOKAmHVpbnQxNl904oCZdWludDE2X3QgcmVzZXJ2ZWQxOwo+ID4gPj4+PiBsaW51eC9pbmNsdWRl
L3NvdW5kL3NvZi9kYWktaW14Lmg6MzA6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVp
bnQxNl904oCZdWludDE2X3QgdGRtX3Nsb3Rfd2lkdGg7Cj4gPiA+Pj4+IGxpbnV4L2luY2x1ZGUv
c291bmQvc29mL2RhaS1pbXguaDozMToyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYdWlu
dDE2X3TigJl1aW50MTZfdCByZXNlcnZlZDI7Cj4gKHNuaXApCj4gPiB0aGlzIGlzIGEgZmlsZSBz
aGFyZWQgd2l0aCB0aGUgZmlybXdhcmUsIHdlIHNob3VsZG4ndCBoYXZlIHRvIGFkZAo+ID4gbGlu
dXggc3BlY2lmaWMgc3R1ZmYgaW4gdGhlcmUuCj4gPgo+ID4gQWxzbyBJIGRvbid0IGtub3cgaG93
IHlvdSBnZXQgdGhvc2UgZXJyb3JzLCB3ZSd2ZSBiZWVuIHVzaW5nIHRoaXMgZmlsZQo+ID4gZm9y
IHNvbWUgdGltZSwgY2FuIHlvdSBjbGFyaWZ5IGhvdyB0aGlzIGVycm9yIGhhcHBlbnM/Cj4KPiBJ
IGhhZCBnb3QgdGhpcyBlcnJvciBieSB1c2luZyAibWFrZSBhbGx5ZXNjb25maWciIGFuZCBjb21w
aWxlIGZvciB4ODYuCj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgaGVscCAhIQo+IEJlc3QgcmVnYXJk
cwo+IC0tLQo+IEt1bmlub3JpIE1vcmltb3RvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
