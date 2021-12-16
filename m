Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F2477702
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 17:08:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B26B2826;
	Thu, 16 Dec 2021 17:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B26B2826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639670917;
	bh=hSwtpolgOWceICt9Kj6aKbdsDZon48or/6i8J/IlCag=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QSkS4Us/imiJaLIwwFgPezeD909yG2N9oug+LE/d5u3xP5Lg8MLx7ydDeQt6SMwNq
	 mbF+9f+UH4RK+s7NXn8G93+ajAisSXUrZwttfOKjTciOk+7F/EgHx6lUnGsO3Pe9n3
	 gjzknSan8jmKvbCuaeymNf/YCcDc4UBkCPtK793Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED18AF8015B;
	Thu, 16 Dec 2021 17:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5325DF8014C; Thu, 16 Dec 2021 17:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAC82F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 17:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAC82F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mO/bNRXG"
Received: by mail-lj1-x234.google.com with SMTP id u22so39207331lju.7
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 08:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cOgP4Q0MS5pImnSQTIGont9oTNeBxvtKf955mAYz/RY=;
 b=mO/bNRXG0+RTO/ybItEyiIbpQWytEzVeRh2Q/4MI2VNIf+DrwqW48H/aDySegPjs3x
 huP3hgeW2fpFiA2AaY9q2shAY9gvbXD/u1CcL3XtxsOPeiLXBPk+TWXooQOFpDXZHciS
 edoV4uDO9Uxj1n8UJAQm+5r6HEJQEOzjVCy0VQMicthuIfae7pClMTRtWk671AJmbL6a
 JXmA+8Eev6+yLJKccJLQ49XBq8N+MgAxeu8+pp569+tseQwtJrB0vE6IiWx/NPwYowmV
 B5q7JTzoxDIHaAMF09bGdRvPHiegBScXqe5HnWvGPiZnc/Cq6G62k0Td/bxJT4fEdVQa
 p9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cOgP4Q0MS5pImnSQTIGont9oTNeBxvtKf955mAYz/RY=;
 b=Upyl3odBK1W9KIwG6XY4NK8S10M9/coe30PA0kR/nLcFN83ZOd0gukj8Xi/fSMnBg0
 Al3WwXZ85gzg3jZ5mb5zMr51uX1OYtVrocpYiIolEwq8nlnwLozElkXS5FIjecdPMxDf
 1Ovk5iUTatZORH1JbGM5CdH51fo8d96THZjYJ0b0SoZwfA3DJ9COee4G/dixhSHBjI8U
 eHHprXzJQDW1Og5D8S2hCmfooSeaSIeK7TJRTnJNCUyUP4Zdd+6Wwy+BUK5Z0cvwa0ya
 r2rv2WHwJ4BQXjnm+EMa+7qYtmo/cVadlnhzt4ikindpkZN7hrlubcv3InzQ6iEmIh6x
 peqQ==
X-Gm-Message-State: AOAM532qHUbYRn1ijElIpdjxj34Qt7NV1ItSTcWT8SmZsH2OCDNXcH37
 t2EuU8D8WbgM1wuI9ZhBQFxKh+OPSig=
X-Google-Smtp-Source: ABdhPJyKZHnVDuXQoo4x5waxnM20Tpj5I+Lw2AfKI8XqZCi/GZbnt/+slbF1J3HFIj/PcvtGiqfuXQ==
X-Received: by 2002:a2e:a409:: with SMTP id p9mr15940699ljn.412.1639670840394; 
 Thu, 16 Dec 2021 08:07:20 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id f19sm934794lfm.119.2021.12.16.08.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:07:20 -0800 (PST)
Subject: Re: [PATCH v1] dt-bindings: sound: tegra-audio-rt5677: Correct example
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 David Heidelberg <david@ixit.cz>, Rob Herring <robh+dt@kernel.org>
References: <20211216160229.17049-1-digetx@gmail.com>
Message-ID: <df97dc4f-175f-738b-1670-303113dd58c7@gmail.com>
Date: Thu, 16 Dec 2021 19:07:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216160229.17049-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

16.12.2021 19:02, Dmitry Osipenko пишет:
> Remove non-existent properties from the example of the binding. These
> properties were borrower from the old txt binding, but they were never
> used in practice and aren't documented in the new binding. They aren't
> reported by the binding checker because dtschema needs extra patch that
> hasn't been upstreamed yet to make unevaluatedProperties work properly.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml   | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
> index 03ff691c26c8..a49997d6028b 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
> @@ -92,9 +92,6 @@ examples:
>          nvidia,audio-codec = <&rt5677>;
>  
>          nvidia,hp-det-gpios = <&gpio 143 0>;
> -        nvidia,mic-present-gpios = <&gpio 132 1>;
> -        nvidia,hp-en-gpios = <&rt5677 1 0>;
> -        nvidia,dmic-clk-en-gpios = <&rt5677 2 1>;
>  
>          clocks = <&clk 216>,
>                   <&clk 217>,
> 

Interestingly, I can't find any Tegra device-tree that uses this rt5677
binding. Maybe we should remove it?
