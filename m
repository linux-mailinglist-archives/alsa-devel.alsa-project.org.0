Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B21946EBF0E
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Apr 2023 13:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F4C0F2C;
	Sun, 23 Apr 2023 13:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F4C0F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682248001;
	bh=FgFVeAb7tXSA4DQW3h92O+VHUEWWJ9SsXjOZQSNfNJs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N7P+dhDiU/LuX/QK57JOoXBCLJiF2/eyWgI9+rtRBnRmezI0nNeiXIbqxRRgq6FVG
	 WNUOHpUxURorrndqCDJ0Ll/5A3ADQ2LPldZ6CfIy+7ngjlVDRdtlMlSvB3Etp0jGeR
	 wdXY8xYF5NfQgGgH10G66CCgQ3QOS+eQMfYar+KI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 619ABF8018A;
	Sun, 23 Apr 2023 13:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07B5CF80236; Sun, 23 Apr 2023 13:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A620BF80137
	for <alsa-devel@alsa-project.org>; Sun, 23 Apr 2023 13:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A620BF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hv77IVeh
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-508418b6d59so5978090a12.3
        for <alsa-devel@alsa-project.org>;
 Sun, 23 Apr 2023 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682247937; x=1684839937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4oBnCQEBGXtSAEIanLhSekClnyHSr24Ok+VnVMLZrEI=;
        b=hv77IVehUa9xkU3c4CDNCnhlAG5dlsNmPUNm6jZ3PWzcrnMy5fI+z0sIajzCfXGJy7
         Ycxfr9xH+wFiFAM/gYRit8kTE+aej+eqdoAVOMta58gih1+KUjG/FPFpJsJhbmp6e9FE
         kg6b2q11cN9HORCLf6H84PgsgHftBzT1fWdDICqGh9M+kxYaR60O9UqL6rLJFdeJlT8v
         8IbeMnq/aQ/B5+LPSVj7Ir3JRDEmJL2P8bZmAZMqRlcr0st7TKc77hrDkWdHrCibhVP+
         k+qOhdY6+wSV/SWIMGJ8WoKe0i/Nw3ugTRsE+q3M6Q9hlAk/9p29WaimxTKk56SeG7rb
         q+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682247937; x=1684839937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oBnCQEBGXtSAEIanLhSekClnyHSr24Ok+VnVMLZrEI=;
        b=b3KOV7IIblhGE0nxhy/KRDXM8+AOEjoT+umviHGuA3WdksHJMPHc0GFWiyrsFqjo4G
         LU2oSc0+9OqMRlD/amIJ3S93YD7VDy4CsocczN0ChnaTJ6sx6K9/5cr41M4fgTxFN+vs
         b7EZFpOHCIJ0FhnT1B0AlV5bVJA67J1RvbUVDOYK/R4ZPDVVu1bE/6S2MJ4GAHGsWlQt
         KeWtsaI/gQHGXlXlaBXtJRYDSk+nGNHf/vho/GJqdosUqRHp5orEtt85kCqNvfw0yjBQ
         6gD2iiypEG/k1o8xsyuRqo2Myf4oFoEkmL9yCVsseh121aGBf/sTceOitIDW1fGRZixy
         xVug==
X-Gm-Message-State: AAQBX9ffiifXkNp6i70eISKx1Co8uY6/L63HT5gRblVkQw6uG/YQOg1g
	j/gq9TBnO/VCVRioiI92IxBrdw==
X-Google-Smtp-Source: 
 AKy350b1gZdRRS99FXwzdyRQvuYGxvtRfTqL3wNCEdC9oTnowvf0c3qWXdTnD0zdTodXYGJA5CPqbA==
X-Received: by 2002:a05:6402:14e:b0:505:7d54:db93 with SMTP id
 s14-20020a056402014e00b005057d54db93mr9808233edu.21.1682247937604;
        Sun, 23 Apr 2023 04:05:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5d52:d466:d57f:118c?
 ([2a02:810d:15c0:828:5d52:d466:d57f:118c])
        by smtp.gmail.com with ESMTPSA id
 o10-20020aa7c50a000000b0050504648fc4sm3603764edq.80.2023.04.23.04.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 04:05:37 -0700 (PDT)
Message-ID: <b58bdaf6-f0a4-41aa-e271-53cd223e9bb3@linaro.org>
Date: Sun, 23 Apr 2023 13:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: More dropping unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
References: <20230421214810.1811962-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421214810.1811962-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7NB5NZDY6EZYYFQR4S3ZMMX6FV4PCNRU
X-Message-ID-Hash: 7NB5NZDY6EZYYFQR4S3ZMMX6FV4PCNRU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NB5NZDY6EZYYFQR4S3ZMMX6FV4PCNRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 23:48, Rob Herring wrote:
> Another batch of dropping unneeded quotes on $id and $schema which were
> missed in the last round. Once all these are fixed, checking for this can
> be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

