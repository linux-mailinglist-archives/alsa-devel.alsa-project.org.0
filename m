Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94468C68F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F311E9;
	Mon,  6 Feb 2023 20:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F311E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675710884;
	bh=qEgz+RojEX5i/8yjXf5NPtdD4Vq84L26LvyCRhKzwFU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nqFd+cBsk7lY5Cv6adpgDe5aliZvfu1NCC8+32nBN0g4zuRDUPiN2B6acjkHdAT5O
	 0Rf4irCGPJTWZBC5obTxXhCFQFmUaeOno4ZaEaFjnLHOV7vHi83Lyi2HsQs7UfMGFb
	 CZHT5oZG3ORkbE92WrF7t5HeLNz6ApAMPMw02CeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B3AF800E3;
	Mon,  6 Feb 2023 20:13:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFE0DF804F1; Mon,  6 Feb 2023 20:13:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAA49F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA49F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yy7PWPFv
Received: by mail-wm1-x32b.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1016473wmb.5
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7TTlok+DKoN6O3XZ3ZYCY2Q6A1YUCFwItnfjnPnLbF4=;
 b=yy7PWPFv5Tvm3H5w1E3b3zkysD1tPRSBhTCWpcA8S4HvTxKLmgaRWjLKcCENv+I3xz
 aMSNQLk0FXCBaDkAx4Av5pJOnx0gz4trqrppVpPitRTro3gGWSYTZo9Jr0nk88FjAwoY
 gWDgmq6e+Tqe8KChXgXnSngzlFSNrD7xgoUPxr17rqf0DZD9iazVAXxDMDzxksiRplk9
 OmMPgpDv5Tixu7Ha7eYCJTSJySWSXVsa6mZMwY9We3IgxenX8VGKnpwSE22vMeDW3MAR
 1apdIyrHfUKzsyTlRhJH9+K67/ChkoEdYxA/wdpMlFbtoJQI/eu0Ae2ECk7QsCElTPOH
 UnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TTlok+DKoN6O3XZ3ZYCY2Q6A1YUCFwItnfjnPnLbF4=;
 b=QC+woFwVyvCbTeOpQycsesksHyC1tIi9L42eR+wLm5ucuujfn/2Q/DkHhAEzFymo3d
 47haq6pJmhTp0lGMFTvMKzgB8iIiALQRvO6AvG9I/XYvWcztoMESv0GRefx2q1sFnpVI
 Tl1jW6rL+jB9ay0/pIFBqxucBnC5feSa4WCrs+LBRi7v6wu4fi+zyCLot9yzSJ5DX9fO
 Lp1CK+zLuWAfHWO+HOJa8y6NJBdD2C4V8D44HxmDAmoMpqZV0pnB4IaSh0py/ugc6nHl
 UL8noOn8MWgZda3WddB/PDM5vsZZHOql8jXgJgYWYwJs23yZJPG5jE20Hj1/lQjLLpLb
 XkoA==
X-Gm-Message-State: AO0yUKUia+W0CgN7o3FT8tZgxFX3XEBsIuzMrVUgNC4dVnk4twKHQ4kD
 vDd8XAdvHF1+NCA7EiMGAVnowQ==
X-Google-Smtp-Source: AK7set/KRsDcK/zxUA5o+jJRPiuSJzcbAHawtsC9iDyjpBSn2QTjdcP+RmSVBEYfYRqjBTipYJQWyw==
X-Received: by 2002:a05:600c:927:b0:3db:2098:17c0 with SMTP id
 m39-20020a05600c092700b003db209817c0mr965208wmp.29.1675710819068; 
 Mon, 06 Feb 2023 11:13:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a1cf216000000b003dffe312925sm4980723wmc.15.2023.02.06.11.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:13:38 -0800 (PST)
Message-ID: <54cb8869-3d71-367a-0790-323ee0906614@linaro.org>
Date: Mon, 6 Feb 2023 20:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: meson: convert axg pdm to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-4-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-4-jbrunet@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg PDM device to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

