Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6E365768C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 13:39:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2CDE2A91;
	Wed, 28 Dec 2022 13:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2CDE2A91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672231163;
	bh=Ent/dG1ffMMl2wYS/QGRbf59LpEf80Ul3qjUturLFRQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ibzK5ZZ0jAdRB79DjDdQui9nBkoYjgQJ1JI+ioEX3SB/1FnDU7Yhx7dAb8DzLDncc
	 uboh11rxklzezEou7tV7BpKr3sNmumSt9syLvM1+GZFgQ9b4XfTHpTgn7yrmb0sdtW
	 F5FXUVbSWLyRJEBSto2MC2mvFidJSUQvcikHkfGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06913F8049E;
	Wed, 28 Dec 2022 13:38:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1075AF80534; Wed, 28 Dec 2022 13:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C78BAF804CF
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 13:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C78BAF804CF
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ROZy35ws
Received: by mail-lj1-x235.google.com with SMTP id p2so833726ljn.7
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 04:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ulQdzi20zd2U46RZKsWGGdfViyIJCsOcS9mGLZlm5yU=;
 b=ROZy35wsYl1/tNFkRh0mrMmTpcQIU+41TeXZI6z23pccDhF71JS3vFW0I6QBK5tqCG
 +yx3MG8YeeqfNyuyH7Kpxj6/ehUia8GTAq20UcCyksilXnkN3b8iIR4FvbHUTj6HoRlc
 UX9USikFDumDonaVnDgl137WIqjLQbBc/fPog42FT0vQ7d309epTunt9B50/0C05XE9I
 uGlEyErjaGvgamWLdzaMz9sooxtCug8QlctG6G9wRYUc1ppb1wJe7FcszmlUPfo18oTy
 yl6MWffhxj5pH9E4EuI4w+m0DRGYnOHcZwrAo34GHU9EjqrJ7I/out4nSyeUwEsT7wvg
 FUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ulQdzi20zd2U46RZKsWGGdfViyIJCsOcS9mGLZlm5yU=;
 b=Qe1EvdghNSYGw4BZqfHW7oIypOhOtcb4dD70FPUMq6uBOLEk97Tou1dz3xNUmT2Hso
 ARMHUNooJ/p6DzsROvW/92HFLMl9OH7+ryc33mVKuh7q7u0ZQ8Vnw6bJaZBluIqRLCKr
 7En4NDOn/+Ms2rh4TX6M9tNvlVPkoK7txMToEsYChosKYmEEp7r7DAEdKI8W68Ehv1dd
 uSTSct/UtbneSb4lXdkXemp1hngcbx2Sqm01HeB5JnEz0XhYYletVl0mAvnL+jvzo+W0
 ETz9+JS+/QBu8IWKxZBzWlRPU/mNpafC2OwuH6E08GM3bHjBVHmYs8GuDLofh2cAfNTA
 GdoQ==
X-Gm-Message-State: AFqh2krl42VJ02hBeWmkf/ULCTb8aypqpNXsln1KCuMpUhIcAJUrVlY9
 b4gQBUFbZYMdpAExj9ZLTJY9gQ==
X-Google-Smtp-Source: AMrXdXsoIJZhKKDkqEp/ZqcNn9QOtQzkUwBxJWwRPesEC5Q4Kb3HlmbuhYhJDQ+aKdj8EeXGi7O2/w==
X-Received: by 2002:a05:651c:90:b0:27f:b833:c50a with SMTP id
 16-20020a05651c009000b0027fb833c50amr3893384ljq.14.1672231087829; 
 Wed, 28 Dec 2022 04:38:07 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a05651c03c100b0027d75b38fd6sm1940734ljp.43.2022.12.28.04.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:38:06 -0800 (PST)
Message-ID: <76a34e02-ec76-10c8-5cea-681a7477a026@linaro.org>
Date: Wed, 28 Dec 2022 13:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: mt8186-mt6366: add new compatible
 for max98360a
Content-Language: en-US
To: tongjian <tongjian@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
 <20221228122230.3818533-3-tongjian@huaqin.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228122230.3818533-3-tongjian@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 28/12/2022 13:22, tongjian wrote:
> Adds new compatible string "mt8186-mt6366-rt5682s-max98360-sound" for machines
> with max98360a and rt5682s.
> 
> Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

