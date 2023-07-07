Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C214274A941
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 05:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 288EE4E;
	Fri,  7 Jul 2023 05:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 288EE4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688699714;
	bh=03MS5PbSmvjYSllGZfn3JiNqT1hpiB1vnQ6wLf/K8Og=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYvKeMx2TIFtDrz5rF5S71AVLi+a1bLeFaDaX5abjCmj0bwY0RenIB9ySQrUOTRyV
	 8IJpymsydgh6IbrIjSPM37sGiw4NlvVKLGw67XgqxvsEiy0CgVdjE8YBQRiVYdsmLN
	 dXT9Ejv8LQGmPzpq8oebJIXDppDvPEn2mx8mpjVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CB46F80544; Fri,  7 Jul 2023 05:14:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C712DF80124;
	Fri,  7 Jul 2023 05:14:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5251CF80125; Fri,  7 Jul 2023 05:14:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 063A2F80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 05:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 063A2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=bWs9TF9t
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b73b839025so1328054a34.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 20:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688699635; x=1691291635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vbUuEtz05KYPq1z68ACCZieX8e+bUUC/V8Wy/+io9Sc=;
        b=bWs9TF9tGzCgPVnQlfZKG5+EQThQcym+kBtel/911hr42FeYBtw0WqkCivHvi/rkmX
         uQfoL5By9H726ARLj+02Xjc45ztGEQPz6J2tjSp7fl89oUQIin6rVPo0u4/Q1IVgMMaM
         lIOtS+FjpZC1FpATJwJWJ3uj/U7gsUvg+xTaJkYopnseiszEFoVYvW7NRxxCMIFpbofz
         dxDWkV95JGFF2mvtWw6xCqDKiHL9ggFjiCNzHER8ESLMygAAxCQZUPqJMqSd+9cO1YQ/
         CNkidGWopPbKcbnpnKjmwHHMa91ZLmltk0aUdX0pddkSDD2WAfxpzxt5azNVf/WoHupX
         OaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688699635; x=1691291635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbUuEtz05KYPq1z68ACCZieX8e+bUUC/V8Wy/+io9Sc=;
        b=e0ESUPqLwEhB/lmFqFkoXFVy+JBr8blAhKyK4Nj4CfKORn7Y542PDyfgHRQPkRuCXC
         u3QOPodsdvlOcC9oUYQoRqXDaJUFvLqLq2gIIMdYr/S5VT3GRAwmqKljrId0i6akJ0jO
         eUw08uxv28B2Yov/+kovAeZOOnwDF2DiZy8OGaCOVCXxtUyysvkFvD91stfSMVu7/2Sc
         w9OVODppMRsDCY8UrcKvYX3+of+JrZcrI7mDqdDelIM/1mHdCy31BP1aaaZXXqYqFADf
         SSdtEFXpfuids0Oam/G0/ziTjmsZLYe5Rs1zZly4t8ZZns42lnPd3ZY34+WzhsxzkyeX
         BRLw==
X-Gm-Message-State: ABy/qLahysTnyU4kcxB5df/XlS515pNVQth66OE5K1Cy6XyKg1pT0v6S
	IghVk5oauiFLgUyZoHKgAXu9Amp7FhJEaOTsiAs=
X-Google-Smtp-Source: 
 APBJJlFZL/u1LRgkGKUjOubHv+g9HRYJ60+hFKy09JpWIkuoWWHwXlqwj33lY/1BVuOvTHcGg+rHRtVP3qSu9O2Wq8g=
X-Received: by 2002:a05:6358:52c3:b0:131:ce9c:9971 with SMTP id
 z3-20020a05635852c300b00131ce9c9971mr5502548rwz.29.1688699634680; Thu, 06 Jul
 2023 20:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
 <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
 <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
 <CAA+D8AMTnZb-Sm9gh_jDDSz3y9jXY-mD9S6vXPekAbdfCJaKHA@mail.gmail.com>
In-Reply-To: 
 <CAA+D8AMTnZb-Sm9gh_jDDSz3y9jXY-mD9S6vXPekAbdfCJaKHA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 7 Jul 2023 11:13:43 +0800
Message-ID: 
 <CAA+D8AMNqU0J1EC--BBVYbXMf1dRGdS-ez5hs2E8M_hYtwq60w@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
To: Mark Brown <broonie@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Takashi Iwai <tiwai@suse.de>,
	Sakari Ailus <sakari.ailus@iki.fi>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	Jacopo Mondi <jacopo@jmondi.org>
Message-ID-Hash: 7T5C3QHRBSQXL44ZIETEXU576X6M2DBJ
X-Message-ID-Hash: 7T5C3QHRBSQXL44ZIETEXU576X6M2DBJ
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7T5C3QHRBSQXL44ZIETEXU576X6M2DBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgTWFyaw0KDQpPbiBUdWUsIEp1bCA0LCAyMDIzIGF0IDEyOjAz4oCvUE0gU2hlbmdqaXUgV2Fu
ZyA8c2hlbmdqaXUud2FuZ0BnbWFpbC5jb20+DQp3cm90ZToNCg0KPg0KPg0KPiBPbiBUdWUsIEp1
bCA0LCAyMDIzIGF0IDE6NTnigK9BTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdy
b3RlOg0KPg0KPj4gT24gTW9uLCBKdWwgMDMsIDIwMjMgYXQgMDM6MTI6NTVQTSArMDIwMCwgSGFu
cyBWZXJrdWlsIHdyb3RlOg0KPj4NCj4+ID4gTXkgbWFpbiBjb25jZXJuIGlzIHRoYXQgdGhlc2Ug
Y3Jvc3Mtc3Vic3lzdGVtIGRyaXZlcnMgYXJlIGEgcGFpbiB0bw0KPj4gPiBtYWludGFpbi4gU28g
dGhlcmUgaGF2ZSB0byBiZSBnb29kIHJlYXNvbnMgdG8gZG8gdGhpcy4NCj4+DQo+PiA+IEFsc28g
aXQgaXMga2luZCBvZiB3ZWlyZCB0byBoYXZlIHRvIHVzZSB0aGUgVjRMMiBBUEkgaW4gdXNlcnNw
YWNlIHRvDQo+PiA+IGRlYWwgd2l0aCBhIHNwZWNpZmljIGF1ZGlvIGNvbnZlcnNpb24uIFF1aXRl
IHVuZXhwZWN0ZWQuDQo+Pg0KPj4gPiBCdXQgaW4gdGhlIGVuZCwgdGhhdCdzIGEgZGVjaXNpb24g
SSBjYW4ndCBtYWtlLg0KPj4NCj4+ID4gU28gSSB3YWl0IGZvciB0aGF0IGZlZWRiYWNrLiBOb3Rl
IHRoYXQgaWYgdGhlIGRlY2lzaW9uIGlzIG1hZGUgdGhhdCB0aGlzDQo+PiA+IGNhbiB1c2UgVjRM
MiwgdGhlbiB0aGVyZSBpcyBxdWl0ZSBhIGxvdCBtb3JlIHRoYXQgbmVlZHMgdG8gYmUgZG9uZToN
Cj4+ID4gZG9jdW1lbnRhdGlvbiwgbmV3IGNvbXBsaWFuY2UgdGVzdHMsIGV0Yy4gSXQncyBhZGRp
bmcgYSBuZXcgQVBJLCBhbmQNCj4+IHRoYXQNCj4+ID4gY29tZXMgd2l0aCBhZGRpdGlvbmFsIHdv
cmsuLi4NCj4+DQo+PiBBYnNvbHV0ZWx5LCBJIGFncmVlIHdpdGggYWxsIG9mIHRoaXMgLSBteSBp
bXByZXNzaW9uIHdhcyB0aGF0IHRoZSB0YXJnZXQNCj4+IGhlcmUgd291bGQgYmUgYnlwYXNzIG9m
IGF1ZGlvIHN0cmVhbXMgdG8vZnJvbSBhIHY0bDIgZGV2aWNlLCB3aXRob3V0DQo+PiBib3VuY2lu
ZyB0aHJvdWdoIGFuIGFwcGxpY2F0aW9uIGxheWVyLiAgSWYgaXQncyBwdXJlbHkgZm9yIGF1ZGlv
IHVzYWdlDQo+PiB3aXRoIG5vIG90aGVyIHRpZSB0byB2NGwyIHRoZW4gaW52b2x2aW5nIHY0bDIg
ZG9lcyBqdXN0IHNlZW0gbGlrZQ0KPj4gY29tcGxpY2F0aW9uLg0KPj4NCj4NCj4gVGhpcyBhdWRp
byB1c2UgY2FzZSBpcyB1c2luZyB0aGUgdjRsMiBhcHBsaWNhdGlvbiBsYXllci4gaW4gdGhlIHVz
ZXIgc3BhY2UNCj4gSSBuZWVkIHRvIGNhbGwgYmVsb3cgdjRsMiBpb2N0bHMgdG8gaW1wbGVtZW50
IHRoZSBmZWF0dXJlOg0KPiBWSURJT0NfUVVFUllDQVANCj4gVklESU9DX1RSWV9GTVQNCj4gVklE
SU9DX1NfRk1UDQo+IFZJRElPQ19SRVFCVUZTDQo+IFZJRElPQ19RVUVSWUJVRg0KPiBWSURJT0Nf
U1RSRUFNT04NCj4gVklESU9DX1FCVUYNCj4gVklESU9DX0RRQlVGDQo+IFZJRElPQ19TVFJFQU1P
RkYNCj4NCj4gd2h5IHRoZSBkcml2ZXIgd2FzIHB1dCBpbiB0aGUgQUxTQSwgYmVjYXVzZSBwcmV2
aW91c2x5IHdlIGltcGxlbWVudGVkDQo+IHRoZSBBU1JDIE0yUCAobWVtb3J5IHRvIHBlcmlwaGVy
YWwpIGluIEFMU0EsICBzbyBJIHRoaW5rIGl0IGlzIGJldHRlciB0bw0KPiBhZGQgTTJNIGRyaXZl
ciBpbiBBTFNBLiAgVGhlIGhhcmR3YXJlIElQIGlzIHRoZSBzYW1lLiBUaGUgY29tcGF0aWJsZQ0K
PiBzdHJpbmcgaXMgdGhlIHNhbWUuDQo+DQo+DQo+IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgbW9y
ZSBvZiB5b3VyIGlkZWFzIGFib3V0IHRoaXMgcGF0Y2g/IGFuZCBjb3VsZA0KeW91IHBsZWFzZSBj
aGVjayBmdXJ0aGVyIGFib3V0IHRoaXMgaW1wbGVtZW50YXRpb24uDQoNCkkgdHJpZWQgdG8gZmlu
ZCBhIGdvb2QgaW50ZXJmYWNlIGluIEFMU0EgZm9yIHRoaXMgbTJtIHJlcXVlc3QsIGJ1dCBkaWRu
J3QNCmZpbmQgb25lLCAgdGhlbiBJIHRyeSB0aGUgVjRMMiwgZmluZCBpdCBpcyBnb29kIHRoaXMg
YXVkaW8gY2FzZS4NCg0KYnV0IGl0IG5lZWRzIHRvIGV4dGVuZCB0aGUgVjRMMiBBUEkuDQoNCkkg
aGF2ZSBubyBpZGVhIGhvdyB0byBnbyBvbiwgY291bGQgeW91IHBsZWFzZSByZWNvbW1lbmQ/DQoN
CmJlc3QgcmVnYXJkcw0Kd2FuZyBzaGVuZ2ppdQ0KDQo+DQo+DQo=
