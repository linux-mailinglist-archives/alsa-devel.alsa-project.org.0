Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC476C7A4C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 09:51:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0247BEC2;
	Fri, 24 Mar 2023 09:50:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0247BEC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679647867;
	bh=p2oAod3vh6L85GNzebDYS42fCnPKLhEZ85v2wqu+kT4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bKtDhmIMM10RN323VJDfnO3bwWp+ic+Dq6cl9BLJFQaUrYUMXZoZljUQl3VKMDajC
	 sFqBZoFgRuLoUHbNs9RK1LBJa7bjpEyUCtfyo7F5pCdaSOuUuSnAmZ19qg2/e37xaO
	 iLgbAfv1OY9iHlKLcxQOApKT/psk4P225zTFyFUM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA3EF804FE;
	Fri, 24 Mar 2023 09:49:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3507EF802E8; Fri, 24 Mar 2023 09:45:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83519F8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 09:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83519F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g4xcmZD7
Received: by mail-ed1-x530.google.com with SMTP id ew6so4882582edb.7
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679647544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fk/3/3DIvawnE3jueJhVp1irCLDgjRQLsPqOm9m9zFY=;
        b=g4xcmZD7cpX7ajUFVMrQHVHkK8dDi+aGBHhtoLKtZWoe2Bo2NBaDV8svN46KDdtFqq
         +Vx5JvyTH/G7Zfxsnz2ZLCjX+WEkhoMtgsNcoH9LDuAQ4F+tcYUbc0Uzzxe2/SRnpNzl
         bOpPqvHfX4Tzotpit4fE60KGY9B1pzzDIsqU1HVY6wqyNokqQPfmi967DXKZY4SxshIO
         ES7rb5WKf6GM0SaImWd1Y7G3qahPP6FYm/T5xGKQACGyrPCQt8+Npqzg1wUWx8xXJz5G
         Nqww2/sZUAl/bFOAgVAS91puakAbPXmMsznq3XjLEwsuXaeVOgw2wqDge159auJe+QZP
         EBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fk/3/3DIvawnE3jueJhVp1irCLDgjRQLsPqOm9m9zFY=;
        b=y2CAzhpqBmwnZo0oUYqyFsvtTnHXthRQuv326aNfCYK8+SczzbHiLhG/0K+n1kHa0j
         sou8HCQqOGRL/Bn++aSpXF4YEqLEBQAuMeA4Hm8aai+icDFqN/kuOjOmcl72LVt5i0Vz
         kcRhId9rD0/pn+Hf2TctWiYTTv2fN8RFdAOmbC6SK/0u1oukHdgRAJoE6DjFk7mK4c+o
         rHFA1F57XRKkLzArAurke/T3ruHmqx/kw8hGVmkTI7kzyn3WHYel75NSUZvGerfpwKTO
         uooKPlzRnUC4nj9ebh/5CLFN5ro7UN7natp1kwPskjSdtlXCbF5I45Fsr01MiShsH9eI
         uXKw==
X-Gm-Message-State: AAQBX9ewPssJI1oOvnHeNM87C2r4eZqZRflPbJCp6a+I7n1tllkBs4w+
	83xSOvZ36ZjxsfhNQhzcFQzPcA==
X-Google-Smtp-Source: 
 AKy350Y+gYHEv6PuyzvwQhIPQS9VvWOc5+813JMaAAyJdMB3rFzWm0z8LvCylzql59aJ/Urejp0XGg==
X-Received: by 2002:a17:906:38b:b0:8af:4120:63a8 with SMTP id
 b11-20020a170906038b00b008af412063a8mr1889312eja.68.1679647544644;
        Fri, 24 Mar 2023 01:45:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373?
 ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id
 lk8-20020a170906cb0800b009311c9d33d7sm9788826ejb.184.2023.03.24.01.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:45:44 -0700 (PDT)
Message-ID: <4888cf8b-e9b8-ddf2-1a0c-b2b4d6fd70a8@linaro.org>
Date: Fri, 24 Mar 2023 09:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: alc5632: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, broonie@kernel.org
References: <4a553ab8-4cd3-4ce4-8225-20f43b70a5be@sirena.org.uk>
 <20230323193709.5176-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323193709.5176-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VVHJJV6HNGWUMAUHV534VGU3CASY7A47
X-Message-ID-Hash: VVHJJV6HNGWUMAUHV534VGU3CASY7A47
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVHJJV6HNGWUMAUHV534VGU3CASY7A47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/03/2023 20:37, Saalim Quadri wrote:
> Convert the ALC5632 audio codec bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
>  .../devicetree/bindings/sound/alc5632.txt     | 43 -------------
>  .../bindings/sound/realtek,alc5632.yaml       | 64 +++++++++++++++++++
>  2 files changed, 64 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/alc5632.txt

Also, do not attach your new patches to some other threads. Each
patchset version is new submission and new thread.

Best regards,
Krzysztof

