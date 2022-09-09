Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696A5B2FBF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 09:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B7071674;
	Fri,  9 Sep 2022 09:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B7071674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662708382;
	bh=klcG8Ui9DWg9GG8/Yv0WPonKu0t6bVpvYV+WGzs9kvM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OWngkVG3Z5PNTNmnkMbyh2g95g1Yr8W1nh4wXsQMHGFdTdWfMH51EyjEkdYo5ucg9
	 R4g4PLw/ywZd5vAkjxpNNLj96q+FhgOl7iOpoAGS9HGnN9ENMmmI4XVt0PvOjofB8O
	 xFBCEHV6XJmqthHz88qoTxdJy+62pINk6JBK/IIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F03F8016C;
	Fri,  9 Sep 2022 09:25:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E8B3F8016C; Fri,  9 Sep 2022 09:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B361CF8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 09:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B361CF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Jxi/U+Jb"
Received: by mail-lj1-x236.google.com with SMTP id l12so784454ljg.9
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=rttukWzjV+xvcl0ZdZLEMjvbrPV71XhE0mBEoNsIC0c=;
 b=Jxi/U+JbUv3v+EznlTNHFlFyGSGuivl713KuaNpo0EYtSonAZkVxGMDug+GbhlR8uc
 snrfxroNbjYlhnESeju+kc6rjCo+Yog10pZs6pyzXdiWnYo0AVK0unUR1B1UKheb5aRo
 qNfMmLglHF+PYeMYwodLsLirOEOYRnHWnnYj9kj959eoG3RFklnldruNtJ1T4bfOauPg
 dvrCrP2WUd6D2aHWgXHFA4ZLWnbe8rC2+mNfL6PzJ4zo0gPdp1JMWDXiXiin3IBcLWKy
 I5emIXWiaiMjFsF5IOrQkBYxzD4cPMjbwY/DlWwbfTtYg8dzA8zT6N5ISOBYHiJ0YxDl
 OmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rttukWzjV+xvcl0ZdZLEMjvbrPV71XhE0mBEoNsIC0c=;
 b=zqnKZiuZCoLOVaoQAr8U2JHibIb3OARy7/kyIM7y1SfyB8KG9OnF5p9aP20mT9/jNQ
 sbRR8VtQ5XeVzDye3i5/x06TNTs1cQdAmn+FBUQrIAmjoOcwlR5OaLn1GzacO6BzeDvg
 dF/IFfgM10zYujbNhUn+4mtOngJvWmguHxxZ6eUK0Q1rybEruxEmd6rvJK2l0TaDhi2/
 PB66g9rzxxgOU3q0gRRs9Rf7xU8xA1qjpV2571eSR6BlLE9edcarcNdQ8fz+3/z7yEPm
 4+JJ2r5Osw9gbMwzlycycdl1K6u3NZBxsemOwIYkJBlXfVQxw3GJ0diipZJMiG2WrcZG
 nxCA==
X-Gm-Message-State: ACgBeo1DNknWlzeLWu75iRVqbnnRBIGqsgXRGB5YW57wngiVAdtgbtTq
 ZTuZxS/Kr6H8PPO8gxZr/lkmsQ==
X-Google-Smtp-Source: AA6agR487qrszdElZPRRzQQW9lkjNAr16pE+IjQUMK7QInOwDo6bp/ebol2FUs+Rq7JZuSI89hhdBw==
X-Received: by 2002:a2e:bd03:0:b0:261:8b4d:7c5c with SMTP id
 n3-20020a2ebd03000000b002618b4d7c5cmr3798042ljq.194.1662708317694; 
 Fri, 09 Sep 2022 00:25:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h14-20020ac25d6e000000b00496d254bbd9sm150794lft.271.2022.09.09.00.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 00:25:17 -0700 (PDT)
Message-ID: <66cf260e-b8b2-b3d1-7e8e-d1cfd99989b8@linaro.org>
Date: Fri, 9 Sep 2022 09:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
To: Astrid Rost <astridr@axis.com>, Mark Brown <broonie@kernel.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
 <b42e7fe4-9e1b-fdda-44f2-aa87b06425c8@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b42e7fe4-9e1b-fdda-44f2-aa87b06425c8@axis.com>
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

On 09/09/2022 09:16, Astrid Rost wrote:
> Hello,
> 
>  > Use standard property units "-ms".
> 
> I made it in exactly the same way as it is done for the "ti,micbias:".
> 
> - ti,micbias:   Intended MICBIAS voltage (datasheet section 9.6.7).
>        Select 0/1/2/3/4/5/6/7 to specify MICBIAS voltage
>        2.1V/2.2V/2.3V/2.4V/2.5V/2.6V/2.7V/2.8V
>        Default value is "1" (2.2V).

That's not correct way. Logical units should be encoded in logical
units, e.g. microvolt. This makes the binding re-usable, extendable
(imagine new device from the family where these values map to something
else!) and also the easiest to read.

> ?> Anyway new properties cannot be accepted. This has to be converted to DT
> ?> schema (YAML).
> 
>  > Doing a whole binding conversion feels like a bit of a steep requirement
>  > when people are just adding a simple property, it's a lot of stop energy
>  > to figure out the tooling, do the conversion and deal with all the
>  > bikeshedding that the tools don't catch.  It's definitely nice if people
>  > want to look at that, for more complex binding changes it gets more
>  > reasonable but for trivial properties it's disproportionate.
> 
> Thanks, I am not really sure how yaml works. But I can have a look.

Documentation/devicetree/bindings/writing-schema.rst
(and example-schema in the same place)

Best regards,
Krzysztof
