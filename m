Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AE46A5440
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 09:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0286A828;
	Tue, 28 Feb 2023 09:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0286A828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677572231;
	bh=8uxhqZ97qbsyjWx4FQpofMeMpO7YfbCRQ+0zhtG0odk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nnz84TvAxXRrIyEli3bxuPUY6EeCz+XgGCibI4ptonpA1cQ5xY7SAezRAxb/U0ykj
	 1SuD4zhD3cVqatYu2ihJbj4LPeD6Sc38kDbDrZThffJEEJzw/zIKWYih5XME1PX5e+
	 1Q7AmA11IPeWJCBGZP6nPj+saePjFl4V1h+/pVfY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E77DF8051B;
	Tue, 28 Feb 2023 09:16:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B118F80520; Tue, 28 Feb 2023 09:16:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4BF4F804FE
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 09:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BF4F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qE8sYGAt
Received: by mail-wm1-x333.google.com with SMTP id c18so5784642wmr.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Feb 2023 00:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677572161;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cviph/FMxZ3sdMi+0ZrOaolxsjo4GH8Quc77ocNpkY0=;
        b=qE8sYGAthZOrFTDcEMy5U8Fo7m0Axbzkq+3tFXrH7EKhBorDhGz2Oir0Xr5ht75gOp
         pdPuxO2D7NGcQnoi2UFQ61HTcsK8BxB4iyjZJIFZtr8Q9JqA53SJGHNjDtT3lqkdGiT3
         wG2mozymNG4ZBfB9oMY9DDy1/1ZFKWIgFgSzDBSUnGHdqxAm3qHp4E0bTtVsFKyCod6D
         GFdvCUhYJ2jQwYFkt4cYwFc8iiCY+D1qIT9YV4FbjkrgK1GlBkeSgPTV+rZkkC0uaQsa
         o6R3qcISXbebVz9lYmi6IHooatrtY2rM94qbmbfelHSfya6YF+e77sxI9Lyim1AJo3To
         Mdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677572161;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cviph/FMxZ3sdMi+0ZrOaolxsjo4GH8Quc77ocNpkY0=;
        b=P0BWR430MUfcCDwnfwnv79na27gMmJl1QFksMAt807MFEO/hxJeBaEVMWoBmu5Uzrv
         eK7ZBx1DCNMy7KqRP3IsL7xFKeLg1RX4sFiRqA3w9/53R+BonTYIOgWY9k+yHi2U2sxl
         5k8mN/zvVZOqjbX582d04syfMiI8RvJn41FZODAWp45nNiUjkpoKYZW1GpsvZVA9a4qg
         kwzy/gMFKgBzScOF+4wpM8eNFfIdOMikz4nME6w8Z/7ifoutW6v89KGX96j4AltkpdZR
         gX7rab4wwnCAbJKJE/lNYheTouK4+8zjqPuVNZPu9BwMwr+AOq/eaVDfvw5gKrQLupwv
         tM4g==
X-Gm-Message-State: AO0yUKWAVaSJZUQa4w1KRay25aOq4pY0NVsF3Jbnii5irXTwKpfvmGvM
	+6/fOkT7VRSVP2p3YQvvdOxGJw==
X-Google-Smtp-Source: 
 AK7set9jwhZlPWevBVMtDci9OdBkgjIY3tqQK25NdMSQRBHdkFs0NwTkA6lABch489IP4tUq2XENhA==
X-Received: by 2002:a05:600c:4507:b0:3eb:2b88:a69a with SMTP id
 t7-20020a05600c450700b003eb2b88a69amr1431122wmo.14.1677572161057;
        Tue, 28 Feb 2023 00:16:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c0a1300b003e4326a6d53sm15097914wmp.35.2023.02.28.00.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:16:00 -0800 (PST)
Message-ID: <43fcfda0-f0c9-304a-8d8d-923fa499b60b@linaro.org>
Date: Tue, 28 Feb 2023 09:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: wlf,wm8524: Convert to
 json-schema
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230227091938.1671416-1-chancel.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230227091938.1671416-1-chancel.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XQLILBQF7FZFIJPFQ5UIMRHPGDVSTFW3
X-Message-ID-Hash: XQLILBQF7FZFIJPFQ5UIMRHPGDVSTFW3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQLILBQF7FZFIJPFQ5UIMRHPGDVSTFW3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/02/2023 10:19, Chancel Liu wrote:
> Convert the Wolfson WM8524 24-bit 192KHz Stereo DAC device tree
> binding documentation to json-schema.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/wlf,wm8524.yaml | 40 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8524.txt      | 16 --------
>  2 files changed, 40 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8524.txt
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

