Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B56FBF24
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1758A113A;
	Tue,  9 May 2023 08:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1758A113A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683613031;
	bh=H6MmuSg1QeT1bmVWS8ojx6ulACL+qgnl6BOPSFWJfww=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LUXPtzoI2i/EfDEzosDQv3dGlE8Fsx4DmKTS+HdoB5r6HsX0fcECcEkVgajDA3KZJ
	 sEFypeLfCWZTBxbZLedKZVuIMwbjc5X0mALpz+2gpsAHobu0v9nSaUKob8j6yDI9zG
	 1z2Sbm5stG4eKQ6Xx7M4z5oEaTi03Qe4tvxuqzlM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C61F80548;
	Tue,  9 May 2023 08:16:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30E9DF80549; Tue,  9 May 2023 08:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA894F8053D
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA894F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jKfZU4OZ
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f4b911570so836635066b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 23:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683612953; x=1686204953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvJcSRnUzaGT3dLyK/BLEswfy0TIU9GObB2FGkLqtxU=;
        b=jKfZU4OZMP27eCfHg5X2wsqWUjw5sDq308ydl+/MJCuI6b7j/aGrDZ1Lm8hUF66MNo
         fXvs+E2BvKJ2qQfY+IM8MMlkn7/ipWLpKID/Bo9Xxrv4n6xlsrm36qVESh/Q7RpmOgP9
         Mtsltri6zTfof9V+d/azXYEBCGKKXzjumOow9xUh+pP83E+VxGY/7xJuf2udLzCVUhgP
         4e9TgoXs/CE3y2Et1KWieG35TJlmkJimjlCZWaZFPArotVgQ9ltrWWJWSueOxVB16lF+
         56S3jzIUwfSZR22rHz8uqWp4M6GHuMjPHF+0ZIaRnqVikE1TGZXNTexPIAwdC0OV54VB
         Wr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683612953; x=1686204953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvJcSRnUzaGT3dLyK/BLEswfy0TIU9GObB2FGkLqtxU=;
        b=GuFx5KSmralEOX7FtQFRKbwls3bC1kEfX4uGm1ySvz4NOfE7ZjuV7hLJ5qmhvaogW3
         xrtSXKJGO+k7kRR35/0t3AS0T8WztjUVsOZ5Jc1W7QeFqRO7+xNDXZojqfAMa7t6EILd
         WuLeYikasU8bBbS3+vOoclSzaLzGEJcMTX8CxVksFZmzqg6Z2c0WvTuYJnF2TXAO+7p1
         /a+CyDdyxUjsLnN9LXEs+7MU9EkVCMdsBdbdLypbr7oa22wgOI5ltnK5uXeRy8SiC4k5
         saOKZQN6KMD3J3jGovIqVj8BzGczkVBTn+9ZjwS+3P4X1pIdcilPEe9BtOR0pyiiO1Ob
         Q+MA==
X-Gm-Message-State: AC+VfDzbfo5mg5kTLKJ6KjRv9ekanY5bEC3OoEHZQ2OhVqTxBPttCJbx
	oEjTwxd+NM23GZuno0WmJnmpnA==
X-Google-Smtp-Source: 
 ACHHUZ5CIJTRHkGbt1U7L6E+3/CBYoIMc7dD1VZ77HAxjGuNl+HNtDcuHjk6+G61nvjQi2GnyEo3XQ==
X-Received: by 2002:a17:907:31c7:b0:960:c5fe:a36a with SMTP id
 xf7-20020a17090731c700b00960c5fea36amr10551101ejb.61.1683612952850;
        Mon, 08 May 2023 23:15:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id
 pk25-20020a170906d7b900b00965d9892bafsm891190ejb.111.2023.05.08.23.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:15:52 -0700 (PDT)
Message-ID: <c111c429-81a9-cb38-d5ee-b1051c244aab@linaro.org>
Date: Tue, 9 May 2023 08:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: Add Google Chameleon v3 i2s
 device
Content-Language: en-US
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
References: <20230508113037.137627-1-pan@semihalf.com>
 <20230508113037.137627-4-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508113037.137627-4-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K6XMQIH7OUMS3KL5I7FSXES5HRGPD4PN
X-Message-ID-Hash: K6XMQIH7OUMS3KL5I7FSXES5HRGPD4PN
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6XMQIH7OUMS3KL5I7FSXES5HRGPD4PN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/05/2023 13:30, Paweł Anikiel wrote:
> Add binding for google,chv3-i2s device.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/google,chv3-i2s.yaml       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> new file mode 100644
> index 000000000000..3ce910f44d39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,chv3-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Chameleon v3 I2S device
> +
> +maintainers:
> +  - Paweł Anikiel <pan@semihalf.com>
> +
> +description: |

If there is going to be resend:
Do not need '|' unless you need to preserve formatting.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

