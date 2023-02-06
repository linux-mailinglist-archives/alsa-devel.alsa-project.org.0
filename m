Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976EA68C67A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D7711C;
	Mon,  6 Feb 2023 20:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D7711C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675710722;
	bh=0Wi/xWrfyelpAy3BhtyAW2AVtlKWMDZL/ONE7HFHQ9Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W/tYt0f/htmSB+RBa55yL67YiS9/uI7Vpc5YBy/AbMje/y+KKV+JrQWUEkOm2Pn3c
	 k2qyXXVW7YlE7PuN8lVMOU+JksOsFn/rpOARm+f4PsKMQOIjoBxAlaSeI9WPJbVIuh
	 RM7EeATA59sR6QqkcEhLd0XmaU1vtJKMu3N17lQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41F65F800E3;
	Mon,  6 Feb 2023 20:11:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFD4F800F5; Mon,  6 Feb 2023 20:11:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F51EF800F5
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F51EF800F5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kFCqpf2J
Received: by mail-wm1-x331.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso9647773wms.4
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BJ35SbYv7NGdql48VXYsLrxi0PK6KgusSlcq8eJhSMU=;
 b=kFCqpf2J9E7tr/qLs0vt5jthfd1kKsH5kNiqeeanBtEGDD7CYpUbZ5H1ONcf27h24Z
 SV/dmPXgho9c1ScWFIYGYP3cCDEoHspFirS+FSQeLxHS0oRE6gV0GCyDVK5NEuufrQoD
 aJ+N3QURBexzVe/QFmteNE/jkL8D2PbHFNCTN6Ms/78nv30Q2bZMS03inIyCkuNTEU2w
 yK6wDEu8j/DOLOSYq5IvLB500bGEBFkMNmDNgryfQDCkYVtxDpHOfXwSPcrclnfgCem7
 kvwoj4ILSQC7fDvY/8wu84saoGffain2ipVRySoeehUsUS5cexd8t+/19rmwWkTLsMIw
 4E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BJ35SbYv7NGdql48VXYsLrxi0PK6KgusSlcq8eJhSMU=;
 b=I6rZ6FutbPrG0rVHVqBsE0UuWl4SZ7BcLSfxxsK9QCOq1AmmCjLkTmLTPTW0RUcSJ4
 LzvyRZIQdpICs4amtD8gduHmMJ63RSvU1TJkuF3Uu9n+3GTKBV6d99c84fYn8Qk8SjTe
 x8r89vXLBXPEEHZoPx+6w5l2ZMdryG0RSS2wPjNihAD+oH5u2jWXCMR+wSCNRTEUqfiS
 mJIjy8piEQ1zb4Jqw0bmbhjan7OLInJ/Jd96VZsE/cDIufFO69/XdwlP0fd/lRfCI2K1
 7bjSdvACnkKBgLjNluo5r0JPBfwUsvEZSA+J/zA0Ac0ypzMANG25h/UUKkEEGX6G6jKg
 lwxw==
X-Gm-Message-State: AO0yUKW+7/jBLeZKrit8zKk6SnJQedmzhtHV50CxgoeA3EjYkYvCRQgo
 DwrwQ4Ju/1x6zXh8ORwlRGwD1Q==
X-Google-Smtp-Source: AK7set/n8vlvMulK6/8IoZIsLl8tl4ERJICO0rXpurEpfoRkJl63bdL+Fskt8n2wb8Pwgoo61c+SwA==
X-Received: by 2002:a05:600c:807:b0:3dc:eaef:c1bb with SMTP id
 k7-20020a05600c080700b003dceaefc1bbmr690356wmp.35.1675710656403; 
 Mon, 06 Feb 2023 11:10:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b003daf681d05dsm12848398wmq.26.2023.02.06.11.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:10:55 -0800 (PST)
Message-ID: <7617f172-e3c7-f60a-f3c2-f02403ec9047@linaro.org>
Date: Mon, 6 Feb 2023 20:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: meson: convert axg tdm
 interface to schema
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-2-jbrunet@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-2-jbrunet@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm interface to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

