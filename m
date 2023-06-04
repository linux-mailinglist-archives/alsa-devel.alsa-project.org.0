Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133C721620
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Jun 2023 12:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95FDD828;
	Sun,  4 Jun 2023 12:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95FDD828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685874846;
	bh=UPbI9cDZbxGQz6pi/nHhPofnVCq4gZgCfrZAV6DrO9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KRwGO02p3kEwjztwidNT1vFyyHwgbMLFgnqZhW3zEktIFc4ZotBWQMvqfJE0vLnje
	 FtwEVo+IEWK92F+5xUE2qVq1oZl9pamOKGgS90pJ4dD3d5lVHXG6YsOA9HM1Y/Im1P
	 IBAptzxRSFjNF3Brhz4qe9gVM4IDXDi9Xg8JuI98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14798F80544; Sun,  4 Jun 2023 12:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A797FF80548;
	Sun,  4 Jun 2023 12:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB316F80254; Sun,  4 Jun 2023 12:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AABC1F800C8
	for <alsa-devel@alsa-project.org>; Sun,  4 Jun 2023 12:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AABC1F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=htkcMOUV
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-973f78329e3so593940166b.3
        for <alsa-devel@alsa-project.org>;
 Sun, 04 Jun 2023 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685874443; x=1688466443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGyIvotUfIBMdSekfw4Xn4d2xdDdkWYiVfVsev9SWoI=;
        b=htkcMOUVuWGuLhTGatJhCckvMtpXU644Opa9IasZcADghKTJUv5SAtoA+sqW8FAAYi
         60RQthfve9A9LmqXr3h1XebgucrahzqBP4YVVvM0T1gfI8M3KU8hvOyI5xY3duCv0EiA
         oSR+zgUtZAD0PBKcf7b9+RaT0lYy0RZBsWOLSG2Dv+CwCDiJGItXm7amER78VAxrwiFC
         pMqcywANOZiPMTFq7Y9MW7/km9kmKEFxuHUidh1KVouRnzaJM0zRil1zk3b9ZT8MJws7
         vQwDuOFKRCdhFkVZ0rUdFV+rbK9jNuCgRdPOctIjs1mvG78WIpoCFMbkF68NQXJai3Co
         +rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685874443; x=1688466443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGyIvotUfIBMdSekfw4Xn4d2xdDdkWYiVfVsev9SWoI=;
        b=N0jZe8EWl6s2ooBxGpH35ywJtFGvzutsbo+cKGf0tNgmeTBnXJOeIOVQy3/Gu2rsdU
         WRcfZhJyfPtfEnxjJhxHzzWwE9eh3LM4e+eOC98CIGOd7jKIoug6y5DVfsBklkw62uVw
         RVPTPeSGUzsZ1YqqjJNaZXT3jt/INyUc4TOSiuRL5ot7bu2Ie+wH5UhwFERXxcpoYVbT
         lj3ONYMiJWcyrtzfb/Mo/MMIBM1+eMgAcvrQQkpAonys9pEq7foKWhzdGqpz1XxcTyCO
         qV/ncm95GmV0lePMQKe8qGn0oEhQLyvYJNIlBnlWuW8rZQ4FjqYjFXEuYHszrj1WxQ1p
         0KuA==
X-Gm-Message-State: AC+VfDyI7i3aw4fAeAtpp7E9AxJPT2ZNvoAV6zcbkUcx8NXMz7QM2xic
	r7omTvZojvOGTjkBcVQmyCfCjw==
X-Google-Smtp-Source: 
 ACHHUZ4/xX59uxUa167JlzpcGJG4EeJTMyLafv9JillZlZILq4DpLfwngZBs28oN65IYsMQwlDIB8w==
X-Received: by 2002:a17:907:70c:b0:96f:7d09:7deb with SMTP id
 xb12-20020a170907070c00b0096f7d097debmr3680328ejb.69.1685874443625;
        Sun, 04 Jun 2023 03:27:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 h21-20020a170906111500b00974530bd213sm2953017eja.143.2023.06.04.03.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 03:27:23 -0700 (PDT)
Message-ID: <cf6bbd59-8681-e1a7-16ef-16eb8a7d8a0c@linaro.org>
Date: Sun, 4 Jun 2023 12:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: document audio of graph port for
 cs42l51
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230531140912.819373-1-olivier.moysan@foss.st.com>
 <20230531140912.819373-3-olivier.moysan@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531140912.819373-3-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GQT3GTD5J667TRNEEBFRNG42RZDY6N4L
X-Message-ID-Hash: GQT3GTD5J667TRNEEBFRNG42RZDY6N4L
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQT3GTD5J667TRNEEBFRNG42RZDY6N4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/05/2023 16:09, Olivier Moysan wrote:
> When linking the CS42L51 to another DAI component, according
> to audio graph cards bindings, an OF graph port property is expected
> in the node. Document the port property.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---

Same comment, please extend the example.

Best regards,
Krzysztof

