Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4581425D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 08:28:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57FCA4B;
	Fri, 15 Dec 2023 08:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57FCA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702625283;
	bh=YL3VpAowZ/NRaMFAQVFEjriso3hjZwM8ArWGLNrKYp0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yl8rP3F6WNhvcs+od240mNfi47Z8EqOOIfeYcVwsqernYFHtJ9g4bhI9/MeTmCP51
	 w7typLWB8sQGkDEthvSEUFkI1HMx0FboA06hDrWAi/f7LiQpYNaiCiJp85XhrQKuNi
	 mIQ3nbm7fPUVJ/JdXCXs4B/kMI7CiuP617K12Cdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93EA3F805A1; Fri, 15 Dec 2023 08:27:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F093F805B6;
	Fri, 15 Dec 2023 08:27:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A10F8016A; Fri, 15 Dec 2023 05:51:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BD38F800D2
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 05:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD38F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=N5oxlnpl
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6d9daa5207eso267217a34.0
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 20:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702615888; x=1703220688;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMgbIMmWz8Byh5sQdnmEASgQn3VHQJkQLID67l8R3XM=;
        b=N5oxlnplY0iCgZ+XY75NEpnvuBNo7Ix1s03lGZUy96t7GCaXA5VBoufAUDzvzv0vOM
         NCXOBQi3TgLI9lzq/8R0uDgkN7Jc9xd+q0kCZ4HlxNQMM1MF78/xF+z7LAGJmJFTR3Jj
         xepb3fn9mt9UtgvFYf7gfzxBw+DsfiFODbllu9Ky9ghPg8+ylrIYaAqPxUxSTG1oEBYO
         ayl0XqxtBDnEGsvIT4th3tTKErMN6CBKd5PxwNsl4C86t6b/F1qXpf7p2XTHenyIdUVI
         4tgZffB0+he7jjAY6PZarsE3q4510tG5J3l2Gb7wyhGdBHWwZkEmKvgwOdoCTFiueAXs
         7Tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702615888; x=1703220688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMgbIMmWz8Byh5sQdnmEASgQn3VHQJkQLID67l8R3XM=;
        b=OjYheqTCdIWZrrwVcCRr67w9oTCoboxoHZJfH3HW4Mws8I08Q31MiFat2dy1j4qpXp
         FxsDoojS8mQcKcyZhybaOtx0n+uPGu+VI9SD54YuFDEtHrMheBXOzX5qzfTJYzqa5y9E
         LOHhRPTel//F7p4iCW1O7em1+ouZfDXlwCdCbEwIhKLRx1hX3Suy2AIN89L/nNGYbiVC
         SYPYeTIu4g4NgtAw5fXNbI9OpQifQMtvyWWEk34zg2P9LBA7C9QDdenpR37eGBjoVg6e
         xwRJ1HsmFZ8bDSS1hCn4wwXTDw26avI+17l05Y9sa3BhqzvfFClSXLqIzSl3SkQ/gU+f
         s/9w==
X-Gm-Message-State: AOJu0Yw1DQkuciXzqFmgr7rQ6OAC6nYmTdHvOeiAEpit1XRMrN5qH9Nn
	7UYy5LxR6Q/oY3GWwVGtQhouUAf8gUuFad6sSSGnvg==
X-Google-Smtp-Source: 
 AGHT+IEDCULWlAfHxKii7a/45hjlqEqFz9J+LkqoJZtEte2dKW7Er94SthnrhKU+Cw+x4SvVKwFPuJUe6Mm1wPWaP8M=
X-Received: by 2002:a9d:7849:0:b0:6d9:e333:6508 with SMTP id
 c9-20020a9d7849000000b006d9e3336508mr11876918otm.23.1702615888148; Thu, 14
 Dec 2023 20:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20231106104013.704356-1-jbrunet@baylibre.com>
In-Reply-To: <20231106104013.704356-1-jbrunet@baylibre.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Fri, 15 Dec 2023 12:51:17 +0800
Message-ID: 
 <CADYyEwTNyY+fR9SgfDa-g6iiDwkU3MUdPVCYexs2_3wbcM8_vg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: register hpd callback on component
 probe
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AH5ANW5D5EKYQ57E753QMK5D2GOQKEDZ
X-Message-ID-Hash: AH5ANW5D5EKYQ57E753QMK5D2GOQKEDZ
X-Mailman-Approved-At: Fri, 15 Dec 2023 07:24:55 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AH5ANW5D5EKYQ57E753QMK5D2GOQKEDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgSmVyb21lLA0KDQpBZnRlciBteSB0ZXN0aW5nLCBJIGZvdW5kIHRoYXQgdGhpcyBwYXRjaCB3
aWxsIGNhdXNlIHRoZSBhdWRpbyBvbiB0aGUNCmV4dGVybmFsIGRpc3BsYXkgdG8gbm90IHdvcmsg
cHJvcGVybHkgYWZ0ZXIgcmVzdGFydC4NCllvdSBtb3ZlIHRoZSBwbHVnZ2VkX2NiIHRvIHJ1biBp
biBoZG1pX3Byb2JlLCBhdCB0aGlzIHRpbWUgaGNwLSA+IGphY2sgPQ0KTlVMTCwgdGhlIGRyaXZl
ciBjYW5ub3QgcmVwb3J0IGAqU05EX0pBQ0tfTElORU9VVCpgIG5vcm1hbGx5Lg0KDQpzdGF0aWMg
dm9pZCBoZG1pX2NvZGVjX2phY2tfcmVwb3J0KHN0cnVjdCBoZG1pX2NvZGVjX3ByaXYgKmhjcCwN
CgkJCQkgICB1bnNpZ25lZCBpbnQgamFja19zdGF0dXMpDQp7DQoJcHJpbnRrKCJ4enEtODY2IGhk
bWlfY29kZWNfamFja19yZXBvcnQ6IGphY2s9JXgsIGphY2tfc3RhdHVzPSVkIiwNCmhjcC0+amFj
aywgamFja19zdGF0dXMgIT0gaGNwLT5qYWNrX3N0YXR1cyk7DQoJaWYgKGhjcC0+amFjayAmJiBq
YWNrX3N0YXR1cyAhPSBoY3AtPmphY2tfc3RhdHVzKSB7DQoJCXNuZF9zb2NfamFja19yZXBvcnQo
aGNwLT5qYWNrLCBqYWNrX3N0YXR1cywgU05EX0pBQ0tfTElORU9VVCk7DQoJCWhjcC0+amFja19z
dGF0dXMgPSBqYWNrX3N0YXR1czsNCgl9DQp9DQoNClNvIHdlIG11c3QgY2FsbCAgKnBsdWdnZWRf
Y2IqICBpbiAqaGRtaV9jb2RlY19zZXRfamFjaywgICpDYW4geW91IG1ha2Ugc29tZQ0KY2hhbmdl
cz8NCg0KT24gTW9uLCBOb3YgNiwgMjAyMyBhdCA2OjQw4oCvUE0gSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOg0KDQo+IFRoZSBIRE1JIGhvdHBsdWcgY2FsbGJhY2sg
dG8gdGhlIGhkbWktY29kZWMgaXMgY3VycmVudGx5IHJlZ2lzdGVyZWQgd2hlbg0KPiBqYWNrIGlz
IHNldC4NCj4NCj4gVGhlIGhvdHBsdWcgbm90IG9ubHkgc2VydmVzIHRvIHJlcG9ydCB0aGUgQVNv
QyBqYWNrIHN0YXRlIGJ1dCBhbHNvIHRvIGdldA0KPiB0aGUgRUxELiBJdCBzaG91bGQgYmUgcmVn
aXN0ZXJlZCB3aGVuIHRoZSBjb21wb25lbnQgcHJvYmVzIGluc3RlYWQsIHNvIGl0DQo+IGRvZXMg
bm90IGRlcGVuZCBvbiB0aGUgY2FyZCBkcml2ZXIgcmVnaXN0ZXJpbmcgYSBqYWNrIGZvciB0aGUg
SERNSSB0bw0KPiBwcm9wZXJseSByZXBvcnQgdGhlIEVMRC4NCj4NCj4gRml4ZXM6IDI1Y2U0ZjJi
MzU5MyAoIkFTb0M6IGhkbWktY29kZWM6IEdldCBFTEQgaW4gYmVmb3JlIHJlcG9ydGluZw0KPiBw
bHVnZ2VkIGV2ZW50IikNCj4gU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBi
YXlsaWJyZS5jb20+DQo+IC0tLQ0KPiAgc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMgfCAy
NyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2Nv
ZGVjcy9oZG1pLWNvZGVjLmMgYi9zb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYw0KPiBpbmRl
eCAwOWVlZjYwNDJhYWQuLjIwZGExZWFhNGYxYyAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2Nv
ZGVjcy9oZG1pLWNvZGVjLmMNCj4gKysrIGIvc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMN
Cj4gQEAgLTg3NywxOCArODc3LDEzIEBAIHN0YXRpYyBpbnQgaGRtaV9jb2RlY19zZXRfamFjayhz
dHJ1Y3QNCj4gc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IGhkbWlf
Y29kZWNfcHJpdiAqaGNwID0NCj4gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9u
ZW50KTsNCj4gLSAgICAgICBpbnQgcmV0ID0gLUVOT1RTVVBQOw0KPg0KPiAgICAgICAgIGlmICho
Y3AtPmhjZC5vcHMtPmhvb2tfcGx1Z2dlZF9jYikgew0KPiAgICAgICAgICAgICAgICAgaGNwLT5q
YWNrID0gamFjazsNCj4gLSAgICAgICAgICAgICAgIHJldCA9IGhjcC0+aGNkLm9wcy0+aG9va19w
bHVnZ2VkX2NiKGNvbXBvbmVudC0+ZGV2LT5wYXJlbnQsDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoY3AtPmhjZC5kYXRhLA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGx1Z2dlZF9jYiwN
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBvbmVudC0+ZGV2KTsNCj4gLSAgICAgICAgICAgICAgIGlmIChyZXQpDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGhjcC0+amFjayA9IE5VTEw7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
MDsNCj4gICAgICAgICB9DQo+IC0gICAgICAgcmV0dXJuIHJldDsNCj4gKw0KPiArICAgICAgIHJl
dHVybiAtRU5PVFNVUFA7DQo+ICB9DQo+DQo+ICBzdGF0aWMgaW50IGhkbWlfZGFpX3NwZGlmX3By
b2JlKHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpKQ0KPiBAQCAtOTgyLDYgKzk3NywyMSBAQCBzdGF0
aWMgaW50IGhkbWlfb2ZfeGxhdGVfZGFpX2lkKHN0cnVjdA0KPiBzbmRfc29jX2NvbXBvbmVudCAq
Y29tcG9uZW50LA0KPiAgICAgICAgIHJldHVybiByZXQ7DQo+ICB9DQo+DQo+ICtzdGF0aWMgaW50
IGhkbWlfcHJvYmUoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpDQo+ICt7DQo+
ICsgICAgICAgc3RydWN0IGhkbWlfY29kZWNfcHJpdiAqaGNwID0NCj4gc25kX3NvY19jb21wb25l
bnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsNCj4gKyAgICAgICBpbnQgcmV0ID0gMDsNCj4gKw0K
PiArICAgICAgIGlmIChoY3AtPmhjZC5vcHMtPmhvb2tfcGx1Z2dlZF9jYikgew0KPiArICAgICAg
ICAgICAgICAgcmV0ID0gaGNwLT5oY2Qub3BzLT5ob29rX3BsdWdnZWRfY2IoY29tcG9uZW50LT5k
ZXYtPnBhcmVudCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGhjcC0+aGNkLmRhdGEsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwbHVnZ2VkX2NiLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcG9uZW50LT5kZXYpOw0KPiArICAg
ICAgIH0NCj4gKw0KPiArICAgICAgIHJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2
b2lkIGhkbWlfcmVtb3ZlKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50KQ0KPiAg
ew0KPiAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX3ByaXYgKmhjcCA9DQo+IHNuZF9zb2NfY29t
cG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+IEBAIC05OTIsNiArMTAwMiw3IEBAIHN0
YXRpYyB2b2lkIGhkbWlfcmVtb3ZlKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudA0KPiAqY29tcG9u
ZW50KQ0KPiAgfQ0KPg0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudF9k
cml2ZXIgaGRtaV9kcml2ZXIgPSB7DQo+ICsgICAgICAgLnByb2JlICAgICAgICAgICAgICAgICAg
PSBoZG1pX3Byb2JlLA0KPiAgICAgICAgIC5yZW1vdmUgICAgICAgICAgICAgICAgID0gaGRtaV9y
ZW1vdmUsDQo+ICAgICAgICAgLmRhcG1fd2lkZ2V0cyAgICAgICAgICAgPSBoZG1pX3dpZGdldHMs
DQo+ICAgICAgICAgLm51bV9kYXBtX3dpZGdldHMgICAgICAgPSBBUlJBWV9TSVpFKGhkbWlfd2lk
Z2V0cyksDQo+DQo=
