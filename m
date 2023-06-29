Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F880741FDE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 07:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F9EA7F4;
	Thu, 29 Jun 2023 07:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F9EA7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688016342;
	bh=5Ji4+mwFwUJU8B0gHdLfKJrzotC9gUTZlAqncz4u1gQ=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qc5pX6IdMMwY6cKuSSih3sJMvu6whS0a63475AJdjvTSM6kIA5Jof2HRNAi6ytGWM
	 3lmnpUq+uMVuJeYPGzPf0CYAAVzGA0y8e9zC43PYpAG+WGJeVA1ft70NsxNXv6GOqQ
	 v0rAdOzeAsltnbs/y0IiyXPtGlQgAUjn9Z46cPFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6147F8053B; Thu, 29 Jun 2023 07:24:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF23F80212;
	Thu, 29 Jun 2023 07:24:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F5ABF8027B; Thu, 29 Jun 2023 07:24:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 240B0F80246
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 07:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 240B0F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ZR8KieE4
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313fb7f0f80so277913f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 22:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688016265; x=1690608265;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q7Zb3ptpnVJQ3FoWuCmON/yID+peaWlZ5+qpFbFTPoM=;
        b=ZR8KieE4MsSSqZ23h4wl+ImlJMDJ/+a3dG6k7cGz5a00Ir3fYD6xa72eMvERNpXHMw
         XQ0p9v2j9uvvV2ki0o3QZ3QOu2WO8lxEai+333jvpMeTWGkFhUJ/CCuaG+8s/lGIP7o5
         yPAJUfTqqyr75USWPAY/z4yCfqyK0qzxZTYKMxAxyThrBlw8rcc1codTjb6lWhnY+WWt
         5LQjBBfu5pDJEklFKRmaF3Fv6lyzZ7tQBG2wSzWokz10Se23aeXHACCmqVUZYFSwx748
         dYo9FTZJXjBkSbmAhartRasguvSxzGaaqYogkNjEWu+3muDobdkkzaCavySauy+Dcs5o
         Xvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688016265; x=1690608265;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7Zb3ptpnVJQ3FoWuCmON/yID+peaWlZ5+qpFbFTPoM=;
        b=iPvF0ZbQS5B+2S86l+638rMWXyLsSEDqhU/Yi0Vj9o38NPj75p9dhkPGebE5T3zN3V
         BgoyPB2vhkYalv/NAwHDbWR5KXOHaXBNeZi4WLeMjwPH1wFkEIP7eBC3fiOYVX3UIcKJ
         xWIA8cgoaV12WyLbvpNrudff5XkkKeg2vXMRXERc6Q1Enyx4XQ/r9fCeroba3Zoc7J5k
         4GJwuOIljYpSQNxrWFzWJ95+qd+n5QLeRIcwc6itaiHKEwa1dGi23ocx4JIbYhMGfe2e
         AxcoL3hHAR6RsUEFQu1GYLUf8j43JpvQxuDFhVZCkeUAQ8q53A7ixFnMeM/t9q9odlmi
         jQ1w==
X-Gm-Message-State: AC+VfDx1m2gCu3MPLGirlpiEllqoV3B4gy5yhojQgsEOlZzh08QJrfoi
	uJqhm2LX4ajCXBC7zMqKG9FOSsQKkM6ZrhitGwhgMm7FUa8=
X-Google-Smtp-Source: 
 ACHHUZ4vWrplLne/XIZ63BzRy/1gxcbZwZmaLiWCNckHW4kaXPOY6SLR0h8eVfcx0iYP3KOnq9LpmWWqH+6F8p4e+VQ=
X-Received: by 2002:adf:f10f:0:b0:313:edf4:e6e1 with SMTP id
 r15-20020adff10f000000b00313edf4e6e1mr9402345wro.67.1688016264601; Wed, 28
 Jun 2023 22:24:24 -0700 (PDT)
MIME-Version: 1.0
From: Arjav Parikh <parikharjav24@gmail.com>
Date: Thu, 29 Jun 2023 10:53:48 +0530
Message-ID: 
 <CADoF8+D51=FFNxqJQAje3LozqCPOO5SJZqo9eaLMMU6LAd5N2A@mail.gmail.com>
Subject: MIC Capture Stops due to Playback
To: alsa-devel@alsa-project.org
Message-ID-Hash: W3BZOI3WK66CDSL2C3IGDY4JYSASNMKC
X-Message-ID-Hash: W3BZOI3WK66CDSL2C3IGDY4JYSASNMKC
X-MailFrom: parikharjav24@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3BZOI3WK66CDSL2C3IGDY4JYSASNMKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkNCg0KSSBhbSB1c2luZyBhbHNhIGFwaSdzIGluIG15IEMgUHJvZ3JhbSB0byBpbXBsZW1lbnQg
dHdvLXdheSB0YWxrIGkuZQ0KY2FwdHVyaW5nIGRhdGEgZnJvbSBtaWMgYW5kIHBsYXlpbmcgc291
bmQgb24gc3BlYWtlciByZWNlaXZlZCBmcm9tIENsb3VkLg0KDQpJIGFtIHVzaW5nIGEgTWljcm9z
ZW1pIFpMMzgwNTAgQXVkaW8gRFNQIGNvbm5lY3RlZCB0byBhbiBBbWJhcmVsbGEgQ1YyNSBTT0MN
CnZpYSBJMlMvU1BJLg0KDQpSYW5kb21seSBJIGhhdmUgb2JzZXJ2ZWQgdGhhdCBJZiBJIHN0b3Ag
YW5kIHJlc3VtZSByZWNlaXZpbmcgZGF0YSBmcm9tDQpDbG91ZCB0byBwbGF5IGl0IG9uIHNwZWFr
ZXIgdXNpbmcgc25kX3BjbV93cml0ZWkoKSB0aGVuIG15IGNhcHR1cmUgcGF0aA0Kc3RvcHMuIEkg
ZG8gbm90IGhlYXIgYW55IHNvdW5kIGNhcHR1cmVkIGZyb20gTUlDLg0KDQpDYW4gc29tZW9uZSBo
ZWxwIG1lIHRvIGRlYnVnIHRoaXMgaXNzdWUgYmVjYXVzZSB3aGVuIHRoaXMgaXNzdWUgb2NjdXJz
DQp0aGVyZSBhcmUgbm8gZXJyb3JzIHJlcG9ydGVkIGZyb20gQWxzYSBub3IgZG8gSSBzZWUgYW55
dGhpbmcgaW4gZG1lc2cgYXMNCndlbGwuDQoNClRoYW5rcyAmIFJlZ2FyZHMsDQpBcmphdiBQYXJp
a2gNCg==
