Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCF6C5FCB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 07:36:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F24EC2;
	Thu, 23 Mar 2023 07:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F24EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679553404;
	bh=8R/gKbVwRBvEBSRlPb7bwvqqpHwl2eeN8fMHtrK/2m4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ufwA4OTCuQq8bW99ep2hZlqQbhlx1+xVYqOFMOyqpC9E72prRFWnKyC77yU/IPxPN
	 HtwlKQpURIbqrulvOfr+RWYvRgWHR9ddSjprkWiGedTyjYHjLB1neEPDbskZErMKs3
	 vQHJ5bwJffg9zC9BtvpKmt4lyReEC7tpQkr4FeGs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEFB7F80093;
	Thu, 23 Mar 2023 07:35:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E79F8027B; Thu, 23 Mar 2023 07:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 945D1F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 07:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 945D1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fiVYKJ8W
Received: by mail-ed1-x530.google.com with SMTP id w9so82269470edc.3
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Mar 2023 23:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679553340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8FMzTY6q5btYc/0V6wZVAFqAPO/lou94Wj6pSxpohs=;
        b=fiVYKJ8WFPkbZOS+OaFNF1g8SVtUVsKtYnO8lwtKtBtM/KRGN6mp75f5ff4QMjfDZ8
         3QOZlVoMTIXgyJaDorsrLt7DXPKp4v5vl1/+dzbGgX8arqCozP9krwMMIIWpHyLIsn6N
         xX3d4fEvrv7/cPPqQF2pLs0hgnWV/dASourLzBUg3plt6GZyKZzqtAnhAaidJx+IAliS
         9TI1RRIrfInMo4njmTcxINcJ+eLpSv4gfUJqjlkFfoxBiZLyRqe8gw+yZ8gh2Hnggx7r
         GsdBtD+Jpw/gJxyNvwpRBZEL4DglpNKw2q79kQ+Vkm3oadIEcp5eArI6lsk8ZxO14wJk
         TtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679553340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8FMzTY6q5btYc/0V6wZVAFqAPO/lou94Wj6pSxpohs=;
        b=NzvUMXPuZscr8MJoivj2UYSRK2ldzEyD3wBOZx00Ji0zeOEUu33XtWEzURY3Sa5g64
         MuYHwhwHqO9IemA0zzBgiY1fYzY3I8tDmmoVpXU3rq2sQa4VzEvyMnTQHm1LIccwBjs3
         0u/QsLCSNUmCcVSFFt4WWl0Gce8hSjbnnVMoOemuKtKVBYGtahm6DFConSv/x0fJQwZZ
         K4KCrPZ3vNW/gSNPLWqMSKCGBXmBHhIXBjqCCf+QBDBB6uxZUd2xkc754XxRjXJ68APo
         3dmHpWqvu+7P0wJb4kzPR/+mN5GuKg6xTCwLORSjy+WxOEW8NVaMimogBijugSbc7Pfi
         2CHg==
X-Gm-Message-State: AO0yUKUeSnnk+U3Gt3pGY04YRvpXnx8pfn1QqdTSpn7DuSM6NN+uNU5A
	bzOFWSIgpVuQE3ATjDM0fGh+YA==
X-Google-Smtp-Source: 
 AK7set8eEzWYxNr66Ew154eC20TxMTLywUYnk7e9yySgeanJd+Y6A7RWRyMlYBh41WTjvuXrI+uFLA==
X-Received: by 2002:a17:906:f8db:b0:8b1:7ae8:ba6f with SMTP id
 lh27-20020a170906f8db00b008b17ae8ba6fmr9570962ejb.16.1679553340695;
        Wed, 22 Mar 2023 23:35:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id
 q2-20020a1709066b0200b0092be0d267besm8344890ejr.142.2023.03.22.23.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 23:35:40 -0700 (PDT)
Message-ID: <fc444dbc-2ac2-91b3-42eb-f16e7c1a2ec2@linaro.org>
Date: Thu, 23 Mar 2023 07:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: ak5558: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, daniel.baluta@nxp.com
References: <d1559192-8f6d-26e0-ef19-d14ac7987a74@linaro.org>
 <20230322200949.8986-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322200949.8986-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 54G7QGEPKTWGOC6XEDRM45GH5MA22AUY
X-Message-ID-Hash: 54G7QGEPKTWGOC6XEDRM45GH5MA22AUY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54G7QGEPKTWGOC6XEDRM45GH5MA22AUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/03/2023 21:09, Saalim Quadri wrote:
> Convert the AK5558 ADC audio codec bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

