Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F4E8A9F35
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4886F20C3;
	Thu, 18 Apr 2024 17:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4886F20C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455738;
	bh=VpE1Qnwojfh1X5BHVf4R6O3zFOF2Mqea75mnDO8ikEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E9Gv39y715N/kp1bQLiRvp2/f7d0G13BwuURDDJZa1eMEoJzbTABOVpMv60tGQfy9
	 sB7rFFmLSwrLeJkwSTYPbrGazPNOaZrbPbVBTlHNRudrblkF9smXHI9F6DB23js94K
	 XJzwtc2qQ+4PuqSoLopDWzr5HhUYAM/lxlYYpmak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9442FF805ED; Thu, 18 Apr 2024 17:49:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E1EF8025A;
	Thu, 18 Apr 2024 17:49:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14025F8025A; Mon, 15 Apr 2024 15:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDDE0F801C0
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 15:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDDE0F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kXZM5QBr
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so38025981fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 15 Apr 2024 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713186611; x=1713791411;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4YmX6u/Der+0IzS/XTdYy6+ZCel0Tz8ZK2bZueMcf0Y=;
        b=kXZM5QBrON6diCyXse3Ah6ZsGdOy/ebBBoWFuwSu6ODTNgcz1h8lB/xbYsXDLKl9kd
         I/0F0oQhNdZYcpel1/mzEZAqvalMlel86A6er4KyODFJlFNZlVOvbnpoe1q7MzkNQRxa
         iQNSUuaV0H0adqsjTC3WG+D3EGb2HlKDOkxcgHdF4ofZKV1JJpYUuQ3Uj9qjWsbdmplL
         NRQ2NVYG0ji+p3H1+izgGyqpmmHqTAZhnI+lwLdOxvyUUZTOl1CUSDhHryv3NVBTKHrA
         dbsaom3zhXYo6prit/GZctzRLgU9Whm+eJlnaw1ZbwpEaWh67lB6I0xp8MiOUohSnq5y
         rMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713186611; x=1713791411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YmX6u/Der+0IzS/XTdYy6+ZCel0Tz8ZK2bZueMcf0Y=;
        b=WI/1V5iv0Hz1mIFFFoaYBafhm6a45IWGFci6Bw0fq/FfebN5p9BEeuGYDjnibATizw
         c+TEUK0+CZMZoqchnX/T2n9rZM4oaOSmghJ5yvqERiY9Ur/LkLdAb1eeIvf3UyRSKZZ+
         SSSl3Iw0Ne63IJB06LSoP2XpE+eESaEyjIWiQFSQc0XZQEpQiWQ2hoIqzFrkm49GDRKM
         +FnY1awzAUOpFGI4rbnt00PTaWneg09BRLP674M5M14uOXP4AFjVearJpGsrkIxxHTOP
         6wNjIY8MzDlT5Q+CHLx6ci58sk+ABHQWPesqtcEMqJ9JyyxfHOCNBndZt6HnQtrr575x
         sXMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI2GzSumyggHhzToZj/kDZbzaDa793bxCmXrgI6GgknxSOSI18ymh4mElxtGm2+Xu0hLZKQlaJP3l8G2Z4mLUNNN8PXAlYFmWXhDQ=
X-Gm-Message-State: AOJu0YxksXW2I87folEVXXs6TUdAiTYwbLnVDIhq5DqxpZcSLOdYnScf
	L8V+R7VGySxN4iDQoRlvtvL4lXhhdje65wpeySqtkds242Gdi037JcT8waBHdvy+3q/p8SnHZUh
	ct7PwQRLqMRPFvRWdsto5asc+R2k=
X-Google-Smtp-Source: 
 AGHT+IGjIewtaI/sCKBqHEj0RrILEoev+3bQJiesZn9r6UVM/5fQn7CYy4r2gYKHReg36HLwcCY0Lx9k7BkYodlJaOk=
X-Received: by 2002:a2e:9984:0:b0:2d7:17e0:ff56 with SMTP id
 w4-20020a2e9984000000b002d717e0ff56mr7325159lji.18.1713186610759; Mon, 15 Apr
 2024 06:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240415103523.139-1-bavishimithil@gmail.com>
 <171318046103.2331667.2375787628199943181.robh@kernel.org>
In-Reply-To: <171318046103.2331667.2375787628199943181.robh@kernel.org>
From: Mithil <bavishimithil@gmail.com>
Date: Mon, 15 Apr 2024 18:39:58 +0530
Message-ID: 
 <CAGzNGRk1S3G1jWZMarRP6YaFOTVciqkUT8ipDvu96pmTvoDBLA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: omap-mcpdm: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FWMFRW56WPSHETJAD6UZ5MRDVQVAB3JP
X-Message-ID-Hash: FWMFRW56WPSHETJAD6UZ5MRDVQVAB3JP
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWMFRW56WPSHETJAD6UZ5MRDVQVAB3JP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
>          $id: http://devicetree.org/schemas/sound/ti,omap-mcpdm.yaml
>         file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml
>
Right forgot to rename it to omap4 in the id, should i send a patch v4
in a new mail?

Best Regards,
Mithil
