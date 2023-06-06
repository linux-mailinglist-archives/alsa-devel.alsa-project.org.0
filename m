Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA6724228
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 14:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0AA82B;
	Tue,  6 Jun 2023 14:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0AA82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686054696;
	bh=Zo7SJ45EcNlLvazoSRUaZFuv3OFZNtt0OgdOhX+GQ9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NWM38QSaytfx3ax7LoyCv+L9PvxbBtMZFnPj9kBEubQvmgVSSWoGt4L3Jb0GpxSKR
	 WdCN1AeYdYG+2yC1/lYp5gEwkeqBduPmq85tJrIWV9Xs2neaGSPbBa9qTVFIZ4oQOi
	 ta4ugObhtO39PdvK1P6gnXv8FiW64zkydJSpIVHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D84F8016C; Tue,  6 Jun 2023 14:29:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B3CFF8016C;
	Tue,  6 Jun 2023 14:29:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABF8CF80199; Tue,  6 Jun 2023 14:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 892C0F800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 14:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 892C0F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IpNPSsZF
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so295207266b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jun 2023 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686054588; x=1688646588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWikzPZh1zj0Jzec8+iwxQzR4oRLa0VpL+JvaJGvhls=;
        b=IpNPSsZFEKJSvceLXdy306ddTKK0i9CHCuV0Ga9Z1pUmOuR1HClSLLk1gSLTRch0BA
         HB0toQBkGC8tYf5tr22ugA6iyZ8dC5ZUJby7XM92Pkj3Hx/jUqnWHapLmcQg7AEcJhx8
         ydELIzuXQqmqaOM3ZsSfF6t5ATY2uY8CKoYpTprBRZjHXdOIa/HLPPZtIgmsVxqA3meL
         ElohgLKkIsH77MWCI0VhbvwzY6lWIXWmYiuidArTQBwnvcN4S5euF6x14PtR9RB0YqSN
         ywKsWdqikwPUSYLGdUleMp7OZ5WuFTY3O6UnKWgJoczuD3q+BhSxWmNCdGQrnGAZVja2
         QuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054588; x=1688646588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWikzPZh1zj0Jzec8+iwxQzR4oRLa0VpL+JvaJGvhls=;
        b=Vd4DlgXBYYivFi0k2DC2jVQrzIeBW47FL0XR5n2uvYOIAxpSGUVbGaegZvxorzhL0B
         SVJVvabVJ4pt7/ICnEBRxONr4zfB71AkcYtIELMM2se6yxdgJQqZ6OzNrS9ZX7NRrXhk
         azmxktorGKKAAzmgtPeMKY0Z9ofDnPvulv7IzIKoLsndNy6rQ5REUKhrqi0AkearvKqk
         XDJPSyztssp1yzShHh/dHPIPoZkgXRWDOPMeNJwWNW5DZKuiPkahxE5VafBDSd2+sPNs
         OtpZE5dF5dPINyClkmg5SG7TjxTtvm66QfSLGShKuekxrFh3h5rRpiY04ibFkFN6+Raf
         rfYw==
X-Gm-Message-State: AC+VfDzsq6/2oa1Q2bEF+Q2k3w30RbmIpUi7DE84fW5/ZPzd+OqCWCz4
	9hA0CeWErtaZZ73O5AqehvFJ7w==
X-Google-Smtp-Source: 
 ACHHUZ5zOg8bkEZM/LhbfO1EfpnR310YUUK4irlHnUHd29W7mmxUx2p7kOjYjbn0vsniaRz/2W3tQw==
X-Received: by 2002:a17:907:9688:b0:96f:2b3f:61 with SMTP id
 hd8-20020a170907968800b0096f2b3f0061mr2668594ejc.7.1686054587815;
        Tue, 06 Jun 2023 05:29:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 h27-20020a1709062ddb00b00965cfc209d5sm5499841eji.8.2023.06.06.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 05:29:47 -0700 (PDT)
Message-ID: <ef6bc190-ca7e-485e-ae45-e03fddfd3f0c@linaro.org>
Date: Tue, 6 Jun 2023 14:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: document audio of graph port
 for cs42l51
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230606115605.1633595-1-olivier.moysan@foss.st.com>
 <20230606115605.1633595-3-olivier.moysan@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606115605.1633595-3-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DPWIYCUH77T47RRFQYOUHYS4SXOT3DXB
X-Message-ID-Hash: DPWIYCUH77T47RRFQYOUHYS4SXOT3DXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPWIYCUH77T47RRFQYOUHYS4SXOT3DXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/06/2023 13:56, Olivier Moysan wrote:
> When linking the CS42L51 to another DAI component, according
> to audio graph cards bindings, an OF graph port property is expected
> in the node. Document the port property.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

