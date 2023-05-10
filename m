Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673A6FD8A1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4631054;
	Wed, 10 May 2023 09:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4631054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683705205;
	bh=d0tEvUucT1r82HeWio6bSalN4j42XTU/KbTiHlfES8g=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQlLmfebSzPpTUTRjEzR+lTfI1dRdnhVd+NGcnZCA+XTGSqIZ4XOMwoyJfQG0pHZ+
	 ouMj7eFCrJTOXc+EqC9CfIIzJr4Iz363fBOtsZvgNHuIohYVuCptMiEHc/jURW5W2k
	 3NXRhUOhMGkPZn2mPGRzJTW8aHH500wM1BrOqu88=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9BB6F8052E;
	Wed, 10 May 2023 09:52:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CA20F8053B; Wed, 10 May 2023 09:52:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 364CCF804B1
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364CCF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Q4XRlsa/
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-959a3e2dd27so1214140366b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705146; x=1686297146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buV1oS+q5zSYMCb+Vk5Sei3x9AdpdZjHmxNoX6GDBRE=;
        b=Q4XRlsa/ttO62lIK4GlvTimIidf2aZ8yWta4S1EEsfZMxipw4+4vFyoxAMvBO3WFtg
         SLnrwwacDR91Ltcs6KRK2lB9oz5WNqvkCQ2r6BV2RpFVUuC+bxpxblT5dd1LJ0HuGM1c
         TZyR+ILO+ItOWB7mfM/2AI9FVgrklZOFMsO7BVyxebCvru0hF4K69Fsh3eWXZrE/vsZD
         y0IxnpRhuCHlpspg1zMQXxJhTmu+Qy7RveEvP23D77fHuQv/9vJA/T3WaPr1ZxkGLMQv
         sSPrTIdo2yJeKQnWlS76VfEDyHdcHtENmMxvaKlxhk5Kz2kkyib3R7XGcdbfKOvEZUDW
         6NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705146; x=1686297146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buV1oS+q5zSYMCb+Vk5Sei3x9AdpdZjHmxNoX6GDBRE=;
        b=adHn55RaEQOvvmz954Q+FJQcy8E4Qghd6rJxc/g5mXODZ0tKxvgUXGbuXa2ldGS4V4
         zn/ZnrAXa4IIRPTyD39/Nd0ezTb1sAVvhavxBndNuv+F/RcGuD2uGPCE7yn2GkUVnUqN
         XXPcZopptJOYU/Vr8saz5kvAFdNsivZ5ApiChk55t/PybdT/8zA+ua+WAJcrRjn5DxVe
         wT/wddSmBqTIo6XxfMdOa3y4AGlnGXKr9UfXmBPrvHNMeecOukLXVkyLrqMOJ+LytWsf
         faWyhZhNcfotq+/mdj7xBKDLsBty8rbmMDj/G7ZRJWHLTkrsHUyXNs95jRQ5+pEgipWv
         a6mQ==
X-Gm-Message-State: AC+VfDw3x9rT9Lubj57XRYHte5XJ/GqEcj0nhexqdodaA1Z9mrqhF4e4
	R+2w0lto86CXP6ISBa1BGrZUfg==
X-Google-Smtp-Source: 
 ACHHUZ4PkilMztZzdtCbud0lGz7T8NDnLixfG28NHHOUaUz/5BDZAb+4ZEG6FXuOIsei4a4hftLJhQ==
X-Received: by 2002:a17:906:fe07:b0:953:8249:1834 with SMTP id
 wy7-20020a170906fe0700b0095382491834mr13901254ejb.16.1683705145939;
        Wed, 10 May 2023 00:52:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 v20-20020a170906b01400b0096165b2703asm2338115ejy.110.2023.05.10.00.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:52:24 -0700 (PDT)
Message-ID: <a575e8df-4882-79bc-ea1b-005961afb77f@linaro.org>
Date: Wed, 10 May 2023 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 8/9] ASoC: dt-bindings: mediatek,mt8188-afe: correct
 clock name
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
 <20230510035526.18137-9-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510035526.18137-9-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AM7UMFGVAC6IKAY5LX4UFFC5FRUO3P2S
X-Message-ID-Hash: AM7UMFGVAC6IKAY5LX4UFFC5FRUO3P2S
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AM7UMFGVAC6IKAY5LX4UFFC5FRUO3P2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 05:55, Trevor Wu wrote:
> The original clock names are different from the list in driver code.
> Correct the mismatched binding names in the patch.
> 
> Because no mt8188 upstream dts exists, it doesn't affect the existing
> dts file.
> 
> Fixes: 692d25b67e10 ("ASoC: dt-bindings: mediatek,mt8188-afe: add audio afe document")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml   | 36 +++++++++----------


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

