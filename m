Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94921AEB8DD
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F6A6030D;
	Fri, 27 Jun 2025 15:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F6A6030D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030861;
	bh=Fxe07255Q5DSoqbrbd8KHRY/vNZJy2QIvGkVl0SiJqQ=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IEzIbQfxxmJoxR7l2a//Mj6uAJ5XSHQ/DfCVqwsatXcag8xDGljQFIcYRH4esv4A8
	 oUwBrs6oXPtFkWE7EcZIBHm9XlvP4ab+PgmZwYoQ3HyKkroYgRu5CTa69kEMMHTe9x
	 hMFvxONY0ERx2fasxZOGjaLOMvQ/vC8qhrQWteAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 509E5F808C0; Fri, 27 Jun 2025 15:24:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36335F80633;
	Fri, 27 Jun 2025 15:24:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5A96F804FB; Wed, 25 Jun 2025 05:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8465F80236
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 05:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8465F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NWJEJDs6
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-453634d8609so8203395e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Jun 2025 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750822195; x=1751426995;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6bhPQBFMjtSrCJf/UbjX7aGIZfnHT53vMSO0jsz74hU=;
        b=NWJEJDs6sU1C4bElzJkNCWEV7EozjFHJH9YkzlNa8A+iJaTznkh271z0zYG+B96Mah
         Iv8GLXAcD5ZOxpnK4bakALxeLIBWUESdE75JWtTaFT9+EpMFE0//nCg49aRL/42IqF5r
         4DkGC3wO6IDfJu+uUnkWa+TC4+X/nJY/0/yZytvkvbPX6NcdJyk9o21NApLX/rh7oywd
         9pUPB06eFHZobUUA8j2946mbet+kTk43t576HAqABHp0usJahFcQ+AofJ5wYyv05hQPT
         ymGZZwTCWP8tJTOpxCtMu8eJHZ7LDd68xmK0Juz3s+oGbwuonAv3NoN+a0uFqoa9tWrF
         iQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750822195; x=1751426995;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bhPQBFMjtSrCJf/UbjX7aGIZfnHT53vMSO0jsz74hU=;
        b=ajhxVUV5Ncjp8u8J+d+j8dQuatZ9cYe+iSZhbK0m/1LnrNNYPoitdqJpRkbYFPWhPs
         8rnnUv0OQqE2PpY6j+2ldwP55RzZMD2WnIb6X+UJGg2o4+uWu/03TxLWG/pJwgRD2pRn
         98aDo2uYOSYFJzlO31lhaWxIz/w2IRVjYVo2n8LgR1A44INTNJZBD7iRGHFLfYihTAKo
         Du8xuogwjOblDcsIFA2ZItycMDrZHcfM0eQj4wJrxQWo7ejloh+I641EQr6PFbEplr35
         uRlVsZnMSZnM4uUmjEpMs7aYAPyFJNi8Jd5pLMiKmwnyvmk1l+h6hSgamd6Ax48UCK/V
         PnCw==
X-Gm-Message-State: AOJu0Ywl68FSc9YfHUKx0+nxR1JOqpiREd4G9NGAWR5NcHUXB5J0EtIB
	q5muThNl8J9YqDXgQcgsGNCsQ59E9yO2K69syWtzQicXUgbj4r3SW3mUUKXsuVLK0pBavUCAawc
	EhUS3nCMuT9tTEyuzTji7Ox9BbeMLFbnbziRn
X-Gm-Gg: ASbGncvimjoNGMyQS8VeV05ZwyRYCduG9o0JpjAc1O54fV7AxMb1d/I00RVMhjtzfxg
	u5J+HkSs8HNGY2pL/xISNmFyWEMA3/OupM2qZejNc/6AOMcltadC7krHSoHZgZFajXiuZ5ypLnu
	siUYftos1tGNxlXMqJtLOwFTbYCtdqAsXx31c8Ngk=
X-Google-Smtp-Source: 
 AGHT+IESj5s3Q2UHMLbp1ZuYP2OBLXnLvLYWERJrZq9NyxqH+N9QXi/TPbFWuY6SDbf4BGdO8jf3x4F3xHfMEdnXC3E=
X-Received: by 2002:a05:600c:1f10:b0:453:84a:8cf1 with SMTP id
 5b1f17b1804b1-45381af85femr8974985e9.33.1750822194957; Tue, 24 Jun 2025
 20:29:54 -0700 (PDT)
MIME-Version: 1.0
From: Sandeep Verma <kv.sandeep1807@gmail.com>
Date: Wed, 25 Jun 2025 08:59:43 +0530
X-Gm-Features: Ac12FXxW1_4CvU8_hkdEJnnr-kTfmsphsaWEYL-MbaAEsfo0m4v2EMhRAnREge8
Message-ID: 
 <CAMvEac3q50CSfagMXgRzuVOJUniBa1NrbQQHL4R0SZrn0KFZPA@mail.gmail.com>
Subject: Handling Lost Audio IRQs in ALSA: Triggering XRUN on Timer Detection?
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-MailFrom: kv.sandeep1807@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BCH44UJN372VJM5DXQ7THJXWM7MPOCGU
X-Message-ID-Hash: BCH44UJN372VJM5DXQ7THJXWM7MPOCGU
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:24:08 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCH44UJN372VJM5DXQ7THJXWM7MPOCGU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgYWxsLEnigJltIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGEgc3BvcmFkaWMgaXNzdWUgaW4g
b3VyIHN5c3RlbSB3aGVyZSBhbg0KYXVkaW8gaW50ZXJydXB0IGlzIG9jY2FzaW9uYWxseSBsb3N0
LiBXaGVuIHRoaXMgaGFwcGVucywgQUxTQSBkZXRlY3RzIHRoZQ0KYW5vbWFseSAocHJlc3VtYWJs
eSB0aHJvdWdoIGl0cyBpbnRlcm5hbCB0aW1lc3RhbXAgb3IgZGVsYXkgZGV0ZWN0aW9uKSwgYnV0
DQppdCBkb2VzbuKAmXQgYXBwZWFyIHRvIHRha2UgY29ycmVjdGl2ZSBhY3Rpb27igJRsZWFkaW5n
IHRvIHBlcnNpc3RlbnQgYXVkaW8NCmppdHRlciBhZnRlcndhcmQuVG8gYWRkcmVzcyB0aGlzLCBJ
4oCZbSBjb25zaWRlcmluZyBpbXBsZW1lbnRpbmcgYSBtZWNoYW5pc20NCmluIG91ciBkcml2ZXIg
b3IgcGxhdGZvcm0gbGF5ZXIgdGhhdCB1c2VzIGEgdGltZXIgdG8gY2hlY2sgaWYgdGhlIGV4cGVj
dGVkDQphdWRpbyBpbnRlcnJ1cHQgaGFzbuKAmXQgYXJyaXZlZCB3aXRoaW4gYSBjZXJ0YWluIHRp
bWVmcmFtZSAoZS5nLiwgMnggdGhlDQpwZXJpb2Qgc2l6ZSkuIElmIHRoaXMgY29uZGl0aW9uIGlz
IG1ldCwgSSBwbGFuIHRvIGV4cGxpY2l0bHkgdHJpZ2dlciBhbg0KWFJVTiB0byByZXNldCB0aGUg
cGlwZWxpbmUgYW5kIHJlY292ZXIgY2xlYW5seS5NeSBxdWVzdGlvbnMgYXJlOg0KDQogICAxLiBJ
cyB0aGlzIGFuIGFjY2VwdGFibGUgYW5kIOKAnEFMU0EtZnJpZW5kbHnigJ0gd2F5IHRvIGhhbmRs
ZSBsb3N0IElSUXM/DQogICAyLiBJZiB0aGlzIGlzIGEgcmVhc29uYWJsZSBhcHByb2FjaCwgd2h5
IGRvZXNu4oCZdCBBTFNBIGRvIHRoaXMgYnkgZGVmYXVsdD8NCiAgIDMuIElzIHRoZXJlIGEgYmV0
dGVyIG9yIHJlY29tbWVuZGVkIHdheSB3aXRoaW4gdGhlIEFMU0EgZnJhbWV3b3JrIHRvDQogICBk
ZXRlY3QgYW5kIHJlY292ZXIgZnJvbSBzdWNoIG1pc3NlZCBpbnRlcnJ1cHRzPw0KDQpJ4oCZZCBh
cHByZWNpYXRlIGFueSBndWlkYW5jZSBvciBzdWdnZXN0aW9ucy4gSWYgdGhpcyBraW5kIG9mIHRp
bWVyLWJhc2VkDQpyZWNvdmVyeSB3b3VsZCBiZSBicm9hZGx5IHVzZWZ1bCwgSeKAmWQgYWxzbyBi
ZSBoYXBweSB0byBleHBsb3JlIHdoZXRoZXIgaXQNCmNvdWxkIGJlIHByb3Bvc2VkIHVwc3RyZWFt
Lg0KDQpUaGFua3MsDQpTYW5kZWVwDQo=
