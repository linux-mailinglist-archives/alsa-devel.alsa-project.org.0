Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC475915B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 11:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B49C1F6;
	Wed, 19 Jul 2023 11:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B49C1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689758223;
	bh=Slj9iVz8ewhsS8+twwRRUOi9SDIUrqhka2ZZRKRvxfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0pBvazSV1slEk0crEYiH+wc5R4Djbt6s6j4YLXx3SvpsU3R9TRSqBIYPtiXY/56G
	 iC6tRM2sI8awH7xMiXuX4lXu0/oILEPw4RSrNtGJRYyFhlfMqgMQF+ybW10oP+SK83
	 IHxyCkJhbuXnmTNQfpkvjER3vRxAA/tEKXis5GhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3365F80494; Wed, 19 Jul 2023 11:16:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B8E7F8032D;
	Wed, 19 Jul 2023 11:16:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78143F8047D; Wed, 19 Jul 2023 11:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12B72F80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 11:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B72F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=r3u1mbbq
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-262c42d3fafso427389a91.0
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689758148; x=1690362948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4xYMJ2qwFt3ysotZG6vyN3zgxfKZNUX3IXUBQy5PH3w=;
        b=r3u1mbbqB53w+AXZUQHRVaZwpdH/uEAb82ktK3H7HPMQE/lFGH1E5UfrLNwX7BkScX
         JJcmaHoKjxNKORJV85KF6OSLq+Y/nuPeK1QK+IU3m32teZhwNzBChVHWiKkZXRz0KQZt
         1QoDu8Oc1oktDIYUIr4dMS5Bm1flQzEPEQc7akpWWL/RhXrx6Qpo24zfU87loejANJud
         H7KFHYM9jRpM0o6BWfGdYZ8cMRjoR1Mm44pEsqKfb7KlfxYGbSULS0ZzBCAevhWv/D98
         XMCxVJM9MDzihB82e+tThP5A0gG+mmJ8XenfftlpHY1zDzSf5afL7Wn6paU2WNT4hBeA
         09qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689758148; x=1690362948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xYMJ2qwFt3ysotZG6vyN3zgxfKZNUX3IXUBQy5PH3w=;
        b=g3CMO8EmAjoijkTivWPRSd616BJEh69Y1Zw5EvN9/LRMySnXsCWM/1sx67rPpIn09c
         gnxCaW6NRip4HGhXJt2xUekdyOF0KaTN7AaHcykRWYoEUnS/jaZdTXahboHjurGW5Jmn
         N6nEWBlnFWcnkTHsnxAQ23wpfSMeSBUvkVMOhnwgQi6C89RhahAjCdpFtRAjJvZkbxF5
         VSTMy/taJFkIwfZLQN7aZtLeqZr6pZQ1m/w3Og6hgYF6eB+QLZ8GTanLWgdxnX7/dLuc
         pItL55LoerHoux78+QuXALlKHBk/yAQrYH3ioLtglevGvjzRJxoE7dwLgTUuTRZcPTZR
         Go+A==
X-Gm-Message-State: ABy/qLY0AmkjKdJ86kQr/KrGcdvRAbRIfgUCqvC/VTFW7GmsilDFI4/b
	89MusvtCc3owEEvgUf0iRVUIO1d2OCpb5OIdcpU=
X-Google-Smtp-Source: 
 APBJJlFN9CjpCw8/0jcD6IysUeUwKyNP9eYGqm+T3UXh7ICdwsLpt8yXN7FmTeZ/HzLXjeEQcMFLjDbuLAyz6vfpfHk=
X-Received: by 2002:a17:90b:4a91:b0:253:3eb5:3ade with SMTP id
 lp17-20020a17090b4a9100b002533eb53ademr2100966pjb.8.1689758148096; Wed, 19
 Jul 2023 02:15:48 -0700 (PDT)
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
 <CAA+D8AMNqU0J1EC--BBVYbXMf1dRGdS-ez5hs2E8M_hYtwq60w@mail.gmail.com>
In-Reply-To: 
 <CAA+D8AMNqU0J1EC--BBVYbXMf1dRGdS-ez5hs2E8M_hYtwq60w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Jul 2023 17:15:36 +0800
Message-ID: 
 <CAA+D8ANLjOOHuc5OqhsdFX1_N_=fbdDnFEAsSBs06zDGpJ8TZg@mail.gmail.com>
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
Message-ID-Hash: KNCHANA57UUDPTKLVJD7BEGDBHUY5EN6
X-Message-ID-Hash: KNCHANA57UUDPTKLVJD7BEGDBHUY5EN6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNCHANA57UUDPTKLVJD7BEGDBHUY5EN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgTWFyaw0KDQpPbiBGcmksIEp1bCA3LCAyMDIzIGF0IDExOjEz4oCvQU0gU2hlbmdqaXUgV2Fu
ZyA8c2hlbmdqaXUud2FuZ0BnbWFpbC5jb20+DQp3cm90ZToNCg0KPiBIaSBNYXJrDQo+DQo+IE9u
IFR1ZSwgSnVsIDQsIDIwMjMgYXQgMTI6MDPigK9QTSBTaGVuZ2ppdSBXYW5nIDxzaGVuZ2ppdS53
YW5nQGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+DQo+Pg0KPj4NCj4+IE9uIFR1ZSwgSnVsIDQsIDIw
MjMgYXQgMTo1OeKAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+
Pg0KPj4+IE9uIE1vbiwgSnVsIDAzLCAyMDIzIGF0IDAzOjEyOjU1UE0gKzAyMDAsIEhhbnMgVmVy
a3VpbCB3cm90ZToNCj4+Pg0KPj4+ID4gTXkgbWFpbiBjb25jZXJuIGlzIHRoYXQgdGhlc2UgY3Jv
c3Mtc3Vic3lzdGVtIGRyaXZlcnMgYXJlIGEgcGFpbiB0bw0KPj4+ID4gbWFpbnRhaW4uIFNvIHRo
ZXJlIGhhdmUgdG8gYmUgZ29vZCByZWFzb25zIHRvIGRvIHRoaXMuDQo+Pj4NCj4+PiA+IEFsc28g
aXQgaXMga2luZCBvZiB3ZWlyZCB0byBoYXZlIHRvIHVzZSB0aGUgVjRMMiBBUEkgaW4gdXNlcnNw
YWNlIHRvDQo+Pj4gPiBkZWFsIHdpdGggYSBzcGVjaWZpYyBhdWRpbyBjb252ZXJzaW9uLiBRdWl0
ZSB1bmV4cGVjdGVkLg0KPj4+DQo+Pj4gPiBCdXQgaW4gdGhlIGVuZCwgdGhhdCdzIGEgZGVjaXNp
b24gSSBjYW4ndCBtYWtlLg0KPj4+DQo+Pj4gPiBTbyBJIHdhaXQgZm9yIHRoYXQgZmVlZGJhY2su
IE5vdGUgdGhhdCBpZiB0aGUgZGVjaXNpb24gaXMgbWFkZSB0aGF0DQo+Pj4gdGhpcw0KPj4+ID4g
Y2FuIHVzZSBWNEwyLCB0aGVuIHRoZXJlIGlzIHF1aXRlIGEgbG90IG1vcmUgdGhhdCBuZWVkcyB0
byBiZSBkb25lOg0KPj4+ID4gZG9jdW1lbnRhdGlvbiwgbmV3IGNvbXBsaWFuY2UgdGVzdHMsIGV0
Yy4gSXQncyBhZGRpbmcgYSBuZXcgQVBJLCBhbmQNCj4+PiB0aGF0DQo+Pj4gPiBjb21lcyB3aXRo
IGFkZGl0aW9uYWwgd29yay4uLg0KPj4+DQo+Pj4gQWJzb2x1dGVseSwgSSBhZ3JlZSB3aXRoIGFs
bCBvZiB0aGlzIC0gbXkgaW1wcmVzc2lvbiB3YXMgdGhhdCB0aGUgdGFyZ2V0DQo+Pj4gaGVyZSB3
b3VsZCBiZSBieXBhc3Mgb2YgYXVkaW8gc3RyZWFtcyB0by9mcm9tIGEgdjRsMiBkZXZpY2UsIHdp
dGhvdXQNCj4+PiBib3VuY2luZyB0aHJvdWdoIGFuIGFwcGxpY2F0aW9uIGxheWVyLiAgSWYgaXQn
cyBwdXJlbHkgZm9yIGF1ZGlvIHVzYWdlDQo+Pj4gd2l0aCBubyBvdGhlciB0aWUgdG8gdjRsMiB0
aGVuIGludm9sdmluZyB2NGwyIGRvZXMganVzdCBzZWVtIGxpa2UNCj4+PiBjb21wbGljYXRpb24u
DQo+Pj4NCj4+DQo+PiBUaGlzIGF1ZGlvIHVzZSBjYXNlIGlzIHVzaW5nIHRoZSB2NGwyIGFwcGxp
Y2F0aW9uIGxheWVyLiBpbiB0aGUgdXNlciBzcGFjZQ0KPj4gSSBuZWVkIHRvIGNhbGwgYmVsb3cg
djRsMiBpb2N0bHMgdG8gaW1wbGVtZW50IHRoZSBmZWF0dXJlOg0KPj4gVklESU9DX1FVRVJZQ0FQ
DQo+PiBWSURJT0NfVFJZX0ZNVA0KPj4gVklESU9DX1NfRk1UDQo+PiBWSURJT0NfUkVRQlVGUw0K
Pj4gVklESU9DX1FVRVJZQlVGDQo+PiBWSURJT0NfU1RSRUFNT04NCj4+IFZJRElPQ19RQlVGDQo+
PiBWSURJT0NfRFFCVUYNCj4+IFZJRElPQ19TVFJFQU1PRkYNCj4+DQo+PiB3aHkgdGhlIGRyaXZl
ciB3YXMgcHV0IGluIHRoZSBBTFNBLCBiZWNhdXNlIHByZXZpb3VzbHkgd2UgaW1wbGVtZW50ZWQN
Cj4+IHRoZSBBU1JDIE0yUCAobWVtb3J5IHRvIHBlcmlwaGVyYWwpIGluIEFMU0EsICBzbyBJIHRo
aW5rIGl0IGlzIGJldHRlciB0bw0KPj4gYWRkIE0yTSBkcml2ZXIgaW4gQUxTQS4gIFRoZSBoYXJk
d2FyZSBJUCBpcyB0aGUgc2FtZS4gVGhlIGNvbXBhdGlibGUNCj4+IHN0cmluZyBpcyB0aGUgc2Ft
ZS4NCj4+DQo+Pg0KPj4gQ291bGQgeW91IHBsZWFzZSBzaGFyZSBtb3JlIG9mIHlvdXIgaWRlYXMg
YWJvdXQgdGhpcyBwYXRjaD8gYW5kIGNvdWxkDQo+IHlvdSBwbGVhc2UgY2hlY2sgZnVydGhlciBh
Ym91dCB0aGlzIGltcGxlbWVudGF0aW9uLg0KPg0KPiBJIHRyaWVkIHRvIGZpbmQgYSBnb29kIGlu
dGVyZmFjZSBpbiBBTFNBIGZvciB0aGlzIG0ybSByZXF1ZXN0LCBidXQgZGlkbid0DQo+IGZpbmQg
b25lLCAgdGhlbiBJIHRyeSB0aGUgVjRMMiwgZmluZCBpdCBpcyBnb29kIHRoaXMgYXVkaW8gY2Fz
ZS4NCj4NCj4gYnV0IGl0IG5lZWRzIHRvIGV4dGVuZCB0aGUgVjRMMiBBUEkuDQo+DQo+IEkgaGF2
ZSBubyBpZGVhIGhvdyB0byBnbyBvbiwgY291bGQgeW91IHBsZWFzZSByZWNvbW1lbmQ/DQo+DQo+
DQpTaG91bGQgSSBpbXBsZW1lbnQgdGhlIGFzcmMgbTJtIGRyaXZlciBhcyBhIHNlcGFyYXRlIHY0
bDIgZHJpdmVyPw0KQW5kIG1vdmUgaXQgdG8gdGhlIC9kcml2ZXIvbWVkaWEgZm9sZGVyID8gSW4g
QUxTQSBwYXJ0LCBqdXN0IG5lZWQNCnJlZ2lzdGVyIHRoZSBwbGF0Zm9ybSBkZXZpY2UuDQoNClRo
ZSBicmlkZ2UgYmV0d2VlbiBBTFNBIGFuZCBWNEwyIGZyYW1ld29yayBjYW4gYmUgdGhlIGhlYWRl
cg0KZmlsZSBpbiAvaW5jbHVkZS9zb3VuZC8NCg0KRG9lcyBpdCBzb3VuZCBiZXR0ZXI/DQoNCkJl
c3QgcmVnYXJkcw0KV2FuZyBTaGVuZ2ppdQ0K
