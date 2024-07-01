Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8D92BEB7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E67A4B;
	Tue,  9 Jul 2024 17:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E67A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540087;
	bh=C+cYYC9X+gJAXTMk4alU3FVgfl36sHfH3czWazAdLFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jVqVO5i+IdNNtv53H7l/A61BDMCGM8Mnjq/8EaFwboERCkkYjSnnGQ9Zk6A7/L7bd
	 iakVJaTLXPmAlmb1SD1nLmP5H5+dtm5aMTb7vi3PQu1MU+2Snas3A8iXo/dbm93QkW
	 QN+USKr61jA/7Dc69oRTtGCJzNcRR2Kr1hL+X8Qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8190F80494; Tue,  9 Jul 2024 17:47:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A8AF80494;
	Tue,  9 Jul 2024 17:47:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36AD7F8028B; Mon,  1 Jul 2024 18:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 226CFF8013D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 18:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226CFF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a4k9ubcK
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-63036fa87dbso20240887b3.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719849789; x=1720454589;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Er1wA55kdFZAWRumjECp8j01gkOQSx6T6hFb38aD+oM=;
        b=a4k9ubcKANc4Av6D93ZS+Rf/4TZ/HbCFgo3qXY37xOY86TKw4FYWeJNjQ9Gy4A5FWf
         ZUIRefNLQLclPNUKZiWrrG9q7iG5i6m/JhjRxSq5bY4vvp33876qzt2vytrlIj6FCaty
         Uk1wPEgXFeVOiWjm5LFv4uepvQYznAH8BPTcq5aomSlPdFhRdUwh9udtyufkDGnk1kaW
         VoEy5kruTvE8Xc5QfmtpxHK7Aykv2TMn7rJLMEcvDU5ayBTI/5FoShTkY6ZM3AvWfkX2
         1KNQLrKBW0FgidSxGA+9EDVzAghQFvxPY4ne6IQ5+eHQ/sZMC5fSJtzBTL9tuvTyTsyJ
         omCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719849789; x=1720454589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Er1wA55kdFZAWRumjECp8j01gkOQSx6T6hFb38aD+oM=;
        b=eJp1kXlqYsTrcO+LHGXnO8ZHI2U8l/cRquGF9tbB9Qk1KKVODDrV3WZ12IeTJmHqYs
         we7+3JUBnnpt2ihear8k3QCpFdQIzjwW8JtXO/ytEsIjNfnNrd08yykdJ07MDvXWlEq3
         UzVp/8lxuIC7gLChcNE3QwtgU5Bys2rB+XUqrQ+zuTPOCp5IilrKSJHi9JNV9BMgpYpn
         G0EfM1exgYecUQ53XbU8m66kwAq0qH3FYJANkjdsFutVLHqNuCpR5+3eMqX8qrH8AzIo
         MGTaC37mFSWoNUaWUdzRRNKh8L84EE4ZowQwEhxLypuFvGkHWBW8l3zrshFdUBJcJi5p
         TlOw==
X-Gm-Message-State: AOJu0YyjHB49/r7cttowaJzj+n/aPNvOJw2vGXXvaabOKFOXMSnfN/Ak
	RwcMMW8oj2z3SKs61sqNR6vP6kGSIY84Iu1ncWuuyUDLzU7Bfz9Y9tbowj0zVftEFJ+Dpa0Jvbw
	+Sf2U7QSscE8lWlGWEs+NM2ZzaRk=
X-Google-Smtp-Source: 
 AGHT+IH4wm6EYAolUF2icKhZAk+Xl17odp3eBRXmfCjj/78q9ExCq18t5FPvWsQksl4Zv56KoAl/KeMkEaXvmYTt/XI=
X-Received: by 2002:a81:ad1e:0:b0:643:9ee0:25e0 with SMTP id
 00721157ae682-64c6e7ad290mr34631077b3.22.1719849789413; Mon, 01 Jul 2024
 09:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240616203231.43724-1-av2082000@gmail.com>
 <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
 <f64523f0-db39-4e3a-85a6-1a3cb07e2d08@marliere.net>
In-Reply-To: <f64523f0-db39-4e3a-85a6-1a3cb07e2d08@marliere.net>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Mon, 1 Jul 2024 21:32:58 +0530
Message-ID: 
 <CAPMW_r+Nysco8bb+AJQ1OrhZHK4qwkD0WWv6X9gHzef6uo1Thg@mail.gmail.com>
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
To: srinivas.kandagatla@linaro.org
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com, skhan@linuxfoundation.org,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-MailFrom: av2082000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VEH55AA32YKVKWU3I6QAY7SWEVBQZ7J6
X-Message-ID-Hash: VEH55AA32YKVKWU3I6QAY7SWEVBQZ7J6
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:45:33 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VEH55AA32YKVKWU3I6QAY7SWEVBQZ7J6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgU3Jpbml2YXMsDQoNCkkgaG9wZSB5b3UgYXJlIHdlbGwuIEkgYW0gZm9sbG93aW5nIHVwIG9u
IGEgcGF0Y2ggSSBzdWJtaXR0ZWQgb24gMTkgSnVuDQpyZWdhcmRpbmcgYSBrZXJuZWwgZG9jdW1l
bnQgYW5kIFJpY2FyZG8gcmV2aWV3ZWQgdGhlIHBhdGNoLg0KSSB1bmRlcnN0YW5kIHlvdSBoYXZl
IGEgYnVzeSBzY2hlZHVsZSwgYnV0IGlmIHlvdSBjb3VsZCBmaW5kIHNvbWUgdGltZSB0bw0KcmV2
aWV3IHRoZSBwYXRjaCwgSSB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgaXQuDQpZb3VyIGZlZWRi
YWNrIHdvdWxkIGJlIGludmFsdWFibGUgaW4gaGVscGluZyB0byBpbXByb3ZlIHRoZSBxdWFsaXR5
IG9mIHRoaXMNCmNvbnRyaWJ1dGlvbi4NCklmIHRoZXJlIGFyZSBhbnkgY2hhbmdlcyBuZWVkZWQg
b3IgYWRkaXRpb25hbCBzdGVwcyBJIHNob3VsZCB0YWtlLCBwbGVhc2UNCmxldCBtZSBrbm93Lg0K
DQpUaGFua3MNCkFtaXQgVg0KDQpPbiBUaHUsIDIwIEp1biAyMDI0IGF0IDE4OjAwLCBSaWNhcmRv
IEIuIE1hcmxpZXJlIDxyaWNhcmRvQG1hcmxpZXJlLm5ldD4NCndyb3RlOg0KDQo+IEhpIEFtaXQs
DQo+DQo+IE9uIDE5IEp1biAyNCAyMzoyOCwgQW1pdCBWYWRoYXZhbmEgd3JvdGU6DQo+ID4gSGkg
UmljYXJkbywNCj4gPg0KPiA+IEkgaGF2ZSByZWJ1aWx0IGl0IGFnYWluLCBhbmQgdGhlcmUgYXJl
IG5vIGFueSB3YXJuaW5ncyBvciBlcnJvcnMuDQo+DQo+IFRoYW5rcyBmb3IgY2hlY2tpbmcsIEZX
SVc6DQo+DQo+IFJldmlld2VkLWJ5OiBSaWNhcmRvIEIuIE1hcmxpZXJlIDxyaWNhcmRvQG1hcmxp
ZXJlLm5ldD4NCj4NCj4gQlRXLCBJIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBwbHVzIGFub3RoZXIg
dHdvIGVtcHR5IG9uZXMuIFBsZWFzZSBjaGVjaw0KPiB5b3VyIHNldHRpbmdzLiBBbHNvLCBtYWtl
IHN1cmUgbm90IHRvIHRvcC1wb3N0IFsxXS4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiAtICAgICAg
IFJpY2FyZG8uDQo+DQo+DQo+IFsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9Qb3N0
aW5nX3N0eWxlI1RvcC1wb3N0aW5nDQo+DQo+DQo+DQo+ID4NCj4gPiBUaGFua3MNCj4gPiBBbWl0
IHYNCj4NCg==
