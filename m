Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0546F5BEA0D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 17:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9CA8868;
	Tue, 20 Sep 2022 17:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9CA8868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663687390;
	bh=e/YhAeMbEKgp9/dNlUBpqp2zCdZ0f2TXkbvafQmiQTA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFM7XVpCgOhPI29HtmSqTsEZXTFfkW3wYVF9NDuIIENC78hA1hqkxIUfUfSKtN6m6
	 LhTgsWcgBymcdrXFmOifBpiJeHe+AeCerIG0dScM38n5Zyg7N0r1TbwVTOsuQcxlvI
	 wvELrMvGTg6Bhw+ijbHeZ6DgVQLsrLQ4NgXK1gV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F87F800C9;
	Tue, 20 Sep 2022 17:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65294F800C9; Tue, 20 Sep 2022 17:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4670CF800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 17:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4670CF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HqKMxcrj"
Received: by mail-lf1-x130.google.com with SMTP id a8so4309771lff.13
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=hSS8hZshzPQM7bKXdGBe15EwLhR6arnq8mg1ZOh26co=;
 b=HqKMxcrjmQgvmBArxWLXMov4qsLoUjEmo+F5NlCCQpXfs4nK+kxMzmVfrQSi22nvzP
 wkKoGTtYnbCUy/NJGbZ8Mb7JJTNOuWqVPPma2C8MVChh7RTLUd5HjrcQeU2zIgG+h5hk
 K2fUec4NKM5tZ/LmljUtpo7vOz2X74Kefa6LPgKLypyhGeZIKtdN3ONg8xBzxYYHzEJh
 jRjQwNPrmdl/FjiaNyLeMTJW8UB1qo7Al/CnKwI+HJTMKcDqVyxNCGOkZz0IbRKmKuUy
 LSmkg8TFIxYzM2nMfr146z6MSyn62+nYqPa189CtmUSQ3w3tErukj1tBu6LdUHrbpu9l
 HxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hSS8hZshzPQM7bKXdGBe15EwLhR6arnq8mg1ZOh26co=;
 b=R+GkhUVlxc+/KlESCvBwGFqEt7dsPD6aVhV88xqVfYiIhaMeKbtjXneKFcizFH3123
 4zxWixFCH/XJHzw01s7YWYQc4Kpjqcs9Gf3zbVFVHKxyVdqbXTQlWSKOLGgxQY0tfVGX
 IOp0kluBMUk40D/NHpYCkZ1ZQ7ZIaYb9BnaSodsjMHa6BisMH3GziU63cWPkLbC4I0rt
 vLc0dTrVctnoVKfTzMbrLX83Yfu7NYHBm6nPEFXvUS3yIzY0zFyz//uJB5ob8G63Bp0p
 QQUB4IOBqJ8k6Cym6miJOWdNOK61D9ownaMxMAQ2siVlv43OGeQH8C9toF7rAmM1307E
 nAUA==
X-Gm-Message-State: ACrzQf1yZjw3NAV4GJA6MYN+SD+qKS9rkipU8nbPJkaX5aaikO6LyNae
 Js+DSY+lIPrYxGIga4Eu5sWUWg==
X-Google-Smtp-Source: AMsMyM5zX2QPmcPmITCvmQPq4MBVkTkHJ2/ihJzeJd1GKB6ewnD6ddxAj9mA/GIDchxb+d+XTZW8rg==
X-Received: by 2002:a05:6512:2987:b0:496:ae22:9147 with SMTP id
 du7-20020a056512298700b00496ae229147mr8137432lfb.97.1663687323270; 
 Tue, 20 Sep 2022 08:22:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b0048b1b2233ddsm9789lfb.120.2022.09.20.08.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 08:22:02 -0700 (PDT)
Message-ID: <27cc7d38-cb7c-9a36-972c-49326a54ca57@linaro.org>
Date: Tue, 20 Sep 2022 17:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: sound: ti,ts3a227e: convert to yaml
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
References: <20220919111258.3774-1-astrid.rost@axis.com>
 <20220919111258.3774-2-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919111258.3774-2-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org, Astrid Rost <astridr@axis.com>
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

On 19/09/2022 13:12, Astrid Rost wrote:
> Convert from ts3a227e.txt to yaml.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
