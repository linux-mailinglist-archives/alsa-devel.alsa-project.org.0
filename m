Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AEB7EB088
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 14:06:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1DB47F4;
	Tue, 14 Nov 2023 14:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1DB47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699967177;
	bh=Ul4Q2ajwwOk1sH+FSHSJovO7XE8qb9+NLWE0XIEFQCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eqs85Q/lh3TkHGCVXe6FVIFI51IczORF7K+6zGCORCYX3cqqN33II6qQg5PJYoCMN
	 6RyjUbK1Je26aOB0vH7yj2JvrM4oucrtt9T0DJ4MoMOTq7QXM3BXdesa347bDMS4Tc
	 9m3Y9/bnbsvWYA5yNv5I4qf1wSOzgc4zYNn0zvB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71323F80551; Tue, 14 Nov 2023 14:05:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1809F8016E;
	Tue, 14 Nov 2023 14:05:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A949F801D5; Tue, 14 Nov 2023 14:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76486F80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 14:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76486F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DiYuYvUN
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d9a518d66a1so5689447276.0
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Nov 2023 05:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699967110; x=1700571910;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3kLet+ZFc4FiXhXyJTUcUEX1JsMDtWsRFc0PYkqxJM=;
        b=DiYuYvUN62dn7Xchusg6rq0GRGwvO80bxxsQINPjDgVfjQ/bBjBhTQ9xb9Di7HiJzA
         mNfqyIpfHjY9vCadBnuhMcUtZKBFYQlNRYhXLzB6mcPyrMd8k9n//VVyfelyi/0ylkke
         Sne9WMU3zQi3T0vkiG3nJAtnYV8vEJYXhkwa0kTkfh9u0Mb+AcUjmz53QoxuKQ0uiRVM
         fYBK+EzlHQKfhPeumwkrtKIIf81EyqNT8wsRhv9ZS46zq9meKh1TPmB8G7qfipLpgN01
         clcjeXWXVTRdM7++pTH7C565H88eiw6bMt0kdXRdVZpz9/hZomyDlpD67vxOE+xv9qPA
         4XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699967110; x=1700571910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3kLet+ZFc4FiXhXyJTUcUEX1JsMDtWsRFc0PYkqxJM=;
        b=fZ3pZtADItXZu3q6TWTCPhaPqf0VRlUtAKrvIe6/eEORSvYkH2njqhWaDAWpMT3uSY
         0VZsoiN92f6XLvmuCOuGv4mlmmJQV3GrtJd7gvwDcY/nsByIjNW0SQdQ19V+vuCRA5BN
         qzxhYEqwzekj2sXg1k0oCA9IlJsFHoD6HhrLuXybeWbNfQulHVtUpiaZytO51k0SELso
         euABa3zyOuWG6fiZwdr5hc6pzBzw5o3cg0Uh9ro+vpJOyfh97R4ocykp+nEDV8oxw/FA
         8C7D944NCduhzaok7i8jEVD3xJ97BoNyfZqTVvux8tmJszxv3F3hwCMiQfkM0GbWF792
         gqVA==
X-Gm-Message-State: AOJu0YyWYzOazgBikXx4u4t4NkUF3VJMU3d8bl64FvlvJzLGju4jSjDO
	M4KrWFpQIG4gE2qe+fsedsdEGhdt06CJpwMHMELwXA==
X-Google-Smtp-Source: 
 AGHT+IHU/EMXoR/AsvwDR5tVM/hTfhag7Py4pB8zx2h4lfdu8R1hVWGA8wCYGXEvgGG4RCO6d/pEhnbc29+P4adFbGc=
X-Received: by 2002:a25:35d6:0:b0:daf:66f9:cfab with SMTP id
 c205-20020a2535d6000000b00daf66f9cfabmr8292993yba.9.1699967110411; Tue, 14
 Nov 2023 05:05:10 -0800 (PST)
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:04:59 +0100
Message-ID: 
 <CACRpkdaSPTjjPA=TS-WbOb3E=TabtP6MFEx6Q+Dar-Mh=EtknQ@mail.gmail.com>
Subject: Re: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific
 compatibles for existing SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JHXDEE5CMEPZHNLMLYYHYIK6YCAT53L6
X-Message-ID-Hash: JHXDEE5CMEPZHNLMLYYHYIK6YCAT53L6
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHXDEE5CMEPZHNLMLYYHYIK6YCAT53L6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 8, 2023 at 11:44=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This is more formally correct indeed.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
