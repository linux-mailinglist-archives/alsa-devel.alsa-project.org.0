Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193F53DC5A
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jun 2022 16:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FEF218B7;
	Sun,  5 Jun 2022 16:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FEF218B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654440557;
	bh=JZmxCSKS3KfZDDiRB7hilODfvkSfK8BosSxdeuOkEP8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pdnDQmOuJNr6F+6EFv2XJk3VIWo1okI9i9OVkb5H5d82wIZ1KrMxVC381riotiLFM
	 pluv3prhgmsGlOTSqBSA+S4y7Kvxk9fN+N6t8eQiJ/modSsx+Mo5+scge9pKlw3mg8
	 QxbiDiDpW/cTlP6uy+h7UQvnkqvDPmbEb9m7Kx5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2431F800D3;
	Sun,  5 Jun 2022 16:48:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D08FF80162; Sun,  5 Jun 2022 16:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD1AEF800D3
 for <alsa-devel@alsa-project.org>; Sun,  5 Jun 2022 16:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD1AEF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ncceEXar"
Received: by mail-ej1-x634.google.com with SMTP id y19so24510212ejq.6
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=a2QjC+ghP6BlX77hE1IU2dKwYl81feAt3LbDCMQWYOw=;
 b=ncceEXar/H9ND4JlWpkM3vguIRi6WiXuZin0c4ARD1buKUav5Wekz5YSOBCYaWyplK
 TTZ59I5eOubwEM3PjyaXTC+pe2twgRsk7boVIL71Q6mA+Ea0nu2DnIt3prFkbiusu3Jf
 kYPbeHNtL956KPGeNyX8Aw++CXB/od1xllZ8DYJSK8SoClA1u9wmF5OJm1PL2hT9dgZB
 zZFOA6a/fh8hGDdH7J4r78qweCPPWI1qFlZdMOJWl/CV63ImtpobFLWjLl3W/IuihdsA
 sx4Jkg8aTUcIw6/Ej545GNnYfollFR3d6XtScFkbop5oIW7ORk8RVuw73Ec6tmN0U3u7
 DTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a2QjC+ghP6BlX77hE1IU2dKwYl81feAt3LbDCMQWYOw=;
 b=lCJyu6hf78p8LuGHy7q9IE8JTA1zjtke/Sll3bpZj+Um5248mtJsplLhwehSra0w+H
 V2VrEMVgLVXMrfCZxWSiaqPpS6F6sZoJeQ4JaBTRuW2FNZmVFiMhNmD/a9f35hvSnt9q
 4L4iCgffkYxI+w2MFko4n0pEXj103MLQCJN4xAMrT+8ubYJ6e1KYOM0nH1wh9umkC9qH
 THoYNUm8EiG7TjQ3yyehC4z7y8qgYRjMscvfPCWYh7ZrAzCUkBVkX7K0LIoq5iv6fyeZ
 +TMnYXWU/e0Mv2VidCXaDf7flKVteyvwJMPPMKMomBnK/r+jB4UMm3ahxQu5P3zjiZxx
 BCIA==
X-Gm-Message-State: AOAM5300a+4pbua0kChqIo1pWRzydoEcUnENcYVUJC0FH/rbqkRezgQs
 EplOE5RjXJtED2lnV+6vK51qMA==
X-Google-Smtp-Source: ABdhPJxpzRZ/BzwBG0v7L5D6OCZfmxyuO0KFXbn9h3ZD5zijXdRiEhCQw402AH6J73jxT31s8LNnRw==
X-Received: by 2002:a17:906:c834:b0:6ff:4275:1e4e with SMTP id
 dd20-20020a170906c83400b006ff42751e4emr2271781ejb.121.1654440489770; 
 Sun, 05 Jun 2022 07:48:09 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 a25-20020a50c319000000b0042dd2f2bec7sm6821134edb.56.2022.06.05.07.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jun 2022 07:48:09 -0700 (PDT)
Message-ID: <3a012c64-206e-3da0-7263-ac952b55b62d@linaro.org>
Date: Sun, 5 Jun 2022 16:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] ASoC: samsung: Fix error handling in aries_audio_probe
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220603130640.37624-1-linmq006@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603130640.37624-1-linmq006@gmail.com>
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

On 03/06/2022 15:06, Miaoqian Lin wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> This function is missing of_node_put(cpu) in the error path.
> Fix this by goto out label. of_node_put() will check NULL pointer.
> 
> Fixes: 7a3a7671fa6c ("ASoC: samsung: Add driver for Aries boards")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
