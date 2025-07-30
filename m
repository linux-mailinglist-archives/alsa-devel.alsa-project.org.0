Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADDDB19C5D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 09:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FC86025F;
	Mon,  4 Aug 2025 09:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FC86025F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754292131;
	bh=93g1nlYpATWJWIeB0k2GUZJmgliu7an9w5WHDKRGqXY=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VmX3VTfD1uINiBaRhxTg4y8s9tfEfCgUE4S+Rg0t/tziW2Z5wPvOOCefQ/9uukbhS
	 +PLzXz5x58ukMaeMORIU56+p/le1OZ5imGZu3W7gCTt8CI7fEg4+C4nexByLzkZneE
	 3UetZlYYhI9ajQAgQ8msv+HVO/XuWANeUFOr8Ufs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BF1F805E0; Mon,  4 Aug 2025 09:21:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 029FDF805EE;
	Mon,  4 Aug 2025 09:21:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F25E3F8025F; Thu, 31 Jul 2025 00:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D77ACF8016A
	for <alsa-devel@alsa-project.org>; Thu, 31 Jul 2025 00:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D77ACF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AHMP17ge
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so1425045e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 30 Jul 2025 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753914493; x=1754519293;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SHOMIFnhpy+jY1D4Kj1kCmfp0SSqWPSweLb0vn/S084=;
        b=AHMP17genAmRNjjUMm65+F5m6zg1KtDOsqi/rApxhcfb9Eg470ujHnbRpJ5KzOUu+P
         leHpeyBQpM4rmeRg3vr28TZeeI8RNsT57kbJFvd0yaHO6g1vwZptUCantcL2DeIGCllP
         wdBHXlaokknwOeyBu+tAdjt4qTPR6G/gsku5WvtlR+FyP2bYFYcdGpD6PhAZF1Jrn9Jm
         PvSEMQ5IL7/WvEpimaJ8I7q+P/wv4FUZVdetHoCG3MzJNJuKxkEWpYltqmG6ljAhOPMH
         nRokYZIiHgv/5/6/6LJAknocHrSugd/sVuxGWvumomkF+aWbMQq7aSfyE9pYGPPSDuAn
         TFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753914493; x=1754519293;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHOMIFnhpy+jY1D4Kj1kCmfp0SSqWPSweLb0vn/S084=;
        b=e57JpiOkt4/YoyxsoCTqhEfddI65K1FnDroX+3BvfC5XAu1sNT6sjXx6SCAWXymyTG
         xZH+kSNus5g1npw+GVHV9Dah5jtVrxehCouzTUxuGdc7J36rQ2AOOsAXCINa/PCiAoTL
         nIzYfS9LVnoJCswtFWA2kRKRIYXjAhGda9D0hwEfLCzQaFoJzlWRtA0nAjbcBUiCt/B5
         uZKrPjvcP/bzKXeJmTxIHMsd18qBUuy84Ue4dB7wvINwgOywvW8RPKBEbHOh+hO/y/YK
         984Xcfpa+QpKO/bC9SVfpuncD7PsvKUA/axp7gin9jUDeDUpDEM1F/TdWqwZjizSkqXF
         OaXg==
X-Gm-Message-State: AOJu0YzYvsuhCD+eK8VvTyR1w0qqchbBuIILwDMuEVCJ4czMaiy/L9OY
	K/OcWDXx5RoAB6ZRI/3tOPKL09wAyVdcvZNhaLck6WVdnPrBkv08/rTMBlLdA+oUn3qK6c4rqua
	z3gtEa7Mv5AfH5imWy51/jv8jweSkQ867xtLZIww=
X-Gm-Gg: ASbGncvEicNTdPsnjhxUGxCfLqsu3J4W8tj91v5iV8dtcmWZCN5M+HKzqnVmouvWS8u
	oyYhf2jsakaB7hVdfBRnAuNyl1vO8hurnQLbY8k6iDeBnVxl6RJwa0YNFm4mDD38sj1VCp0/BNY
	5BvtPa8ESS7Ie+SQtckBYNMzqPjFDiiLg7WKuqiRT3FU/PHfDjqtE9+L25bTTmC00XapdkhkxIS
	/7Wvy96dbdoeDCk1Se7sxqakEA5v2tk3nj4j8LrEg==
X-Google-Smtp-Source: 
 AGHT+IGiXxrIzIMpvDZ7cRQ6lSBI7hjr0zONurmxBIkMKOMDoDDH5RG2XdJk3HOt60/cysOLg9E29H0CedVCyX5Rbjk=
X-Received: by 2002:a05:600c:1da8:b0:456:1006:5415 with SMTP id
 5b1f17b1804b1-45892b92eb2mr42220715e9.6.1753914492872; Wed, 30 Jul 2025
 15:28:12 -0700 (PDT)
MIME-Version: 1.0
From: Pablo Scatizza <pscatizza@gmail.com>
Date: Wed, 30 Jul 2025 19:31:33 -0300
X-Gm-Features: Ac12FXwrt0UcWJk5YkxQlhA3nBLZhh0q0oMoVR3BNnUTak5T4DQHWqoPZ1PVxmo
Message-ID: 
 <CAOJTC7bb=qHnhMhNUsSzg=0kCHjSoZmR7hc1n7LvWPuVq09GiA@mail.gmail.com>
Subject: Regression: Microphone broken on Intel Ice Lake with alsa-ucm-conf
 1.2.10-150600.3.5.1 (openSUSE Leap 15.6)
To: alsa-devel@alsa-project.org
X-MailFrom: pscatizza@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P7ROHPFZNBVHAHL5E2I3HFCZOPPIRSG2
X-Message-ID-Hash: P7ROHPFZNBVHAHL5E2I3HFCZOPPIRSG2
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:21:07 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7ROHPFZNBVHAHL5E2I3HFCZOPPIRSG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RGVhciBBTFNBIGRldmVsb3BlcnMsDQoNCkkgd291bGQgbGlrZSB0byByZXBvcnQgYSByZWdyZXNz
aW9uIGFmZmVjdGluZyB0aGUgbWljcm9waG9uZSBvbiBteSBsYXB0b3ANCnVzaW5nIEludGVsJ3Mg
SWNlIExha2UtTFAgYXVkaW8gY29udHJvbGxlciB3aXRoIHRoZSBgc29mLWhkYS1kc3BgIGRyaXZl
ci4NCg0KQWZ0ZXIgdXBncmFkaW5nIGBhbHNhLXVjbS1jb25mYCB0byB2ZXJzaW9uIDEuMi4xMC0x
NTA2MDAuMy41LjEgKGFzDQpkaXN0cmlidXRlZCBpbiBvcGVuU1VTRSBMZWFwIDE1LjYpLCB0aGUg
aW50ZXJuYWwgbWljcm9waG9uZSBzdG9wcyB3b3JraW5nLg0KTm8gY2FwdHVyZSBpcyBwb3NzaWJs
ZSB2aWEgYGFyZWNvcmRgIG9yIGFueSBhcHBsaWNhdGlvbi4gVGhlIGRldmljZSBzdGlsbA0Kc2hv
d3MgdXAgaW4gYGFyZWNvcmQgLWxgLCBidXQgaXQgZG9lcyBub3QgcmVjZWl2ZSBhdWRpbyBpbnB1
dC4NCg0KUm9sbGluZyBiYWNrIHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uICgxLjIuMTAtMTUwNjAw
LjEuMikgdXNpbmc6DQpzdWRvIHp5cHBlciBpbnN0YWxsIC0tb2xkcGFja2FnZSBhbHNhLXVjbS1j
b25mLTEuMi4xMC0xNTA2MDAuMS4yLm5vYXJjaA0KDQpyZXN0b3JlcyBmdWxsIG1pY3JvcGhvbmUg
ZnVuY3Rpb25hbGl0eS4NCg0KKipTeXN0ZW0gaW5mb3JtYXRpb246KioNCi0gRGlzdHJpYnV0aW9u
OiBvcGVuU1VTRSBMZWFwIDE1LjYNCi0gS2VybmVsOiA2LjQuMC0xNTA2MDAuMjMuNTMtZGVmYXVs
dA0KLSBBdWRpbyBkZXZpY2U6IEludGVsIENvcnBvcmF0aW9uIEljZSBMYWtlLUxQIFNtYXJ0IFNv
dW5kIFRlY2hub2xvZ3kgQXVkaW8NCkNvbnRyb2xsZXIgKHJldiAzMCkNCi0gQUxTQSBkcml2ZXI6
IHNvZi1oZGEtZHNwDQoNCioqV29ya2luZyBgYXJlY29yZCAtbGAgb3V0cHV0IHdpdGggdGhlIG9s
ZCB2ZXJzaW9uOioqDQpjYXJkIDA6IHNvZmhkYWRzcCBbc29mLWhkYS1kc3BdLCBkZXZpY2UgMDog
SERBIEFuYWxvZyAoDQoqKSBbXSBjYXJkIDA6IHNvZmhkYWRzcCBbc29mLWhkYS1kc3BdLCBkZXZp
Y2UgNjogRE1JQyAoKikgW10NCmNhcmQgMDogc29maGRhZHNwIFtzb2YtaGRhLWRzcF0sIGRldmlj
ZSA3OiBETUlDMTZrSHogKCopIFtdDQoNCkxldCBtZSBrbm93IGlmIEkgY2FuIHByb3ZpZGUgbG9n
cywgZGlmZnMgYmV0d2VlbiBVQ00gZmlsZXMsIG9yIGZ1cnRoZXINCnRlc3RpbmcuIEknZCBiZSBo
YXBweSB0byBoZWxwLg0KDQpCZXN0IHJlZ2FyZHMsDQpQYWJsbyBTY2F0aXp6YQ0KTmV1cXXDqW4s
IEFyZ2VudGluYQ0K
