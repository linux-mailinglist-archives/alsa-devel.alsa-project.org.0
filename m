Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E982ACEB0A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 09:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DF4601FF;
	Thu,  5 Jun 2025 09:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DF4601FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749109487;
	bh=1lVU87OUMq+VdvsPY4zp5fCV5+C6XQxklEAzAE/lBOY=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HsulSLcHPRGD8Hs878i6n8GDcHdDNhK5Mg9egeqRmJ4bcrMT4YRdKlM/XQcCwONEB
	 fyxKTvTFyeXDrcQIO3YKMNIsK1+dXnlO4QPcBOkUTGYGhrm9osZwGOEvfMieXS4cc8
	 oC+Xbtw2zllJ2WTqm+imNkNSaxVAYw6aEYztgNKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99095F8064F; Thu,  5 Jun 2025 09:43:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3ABF8064F;
	Thu,  5 Jun 2025 09:43:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 250F1F80533; Mon,  2 Jun 2025 19:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D4B3F800F8
	for <alsa-devel@alsa-project.org>; Mon,  2 Jun 2025 19:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4B3F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DkOGJvpD
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-32a72e61a3fso60811251fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Jun 2025 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748884717; x=1749489517;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zw/VBpj2SVdMzA0CkiknOdWwKoXyavmkjf2/vk8P/hk=;
        b=DkOGJvpD7Q8LxFQE3V+l/cvyLq+WaF444zozwURBw0ECE78/NwH0hHWNu4454miEBi
         bwHZx6bIgSpbN/5ksgHERReyoc2cJz294HkfuMcWyskFVh2Gz0nVUl6yZM1i/SAdyLsO
         95msYESdvBYoYVGlHVSg2iRCxq5k+f7m6gPp2ZY1JLPB5Pvuu7naO1QtGH0P0n1rGpAH
         VSNUfO8iEK5co+5sYivrEqUv0W8H2fvGwZnGQkkE/3DHa2G04wl1LM7pEkZ9MHnoqQOF
         cPZT17xoC7KPd05F3HYbsxlCrnUgeCoa/Of3rfz57xjC6jcXg6YhINqzm3r2R4+oYFYI
         TyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748884717; x=1749489517;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zw/VBpj2SVdMzA0CkiknOdWwKoXyavmkjf2/vk8P/hk=;
        b=SRyKkvPxIMUyoxEnFWk5Mj+ji42rHZbFwpOroKlO+Q27uNUt4pMaVESbeUHSIOwSFu
         qRlKLufIfNpNeYLPqqVn5D/o/m+KJgPU/UL+DI/h9FCth4EUQbIuaEMGZMI1gLIRs05g
         xkARIeAX8UIJ+5bR171ceJ3ZEL8Ha9ODtd/41zPyeJS/xicgBDgezjvCEPqqbRS6Qj/5
         gWpM/YWbVYf2Gw+tykilN9tVxQ3RVmwB9rK7bCAgb12Ysh1p+ZgF7LvEIUUXIi/I/zpk
         Pn6y95THeFDK1Dx0O1kNU7RgeoZFg9vSZ9ufw/J3XXXuZfSXmk4aZMn6dZOoBgZiTpLx
         WsYQ==
X-Gm-Message-State: AOJu0YwON3s7sZ3Fy2ypdi/H3KE7X7G+qW2X0M6iPxaREZ3g0RR8nycN
	p77S3m2wy6921SodD/iKaF4/xHjlr+PBniAK8Fq1G4CLYZfLtz56SOL1vzZsDQ5mCt4Sm67aZD2
	z1R8Tfub6esHJ/dbV8+drK0FhRTAU9b8OPdqe+XXF4w==
X-Gm-Gg: ASbGncuSBMtK7ESPZIrN2HWZu8uHnNw6SrwXb9jf0+Ak4h1pEBqod8JADac4xLD/GEH
	HCdW88ResYVLvKoIo0MzlREa60fNYfBDyTQByPZDRdpa4+V9qGFYggH5jDwc3X37FMjZ+l7r/lb
	nsEx/Z1XLxn1kGMQWrzo3xiTCzLk8D5qwOQ75diprG
X-Google-Smtp-Source: 
 AGHT+IFbgYCoaAjhSjEnD9lP9j3qoKSnCj/wpfXPlyPuTrrVf+DF6wePkyX4IKQtwraUMJWXKz8ln2nB6Mc//UVUe2s=
X-Received: by 2002:a05:651c:a0a:b0:329:c65:eae8 with SMTP id
 38308e7fff4ca-32abd7b8ad9mr631411fa.13.1748884716841; Mon, 02 Jun 2025
 10:18:36 -0700 (PDT)
MIME-Version: 1.0
From: Anas Muhamad Pauzi <anasmpauzi@gmail.com>
Date: Mon, 2 Jun 2025 18:18:25 +0100
X-Gm-Features: AX0GCFu8xWV2DiVBaewrCJE07sMmh_8LICHOAYRn4t8C4A674G7t1NGHCSXG7so
Message-ID: 
 <CAEj-Z=nWO6KPzi-UQxTbezHrAT+wFKUrPs+LsY-e_c4h=nuBwA@mail.gmail.com>
Subject: No input from internal microphone on ASUS VivoBook (ALC256, Ubuntu
 24.04, kernel 6.15)
To: alsa-devel@alsa-project.org
X-MailFrom: anasmpauzi@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6QITCL6B5JQMWY3TCY2PQCMESNUIQN6Y
X-Message-ID-Hash: 6QITCL6B5JQMWY3TCY2PQCMESNUIQN6Y
X-Mailman-Approved-At: Thu, 05 Jun 2025 07:43:32 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QITCL6B5JQMWY3TCY2PQCMESNUIQN6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RGVhciBBTFNBIERldmVsb3BlcnMsDQoNCknigJltIHJlcG9ydGluZyBhbiBpc3N1ZSB3aXRoIHRo
ZSBpbnRlcm5hbCBtaWNyb3Bob25lIG9uIGFuIEFTVVMgVml2b0Jvb2sNCigxMXRoIEdlbiBJbnRl
bCBDb3JlIGk3LCBSZWFsdGVrIEFMQzI1NiBjb2RlYykgcnVubmluZyBVYnVudHUgMjQuMDQgTFRT
Lg0KDQpUaGUgaW50ZXJuYWwgbWljIGlzIGRldGVjdGVkIGJ5IEFMU0EgYW5kIFB1bHNlQXVkaW8v
UGlwZVdpcmUsIGJ1dCBubyBhdWRpbw0KaW5wdXQgaXMgY2FwdHVyZWQsIGV2ZW4gd2l0aCBtYXgg
Z2FpbiBhbmQgYm9vc3QuIEkgaGF2ZSB0ZXN0ZWQgaXQgb24gYm90aA0KVWJ1bnR1J3MgZGVmYXVs
dCBrZXJuZWwgKDYuMTEpIGFuZCBtYWlubGluZSBrZXJuZWwgNi4xNSDigJQgdGhlIGlzc3VlDQpw
ZXJzaXN0cy4NCg0KQUxTQSBkZXRlY3RzIHRoZSBjb2RlYywgYW5kIHRoZSBpbnB1dCBwaW4gKDB4
MTIpIGFwcGVhcnMgdG8gYmUgcHJlc2VudCwgYnV0DQpyZW1haW5zIHNpbGVudC4NCg0KSGVyZSBp
cyB0aGUgQUxTQSBpbmZvIGR1bXA6DQpodHRwczovL2Fsc2EtcHJvamVjdC5vcmcvZGIvP2Y9NmQ2
NDY2YmE5MDNiMmUwOGIzNTEwNDY1NzFlMGZjNTRkZGQxMzk4MQ0KDQpVYnVudHUgTGF1bmNocGFk
IGJ1ZyByZXBvcnQ6DQpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9h
bHNhLWRyaXZlci8rYnVnLzIxMTIzMzANCg0KSWYgdGhpcyByZXF1aXJlcyBhIG1vZGVsLXNwZWNp
ZmljIHF1aXJrIG9yIHBpbiBmaXgsIEnigJltIGhhcHB5IHRvIHRlc3QgYQ0KcGF0Y2guDQoNCk1h
bnkgdGhhbmtzLA0KQW5hcyBQYXV6aQ0K
