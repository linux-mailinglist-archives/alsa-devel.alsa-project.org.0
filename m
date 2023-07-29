Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D7767E99
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 13:19:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB00583E;
	Sat, 29 Jul 2023 13:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB00583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690629560;
	bh=ZFvjJ6Os5PFcWYZgHMGVtQgPsz6/Oz5m/HnsLhpWbF0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CJOwFyT/fc1G2pTWoPSbio7UELleJjK0704T+iT21gpSdPB99AiWXh2gX4ErWVgwj
	 u8zXKsMjdFGe1N0SqhhkDvI2X60Q1mOAdXfMw2ySeQcOpnPFjcHyWqwV11WxwyJ4LK
	 4T7CRs0FDOoNoLf4N4JbtgazybsV0uZsqVOtYO1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EE2CF80535; Sat, 29 Jul 2023 13:18:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F66F80310;
	Sat, 29 Jul 2023 13:18:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E12FF80520; Sat, 29 Jul 2023 13:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90D1BF8019B
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 13:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90D1BF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AMtNRdNw
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99bf8e5ab39so103423266b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 29 Jul 2023 04:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690629486; x=1691234286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eqa0WFoYInEcNI2I+h5DdsTKLO1lHB99H7qWxbe2rbs=;
        b=AMtNRdNw40PF6v9NFEnUbNyil/bZSiU3GWSPFKCEtT9fAq0ehX+1pwG+S8LPu/Q3F0
         6kAjF2bpTFYd6RyWwO0InU9i9hpAYy2/+IUzjs5tRceICs2c60hVxssHWY6G3WIZ/wzc
         9aXEQLs6Vjll321UVSZUp3vSNYbGGZex43TiPMjD3EkAY4kkU2QZa/u/gO1399ULn1kg
         f7+d3XiTqXKBZ65xFi21Y3W4GlkbyDGg9esGW00pPJDi9q7/u5Ph9RWwDdnkLjodNjxv
         OoBJx9oXJUIcy8MwdcWw6SD+yA+bBJ5OJXlyItJq0fcbJACASWjK25C6rdqda5Sl33Vy
         WwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690629486; x=1691234286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqa0WFoYInEcNI2I+h5DdsTKLO1lHB99H7qWxbe2rbs=;
        b=VqLbXyiCe66yWvZugMBA+J7EMh+i09DEAYnOTUTRNe/UIFd3HRcAaA+/ZBGjg/WBaj
         dgonyGG4BGFZ6KLu3VYlmtJJgPzb3zhOODGZlwwQQ6YtBi6MOWHmHje9A+YtWPCgaqO1
         FxuKhrTJpV1bvr/T7TZkRX1HKR/gs+pEe+zrD896hOPyEI5Mx9U+sbLssSPsnal+sDYn
         c+T7WYQa2n8TutYMb7sBhPsB9OqCa7hNSlxpjIw221OB/xKV3lMOYvGqGqIGKd0pxtW3
         Ovkmjb2KXVVjKLVbZJVbN+PEqjRE03urXjkIVQog8jkn7n7Ce9Yta1Guj852IzEdX+/q
         kgjw==
X-Gm-Message-State: ABy/qLblSC2dhdkuxRebX7Tomxa4eJcvUM5hPfLw+gBpOYq1dvwpI6H+
	O/0Z3hUo4pppddBikg96zj6PXw==
X-Google-Smtp-Source: 
 APBJJlEkQGQRcewKkAwjhvPMyxCNjkMEEW1B7oPxKPYIoK0kUjfqQYotwVF5uAKLDyIlvjJO0Hhcww==
X-Received: by 2002:a17:906:739a:b0:98e:37fe:691b with SMTP id
 f26-20020a170906739a00b0098e37fe691bmr1920911ejl.34.1690629485669;
        Sat, 29 Jul 2023 04:18:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 x23-20020a1709065ad700b009893b06e9e3sm3203982ejs.225.2023.07.29.04.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 04:18:05 -0700 (PDT)
Message-ID: <b68021a2-c108-e865-be42-ac8ec2454501@linaro.org>
Date: Sat, 29 Jul 2023 13:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V3 1/5] ASoC: dt-bindings: Add schema for "awinic,aw88261"
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 shumingf@realtek.com, ryans.lee@analog.com, 13916275206@139.com,
 herve.codina@bootlin.com, ckeepax@opensource.cirrus.com, doug@schmorgal.com,
 fido_max@inbox.ru, povik+lin@cutebit.org, liweilei@awinic.com,
 yijiangtao@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
References: <20230729091223.193466-1-wangweidong.a@awinic.com>
 <20230729091223.193466-2-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230729091223.193466-2-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HXDUT66T63DK2HH5LROWR2X74UG5QK6K
X-Message-ID-Hash: HXDUT66T63DK2HH5LROWR2X74UG5QK6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXDUT66T63DK2HH5LROWR2X74UG5QK6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/07/2023 11:12, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add the awinic,aw88261 property to the awinic,aw88395.yaml file.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

