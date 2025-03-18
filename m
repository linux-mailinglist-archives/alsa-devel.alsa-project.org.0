Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71548A67681
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 15:36:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41C560340;
	Tue, 18 Mar 2025 15:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41C560340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742308564;
	bh=lUmjkTJqgg0MRsy5n0Of0sE7ad30C5NvVj01MUI1A3o=;
	h=References:In-Reply-To:From:Date:Subject:Cc:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SWbJu4Fa+lJeOwYX3QAwnQCocRUk9PjlCVWshcvhDz7ZMU98HBaymH5J/6snk6jQ+
	 tr9WhPKoYdBESpy4fS9rqscKlKXRM3G4Iop+LH9hpF8TzJKXooejfEAPPZpQo20zo7
	 shwn/nLt5jFi03Fffncqr5Lrxvw8Yk/XL93F1hlo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C31C4F805AE; Tue, 18 Mar 2025 15:35:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CAC0F805B0;
	Tue, 18 Mar 2025 15:35:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A470F80587; Tue, 18 Mar 2025 15:33:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MISSING_HEADERS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 295B5F8001D
	for <alsa-devel@alsa-project.org>; Tue, 18 Mar 2025 15:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 295B5F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=blokas.io header.i=@blokas.io header.a=rsa-sha256
 header.s=google header.b=KMc55KMT
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so5301220276.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Mar 2025 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blokas.io; s=google; t=1742308382; x=1742913182;
 darn=alsa-project.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qOFK8bXGdyc5mCgN+e6oSIQparbVYZlQW0NrC8hzYo=;
        b=KMc55KMTjxWFu3dXz0L8PsjIHpi8gotpxd70aiGuU9sInjvKZEDOXsD0wEWLIspajL
         rqLyaolEd/zUuFsFE6lNyrBqMY8SQ9iiVU7bzZu7UyQzzygwDeBlOKs+Zu9GmrDoxaXr
         HwDmWOnpFXPGOVpgCTGBI2U0fgRZUMq/IGSdRqSn6JOPRJlLKvrRhOqf+PMz4UOFmToF
         4MqHCDhqHh9VaLRlI3QeThDd7vv8g8FbBOl9WOUEikYBT81zBulM0MFw/79SYTi8GbYU
         2TbGSKWFNnwDIpyos/Z7Hs88hqFPgFM/E0iHb9K+zG0mer+oRZHKw/cgyTNGwORi3C/e
         bckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308382; x=1742913182;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qOFK8bXGdyc5mCgN+e6oSIQparbVYZlQW0NrC8hzYo=;
        b=FztvQmG4ZFzYmTrCO1c0Ps4LUzfNIouGzOrGDJRF5fR52Ti/21jE/uU4AiCCaF69sC
         5FZtUXT7c6RmZPX86C4l3RXQ0NVt7mhAqzOd7JyKfS6AAk3Hd+CWL/ABeXPoblwqG+wY
         GY7iUThuP4tocLfVxPq4fSIoRY5TfHt4/f6IvPSREXqUIDQp9Vs8W9Cy2Rp5VybprkNN
         keFwPXuJjKVMRx3EVnM1KAyOYqneL2ZHdQv2wyBw25eHKFGq387NqwtXPgMrZKEO+EzR
         1mzWOxd/O44ZDKx5vcbfHGAwOvQx3lYcoZoQd7tgdXSu53lZtDWLoqvAuXTOLKfo6oOg
         U9Dw==
X-Gm-Message-State: AOJu0Yy1IK6q0sv81/nNURXQ473NRzXJx176Mm51bi89mS9wzyeKKT0/
	9dlLWetO6LZ1HdCx9wP63x1EIUTsf/d9qpAKu4ygu4OYgM5/rQKQL/MO4wgkdc83O0oPcrS0tWr
	TcEetdbJY22sYDOo4Tq2ObVmo7RyfSoq1ake5/G9qqzHEMbZW
X-Gm-Gg: ASbGncvDBHqaEdoTr00R0fjY8ozt+qrSD6Cztf0zj8UscdqwB/cc6hK0SrrHJDwTcig
	M7+Qk+21PXnWZCb8D06cgR8k92oZSpo9Ai2jwhodQ3pBvB/PTW31cF2MhxXRJDdau3lh73uw5x1
	lWS3tKfB4oMNkRiJlMiErBOx8mkw==
X-Google-Smtp-Source: 
 AGHT+IGfz7RTRjbGN82eg6lct0Gv+YdlTZ+RMLNd4pVpIp/uaqI8E7HoUFXDpkJz0Lr5L9abnKpn6Sm/1796coOicHw=
X-Received: by 2002:a05:6902:1b83:b0:e61:18f0:84e9 with SMTP id
 3f1490d57ef6-e63f652c8a0mr20832725276.26.1742308381907; Tue, 18 Mar 2025
 07:33:01 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMONXLvYv-LJRkc=caYG5A5mb+CML2dJGCnxRhy9VXJed-KUjw@mail.gmail.com>
 <c284d491-7bab-4f3c-a1bc-1b24b2d9d8ab@perex.cz>
In-Reply-To: <c284d491-7bab-4f3c-a1bc-1b24b2d9d8ab@perex.cz>
From: =?UTF-8?Q?Giedrius_Trainavi=C4=8Dius?= <giedrius@blokas.io>
Date: Tue, 18 Mar 2025 16:32:50 +0200
X-Gm-Features: AQ5f1JrOCxNqjI0TIwveA3eqRl4wKG7J0QeeeRvVPMkYU6DkF6LBDoJzdUMo3S8
Message-ID: 
 <CAMONXLuLxTP7GX=Ky04=xB83f_0RWxoutbp0oc0c8qw28sPCJQ@mail.gmail.com>
Subject: Re: UCM2 Conditional cset in BootSequence
Cc: alsa-devel@alsa-project.org
Message-ID-Hash: GZ5TOX5UNX32KRHRITTZB3LOSQWEJB52
X-Message-ID-Hash: GZ5TOX5UNX32KRHRITTZB3LOSQWEJB52
X-MailFrom: giedrius@blokas.io
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZ5TOX5UNX32KRHRITTZB3LOSQWEJB52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmsgeW91IEphcm9zbGF2ISBUaGlzIGlzIGV4YWN0bHkgd2hhdCBJIHdhcyBhZnRlci4NCg0K
T24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgNDoxNOKAr1BNIEphcm9zbGF2IEt5c2VsYSA8cGVyZXhA
cGVyZXguY3o+IHdyb3RlOg0KDQo+IE9uIDE4LiAwMy4gMjUgMTQ6NTcsIEdpZWRyaXVzIFRyYWlu
YXZpxI1pdXMgd3JvdGU6DQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBJJ20gd3JpdGluZyBhIFVDTTIg
LmNvbmYgZmlsZSwgZGVwZW5kaW5nIG9uIERldmljZSBUcmVlIG9wdGlvbnMsIHNvbWUNCj4gPiBr
Y29udHJvbHMgbWF5IG9yIG1heSBub3QgZXhpc3QgLSBob3cgZG8gSSBoYW5kbGUgdGhpcyBpbiB0
aGUNCj4gQm9vdFNlcXVlbmNlLA0KPiA+IHNvIGFsc2FjdGwgZG9lcyBub3QgZXJyb3Igb3V0IGlm
IHNvbWUgY29udHJvbHMgZG9uJ3QgZXhpc3Q/DQo+ID4NCj4gPiBJIGtub3cgdGhlcmUncyBhIHBv
c3NpYmxlIElmIGNvbmRpdGlvbiB0byBjaGVjayBpZiBhIGNvbnRyb2wgZXhpc3RzLCBidXQNCj4g
PiBob3cgZG8gSSB1c2UgdGhhdCB0byBjb25kaXRpb25hbGx5IGFwcGVuZCB0byB0aGUgQm9vdFNl
cXVlbmNlPw0KPg0KPiBFeGFtcGxlIChmcm9tIHVjbTIvSW50ZWwvc29mLWhkYS1kc3Avc29mLWhk
YS1kc3AuY29uZik6DQo+DQo+IElmLmFtdXRlIHsNCj4gICAgICAgICBDb25kaXRpb24gew0KPiAg
ICAgICAgICAgICAgICAgVHlwZSBDb250cm9sRXhpc3RzDQo+ICAgICAgICAgICAgICAgICBDb250
cm9sICJuYW1lPSdBdXRvLU11dGUgTW9kZSciDQo+ICAgICAgICAgfQ0KPiAgICAgICAgIFRydWUu
Qm9vdFNlcXVlbmNlIFsNCj4gICAgICAgICAgICAgICAgIGNzZXQgIm5hbWU9J0F1dG8tTXV0ZSBN
b2RlJyBvZmYiDQo+ICAgICAgICAgXQ0KPiB9DQo+DQo+IFRoZSBhcnJheXMgYXJlIG1lcmdlZCwg
dGh1cyBhbnkgYWRkaXRpb25hbCAnQm9vdFNlcXVlbmNlIFtdJyB3aWxsIGJlDQo+IGhhbmRlZCBh
cw0KPiBleHRlbnNpb24uDQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBKYXJvc2xhdg0KPg0KPiAtLQ0KPiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6
Pg0KPiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4N
Cj4NCg==
