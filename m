Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B9571404
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 10:10:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F8B215C2;
	Tue, 12 Jul 2022 10:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F8B215C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657613414;
	bh=towodoRuT9zkTst+L3Yiw5ghjDBF29UvP759TaSCuew=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uRyOB4Xk/fe075+29PQhIqo0he/RTQ9uFSUPWLRyHvAK2EKaMZ2wu28PYkqKRlzyn
	 Bj8Wv/8cDFyykoq4xWQSmglzPry1hvsiwWGVkurBEaUVdXXApOo7AJPqcdWlOcsC1Z
	 Tp45rAhDYGrJso6SbIS9e23AYEEQ3NRIK1d9XvGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB081F800E8;
	Tue, 12 Jul 2022 10:09:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA9C9F80246; Tue, 12 Jul 2022 10:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D8BF8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 10:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D8BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OPdG2eSd"
Received: by mail-lf1-x131.google.com with SMTP id bp17so4789716lfb.3
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7hymDGoXZOvT4wo4b8VCjcpQ+XRX3pT8aXtW5HqYY0g=;
 b=OPdG2eSd1GwsQvVoZ0jTUrpcOgCQXXF6v27JsagiYHeJ6mvzzR+Vl2f5DWGBjL0oor
 BzmxvVaVbkSaFHK7xobBT1bo0BsaPnUpw5Qgn0tPbnXqtVtmsvOgknBB1MpPys+RS4Bn
 rfEtTi4GTZNaV/RnyYY+aaIRpyNRrYFu1veoiDQrMvRBmHvqwHy4ilNMbxKtX4JPW9Xk
 A9skPZvL0WP/Ki5yau8/+5P9EUCltbpgLBVm3keFVQxCZ59e121jQM2wCideCjMCucWZ
 spTAHTc6jEIGjfZ1HBwMvzH0MSplaC8m0ZRUeFXmQ7DEecAWRrQRPh7oxT3T1L2dE4mU
 LF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7hymDGoXZOvT4wo4b8VCjcpQ+XRX3pT8aXtW5HqYY0g=;
 b=fB+T2A6gutEtoUl/ytrA4i/Vgm7Opau5z+W4ytQJeejCzpSc6uPWYaNyqc5YaWr0En
 74CG7THcz3DfSjfSmtFU2G98Cm8MrBTZmTEPu569ir0OeZFfocxVqxSD1Vw8poKaOsxY
 j79QtuhrUtKWRrYT+i8t7925jwVEE3FBwUdBzIQbTU3mxQwC+B5D+6QO6uGe3iISI44e
 g8486FsqcHA2iTVhv2Qj8yjQLJYyg4PC2yota6x9QlM/1qqMZlAim0Y69Hp9nrxtoKZi
 ssDWU9biK0ixovmgDtm3z8GxiIKMKqJHiMsTHWTNEMi06qZL49jxLE9Gi6eVsXdGi5iG
 BwjQ==
X-Gm-Message-State: AJIora8GNOWvN6ZnhvU8WOv6fzrStEHwToKVos9P/4V481Eou96cpEMU
 P5pmPf3aspHx05o24s380EUWsA==
X-Google-Smtp-Source: AGRyM1usYq9Y2eMuGje+OHvls6QftNfcJPk9nwgSJbif9bEWrfHigs4mRwSaVpCHRiznM4HZVPSYkg==
X-Received: by 2002:a05:6512:34cd:b0:488:aa53:c104 with SMTP id
 w13-20020a05651234cd00b00488aa53c104mr15231306lfr.517.1657613343057; 
 Tue, 12 Jul 2022 01:09:03 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a19ca0c000000b00488e50527e0sm2026877lfg.112.2022.07.12.01.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 01:09:02 -0700 (PDT)
Message-ID: <b2934014-8048-6c17-e655-bd1be09794bc@linaro.org>
Date: Tue, 12 Jul 2022 10:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/2] dt-bindings: sound: Convert to json-schema
Content-Language: en-US
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com
References: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 11/07/2022 20:30, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch series converts atmel-classd and atmel-pdmic device tree
> bindings to json-schema.
> 
> v1 -> v2:
> - Fix commit formatting.
> - Fix titles in yaml file
> - Removed trivial descriptions
> - Correct formatting errors 
> 
> Ryan Wanner (2):
>   dt-bindings: sound: atmel,classd: Convert to json-schema
>   dt-binding: sound: atmel,pdmic: Convert to json-schema

Use consistent and proper prefix. I think you got such comment before,
right?


Best regards,
Krzysztof
