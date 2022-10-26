Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0860E3C8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 16:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E1683C02;
	Wed, 26 Oct 2022 16:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E1683C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666796016;
	bh=COI+eXsxEt+mtdE1CX4ZBpFmdLZ9/EvOHwYXnTdnX4M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzaH5sdN/LNrI2m8p7HAVaYK7K2ip9IXR/YynQj6sjpICgcWInQ0uyVlH61pS31k9
	 0P63jllhihP4ZgdEPP1TBRiXmcbEy7O3Sd/MJxeKqe/FPIruH0tArWyfQVaN2hDIwS
	 rfPZYiX8zSiSFPtGnYv8yGCprzeuanK0xhl2w5xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3EA6F804B4;
	Wed, 26 Oct 2022 16:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA634F80494; Wed, 26 Oct 2022 16:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ED9AF80240
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 16:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ED9AF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MzkwyRDa"
Received: by mail-qk1-x729.google.com with SMTP id s17so10656767qkj.12
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XFsg3VaRlU5pxW1lEeoGciN3HKmsr7ycQpb1StDHLVw=;
 b=MzkwyRDaO5uwuyV/+Bp4E+fFxXDr4H7nfO6+Ud+q4PAz7gED00dODWJLXSB9bRUwse
 oYB/seLhzgYTA5/wyVjpPRTESprDJbZjPTO8ku75xXfW9nWe7keVEmNDGbWLawoGLryd
 VzpB1NCGlEu/gR7OO1A3q30qqFY8rg72mTIA7pNVUaUr+lUUK/UlZcpusg3gWXGcXziP
 LSWZJFjQdILda4SkKdrF/90vwuTYoZUoScqGMTZu9RXdxA2ZPlYzR2CK4k8/tMpoAY4q
 9BajPohCBtDejb1fU8E3DD48mTrxF2ad0vHHVnxclgsMf4Q/SUaY4nNEZ5epceO6Dks9
 1W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XFsg3VaRlU5pxW1lEeoGciN3HKmsr7ycQpb1StDHLVw=;
 b=PODi+fHQQBZyJzY3i4QZQhNFbo0Ltkrmk+4ZGm3lXbZ2tGfEG7R8CIepQU0favItlZ
 70ZkAgBD1N6lQskuicQDhj5dYi9hAZ6J/C9RZXSS3aXaFY5kpltl1Nh9inPBke7o682u
 45JcaNF/EHz799M7nQjYvj0qLFCn3QNtiypsQ+zf9D1cR8uOsq33iyIctUjThOSWTHoS
 zMR4ARKOG1FT/lRVV2CgY+Tpd4HQ5u21NDjSrsfCzXhdkDyNnRMH5S9Qpsgi6EbZiJE8
 T5FIov7LMp2Ta2PlL4BnXpOmStU9vKxa+RGMXpoR1w3mlc3TjkrOW/q9nxsDc9PL7Nyq
 N2kQ==
X-Gm-Message-State: ACrzQf38xgndXoccbf0jYV+TxMMlqksMAzq+T9/RSgmxBsU4ibva86zw
 w9zVf8mbMdEyEdlnpxbevcPNVA==
X-Google-Smtp-Source: AMsMyM43VlfW1crv7c4yz+ryVkPmd6YzMvdZxoS70WyqIwWL8Ks7MzDBd2DCfQtH33HOzeOZ/FPsmg==
X-Received: by 2002:a05:620a:4081:b0:6ee:80ab:25b6 with SMTP id
 f1-20020a05620a408100b006ee80ab25b6mr31494872qko.517.1666795930463; 
 Wed, 26 Oct 2022 07:52:10 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a05622a191900b0035bafecff78sm638447qtc.74.2022.10.26.07.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 07:52:09 -0700 (PDT)
Message-ID: <94b3dda4-5674-8166-f3aa-f3d943e44581@linaro.org>
Date: Wed, 26 Oct 2022 10:52:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: rockchip: i2s-tdm: Add RK3588
 compatible
Content-Language: en-US
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
 <20221025124132.399729-4-frattaroli.nicolas@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025124132.399729-4-frattaroli.nicolas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

On 25/10/2022 08:41, Nicolas Frattaroli wrote:
> This adds the compatible string for the RK3588 SoC.
> 
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

