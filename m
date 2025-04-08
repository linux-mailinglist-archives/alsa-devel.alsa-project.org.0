Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293BA8410D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 12:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9702F6A8BE;
	Thu, 10 Apr 2025 12:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9702F6A8BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744281889;
	bh=NrhJ6SzzQ/PgGgxneFFyP6Ox/InK8EUy4fGdNgR1S88=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W6DjqcsTMKv7K90idBLZnjkkj67VoEl+l4A0L6PEW+TZ7/7lk9T1Sogo4SPQVR7Y9
	 VlPVlBk+xm1kIXPI5gOTfvX1IUld0SM9DmllwdoQf91vgDKt5zXR93aVWJJkGUSkdw
	 iPHOTzyyzlINKprSu3A2YQIb3arBHosXi1itETX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 953DBF805BF; Thu, 10 Apr 2025 12:44:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B94F805BE;
	Thu, 10 Apr 2025 12:44:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F6C0F8055B; Tue,  8 Apr 2025 22:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 716A1F8003C
	for <alsa-devel@alsa-project.org>; Tue,  8 Apr 2025 22:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 716A1F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kziD4qtN
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so68919166b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Apr 2025 13:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142492; x=1744747292;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bNchtQh6zPVwJtAvDDMxfjZjpLOdglQccQoL6yekagk=;
        b=kziD4qtNH5JYGcyFPCE2wqCafFtCMbL15S6TmAQQ+6mh0nf2JupJgTAa0LqpaThEoG
         OtWizmAJqWf0kCfFKRT7y8yjAr/ZQjmSVd8kx85ATGT3CUN7G4Kab+BSSvJepjqJ9Uzl
         RjeOXKseDUGB3/LI/RUEbAsevJBG2Rkkhqk4GOyKP5b+D3BG7SHfv7HwwGBzKPCJd6Vz
         d0nooCae8eiUzmt2FCsoDpiSHhvfdtxQDjTqflXMW2rPdPnBCq8UanDT6X3ogKawQUmW
         CajEId1WfnPdF9+GdNUY1cbkjGcRV9Gf64t+u76Jy6xx2r/rPqlkYbBvqdEvj96/Mf0x
         ZpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142492; x=1744747292;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNchtQh6zPVwJtAvDDMxfjZjpLOdglQccQoL6yekagk=;
        b=s2J6iZ7ihEuI8OslaThb49BgyXdw0O0S2QkvMZyDYUOlWmUF70af6TK7g9K4x4RUGc
         LnbWUpJcOyTgj+6ptnO2nLoWEpiyN5Q8SL98TAfly2OnLoRE1+8Dd2Gozs9vghpiBEWo
         By4Pgwq47JES14TWzz/aNqkBtImKAU7W5AjXfttGNihm1dgYzhWTGCgUws/sSSbPjWhE
         tOIKjrkZUV2PTcPBUbVP/UiQGTQP9xF3TY04nWTQF2c0vwn+WzAfnXOSX8vZsGK5k269
         zVNLU4Yymfyx35tLpVlMYN2/MYD56YAHryNT0rMAovl/CcyhBU7vaacBPw043UXS9oj8
         Y+0w==
X-Gm-Message-State: AOJu0YwWI/fEPydUcQZJGKT+Ry/E9hZclCOzAL9O663j7IOgED7ELfsb
	pH9GJeW9ZRxPmO+kxvgbG9MhyQbR68n+g3gBwxYVUaw/yGUMFpOZM0FPAr9XV0yyl1hx9CsviH3
	2yOZPyYeBGMQvOqt5XlqDW5dXnNO4HauKcSE=
X-Gm-Gg: ASbGncveXuEcu2TG9jFBm0g6o8MGV3N6vpeLiwZuwuoaZAvVuvM3Faxpvz+1nR3D/P7
	sPd1mqzkizurzZHP59HeMQgwx8mZlXdeulNbnu8874ux763UK0u5KypVhQqiXEqwYlU2nQ3k5Ix
	G9dMPfh2mIP3JGIjr4gw8x/epYjA==
X-Google-Smtp-Source: 
 AGHT+IGL8VZ4AdGnGrKFQU9e04t902pN4Hb50jzrnda/donO1pZNaCpQpmsNTyeeLn5K2jpBDtmKm02/Ultq1MaGWWU=
X-Received: by 2002:a17:907:d1f:b0:ac3:a7bb:1c2f with SMTP id
 a640c23a62f3a-aca9d5dc8ebmr3869166b.7.1744142491494; Tue, 08 Apr 2025
 13:01:31 -0700 (PDT)
MIME-Version: 1.0
From: Adam Larios <adamlarios@gmail.com>
Date: Tue, 8 Apr 2025 15:01:20 -0500
X-Gm-Features: ATxdqUF1dRrx0igJBzns3SHm_tVB9F1T_T-ZZ84JDGv_Wt_7LQhGZgoQl3SFOfM
Message-ID: 
 <CADcFSmxu5BSB-S6rgLqX58JnnE1jaFssQ5p9SELjH3PRGm4R1A@mail.gmail.com>
Subject: Dell Precision 3571: DMIC not detected by SOF driver, silent mic
 under Linux, works in Windows
To: alsa-devel@alsa-project.org
X-MailFrom: adam.larios@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7XBQW7MU3XT72ZVNS5I3S2SBK6NXYY6O
X-Message-ID-Hash: 7XBQW7MU3XT72ZVNS5I3S2SBK6NXYY6O
X-Mailman-Approved-At: Thu, 10 Apr 2025 10:44:07 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XBQW7MU3XT72ZVNS5I3S2SBK6NXYY6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

KlN5c3RlbSo6DQpEZWxsIFByZWNpc2lvbiAzNTcxDQpSZWFsdGVrIEFMQzMyMDQgY29kZWMNCklu
dGVsIEFsZGVyIExha2UgKFNPRiBwbGF0Zm9ybSkNCg0KKlN5bXB0b21zKjoNCkludGVybmFsIG1p
YyBpcyBzaWxlbnQgb3IgbXVmZmxlZCBpbiBhbGwgTGludXggYXBwbGljYXRpb25zDQpXb3JrcyBw
ZXJmZWN0bHkgaW4gV2luZG93cw0KU09GIGRyaXZlciBsb2FkcyBjb3JyZWN0bHkgd2l0aCBmaXJt
d2FyZSBzb2YtYWRsLnJpIGFuZCB0b3BvbG9neQ0Kc29mLWhkYS1nZW5lcmljLnRwbGcNCkJ1dCBk
bWVzZyBzaG93czoNCg0Kc29mLWF1ZGlvLXBjaS1pbnRlbC10Z2wgMDAwMDowMDoxZi4zOiBETUlD
cyBkZXRlY3RlZCBpbiBOSExUIHRhYmxlczogMA0KDQoNCk5vIHdvcmtpbmcgYXVkaW8gaW5wdXQg
bm9kZXMgZXhwb3NlZCBpbiBQaXBlV2lyZQ0KDQoqVGVzdGVkKjoNCg0KICAgLQ0KDQogICBVYnVu
dHUgMjQuMDQgd2l0aCBrZXJuZWwgNi44LjAtNTctZ2VuZXJpYw0KICAgLQ0KDQogICBzbmQtaW50
ZWwtZHNwY2ZnLmRzcF9kcml2ZXI9MyBzZXQNCiAgIC0NCg0KICAgUHVsc2VBdWRpbyBhbmQgUGlw
ZVdpcmUgYmFja2VuZHMNCiAgIC0NCg0KICAgYWxzYS1iYXNlLmNvbmYgb3ZlcnJpZGVzIGZvciBt
b2RlbCBvcHRpb25zDQogICAtDQoNCiAgIGhkYWphY2tyZXRhc2sgcGluIHJlbWFwcGluZw0KICAg
LQ0KDQogICBTT0YgZmlybXdhcmUgYW5kIHRvcG9sb2d5IGNvbmZpcm1lZCBwcmVzZW50DQoNCipD
b25jbHVzaW9uKjoNCkZpcm13YXJlL0FDUEkgbGlrZWx5IG1pc3NpbmcgRE1JQyBOSExUIGVudHJ5
OyByZXF1ZXN0aW5nIGtlcm5lbCBxdWlyayBvcg0KZ3VpZGFuY2UNCg==
