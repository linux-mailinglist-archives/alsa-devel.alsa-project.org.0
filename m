Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7369473E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 14:42:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7724B208;
	Mon, 13 Feb 2023 14:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7724B208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676295736;
	bh=mBtKMxoiwXj0IdHB3txPg9Cb7TlNZ5n12nvAA+b9JQ0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B04oa5yqkhod1pbSYQrMzjIrKNELGSRf4Uu+OIRv2LHBwhzIHXl4Tjn7z+nBeoq4f
	 ugG4P6gj6PkgwQtOL8OeqQ2w0lbpOD2+lQcZrXq913dRYUdwYWnreOZvsajPMrYsfj
	 MSOvzo4qzuVt+JSJqe6bdxyz+z8x1vsaDuEXsXII=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3420F804B0;
	Mon, 13 Feb 2023 14:41:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F46DF804B4; Mon, 13 Feb 2023 14:41:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0782DF800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 14:41:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0782DF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FBWDFebJ
Received: by mail-wr1-x433.google.com with SMTP id m10so3351268wrn.4
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Feb 2023 05:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jniYWNW0O39wpTJxa3SQEvop6eWznu5uXxnO2EMbWgQ=;
        b=FBWDFebJdOqOt9UisLdoEICfZUOvdzF4VjQAvexnYvTzYXlNt/8kpZ93WzcGcOScmh
         GSGmXXBlLEH03sbYKwfyYdGJvTvt4pMuzr3QvwOk6Kpg4D/CaMXYF0kQ4MjOSvjV+bAN
         KlEL8mdPr3o/gPPowuH8FFQXdXYrJWnq+OJMUqoW2x21lUo42IHDegHxH9wGE21goH5s
         PTMnWdcixkpnLWd6tjeycsGC2mgjtdXIZ+dqpkzb/RsZGUW8qR8wSIkPtka0Zx/OmEYP
         ce7lM/rKB9WmY38o5PP/PBywnkTlLPXqo5ljii1M743Mgwkq03eN214Npjdq6fbL0aIG
         sAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jniYWNW0O39wpTJxa3SQEvop6eWznu5uXxnO2EMbWgQ=;
        b=pkJ6X9TRokBRALrl8926qK4pJXtugr2w6Gn9yK5Fpc4Mm48Rt5SPl5W2JKd90oFT0t
         rtg6vuByEu1jdd5shzHXj3sEUG6ekqMDT0H4KXPx5NCjWxhdJ4cQ0067TKU+IbDL5Ik2
         o5Q30WNExZufANRCNA2FhkC5eCJIiyh8VQTbQ5fX8V/iWAiQzE9jFXAsOKLI9SmnuGU3
         N2npkSbhj+1aYFmL23drtmPXPwwbFqbc5++rDs3Ic+PT9CGdJmeFONIavAQVVvRr479J
         MjQ13F29ydw3s59RkEFZFpRXT5HqF0z7T4YcCfcsOu2P1ghmYL0INb5oRq0FdaqaODsM
         TFMw==
X-Gm-Message-State: AO0yUKWZuZw1474z9TOkK6nvV4I6eoeIcFGMdgzyki7UlNmzV2KGqBzi
	prA2T1aK1ic7ERlIQvicT5hxwQ==
X-Google-Smtp-Source: 
 AK7set9Ck5nVtGr3AA0e07USwlY0O4KmviAeT07ZvvWqq9KVybVYwczKDubU1V+AXYHkIkH/gEo6Nw==
X-Received: by 2002:a5d:61c8:0:b0:2c5:57d5:ef6e with SMTP id
 q8-20020a5d61c8000000b002c557d5ef6emr3328146wrv.46.1676295673210;
        Mon, 13 Feb 2023 05:41:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 q2-20020a5d5742000000b002c560e6ea57sm218722wrw.47.2023.02.13.05.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:41:12 -0800 (PST)
Message-ID: <0c74070f-6dbe-9379-3acf-85d173217419@linaro.org>
Date: Mon, 13 Feb 2023 14:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/17] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, =?UTF-8?Q?Martin_Povi=c5=a1er?=
 <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RF7ABUNQMS5SHUKQCOPSKZJITN2Q2FXU
X-Message-ID-Hash: RF7ABUNQMS5SHUKQCOPSKZJITN2Q2FXU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RF7ABUNQMS5SHUKQCOPSKZJITN2Q2FXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2023 16:41, Janne Grunau wrote:
> The block found on Apple's M2 SoC is compatible with the existing driver
> so add its per-SoC compatible.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

