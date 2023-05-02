Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC066F3DD5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 08:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 021D218E2;
	Tue,  2 May 2023 08:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 021D218E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683010397;
	bh=jKO5lM8M2ovUCOYQbv/8SfyIREIRG2n1vtxnME7JqNY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cSeISogFTAn/yA2V2AAtyoR8z2IzNuLVsEO7hTV2vwnfEFp2PmRPHOQ+FRqkd/EeF
	 mBDnN2aKGEV5WjZsyG/PBrOQVHREpkwRWfOV4ce4Z7H/VwZUHxMpSdEjXK9jzGXN9R
	 P6fCzQXLRn3NtlbfNJLO0+XsacDk5lo0NrSwCWkU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 148B5F8032B;
	Tue,  2 May 2023 08:52:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5980AF8049E; Tue,  2 May 2023 08:51:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5621F800EC
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 08:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5621F800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VQq0UrFG
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94f6c285d92so670540466b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 23:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683010279; x=1685602279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNACeQEQO+S+0unH0ZOUetbTC5AHvRt/8ok1HoKeNHM=;
        b=VQq0UrFGyA6TUuzG3T0Om+Zk+UNDZhYIt2EZ6ux/ZGlJlos5dnHnlAeerT9LfsY9kz
         l30pn8vTOP39LeTOThYQ0bXv8fiqHoVRp5ZXmQiZYcZ9rnuwK0z0r/6OUMYgVNv5cS4x
         vAH6Rnhdrp4AcC99Clq1ZULUqj4Bd5NTt04ExHsga5TcP3BVhUqt+gtFzqQjzBxHBPN0
         WEU9y5ih6KxRsTrKW1TxEr3L3UI6t4yui9e0r+WG2A2vGM1HroOHmg1cEp07z5I6VeXe
         MfwYfiSrUtBSVDtN5Wzs0NvTUAsDTqJgMfwwWKNfxruxigxPTJ7BGHmwYE81WXgYecsg
         xtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683010279; x=1685602279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNACeQEQO+S+0unH0ZOUetbTC5AHvRt/8ok1HoKeNHM=;
        b=Bb13QPKhKXy2FE50IcjhGrbhdpjWX72PwIQkK75PgtBe8jz8ebctqL9jdhxu/vij2l
         IcHGy6A0jpAxe9S1WFeLNZ02soCg67PyD3+Gu44SNIR9HK12BhtzOX4NbbBnrIuoJmeI
         q30RkewK5epAHqx5kB0/FO10jB++IVpwW9+G82z3NEsaIAMEIR5J4SfmyEmNHMA0kI/X
         zHlT+TfpMgz3WB/J7UaDvR74CP+VQJXcnmvjFQAjzGxrizt1RENs4W8SsYot8x0o033L
         8Bs4oVfOZPFLfP9R2q/NDDyGJx/PilqGT0mOvSwQt6NknXjADGsfIjU0OhWFrI6Q5Sx8
         e3mQ==
X-Gm-Message-State: AC+VfDyJ0i6EBmzrXv7j0l89uFTcNiqdR0iYZWDWfJOgCzYd5bCmryK8
	NfQVzBPPMMr9UkLayvdyB9PmDw==
X-Google-Smtp-Source: 
 ACHHUZ7HNkUdR+ngJiafRGxX5FKoJp6dfOBHcB7emIfrQ/GGGqv8cWeAezrQE1tWkKj2lIdwzneCuw==
X-Received: by 2002:a17:907:1b08:b0:961:be96:b0e6 with SMTP id
 mp8-20020a1709071b0800b00961be96b0e6mr2829866ejc.68.1683010279138;
        Mon, 01 May 2023 23:51:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a?
 ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id
 f6-20020a17090624c600b0095707b7dd04sm14651202ejb.42.2023.05.01.23.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 23:51:18 -0700 (PDT)
Message-ID: <b7085d83-cee1-4f93-c698-74c52bb16222@linaro.org>
Date: Tue, 2 May 2023 08:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, devicetree@vger.kernel.org
References: <20230502053135.27019-1-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230502053135.27019-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L3IQPVGKZICY244MRIIZAJ6LWIEQOKG5
X-Message-ID-Hash: L3IQPVGKZICY244MRIIZAJ6LWIEQOKG5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org,
 lgirdwood@gmail.com, kevin-lu@ti.com, shenghao-ding@ti.com,
 alsa-devel@alsa-project.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com,
 gentuser@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L3IQPVGKZICY244MRIIZAJ6LWIEQOKG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/05/2023 07:31, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v1:
>  - Submit together with tas2781 codec driver code

I did not get anything else, only this patch.

>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml

You named it v1, so this changelog or naming seems incorrect. There was
v5 or v6, right? What changed here? There were several comments to your
patches. Since nothing changed, I assume you need to implement them again.

Please implement all the comments Rob asked. Then write a changelog
describing what you changed.



Best regards,
Krzysztof

