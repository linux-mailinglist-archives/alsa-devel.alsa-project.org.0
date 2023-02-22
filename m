Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88069F06B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:37:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC4F3E92;
	Wed, 22 Feb 2023 09:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC4F3E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677055057;
	bh=xb/tDVxWKhj2uVd6k40rS8jR5dYMCSgdBjdPB4tRE4c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nFAImziUQocOBLJ+4PQPkqphRfSAHzxjDCdUUKoBFt+L78q0MD3gVTxY2HCTzYzUd
	 fCFJyd2W8dB9BAxJNETUalHqbDTSTJfaKAAhDdSZEvirE5+j6BkkBJPNUbfV4WDeM9
	 RthzGIIEKZL84vsgrULZweVxYdsePeyrvkCN15LE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74F54F8025A;
	Wed, 22 Feb 2023 09:36:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DFB3F80266; Wed, 22 Feb 2023 09:36:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4490BF800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4490BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LGFC8n2v
Received: by mail-wm1-x32e.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso5593330wmq.4
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xb/tDVxWKhj2uVd6k40rS8jR5dYMCSgdBjdPB4tRE4c=;
        b=LGFC8n2veMJ3dCqA10bxu0OUsB3VKyJkTMmM3WjdGoIh32sKTk/GLOv1C/ZFoe8zMZ
         A1EQ9XaNVfwf+uAmCCb4+asw7zqhL7TiR22+1TlFqmxynmvD9NDVw8neh/oC+I3P0TxM
         FDd8TB6WoTR4wZXIHipdlNH/VdcMwnxWs3HUi9kOJx/G6qtCe2zhsse1AKJTABVAKDA6
         66AQtCzDT8GzTouTxJaFkPKlHGchKBtu1OQOL4UDv613UH7D4gVAglfdkMzChz420tEo
         1nzwCf3jm6UoaMeQs6c0ZXu276HGYt51IkNPQL+lnhuJZ49IYXCye4+FcNLTv4OW7g3N
         229A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xb/tDVxWKhj2uVd6k40rS8jR5dYMCSgdBjdPB4tRE4c=;
        b=VGqqlhhsd8GxfNYwM8czyD64JCYXpnhk8Je7u5F1Wnn7uZdjTXPuco4ZB0smEVf0y5
         Talj+PZsWbmG1gxAxLRgzG31OsGCa2byc1aYCV5vB3sFvw0weWlsq83jlo7kQyviDUWZ
         /NeUxjFWSQErF1/yr3VzCNqvcULL9598MG7bJSFGBUXByhixoFpMDVA/hLCXA6Pms3lD
         WXo5q7yNj/J7soUgZWbMSdJR3YXxqDP3B/OMvIJVPoBqqnqmYyDaLM4hBdHCCOA8QElD
         AOShCr2e/QSqo6Cj/yusZUxRje30zl+17kMXfj7sxAWH6JyT1uq2SQ/+2EUtqApsVGeR
         y5pQ==
X-Gm-Message-State: AO0yUKX0UAhmwQ071Pbw/Pf+Us+sjulC1NXDWIyLx7WKxkTb11puFaDa
	nhKE8eAbRAsT4X6GP98t6A2R/A==
X-Google-Smtp-Source: 
 AK7set+CXwYu0dZDS5ncauHRnqWd+eXxDWdlmg3wPkw4yl5GW5yku8xX2H+ET0W1Hih0UasI6c2ISg==
X-Received: by 2002:a05:600c:4918:b0:3db:2063:425d with SMTP id
 f24-20020a05600c491800b003db2063425dmr11392100wmp.2.1677054991865;
        Wed, 22 Feb 2023 00:36:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c409200b003db06224953sm7866120wmh.41.2023.02.22.00.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:36:31 -0800 (PST)
Message-ID: <4bb6d810-8297-f91b-c757-fd34c4f9cb0d@linaro.org>
Date: Wed, 22 Feb 2023 09:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ASoC: tas571x: add tas5733 compatible
Content-Language: en-US
To: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Cernekee <cernekee@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Crt Mori <cmo@melexis.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
 <20230222083300.218523-2-kamel.bouhara@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222083300.218523-2-kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NJCIJONYYIRVPFK5574DGW3H3IDQJUYA
X-Message-ID-Hash: NJCIJONYYIRVPFK5574DGW3H3IDQJUYA
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJCIJONYYIRVPFK5574DGW3H3IDQJUYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/02/2023 09:32, Kamel Bouhara wrote:
> This adds the tas5733 to the TAS571X binding.

Do not use "This ". Use imperative.
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

