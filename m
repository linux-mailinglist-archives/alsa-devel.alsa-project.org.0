Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CF75B1F37
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 483F616FD;
	Thu,  8 Sep 2022 15:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 483F616FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662643934;
	bh=9+uFyN7N/7aPg4WvrhswkfD/0ICaiBuwTbbMZ64mzu4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/2S74KmksLCdMdh42f2zesbASRxwL8SopfipklEjjI/iT4QFm11pNAixg+DdbanV
	 LEGCvjVeQ88s8fO/WqslprXyOdmkvjCXUljPYzGyED++Q+sa5zNVCRv0gniuWy0/OK
	 s9Vu6RByiV6F1rGygbuqn7Dkz7CUNS8ZAhlceooY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C52A1F802A0;
	Thu,  8 Sep 2022 15:31:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3E73F80217; Thu,  8 Sep 2022 15:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF0DF8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF0DF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Z/99+K9k"
Received: by mail-lj1-x235.google.com with SMTP id bn9so19894535ljb.6
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=K8lsIXUFAXFlvET6IMdtGmpuoPDOZDFg3zMmcGfzIwI=;
 b=Z/99+K9k1Ibo1tPR+57rjDoV1qxZEgDqsG4vHdLURL6Ny+9TcaB2J1SYqWcU7A1zyk
 CyXUHCGgSKb5zWrMdM7QladzOgHyiasHGw4ND6um6GpoNPg7P71NVv3pIlhATtFkQb/4
 3+9TOmp/L40w+0ifimb7Qb/NsDhgPIfAa0GSyeJa6aTCsJG9NFaXHasCIV3YBuPi6fGL
 SNZUZwB4K+TRpdtZfBFUdis0gP3da46HfwiLA1uVLNUyIZaQy7CmwpVTyHWnpSXnMxnQ
 UZ/cAlHiYMjU++z2lZrEkqJqM1vkPXmR6c4x0MMZOX6+AvHtk/GNxOU+jxHwfpEhfudg
 mYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=K8lsIXUFAXFlvET6IMdtGmpuoPDOZDFg3zMmcGfzIwI=;
 b=posR9gxukDnMyvFlqJsZPtsXkKZ2di2UerizQstFCDOCROZoDlpo6xAxn7bhjHKZZc
 MhZyEgmcuDDuwNvjT9F6leMQC2WT5oH8G2RVtF/in7jBJHb86qqRjLpfvMVPRsuuIMkK
 n5YvqOSUYfMqiAvPqBkjy3rEfA1PGXVsWC4sGmlY5sgkzhKrHjJ31lPO4CFOUxrBzKjm
 DmkNMgaDu0BaG3Mg6j55jamSxcLNl3HFxATy44+Jk9lpNk0V5HTjVt+pJQxKryz5uR6g
 ZWGdmwIk3SVx9iUrzUq5RRvP2xi3/IdansQI/faG/LWBS7odTMJ0CJU4YltG9qJKQqiX
 9LGw==
X-Gm-Message-State: ACgBeo1YX2q51rwKXesVogto+/ZG59+pKO6Q5Qhw7nVHvV9lD8SqG4qA
 IJpuL/ObIKU787Y3/6jsCrtiiw==
X-Google-Smtp-Source: AA6agR7n+DhBD0AHyU4D5+n4AgxeApq7jxVuKSkPHwBfUpELv4I4hWyE5YDn2Gmno7sD/lWJlZy0Fw==
X-Received: by 2002:a05:651c:12cb:b0:25b:fa3f:c3f with SMTP id
 11-20020a05651c12cb00b0025bfa3f0c3fmr2611062lje.364.1662643864620; 
 Thu, 08 Sep 2022 06:31:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p10-20020a2eba0a000000b002688844741bsm3195632lja.126.2022.09.08.06.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:31:04 -0700 (PDT)
Message-ID: <06748378-f5a3-5dec-eba0-58123084c51b@linaro.org>
Date: Thu, 8 Sep 2022 15:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead
 of EXPORT_SYMBOL
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
 <20220908063448.27102-2-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908063448.27102-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

On 08/09/2022 08:34, Srinivas Kandagatla wrote:
> qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
> so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
