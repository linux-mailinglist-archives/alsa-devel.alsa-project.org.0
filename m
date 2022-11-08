Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADABF621156
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 13:48:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 472EF83D;
	Tue,  8 Nov 2022 13:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 472EF83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667911726;
	bh=EKzAwOdZIjK+GEiI6RzRAycE4hqECNsvHIwOTqU5Cio=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t9Iho62rBLjbxYTTR0V8e7hJmoGshocZz/DlXKbzaUsfnxZK5JRo7SmpwkUtqGkxO
	 +Y1OBnmjEt06aom72/Hq9AF7pbbCDrZQcoUjLiHHetNdJ0yyV0Tcyd1E/MJabJLG3I
	 OpbjAM1siXehEw1BCOisG4fQiac6bjROg/dr40iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E722BF800F4;
	Tue,  8 Nov 2022 13:47:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13DEAF8016E; Tue,  8 Nov 2022 13:47:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 823FFF800F4
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 13:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 823FFF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BgA7M1Q6"
Received: by mail-lj1-x230.google.com with SMTP id a15so20918713ljb.7
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E8byaTjI34WIB+yOKjv/+/yWJamfZUXaWqdaKU0UJy8=;
 b=BgA7M1Q6P8QxvSenmeBorycsBcPQC8sgFH3SV83LA0Zh6JRQVOAoyB3II4IXFyXM91
 xvSQd1q/wswVq4GRhXZ8sV94VpCoLJiESYza+uLY/jVWdk34pEsVY4wmwL6c9DssQXWl
 q0dKPaOrcY8PGk/nRJxH/pcVlR7blsfX+hAytyYgeihR+zSWy9QTD20h6ob0zi6UGx0C
 xDVqmSzJ0ftClO9RStjVTLiPqgHXPJERbnRJpbe/bNrzpZ6S+/84guyHpkk4oNaRe4xM
 2aXHUu/aUvX4meGiF7PoqfnSA7AgyEXHNGqkiKmVrVggO1io7vRdtEffs2VMrOhz7Xtm
 fzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E8byaTjI34WIB+yOKjv/+/yWJamfZUXaWqdaKU0UJy8=;
 b=TNdmee5SE2AAAVLf+hPkx2l5+glihckjK8zmo6/Jf0SR1hyWxT6pf2VhnfthB3CEGz
 BX4+yaEgCFe5XfZYC0sp2l7px//bAMmnZ31tdO7NESkh0KGh0RpY7OI7ZX4I0jR2MUEU
 eANSB/DRMa8tTMLGbToV/4vJUzQ0ZMvSCzrDGNXHKAL9rSpxakmxL5DHz8YcivVL7NAC
 OqoTJkwcXENigMCoxF+cEQ8K7NLISJeK9GkpdHKTRHxArTA3oAaMRC2xq1ugdZ2FkTNu
 xjkKvOnQMKy4v5qYUK8+r7Q2iQbNYPL8VHAgvDW2WuWsnceHeG6alGZJOoqyXHsyIdCb
 HGuQ==
X-Gm-Message-State: ACrzQf0lU6gdzpj+3KMzgDS4nYqgiWmJgP3ZpknSUdVWttPj7546RnoD
 LBL76pXPjMEKpWr/0ER/tuJfhg==
X-Google-Smtp-Source: AMsMyM5eZyVR8HYAuCGoAL9yPEkKIDwjawSXvmKyCHK3Vgi3r988Pk+PdQ8GcKIt82iqoGsyk/tIMg==
X-Received: by 2002:a2e:8304:0:b0:277:31c3:ca17 with SMTP id
 a4-20020a2e8304000000b0027731c3ca17mr6687104ljh.523.1667911664501; 
 Tue, 08 Nov 2022 04:47:44 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 a11-20020ac2520b000000b004b1892aa5c8sm1776095lfl.56.2022.11.08.04.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:47:43 -0800 (PST)
Message-ID: <78e5caf3-3be4-540b-33b3-0ff886f262cd@linaro.org>
Date: Tue, 8 Nov 2022 13:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: sm8250: Remove redundant
 soundwire property
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
 <1667911156-19238-3-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1667911156-19238-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 08/11/2022 13:39, Srinivasa Rao Mandadapu wrote:
> Remove redundant and undocumented property qcom,port-offset in
> soundwire controller nodes.
> This patch is required to avoid dtbs_check errors with
> qcom,soundwie.yaml

s/soundwie/soundwire/

> 
> Fixes: 24f52ef0c4bf ("arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with soundwire masters")
> 

No blank lines between tags.

With two above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

