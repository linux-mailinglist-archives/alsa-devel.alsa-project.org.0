Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0A62B6CA
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 10:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E8C1693;
	Wed, 16 Nov 2022 10:42:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E8C1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668591791;
	bh=DItwrc4yPUXTvSPJ7canvPupupiUjc6rxyVCj5log68=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TL4hI2DMxAQ9ULCG4SwuD/Y3tVGPGqgnLyBk5J6fdvgxYJIUr/9TjEzP38hRrkuTP
	 atSPAxtFhQwWeNF4w4zdt7FK5JqrxdNM0qIyEvATr4kKUEwE/mnG3bRQdi0tS2LIM7
	 r3NK2Q3iBvxfx23vLbTp2ZzdLn0CEd+bGv4brLrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0574F80238;
	Wed, 16 Nov 2022 10:42:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 278C3F800B8; Wed, 16 Nov 2022 10:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D44DF800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 10:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D44DF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YrjFz0S6"
Received: by mail-lj1-x236.google.com with SMTP id u11so21028073ljk.6
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5UYQZdgYW+z9gLBRDgoeeOpxUAQ9YvTiqxzsUvKjyQU=;
 b=YrjFz0S6+0E+Ll4ltC9eGxNTcBfYIkgQ+5c8cI/RnrzK7hNETTq99elhDWkM000CWh
 TosINp2kZohu8uafVpp1koJ8pnrhHhaVXIfEMB+BpEu29AR9A9Vy0h9feOORdV4/gqw3
 SJ/8jrfrKr5Q2tH0O+fcZQSf7aQPIlrpI5JsifL35KvN+L+wPuhaCkt1aGDLOzbPFyEP
 h+g0P7UZ++eKn5I+VleVomQpeDBtS2I0S4RXw9QWO9+uIMr2n00ixukJGpMpYgUD7x/k
 VTRGZN6/l5PIKWTgJSSmnTw7xBFmCR/V92BpJqXnM2Zd8Bx/DA5zctfIHpdeWQHKD0V7
 rCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5UYQZdgYW+z9gLBRDgoeeOpxUAQ9YvTiqxzsUvKjyQU=;
 b=7z+bKHyTDBxCAZHcS0SzUmI7qGamZ7aqASA/Ys2NfMK3QC1CLKL0CI5I6HzvAB/LU5
 r7hpnZVUD4Z7teVwfn0rra/tbwQtwCw+tTCtsEqAsqL9MQTh7eFAfwhgsseTAVauByoX
 uWNAKhx6J5OAU4YrEB7yOAovA6EcNoAKrAD2vdWqOdmKkfMJ88gg+ICRjCenDLAvuWZJ
 f95wFbpOPxtImpMIMveEYmnlv6Eb1af9jwu9qHKrmuQ/mktv/zt31JZoQgfTlOarztcZ
 m8ARN2TBA4gG3hEM4bInY/9B6fWgkAANs8PrWGyOuUn92WUjvnyMhwMClrOE+1Q51YTq
 YlMA==
X-Gm-Message-State: ANoB5plExf4coOOVJ73QUTT5H5C1sPyp2b8awjhlfme7a/ouAcY1ctrm
 YqodpoMCuDoU3aNqX2kz7b5pvQ==
X-Google-Smtp-Source: AA0mqf5zM70YLvwoavo5dEc87g0vv+mCXARGelAEmAbumS+wR6g8pwspv85YJRRQqdslLB8FCvPdcw==
X-Received: by 2002:a2e:7a02:0:b0:26d:ccb6:1d47 with SMTP id
 v2-20020a2e7a02000000b0026dccb61d47mr7987783ljc.199.1668591728013; 
 Wed, 16 Nov 2022 01:42:08 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o17-20020ac25e31000000b00498f23c249dsm2512627lfg.74.2022.11.16.01.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 01:42:07 -0800 (PST)
Message-ID: <21c529d7-189e-e937-78ad-ed81cc7fa8a4@linaro.org>
Date: Wed, 16 Nov 2022 10:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Remove unused sleep pin
 control nodes
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 16/11/2022 10:33, Srinivasa Rao Mandadapu wrote:
> Remove unused and redundant sleep pin control entries as they are
> not referenced anywhere in sc7280 based platform's device tree variants.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Chnges Since v1:
>     -- Update subject prefixes and commit message.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

