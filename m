Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E3746B4A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 09:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04F0851;
	Tue,  4 Jul 2023 09:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04F0851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688457439;
	bh=jB1/DWVJxnWQM/so14LoVd9LwqqwTW+J1+12UZYrchg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c6WobSWWW1wxcKk8Zzx/V+UhuvAqSGgUoBT3IJHnBUAOmKN8HAY0O/aXx/3bnzQeA
	 lrxcYkDn/EM7O/ejkbzJirSjcBsX4pjzfNS4rXE0Euo20UOU5KHd/GUxM2Kjb9K00P
	 KPcja/C0/mXcM94anS5ALFIR4invKLAsS9+cWa28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB13BF80570; Tue,  4 Jul 2023 09:55:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 596F7F8055A;
	Tue,  4 Jul 2023 09:55:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B3C0F80125; Tue,  4 Jul 2023 09:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FD03F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 09:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD03F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=YqVWrq4J
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f766777605so8173827e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Jul 2023 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688456798; x=1691048798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p1Dg1yh/CaKjtIZqVOCs9qJ34fsbrfyQUu2yhOVOmp4=;
        b=YqVWrq4JWiUcqqbKYjLW+TLDS5HCjdLJ/2HzrjTCiqq7slRR1YOCj2kST8hxxEIlRa
         4zW2QjQiWeXh/Hh6fFB66fy0wKyUS2WLgbq/eLG6nNv72NDNQHccf4HZjCPrMSYZW592
         D7u6xU5KkQjgohmkXbjBWknRYTGcB1g/Nmj/4s/92CXgHQtKp/ap56wl4274Hn+dA0Jc
         xZFvrj56xogUXuYrb5RU1LZV8nbbj4ov3SW4+22bBoaExsQshmaedQEdhbpFv+a4eKxT
         FKZPmIY3FLBm7veBN3jCYrzFRa67OeWbMhPgZLX08LFRtDh4k9S8E1EQnIyDvBQpCwyW
         uM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688456798; x=1691048798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1Dg1yh/CaKjtIZqVOCs9qJ34fsbrfyQUu2yhOVOmp4=;
        b=WIv8BFR/IYoyFANfQjGAOVcAOBpQbADeWtGfYOqzuoy2WTY8evN2K9VqXSsCZTYGHn
         WUtUcuHcX9oBLMlTdxzcTsG9Ddpe7hSukH57EO6xT06LtklXK2i249HbPzjzPIquiPn/
         FmEp35DrOVCDM91t8FunmJm2GT9wInPi8UggJZOnyFy/DOatts02KmGpu0+sj0NkgJ7m
         tIdLy1fwwWKVVoulg+kLJ+4sCb8xoCsqdLwal3Zf7Lq7UckTEoiCMB8ZMDi5Dr/XAKHH
         x5ZZ/xTtcTfB/SWgZFOq9AAcU9oSdIkQJlvk7Mu3jl66o5FgV2+6pO+qTpZ2B8pPlqaC
         aK9A==
X-Gm-Message-State: ABy/qLbClELgPOOUw8EE46d87YR5ZZxMNaWIgBZVIChMqTXd4k5wow3a
	ZYG4XxW9ff/Q3oKXpmmh7WnFAaO4/aJzBfDtwK8=
X-Google-Smtp-Source: 
 APBJJlGrVaTOW97bBVasVEqhKP7YGiU7+0a87bnVkpdDubBdLImBDhXIxXR04JvwYsAc7pQojktedmbMQgMMQX3w3Tk=
X-Received: by 2002:a05:6512:250b:b0:4fb:8cc0:57e3 with SMTP id
 be11-20020a056512250b00b004fb8cc057e3mr9404428lfb.62.1688456797748; Tue, 04
 Jul 2023 00:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230703031016.1184711-1-islituo@gmail.com>
 <87a5wd76v9.wl-tiwai@suse.de>
In-Reply-To: <87a5wd76v9.wl-tiwai@suse.de>
From: Tuo Li <islituo@gmail.com>
Date: Tue, 4 Jul 2023 15:46:28 +0800
Message-ID: 
 <CADm8Tek0mGzAx-JSRO33PiKtzxyfkUk=_HW3y-EQDw7eC2RBjg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: fix a possible null-pointer dereference due to
 data race in snd_hdac_regmap_sync()
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baijiaju1990@outlook.com,
	BassCheck <bass@buaa.edu.cn>
X-MailFrom: islituo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JE5EDSWO4AXGGTNDMHRB6RZQWQATS457
X-Message-ID-Hash: JE5EDSWO4AXGGTNDMHRB6RZQWQATS457
X-Mailman-Approved-At: Tue, 04 Jul 2023 07:55:37 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmtzIGZvciB5b3VyIHJlcGx5IQ0KDQpCZXN0IHJlZ2FyZHMsDQpUdW8gTGkNCg0KT24gTW9u
LCBKdWwgMywgMjAyMyBhdCA0OjEw4oCvUE0gVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPiB3
cm90ZToNCg0KPiBPbiBNb24sIDAzIEp1bCAyMDIzIDA1OjEwOjE2ICswMjAwLA0KPiBUdW8gTGkg
d3JvdGU6DQo+ID4NCj4gPiBUaGUgdmFyaWFibGUgY29kZWMtPnJlZ21hcCBpcyBvZnRlbiBwcm90
ZWN0ZWQgYnkgdGhlIGxvY2sNCj4gPiBjb2RlYy0+cmVnbWFwX2xvY2sgd2hlbiBpcyBhY2Nlc3Nl
ZC4gSG93ZXZlciwgaXQgaXMgYWNjZXNzZWQgd2l0aG91dA0KPiA+IGhvbGRpbmcgdGhlIGxvY2sg
d2hlbiBpcyBhY2Nlc3NlZCBpbiBzbmRfaGRhY19yZWdtYXBfc3luYygpOg0KPiA+DQo+ID4gICBp
ZiAoY29kZWMtPnJlZ21hcCkNCj4gPg0KPiA+IEluIG15IG9waW5pb24sIHRoaXMgbWF5IGJlIGEg
aGFybWZ1bCByYWNlLCBiZWNhdXNlIGlmIGNvZGVjLT5yZWdtYXAgaXMNCj4gPiBzZXQgdG8gTlVM
TCByaWdodCBhZnRlciB0aGUgY29uZGl0aW9uIGlzIGNoZWNrZWQsIGEgbnVsbC1wb2ludGVyDQo+
ID4gZGVyZWZlcmVuY2UgY2FuIG9jY3VyIGluIHRoZSBjYWxsZWQgZnVuY3Rpb24gcmVnY2FjaGVf
c3luYygpOg0KPiA+DQo+ID4gICBtYXAtPmxvY2sobWFwLT5sb2NrX2FyZyk7IC0tPiBMaW5lIDM2
MCBpbg0KPiBkcml2ZXJzL2Jhc2UvcmVnbWFwL3JlZ2NhY2hlLmMNCj4gPg0KPiA+IFRvIGZpeCB0
aGlzIHBvc3NpYmxlIG51bGwtcG9pbnRlciBkZXJlZmVyZW5jZSBjYXVzZWQgYnkgZGF0YSByYWNl
LCB0aGUNCj4gPiBtdXRleF9sb2NrIGNvdmVyYWdlIGlzIGV4dGVuZGVkIHRvIHByb3RlY3QgdGhl
IGlmIHN0YXRlbWVudCBhcyB3ZWxsIGFzDQo+IHRoZQ0KPiA+IGZ1bmN0aW9uIGNhbGwgdG8gcmVn
Y2FjaGVfc3luYygpLg0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IEJhc3NDaGVjayA8YmFzc0BidWFh
LmVkdS5jbj4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUdW8gTGkgPGlzbGl0dW9AZ21haWwuY29tPg0K
Pg0KPiBQcmFjdGljYWxseSBzZWVuLCBpdCdzIHByZXR0eSBoYXJtbGVzcywgYXMgdGhlIGZsYWcg
aXMgc2V0IGF0IHRoZSB2ZXJ5DQo+IGJlZ2lubmluZyBvZiB0aGUgY29kZWMgZHJpdmVyIHByb2Jl
LCB3aGlsZSBzbmRfaGRhY19yZWdtYXBfc3luYygpIGlzDQo+IHVzZWQgb25seSBpbiB0aGUgcnVu
dGltZSBQTSByZXN1bWUgdGhhdCBtdXN0IG5vdCBoYXBwZW4gZHVyaW5nIHRoZQ0KPiBwcm9iZS4g
IElPVywgY29kZWMtPnJlZ21hcF9sb2NrIGl0c2VsZiBpc24ndCByZWFsbHkgbWVhbnQgdG8NCj4g
cHJvdGVjdHRoZSBjaGFuZ2Ugb2YgY29kZWMtPnJlZ21hcCBmbGFnLg0KPg0KPiBPVE9ILCB5b3Vy
IGNoYW5nZSBtYWtlcyB0aGluZ3MgbW9yZSBjb25zaXN0ZW50LCBzbyBJIGFwcGxpZWQgdGhlIHBh
dGNoDQo+IG5vdy4NCj4NCj4NCj4gVGhhbmtzIQ0KPg0KPiBUYWthc2hpDQo+DQo+DQo+ID4gLS0t
DQo+ID4gIHNvdW5kL2hkYS9oZGFjX3JlZ21hcC5jIHwgNyArKystLS0tDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvc291bmQvaGRhL2hkYWNfcmVnbWFwLmMgYi9zb3VuZC9oZGEvaGRhY19yZWdtYXAuYw0K
PiA+IGluZGV4IGZlMzU4NzU0N2NmZS4uMzk2MTBhMTViY2M5IDEwMDY0NA0KPiA+IC0tLSBhL3Nv
dW5kL2hkYS9oZGFjX3JlZ21hcC5jDQo+ID4gKysrIGIvc291bmQvaGRhL2hkYWNfcmVnbWFwLmMN
Cj4gPiBAQCAtNTk3LDEwICs1OTcsOSBAQCBFWFBPUlRfU1lNQk9MX0dQTChzbmRfaGRhY19yZWdt
YXBfdXBkYXRlX3Jhd19vbmNlKTsNCj4gPiAgICovDQo+ID4gIHZvaWQgc25kX2hkYWNfcmVnbWFw
X3N5bmMoc3RydWN0IGhkYWNfZGV2aWNlICpjb2RlYykNCj4gPiAgew0KPiA+IC0gICAgIGlmIChj
b2RlYy0+cmVnbWFwKSB7DQo+ID4gLSAgICAgICAgICAgICBtdXRleF9sb2NrKCZjb2RlYy0+cmVn
bWFwX2xvY2spOw0KPiA+ICsgICAgIG11dGV4X2xvY2soJmNvZGVjLT5yZWdtYXBfbG9jayk7DQo+
ID4gKyAgICAgaWYgKGNvZGVjLT5yZWdtYXApDQo+ID4gICAgICAgICAgICAgICByZWdjYWNoZV9z
eW5jKGNvZGVjLT5yZWdtYXApOw0KPiA+IC0gICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZjb2Rl
Yy0+cmVnbWFwX2xvY2spOw0KPiA+IC0gICAgIH0NCj4gPiArICAgICBtdXRleF91bmxvY2soJmNv
ZGVjLT5yZWdtYXBfbG9jayk7DQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwoc25kX2hk
YWNfcmVnbWFwX3N5bmMpOw0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4NCg==
