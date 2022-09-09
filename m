Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974BE5B2FB9
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 09:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 004751674;
	Fri,  9 Sep 2022 09:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 004751674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662708298;
	bh=Coek/p8GZx0/+SZF8kocQpsQ+I4TQGyEVZagoLcjD94=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mmZtmlDhlHolKqWsfnDR6UfPtSU3ZLCcvXkSywNmRfuT6mOV0fm2DOGP74QfXHwle
	 zui0Xjv9vxBWwHFIqHJGqnOwaMPfxDii5VCFaebLqz6erAn+yC9H2zdHCnwivrJyFO
	 vhd+wRvaHMojZfI5ziXJgurJDiXRpVrDTGnt9X24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62D2CF80105;
	Fri,  9 Sep 2022 09:23:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F26EF8016C; Fri,  9 Sep 2022 09:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9128F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 09:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9128F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FDb9QYtH"
Received: by mail-lj1-x231.google.com with SMTP id c10so808183ljj.2
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xw2tGj4i/BGzgrmFBPep6DT8sXHDJUaiisGkdVfexQY=;
 b=FDb9QYtHpeMnKLbXsu6sSQ2VNTLSHs98Gp3ucj9BbfZGPm3CejGQZ2b3XBBUXZNwuS
 cfhv6+sLtmK4BroTfM6zwXbrHWa88kONsBXff3kTnt4ye396MQETU1hEGZ7k9eF7PSy7
 rKYmavVegYi+dX2Bq/NrCpV7sCjttCuQKwVTFI0bAZ6Qv1zugjRb59I03a2hwpzJXQNO
 py1kzoKyDOkuwmzWkYVoamxJ5Gnl39JHQv17U/iDbNZ0o2XJOqA172ZI/UYe9WuWifGH
 KRegy8IzuMmnlgJPwh9dNvUc2WyH3UCGAun6xA8+vtydKb5owZyEUNf/JQuVsyiQ9SsS
 wUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xw2tGj4i/BGzgrmFBPep6DT8sXHDJUaiisGkdVfexQY=;
 b=dHTl8QJY5zrQrAkbGx9FR4qsrjokfLMKd8xLoqyIYVhuWEUk92J9C3hfLzvAsO+T8+
 Ae9F4H72iw4wuY+/aORWsBUntJEiPE6UhSfMYHqp0xNjWCp8RochPCgbdKv5n54N66ZW
 yH3L3M9GRH1HudY1VaTCGtksPVPBqUdWtNaVf9+OOZHgq6nEq+SuHhdy/kLxMUph7xr3
 is3PBS+ojYOjwvqnR70peB6JKoJ+A/Mv7u+CxL2qClqkrj/WVe6/tG58EXwnx28h6Z0Y
 FaeMLhoXEnmfrG6M7ZNlNIeOcNrUs51tB9UD1oIxxDRFOt/iolU38WSQr/W4ktXEZjRn
 gnxg==
X-Gm-Message-State: ACgBeo1aBVD/U8SzOVtAO39UC/dSnw1HmV6P/QcNFkAk7VeqB0P9LrAT
 3oXeEWXaU1QS044hMf3nVdKd5A==
X-Google-Smtp-Source: AA6agR5pKzdG0AkkDvuWtiRQUCUOrpOGaZ995aHdvP6egqMViKL6g6CWuElhBa3jVgm6OsOXiZemMQ==
X-Received: by 2002:a2e:b0f1:0:b0:26b:dac2:d53a with SMTP id
 h17-20020a2eb0f1000000b0026bdac2d53amr1820196ljl.253.1662708223297; 
 Fri, 09 Sep 2022 00:23:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p26-20020a19f01a000000b004979ec19380sm149450lfc.285.2022.09.09.00.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 00:23:42 -0700 (PDT)
Message-ID: <ac2bcca1-6997-2d17-b1d6-a5e81ced2613@linaro.org>
Date: Fri, 9 Sep 2022 09:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yxn9o1MVMPnFO3PM@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Astrid Rost <astrid.rost@axis.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 kernel@axis.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 08/09/2022 16:35, Mark Brown wrote:
> On Thu, Sep 08, 2022 at 02:20:42PM +0200, Krzysztof Kozlowski wrote:
> 
>> Anyway new properties cannot be accepted. This has to be converted to DT
>> schema (YAML).
> 
> Doing a whole binding conversion feels like a bit of a steep requirement
> when people are just adding a simple property, it's a lot of stop energy
> to figure out the tooling, do the conversion and deal with all the
> bikeshedding that the tools don't catch.  It's definitely nice if people
> want to look at that, for more complex binding changes it gets more
> reasonable but for trivial properties it's disproportionate.

It's more than one property here and many patch submitters are using
this reason as well. In an effect few bindings TXT grew from 5 to 10
properties in one year and still no conversion to YAML.

I understand your concerns however I have stronger motivation to do the
conversion is stronger for me, than for accepting new features.

Best regards,
Krzysztof
