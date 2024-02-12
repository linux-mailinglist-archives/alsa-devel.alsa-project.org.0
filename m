Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A68514FD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:26:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A668082C;
	Mon, 12 Feb 2024 14:26:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A668082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707744400;
	bh=c23oWq/2BjYXZdDPAYaHpYUvz+ufaYa6Lw6VQvyocRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q2jMeISC12hY33feqnx6j9OGBA7I5E9JeszMAvEf1AsgDQzwye3AYC+9J3jl0D/N6
	 TgUhjTlVvlWqhFACOn5i9POM6N5gzxm+WeNY9KShyGUKSmwmJdndjvzbxVjuh75B7B
	 8/nsZAdqVqT/srSSma6W3hnBTAu/eQKsjllVLerQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A37EF805D3; Mon, 12 Feb 2024 14:25:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69AB2F805CB;
	Mon, 12 Feb 2024 14:25:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8748F805B0; Mon, 12 Feb 2024 14:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53C21F80580
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53C21F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jGYh2meh
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso25292605e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707744347; x=1708349147;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AB3gLwmIbX0H9anm0y7lLvFsRUFdenHS4G27CmRvfbE=;
        b=jGYh2mehytUpp1MGox+eEvOIHDJLyEjB9lCvPaiDOC0yJEVIiFgdQd8OZT0+5aLgPe
         N/q8jxuhMY0VJxZvS9oD4RANcmFGYP3Uit1xOOf6Uc1qYGjER5SDVJ4ad8oK43K+EAVw
         ZlchxT2NoW46YfNZy1WAHPubHSA033JjxPEWYlpsEjD30PypyTj4hEUUF+XDUu4GtFDZ
         UMBYuprTDvr4pZnArwFQqgOseUDeBGHSd96s31EvbkwTAAhPZEDMB0RlaL8Nacfa2duo
         caAmcGLE0RDPVfGtvz3+kJ/yjU59g1v0aOSP70qFiYAEQDk+R4NCKNgl5EExccsFVsXa
         vLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744347; x=1708349147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AB3gLwmIbX0H9anm0y7lLvFsRUFdenHS4G27CmRvfbE=;
        b=DI/D6xi7QyVYPn4+NtAlAVsjG7TeHZEkwpc38l14yEBXgT+eyac7RTZKpSNxVVciqu
         xKTi8Rg3S5chCbmWMEl823OxCDbtD9xAQNjiBxnFTfcLoN9YKj0K7oMShV2FULFTBXQq
         mRkiWyqyCSDfbOYlG976xVX3foeDbnNLMM2a8zjdzQb/3FSMZEcOMM8gT9dQ+mGSkgdO
         UubRpOSHsGGgYOQbyHd+r4vYfmEEethceFHfmlZe7vildgsaoBnFuYu4u8VHxXpjUPGr
         K/y4lelvv4SwA9muRp8apCq1PPMZ9K36CJmgRsqeZOpo3Be3/srCLaKCUjoYdNRWZgm6
         cVVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp27D39BYMxs4T1R9idG6g6I4CZnN96YDts7u7Z6Y+jZXRYFkYFS8heUNaBcX3wumWO/OrTiaLEAq0ERygKbatHA1ioX0WgCWr5dk=
X-Gm-Message-State: AOJu0Yy7wQu3WFvpxPU2M+THGAepqfgN2P1DWVxZNhOzEN51AmCduOV0
	lgL//5QiwCxWfdmvqPLT+bw2oO6eMRf54Z73MYiemyRxvHz6VwhiTvkKTJiU02Q=
X-Google-Smtp-Source: 
 AGHT+IGe8WC2ta8hPlWxdY0HZ3hWAQaVFB+AWQOhc4NzzkzIg4+zZ9tBlugAPx5N7eDjhB+Fdog/iw==
X-Received: by 2002:adf:ea42:0:b0:33b:6410:4634 with SMTP id
 j2-20020adfea42000000b0033b64104634mr4058984wrn.23.1707744347365;
        Mon, 12 Feb 2024 05:25:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgJMpFHLH93Cpoan/nxYVctpRvA+u3Du42qTJYuVxI1XiD/OsGcf9O5w8kzSEDLfXpJ9DZ5BT7qV1Ycbt6ff3JpqDYPkn15MGxZdoW23EBxXq3+QZKMGJ9hc9w7n9xUMBMVFf3DjEW3GJna5VnvVGbEPxpTGdfxFUQjZv2r/ipxoZBPImENzl05EPPh+iJtavaeYvONc9epOs3Yo7FrlQCbXTDnIano7zfM9aUqjHBa2ai0vNKUS+xzgrXpJG5SkTbCsoDE1DMQR/nYFYyTDHRA90Ob9tXEtORkJLlOKveBGzAL3K4wFruQG2WnDRDgv2v/4fIM7FBi3g3ZnAJ3Ir741kbOG3n9YhaSRlG1ke7fQaR095pObyjZZJoJLPUPFY0kZ6VsaovcmoVmo0qIkYlKWg2bDdO6mqqcREotkfDcWL3vHmtWWaFidZjvc0YEerxIVOj+sNH5WGM+8+7mQ2ZqkJtc7U7pIBvB/hYra4rBswDuAazCgowZk9cHZDU+VHQbNuPPz3JbyUK//a+BhyorJxcFB9kWdpoyDZJ14EO12mplU3vw4bndLcuR5hmXWVf6E09qUVJ1/0hp/wEixy7Dwj8x0IBPXJeqZn4h9dY9CzWAJFpBxsfClXf+PiqdOwTay9V0LM5whf7XpsnONCcfajeZDgihUO4NjECLEFvgI5OfyKlTqY34PMLJKRTOWDo+KhGuFLcRkJzyJr3Z6jDrI7/kbtCjgRQ40JgPD32Flf/BhzsoUPJnWjDzAcDlDG6a29nQLbRYt3ljo3EOW/hEjEhRriyeN06tmC/+YQQCd2xzOW3VagbhLT4vwVdkGPFuCxl25VEIlYv6eImOx/6UcxzaA==
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id
 n4-20020a5d67c4000000b0033b888a0a63sm645201wrw.0.2024.02.12.05.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:25:46 -0800 (PST)
Message-ID: <c02af97c-7801-4d17-a83f-a72de33c7a81@linaro.org>
Date: Mon, 12 Feb 2024 14:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: arm: qcom: Add Xperia 1 V
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kees Cook
 <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-2-fda0db38e29b@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240210-topic-1v-v1-2-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MYHRFTMJOY45I2N22QOJPUBIONP5W2MH
X-Message-ID-Hash: MYHRFTMJOY45I2N22QOJPUBIONP5W2MH
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYHRFTMJOY45I2N22QOJPUBIONP5W2MH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2024 14:10, Konrad Dybcio wrote:
> Document the SM8550 SONY Xperia 1 V (PDX234) board.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

