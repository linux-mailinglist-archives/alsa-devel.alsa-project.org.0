Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656BACDC87
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jun 2025 13:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13DFA601F4;
	Wed,  4 Jun 2025 13:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13DFA601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749036598;
	bh=YOAUoSd+QLJVbnlab49OL4xs76dUW1Y19+5PYIlsxIw=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SFS2jOtDLDBPpAnTme6Ar3dxSk1KM7zZN7jgd00mt9SUXdrLMa4r2cDmQ+EBGA3jb
	 duRwqBfFJG+z/igRBXH0/ycvJd/1KSOEtxRYSkOlMCqmbtTQGErH9bqWsOxCGyyMOq
	 PZAcC/iKimfPZTO3bnodJL9Tpmi8wnhtrwUmFx5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9234F805BE; Wed,  4 Jun 2025 13:29:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 840EEF805AB;
	Wed,  4 Jun 2025 13:29:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F120F8028B; Wed,  4 Jun 2025 13:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAE05F800E4
	for <alsa-devel@alsa-project.org>; Wed,  4 Jun 2025 13:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAE05F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=blokas.io header.i=@blokas.io header.a=rsa-sha256
 header.s=google header.b=HXIsNNaJ
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7086dcab64bso60810807b3.1
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Jun 2025 04:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blokas.io; s=google; t=1749036558; x=1749641358;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tDK8XPb3uE/KJtDzf35KMtAEt/yaocj57hNUgIxA5Vc=;
        b=HXIsNNaJXzz87WVnpfPgt9IdYzV5ZJZcx9iPLqve8dwWE/UkDiWPJq/3w1Oj0OxKLO
         j43Cg28cmKuDwChQ2WORd5KyKkZsOBETXLgla+MLpIQSq53NDAaC2HYfYz6DAC0wC7I8
         3/zI635Igzxem8WDOOwbMg+aDXQYT7+qdpB2sLHopzM8CIG/wqFbfokgATxjP76xr98B
         BWr3eMNKJAsRKHb8MXTWIQS6UEu+1HCYqEZbSTVWdX9uNEi6tMFYXx3N0RGyDq5q6jad
         yHcuAylfe/Ou+nQGGsHAsAVTJBg4yrByTSYYu0I/O0HzyrqLiU2Zag+F+dLnMrt10A8k
         wuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749036558; x=1749641358;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDK8XPb3uE/KJtDzf35KMtAEt/yaocj57hNUgIxA5Vc=;
        b=ai3/GHZPnNmOeoWHl/cf02fwLXLKxFt2GydZFqWIPXR6/xEYbARBa6zqqTonCs7qzL
         s2tFaO/W+MapiMV4gMGxE5f0vx5M4wSvlOFgPZYQ0lQAVohwQ8uWRGyudZ6RpacYRwyY
         CNSwb8uPnqeGqFELyntJkOCmJ7cMkFqBT0Htng0sdABQzwmw03vI7+ThjMyr08m5+ee3
         /qlOMoP8hL/wD2iWNO6sgSiEk+2C3hxDHtOfFVXN8mIP05aENiq0RMMhzmRWAtWLbFUy
         gbbh7C3hASpq/PT+JchuGPoQ2Y4RT5h3Hbw8G0tQioHU7YCNb7OOrRye9ez+JAJkafMz
         i+1g==
X-Gm-Message-State: AOJu0Ywh85Ivc7ewwE81z8Et3htiINeBxqiY+N3ioum/oZc/I6X5/QZg
	aMNxlcjcuJbTCgJdha//gV12n/7Ci2bsTmGy5HjCB1Fkf5PVWixQ8r0/0SskTmV5Z3JFaTEA6wu
	uDcyikYmPOyYGU8KYC+P3pD1pouW32vvxRAZhh6pD6TeYtgxYa0xXJD/Bog==
X-Gm-Gg: ASbGncv0xztD5wuqKNsN38wULVaNxupPaI/NtBgx0UZvrWpxhPx+yev/YOvw2CURfBW
	HK5AoD65Z4uwXHORQWO6xt8WKeWX4XJLZL3eNP0zyR8Bbwzyem5wFX+3YErmysaKj6a80ZH/Kke
	Ap9o1I8jY/0NHkRJM9XxoOgY7quf8VkVkm
X-Google-Smtp-Source: 
 AGHT+IHpNLZZrM+lEgHIMKtAOrTItf76MNPoIoFMz1KlaqB3+BUrpilo1F4nFZJhgk1iL3MKNe/e22Ly0+tuuPaJGlc=
X-Received: by 2002:a05:690c:6c03:b0:70f:8884:17af with SMTP id
 00721157ae682-710d99fd497mr31886827b3.6.1749036557777; Wed, 04 Jun 2025
 04:29:17 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Giedrius_Trainavi=C4=8Dius?= <giedrius@blokas.io>
Date: Wed, 4 Jun 2025 14:29:06 +0300
X-Gm-Features: AX0GCFsXG9EgPuojpYmSilodcj8EliQwyZyrTUr7lIObtiUWsXNYZkWpb0TV2pU
Message-ID: 
 <CAMONXLtSL7iKyvH6w=CzPTxQdBECf++hn8RKL6Y4=M_ou2YHow@mail.gmail.com>
Subject: snd_soc_dai_set_tdm_slot with slot=0 broken since 6.12.31 kernel
To: alsa-devel@alsa-project.org
Message-ID-Hash: DDSGL446HGUPXIAMIQXUULJ4EPHZTO26
X-Message-ID-Hash: DDSGL446HGUPXIAMIQXUULJ4EPHZTO26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDSGL446HGUPXIAMIQXUULJ4EPHZTO26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sDQoNClNpbmNlIFJhc3BiZXJyeSBQaSdzIGtlcm5lbCB2ZXJzaW9uIDYuMTIuMzEsIEkg
bm90aWNlZA0KdGhhdCBzbmRfc29jX2RhaV9zZXRfdGRtX3Nsb3QgcmV0dXJucyAtRUlOVkFMIHdo
ZW4gc2xvdHM9MCBpcyBwcm92aWRlZCB0bw0KdGhlIGZ1bmN0aW9uLCBldmVuIHRob3VnaCBpdCdz
IGEgZG9jdW1lbnRlZCBsZWdhbCB1c2UgY2FzZToNCg0KICogVERNIG1vZGUgY2FuIGJlIGRpc2Fi
bGVkIGJ5IHBhc3NpbmcgMCBmb3IgQHNsb3RzLiBJbiB0aGlzIGNhc2UgQHR4X21hc2ssDQogKiBA
cnhfbWFzayBhbmQgQHNsb3Rfd2lkdGggd2lsbCBiZSBpZ25vcmVkLg0KDQpodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92Ni4xMi4zMS9zb3VyY2Uvc291bmQvc29jL3NvYy1kYWkuYyNM
MjYwDQoNClRoZSBpc3N1ZSB3YXMgaW50cm9kdWNlZCBieSB0aGlzIGNvbW1pdDoNCg0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg3bzZ6N3lrNjEud2wta3VuaW5vcmkubW9yaW1vdG8uZ3hA
cmVuZXNhcy5jb20vI3QNCg0KV2hpY2ggYWRkcyBjaGVja2luZyBvZiBzbmRfc29jX3hsYXRlX3Rk
bV9zbG90X21hc2sgcmVzdWx0IHdoaWNoIGlzIC1FSU5WQUwNCmluIGNhc2Ugb2Ygc2xvdHM9MCwg
dGhlcmVmb3JlIHN0b3BwaW5nIHRoZSBzbmRfc29jX2RhaV9zZXRfdGRtX3Nsb3QNCmV4ZWN1dGlv
bi4NCg0KVGhlIDYuMTIuMzAgd2FzIHN0aWxsIGZpbmU6DQpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni4xMi4zMC9zb3VyY2Uvc291bmQvc29jL3NvYy1kYWkuYyNMMjgxDQoNCkkg
d291bGQgc3VnZ2VzdCBza2lwcGluZyB0aGUgeGxhdGUgY2FsbCBpbiBjYXNlIHNsb3RzIGlzIDAg
aW4NCnNuZF9zb2NfZGFpX3NldF90ZG1fc2xvdC4NCg0KVGhhbmsgeW91LA0KR2llZHJpdXMuDQo=
