Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82D7F1873
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:19:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB255E76;
	Mon, 20 Nov 2023 17:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB255E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497183;
	bh=Ta+Tq9bMnUlELJ80ynyY0SjTTeCTzgEha674/vQtmx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GG/j5vl8Lj9d38ptxck0+ec95AAtTLvmmEmjVaxAi7LmgaEL+XnGwaFWc8oyRsnFT
	 luxM55RoRTv+QL2M1dRzCCUs6oW83v59Y6hNJCfHzDAFwDQB4cQNOXSYo2sliuIbVZ
	 KyGMBsWEoddCXBxgxCBrvj8rP5Kaslkjh3Jh/8s4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46120F805E5; Mon, 20 Nov 2023 17:16:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB8BF805D8;
	Mon, 20 Nov 2023 17:16:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2285F80254; Sun, 19 Nov 2023 09:54:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 006A3F80166
	for <alsa-devel@alsa-project.org>; Sun, 19 Nov 2023 09:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 006A3F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kVfwJryS
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54864b675b2so1759213a12.2
        for <alsa-devel@alsa-project.org>;
 Sun, 19 Nov 2023 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700384075; x=1700988875;
 darn=alsa-project.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u5o5O4oapEMoPLkaWDrSaGsXjBZfG2QRlenlnVEgCT4=;
        b=kVfwJrySHo6uZWfkxzlp9hKQG9GOrs2x6fyQWT5dNk00Y9pihHAbOX30YmIfcqgQy/
         7xHgatp3VEf4vCal6auFBWXdk0CdLoDk7BRCiSg7YKk+IaUmzm57SEUyHUaSMVm7kAzt
         0DsKC6fqDdQzm4rco+RaGwfzaU5rKwd0/Sy34HASB/UHVLsRyZWNuGW+OwZ9QxqQ0POo
         k5psvsuiFcpfAQBWKhNHeYpUnul55Ce+qP3nV0pftsM7uIL9kWtkrr85G2Wy9idAUyHK
         SYMH949AOy+13LNyqmFtb17CVR+B1aO3nkYkHUrnhHk95+Yc9PkFKclQ99qO570+R/fH
         3gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700384075; x=1700988875;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5o5O4oapEMoPLkaWDrSaGsXjBZfG2QRlenlnVEgCT4=;
        b=YfQ6v8YoNcP82C54d235jDpbrILSmFiEBb7tMippwVPJPAnMv57+qLe3LxlqMVIjzO
         SMRWyQWmPwuHwPoplCNoQhFzbHiTG9jFqjAkEN9P8SNXkWYYG2XVZXmbSEM+1RKksD8y
         auQvm1U99TC89WEngTq6nOWDo6L3ESK9cOGQxd5m4/gqo/AqMMaORTia/VPQ1HcGZF4N
         K8IoOmWoO7oMY7Lse7HQx/o04HPTnfjy+Z3e/4y1UsihuekFCNxJLNUBuOK4YwEbXy96
         zqCiuN4Fad4RfFqLet8n8Xu/c3nweQlqyj0Ki856+WZl7zV9lYixXs1hzUB1zSAOfNlN
         RSmw==
X-Gm-Message-State: AOJu0Yw5anQi/RosLN6xbCo+uq+vO/X2ZXQuEUbQ2bCTGFK+MYPdau4a
	tyiVKJjpPEcx9dJz0M4TrWg=
X-Google-Smtp-Source: 
 AGHT+IGM2+sXv8fzRTGZzEDzAAaccOwOmEGcF5qQgEc0noTZxvWVP2Hx6FFooZ6LT3sQK+tvqpihwQ==
X-Received: by 2002:a05:6402:2d7:b0:53d:b59c:8f91 with SMTP id
 b23-20020a05640202d700b0053db59c8f91mr3250299edx.27.1700384075209;
        Sun, 19 Nov 2023 00:54:35 -0800 (PST)
Received: from [192.168.1.41]
 (dynamic-046-114-159-096.46.114.pool.telefonica.de. [46.114.159.96])
        by smtp.gmail.com with ESMTPSA id
 u10-20020aa7db8a000000b00546cf67c348sm2375745edt.59.2023.11.19.00.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 00:54:34 -0800 (PST)
Message-ID: <826bb4f4-c6ea-4c45-a0e0-5ca826f0cfe0@gmail.com>
Date: Sun, 19 Nov 2023 09:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: acp3x: Missing product ID for Thinkpad T14s Gen2 AMD Ryzen 7
 PRO 5850U
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 Linux ALSA Development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
 <251c1bea-8250-40dd-bdea-1cd739d1e77a@gmail.com>
 <a75ce6e7-5012-43d8-a222-dd2639c5969c@gmail.com>
 <78149e00-12b5-459b-8754-a17dd974916d@gmail.com>
 <87sf54jyjl.wl-tiwai@suse.de>
From: Oliver Sieber <ollisieber@gmail.com>
Autocrypt: addr=ollisieber@gmail.com; keydata=
 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
 Mi8tCaN/OlNrmLQZ1vgYMQ==
In-Reply-To: <87sf54jyjl.wl-tiwai@suse.de>
X-MailFrom: ollisieber@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6LT5UNXMZV4TJVK46LV7M6TNNCNWX6S7
X-Message-ID-Hash: 6LT5UNXMZV4TJVK46LV7M6TNNCNWX6S7
X-Mailman-Approved-At: Mon, 20 Nov 2023 16:16:46 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LT5UNXMZV4TJVK46LV7M6TNNCNWX6S7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQoNCmluIHRoZSBmb2xsb3dpbmcgSSBwcm92aWRlIG15IHByb3Bvc2VkIHBhdGNoIGZvciB0
aGUgYnVnIHJlcG9ydCBvbiANCkJ1Z3ppbGxhIFsxXS4gTGV0IG1lIHF1b3RlIGZyb20gaXQ6DQo+
IEhleSxzb3VuZC9zb2MvYW1kL3Jlbm9pci9ybi1wY2ktYWNwM3guYyBoYXMgYSBoYXJkLWNvZGVk
IGxpc3Qgb2YgcXVpcmtzLiBJdCBzZWVtcyBsaWtlIHNvbWUgcHJvZHVjdCBJRHMgbWF5IGJlIG1p
c3NpbmcuIEluIG15IGNhc2UsIEkgYW0gdXNpbmcgYSBMZW5vdm8gVGhpbmtwYWQgdDE0cyBnZW4y
IHdpdGggYW4gQU1EIFJ5emVuIDcgUFJPIDU4NTBVLg0KPiBNeSBhdWRpbyBvdXRwdXQgaXMgZmlu
ZSBidXQgbXkgaW50ZXJuYWwgbWljcm9waG9uZSBjYW5ub3QgYmUgZm91bmQuDQo+DQo+IFJ1bm5p
bmcgYGRtaWRlY29kZWAgeWllbGRzOg0KPg0KPiBIYW5kbGUgMHgwMDBGLCBETUkgdHlwZSAxLCAy
NyBieXRlcw0KPiBTeXN0ZW0gSW5mb3JtYXRpb24NCj4gCU1hbnVmYWN0dXJlcjogTEVOT1ZPDQo+
IAlQcm9kdWN0IE5hbWU6IDIwWEdTMUtUMDINCj4gCVZlcnNpb246IFRoaW5rUGFkIFQxNHMgR2Vu
IDJhDQo+DQo+IENvdWxkIGl0IGJlIHRoYXQgb25lIG1heSBoYXZlIHRvIGFkZCB0aGUgcHJvZHVj
dCBJRCAiMjBYR1MxS1QwMiIgdG8gdGhlIGhhcmQtY29kZWQgbGlzdCBvZiBxdWlya3MgaW4gcm4t
cGNpLWFjcDN4LmM/DQo+DQo+DQo+IEl0IHNlZW1zIGFzIHRoZXJlIGhhdmUgYmVlbiBzaW1pbGFy
IHByb2JsZW1zIGluIHRoZSBwYXN0LCBlLmcuaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTYyNzAuDQoNCk15IHByb3Bvc2VkIGRpZmYgbG9va3MgYXMgZm9sbG93
czoNCg0KU3ViamVjdDogQVNvQzogQU1EIFJlbm9pciAtIGFkZCBETUkgZW50cnkgZm9yIExlbm92
byBUaGlua1BhZCBUMTRzIEdlbiAyDQpGcm9tOiBPbGl2ZXIgU2llYmVyDQpUaGUgVGhpbmtQYWQg
VDE0cyBHZW4gMiBsYXB0b3AgZG9lcyBub3QgaGF2ZSB0aGUgaW50ZXJuYWwgZGlnaXRhbA0KbWlj
cm9waG9uZSBjb25uZWN0ZWQgdG8gdGhlIEFNRCdzIEFDUCBicmlkZ2UsIGJ1dCBpdCdzIGFkdmVy
dGlzZWQNCnZpYSBCSU9TLiBUaGUgaW50ZXJuYWwgbWljcm9waG9uZSBpcyBjb25uZWN0ZWQgdG8g
dGhlIEhEQSBjb2RlYy4NCg0KVXNlIERNSSB0byBibG9jayB0aGUgbWljcm9waG9uZSBQQ00gZGV2
aWNlIGZvciB0aGlzIHBsYXRmb3JtLg0KDQpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgU2llYmVyIDxv
bGxpc2llYmVyQGdtYWlsLmNvbT4NCi0tLQ0KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hbWQvcmVu
b2lyL3JuLXBjaS1hY3AzeC5jIA0KYi9zb3VuZC9zb2MvYW1kL3Jlbm9pci9ybi1wY2ktYWNwM3gu
Yw0KaW5kZXggYjM4MTJiNzBmNWY5Li43NTRlMjRkNTVlNmYgMTAwNjQ0DQotLS0gYS9zb3VuZC9z
b2MvYW1kL3Jlbm9pci9ybi1wY2ktYWNwM3guYw0KKysrIGIvc291bmQvc29jL2FtZC9yZW5vaXIv
cm4tcGNpLWFjcDN4LmMNCkBAIC0xOTksNiArMTk5LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZG1pX3N5c3RlbV9pZCANCnJuX2FjcF9xdWlya190YWJsZVtdID0gew0KIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRE1JX0VYQUNUX01BVENIKERNSV9CT0FS
RF9OQU1FLCAiMjBOTENUTzFXVyIpLA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
DQogwqDCoMKgwqDCoMKgwqAgfSwNCivCoMKgwqDCoMKgwqAgew0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLyogTGVub3ZvIFRoaW5rUGFkIFQxNHMgR2VuIDIgKi8NCivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5tYXRjaGVzID0gew0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIERNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAi
TEVOT1ZPIiksDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
RE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9OQU1FLCAiMjBYR1MxS1QwMiIpLA0KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KK8KgwqDCoMKgwqDCoCB9LA0KIMKgwqDCoMKgwqDCoMKg
IHt9DQoNCiDCoH07DQoNCg0KDQpQbGVhc2UgaGF2ZSBpbiBtaW5kIHRoYXQgdGhpcyBpcyBteSBm
aXJzdCBwYXRjaCBmb3IgdGhlIGtlcm5lbC4NCg0KVGhhbmtzIQ0KWzFdOiBodHRwczovL2J1Z3pp
bGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxODE0OA0K
