Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9406CBCC8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 12:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2AE01F1;
	Tue, 28 Mar 2023 12:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2AE01F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680000354;
	bh=iiwE/MLE8yaC9A2Hc5BLGx067fT4bKugK8ofwZtKTE4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I2/KEYgNuFaADRDBgRFp1+ot85jlrsb14Ng1XeoFkQiySOS6W+PoZmooaC3iywKy6
	 XDtXWuVv4uPVU8nxSDPDGN0IOFvXvq5AA3MdZiSzkQleOPaRNV7BXWxOiq8rRT/OMM
	 VJLrpV3j1liMWQoRp8xHfm9nt8NsS/MoJcRg+oX4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB64AF8024E;
	Tue, 28 Mar 2023 12:45:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3E07F80272; Tue, 28 Mar 2023 12:45:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB590F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 12:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB590F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PkDhtt59
Received: by mail-ed1-x536.google.com with SMTP id w9so47784109edc.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 03:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680000295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3Nwzai/k+t3Bul1ZLhEZGrjjWzVfoUwvHmHLjUTkxA=;
        b=PkDhtt59JduMICfvcc86YjyVfuyxjuEmbr/2N9n+/bmJd7FbM4X73NFWCKtEKv5mmI
         QvKzla9utcval07ZW5WHjv8fCpddLfbEqBKK3aO6lvTD0fn78c1odj0ij5cUnfhMcseE
         gje40mGTziiDZ20jEzoU+YUo82qQ6r5+WSmSco72Wcu/vLfBGRbpzETVCj/5xK/xmNZi
         L/qkNW+YQDWta+dGGbRmmDcFQjqJvq6qmApkE+VGsqPrW3wXGfJRXa/g5GLArGsc7SlE
         NLTHYPWb1BmG4kI5LsvF/0wYMQ5yPjZxIY6IjhkQp6uUVXJdicRB92qL6MEEgm0mxqhF
         IOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680000295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3Nwzai/k+t3Bul1ZLhEZGrjjWzVfoUwvHmHLjUTkxA=;
        b=8HJDzJMikU1s9KM/ns4pVRYV+WcSVlSrFaON4JtLAyNgClK9lml8yYWpNOD36K6oUM
         gIomjAph6u4ozICcT2GNs3ooPuqmKL1F3o2dVcjBi9oc4mrUG08mP5vdjSxkJEaEmu2/
         LpiEkhm/9952edjLHeSuE74eS0N76e58o0t+4t3jfzhOIqOEKJMJepvJUD/FKO5Qhe+e
         ZjUejxmCUwC6EqZ+B2qfHXkcQJlQ00bJ1spe97lbJrigQHnsVEIA5/3Bkp/QTUD2n2N3
         pPHQqlHbJDzYfQddOGQJgf7fGZB0SIZrI/qP4cJGyOha1F9rGJFNusSpYAsJkuEwQgH3
         ojxA==
X-Gm-Message-State: AAQBX9f2sgAaxbpfGe2JV2yAI5Bqwkid7u1I3xDAHXovxW9wesdz7KoH
	j2DzvA4Rp33teGN9z6YKYFCNMw==
X-Google-Smtp-Source: 
 AKy350ZiRVpB+l55R6+jIJtxAvh9aWVefXU7IEU13jrFin0zF8M8n7+gPJaEED5hSZeW2QNN+srzeg==
X-Received: by 2002:a17:906:3988:b0:8b0:f277:5cde with SMTP id
 h8-20020a170906398800b008b0f2775cdemr15490744eje.32.1680000295707;
        Tue, 28 Mar 2023 03:44:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 be8-20020a1709070a4800b0093f822321fesm4085544ejc.137.2023.03.28.03.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 03:44:55 -0700 (PDT)
Message-ID: <7554941f-0b90-5cef-48e4-eda12ef92674@linaro.org>
Date: Tue, 28 Mar 2023 12:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5] ASoC: dt-bindings: ak4458: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, broonie@kernel.org,
 daniel.baluta@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, shengjiu.wang@nxp.com
References: <20230328091831.55690-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328091831.55690-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R426FFKQIMFMNKBESYS55WZ5GKLIIEYE
X-Message-ID-Hash: R426FFKQIMFMNKBESYS55WZ5GKLIIEYE
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R426FFKQIMFMNKBESYS55WZ5GKLIIEYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2023 11:18, Saalim Quadri wrote:
> Convert the AK4458 audio DAC bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
> Changes:
> V1 -> V2: Use the correct way for dsd-path property
>           Drop ak4458 label form example
> V2 -> V3: ak4458 is the only one that does not support dsd-path, so we
>           do not require to define an array
> V3 -> V4: Add back dsd-path property description
> V4 -> V5: Fix yaml format as per example-schema

Although I did not ask to send a new version, but if you did it, then
you must include my tag. Standard boiler plate below:

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

