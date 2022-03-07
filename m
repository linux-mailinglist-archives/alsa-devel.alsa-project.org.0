Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF824D073B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 20:06:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06BAB1749;
	Mon,  7 Mar 2022 20:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06BAB1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646680007;
	bh=13rqJlUjCRuPMuxaGEWe4SNEPEFq8Kb2ITdL1p1yv0Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Io0Z0bQIdiKWfHqcpPKDCj7iyDdtos8njOiUc9Ckjq997iVXyFahYxAIGaNroPS2r
	 4DZCfBJmzPIUuRlo2BuF4zEbb2m7wITu9wJUhSXO2YzpxinvNgz3ZcVFDdDJ+MBaNj
	 UPoZKJMrGhvJEBCGhd297Byg6vgt4/h5I2VxeSdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66149F80159;
	Mon,  7 Mar 2022 20:05:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10879F8013F; Mon,  7 Mar 2022 20:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4827CF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 20:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4827CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ETWPDv5W"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 47E203F605
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646679921;
 bh=QWsOEJGQTvGYoXGyvS888p4a2khm68f4hn/XfD0htMc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ETWPDv5W3PyPPxol60CCa6adHNxluQSgMWtUnqyGhPnFlg0Nvi0aObrTfzUUlIuYH
 k3uSet0kduoz8d8jWhqtfE5wz1/jpixC9B+h0F0LcKSIBXfWX/AEGXWHgt78k4XQgH
 aGwA4u/7+sC205SYuz3M+XX9yaAtaJe7G9GVx0tKbmBgAkSMUu3MfeOS2PpXmOoGzw
 7up1twsmQQWGRl7gtJ7A8x1fWeJOoD1YO9YQIXPeEE/bMbq2C50IkYG1KFDQWB9DGN
 ZujSEXHI3j7ye1jWn5hkEqPo36XfQfcUKvp98NkyXMYilPRAPTLcZ/7KijON6Iz0Dw
 7cDr4jbEwFCDA==
Received: by mail-ed1-f72.google.com with SMTP id
 u28-20020a50d51c000000b004159ffb8f24so9192950edi.4
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 11:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QWsOEJGQTvGYoXGyvS888p4a2khm68f4hn/XfD0htMc=;
 b=nN3v8YAzu5Mv1r0THXnoOPTbGC4ouiM9UvLyhZxrVHLtYY6OTh7FxltRbJBSsrot0k
 gdyxlqI6eknXiVyZA26HO/m0sd9ucVV8urbeY/5DbYbPhn+hF6hCIotNskgJmIvaM4OE
 hZuzbn5Y3JC25y7MRvFuM0kr8t8ctCaEmrGZ3tzfVAo5sGs8/JTZpXWTI5x89YS7d8QU
 pTg72TkbN/ITM8T6VQVIBWTdADs36Wn5YXKIDYhyvfdLBmJEsSVccbq7HDsJHrANlc+Z
 Z2SKH13+Ndv1FDH9TsOZ8S5iQxQfMekb9NE27Koa/bcjuQBR1BnWlTfZu0svwXVTVirl
 mUBw==
X-Gm-Message-State: AOAM530A6bjETc//Xx42EwBJIK607fC/APjgJva/FxcvTjrCevEWUjMs
 jzKfcHwNguHPxr20dz0mfw4nlsge3M9tyj0S4h++yfdV/VKOCUsHw1NwvvicerB++MJbc8Jmsax
 IVolHvSls2UkhJj3jh1zsWNS1yCvHo7vulX6jkUVi
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr10459588ejc.132.1646679920953; 
 Mon, 07 Mar 2022 11:05:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyN0g0OSLGsRnPf1kRRnBUK5x+6sKF/QCqmI95yBIUFncnGeYZVE8vPiyRQJceikpOJJA+6Q==
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr10459566ejc.132.1646679920623; 
 Mon, 07 Mar 2022 11:05:20 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 go18-20020a1709070d9200b006d650ff4b26sm4995906ejc.209.2022.03.07.11.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 11:05:20 -0800 (PST)
Message-ID: <7dedd97f-db81-4e72-861b-cf342170b65d@canonical.com>
Date: Mon, 7 Mar 2022 20:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/6] ASoC: dt-bindings: Document Microchip's PDMC
Content-Language: en-US
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
 <20220307122202.2251639-3-codrin.ciubotariu@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307122202.2251639-3-codrin.ciubotariu@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

On 07/03/2022 13:21, Codrin Ciubotariu wrote:
> Add DT bindings for the new Microchip PDMC embedded in sama7g5 SoCs.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> 
> Changes in v3:
>  - set line length to 80 characters long
>  - set 'reg' as the second property
> 
> Changes in v2:
>  - renamed patch from 'ASoC: add DT bindings for Microchip PDMC' to
>    'ASoC: dt-bindings: Document Microchip's PDMC';
>  - renamed yaml file from 'mchp,pdmc.yaml' to 'microchip,pdmc.yaml';
>  - used imperative mode in commit description;
>  - renamed mchp,pdmc.h to microchip,pdmc.h;
>  - fixed 'title' to represent HW;
>  - made 'compatible' first property;
>  - s/microhpone/microphone
>  - none name in example set to 'sound'
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
