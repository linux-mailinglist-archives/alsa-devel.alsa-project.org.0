Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 013F6660095
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 13:53:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406FF11379;
	Fri,  6 Jan 2023 13:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406FF11379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673009617;
	bh=8svKxDlhERl/+LL0zqo5I7lxcGrM+u6inRFoQ9D6Qdw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=olUEMOfOzbO2J+8oXXRQGq443dOBvXThSu+NNX/Vaxgh2Zy4eFNmhKNeZnN2bw2R+
	 HUQg5hThBaxSFvLYpfk2U3boBmnmT6KbCmsW2ll1q3RBHpUDegL2dqfd8LjYJLHile
	 gWxxHhSlo0ZtYlZVqnRKH63nwMDPA3sW6O63Vaik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE47F8022B;
	Fri,  6 Jan 2023 13:52:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2D2FF802DB; Fri,  6 Jan 2023 13:52:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16457F8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 13:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16457F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U8ZvDuPJ
Received: by mail-wm1-x333.google.com with SMTP id g10so995852wmo.1
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 04:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TAOMstZovNL9Fw1icUH51vZKfotjQqt9VMYdlqvkSf8=;
 b=U8ZvDuPJkFFQOlBgzFNmC6o8YMOiY/MeXyL1tdI5FZphEVXgu6KszyKxnDFtBSMrqC
 6K7fRtUQcJwQdHNQ3LMF5OHDj6Tj4o6Zbtbk2njmn4D8KskY2K/9zqNdsNq8Vf4+yCgN
 /nz3LBTAAawpO03uf4ve80mIDrXpWbBs8aqNlJXFTJnhGPcNIqqeNPAuaS56MlIWDiib
 V8aAkAGfLSawL/uWnXyNOltei/sxpGTU8cFEzU5mhMU3+b5Ve6K4XcmL20HgfGWVDVl8
 LMrd3T8IKvM1mYKtltSP80JdczaAf9eQLXTzrhz8i04wTqfLs4hkY10RoiFDuxRdDHws
 i/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TAOMstZovNL9Fw1icUH51vZKfotjQqt9VMYdlqvkSf8=;
 b=aJcDO94JBlUsHyv/BnU55SZjGRHGY1ou79gRgxVLSSTtCgk8LKxnfRcIPI/8P7yN/f
 hdc0O94+Lklfz4A2bG81/N8N6a6j50l8b/hGWpbSYwlbofY+Arpu51Z3Dd0JzL6Ma55N
 A1MFdEO4qBhUp8RrRk0/Wl+MU6MLr7GInTnqrismoLFSN/jQLKyKan2IXgsSBT1ODHGk
 JtFf05IIpO8Ferqyc8/z0j5BpewYJHt0jq6XXleYKNzcF4oVLGtD/xiFLdqhAWH45jW3
 zP49p7v4E/Ysfyhr2RIjAskbxrOQvhCIdN13uT6B7O0Jy4OpKiJonVBLH8sdP88eGjvr
 8vWw==
X-Gm-Message-State: AFqh2krXHafWGx5q/en5Laig7RGA5q81oDqNLXEw4Gx+mR9vnojMO/km
 sXm9plAsGG9tf8UJJsbC3LIgdQ==
X-Google-Smtp-Source: AMrXdXttz/qmuwcn3VqjXhrWUfUZyiMjfZIVlIzwzOCT/WC9xGVucirL7hV8GfUERndLqM55ciQDsA==
X-Received: by 2002:a05:600c:17c5:b0:3d1:ebdf:d591 with SMTP id
 y5-20020a05600c17c500b003d1ebdfd591mr37880740wmo.15.1673009551764; 
 Fri, 06 Jan 2023 04:52:31 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b003d35acb0fd7sm6625327wmo.34.2023.01.06.04.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 04:52:31 -0800 (PST)
Message-ID: <03802554-42b0-7f4a-08b2-835b7ea9dc8d@linaro.org>
Date: Fri, 6 Jan 2023 13:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 13/13] ASoC: dt-bindings: mediatek,mt8188-mt6359: add
 mt8188-mt6359 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
 <20230105081606.6582-14-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105081606.6582-14-trevor.wu@mediatek.com>
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
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 05/01/2023 09:16, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mediatek,mt8188-mt6359.yaml         | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

