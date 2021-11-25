Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ADB45D31B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 03:19:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A82817EC;
	Thu, 25 Nov 2021 03:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A82817EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637806791;
	bh=NWjgRMbTFaDlMLIZ3peUhmZ/EV7zkgLgE5pJqF36AD8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0+SSZb/OMDtN55cI2PVbblAWecnLQ2gPdAEGhUgdZGHFdZhqB6oCCwPaUv9wZ88q
	 DEnsN9lP+icCEdVwrfgZc5zxGcxplNXI8iQYHvlq/Ga8odAJFAGMQ7QohE7qBD56WH
	 /g5OLISGlS3gRGE/zu2/utEfgh/RiCx3C7mMQdik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A930F8007E;
	Thu, 25 Nov 2021 03:18:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33E45F8049E; Thu, 25 Nov 2021 03:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F60DF80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 03:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F60DF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a3PBYNYA"
Received: by mail-lf1-x132.google.com with SMTP id k37so12292436lfv.3
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 18:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oH9Wf/bCoVOg217LfdMoYUSgPjXtU02E7tSuaqxWMRg=;
 b=a3PBYNYAAcgi1TZXNVqrpSjlO4HapMS90v4JQNwRGoxgwyRr74YQB0CVRb//bI41pL
 6pNSCy5wG7I1vVxO0z9X2Bg5gk3NuuvBLRrOotseaFkyLTeiX2JiF1dLA0OeoTcS/RGg
 Q9H3kzbos5THo5yUaeLm4c7P5AkcERHEYQGNRg8veLS/RsNSrvYi+IjN/7ddv7drxn2o
 1N4q1Y+XlljgLGbYigdztD7fpRc6TWrK/QVAUrAI7QL3G19yBsiyBqMEZ4DIG6BERcF1
 o+9jtoDW2zh0WmzYLJeutxGniZY0QYQCfcWyeXtnsD/4Amx8u+tH7pAFRuStmtT4SeV9
 MN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oH9Wf/bCoVOg217LfdMoYUSgPjXtU02E7tSuaqxWMRg=;
 b=bCrMhbXvwgkFRN/dcCYMLB3rNoCP5Wg06kKZuWwrn5HlbrkE3QTAsCVq6VYE3oDrmB
 HcdhFreP2KZ+PJBNao/GvJ2O+M07989W9S4/ARQ0Ybow85n76iuAv6BxlpHfb7noxTFN
 B5/ewmc+JSjfskoZ2tnL4NeczH8hb22Buwtaizf4EAUj5qlN6/QlQhbPiRcjTZgnzqjO
 RQGc5kJD4iYJM21EnFv0HDAWE48wwk5ufIA/rybW2htasR49/JDkBOjTmg+zExtyRo1U
 5Ntg7bK0bAOWwR3sf5PEK5/MO6HU1LHpT7FSGygTyKDHxYYQ/3ghVWDPwSLhNowRGv4D
 QCYw==
X-Gm-Message-State: AOAM532h7yxXXR7wc1R1/nuPNXbBPlCKaMC51gwLDnim6nh4Y4wvPOuR
 oWgOXwkmJgil3xV4Tl+N5x0=
X-Google-Smtp-Source: ABdhPJwQvFDJcTZLyU54104ekq6m0/v4CmZYU+nu8u1y7IOzZ2X7pM5sbP+It5lOSDCeG4E2gRSy9A==
X-Received: by 2002:a05:6512:3d8d:: with SMTP id
 k13mr19266189lfv.672.1637806700554; 
 Wed, 24 Nov 2021 18:18:20 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id 27sm135095lft.299.2021.11.24.18.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 18:18:20 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia, tegra-audio: Convert multiple
 txt bindings to yaml
To: David Heidelberg <david@ixit.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20211025171927.92332-1-david@ixit.cz>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <49fd57aa-05a1-b330-6684-31c80339e56d@gmail.com>
Date: Thu, 25 Nov 2021 05:18:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211025171927.92332-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ~okias/devicetree@lists.sr.ht,
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

25.10.2021 20:19, David Heidelberg пишет:
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-alc5632(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-alc5632
> +      - items:
> +          - enum:
> +              - nvidia,tegra-audio-max98090-nyan-big
> +              - nvidia,tegra-audio-max98090-nyan-blaze
> +          - const: nvidia,tegra-audio-max98090-nyan
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-max98090(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt56(39|40)(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5640
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt5677(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5677
> +      - items:
> +          - enum:
> +              - toradex,tegra-audio-sgtl5000-apalis_t30
> +              - toradex,tegra-audio-sgtl5000-colibri_t30
> +              - toradex,tegra-audio-sgtl5000-apalis_tk1
> +          - const: nvidia,tegra-audio-sgtl5000
> +      - const: nvidia,tegra-audio-trimslice
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm8753(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm8753
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-(plutux|wm8903(-[a-z0-9])+)'
> +          - const: nvidia,tegra-audio-wm8903
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm9712(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm9712
> +

I'm now wondering whether these patterns need to have the end of string
"$" mark, for completeness.
