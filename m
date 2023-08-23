Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C9786876
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B505E72;
	Thu, 24 Aug 2023 09:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B505E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862651;
	bh=Ee8xB/mAWkog/RCrEV39tKWALqybfTmeX+s4iTp2Mm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OPDWRhpjg88ek7ZgNYxfW+j5vNLw2poJpfunR6tmYH9Wsg0azwgPnT097PyH2WlwC
	 kK5EqAYqvovLdIcKwv3G7RRy6FHC1Sm20L8cIPtIUiz3pXOf7EHB+AWRYTWkfH6CrL
	 UypHG1/BzQhGvDTVZYruuLqAURJsNLfr0V23ROuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BF6CF80615; Thu, 24 Aug 2023 09:32:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 783BEF80613;
	Thu, 24 Aug 2023 09:32:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23F99F80158; Wed, 23 Aug 2023 10:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFBDAF800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFBDAF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=OxuoON8T
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4ffa94a7a47so6883795e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692779758; x=1693384558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Cz/UQa94Zs7JAEORd9wmD8MG+lN6decCZtyFpWABzc=;
        b=OxuoON8Tzug6+Al/lcL/0zc7DHtoK0vs3Ip8ObMRm6GNmCQQdPEv/bj3GbVPEO0AYi
         GvA649rwT+FAlPACHGAfl8fvFN6b44B7SIYXOVG0WJ+3GqpgqKcf5vqKM7hQPR/JdQK+
         K2sdNcUyo/Q1X2xEnoADrzzgMRIJL3Ijkd9AjOmGDdIgTigjXr8jqSfa6YVADRRKufRm
         boZPu6cYuu6Cn6/b2lcSQgQPOr3J3IaGb5/vRYFDe23tn+a2IvSPQT5HFNI9l4zyq6ks
         W5kccnIjo+Y/1iW13/tzTWIVgUf3mbMj5nwZEu8cHEU67fO95+IJO1yl+UTgK+HbqDqM
         /FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692779758; x=1693384558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Cz/UQa94Zs7JAEORd9wmD8MG+lN6decCZtyFpWABzc=;
        b=U+5tAwNX3FUQtvMTsayPDmmK3I4+qtGaaR1OhzXdDE5ye35A6KImRXJteSbm5v5U4T
         zwPT7CMflSvrGGb0nv//L56YBfhHim82b1eFmpPJ+o7cTW+GatdnvK3/swW2BFUEwYEz
         zSlvW62SGFkQPakn9HrZsHZXQoql9rJ2DGelkg/t4t+7poIWqv71+Diibsa8Qi301xB9
         iJQiNijHcPqNPxqWI9fSiV92WosSlDPZcOW7lWa+8Af/Ib39x6sE5XJPbpCxVL4S4vJU
         23XWOtU2eBRI76Eq3IaijI9HBW4M1yl2RtTgg4xO+LYKmsusB8rWIlDSjhoM1dW+EtQD
         ISmQ==
X-Gm-Message-State: AOJu0YyP4YP6lyCUduVw/MqGLdFe7PluXSEn+SXorvJJOFKOozXat/f0
	nGMFe+WFZ3kV+rOXZAdH1SKoNwvhM+vkXNBDYzE=
X-Google-Smtp-Source: 
 AGHT+IHofmIYEaSzPfxOLCFMrBKIYZN+zWyWKyZedMMxTTW1OIgPuzn0vl1E/05BFJ1nHliWZD5g4qRhqGV7tR4MyMk=
X-Received: by 2002:a05:6512:1287:b0:4fc:4f3e:9cbf with SMTP id
 u7-20020a056512128700b004fc4f3e9cbfmr9951925lfs.50.1692779753782; Wed, 23 Aug
 2023 01:35:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAGmPKz5OeC6UVBif6ySevZEvaY_XwKh7A29K7k_Yq_D0CQJkCA@mail.gmail.com>
 <87a5uk8yiw.wl-tiwai@suse.de>
In-Reply-To: <87a5uk8yiw.wl-tiwai@suse.de>
From: Rohit Pidaparthi <rohitpid@gmail.com>
Date: Wed, 23 Aug 2023 01:35:42 -0700
Message-ID: 
 <CAGmPKz7ZDEuuB-wg+rrut0oUCXvBwhv+63pDJwGD2kmiy_CjoA@mail.gmail.com>
Subject: Re: [PATCH] fix: Add quirk for Asus Zenbook Pro 14 UX6404 laptop
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, perex@perex.cz, tiwai@suse.com,
	luke@ljones.dev, sbinding@opensource.cirrus.com
X-MailFrom: rohitpid@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B4FS7J3NFF6EGCHIHD5ZIU3C6G62FYQM
X-Message-ID-Hash: B4FS7J3NFF6EGCHIHD5ZIU3C6G62FYQM
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:32:03 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4FS7J3NFF6EGCHIHD5ZIU3C6G62FYQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RGVhciBUYWthc2hpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gSSB3aWxsIHN1Ym1pdCBh
IHBhdGNoIHNob3J0bHksIHNvcnJ5IGZvciB0aGUgZGVsYXkuDQoNCkJlc3QsDQpSb2hpdA0KDQpP
biBNb24sIEF1ZyAyMSwgMjAyMyBhdCAzOjQ14oCvQU0gVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNl
LmRlPiB3cm90ZToNCg0KPiBPbiBTYXQsIDE5IEF1ZyAyMDIzIDEyOjE4OjQ4ICswMjAwLA0KPiBS
b2hpdCBQaWRhcGFydGhpIHdyb3RlOg0KPiA+DQo+ID4gPkZyb20gNGYxNGNkYWQ0ZjUyNmY0NTc0
N2M0ZjBiNzFlMjRhNDZlYmUzODg1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gPiBGcm9t
OiBSb2hpdCBQaWRhcGFydGhpIDxyb2hpdHBpZEBnbWFpbC5jb20+DQo+ID4gRGF0ZTogU2F0LCAx
OSBBdWcgMjAyMyAwMjoxNToxNiAtMDcwMA0KPiA+IFN1YmplY3Q6IFtQQVRDSF0gZml4OiBBZGQg
cXVpcmsgZm9yIEFzdXMgWmVuYm9vayBQcm8gMTQgVVg2NDA0IGxhcHRvcA0KPiA+DQo+ID4gVGhl
IEFzdXMgWmVuYm9vayBQcm8gMTQgVVg2NDA0ICgxMDQzOjE4NjMpIG5lZWRzIGJpbmRpbmcgdG8g
dGhlDQo+ID4gQ1MzNUw0MSBjb2RlYyBvdmVyIHNwaTEgcmF0aGVyIHRoYW4gc3BpMC4gVGhpcyBp
cyBzaW1pbGFyIHRvDQo+ID4gZXhpc3RpbmcgcXVpcmtzIGZvciBtYW55IEFTVVMgTGFwdG9wcy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvaGl0IFBpZGFwYXJ0aGkgPHJvaGl0cGlkQGdtYWls
LmNvbT4NCj4NCj4gVGhlIHBhdGNoIGlzbid0IGFwcGxpY2FibGUgY2xlYW5seSwgbGlrZWx5IHlv
dXIgbWFpbGVyIGJyb2tlIHRoZQ0KPiB0YWJzIGFuZCBzcGFjZXMuICBDb3VsZCB5b3UgcmVzdWJt
aXQgcHJvcGVybHk/DQo+DQo+IEFsc28sIHRoZSBxdWlyayB0YWJsZSBlbnRyaWVzIGFyZSBzb3J0
ZWQgaW4gUENJIFNTSUQgb3JkZXIuICBQbGVhc2UNCj4gcHV0IHRoZSBuZXcgZW50cnkgYXQgdGhl
IHJpZ2h0IHBvc2l0aW9uLg0KPg0KPg0KPiB0aGFua3MsDQo+DQo+IFRha2FzaGkNCj4NCj4gPiAt
LS0NCj4gPiBzb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyB8IDEgKw0KPiA+IDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jDQo+IGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMNCj4g
PiBpbmRleCBkYzdiN2E0MDc2MzguLmM0NDQ2NGIxNjE5ZiAxMDA2NDQNCj4gPiAtLS0gYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYw0KPiA+ICsrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hf
cmVhbHRlay5jDQo+ID4gQEAgLTk2ODEsNiArOTY4MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX3BjaV9xdWlyaw0KPiBhbGMyNjlfZml4dXBfdGJsW10gPSB7DQo+ID4gICAgICAgIFNORF9Q
Q0lfUVVJUksoMHgxMDQzLCAweDFkNDIsICJBU1VTIFplcGh5cnVzIEcxNCAyMDIyIiwNCj4gPiBB
TEMyODlfRklYVVBfQVNVU19HQTQwMSksDQo+ID4gICAgICAgIFNORF9QQ0lfUVVJUksoMHgxMDQz
LCAweDFkNGUsICJBU1VTIFRNNDIwIiwNCj4gQUxDMjU2X0ZJWFVQX0FTVVNfSFBFKSwNCj4gPiAg
ICAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWUwMiwgIkFTVVMgVVgzNDAyIiwNCj4gQUxD
MjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzIpLA0KPiA+ICsgICAgIFNORF9QQ0lfUVVJUksoMHgxMDQz
LCAweDE4NjMsICJBU1VTIFVYNjQwNCIsDQo+IEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwN
Cj4gPiAgICAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWUxMSwgIkFTVVMgWmVwaHlydXMg
RzE1IiwNCj4gPiBBTEMyODlfRklYVVBfQVNVU19HQTUwMiksDQo+ID4gICAgICAgIFNORF9QQ0lf
UVVJUksoMHgxMDQzLCAweDFlMTIsICJBU1VTIFVNMzQwMiIsDQo+IEFMQzI4N19GSVhVUF9DUzM1
TDQxX0kyQ18yKSwNCj4gPiAgICAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWU1MSwgIkFT
VVMgWmVwaHlydXMgTTE1IiwNCj4gPiBBTEMyOTRfRklYVVBfQVNVU19HVTUwMl9QSU5TKSwNCj4g
PiAtLQ0KPiA+IDIuMzkuMg0KPiA+DQo+DQo=
