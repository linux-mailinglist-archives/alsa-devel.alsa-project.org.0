Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C11ADB7AE
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jun 2025 19:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4CD1601BB;
	Mon, 16 Jun 2025 19:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4CD1601BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750094246;
	bh=0SsQjYi4pNuoFettM9j6YpeWybQyN72AEF9jz6UsccA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HMYnJTU8UBCxzffHD4XPBlORmk3sImtldJHtReweH8J4aAwiEAYV6DEkoT/6/IBgd
	 z+j8P5hMD8w1Gtj8pyjp5sq3lFH/pOGNifgYtwewhUPHvxwm9at9Sn33fHBzFYmUyZ
	 qGEHQ4PUdXwhG8Gsb9qwDwxPcW/8iVhiHCFJNeOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 956EDF805C9; Mon, 16 Jun 2025 19:16:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D2E2F805C6;
	Mon, 16 Jun 2025 19:16:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8F1AF80124; Mon, 16 Jun 2025 19:16:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F609F800C1
	for <alsa-devel@alsa-project.org>; Mon, 16 Jun 2025 19:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F609F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qcmixc8Z
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-60789b450ceso9297735a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 16 Jun 2025 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750094207; x=1750699007;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnAlZCEwjALuVTZPMc7ZKg+OCXKppiMZ+EX3XUonCo0=;
        b=Qcmixc8Z7HcMTiSnbqcIhZPMPOp4HB6DrgJpSQwDuXQPQyitJ2TjozzoMuUL8TyTfY
         y+QZBLOMJg0hiq590nU6SvOQA7YbE3sztp0usMwvEQdfrDs0OhmIBP8t1fbICMQF661v
         V1evmRvXST5prUlqetjfFx31UnLONwsWN2f5ThfHsAGJ+BV2YOYcAcD5+JqBYiWP1lRx
         FyQZ2kW4LX4mDYJ85fv50bbBViRWzkIFlbDU2EjkTtDWCTBOWxAbI5WmgkG4yjIxZU90
         4grnOPL/YDb3It9tzcpAk5pqLJmlXrDqdeCKS/76+Mrt/fqztA8FXVwmApHv+ByuoJim
         vi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750094207; x=1750699007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnAlZCEwjALuVTZPMc7ZKg+OCXKppiMZ+EX3XUonCo0=;
        b=dRhsTsfLqDgHW75yJTJfoHRgSpyPh7ElL+5GqDcm8ovMlgYXi/ofmL1uHGDQGnC+9F
         v8CqzpYolQYXpyarqqXqG9MLaNuE+W3P7aFnMk0lQCnIQP5LJ1db/on6BYQvyY3prlti
         +NtnUE+lixJxNVPwQBEX1IbYpC5sHwAMIZzwm3bJH54PjRfm/dNkTUwcxBs2DL6omOXv
         dJ7xAFRMTPetGdXNfHMVMilvkaV5uY06rZHyh8LifZntawU9KQacE7uMdE9lXqUlSatG
         zs+UMTLy2DjQJwhYwt2SJ2dUzYTFe3iegQ//PoN/XoSVM3xqng+GJmoxOVMf5LUOC711
         l8Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLBKy3DVW9n6+E6mZao/b5QLgDGbZUvdm6EwVE9eEHKvm4SeMOGyHRgBoehRbWfUCSJJeKJ5xfmqQD@alsa-project.org
X-Gm-Message-State: AOJu0Ywwe33JrF1hNyAt7AVfzi0nMO2nH9QPGRzSSPrZji/Ofc0ksngR
	/3JzrSqc+dT3IDtKQTnU0ZD4v8TNROIkGfyUbXa8yMfQxrjsx3JqUM/4d/Cu2VlsLLQpgndcuNu
	nrkmto9i2kGDG+KPRdW76upHIr7dmdjA=
X-Gm-Gg: ASbGncvXYnrWk5AEXb2HCSxEGZL4C7s0/XcIJlVHiTEVxEaC1nMU2l2zY4/hdLcW3jB
	DTnwH1y/mFVAu8waPt8IQdxutQ6c5NH8i9XA77HDh5yvPAfFXG1VS+lbnoJxTXFfd1TOYv1YBdU
	pDIFUa1IU1rynEt7eq2w8BSWPmkNzXaMmE+L+jnw14PiAK
X-Google-Smtp-Source: 
 AGHT+IE2CIvgF2Q+mGZD7sfQhmZyCKXCThtAPRykVkRSBFP1bjH32pweBSVRAgSO9tXT+JVNYtPJq6/DflZH4yrzlyI=
X-Received: by 2002:a17:907:7e92:b0:ade:7bd:e0ec with SMTP id
 a640c23a62f3a-adfad6cdf15mr1046047266b.56.1750094206587; Mon, 16 Jun 2025
 10:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250612044252.1025-1-shenghao-ding@ti.com>
 <174974613496.91503.16994166821243155893.b4-ty@kernel.org>
In-Reply-To: <174974613496.91503.16994166821243155893.b4-ty@kernel.org>
From: Jay Thomas <jayt0808@gmail.com>
Date: Mon, 16 Jun 2025 13:16:35 -0400
X-Gm-Features: AX0GCFs2Qwa4CS8uEHaiTymvu8l3TA8RFxUSINZzmKvK8zG5xB2uj3XKvWLoLRE
Message-ID: 
 <CAH3okKvx4=V23ES090QOMUMmypOVJdFBhn7fPG=Fe13StszZcA@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Move the "include linux/debugfs.h" into
 tas2781.h
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, andriy.shevchenko@linux.intel.com,
 tiwai@suse.de,
	13916275206@139.com, 13564923607@139.com, alsa-devel@alsa-project.org,
	baojun.xu@ti.com, jesse-ji@ti.com
Message-ID-Hash: PITAMV6VCEMFAXBIYGP5J67FSPM6OHG5
X-Message-ID-Hash: PITAMV6VCEMFAXBIYGP5J67FSPM6OHG5
X-MailFrom: jayt0808@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PITAMV6VCEMFAXBIYGP5J67FSPM6OHG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SSB3b3VsZCBsaWtlIHRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBlbWFpbCBsaXN0LiAgSG93IGRv
IEkgZG8gdGhhdD8NCg0KT24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgMTI6MzbigK9QTSBNYXJrIEJy
b3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOg0KDQo+IE9uIFRodSwgMTIgSnVuIDIwMjUg
MTI6NDI6NTIgKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6DQo+ID4gTW92ZSB0aGUgaW5jbHVk
ZSBsaW51eC9kZWJ1Z2ZzLmggaW50byB0YXMyNzgxLmggZm9yIGNvZGUgY2xlYW4uDQo+ID4NCj4g
Pg0KPg0KPiBBcHBsaWVkIHRvDQo+DQo+ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc291bmQuZ2l0DQo+IGZvci1uZXh0DQo+DQo+IFRo
YW5rcyENCj4NCj4gWzEvMV0gQVNvQzogdGFzMjc4MTogTW92ZSB0aGUgImluY2x1ZGUgbGludXgv
ZGVidWdmcy5oIiBpbnRvIHRhczI3ODEuaA0KPiAgICAgICBjb21taXQ6IDhhNWE1Y2VjYjc5MDU4
YjYwOGU1NTYyZDg5OTgxMjNhM2FkYjMxM2MNCj4NCj4gQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFu
cyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0DQo+IHRyZWUg
KHVzdWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVz
IGR1cmluZw0KPiB0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1
ZyBmaXgpLCBob3dldmVyIGlmDQo+IHByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBh
dGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLg0KPg0KPiBZb3UgbWF5IGdldCBmdXJ0aGVy
IGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nDQo+IGFu
ZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5n
IHByb2JsZW1zIGFuZA0KPiBzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNz
dWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4NCj4NCj4gSWYgYW55IHVwZGF0ZXMgYXJl
IHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQ0KPiBz
aG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQs
IGV4aXN0aW5nDQo+IHBhdGNoZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQuDQo+DQo+IFBsZWFzZSBh
ZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4gcmVw
bHlpbmcNCj4gdG8gdGhpcyBtYWlsLg0KPg0KPiBUaGFua3MsDQo+IE1hcmsNCj4NCj4NCg==
