Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36AE5612DB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 09:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D1682E;
	Thu, 30 Jun 2022 09:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D1682E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656572486;
	bh=Ou8UxKXrC7AJz525F6FN0gQLMIiOy7URL8F2d12AQWo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lmlnb2rCiBgm/6alrazRGuoIUtma6FV8Gs/aiVdiBzJHAW4spZtAs/0eALVIQoPt4
	 tMBbxETNt7Z6JH97+nvokbWVj7s29DRcnakvs3jTHj75KosRSXTCvY8lt4rTlQua9u
	 gU0JPE4AMFD8NByV96fvVsZkUsTR95Ww9KCWdev8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B07A8F804DA;
	Thu, 30 Jun 2022 09:00:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7990F804D8; Thu, 30 Jun 2022 09:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68B54F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 09:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B54F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="v0EeWU8E"
Received: by mail-ej1-x62d.google.com with SMTP id ay16so37110144ejb.6
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 00:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r6uCmFRitcAcRJI/H5P66MBQjDkhl2NiZLnGLT9y1H8=;
 b=v0EeWU8EO4ppWz/+OhslLQimyA4SEA+VJEVL1kvXnbFjSvW8mo31GHtcxqoF4OEYSC
 Qf3kZOohwoCkTOSjzNiBJCXCZPCGuDJOlW4GdDLGFgPbBlUcGDGpbOYkITuSQ01PuoF4
 k3CR5TP3TVBZI3Pz0jABdIBbRuKH0JZnVIWPN3/Adh1m+VGPvohIUDh/epdfTjrXDtC6
 mKJz4kpAetfqgmU4FmU3HaVZjbitYNsWFVfhmBGtL9ZmcHjzumR/BAHOVq4R8/iYF82d
 c5s2piBZ0PJ62vIlDi7F/gh8IZJ452kthNPFVlgSgJqsZ4H1ICe1iYyULPslGEfprzDe
 gJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r6uCmFRitcAcRJI/H5P66MBQjDkhl2NiZLnGLT9y1H8=;
 b=AmudTscbk2witrBim8EUMM8fezCL/r5iHKmfNsijiOu4MnFkkyMEqxPBfxmgQQoNIs
 0d9ntq2DRacB9Asw0+v64itPeGMIeOfgcfXeq7erThitgLtTp8PM9kkdarstJd3AZR3W
 OgzDm1EHn8zdN4rhEP6FGOgc149zzOaQGvCrqSgehd+WnAwqel5kKyyjEYJ8uCKObsUc
 27vH++6lWFL9ir/DG0SjEb0Pd5ID6HoabBRkffbaYYONacjpH4lYLMsLaQw1fiKkhLWg
 YhrakzYbiOXnM70REjq1TR+2QfAx1XyLYwmiTMVdx938mq926w4JomaTfkBnUoYgAiqD
 t26A==
X-Gm-Message-State: AJIora+twEQGgAQx8Mw7UE6GTYmSWCsQPGMlAT7+emibzTH4tYCeQ8E5
 dWf+oYmm6n+GVYIer441cOJYcQ==
X-Google-Smtp-Source: AGRyM1tDY2nkZypAnZWoTW20KgzJCRPt2W3F9vTeZn7uUeKvjjX9GMEPJDY9RlYCs4qwnDq5NL4NzQ==
X-Received: by 2002:a17:907:1c09:b0:726:b834:1a21 with SMTP id
 nc9-20020a1709071c0900b00726b8341a21mr7356139ejc.518.1656572416273; 
 Thu, 30 Jun 2022 00:00:16 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v26-20020a170906489a00b00705f6dab05bsm8676238ejq.183.2022.06.30.00.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 00:00:15 -0700 (PDT)
Message-ID: <63d495de-588b-0568-a4d6-31e24ef50377@linaro.org>
Date: Thu, 30 Jun 2022 09:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: samsung: change neo1973_audio from a global to
 static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, s.nawrocki@samsung.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, arnd@arndb.de
References: <20220629201811.2537853-1-trix@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629201811.2537853-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 29/06/2022 22:18, Tom Rix wrote:
> sparse reports
> sound/soc/samsung/neo1973_wm8753.c:347:24: warning: symbol 'neo1973_audio' was not declared. Should it be static?
> 
> neo1973_audio is only used in neo1973_wm8753.c, so it's
> storage class specifier should be static.
> 
> Fixes: e26a2abcc246 ("ASoC: samsung: neo1973: turn into platform driver")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---

Compile testing works!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
