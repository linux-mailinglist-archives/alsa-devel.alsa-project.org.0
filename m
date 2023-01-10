Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F4663B94
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:46:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E1FD7BB;
	Tue, 10 Jan 2023 09:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E1FD7BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673340365;
	bh=TAaAXJSemXt0Gx9jJS9gF3vg/psC5t6amgkArQOx6OE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hsT2vXVK1NZAyWdYt6Lzs1+XoDKX6hzI4oPqpn7V5MFf2URUyohQwzVrR6y/pxs7M
	 rr71VOR69ijLdT23mnYCLDP+kpx/xBlQIwYNdSPGEPy5MQ6cuYsJFzB+EtBDGyq7GI
	 U/y9tsGLzUdcyn1lYEixr9UERCJwrImKAGif98wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA4BF8026A;
	Tue, 10 Jan 2023 09:45:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDFEEF804C1; Tue, 10 Jan 2023 09:45:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD9ADF8026A
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 09:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD9ADF8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uALzNial
Received: by mail-wr1-x429.google.com with SMTP id t5so6516910wrq.1
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 00:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3nhalakForWLq/BpHz4s5xQNDs64Epq6wJvSqVishPM=;
 b=uALzNialZgr8wwwci5b4iFEDY3qvdfFZaiMcOqwbtJlbsZAbvKl73tT0WSmmrnpCYw
 2VmlXimyUZMpg5LSlN5CadKHjNCSrYUvuipdJS/M6QQHEsYHDFAVwBFwDIwNMTnekv2O
 L8FHDJBtHzOSk2o96VGTpYroLdFENaYwZ94M9KHisZkLlZU7iowpbF9Ex4crJFtt+7KB
 CN9niLyTHQhXgObh0khQdnnb+QUOwdyvA0EUBjb/091q8T9qcc6EbR8hKpMTpdTZNqq2
 ra1+musbKmt2DQxT3iRP7gVyW3tUPdfxlFuu11eLXkDGHyAxh3W76CIkZ+CNsf49thy7
 TOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nhalakForWLq/BpHz4s5xQNDs64Epq6wJvSqVishPM=;
 b=UR4v0ypz92No2RSbNOvo5QecBZr1sbftRcZcaZ73hsZy+C1SmrJu1s9IpifqnRBz1l
 CkEVeRN7aXWuYkSVeqIHbthKBD2vTtrJy5mW4gYGdaH1UTEQtwLbYryxuTo0qWh7jbCA
 illi2/NwEK6xJJc/c9iIFlJ52An3iBL9NT8zBOfiHy2L3hwWYrirNe1EYaOTkEHyjXkD
 qPF2oG7wGAIwpeA+kw2K31z5zKfP76tsMlMaXaCq3F8UmLNYIRXGbtYtovgTe4kDgiVi
 1pC1/r+H7ZPMyNCHz9Z0gpePkZLhVUWC9rOMgCTqqvXxJ5NlS1mTKZvuTCvz5id6+xaK
 WcYg==
X-Gm-Message-State: AFqh2krDM5kZa9+DrKz/v4c6oRVTpnKZiC6I9O/0WPNeCC34iVITNX3/
 ZRsNmoFxS13Xmv2GEqDBiwr48g==
X-Google-Smtp-Source: AMrXdXulnkGqYk+DJ+tLAOVP3aPTbM+3YrOEXeaSdxC8EXrMCyDK3H0xlqDMHPCf0sA7EDuEPNGceg==
X-Received: by 2002:a5d:56c1:0:b0:288:d139:3690 with SMTP id
 m1-20020a5d56c1000000b00288d1393690mr28887704wrw.67.1673340304041; 
 Tue, 10 Jan 2023 00:45:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adff94e000000b002b065272da2sm10478381wrr.13.2023.01.10.00.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:45:03 -0800 (PST)
Message-ID: <cf65926c-d2c1-f1bc-6e27-f07611a5cce8@linaro.org>
Date: Tue, 10 Jan 2023 09:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Document
 simple-audio-card,plat
Content-Language: en-US
To: Mohammad Faiz Abbas Rizvi <faiz.abbas@arm.com>,
 Rob Herring <robh@kernel.org>
References: <20230105160346.29018-1-faiz.abbas@arm.com>
 <20230108163741.GA30997-robh@kernel.org>
 <f0ad7a4e-a8af-77d4-09e4-3717041677e7@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f0ad7a4e-a8af-77d4-09e4-3717041677e7@arm.com>
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
 kuninori.morimoto.gx@renesas.com, Deepak.Pandey@arm.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/01/2023 09:23, Mohammad Faiz Abbas Rizvi wrote:
> Hi Rob,

(...)

> 
> Thanks,
> 
> Faiz
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

Please fix your mail setup. We cannot work in upstream/LKML with
confidential emails. Since I was not a intended recipient (I don't know
who is), then I should start removing your emails?

Best regards,
Krzysztof

