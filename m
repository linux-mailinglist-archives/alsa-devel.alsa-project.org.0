Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA1C87DCB8
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:04:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257CA2BAE;
	Sun, 17 Mar 2024 10:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257CA2BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666296;
	bh=T/HfBhiQE1waDWYQEd1vD78rXPyQGtudkxEwrgNEHpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RN5YFSeI0yvCuYOprLntSWt5vWrKYpLfd+0MXqRBMiJPIRcL00bvvC58KKtBZS3jM
	 QY6B7p0EwRkEo18CHwpZqsDB68/XxGozJYjPexWcN1M34TDXR15Kzc0KuscnVUM+vH
	 xW2zLmvf3lF2584J2oTNczJcoWaglr9ByUZH0/EE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F97BF80548; Sun, 17 Mar 2024 10:03:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D43F805ED;
	Sun, 17 Mar 2024 10:03:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17AA7F8028D; Fri, 15 Mar 2024 14:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D95BF80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 14:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D95BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QYDPmQe0
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41403889b6aso2435375e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Mar 2024 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508683; x=1711113483;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BAvj14vJUGomBSxrVqhPVayHAwF+lgqULbYlbgwOBiU=;
        b=QYDPmQe0JQlExk03YYemV9B9yxtgPOstXfpDImGXmnWOmGbQxJfC7HQv42C3EB+stN
         n7EMU0kiWb1DPDQZrISC5iiOid3bPD1UH83rCEmXaytJPFTYIv0jHm/B5CiIO/eQ+RtM
         aaaVHIlut1OUm+AgHqeaAAIrZo9JhvQS8YdglrrxuuPRkeE6a1AkrbE+/F1Y/A3ja8N2
         q7PoOOl3nXdf0AbXVTPHj2D2QgBSXCMDrMZBAPkRmQKIl9hLLwiI01QsbCgLcxgh2Svo
         Cv/urcU0dPFjm9BM/eie7Ma0jzawTpWkOU9xxHAzl0Z2y6h38fcVGdOoXP5z48Weg+Ac
         9JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508683; x=1711113483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAvj14vJUGomBSxrVqhPVayHAwF+lgqULbYlbgwOBiU=;
        b=PoURdPwqFEwuSamFtq/QYxTfhP0jV4UQAP13qVlU52mU1+hXhpFePsVvvGDqDDjM/I
         NJ7ijQU4tUr77CsvFJ+ubuRBqFZS714dydGuk+ZARiQQvbJpXZiilqQsGxFmA/tYiaaW
         gTIPDgO1XIQR8JuvS/PgdzF7AKLeV2nVZ2cIto0RZdvNx6HATfWllfY5/6xwEmfmIKAS
         8aqOPdhMY7+g+kFV+AuB/w0nTPM3S5N3o1LaIybFm2FC1kd0vAPw4Bbk2BGmdJqiusOY
         Od4MYxmxaw494pXUlEk+jbdMEB0rx0j75wJqLUc8n5PiOi1g7DD8+IXPwoYpDlruYd9R
         MjIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtxGWygj3Di4jq9ozwEfYXZ+kr8rldCKUmJqPwrrOEVClIyrZjKnhVIBCOLTzYUO12827jV8sSZ/OyP7E/UQHEs1ZIyjP/roq3dGk=
X-Gm-Message-State: AOJu0YxbL5u+c2Af27zovabRlFGiMV3CaU/k9GyRiNhzvQTH0of7gTik
	JnTMfstfokR7MoqwpkGi+oma5K/6TSYrRgeCQelIc7KKB5LNaILC26rOUvCm8Y4=
X-Google-Smtp-Source: 
 AGHT+IHlUY3Az6uwRCsdn4XHEMvaEDhhX0HkGvtTN9jqjiaiqubgf+xJXK+Mvnp/afaT+k0YwpLk1g==
X-Received: by 2002:a05:600c:4f94:b0:413:f1c0:8a5d with SMTP id
 n20-20020a05600c4f9400b00413f1c08a5dmr3796731wmq.26.1710508682802;
        Fri, 15 Mar 2024 06:18:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 fl22-20020a05600c0b9600b00414013adab2sm1909935wmb.6.2024.03.15.06.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 06:18:02 -0700 (PDT)
Date: Fri, 15 Mar 2024 16:17:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 06/25] ASoC: meson: g12a-toacodec: fix "Lane Select" width
Message-ID: <cc26302f-fa57-41ba-bf1c-2e7ef898b4d0@moroto.mountain>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O23TXST3Y5VJFUXZPAUDXHQZIHBP2PH4
X-Message-ID-Hash: O23TXST3Y5VJFUXZPAUDXHQZIHBP2PH4
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O23TXST3Y5VJFUXZPAUDXHQZIHBP2PH4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 15, 2024 at 02:21:42AM +0300, Jan Dakinevich wrote:
> For both G12A and SM1 the width of "Lane Select" should be 2, not 3.
> Otherwise, it overlaps with "Source".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

When you resend this, could you describe how this bug might look to a
user?  If a user hits this bug and they want to see if it has been
fixed by reading the commit messages, I don't think this description
is sufficient for that.

regards,
dan carpenter

