Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD866DC83
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 437FD66B6;
	Tue, 17 Jan 2023 12:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 437FD66B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673955218;
	bh=+lx2L8hFJC2XnRP6GvWJupreIz8qbihAFe0GoIiuK74=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YgLakqBVZjBK/fOoXbeS0wuts4q4ox94v4PDylYWJjqVjG25yRfhKmakTw0MsD6rh
	 e2OfLpzVSxdKM7AnHLvFhcmQvVKBJyeKZvWh3P0cwE1+ibPmhDrvgyooB95bgFGvMR
	 lQMXHLRz0+fu0ohPwQXshbt+42Y9yPW/q4S+Y1DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9BF3F804DE;
	Tue, 17 Jan 2023 12:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1617DF8047B; Tue, 17 Jan 2023 12:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8FDAF8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8FDAF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T4JaPbx5
Received: by mail-wm1-x336.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1154122wmb.0
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 03:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GO2eKjxO1iedMdXK50/d7P4tpciSJOhld+mYv0gRRXc=;
 b=T4JaPbx5Qg4+WbL7GJMmSfpAFUnxdXuOeTRQgZhAauo/QmncDkQ1Doe9cV/ZIWX18z
 Nma4y8iNmrkm64rsnZmbtiA9AVPzK729a4uhrGfYFmr5TGOgGfaQNX66zrXvP46bdCHh
 cme4SVs/Dt1RGYCT9nJ2y0HWLZDyk0yrjztC+aDoCSy7N2pRLvdvu7Ml3Cc0DmrkjFcs
 8GkGGyU3+1kcBpCkVZKQYtBr2rOe7tFiNWiOl4gb2ZZ8bEsM2V4gIYKDvVrge3k0UB+i
 BEGHCNBix3AE0Pr1ockO2EoadlIDlJy7BfEz11Q6z/8Ni8XVZQwnLlPDNv+hP2IZb5hb
 SQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GO2eKjxO1iedMdXK50/d7P4tpciSJOhld+mYv0gRRXc=;
 b=ZNjOENFOBVbGNHMnMt80XHlGftChvlOYjWgcgZonGWeadOGpxkPzR57MfNvnrCNc7u
 Fzth8aUDz/l45RlydkuerxKb6pixNwHj136b/NP9gyXSp4zWygGUgZg1q8Y3s5Jaq+Ti
 CiEAhMwSJzIIR84exkvkLKE6cB3hYTazTe8Rt3RCQEI4MduXDeCQ9+UwOkwbuhtG4akW
 Zg3Wo2cbiGvIZEDp0knPwP3EqJnlvApTUKj4iciyY9aLrtvX/Dpg9czsYBWMmpxyHFgl
 nvKioKmesUt6YgKVHDGAcsWlO++W0eHgA9LSynrvRCEg2cjFuSLC90O6wFR4hYq0Nwj8
 a6Xw==
X-Gm-Message-State: AFqh2ko3v5Xc8nwGvbW3KGNIPNHkJX47vWsKVb46Ah8Dym5lW4q3iG+R
 OMyC1w1eDFOREfmYqUU0+lZQuA==
X-Google-Smtp-Source: AMrXdXsGd5j2tSvSR09VtVGdaTSDX2UTM7mcUyv1SW5KP7xJAX77Ip6jhrpihEqLCIfvpX8xfJMZvw==
X-Received: by 2002:a05:600c:538c:b0:3cf:6f4d:c259 with SMTP id
 hg12-20020a05600c538c00b003cf6f4dc259mr2655123wmb.39.1673955153043; 
 Tue, 17 Jan 2023 03:32:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 he12-20020a05600c540c00b003d9ddc82450sm35745300wmb.45.2023.01.17.03.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:32:32 -0800 (PST)
Message-ID: <c3746492-b943-9bb8-9c5f-10c0bbd219c8@linaro.org>
Date: Tue, 17 Jan 2023 12:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/10] dt-bindings: sound: Add support for QMC audio
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-9-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113103759.327698-9-herve.codina@bootlin.com>
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
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/01/2023 11:37, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller
> present in some PowerQUICC SoC such as MPC885.
> The QMC audio is an ASoC component that uses the QMC
> controller to transfer the audio data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

