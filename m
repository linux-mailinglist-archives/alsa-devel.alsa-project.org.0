Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21BB59FA76
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 14:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3231622;
	Wed, 24 Aug 2022 14:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3231622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661345507;
	bh=KVO36j+wU3zCbnRT0Cm/9EKtcCVEPfrFT3fKgVDqSkg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbVLzfdEQeMrhpzOnmY3nVElWEZITagMrqGCqMaer9azAok2GO/xojVbGzzRs8rIs
	 ib9P4IpMrUqxsRrfcwkYrvz0C4pEEs1mEt3Wdb6Oi0tDV3wotkBVCxNpObv8Iu/ZZ5
	 hZVKWk/zMBiy4BCROozLkly7R2NLaQ7iCjvNWJzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE33DF804C1;
	Wed, 24 Aug 2022 14:50:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AE75F804BD; Wed, 24 Aug 2022 14:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E0B4F8014B
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 14:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E0B4F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Yam95mWy"
Received: by mail-lj1-x22b.google.com with SMTP id x10so16348292ljq.4
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0O7Y3wJVPgnkwy4P2rEemJaId32uZhPl7XRxR+A9aIE=;
 b=Yam95mWyIq0L0MGw6weU1DlJz4RMqiQEoSPqdYdcFy81HXgQk97ePlQVxKanlngc+K
 HPCgJ6gROEYSRn95DexG04ODFwjr+N7Vov8Vr2319AMy3HTwssnYvlvI8S8ckOSaR9kp
 uFRFJX9mvjDuNMkDBCYKiXmY316JHSzxe4vmilL/mRC+n5oIkUkCEVVF0vAT5OGhMcvh
 RORPoEGTw2uHQV/6Xr8/cWXvH5txQJ/4+SdXqP5BuQb+Gip2Euj4geU9z56JJcTPko2k
 txxzU7CB4NUVazI7dVgVoyYBcWNFP82sY6KhI7URrk0ZIkj/EvEMdoGFuXERGWMD6GR5
 2LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0O7Y3wJVPgnkwy4P2rEemJaId32uZhPl7XRxR+A9aIE=;
 b=BXckDEmjiiryJs5nVdJjVoAbaOyhE057zcWjSw08lPet1j+Z4kXwRti4rlvPVYCZUW
 LI8nFspRPNbW5RmGBr+G1UcMQsFgtjTJnrZH1icFHJymMqbPS5S9e84XGGOaEdUWfhNE
 IL2zgJqC6wwLTD6AqJfHbJZNzBjenC0gU5zyuEZj5z8qW7eVlYRqmKp2MCO4MQB1qUys
 xzBWU4U+5Lze3xyXAEWZ9CSPRtRqnyPPJnveizIuozB38TYxRDR6OYF/Bv2MkJXlFDUS
 qV9NaaGqxK61F4eqScqSo8J4DuRUfD19Isa3Jt6IpTPGFhOGrw0RJ66fb7Z2mHKan4fa
 /cgw==
X-Gm-Message-State: ACgBeo3Yqxt8kFmk6fbflK2W+x1ulRMSt/L2yMQIruAHfPiI5fJLt7gg
 QLplR+gLUsdNV6JX0wwRJev11w==
X-Google-Smtp-Source: AA6agR65hBbDRBSJCxuxnnZFSQvwtE6BrqpyaIPRWhBHpgpzD629PE3LDaZFuYdEe3dkvWfNHYdAyg==
X-Received: by 2002:a2e:9cd0:0:b0:261:e257:dfe9 with SMTP id
 g16-20020a2e9cd0000000b00261e257dfe9mr898830ljj.209.1661345437595; 
 Wed, 24 Aug 2022 05:50:37 -0700 (PDT)
Received: from [10.243.4.185] ([194.157.23.230])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05651203e800b0048b13d0b896sm1312261lfq.141.2022.08.24.05.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 05:50:37 -0700 (PDT)
Message-ID: <fa3aae29-3445-328c-e400-5b91cb2da4c4@linaro.org>
Date: Wed, 24 Aug 2022 15:50:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for SOF
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 broonie@kernel.org
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
 <20220824122319.23918-2-chunxu.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824122319.23918-2-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On 24/08/2022 15:23, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be
> retrieved, from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be
> specified from DTS
> 
> Signed-off-by: chunxu.li <chunxu.li@mediatek.com>

Usually first name(s) is separated from family name(s) with a space, not
dot. Looks like you need to configure your system.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
