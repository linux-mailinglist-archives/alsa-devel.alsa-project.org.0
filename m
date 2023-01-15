Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3F66B1CE
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 16:04:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD47521A;
	Sun, 15 Jan 2023 16:03:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD47521A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673795073;
	bh=GtHs0cZyB+6qbwDYFGmBagfem+2W06cJZtCt6JObNsY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=n6uPgCl9E2hJbjrQ9oID4dMaxOyMWNmQILWH0mu70/ejmRbCCKwVAGzdTBJWNIhpW
	 0WfwrmVm9PPOnhrcG1UGrI/MJb4wigHIMKAi1f7k4GuRSwk2avlf9u3l7eVNrUyLmm
	 TiWrdOIw+kKpX6W4CUOUnTu5aS/3ArRICqCgFZ/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93785F804E6;
	Sun, 15 Jan 2023 16:03:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E075F804DE; Sun, 15 Jan 2023 16:03:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F194F801EB
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 16:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F194F801EB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B5YxFiRJ
Received: by mail-ej1-x631.google.com with SMTP id u19so62619883ejm.8
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A8Y0CWmx9pYLYLFHVHz0kb3QWfE3QG43dwg2EVd0xlo=;
 b=B5YxFiRJIsTEWzPd0ZTbV2pXmodWqiMIQ9KGvEH9RI17fOY3c/sA7+pRdyiKlqInWQ
 1ObUB+eBe/lGyRlDoxzP32sFGqoRY9xz+xMMjs3pW4PyIi4pRH97BCpLX3aT8MxNrfvx
 vSLgWoL+FUNxAUyBtbc79kyA17vSw/Upe0w7DjtHQkSpKGYOE29svc7ZoChQU57XJO4A
 rLJQ98vIzuz2Pj6xkP/JQIXCG9HBvAImKP3MBAD+OWgHPlUSgV3h6lcz85udUKhpgyrZ
 D7P8jZQQPpDebiF90i2ah61VnT1UZcdDkJOZH/jC7ZA59kXqWe+wxPiRqm3ijeXRlbTt
 bmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8Y0CWmx9pYLYLFHVHz0kb3QWfE3QG43dwg2EVd0xlo=;
 b=uM5iWu2SB6HRzOInLnRTRfz3PfdWNl+SChkci8CuwdBA1BQeQiNBRUvgbic4M+8C+D
 /mH0R4WT6gJVrQvoAZR7AWSP1F7qvxI2sjsmd1JdLul99Xu/DTi1jV4Br714taAI3GJp
 9F92mHOi2GPjQu7cFsUiXsgM3nc0CrnKIVOw/x+e3VzeyXMqs2fOGAWgKfN8ulXIBgCU
 4pX1UW/hXWI8oRdzivzEL9ANI6Wdz1EKeU8xLQWXXW9qOlxrF2sVssXcp4VYEz3RvEEM
 bW2ba3m9Vu4Kynz8VvO6nTKbtRRfYmi/JKFKJhGVeA2+AwFoueKdi4yKsGPSCa8NZMg0
 ljFw==
X-Gm-Message-State: AFqh2kojd8SAhWnMT6+ipPXLTG0d3sT6CE0St0xzhcsL8U/2bKXP2IHQ
 maSHTwnhfWrAGRcKL6H10u/FGw==
X-Google-Smtp-Source: AMrXdXur5srQnbH6d5PiLlzh3ia+za/Byv1Rojs4GeErYa2lh8pfGuIpTVhphf0I3nAyRehxjhIgbA==
X-Received: by 2002:a17:907:c58c:b0:82c:3642:79b5 with SMTP id
 tr12-20020a170907c58c00b0082c364279b5mr75676376ejc.58.1673795007740; 
 Sun, 15 Jan 2023 07:03:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a1709062a4b00b0073022b796a7sm10926754eje.93.2023.01.15.07.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 07:03:27 -0800 (PST)
Message-ID: <e5cd9794-d8ce-7285-5da2-7f3b6bf8dc2a@linaro.org>
Date: Sun, 15 Jan 2023 16:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/5] ASoC: samsung: i2s: add support for FSD I2S
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121821epcas5p4ebd116d75f12dafeb09391eb6f7a2646@epcas5p4.samsung.com>
 <20230113121749.4657-3-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113121749.4657-3-p.rajanbabu@samsung.com>
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
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> Add support for enabling I2S controller on FSD platform.
> 
> FSD I2S controller is based on Exynos7 I2S controller, supporting
> 2CH playback/capture in I2S mode and 7.1CH playback/capture in TDM
> mode.
> 
> Reported-by: kernel test robot <lkp@intel.com>

Drop. It's for the bugs. Just be sure that the code compiles without W=1
warnings.


> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  sound/soc/samsung/i2s-regs.h |  1 +
>  sound/soc/samsung/i2s.c      | 53 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
Best regards,
Krzysztof

