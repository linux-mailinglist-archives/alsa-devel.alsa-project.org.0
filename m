Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7C9077ED
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812211947;
	Thu, 13 Jun 2024 18:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812211947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295069;
	bh=67tvoKs7Pqj4+ewNFLPDhR7NZkEkjD8j+/joeW/yb1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vF57I+Xeg/7s9yCr5ZWIqzfFgd4pdVeAz+IrPbhNaByfm2mG3z4AZhS1oE+iMR6st
	 OwPLmXefxcLQM87TcgQ11Zwns3fv68STu+SFtXKnBB/P+J3heh7iKjkhpvmn/pCnAL
	 jX4hRRar5hcBAKtqLu6RRuTq6gKwAJFh2KjKceJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A63AEF8985D; Thu, 13 Jun 2024 18:03:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73B7CF8986D;
	Thu, 13 Jun 2024 18:03:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC466F802DB; Thu,  6 Jun 2024 01:15:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,HTML_MESSAGE,
	PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13FC0F8003A
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 01:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13FC0F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=frame.work header.i=@frame.work header.a=rsa-sha256
 header.s=google header.b=UxZS+HgX
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-4eb076bec24so149644e0c.1
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jun 2024 16:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1717629317; x=1718234117;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ejst6U/q5U39bwv9qCfL6e/YXORqjt3kSiL4axs5NU=;
        b=UxZS+HgXazNOqbr6eEidxF542flWLgV/uVlSIXW+P4Sn0PsQBqgm7buN/xoutNDGu/
         lVq1iO5rt8vutXtEpMmX05kCVQ/SugxJwyaNFFn+7dxSW/8FFIRwuG9bxPXU0XtmeWY+
         gpDtUF4ABMINPWfLQLN5lzn1WAe37AkvOhkkqwfW6hOLYa1ACGQb+09k98NiXHnAoZrb
         vLmbplTjszX7cVi5z6VS9EaUskKafkvf02EfsJzMscKBqpMNhfOon7lzCHXcw1X+exYs
         LYbOqou5gE6URfyvK9M320EeneNYJ6SqaUm6K7c4v12qLQBrVJnzxs68v7tcwQT1tReV
         se4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717629317; x=1718234117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ejst6U/q5U39bwv9qCfL6e/YXORqjt3kSiL4axs5NU=;
        b=ulV+kpVONqw5+uTWd/JciDsgIbct4fdz8jaUCR9gHb5vdVvoCgYLYzskpcHaih7HpB
         eha7GlzwDQr8rQsWAHFfcK+2vWJVmyGNk/MUWzEpo8ZKwfSUNiuWj6Mx1BbBEdZQadye
         bFqM5VKO5nCPBnkFD5wBGimICU2J/vJAhDsvEmboCqRdnoX25KMqJkxD61YgwUoAX274
         K7zKUfgFXLGUgfSm9pdTlXYdr0V1uMsdMFsUmwcIO/gHAi0s5P7axdzK5cGz0CCF1Cvd
         6NKDWfx4lWOA24TINBbJoRgtvx6LVOJAZrQYmIMV5fcX3+pcLFEQJKXXVriEFS/jyYfl
         +KUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNQjAw2Hn6dnKepAp3dXK+7nQAs2b6mdzegtBZx/GbsXI+aP2Pyy/b323wF35/F2Hz5xxr9NH2m18I8iMh1ZUTtAiYd4IDa+FpJ+I=
X-Gm-Message-State: AOJu0YxUmqKDh6llG9uSgCWx4QZddan0UrJNz6BFNxAAvir97svycm0U
	/6UZMs8mNnAH2+JY9EpLjDJ9JyyqLmWQzKCSLAXmw+0NY5l3goqP5PPejBY8Xbgu1Zshqi1N3zt
	Lg/KCnl24zuD61HpmP9rOt4kfE/EeD5DQ/yzj
X-Google-Smtp-Source: 
 AGHT+IH+LK+aaPU09kYd9lovS4HK0Jfp+jMSAH8m4IQDIjHkN0hkGspHoK5IfXdN49JYCfrqmvwDQbyOnrYkTLEjiZo=
X-Received: by 2002:a05:6122:598:b0:4ea:fe74:fe4a with SMTP id
 71dfb90a1353d-4eb3a3d2ccamr4281176e0c.1.1717629316960; Wed, 05 Jun 2024
 16:15:16 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
 <2099135f-871a-4d8e-a957-6bc374407fd8@amd.com>
 <CA+BfgNLHM66-K6i-mQoAFWdSouSqA8BO=CerMNu2v693HMks_g@mail.gmail.com>
In-Reply-To: 
 <CA+BfgNLHM66-K6i-mQoAFWdSouSqA8BO=CerMNu2v693HMks_g@mail.gmail.com>
From: Kieran Levin <ktl@frame.work>
Date: Thu, 6 Jun 2024 07:15:05 +0800
Message-ID: 
 <CAJFf-=r2SUJh6=G8UWQqRBwSFZB7_LArB9t1tTNSDoFjJ4=XMA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Remove Framework Laptop 16 from quirks
To: Dustin Howett <dustin@howett.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
X-MailFrom: ktl@frame.work
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D4G4W4RNMG372ROXP4FWCF2WLRCHSOMP
X-Message-ID-Hash: D4G4W4RNMG372ROXP4FWCF2WLRCHSOMP
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:03:16 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4G4W4RNMG372ROXP4FWCF2WLRCHSOMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhlIGF1ZGlvIGV4cGFuc2lvbiBjYXJkIGhhcyBhIGZ1bGwgdXNiIHRvIGhlYWRwaG9uZSBqYWNr
IGNvZGVjLiBTbyBkb2VzDQpub3QgaW50ZXJhY3Qgd2l0aCBIREEgYXQgYWxsLg0KDQpPbiBUaHUs
IEp1biA2LCAyMDI0LCAxOjEx4oCvQU0gRHVzdGluIEhvd2V0dCA8ZHVzdGluQGhvd2V0dC5uZXQ+
IHdyb3RlOg0KDQo+IE9uIFdlZCwgSnVuIDUsIDIwMjQgYXQgMTI6MDPigK9QTSBNYXJpbyBMaW1v
bmNpZWxsbw0KPiA8bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBP
biA2LzUvMjAyNCAxMjowMSwgRHVzdGluIEwuIEhvd2V0dCB3cm90ZToNCj4gPiA+IFRoZSBGcmFt
ZXdvcmsgTGFwdG9wIDE2IGRvZXMgbm90IGhhdmUgYSBjb21iaW5hdGlvbiBoZWFkcGhvbmUvaGVh
ZHNldA0KPiA+ID4gMy41bW0gamFjazsgaG93ZXZlciwgYXBwbHlpbmcgdGhlIHBpbmNmZyBmcm9t
IHRoZSBMYXB0b3AgMTMgKG5pZD0weDE5KQ0KPiA+ID4gZXJyb25lb3VzbHkgaW5mb3JtcyBoZGEg
dGhhdCB0aGUgbm9kZSBpcyBwcmVzZW50Lg0KPiA+DQo+ID4gQnV0IGRvZXNuJ3QgdGhlIGF1ZGlv
IGNhcmQgd29yayB0aGlzIHdheT8NCj4NCj4gSSBkb24ndCBiZWxpZXZlIHNvIC0gdGhlIGF1ZGlv
IGV4cGFuc2lvbiBjYXJkIGVudW1lcmF0ZXMgYXMgYSBVU0INCj4gZGV2aWNlIHRoYXQgaXMgcGlj
a2VkIHVwIGJ5IHNuZC11c2ItYXVkaW8uDQo+IEEgaGVhZHNldCBtaWNyb3Bob25lIGNvbm5lY3Rl
ZCB0byB0aGUgYXVkaW8gZXhwYW5zaW9uIGNhcmQgc2VlbXMgdG8NCj4gY29udGludWUgd29ya2lu
ZyBwcm9wZXJseSBldmVuIHdpdGggdGhpcyBwaW5jdHJsIGNoYW5nZSAoc3ludGhldGljYWxseQ0K
PiB0ZXN0ZWQgb24gbXkgRnJhbWV3b3JrIExhcHRvcCAxMywgbWluZCB5b3UgLS0gaXQgaXMgbm90
IGEgcGVyZmVjdCB0ZXN0DQo+IDopKS4NCj4NCj4gZA0KPg0K
