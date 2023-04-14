Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61E6E2FF4
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:10:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52AB8843;
	Sat, 15 Apr 2023 11:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52AB8843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549816;
	bh=WjziLwR8094O+ezF5oVnm2FP6AQC/z7eTp5YOrFH7gc=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eRPg2qmrTqTZmPvCR7wshCmjKO7Ukb7HBicRAslY24ushQOeXhIK/JYk4j1t6ZtY+
	 dOYh7gOng++qykZFkE06syLZPrEtMmYMnAGqelj2LJPw6+GOUiv2edao45Tgg0R8R0
	 428gGUrnbDgZLhqNi0B6xSxvvzHn/F//CwGuAMEQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04513F8025E;
	Sat, 15 Apr 2023 11:09:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69742F8032B; Fri, 14 Apr 2023 12:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46D13F80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 12:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46D13F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=SeoKkb7J
Received: by mail-qk1-x736.google.com with SMTP id f11so12536899qka.5
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681467340; x=1684059340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri5kJ04UwLWxpdY74GK6GyUwCSLOp/EIN9cup+Z99hI=;
        b=SeoKkb7JbRJIICEys9uHNoHmWQvsIbVsB6c/sTLVkuO62nNcl1iX2DOt88Q8pgDDz+
         NE4X6WbcRv87X+z59myBuZrx5luwfYGywmNuhLFpir0hKRd7EuOU0QyaxGviNCQiXITS
         W19NOxGNLGHJ/aj4eRTd3UjKpH8KDzB9uEjhXlH6jFPVWQ+pv3JnlfGvZW3rVSEWKsIf
         BAeOI4jXZFzmJnW6bno+6mOlVWrRmrM9W+OxO3NDIV8GFfyPYvVI53NFMAnIL7ENI66+
         TFS0JYEii3AW9afEoJGVd1rgbXZqbkH0topXc5VEzWUcj+qL2+LTdIq8kZR4iY3bdp+g
         FDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681467340; x=1684059340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ri5kJ04UwLWxpdY74GK6GyUwCSLOp/EIN9cup+Z99hI=;
        b=DxvGW9KXM6ZyPRBbOD8EqqQAaPzCx5mLqym4XYmuKbn5yKulf/mt4++DhYSL1K3OEp
         tYWx2sHRfEDgnm2mgflAl04rZKpnsqHzqveB/4c24Ve/ZSQqjQ/LoGuVgjbE684Wiv6C
         NTPSCi2SakCks0BpqRJdJGpkwVO7N3fdB8pE6Lih7ysjVY1/G5MpB5oyjTuATMsjdkeE
         q3HmrFL40LVzMhJ/owMfSuxmEObx5g69qIp/0rbDNgD16fwhgfzKTGPoqUBcsB5c5epH
         CFYxujDHJEM9CyGaI3+jB2CqnoDThhc/2VSO3ylzJB1BITS0LI2gaQnnMhAzGLHs3MXK
         Ywmw==
X-Gm-Message-State: AAQBX9coFQ3J23t5qOiiObiVkojNWxagdK5onTTOccvgTQfxzkWYcRs/
	KXi0jRdLpFPkE+AQTO9vYg5B0+Bjk0Tegz3waC0=
X-Google-Smtp-Source: 
 AKy350Ze6HD+pGQEaf/j1Gg9KSXcO/VVlTw0QNY2u7KioY1G3knFpab+BB5F/JRwR6hcImdoEgMDP94vF67NLpeGdK8=
X-Received: by 2002:a05:620a:1229:b0:74a:aa62:8553 with SMTP id
 v9-20020a05620a122900b0074aaa628553mr1006302qkj.6.1681467339939; Fri, 14 Apr
 2023 03:15:39 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
In-Reply-To: 
 <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
From: Luke Koch <lu.ale.koch@gmail.com>
Date: Fri, 14 Apr 2023 12:15:29 +0200
Message-ID: 
 <CAPDUAqPVDi4TgAja92tMqMp6rGAyC-eabS_6+W0zThKfsZAxGA@mail.gmail.com>
Subject: Re: ALSA: arecord : silennce recorded as 0x80
To: Muni Sekhar <munisekharrms@gmail.com>
X-MailFrom: lu.ale.koch@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7S4CCU43TAJ2L2GU4GBQFULSLLCIOBTB
X-Message-ID-Hash: 7S4CCU43TAJ2L2GU4GBQFULSLLCIOBTB
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:08:50 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: LKML <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7S4CCU43TAJ2L2GU4GBQFULSLLCIOBTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMzo1MOKAr1BNIE11bmkgU2VraGFyIDxtdW5pc2VraGFy
cm1zQGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IEhpIGFsbCwNCj4NCj4gSSByZWNvcmRlZCB0aGUg
c2lsZW5jZSBvbiB0aGUgZGVmYXVsdCBhdWRpbyBjYXJkIGJ5IHJ1bm5pbmcgImFyZWNvcmQNCj4g
LWQgNSB0ZXN0Lndhdi4iDQo+DQo+IE9uY2UgaXQgZXhpdGVkLCBJIGNoZWNrZWQgdGhlIGNvbnRl
bnRzIGJ5IHJ1bm5pbmcgImhleGR1bXAgdGVzdC53YXYsIg0KPiBhbmQgSSBzZWUgdGhhdCBzaWxl
bmNlIGlzIHJlY29yZGVkIGFzIGEgc2VxdWVuY2Ugb2YgMHg4MCBpbnN0ZWFkIG9mDQo+IDB4MDAu
DQo+DQo+IDAwMDAwMDAgNDk1MiA0NjQ2IDAwMjQgODAwMCA0MTU3IDQ1NTYgNmQ2NiAyMDc0DQo+
IDAwMDAwMTAgMDAxMCAwMDAwIDAwMDEgMDAwMSAxZjQwIDAwMDAgMWY0MCAwMDAwDQo+IDAwMDAw
MjAgMDAwMSAwMDA4IDYxNjQgNjE3NCAwMDAwIDgwMDAgODA4MCA4MDgwDQo+IDAwMDAwMzAgODA4
MCA4MDgwIDgwODAgODA4MCA4MDgwIDgwODAgODA4MCA4MDgwDQo+IDAwMDAwNDAgODA4MCA4MDgw
IDgwODAgODA4MCA4MDgwIDgwODAgODA4MCA4MDgwDQo+IC4uLg0KPg0KPiBXaGF0IG1pZ2h0IGJl
IHRoZSByZWFzb24gZm9yIHNpbGVuY2UgYmVpbmcgcmVjb3JkZWQgYXMgMHg4MCBpbnN0ZWFkIG9m
DQoweDA/DQo+DQo+DQo+IC0tDQo+IFRoYW5rcywNCj4gU2VraGFyDQoNClRoaXMgaXMgd2hhdCBJ
IGZvdW5kIGFmdGVyIEdvb2dsaW5nIGEgYml0Og0KU2luY2UgeW91IGRpZG4ndCBzcGVjaWZ5IGEg
Zm9ybWF0LCBhcmVjb3JkIGRlZmF1bHRzIHRvIDggYml0IGZvcm1hdCAoVTgpLg0KQmVpbmcgdW5z
aWduZWQsIGEgbmVnYXRpdmUgdmFsdWUgZm9yIG1heGltdW0gbmVnYXRpdmUgYW1wbGl0dWRlIGlz
DQppbXBvc3NpYmxlLiBUaGVyZWZvcmUgdGhlIHZhbHVlIGlzIGdpdmVuIGEgYmlhcyBvZiAxMjgs
DQptYWtpbmcgMCB0aGUgbWF4aW11bSBuZWdhdGl2ZSBhbXBsaXR1ZGUsIDI1NSB0aGUgbWF4aW11
bSBwb3NpdGl2ZSwgYW5kIDEyOA0KdGhlIGNlbnRlciBwb2ludCAob3Igc2lsZW5jZSkuDQoNCkJl
c3QgUmVnYXJkcywNCkx1a2UNCg==
