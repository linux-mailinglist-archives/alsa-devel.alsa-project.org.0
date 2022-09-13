Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E75B6A7C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 11:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B3F01749;
	Tue, 13 Sep 2022 11:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B3F01749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663060499;
	bh=qcL9+dh33vq/uNaJ2ToMYaOHIfNWNpUqN2p8UMocrvk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8yDUej4trLT/eSKXSmoXNNJs9TCHj8TPfVzvIOAldRJmRSEQ1x7MD2bzVME29zJ4
	 TvVbciAVZvrOBATVHIjLOW9gftt4p8vaZxe1Byed5W0m5WcWP3O/RPjMmRvHMXFruq
	 mI/bQ70zk0QP27GIlnwg5Fl+mdLCrQLjxolBC4LM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0B64F80154;
	Tue, 13 Sep 2022 11:13:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F289F800FE; Tue, 13 Sep 2022 11:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69FCAF800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 11:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69FCAF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="V6I/nxUO"
Received: by mail-wm1-x332.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so513591wmb.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 02:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wOXq4EBtuFiFHBb3GzVfUsN7E33ZUXKGmJFqun2J61A=;
 b=V6I/nxUOszHJyPi5bIFgW0oqsqnpS8KyGBZG/a1xhhRUvqDZd131R2gJ301L4Ajydl
 v4S/TQkUc+Yh8jbzv89IO/NurpCLdjwxpHs0X3d51XESJfs0DJTevSiXxeAmYXra89Ue
 i/xynn4IuPiMi7PZjE0hszi4fAk1YiLc8+gusYUCg2Sj6b1T6S1ZLCdhQKdLZM9pwRX2
 feHXc5OJkHT7tne1xTkGDC3FSar9+NrF6tSWJXPPBuHV1vG9ziSDUZwfMUiAX7j/w7E+
 XHTds1HJndxPoUQlYOwVj0vjfWtd+4fdHSmHUECt2OSq5Bb0ZPXl2SoUcp4tt/m+xdKe
 kNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wOXq4EBtuFiFHBb3GzVfUsN7E33ZUXKGmJFqun2J61A=;
 b=wAj8jBRdFlyjuRlQYQiia8unvwCEDu1T1D75yVQAY7nPPIlNcuVcjCheXDkAFacMzY
 lqPE1jCmJwH4i4el8A3fvkn9xcTmXmkhmiZ5nWLZPXwqVrZjhAAbjLgiW9VsZ+b7ZLt5
 PABNzI1rrj3kIK9vmlDA3y5AvMRXa3CtYZqn+NGkooQEQhImBMpXE3WMEu+NYa/zF74J
 wH5luw0EFQs2q1VCI20T0ksbRgNRp5Q0b3U8s0WEbRogbuL5OL0c38u+BhN3wQBnGIL0
 +g/jmsKo07L6RDBdBVDB+MdCXicYhauewl5WDzUpBvFZdI/nI34D/jubT+GyqjKa2wB7
 05JQ==
X-Gm-Message-State: ACgBeo2HZx7UxcniSXR2319scvDGkCvVVTX31sqgTWdRIHbc7x6KgP9n
 7sxxDFyRrEd+UW4VSRvhe+iFCA==
X-Google-Smtp-Source: AA6agR404Z9zyxR/Dsu85/hoOYfczNYlMnh8Xl9pLVAYhwqsaYuQdkGuTi0iBEyaqLP4aXhbUp3Z/A==
X-Received: by 2002:a7b:c8d5:0:b0:3b4:76bc:5dae with SMTP id
 f21-20020a7bc8d5000000b003b476bc5daemr1620741wml.122.1663060432548; 
 Tue, 13 Sep 2022 02:13:52 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a5d570c000000b00228dd80d78asm9673036wrv.86.2022.09.13.02.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 02:13:51 -0700 (PDT)
Message-ID: <404caabe-f855-012e-4cae-35abdb58f23a@linaro.org>
Date: Tue, 13 Sep 2022 11:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
To: Astrid Rost <astridr@axis.com>, Astrid Rost <Astrid.Rost@axis.com>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@chromium.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
 <ac2bcca1-6997-2d17-b1d6-a5e81ced2613@linaro.org>
 <9a72bd22-9298-65ce-a894-540f98745a7e@linaro.org>
 <d521d40e-c79d-b044-44b7-6f10845f4268@axis.com>
 <bdfa3f29-f63d-1fb7-f37b-0b4a1f6374b3@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bdfa3f29-f63d-1fb7-f37b-0b4a1f6374b3@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, kernel <kernel@axis.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 13/09/2022 09:16, Astrid Rost wrote:
> 
> Hello,
> 
> I did the conversion from txt to YAML.
> It requests me to add as a maintainer?
> 
> Dylan was the original Author.

The maintainer of the bindings should be a person caring about them and
about the hardware. Usually it is a person with some access to the
device or to its datasheet (but it's not a requirement). Feel free to
add yourself and/or Daniel and/or any current maintainer of the driver
(but not subsystem maintainer).


Best regards,
Krzysztof
