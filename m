Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812C746840
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 06:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88F3B20C;
	Tue,  4 Jul 2023 06:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88F3B20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688443502;
	bh=Tz7iZihUGu3TywOzQjETOWfg/YB84XZgWDu8fbzcDuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EtWjHnAqokgQJvmgD4x7H90ipVwiT9aZIfbGuejEdHcvS8MTgZcUUrV1tuRuaCiy4
	 O/4jLUn+H+L0nbii9a7tmR62IJI5unyEZ9gRax6h1/KHICacGmge3nbT66A3wsyxZt
	 Q/YzsrSMyHiVncHPUNCrbIMolDUjHFsnugvPsgrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C107F80132; Tue,  4 Jul 2023 06:04:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D428F80124;
	Tue,  4 Jul 2023 06:04:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F08AF80125; Tue,  4 Jul 2023 06:04:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 687A3F80093
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 06:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687A3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=R/GiOUH4
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b5ef64bca6so4556716a34.3
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Jul 2023 21:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688443422; x=1691035422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ittuKIOZKCNmsU3jQyHtoNh99DGWbVOw7pW+3qCeyd0=;
        b=R/GiOUH4R0Z5OtP6eK0cirFzsk9jVyjt/EbwTyjW4bfbbFyuIcq6fq65XL+Acuzin5
         4gGutMqZXy/QI0ziTz9JWYoHjgEdc3tyOmb3hAZa766ywvv9F2185RhyO0vjAilSqqsk
         MDeha5pzZOTCBzfwGx1PaG0E1Emfavre++ZEyMtMTXQpYhSHhPhHjpAaf2KCdtkXDJf6
         ZGWxVUTSuMD5OWxuam578FXyd2PG+6VjltaXMAq6LKZLLpRsNvP/5T9d7APFZiOjTWZw
         hca+XeEYdZf60v5lsT/PkfIpNN0lTPrg3RJbkhdVcBbDk9zQLgwOeIXqE2HE6jzIMzZ7
         ydUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688443422; x=1691035422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ittuKIOZKCNmsU3jQyHtoNh99DGWbVOw7pW+3qCeyd0=;
        b=I5Wt1J/l4ZVgDlhOaXm6yZxKE3yJqp0RDKfSN8utJL6fy8qM05yI/fNLS8MfBxYHq2
         8ImcJn1wSj3azQkrizEr1e+TvcUjrdEn0RC2a/H6S4dGvAN44FQJR/PrvX6t8rssmvYR
         Ldyo2R1rrtEQvB0t2k8Cuk508bLZPbbM+QU70oSebFtlUA/wviyh3KOx+r1w9Yz8/Nza
         KmXXXh6hKmZgSzLHzIgdB24LvciL3UaSTyn902OZ9Nvo1W5n+6qj0heVQKly9J6wmCSF
         o30K9zUVqQM+szOl/U01qFJa2BCiDPV+3cKYcOxRIqIT/3N9K1c9RrWUmxDTRXqjlvY4
         W71Q==
X-Gm-Message-State: ABy/qLa/hJfwJLCfVTcMhnI0Ff5lhJzVOhTz4YMdSaY7SNauwEYrsqaW
	bPX4AqbxyzJneETLK3wRFJlTWYqVrR2YEFSaaGE=
X-Google-Smtp-Source: 
 APBJJlEwp3cvrYvZahpzCfn4BaFBYr9rUtC/LHf8sSGpuXaJxTgbAX/VvMqn7ylQ4+maVuXvf/dd2Do0whF7+4/dEtI=
X-Received: by 2002:a05:6358:ce24:b0:132:ce1f:6793 with SMTP id
 gt36-20020a056358ce2400b00132ce1f6793mr9122228rwb.21.1688443422174; Mon, 03
 Jul 2023 21:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
 <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
 <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
In-Reply-To: <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Jul 2023 12:03:30 +0800
Message-ID: 
 <CAA+D8AMTnZb-Sm9gh_jDDSz3y9jXY-mD9S6vXPekAbdfCJaKHA@mail.gmail.com>
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
Message-ID-Hash: EUULXVLSKFQKP5MK742ALSCYGM6362SE
X-Message-ID-Hash: EUULXVLSKFQKP5MK742ALSCYGM6362SE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUULXVLSKFQKP5MK742ALSCYGM6362SE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVHVlLCBKdWwgNCwgMjAyMyBhdCAxOjU54oCvQU0gTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPiB3cm90ZToNCg0KPiBPbiBNb24sIEp1bCAwMywgMjAyMyBhdCAwMzoxMjo1NVBNICsw
MjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+DQo+ID4gTXkgbWFpbiBjb25jZXJuIGlzIHRoYXQg
dGhlc2UgY3Jvc3Mtc3Vic3lzdGVtIGRyaXZlcnMgYXJlIGEgcGFpbiB0bw0KPiA+IG1haW50YWlu
LiBTbyB0aGVyZSBoYXZlIHRvIGJlIGdvb2QgcmVhc29ucyB0byBkbyB0aGlzLg0KPg0KPiA+IEFs
c28gaXQgaXMga2luZCBvZiB3ZWlyZCB0byBoYXZlIHRvIHVzZSB0aGUgVjRMMiBBUEkgaW4gdXNl
cnNwYWNlIHRvDQo+ID4gZGVhbCB3aXRoIGEgc3BlY2lmaWMgYXVkaW8gY29udmVyc2lvbi4gUXVp
dGUgdW5leHBlY3RlZC4NCj4NCj4gPiBCdXQgaW4gdGhlIGVuZCwgdGhhdCdzIGEgZGVjaXNpb24g
SSBjYW4ndCBtYWtlLg0KPg0KPiA+IFNvIEkgd2FpdCBmb3IgdGhhdCBmZWVkYmFjay4gTm90ZSB0
aGF0IGlmIHRoZSBkZWNpc2lvbiBpcyBtYWRlIHRoYXQgdGhpcw0KPiA+IGNhbiB1c2UgVjRMMiwg
dGhlbiB0aGVyZSBpcyBxdWl0ZSBhIGxvdCBtb3JlIHRoYXQgbmVlZHMgdG8gYmUgZG9uZToNCj4g
PiBkb2N1bWVudGF0aW9uLCBuZXcgY29tcGxpYW5jZSB0ZXN0cywgZXRjLiBJdCdzIGFkZGluZyBh
IG5ldyBBUEksIGFuZCB0aGF0DQo+ID4gY29tZXMgd2l0aCBhZGRpdGlvbmFsIHdvcmsuLi4NCj4N
Cj4gQWJzb2x1dGVseSwgSSBhZ3JlZSB3aXRoIGFsbCBvZiB0aGlzIC0gbXkgaW1wcmVzc2lvbiB3
YXMgdGhhdCB0aGUgdGFyZ2V0DQo+IGhlcmUgd291bGQgYmUgYnlwYXNzIG9mIGF1ZGlvIHN0cmVh
bXMgdG8vZnJvbSBhIHY0bDIgZGV2aWNlLCB3aXRob3V0DQo+IGJvdW5jaW5nIHRocm91Z2ggYW4g
YXBwbGljYXRpb24gbGF5ZXIuICBJZiBpdCdzIHB1cmVseSBmb3IgYXVkaW8gdXNhZ2UNCj4gd2l0
aCBubyBvdGhlciB0aWUgdG8gdjRsMiB0aGVuIGludm9sdmluZyB2NGwyIGRvZXMganVzdCBzZWVt
IGxpa2UNCj4gY29tcGxpY2F0aW9uLg0KPg0KDQpUaGlzIGF1ZGlvIHVzZSBjYXNlIGlzIHVzaW5n
IHRoZSB2NGwyIGFwcGxpY2F0aW9uIGxheWVyLiBpbiB0aGUgdXNlciBzcGFjZQ0KSSBuZWVkIHRv
IGNhbGwgYmVsb3cgdjRsMiBpb2N0bHMgdG8gaW1wbGVtZW50IHRoZSBmZWF0dXJlOg0KVklESU9D
X1FVRVJZQ0FQDQpWSURJT0NfVFJZX0ZNVA0KVklESU9DX1NfRk1UDQpWSURJT0NfUkVRQlVGUw0K
VklESU9DX1FVRVJZQlVGDQpWSURJT0NfU1RSRUFNT04NClZJRElPQ19RQlVGDQpWSURJT0NfRFFC
VUYNClZJRElPQ19TVFJFQU1PRkYNCg0Kd2h5IHRoZSBkcml2ZXIgd2FzIHB1dCBpbiB0aGUgQUxT
QSwgYmVjYXVzZSBwcmV2aW91c2x5IHdlIGltcGxlbWVudGVkDQp0aGUgQVNSQyBNMlAgKG1lbW9y
eSB0byBwZXJpcGhlcmFsKSBpbiBBTFNBLCAgc28gSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8NCmFk
ZCBNMk0gZHJpdmVyIGluIEFMU0EuICBUaGUgaGFyZHdhcmUgSVAgaXMgdGhlIHNhbWUuIFRoZSBj
b21wYXRpYmxlDQpzdHJpbmcgaXMgdGhlIHNhbWUuDQoNCkJlc3QgcmVnYXJkcw0KV2FuZyBTaGVu
Z2ppdQ0K
