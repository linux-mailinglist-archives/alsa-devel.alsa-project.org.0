Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F707EF2A5
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:32:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EAE186F;
	Fri, 17 Nov 2023 13:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EAE186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700224332;
	bh=fF6xldFdAR73mDv5+NdlYZUnltVWHL5QEaj6PKh1Epk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QRQOHd5azTK2LLbPfZL385rF4fEhKlK/4/R3sbf7SimiIXGWmRRTreNgiNR8MiMWd
	 sTJVApbGvYEVblADjyFeX8xNNgam7+zz61JjDP0NiFuxwRokMrNe5MixPU4Zk64ZiN
	 F7et+dZTcmAcTDQpGBk09/aw2lurSLZ+QJosYqZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 554F9F8016E; Fri, 17 Nov 2023 13:31:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BA8F80093;
	Fri, 17 Nov 2023 13:31:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9793CF801D5; Thu, 16 Nov 2023 21:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E9C8F80152
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 21:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E9C8F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jZqkdD7J
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9dbb3e0ff65so180702966b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 12:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700167144; x=1700771944;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L5FDxcO7kAwwpkXMdWMXf/aMd63WHzqGPaXReVwATbw=;
        b=jZqkdD7JFw4x+7unccHFXgzNSrxmcNkjuF3g8AFy3caiUTRgXyz6dd1G9B2h7dIq9q
         vs6+lD35J5fxak57ED4rmeK1NKhYIJSEckK7SiQNNoAwNdRZKop2R3VdvxeLTvS2sSPR
         k2YlGTV1krP29QDHkRh7Rtkh1HVoWkiTtuxJnmCDdUYEK3sFUjtPTNZ2jPZ6CZZiaAuA
         VwkVk2XgXr6cYedpFfZW8+A13Sf6BVtIHqzivPLu20Y/ThYTh9PtLYFX6ZLCp7BAkE/S
         t4KZVb4cZwQvuS8yRJgILSF1/Ra9PfflEBK07aQ3KB2NIC+QNQ1IIMBjKJNLGo/VLSyH
         CGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700167144; x=1700771944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5FDxcO7kAwwpkXMdWMXf/aMd63WHzqGPaXReVwATbw=;
        b=YLzlgbUOu2YDjvUmWC0U0rm0l0S9A4/UxopDWdAOodLM0Fycyg5Gltwg6AY85oWRI7
         WbxP+OmLDYiKLgQ7/R+4RnfdbMOOOnZisDnyHU+K9iUq7uFagbKO+3C/Q7HOp6Oe2hMm
         teHsY4sSd0tMIUAmIcllebe7Ap1Iiz2ZhDwqTbrkAOHD2DUrBzlQZyXiMm3RGuj2BR1L
         t6Iy1ssfvNMgBAleECEKJ1aPMtKPIwMjVFuZ4pFEsBd8ia4fTMgwbE8BWCfb7EyPV32/
         20nBc5Go+PjQ5mG54bpVIafKkROVKdQFg6wvoRsSoE03rop5MUPBaBTNxCOKA3poFVc+
         tmwg==
X-Gm-Message-State: AOJu0YwMh15/uzP5/OTu4EeaNH+7UwOo7KBses6yBh6ECNZ5KmTA2SNK
	qCNtSBGEOFxQDyVp8iakkEsZa1+zc8vaZi1ciac=
X-Google-Smtp-Source: 
 AGHT+IGdVu37XcDM7Fg3JxYKk5FegOkgVlABhcSwfK9inarfIXI5klk99aFQof9pY7gfxPPetZ/8iSUZ0tnPD8wcB5Q=
X-Received: by 2002:a17:906:d298:b0:9be:ab38:a361 with SMTP id
 ay24-20020a170906d29800b009beab38a361mr13744547ejb.8.1700167143673; Thu, 16
 Nov 2023 12:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20231116132849.1534-1-kamil.duljas@gmail.com>
 <8881b6059da59bc86c0a77cf424bd24ba61b8fad.camel@intel.com>
In-Reply-To: <8881b6059da59bc86c0a77cf424bd24ba61b8fad.camel@intel.com>
From: Kamil Duljas <kamil.duljas@gmail.com>
Date: Thu, 16 Nov 2023 21:38:52 +0100
Message-ID: 
 <CAFR=A7ne03c8n2ezqAiXG=H+wW_uwhjNyW=YSXKAmQxobds=5Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "perex@perex.cz" <perex@perex.cz>,
	"Rojewski, Cezary" <cezary.rojewski@intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-MailFrom: kamil.duljas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XQR3PHVVMMJWAVPSUGSGYOHCLG5T3MBB
X-Message-ID-Hash: XQR3PHVVMMJWAVPSUGSGYOHCLG5T3MBB
X-Mailman-Approved-At: Fri, 17 Nov 2023 12:31:06 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQR3PHVVMMJWAVPSUGSGYOHCLG5T3MBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8gUmFuamFuaSwNCllvdSByaWdodC4gTXkgbWlzdGFrZS4gSSB3aWxsIHByZXBhcmUgcGF0
Y2ggdjINCg0KS2FtaWwNCg0KY3p3LiwgMTYgbGlzIDIwMjMgbyAxOTo1NyBTcmlkaGFyYW4sIFJh
bmphbmkgPHJhbmphbmkuc3JpZGhhcmFuQGludGVsLmNvbT4NCm5hcGlzYcWCKGEpOg0KDQo+IE9u
IFRodSwgMjAyMy0xMS0xNiBhdCAxNDoyOCArMDEwMCwgS2FtaWwgRHVsamFzIHdyb3RlOg0KPiA+
IFRoZSBmdW5jdGlvbiBoYXMgbXVsdGlwbGUgcmV0dXJuIHBvaW50cyBhdCB3aGljaCBpdCBpcyBu
b3QgcmVsZWFzZWQNCj4gPiBwcmV2aW91c2x5IGFsbG9jYXRlZCBtZW1vcnkuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBLYW1pbCBEdWxqYXMgPGthbWlsLmR1bGphc0BnbWFpbC5jb20+DQo+ID4g
LS0tDQo+ID4gIHNvdW5kL3NvYy9zb2YvdG9wb2xvZ3kuYyB8IDE0ICsrKysrKysrKy0tLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi90b3BvbG9neS5jIGIvc291bmQvc29jL3Nv
Zi90b3BvbG9neS5jDQo+ID4gaW5kZXggYTNhM2FmMjUyMjU5Li5lZjhmODk5MWYwMjUgMTAwNjQ0
DQo+ID4gLS0tIGEvc291bmQvc29jL3NvZi90b3BvbG9neS5jDQo+ID4gKysrIGIvc291bmQvc29j
L3NvZi90b3BvbG9neS5jDQo+ID4gQEAgLTE3MzYsOCArMTczNiwxMCBAQCBzdGF0aWMgaW50IHNv
Zl9kYWlfbG9hZChzdHJ1Y3QNCj4gPiBzbmRfc29jX2NvbXBvbmVudCAqc2NvbXAsIGludCBpbmRl
eCwNCj4gPiAgICAgICAvKiBwZXJmb3JtIHBjbSBzZXQgb3AgKi8NCj4gPiAgICAgICBpZiAoaXBj
X3BjbV9vcHMgJiYgaXBjX3BjbV9vcHMtPnBjbV9zZXR1cCkgew0KPiA+ICAgICAgICAgICAgICAg
cmV0ID0gaXBjX3BjbV9vcHMtPnBjbV9zZXR1cChzZGV2LCBzcGNtKTsNCj4gPiAtICAgICAgICAg
ICAgIGlmIChyZXQgPCAwKQ0KPiA+ICsgICAgICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAga2ZyZWUoc3BjbSk7DQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAgICAgICAgICB9DQo+DQo+IFRoYW5rcyBmb3IgdGhl
IHBhdGNoLCBLYW1pbC4gSSB0aGluayBqdXN0IHRoZSBjaGFuZ2UgYWJvdmUgc2hvdWxkDQo+IHN1
ZmZpY2UgdG8gZml4IHRoZSBtZW1vcnkgbGVhayBpbiBjYXNlIG9mIGVycm9yLiBGb3IgYWxsIHRo
ZSBvdGhlcg0KPiBlcnJvciBwYXRocyBiZWxvdywgc25kX3NvY190cGxnX2NvbXBvbmVudF9yZW1v
dmUoKSBzaG91bGQgYmUgYWJsZSB0bw0KPiBoYW5kbGUgZnJlZWluZyB0aGUgc3BjbSBhbmQgdGhl
IHBhZ2UgdGFibGVzLg0KPg0KPiBUaGFua3MsDQo+IFJhbmphbmkNCj4NCg0KDQotLSANClBvemRy
YXdpYW0sDQpLYW1pbCBEdWxqYXMNCg==
