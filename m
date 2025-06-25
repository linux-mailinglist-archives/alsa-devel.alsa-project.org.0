Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C3AEB8E1
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:28:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0DEC60304;
	Fri, 27 Jun 2025 15:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0DEC60304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030883;
	bh=uII96GY2+Vmbuv2Mj9MkLijOVtl4rKGeXfr5or/MdBo=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=skoP9X68E0kQwrKY7gG81rzakHgCChPmv6TwJDeRFz4U444ne4sh3y3X+ylBqT8RZ
	 JmcEaoiGzlw/YixR9SP1DtPQDzceiK3hP/x+ZV+N40D949r6wkORYkkw3VeeN8fYR9
	 5naxe3R78Bowm7aQiwjN1fAS47V1EHoB5lESh/b8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDD40F808CB; Fri, 27 Jun 2025 15:24:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC551F805D8;
	Fri, 27 Jun 2025 15:24:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98615F804FB; Wed, 25 Jun 2025 11:32:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEB02F8026D
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 11:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB02F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q1jDEaTH
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-32b855b468bso16537451fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Jun 2025 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750843945; x=1751448745;
 darn=alsa-project.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W7+AhqY2aufkAZChtUCRbtigztsNrZu3SmhkSnmf+BY=;
        b=Q1jDEaTHbSSR+0s5yBbP2HKUnNOArY9XZ+IKoXCPDfZZlONtrKAxDhm162g1PqZkAp
         NrmtVfg1gJ2o62hx8tFvRntLNslb3Bky5ZOfF51ZW53ThD7g3ku7c2m17ipmru/03wLc
         R0Yexx4i3qUe5WruZmv87urk4eeGM940xArz9BVkt9qKRiMYzCxHPRvwoE9nZnmn5l/p
         yFlTza/VhDgBcThcPfKEGcmrw0qpAwWzWItWfO+gROavHiwIj2lJmEKrPSWajR7W6IA4
         vVkOBiSjp7eteG1KD0rTuY1RlWiauujPLjToIjz7iqkvDmVH662sJ7O0+oyr1VRY4k4A
         Zelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843945; x=1751448745;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7+AhqY2aufkAZChtUCRbtigztsNrZu3SmhkSnmf+BY=;
        b=eGqnz90Yb4eUSn5/SVT8HXuhuTlsjhLaTuMbM/zdkehhhuIpREq08zyK+MvKje4WOK
         l9AMf1M8ilomWpu1B9ev5r5oKzu3y625S3mgwc6BEaVgy1v8UJe+kSa9u0YGRCtn59Y5
         xG/rK3ZgPdFy/QiDUImTKZVHyskXzYauKbFzlpeLyobeuUATLIT5nLXxOy6kt12p1MvY
         941iMPIp7MogPne7nj+h2KskjZiZDnAZvW8VjYL9WPkDAGIOAlITuhyJNTVoq52MylmH
         Pwps3AkT54G28BRS6gT+Zc8apsIqaxMx9YRYfvokHDA3PKkNzvoe+MGqM2NCLx6jTZ60
         iBlw==
X-Gm-Message-State: AOJu0YzmRHCM1jjRcBPeNAU8vdMBfehZXD2Yv57kswTjGfoA0CRz1xNe
	eQlNMy+loPxFplM2Ewa1l1th1OdzMKiZPH/HgeNRE05Udhns4jem8jJX9MWRXw==
X-Gm-Gg: ASbGncvh9Mf5UtN8pF73oeIHoKkkCxxORpSlmmou91A5v1SjwdS5iq4/cKIAcsVtoAw
	brKiekk+E9DKe30tCeaOnFJwvFKv9IeSg4GqKQbzPMpV477VIZTmnzTEZ4oaZ1KBM0UNCb9G55P
	SGj7odmXRrC4EGv5Nk0vShhx/bxzEJ4r/ZpBZLE5QIXZdpGG/yUSBieTCjCwiCi9bq14AeeyCkr
	5tRsJdIX6lxLQrDHanT2ZJJmrsPuMNeF+QT+onuRKv3De1z0zVmivkd0Zr3+CnTjzYrGh44FGry
	rb8tsfq78voEZuJ9i8YdPieo0YQLib8NlRsoKqI7GU2r/+wxcdVcAIN8HO0y9nVk2v2spwgHZuX
	KYH8RqUshhAhiHGhRBBnufSEDdg==
X-Google-Smtp-Source: 
 AGHT+IGGM22bpLXJK/3+Zkucxx1OLumZsssed+0F0x4eWCuCi6ZncI3rRKHJCseUrWeU8VJbS3r0AA==
X-Received: by 2002:a2e:9b04:0:b0:32a:6aa0:217b with SMTP id
 38308e7fff4ca-32cc650317bmr5861661fa.25.1750843944480;
        Wed, 25 Jun 2025 02:32:24 -0700 (PDT)
Received: from [192.168.0.39] (c83-249-171-74.bredband.tele2.se.
 [83.249.171.74])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32b97fd6e63sm19586451fa.48.2025.06.25.02.32.23
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:32:24 -0700 (PDT)
Message-ID: <f805803b-af30-4e61-b1c0-7ce6908a7587@gmail.com>
Date: Wed, 25 Jun 2025 11:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Erik Johnsson <ejohnsson98@gmail.com>
Subject: [PATCH REQUEST] No speaker output on HP Spectre with ALC245 unless
 warm-booted from Windows
X-MailFrom: ejohnsson98@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y6SUWJI6OOOPUCKC3KP243KOKO6P3CJ4
X-Message-ID-Hash: Y6SUWJI6OOOPUCKC3KP243KOKO6P3CJ4
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:24:17 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6SUWJI6OOOPUCKC3KP243KOKO6P3CJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ICAqIFBDSS1JRDogfFNVQlNZU18xMDNDODlEQXwNCiAgKiBDb2RlYzogUmVhbHRlayBBTEMyNDUN
CiAgKiBTeW1wdG9tOiAiTm8gYXVkaW8gdmlhIGludGVybmFsIHNwZWFrZXJzIHVubGVzcyBmaXJz
dCBib290aW5nIGludG8NCiAgICBXaW5kb3dzIg0KICAqDQoNCiAgICB8YWxzYS1pbmZvLXNofDoN
CiAgICBodHRwOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj0wMWNhOTE0NjJlODM4Y2Y5ZDU0NDcy
MDExYTc0NTkxNGVhMTEyYzM3DQoNCg==
