Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645DB655A3B
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 14:20:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE50B40E;
	Sat, 24 Dec 2022 14:19:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE50B40E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671888001;
	bh=6C3X9uEz6bvvaWpQW4gg5MAuaY6sm2kN2vHBUfjqPys=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M8azvdyUyb+j+uXZi3rS+TTGKpLycCXqhUlcoKV2XLgpoQpUX3ogJcnsVC8klUUA9
	 MkJSUZT9XWhjLCY1Z0S1HgkujX7ZRbWDgxyO/CfWLAMP5PLLudeOFcj/Zl1WAgkKLK
	 F+vlce0LLV4D/gmNEhAT1PeK3p0PROlprhj1gd7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6EDF80249;
	Sat, 24 Dec 2022 14:19:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0888BF8047D; Sat, 24 Dec 2022 14:19:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5180F80423
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 14:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5180F80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NFKISZG/
Received: by mail-lf1-x12b.google.com with SMTP id m29so10350206lfo.11
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l964Sz7PrS9bd/FwgahSBxYZ+/O1sM00ru1BQtUwYy8=;
 b=NFKISZG/4i4oQz8EFFmQS9FFmD+qNf7DPMInWvW155471LReeh7n37d2a8yuaou3Db
 yj5817LkRVASVLKC1Mbnz2GzF+vVeIfLw1EE6skJSb/zLXGyGpJFEEP9cFF+KU0ba6CO
 UmfGwAgykU6hLAv8RnUVIVUeKQWyeIe3TrLCpflWUlKOOyll8z1pbelaFz9aIDJZAgWV
 xuf/x9Z7PJB7M9Tsed+M7ZKmAzNtj9hZWr5CoAy6W6m5Y+WFe+sQJLtafFt9TTjfsxn7
 ia7FHU2rLbT9jdV/MqizUIGdT9vjz6xyaf1WJeEGhJgZaZ9b9GROWhd4nwuVvGqz8zrH
 s7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l964Sz7PrS9bd/FwgahSBxYZ+/O1sM00ru1BQtUwYy8=;
 b=jGLF+iGV8LSxOwyhIykjSWnKYhXxHUz7w/bETt3I99g0bo6srFPleiW+HyAlpbgt3Y
 Nc2Pa3Rf0Ex9ID/kX+wIG3EZP53/QduZR4Hlv1FkJCkrWyrQXELCrjh8bcnTIkg7cQt5
 VdrK5Kgm6CzGJeYMeZqsy9VfzedxWBK7LBJaXqizi5RR25remXw0SkNIOgHwu3PVS//5
 g1S+oVy9DRfQv+LlIC2Fx+eIgOKA50lznhujFETzheFj2SdgeaKYyAzotetoucNHJe00
 511Cd3BWSpMXbkzEqNh4twtV0Rh7XTNZaLgGoJwfDgRXDm4AqG0K/NP3ebVpEshnckiM
 l88g==
X-Gm-Message-State: AFqh2kpsoXNsVq2Kwsofax09paOdW4Jk61VhjRHkyGCFcRIKi6B72sFW
 87aC1Y8HScHaxerNeUBkkffBSQ==
X-Google-Smtp-Source: AMrXdXvD4flfN9Rdg5Kmm7mAde8jIetmVIvRx+e1lChO9BX8AOwzwl8AB+HpaSOvkDcxgk/hYyGrDQ==
X-Received: by 2002:ac2:490f:0:b0:4b6:eca8:f6ca with SMTP id
 n15-20020ac2490f000000b004b6eca8f6camr3238637lfi.67.1671887939762; 
 Sat, 24 Dec 2022 05:18:59 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05651211cd00b004a2511b8224sm926090lfr.103.2022.12.24.05.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 05:18:59 -0800 (PST)
Message-ID: <9d97247a-a921-bc7e-94f5-dcc583842a42@linaro.org>
Date: Sat, 24 Dec 2022 14:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 2/3] ASoC: dt-bindings: nau8822: add nuvoton,spk-btl
 property to dtschema
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
References: <20221223170404.210603-1-francesco@dolcini.it>
 <20221223170404.210603-3-francesco@dolcini.it>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223170404.210603-3-francesco@dolcini.it>
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 David Lin <CTLIN0@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23/12/2022 18:04, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Add nuvoton,spk-btl to configure the two loudspeaker outputs
> as Bridge Tied Load
> 
> Cc: David Lin <CTLIN0@nuvoton.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

