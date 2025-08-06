Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF7B1F9B2
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Aug 2025 12:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E7C601EB;
	Sun, 10 Aug 2025 12:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E7C601EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754823058;
	bh=M0Q+UjO0DAw6vRy8bYdy1az/QsuI/Ao9CWZcCKLVAPU=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tQ40b/2scQ6Aou1KYRLCIddRf8FvmH6pCs4VcxFWEIQ3DNboCW3idIouKqIqrpKo0
	 Zwlx96kUA3pPaNbrjyfa0hzPifzTmuM+VKMB2E/yMFX+U+C4QNwUtNTuz37XuPHPs2
	 iG7MUxrXjim5DokkK2paDjZdM8KmThQ4N7SBy+bE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5BEF805BA; Sun, 10 Aug 2025 12:50:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE784F805EA;
	Sun, 10 Aug 2025 12:50:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3BBBF80423; Wed,  6 Aug 2025 12:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96DA8F80134
	for <alsa-devel@alsa-project.org>; Wed,  6 Aug 2025 12:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96DA8F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c4KW5rb5
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-76bf3dafaa5so775652b3a.0
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Aug 2025 03:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754477876; x=1755082676;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jSUVe1M5X2sr8gMyPVkbhKuzUsLrNdV6VGIOxTXvzgk=;
        b=c4KW5rb5ltGDJ9p/JXBkhBHreo3zu73e31p8Eu6AlxvL9WZO6hmIhuOm+7+F37/eX7
         c53mNM/Bt8XAsKKcgZAIc70oVYMk/RLUn0dfjqSO6Aykb8rU/Bt6XgIeBiROMXgg6nZM
         eXW3U2zB+JPzPcSvolnqz2wQQ15Mla2ajOVHMOzqIiEjTzRYumux8Jt2R09G8EsnrL5K
         OWeVMJASZ2kbq8rXDe+JISvivWEMuk1NZ4ee/9nHuD2BT9nYLgsFXIBczwCQllBeGeA5
         iIwANVf7aHk+NKbyw4jWnRLuaS9rtuc2tq1bfi0eCR/OnbrN0IDR/aSBwltvNZ5zoMsz
         /8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754477876; x=1755082676;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSUVe1M5X2sr8gMyPVkbhKuzUsLrNdV6VGIOxTXvzgk=;
        b=xNcPOJpr13a/JTV/v9U25h5u1LFWG12++033l8sHJeuMJwEAZf2ll3k6qUE2JcbVdq
         w78sFX/DOTi+7OJyFHTqCjpSjyOAV3A72CRShWc6g58mBWQTJvvKVqv6KrQDThiMvgCZ
         ir5sSRIc5Gm3Pu+mLxZd4mv4uCTNgTQkG5BQh9m9k5N0EtDlOzcpMOGPfHw6GNM1OEns
         yWRjrljNFJtYS2gHB3Bxr/VyiKmbcuSzBWsMcX/rbMTS46lKb3cPAs9179jJOsVF/anu
         Gp0pNFpj243lA1Q1C3iNKEhJk+F6+oJCv9pgIYRTRX8qyNlMI+X7CeK0gyt50rVEUEKe
         FUlQ==
X-Gm-Message-State: AOJu0Ywf1AUNNikckJmggeg5dwv6sT9fB6IqIiwrPZeILsMxg0ak2U7q
	gC9BEpGFBX8FkSPpPqrmIggI6j+pUkkwSsIJuz/jSvUMP8SgldLbmj0U1aAWjcZPwcTKUqfQTRF
	hWEzqxrs43yHxbGzpj0CZO5ObDEWwjofPv6jF
X-Gm-Gg: ASbGnctEeNW2AILLPEKtoWjmfslT+PP7aewpDbyL/5SoevV+o2DbvrvcNyXnkpMnZIw
	+9oxX1UzuYaNCOcYLLrbDWoEyvIzJJq7acpx7wg3Cc8zEGKmAvqoFhHd5vyfod8oRMDhLYhlTEH
	gwsyiqTMAa0WEqpdXZhZpjjUIudchwizmKqJ/bColHtI9epldoxNbgzFlacRHA3QK6W9e2Jc6g5
	e+s7d/4
X-Google-Smtp-Source: 
 AGHT+IGi9Piw9nX5VppOYO77FTiQz+7PY46zybRCizrG+es7+rAfnc3PsvEb0JmGqAbD3A2NzqgnSJWvJIUz/t/YrNs=
X-Received: by 2002:a05:6a20:5491:b0:1f3:31fe:c1da with SMTP id
 adf61e73a8af0-24031ab86c4mr3490887637.11.1754477875735; Wed, 06 Aug 2025
 03:57:55 -0700 (PDT)
MIME-Version: 1.0
From: Goran Kovac <gorankovacstudio@gmail.com>
Date: Wed, 6 Aug 2025 12:57:44 +0200
X-Gm-Features: Ac12FXxOzJUIbG3qOzSU4Q3sFyNzFuK0fkVrTyfdYomflOBkGgjiwDLFkuHO5MM
Message-ID: 
 <CA+GtZPW1b4KMRyoWx3Jc3G8bsegdFGCoPj=o=3yi_5evNX1=yA@mail.gmail.com>
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
To: alsa-devel@alsa-project.org
X-MailFrom: gorankovacstudio@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZGXMR7PTEIA424F5IFAS2KA2LGPGEOY3
X-Message-ID-Hash: ZGXMR7PTEIA424F5IFAS2KA2LGPGEOY3
X-Mailman-Approved-At: Sun, 10 Aug 2025 10:49:57 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGXMR7PTEIA424F5IFAS2KA2LGPGEOY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

V2hpbGUgdGhpcyBpcyBtb3N0bHkgYSBub24gaXNzdWUgZm9yIHBsYXliYWNrIG9ubHksIHJlY29y
ZGluZyBpbg0Kc3R1ZGlvIGVudmlyb25tZW50IGlzIHVuZm9ydHVuYXRlbHkgdW51c2FibGUuIFdv
dWxkIGJlIHJlYWxseSBuaWNlIGlmIHRoaXMNCmNhbiBiZSBzb2x2ZWQuIE15IFJNRSA4MDAgY2Fu
IGdvIHJlYWxseSBsb3cgd2l0aCBidWZmZXIgc2l6ZSBidXQgaXRzDQphbHdheXMgKzkwbXMuDQo=
