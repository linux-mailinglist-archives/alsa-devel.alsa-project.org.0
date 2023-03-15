Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330146BBBA8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 19:06:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C321112D7;
	Wed, 15 Mar 2023 19:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C321112D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678903563;
	bh=E/DrEtagZyubG0GW8f8e+FbSp5ZRsII6bZr+2KW/IQg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fjh45UNXzagbkvPpivHcRpzB78CN8ZFGHldxPR8P5A20tzSjl03SQwz07mXQCxwIN
	 IO35kbgEIaa2u9jATtzp1bAU0lTAhWB3ySzgg7HCSm/hDkFsO6UzcLljTGvv1HJFlk
	 +LB91L97+kGj8tXRdKGhSvF4JLQ3mvQH5Mrj+BEw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED27DF8032D;
	Wed, 15 Mar 2023 19:05:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0492BF80423; Wed, 15 Mar 2023 19:05:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EDE7F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 19:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EDE7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AAZPSGzH
Received: by mail-ed1-x52a.google.com with SMTP id r11so27216450edd.5
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 11:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678903502;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/DrEtagZyubG0GW8f8e+FbSp5ZRsII6bZr+2KW/IQg=;
        b=AAZPSGzHgpvb2mKQ1EoGLFO95CSAAbfquebCvYCd688R8f4AoOP6aHBj7qNlyQLwLU
         x21AI2rII0od88aoRBE/quUEdiFHSjnTbtdYb+Z92zR6p5p9plnkw08qtrnknbBluhP4
         4gIIcnWxK42Y9XYGYSOHDf4598wXLeQzPPRRB5S3kaWGiwjwFsdY1AxAniePMCKyp0DO
         F5VmG9mXfjdaGnUjOqvBvF2UivghqBxi6cThWaEuIy2VKokEL8yzaCtuBdHF1fpoqZWZ
         jALpAXWVarRUWdu8X2nkXYorfAFBWPm+oApijZJqHNE1WiN/pfy0LpOcrMiZBEeq1AhF
         5+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678903502;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/DrEtagZyubG0GW8f8e+FbSp5ZRsII6bZr+2KW/IQg=;
        b=EOjKiQzsKv6hNmtws1XOzqKrCYHhmGExw/35x7xOJTcYJ4wc56CwjJkEO6i8Fx2V2a
         yuAcC6v/Sgf954HEIOK/ogYXLj5khp44QqFJLAEe93tV+5Nzp/IEGVXN+ZuBIqgCpMWg
         D5FH9uBj2r09JPhBqgqaaUxqkbRvmr7WxfC/7ycL1r5mcReSVQQ9mf6+ibcv/LvANhgk
         A42ETp3Fggi3VKopAqmFK4sCNIv8Kee2EdfD6sD4VPrroMR/47W5xPVOOzr1ld9k9U0U
         6SJvvz4TeHBjCX/e9b8TQmrmc9mTET5le+B7g+fTBJVIW/PWueYt7KC9izfDCVA+669t
         kgWg==
X-Gm-Message-State: AO0yUKVYh4V7MK1jL/qdsZi9EWgNkdV7lmZqqjyk4oLC5oxt8rNTpFaH
	o4pMzrgcclZIUPyHkpT+0YksOQ==
X-Google-Smtp-Source: 
 AK7set/EWeiL4CgaEmnMtfP0zRZdsE9IOHcGPR3AKFbB+w0h9JcDvRCUagIkM7fkBOaR4uCpAh3x9Q==
X-Received: by 2002:a17:906:4e14:b0:8b1:779c:a8b1 with SMTP id
 z20-20020a1709064e1400b008b1779ca8b1mr7049606eju.5.1678903502469;
        Wed, 15 Mar 2023 11:05:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id
 c17-20020a170906d19100b008e57b5e0ce9sm2823703ejz.108.2023.03.15.11.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 11:05:02 -0700 (PDT)
Message-ID: <fd6c0fe4-3d53-95fe-0aa0-c56cc2e3daf0@linaro.org>
Date: Wed, 15 Mar 2023 19:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: dt-bindings: maxim,max9759: Convert to DT schema.
Content-Language: en-US
To: Otabek Nazrullaev <otabeknazrullaev1998@gmail.com>
References: <20230315173404.7215-1-otabeknazrullaev1998@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315173404.7215-1-otabeknazrullaev1998@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LLROHWAGDSSYFKJZU6H2A7NEVEXVTAIF
X-Message-ID-Hash: LLROHWAGDSSYFKJZU6H2A7NEVEXVTAIF
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLROHWAGDSSYFKJZU6H2A7NEVEXVTAIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/03/2023 18:33, Otabek Nazrullaev wrote:
> Convert Maxim MAX9759 Speaker Amplifier bindings to DT schema.
> Add missing gpio header file into examples section

Subject: drop full stop.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

