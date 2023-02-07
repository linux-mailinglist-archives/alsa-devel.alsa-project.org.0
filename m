Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D496668E4CB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 01:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F11643E8;
	Wed,  8 Feb 2023 01:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F11643E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675815032;
	bh=ky7HAXJkS1X4hEgrcJjQQo7al6D+HHtf9urEyCKlGps=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LY8afRPbfLprxXWnrikY/FE9LUakKVAKoiw/QXCpNgpT519n47I5bR+LCj3Lp8Bn5
	 hu3u/i8MIbBpmJtrT1ghADWk0WPBocOEudePVrA0pdVmmBLBKIutLumtqj6LIYVHPf
	 N1CezWE5CZfW1wJKmJHi2sQzeSn32nYhHRXnWTcs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC46F8010B;
	Wed,  8 Feb 2023 01:09:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07F9BF8012B; Wed,  8 Feb 2023 01:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48716F800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 01:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48716F800AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZVmVyDjS
Received: by mail-ej1-x62d.google.com with SMTP id u22so2545960ejj.10
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 16:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ky7HAXJkS1X4hEgrcJjQQo7al6D+HHtf9urEyCKlGps=;
        b=ZVmVyDjSx6EgkFT8iA42dx4e6NkiFFvRjgyVg3vEwOo0sTodqpf/6xC7Kg8zvu5zOi
         +i12SLbbl4EZG+LN97qWe6I+1nf7msNnuZujHBy1cutT62jCNnRsC29vzSbwShTGLJk1
         qZYaDyl5UTtWP6oEC2vJLZfbjaQlWRcfn9s1g62TU2LJurA6KpeBdnISuwk0MQw6cNY5
         892USyFUbQ90GHznIUqrP6DW2lUZ+wf44TCj8WwXad3JpTV4x64SRgkhtbuXHVcqTGJK
         MFbAe8tiuizvuNYAJkNKmLvFSSDg+Gxjp6mXLkKvCTbo5ygU/iFBvdk1NlblLIO98PDs
         M9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ky7HAXJkS1X4hEgrcJjQQo7al6D+HHtf9urEyCKlGps=;
        b=eenkebOQQvvKn4JIJG9dtGFVwjthTpx65txGJjsTcLRNfuv5/PCjJ2HInIw150EeAw
         L2M8o7uw01Y3H3v4sktKKobpzs+3eIUeesGGHO5t5eVFHFi12QLjlDnFxL7KO14mELC8
         Py2x+TkbuypP9uf3auDkBEiUDCRkMJg18lNaqxtmKs5HwqnaA3+LK+DvJQRdi0yslt0V
         YU2erABfdjQ38rG0aA2ltu5TLR4UhhVc+NRKbjNJJLjOVXOhfzh0+BXkh9+SDs6fSFHL
         ocByjCRZhsRY65JMpsiUEePPLpSc03Dml2ZfxZxBIlU1x7Wg+SCa07BMnWH93ilHXyn+
         +Pxg==
X-Gm-Message-State: AO0yUKU+bMR50fJ84MOH1RT4FdScYu40VOg+brrgknaacbF2d3wPKLiG
	yyeOD3i5EsSRY/1Phy0uJLENyOAwFvW1eljB
X-Google-Smtp-Source: 
 AK7set8TXIFkWABojtv5YPhyN5r9CAIvfLXqNjua96/e+MfEknoAwWnL/akisqL1H78whXRbC2TL6A==
X-Received: by 2002:a5d:4bc2:0:b0:2c1:28e7:5081 with SMTP id
 l2-20020a5d4bc2000000b002c128e75081mr3490785wrt.68.1675788495656;
        Tue, 07 Feb 2023 08:48:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 i6-20020adffc06000000b002c3e28d0343sm7732034wrr.85.2023.02.07.08.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 08:48:15 -0800 (PST)
Message-ID: <1dad040e-fb18-8291-5e11-31ab35a8e4a2@linaro.org>
Date: Tue, 7 Feb 2023 17:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/5] ASoC: cs35l41: Document CS35l41 external boost
 without VSPK
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230207162526.1024286-1-lucas.tanure@collabora.com>
 <20230207162526.1024286-5-lucas.tanure@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207162526.1024286-5-lucas.tanure@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GGWAWXWDH3M6CAVTGQ6CJJQECZPKL634
X-Message-ID-Hash: GGWAWXWDH3M6CAVTGQ6CJJQECZPKL634
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGWAWXWDH3M6CAVTGQ6CJJQECZPKL634/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/02/2023 17:25, Lucas Tanure wrote:
> External Boost without GPIO1 as VSPK switch
> is no longer supported, but there is laptop
> models using this feature.


No, because:

1. We did not finish discussion
2. Subject prefix is still not correct.
3. Please wrap commit message according to Linux coding style /
submission process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586


Best regards,
Krzysztof

