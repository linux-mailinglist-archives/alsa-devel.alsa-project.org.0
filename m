Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2773DE0D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:48:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCCE5150D;
	Mon, 26 Jun 2023 13:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCCE5150D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780083;
	bh=5Ji4+mwFwUJU8B0gHdLfKJrzotC9gUTZlAqncz4u1gQ=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Em0JjBUXIeXYzHV8cwzF5HdGHwToFK8bPA92Xn8Be43THkVrJnsBUFFWgrgSLy3OL
	 Ni//FX8Xbl+Ij77uh7xRcgM0RaAWdZdKkVul/36MsdURyQiyqVuUliDXWp6VuuXVol
	 SIth+u6u/Bn6PPuQ4wkIMEjc+S3jVoNHOAM1ai/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A1C4F8061B; Mon, 26 Jun 2023 13:43:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E8B1F8060A;
	Mon, 26 Jun 2023 13:43:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D125FF80246; Sun, 25 Jun 2023 21:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00EA0F80169
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 21:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00EA0F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=nliMAH2c
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f9b4bf99c2so33866925e9.3
        for <alsa-devel@alsa-project.org>;
 Sun, 25 Jun 2023 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687722731; x=1690314731;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TkaYswH3dbzz55Xs2lEJwR6oMRbmrxDlmzLsSuOiFqo=;
        b=nliMAH2cpvpJsjLQVTrGnKhAimAVCwWNih0Bb5Stx+Mub4geSNx1dAaH9GRU5VhiLU
         FQoOWqlJ8763Rsy7X/GaF6rKhCu3PQrMkmViwQX0ZAm56eFlJ6UUuNDLtdm9FAjIYKYf
         ibgkzk+lJMUAORWpCrVtmnIbyUYTGpYGnXJK3VTm11IO3a7aBURwwHJVzK1TeDKujObZ
         obwCQKWcFGqCNVIEAa8oNGQAvYl8Z+vF5C32AmOhFlraNOHY5+vj2UhNL7hJzCAWI9Dq
         dVPlqtzHRXoMPlV8CejssyoFTQqD67Lrx57VRGxWTiLbrhFuG09NDNDOT0nkQ7Qy+bH1
         v7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687722731; x=1690314731;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkaYswH3dbzz55Xs2lEJwR6oMRbmrxDlmzLsSuOiFqo=;
        b=HTLelZ0T2wO5WfxlDKClDxYO46SDtKw4VB8NCIdi7XD411r3RIWrdh8PgaXFSy3SXJ
         xJfR4gwpjL8V0y9AsXVAK6GSOAXTx0Uv2giybxc6L4VtZs4RdbF6CimQttZjFbABM30W
         JcUaTeeEe8j2q09ZncACMJWf3yxTbvMB16N+Be/DSEXQU/bffX5cepVOa7v9crMxdg8L
         XFAkLPw17XojbOZaQ0rjz4E3ocwIHDmBqB0NWC0KXtbVVW7ukRG4elax4t3otY6oOjSK
         iqLeZ265+JGEnceTcvTMms7c+rwhy7gjC+aJSrYwoJhp3DZydcrDuLI7pK0jFzmhrNlE
         hRig==
X-Gm-Message-State: AC+VfDyLwftRCivEMK20eihVuel+jlusL/RaKF7Tl2gxaWOLTPBvnhBs
	Et6gMdjw5WpHDuJY8uHPsorP2eKKyynkxkeoKOrKANHBehM=
X-Google-Smtp-Source: 
 ACHHUZ624IU/DIsy4Ztl4Gblwb2uJuXHb4meCmKY1eXM3N3ghjpDlolI/0ZYEwTQPBQE5ObJGfjBTuYfsmnI+K4ngbo=
X-Received: by 2002:adf:dc88:0:b0:313:ee3e:50c5 with SMTP id
 r8-20020adfdc88000000b00313ee3e50c5mr1901345wrj.20.1687722731432; Sun, 25 Jun
 2023 12:52:11 -0700 (PDT)
MIME-Version: 1.0
From: Arjav Parikh <parikharjav24@gmail.com>
Date: Mon, 26 Jun 2023 01:22:00 +0530
Message-ID: 
 <CADoF8+ALvz+hCu-cx6QyyCE8uvV5DWcyu2N7viZpJEJ=XeyFZg@mail.gmail.com>
Subject: MIC capture stops due to playback
To: alsa-devel@alsa-project.org
X-MailFrom: parikharjav24@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LT4PT6F6UA4C5HLVMLKCDYNDTUYM5QS7
X-Message-ID-Hash: LT4PT6F6UA4C5HLVMLKCDYNDTUYM5QS7
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:55 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LT4PT6F6UA4C5HLVMLKCDYNDTUYM5QS7/>
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
