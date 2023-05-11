Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB76FEF69
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 11:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893691E9;
	Thu, 11 May 2023 11:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893691E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683798859;
	bh=5DRJFtWbGnunTQo2TO8KU5BfMonC+v2e8T7A457HP9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EGnpz4T9mzhzR5nYwqqVMrebdL4753H+JRhdZj+vrrdit/U9YyBP5f2hPrYN45m2C
	 rco115eNfxFpT5a37M6Yic73OtLdmGWHL3l3SFIJmSkqiMw5pttwN9/SCs/YUX48eQ
	 YL/PO+TmsHoYV9S1bsevSNf6NzQtuuNG/NHpa19g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D664BF80310;
	Thu, 11 May 2023 11:53:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F3BDF8032D; Thu, 11 May 2023 11:53:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C38FF800BF
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 11:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C38FF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JyfQ3vpe
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so15440245a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683798792; x=1686390792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ra1EDpxvz2xv3pLfovf6y0ptDS0ESOKI+0xxALZBic4=;
        b=JyfQ3vpeV7QV2DXsksKGQykVOBXIpvX+AHhMHcKaCMrJ4vJlVyQEBIqZLTUlnttSYk
         rkpc2JSKlp+Atk/89aPqBDHXWvhsMyJ5uYRVwOVABKswrJk+30dSZEXtbZHmQ40uTO+V
         bG7lfpK0AAPOTeRhYZMdz8KLger/caFBBGEFO4+l3QV+/GXqCwXnAoBdhzS8RIRKEdTp
         pQgT+HApj9tCn7lfBJhXL93rXbqntED2shyBTF/QoppoLxaUfvvqZR5cE/90dKe8I3qs
         X1AdELeKdNKd2OqkKh9HWS79OenMM+SzPWYXR1LrEvyAtIN9IgntX9UtI6rra27uyrwh
         FeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683798792; x=1686390792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ra1EDpxvz2xv3pLfovf6y0ptDS0ESOKI+0xxALZBic4=;
        b=iK+NP16C1wSnbma93ISINJVpnsVffjzebQS/QwPdBIuQbqU3ErTMQFzjXHUHByOMy2
         npHwgvYCZ9Y0vNyg2xgz2aCyNG5xj2Tqmwki4DeCq/RbwUxehesZjcsEXVcZP8z781BM
         b2EzTMTJHKDiiLUabRTGZY5DVVAYPjRRLwFBmJgMJWDR/OyF0NMxCHRDHUIoqSdGYg15
         FwsqZZwgDNubiORHGfvki4X+8kPY9dRyucLzxSFSOmuIzUsM4vAfZHakrYSiOWUILKa0
         3DnrYBatNXjtryPD4ltWwM9mUEMOIcXR5HnakJFR0LBMnzZTnC6ZwthoPoTADO5xdJfh
         uaDA==
X-Gm-Message-State: AC+VfDz6LMcbmGBDY//8ytUdoBTwNCwgpsziB5PIBrR0RkOBvBc1j6YT
	FuCxElE7dKBY1TFpgm6cGJ5GLw==
X-Google-Smtp-Source: 
 ACHHUZ7buTqgXwmKazIqHHMobziqeJdbd70yg1RF2bZXXEnxzChFwjX/ueRfM4Ac8GmFrBiUAZCA/w==
X-Received: by 2002:a05:6402:213:b0:50b:c380:a929 with SMTP id
 t19-20020a056402021300b0050bc380a929mr17383943edv.10.1683798791655;
        Thu, 11 May 2023 02:53:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e?
 ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa7d418000000b0050bfa1905f6sm2861035edq.30.2023.05.11.02.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:53:10 -0700 (PDT)
Message-ID: <55489ae6-dddc-ca72-07ea-761bf1e40912@linaro.org>
Date: Thu, 11 May 2023 11:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/3] ASoC: Add ESS ES9218P codec driver
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AJZJIPAP7GN46PNXMOH5EO2ZBQHDD6Z3
X-Message-ID-Hash: AJZJIPAP7GN46PNXMOH5EO2ZBQHDD6Z3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJZJIPAP7GN46PNXMOH5EO2ZBQHDD6Z3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 13:23, Aidan MacDonald wrote:
> The ES9218P is a 32-bit stereo codec featuring an integrated
> headphone amp with analog volume control and up to 2.0 V rms
> output, and a low-power bypass path for passing through an
> analog signal from an alternate source.
> 
> The digital audio interface supports 16/24/32-bit I2S inputs
> ranging from 8 KHz to 384 KHz, and DSD inputs. This driver
> only supports I2S operation.

...

> +static const struct of_device_id es9218p_of_match[] = {
> +	{ .compatible = "ess,es9218p" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, es9218p_of_match);
> +
> +static const struct i2c_device_id es9218p_i2c_id[] = {
> +	{ "ess-es9218p", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, es9218p_i2c_id);
> +
> +static struct i2c_driver es9218p_i2c_driver = {
> +	.driver = {
> +		.name = "ess-es9218p",
> +		.of_match_table = of_match_ptr(es9218p_of_match),

Drop of_match_ptr or add __maybe_unused to the table.

Best regards,
Krzysztof

