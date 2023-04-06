Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37776D9EEE
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89AA4F4B;
	Thu,  6 Apr 2023 19:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89AA4F4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680802591;
	bh=TGTjkrmHc0ObqoZpEyLFKN1CsXxm3lRKC9qUDy3hHPE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r6s57+vtXCYoBpGPXQTMVk4c9/6S7/plzSkKktLQipK56E+KAu3phtgWLUijY6Sr1
	 dE2pUzoyUmkpliI47uf8BRSkKm10Y2OnidfIMTNm4a3/9IRqiMLgKZ8lx9u1L0GVjG
	 /wWr28FpkUrhVLAcnMXJ5zBPosV456SKoQnabl24=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF9E8F80171;
	Thu,  6 Apr 2023 19:35:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F274F80246; Thu,  6 Apr 2023 19:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05B1AF8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05B1AF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nRVv+3uC
Received: by mail-ej1-x62d.google.com with SMTP id by26so3200199ejb.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 10:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680802528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1btbIk9lIX208iJ98SIci39LtLuOBmrAbL3puHRRMg=;
        b=nRVv+3uCVe7Yi4r8ib0kl89/LT0qVMLHiib3jYpxycoVP9nnfEHFfrTJGJCNK560Cn
         22/300/e5PyAXimORlhvO7afrJrt3Vtd5KMfa4jhKxHg3LlGNf9bRT6pS6+HJeo+CYru
         fgqlqimGbij20LDhSXgmq+Vn/Ur7+DyyeFUlwtbKaG1pSfr2r16+nflof+jFIuTUWA0Z
         raqomzDgY9GviR9YAdIud1pW+8VMV+WmxhdkvJmTktmEUYwkvJUgdH3WOLuma5jLrg8m
         vlsPjiNH0E7DnaZEiFmNbJH84ODtQ5i2bFCionQVLDR7yCqgcRbZpnhSTbo/HggquP4v
         2J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680802528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1btbIk9lIX208iJ98SIci39LtLuOBmrAbL3puHRRMg=;
        b=qq/XyZlWLGBHmKvNJ0XorhVd3gR8dAUwyIVDHU28Fn86YanPcwx4PyWoGaOFXIntT8
         iAOVa0Kz2G+c6ZhwwrvXTM/ltF4mv7K30RsApDINiTstbJGj09IgHrP8ok/vfWDAmvLE
         bTWXnnh0QVEqr68VtPGDBU8ED7S07xI1+vlmm3IxsDz6vStecWdk4O1YrtqMkJcJ6aWa
         JMaJ9ddgkv6APNW7rLnsBiBaZNWB7t/hHTuohBu47N2F0rpFwpKYzmjHUclHSoPBT5un
         7PQLtM/MYd1hiug87Ndxp8bNXewzrVuGGAREepPDVbWXVExUX7JfdxZuPubb+lgl8QjL
         HUUg==
X-Gm-Message-State: AAQBX9ewWwGV6f1alFDFaqHsyG4E5LJeT52ivKCInZWPmWAWeE3zMPEN
	AFgGjSXG4x73fbDJ2WiYuPNzsQ==
X-Google-Smtp-Source: 
 AKy350ZISRw2PrH33AOh/gVZh/kG+wFLuCObpeAeTUOtA+Xr8RBQXSsU4+2jeXAfSzXrH8UC1E/YIw==
X-Received: by 2002:a17:906:1119:b0:8ee:babc:d40b with SMTP id
 h25-20020a170906111900b008eebabcd40bmr7625029eja.58.1680802528737;
        Thu, 06 Apr 2023 10:35:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed?
 ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id
 gz19-20020a170907a05300b0093debb9990esm1055939ejc.212.2023.04.06.10.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:35:28 -0700 (PDT)
Message-ID: <24c505df-9145-a515-4b68-aa5806916430@linaro.org>
Date: Thu, 6 Apr 2023 19:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8711: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230405205820.6836-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230405205820.6836-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V6GRSV5EPK3TN2LESIF32KZSA7FWHSIV
X-Message-ID-Hash: V6GRSV5EPK3TN2LESIF32KZSA7FWHSIV
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6GRSV5EPK3TN2LESIF32KZSA7FWHSIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/04/2023 22:58, Saalim Quadri wrote:
> Convert the WM8711 audio CODEC bindings to DT schema
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

