Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58C90ADE9
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 14:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01D3843;
	Mon, 17 Jun 2024 14:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01D3843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718627221;
	bh=0yH54hdRmJm1LYRknv1AkPHR6e6a/3XtHrSym3izFec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uw/cBVO7bnQ7sDqB66hxKZxR3zYNWfxTCxtGLDu1ynZvGby0P+xjLtbjt3uGuekK3
	 HMGX9T3K9IYeMhoSy03cz/YIiOG0mCIBzPQ8CF21UpPkHaFJmJXSZbQiWk8eKgC4ct
	 re2jBxuSGAIG3SAA0k/G+m6V3cAPxzt9aq7AG+JU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40AF6F805AE; Mon, 17 Jun 2024 14:26:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FEA8F8016E;
	Mon, 17 Jun 2024 14:26:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 674D5F8023A; Mon, 17 Jun 2024 14:26:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A908AF8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 14:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A908AF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y6Z+EjJs
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6269885572so916831166b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718627168; x=1719231968;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D1W3TjI82LPT0GMJMb8ibh1Cs/OuD6DN8HxB363KGxc=;
        b=y6Z+EjJsFPW5yDyb9WBPEtfN6fez4zNbxK4JjSxCfV33A1LzV2OCmOfyDyPu4jxGWm
         XNNAo9HwZcPfXX/3Yfw83DvV+c8jwj8iDYAJFFAtUs6b4EXY2dMq9CqWkWEEJ0JihRWY
         hvylDBlMB1vfEh2jczah42MbCPdej6N5/PZSxV8fR/nZ/J5sZMa/XcBzq619mYwJCmmS
         rCn+JAOrxesgiPWObde9VIamTzFf2rpbbkbesi15H+zI5zlJs5ZWv791tIUkm4iHG+jF
         cwhjNmRFXBAqQIxZJMwL32THQg9pUJSJIsdXnYiacAFhocSr7KR4M4DtV6E+OQBJIcN1
         RbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718627168; x=1719231968;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1W3TjI82LPT0GMJMb8ibh1Cs/OuD6DN8HxB363KGxc=;
        b=ErJBnWH9HG4aXCFX5tj5oWLHBvMBCWeWt2sWfgFnmAOLgty6u6cOyFSR0/ir6VO3y9
         OD/7xeNXx1NzUr5NAbLPTyY7Ojgz0U1WxqBY2HcvHHv6d+v4x9P6sEvA1RUF4fcDxZHg
         iaaQRUqrQpySPEv3yJPfrGLtKsDj3JU1OeeSADFy8XhsIssxytjq5hgkHcKPV5340iBU
         8KlB8qzm0WMg9iVNQzE3mQMp48W8/95nX5fAhLNaccz/fVloyEenTDMiFiPOHuI1bMcK
         KS1OGS84XCzLRSHYsgKwRxRZnqccdwALS8vv5FzsIQFiathSo3aCp9lGuYdJ3EmkKCnO
         HAQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAR2nTZ8KUKOiflwPimChNo1niiZhm6WXl4kQSD1g+pqtMgxW0MnopQD2R0GcI6ZGhgRLecCPtXNLd1/uDwq/BM1sDtZYxj7KhqUw=
X-Gm-Message-State: AOJu0YxUXOTmkfhVYmlvUEQqFaGG2wLF2emOzzwd21TwptJlOuJG/SZV
	7WcbOnocqibWjPd1PcYwiPkQfmb4mo8+Sbn92BwlfUrpef5EsUSQh5tEntdLcNg=
X-Google-Smtp-Source: 
 AGHT+IGfNYZp4goCNHzgFZHaZHzhHrawdVbekNhioTdJBl+uUoNamZcee565J1kZhGwnpwUKwgH3Ng==
X-Received: by 2002:a17:906:414e:b0:a6f:92d2:24b2 with SMTP id
 a640c23a62f3a-a6f92d22574mr643266b.25.1718627168158;
        Mon, 17 Jun 2024 05:26:08 -0700 (PDT)
Received: from [192.168.0.18] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da336fsm505971466b.41.2024.06.17.05.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:26:07 -0700 (PDT)
Message-ID: <a2d25f72-84bb-4ef6-8254-1df8da0bf808@linaro.org>
Date: Mon, 17 Jun 2024 14:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: Constify DAI ops auto_selectable_formats
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
 <20240617092152.244981-2-krzysztof.kozlowski@linaro.org>
 <20240617132436.640e5310@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240617132436.640e5310@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: J7JPDKDESYJ653U72G3AR4G6LNXGOOV3
X-Message-ID-Hash: J7JPDKDESYJ653U72G3AR4G6LNXGOOV3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7JPDKDESYJ653U72G3AR4G6LNXGOOV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/06/2024 13:24, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Mon, 17 Jun 2024 11:21:52 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> The static arrays passed as 'auto_selectable_formats' are not modified
>> by the drivers nor by the core code, so make it const for code safety.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  sound/soc/codecs/ak4613.c          | 2 +-
>>  sound/soc/codecs/da7213.c          | 2 +-
>>  sound/soc/codecs/hdmi-codec.c      | 2 +-
>>  sound/soc/codecs/idt821034.c       | 2 +-
>>  sound/soc/codecs/pcm3168a.c        | 2 +-
>>  sound/soc/codecs/peb2466.c         | 2 +-
>>  sound/soc/generic/test-component.c | 2 +-
>>  sound/soc/sh/fsi.c                 | 2 +-
>>  sound/soc/sh/rcar/core.c           | 2 +-
>>  sound/soc/soc-utils.c              | 2 +-
>>  10 files changed, 10 insertions(+), 10 deletions(-)
>>
> 
> I think you miss sound/soc/codecs/framer-codec.c

Yes, indeed, thanks!

Best regards,
Krzysztof

