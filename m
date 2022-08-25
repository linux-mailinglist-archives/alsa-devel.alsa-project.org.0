Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4295A08B0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 08:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA664822;
	Thu, 25 Aug 2022 08:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA664822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661408098;
	bh=V3vfxD7MZ5NVFVBPS6eY1FKllZmr0d6+M5d4CHsZ7aA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fzKadXr9yvjR6RQY8M8ELTjO6Oe1hn+MOjbvMflt8ggIwDvfrZCDu+nBR7t/erj6d
	 c1BnI4rRHHze75OCESuoIQVkeGOrSB+pFd+SEeBEs5W7K9W8KjmB8se0MSS/I/WopA
	 yJ62iS3dTS0vRDy3BRFRITvzlsmw8Hsa3wCsH/H8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FF72F80271;
	Thu, 25 Aug 2022 08:13:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 847EBF8025A; Thu, 25 Aug 2022 08:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9AFDF8014B
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 08:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9AFDF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UPsydeRD"
Received: by mail-lf1-x132.google.com with SMTP id z6so26869970lfu.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 23:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=wlxyyEdyz9YeaP+PKKdOU9ZrYBY0DMAseQm1V42ntwY=;
 b=UPsydeRD7QmyNX/kxeY7lnbMw8ie0nb0OcFrbQmJnaxJ6xd8fOfUaQYv1HClHxFWY9
 6Rnsl+fo0GzF/eGP/wAUkgjfz+5e6Bx6m/c6XN2xIHnuTh2E4N+99ZRmtffu7EpXPqKE
 WZGM2MQLyqUebHOwjMVTRo+BE4arXXFGOiuMkk9LQ3cj8tyKygNyMACti9WBehBXcR3G
 nyoCzs12K4eFrNEz0BLTAQJ3vkgKE5f/52AVZ6Cy+ttumgSp+GTUMbaa46OZbmn5KPF+
 l/8cCWewOQG7ojKLIJoDQPjT1CP44wbuyX12WzJm39iXkLkuYfIwiP7HFNix/58PLeNS
 8a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=wlxyyEdyz9YeaP+PKKdOU9ZrYBY0DMAseQm1V42ntwY=;
 b=ptChZYnX+ad2KcenwapTIWZHSh/s9aKQChdf0/8TT0C9Tk+K9//NhhS1aadjkJBTDs
 IArCbc28kz6MzCPynBzwEBO5L25y87Yoa/m/JcKriEn/LiDexu0AZhkCr0MLKVrUENof
 qCTOarwvfs0cvG8XAKzJgW5Kfr2DwwGv+TDwrt7L8U1ZaL24cItmCEU1vs7o9mVh2rYw
 uAOEdwcy1t7T8t5OPBoAIS9OAXKhJExgR9CuW/rwJpAwLErQPYhrqMXnJFwloC++zWcY
 gh2eASnVFCUP0kYCm1NGxcS6VrjhN4dN+pYnkoTIeTWxRTIhEqpu4TjAXcLECMLKGHPi
 VXNQ==
X-Gm-Message-State: ACgBeo0H6E3tqEMHpPqUvAeIW+cbfcePeni/r2FACopoh+zRRPetvNvk
 7kKr5abWC7l/5tkAofOmmG9EmQ==
X-Google-Smtp-Source: AA6agR7UqmyD7JRBfuRRmBmdO0IXT/oW/WrgCHd1/0DNqYVZ+wtbYs/xMKgsSXJIPZ4+fxXOwAvASw==
X-Received: by 2002:a05:6512:3a90:b0:48a:fcf6:3137 with SMTP id
 q16-20020a0565123a9000b0048afcf63137mr605815lfu.255.1661408027387; 
 Wed, 24 Aug 2022 23:13:47 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 f17-20020ac25091000000b0048a8586293asm323218lfm.48.2022.08.24.23.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:13:46 -0700 (PDT)
Message-ID: <b906210e-6857-82bf-755b-760e33d3a338@linaro.org>
Date: Thu, 25 Aug 2022 09:13:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
 <20220824160715.95779-2-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824160715.95779-2-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
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

On 24/08/2022 19:07, Martin Povišer wrote:
> Add binding schema for MCA I2S transceiver found on Apple M1 and other
> chips.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
