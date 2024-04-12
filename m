Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47818A9F1F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B57F15FE;
	Thu, 18 Apr 2024 17:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B57F15FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455578;
	bh=SA0q6SsNFlcUSbmyksfGP3j4aVnwqM+5MoF1Muj/XLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dXibO1gd2AyqH88uBzy6SwrgHgJ3zlpGSAGw5ZTYhqSDghuPtefCnDP/IVFTPX6Bg
	 m1AH1czn3z80Oo9YSwRpIUbLOAwI9YlkBsSOa/YM2hRHX//WoQ/gg/blGRibpyPj/f
	 xa6abObXj2ughAIgQRty9nrF6H7IMQ9uwyPsrCf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EAAEF89744; Thu, 18 Apr 2024 17:47:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3ED2F8972D;
	Thu, 18 Apr 2024 17:47:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09BE1F80606; Fri, 12 Apr 2024 16:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D939F805F0
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 16:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D939F805F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hnsTGAt0
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2da08b06e0dso8023541fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Apr 2024 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712931388; x=1713536188;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SA0q6SsNFlcUSbmyksfGP3j4aVnwqM+5MoF1Muj/XLA=;
        b=hnsTGAt0NgzeLnGXCcD2eTg+Q18uNGlAZm6t2VZJdNoH1XQBWYZqkK6owDSHf0mCsh
         KaS1PEBg4F+mLik8apiAyf3kKLP/yyPms3w0VAID8DywNRV2G2WG9qaS9Iphjul0trgL
         aj61lRKClz7Sjsn/jn+9PMtKoS2J7MIJ+wuVhiwovdpA4QuRsomf4Y2hUw0ZXm3kUd/U
         5TR9zy1FcwAN0b3pyQLZVZWXbxT1l6kuRHtuzfAXrqqiJxQtjPWb5vuM21YRti8HECoK
         tA2asHPflKM+xir0kaIxApMSSn0AA9o8j36wfsnyAi/jQd7vD/d3A+SDfAJtN8Qtr4tA
         AHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712931388; x=1713536188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA0q6SsNFlcUSbmyksfGP3j4aVnwqM+5MoF1Muj/XLA=;
        b=fa/FwU9pmJlK1R1kSNakJpQhjyhHhWceWsuM9xGd0+o3msWH6zrZwVjZLQxP79qEY4
         035Bkvpj5fzmznw3EWk7NPcNDfFH4fgI7Gyggp2cd07xfNxbEHslYpzdEuxwuIxHw9Gx
         B4QyBZ2t651XeRPv1q6F9VgNGiH7a8vREpbY3GXMUpaLjERwyFxFY0ghmBLHF3P2mPtP
         WFfWKSOMrXzx+lGBfJAYGWdptYlSsH5vXrcEbNIwdWwy80rr7VC97eOXwt1DOota9Xek
         yqZ2bObNTku/LItwCMUZlY12y3NmBzMd8bBmyDJD42xRC+kMh3bxEzZkkVwkdr9FWVi8
         gPaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaSwHsZXsUAdx8CqGv1Gtook2u9QQ2wR3WOGJ8d2qq5m9n7hWgJ0KFtuSLHUS6h2ISh2YlxHDa4pXk0eqzkivnAKeIPkKz5mSblOU=
X-Gm-Message-State: AOJu0YyBEHO9NtDf1mDzBAjee3zAvgDaT9UM23tlGKAxO5JhSTUthRGP
	c3sTucccn7i8fH4TBQ5+XuO1MeeQvVusP4F7Ji7sRSAjuGXDnKwfhy3pODLQ5qU0DRpOLMC0o2z
	Usf+ufI6wuYP3R9A0IYFHn14Js6s=
X-Google-Smtp-Source: 
 AGHT+IHN1he0MRVv1bTgEsUkkS+mTqrtLXetL9ppYbRVjNCqz/IXwcP7pZldQHAqVu/k6BLU2IAiQWzC8tpvO83CdzA=
X-Received: by 2002:a2e:b5ae:0:b0:2d6:fb69:114e with SMTP id
 f14-20020a2eb5ae000000b002d6fb69114emr1557427ljn.21.1712931387856; Fri, 12
 Apr 2024 07:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240404160649.967-1-bavishimithil@gmail.com>
 <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
 <CAGzNGRnuG_gLUrH1N57WvpKbpiNtFrcsG6nJcacQNJB_yMYNrA@mail.gmail.com>
 <ec7f77a7-2cf1-4ea6-b9c4-d4fe8a1673ab@linaro.org>
 <CAGzNGRktm5gMj=bhtX2RAzcn1v5ref+nV-HV3Fct56FzAzxjWA@mail.gmail.com>
 <c9084453-65f1-43b0-88df-5b73052ccb72@linaro.org>
 <CAGzNGR=2-us8GRB3RNi4_24QZ9rNBC7Lx0PFsWwbvxuRKk5ngw@mail.gmail.com>
 <352672fc-b6e1-458e-b4f9-840a8ba07c7e@linaro.org>
 <CAGzNGRnjCydMMJS6Cqht7zT1GvhbVtKAe1hu8oaf8YwRfA=hZg@mail.gmail.com>
In-Reply-To: 
 <CAGzNGRnjCydMMJS6Cqht7zT1GvhbVtKAe1hu8oaf8YwRfA=hZg@mail.gmail.com>
From: Mithil <bavishimithil@gmail.com>
Date: Fri, 12 Apr 2024 19:46:16 +0530
Message-ID: 
 <CAGzNGR=60czJWH4=1_1Hf1yH1KZQpmDqsv_zySLr-S_D0vqosg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MKYOZMCGLTH4MN22TCQ47E5LQCV3YQJQ
X-Message-ID-Hash: MKYOZMCGLTH4MN22TCQ47E5LQCV3YQJQ
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKYOZMCGLTH4MN22TCQ47E5LQCV3YQJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,
Is the patch better now? I'd still like to learn from where i did the
mistakes (which seem very silly now)

Best Regards,
Mithil
