Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB813686678
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 14:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E816B1CE;
	Wed,  1 Feb 2023 14:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E816B1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675257297;
	bh=3hbB94ob54SghJbx3LOYEKAx6WHgEvlc8k5VsfJVN5M=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Nv8N7xTnlwcpXHdg5HJRM1TwCcAbi0W6DRWte5r+v7GH2clciCOpkjsotx4XbZNcC
	 PvjTnXafO2Wwv4g4Fx4gD3V4KRbdWjHfLbvUE+yFqtky2x4pzKE9vQ5+Y/k+gRtWgP
	 pjYewmCQQWIs0pJJBYzh48O6NrCfmFpzFlY5vkH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E73F8045D;
	Wed,  1 Feb 2023 14:13:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 121A6F80423; Wed,  1 Feb 2023 14:13:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 775C8F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 775C8F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CawsGJou
Received: by mail-wm1-x335.google.com with SMTP id l8so12639242wms.3
 for <alsa-devel@alsa-project.org>; Wed, 01 Feb 2023 05:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NBVSqHRFtG/oRQBhwtv4eQUlLsJwKfgYGxR//a3EtVY=;
 b=CawsGJou9VXLSTLiSbX94s6GV0QPhhZLeRf5TV1XVsktftepDsXJYJblOBAdRuQB9o
 rmE+KByzfmAVrZctCx3YP7a2gNbfNWKpVs5EfjJoYQxQOJV/kkBP465DkNhH0cS9+73E
 /LOxy8+De01bfA5Vp+5bTC9yeqs24OTuY1iFUivKuSkQAc1gegbgJdwpvw3WeOCg65k0
 DHUz+knydv1eaoUm0WZFLJYbpCwqQsq38571FXTWd86VI/y9fdgZBwCjX0kmTLzRLQeP
 ENbI4oAdMAh59CWpPwkevxfGUzsvMXRr5MSmwYRIh8EaUr1Lu55D4+SVdtLBa9K6ifTw
 XkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NBVSqHRFtG/oRQBhwtv4eQUlLsJwKfgYGxR//a3EtVY=;
 b=n4aMLHvMimnEqkiwU8u5wueOV6wBLJ3F7ErQqpeAojyvfqBZnnHiNY2AsC8ZmhIE+L
 Xst91YzYTPStZXlYGCHFN0BbZGdyD3fHgwbJsJ+nRFXcJUJ5bkWdsK/YvwmrshAzuKtC
 YYUGgTXHgfsq6d+C+cQCnkB+Ap66OQdmsB2MNFnX+ASyRDHgay50VD893tsfTazd6lPt
 e0/mwJ8SOH80BVTdcYirzsJdJe/ewsIgi5R0HKsCZR8Q6waoUx2pusMEHHofyG5pwCaa
 BwsMVtcXHGEletTb2k06QhZgr7VYgMy6xEjqN5w89IYrNc5DK0j93QXar868rFdDQv7n
 EiOg==
X-Gm-Message-State: AO0yUKUA5Wl5Ytgb25ySgTjjjp6AJdwC817lPgUBEm/q3scc5lumwxAE
 oSM+5JjWE/HP2TVGZP+VI68XxQ==
X-Google-Smtp-Source: AK7set+yf3Nsm5C9ZeM11L6U4K6PWqyZeCiqzJ6QeAuVfoj2t+QoDJCDauh2FgNVUvOi6P2O7Ttkww==
X-Received: by 2002:a05:600c:1c9b:b0:3dc:5240:53b6 with SMTP id
 k27-20020a05600c1c9b00b003dc524053b6mr2211877wms.6.1675257229667; 
 Wed, 01 Feb 2023 05:13:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003dc1300eab0sm1965656wmq.33.2023.02.01.05.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:13:49 -0800 (PST)
Message-ID: <1bcd61d6-810f-1239-1b6e-367e0fe87370@linaro.org>
Date: Wed, 1 Feb 2023 14:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: Drop broken irondevice, sma1303 binding
Content-Language: en-US
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230201131059.65527-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201131059.65527-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 01/02/2023 14:10, Krzysztof Kozlowski wrote:
> This reverts entire SMA1303 submission:
> 
> 1. commit 1c24d12b68fa ("ASoC: dt-bindings: irondevice,sma1303.yaml: Fix about breaking the checks")
> 2. commit dcf6d2ef0e82 ("ASoC: Modified the schema binding and added the vendor prefixes.")
> 3. commit 5b28c049ff53 ("ASoC: SMA1303: Fix spelling mistake "Invald" -> "Invalid"")
> 4. commit 68cd394efd0f ("ASoC: The Iron Device SMA1303 is a boosted Class-D audio amplifier.")
> 
> Because the binding:
> 1. Was never tested,
> 2. Was never sent to Devicetree maintainers,
> 3. Is entirely broken and wrong, so it would have to be almost rewritten
>    from scratch,
> 4. It does not match the driver, IOW, the binding is fake.
> 
> We cannot accept drivers with broken bindings and make it an ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

I understand that in general we tend to fix, not just to revert. But the
poor quality of this binding and the next patch, which was suppose to
fix it, plus complete lack of testing, means I do not believe the author
will send correct binding.

More over, fixing binding might require dropping incorrect properties,
thus changing the driver. I am not willing to do that, I doubt that
anyone has the time for it.

It's the job of submitter to work on it.

Best regards,
Krzysztof

