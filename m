Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BAF46C3D4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:42:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B462521;
	Tue,  7 Dec 2021 20:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B462521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906171;
	bh=X0NNZIdtWt9vuT7FK13b72MjUmfctgv3ep9Z1JtQ5bQ=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRjPKqKH94mEsljAuXv4NIcTSb2U14ans7z48BWG8mOxIztFJTbzEcz/OwTyzr3Qb
	 NwNuuWgtW8fCZbna5xoyEkQES4jRTJXjiDgqinjgSFDCEG6pgBVs0GZekMEYojUk3i
	 eeeu9TFwui1KcNxpWXx0oK5TJqzH1McAbqZJvT+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C7AF804FC;
	Tue,  7 Dec 2021 20:40:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8111F80506; Tue,  7 Dec 2021 20:40:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82582F80259
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82582F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N6dpjqjS"
Received: by mail-lf1-x131.google.com with SMTP id bi37so772900lfb.5
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 11:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=lJUPRmvzGBYlX226TjBuiYmtUf9jUn5G93+KA16LjAg=;
 b=N6dpjqjSGXJte521IlFBV3JwwBDYSI3jUNgG7vtsLv2egTWEUMbr6ffb6gexw+xZgO
 MJw07re/mwKoJsjygSKKeTnXfWMN1H0c4Ywt1Ums0+LkmTRdvqoqWsnpAADjZyQ4jf66
 omAWJ3HlFasrghRBVxCq33dqszE2xRUfWFXzmTGXlrE6jiI8Rv9qt5GeR2vLr/Y4CgCm
 C1Uk36jREfGSnQAO1Ua+bJ2wztS8eJ/wr0ezCvK82B8V+rmwc2cAJd6fEgFt999UYXPh
 Ujz4ngGsWTEsoI635i1clIuyfdidjm2dilIIplYQZsrApMn1FdTDQGMoiCRwRTWW5rqR
 oZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=lJUPRmvzGBYlX226TjBuiYmtUf9jUn5G93+KA16LjAg=;
 b=IA4R2DsQLWWzbgOC8cdcJFp4pL6trE/lI53pHBMJDvU4KFocbItkPRQtqBG550qMEX
 qPPALQpWpUxw/kq+8Fyq0LuC0/hZt0yWPuCVkQH+ZEE7o8mFbqRIJI64C4CycRxfNqJg
 Yau++xQ60DYBbq5gPIwDxE2X4t8a7b9BlZIb7RbFOA9/JIJJpQW1YKD6gO4bfeVU0q2d
 oO59dWUoFrPnW1OGNzqYfmCr9fq3UElaUoysUw6VvfxmVdJCvUghv8MlNXMEkZT+5C++
 dFX8qBkR/eoVgpxINLfSXP7safpXHbN7V6+oBoSI3B+EXof7Q3ldD/RR6bfxuiVFBbQc
 rb5w==
X-Gm-Message-State: AOAM531eXkmRSEG3F1r3QYtiS1mDKRYv3dlgU+zuCHTho/rcI3GsXBWT
 SwE7Qqw4Oj8RK74+gW8onu9Kkd6WcIDHKHfV
X-Google-Smtp-Source: ABdhPJyr4zizRPTfcscSDF65TlfDwku/yypVsSmIKZoDc7b4l/BC9epnqQcHVd81tlPlhrwQ26x3pg==
X-Received: by 2002:a05:6512:ac5:: with SMTP id
 n5mr41852984lfu.246.1638906020361; 
 Tue, 07 Dec 2021 11:40:20 -0800 (PST)
Received: from [10.0.0.42] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id p10sm51919lja.0.2021.12.07.11.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 11:40:19 -0800 (PST)
Message-ID: <b6af56f1-7e6b-81ca-7bae-8f2a2dfaf0eb@gmail.com>
Date: Tue, 7 Dec 2021 21:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, robh+dt@kernel.org
References: <20211203120243.24173-1-j-choudhary@ti.com>
 <ed6c9be9-32d3-719a-ee0d-608b228f36b3@gmail.com>
 <20449d7b-0524-a8df-7852-a4c495157682@ti.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
In-Reply-To: <20449d7b-0524-a8df-7852-a4c495157682@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

Hi,

On 12/7/21 07:03, Jayesh Choudhary wrote:
>>> +  tdm-slots:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: number of channels over one serializer
>>> +    maxItems: 1
>>
>> and it has to be between 2 and 32, ignored in DIT mode (384 slots)
>>
> 
> Will add minimum and maximum. Should this be added as a conditional
> property when op-mode is 0 (I2S mode) and mark it as required?

That would make it much nicer, yes, thank you!

>>> +  port:
>>> +    description: connection for when McASP is used via graph card
>>> +    type: object
>>
>> I understand that it can be present under the mcasp node as it is part
>> of the graph card binding (or a card binding using graph).
>> I mean if a new card binding comes around then we need to document it
>> here as well?
>>
> 
> Specific properties are not marked for the port. So it should not be an
> issue. Other alternative is to mark the additional properties as true
> but that is not preferred.

If the McASP is used with simple-sound-card (as it is the case most of
the time) then the port is not present under the node for this device as
the card is not using graph.
I consider the port (and the #sound-dai-cells if we are here) not part
of the McASP hardware description as they are part of the graph or
simple-card binding.

I'm fine if the port remains here

> Peter,
> Any other changes I should make?

Not much, this already looking good.
I would fix the dts files which generates warning/error with this yaml
as they are incorrect.

-- 
Péter
