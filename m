Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38557EF345
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 14:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B3A93A;
	Fri, 17 Nov 2023 14:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B3A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700226230;
	bh=dhTrDJeEomdAh5nZpmouV+FEVmzxXHiL/V270ItCRto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RBJhhgdp6W74Okp2ImGWw83l1lYBmgnUAFwZ5nEOwC/j5ULBZqDxMOj97ZhTNyc8z
	 ZUmI6n6Y7OQJk2h/Oy3plNC5jveGIadN9BgpAEjXVYgsVxToYzVGD+7yOfAUlQ6R7n
	 QnMSaGBGlM0lsReyvwpYI9dQ57jT3Av3xVHGBf8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA21F80578; Fri, 17 Nov 2023 14:02:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5045DF80570;
	Fri, 17 Nov 2023 14:02:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50055F801D5; Fri, 17 Nov 2023 08:18:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9596F80166
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 08:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9596F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m/1zWLAx
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso13967105e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 23:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700205471; x=1700810271;
 darn=alsa-project.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L543rvC1TPuwmAspDZo/xfuYvHE2Jev/LgUkzEAXV14=;
        b=m/1zWLAxf0PBMoLJqR0YVlcXMK/oerXYHnFzV0qrYdjN0gMPv4yEIClFVw7SrXEpuS
         we8NzuNjAtPkf4nLuGWCn0SaXCsRolp43vdu+WLY9R29wpPxcoYe8+/LivtNsdV3s1XX
         ThQ+0X/UHf2w3ANFJPc/qgh/EyEKkZYVxnwCja8Bd0a2StV4jU27R+zQnc5j7j4gtM1o
         a2oRAHH/XjApcAuP83pK2ck5ubF2Zvb+wjedeMXdy84T1YRMujcP3vv5nLEJLZKoSFUQ
         1sYYdF8FVS0qbh4kESqZdvyn6iJ49Nop0BLnuLlG7RhTtUC2PtTOruDR1I6XAw4QHsfJ
         ebQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700205471; x=1700810271;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L543rvC1TPuwmAspDZo/xfuYvHE2Jev/LgUkzEAXV14=;
        b=a/FwVYOdrUXcgGRJmzLuH0KVjxuN0qOs6jo+Fb9mFRnSNe20fsVxCxNTDf7c+8dtlt
         QUx8Nf1CV3LEs6Hbn3kduYI+YBQQUtOGgfMen/KdOD53UfhkmlU2RNuYgeWvOEtgmzKk
         HFLYM54r3PBQudfHOv/YA4OK5diM8isaTJJJDJYW0/s190IVstlMtb1wBrdsuEgEjg4y
         41skX2RNgt827a+oL9dJoszqK4cydV71EAjP0EmIiAwol6237YYgW3TaQ3soK/XuqrNA
         tCBdvqHQE5V8JgGW08cWn1RiL/PY5fss97M/m7dXDmq5eHfoyaZLXrXl/FBoRlzCyIGg
         KUYw==
X-Gm-Message-State: AOJu0YwDhkzjFish0kYtZQHLbFCOFbttPxOQGlylV1Qv7Ykc5S445dto
	rN0YOID4antCGE08gEgQoBY=
X-Google-Smtp-Source: 
 AGHT+IE+nQ4FISV/OqSXe5yne8e3nN+UN8AUxq5YPcBumiEJMlA9Q2BpOz89LXR52pRVZPGRyr1aTw==
X-Received: by 2002:a05:600c:230f:b0:408:3d91:8263 with SMTP id
 15-20020a05600c230f00b004083d918263mr14060646wmo.13.1700205470724;
        Thu, 16 Nov 2023 23:17:50 -0800 (PST)
Received: from ?IPV6:2003:d3:8f2b:ca00:6797:299b:3e2c:2391?
 (p200300d38f2bca006797299b3e2c2391.dip0.t-ipconnect.de.
 [2003:d3:8f2b:ca00:6797:299b:3e2c:2391])
        by smtp.gmail.com with ESMTPSA id
 y15-20020a05600c364f00b004060f0a0fd5sm1648753wmq.13.2023.11.16.23.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 23:17:50 -0800 (PST)
Message-ID: <78149e00-12b5-459b-8754-a17dd974916d@gmail.com>
Date: Fri, 17 Nov 2023 08:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: acp3x: Missing product ID for Thinkpad T14s Gen2 AMD Ryzen 7
 PRO 5850U
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 Linux ALSA Development <alsa-devel@alsa-project.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
 <251c1bea-8250-40dd-bdea-1cd739d1e77a@gmail.com>
 <a75ce6e7-5012-43d8-a222-dd2639c5969c@gmail.com>
From: Oliver Sieber <ollisieber@gmail.com>
Autocrypt: addr=ollisieber@gmail.com; keydata=
 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
 Mi8tCaN/OlNrmLQZ1vgYMQ==
In-Reply-To: <a75ce6e7-5012-43d8-a222-dd2639c5969c@gmail.com>
X-MailFrom: ollisieber@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MS6H3CG7E6SZH5DI3LRAVMI3LLIFVG2T
X-Message-ID-Hash: MS6H3CG7E6SZH5DI3LRAVMI3LLIFVG2T
X-Mailman-Approved-At: Fri, 17 Nov 2023 13:01:56 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MS6H3CG7E6SZH5DI3LRAVMI3LLIFVG2T/>
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
b3dfYnVnLmNnaT9pZD0yMTYyNzAuDQoNCg0KTXkgcHJvcG9zZWQgZGlmZiBsb29rcyBhcyBmb2xs
b3dzOg0KDQpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2FtZC9yZW5vaXIvcm4tcGNpLWFjcDN4LmMg
DQpiL3NvdW5kL3NvYy9hbWQvcmVub2lyL3JuLXBjaS1hY3AzeC5jDQppbmRleCBiMzgxMmI3MGY1
ZjkuLjc1NGUyNGQ1NWU2ZiAxMDA2NDQNCi0tLSBhL3NvdW5kL3NvYy9hbWQvcmVub2lyL3JuLXBj
aS1hY3AzeC5jDQorKysgYi9zb3VuZC9zb2MvYW1kL3Jlbm9pci9ybi1wY2ktYWNwM3guYw0KQEAg
LTE5OSw2ICsxOTksMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIA0Kcm5f
YWNwX3F1aXJrX3RhYmxlW10gPSB7DQogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBETUlfRVhBQ1Rf
TUFUQ0goRE1JX0JPQVJEX05BTUUsICIyME5MQ1RPMVdXIiksDQogwqDCoMKgwqAgwqDCoMKgIH0N
CiDCoMKgwqDCoCB9LA0KK8KgwqDCoCB7DQorwqDCoMKgIMKgwqDCoCAvKiBMZW5vdm8gVGhpbmtQ
YWQgVDE0cyBHZW4gMiAqLw0KK8KgwqDCoCDCoMKgwqAgLm1hdGNoZXMgPSB7DQorwqDCoMKgIMKg
wqDCoCDCoMKgwqAgRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJMRU5PVk8iKSwN
CivCoMKgwqAgwqDCoMKgIMKgwqDCoCBETUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJEX05BTUUsICIy
MFhHUzFLVDAyIiksDQorwqDCoMKgIMKgwqDCoCB9DQorwqDCoMKgIH0sDQogwqDCoMKgwqAge30N
CiDCoH07DQoNCg0KUGxlYXNlIGhhdmUgaW4gbWluZCB0aGF0IHRoaXMgaXMgbXkgZmlyc3QgcGF0
Y2ggZm9yIHRoZSBrZXJuZWwuDQoNClRoYW5rcyENClsxXTogaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTgxNDgNCg==
