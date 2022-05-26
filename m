Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D8534A7D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 08:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A1516B2;
	Thu, 26 May 2022 08:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A1516B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653547850;
	bh=uLBWAR8xNoJgAaP922SpRkwBqZhEqK+GU46KswVcoiE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSAhcn99Yc0gkgrXwQtj9HDdlraHa17cAtqMmZ//yHaRjLzitK0EEgEA2+I7F2dgF
	 m1/gTpDHD7fKQmbLEx2HwtJ3jkE6kWzhoT7sjQ9IvaVCs9b5lWOkYuFFwxE/A1MQO0
	 nc5zmQRjWMKUifSYeW896xjq6u09lyk+Px+j+3rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38455F80171;
	Thu, 26 May 2022 08:49:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3100F8007E; Thu, 26 May 2022 08:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB8E4F8007E
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 08:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB8E4F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lZ0UFWMJ"
Received: by mail-ed1-x534.google.com with SMTP id o28so697879edi.1
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 23:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7Bp9SA/1hFvtEI6hsrX+GVTXLacAaxb75saSLRSbPUs=;
 b=lZ0UFWMJZR/ScahCDhnrsdiqEMBsXhaUmxwPQYz8kGSkmNB/cfqAcxnwTVkp9xj0aE
 lsCoXp+eBgAG94q60rWQbm2Ev46NKSs7L0YuVDnsOuzPOSZw4gGFoRmjwrwitLfc/Q1u
 th3CE0lwu0KKph3kbzIli9VSAOxfe3FBTYhkQfWCArBTLj/bSslh3I5HWo53/4LUlp2Y
 EFr6Ux9jj1yIdsZLQ2Z0OF4eeKYkdllzrL3pr3b5ZFiR05utU1Q22S/gN01NaCibu8uA
 QiX4cooIXHCpWZc2KVRtRA0YzG91KtsCjTK6OcNFkVXfJD9Gs0VagoIP14zE/x1qcvgX
 f50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Bp9SA/1hFvtEI6hsrX+GVTXLacAaxb75saSLRSbPUs=;
 b=FtGUVurdWaNr6Ik/2SbX9F1cl+aN2T9TP6gzL8MT7YrYCq1klDVVaaUFZ63R3vQ4Xx
 0j8x59KeJJroLJBcuXh0QcPvq56DXhNIm2rhNZtGXudtp4M0f8+3db/WCV2qH6EVpPHd
 jB0GmNQ5sk69MxzgNN+uGPti11K8bRtZPewMMp+YSQNCsq2fyQeSfDPXJ0kk1v0lumYt
 /brWwocQEbt1NnaT36KOdbSuEZVEcqTWc2A6FIQrDkn6vdvDPQ1URoaOhTpAa90V0qYk
 xr40IH439X8CQKsIWE1apL3sT8K+YOVKQK4Zws+y3mE/meh/kHPKXiRb4MlnEOD+KYtG
 sGWw==
X-Gm-Message-State: AOAM532c9FDpS+UNxOcwGVoIMtcBTPLThz+nNV9hxyWVMzYIlp1eYMuw
 ldOeVhzt48E1ORcz4DAybRlxPQ==
X-Google-Smtp-Source: ABdhPJwr6AzAilZdcZEXaEVY/WvgakJfBGOFvOc7ZLnxseNZb9svTt9d2Rn3vt0YkLTvjnYO5aqOqg==
X-Received: by 2002:aa7:c4d0:0:b0:42a:ce47:e9c5 with SMTP id
 p16-20020aa7c4d0000000b0042ace47e9c5mr37950139edr.224.1653547781831; 
 Wed, 25 May 2022 23:49:41 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 kq21-20020a170906abd500b006f3ef214e0csm225570ejb.114.2022.05.25.23.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 23:49:41 -0700 (PDT)
Message-ID: <e8d854c0-e2a5-2382-4b54-c5e879170324@linaro.org>
Date: Thu, 26 May 2022 08:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20220509205847.607076-1-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220509205847.607076-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 09/05/2022 22:58, Nícolas F. R. A. Prado wrote:
> The Mediatek AFE PCM controller for MT8192 allows two I2S interfaces to
> share the same clock and act as a single interface with both input and
> output. Add patterns for these properties in the dt-binding. The
> property is split into two patterns in order to allow all valid
> interface pairings.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> The series from v1 of this patch was merged although some changes were
> still needed in this patch, so the v1 of this patch was reverted [1] and
> this standalone commit addresses the feedback from v1 and readds the
> property.
> 
> [1] https://lore.kernel.org/all/20220509185625.580811-1-nfraprado@collabora.com
> 
> v1: https://lore.kernel.org/all/20220429203039.2207848-2-nfraprado@collabora.com/
> 
> Changes in v2:
> - Added "mediatek," prefix to property
> - Rewrote and added more information to property description
> - Split into two patterns to validate that output-input pairings are
>   done
> 
>  .../bindings/sound/mt8192-afe-pcm.yaml           | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 7a25bc9b8060..2abf43c6c2c3 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -54,6 +54,22 @@ properties:
>        - const: aud_infra_clk
>        - const: aud_infra_26m_clk
>  
> +patternProperties:
> +  "^mediatek,i2s[13579]-share$":
> +    description:
> +      Each I2S interface has a single data line, input if its index is even or
> +      output if the index is odd. An input and an output I2S interface can be
> +      used together as if they were a single I2S interface with both input and
> +      output data lines by sharing the same clock. This property represents this
> +      pairing. The value should be the name of the interface whose clock is
> +      used, and the property name the other interface that depends on this
> +      clock.
> +    pattern: "^I2S[0268]$"
> +
> +  "^mediatek,i2s[0268]-share$":
> +    description: Same as above.
> +    pattern: "^I2S[13579]$"

Rob's question is still valid - why these are not phandles?

In any case you miss $ref.


Best regards,
Krzysztof
