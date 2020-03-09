Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D40817EA95
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 21:57:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766B71667;
	Mon,  9 Mar 2020 21:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766B71667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583787463;
	bh=LQKII5TaPLHsurGXhlRoeFmLQ3D5zGnZ/y4rQ5dBTBc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=euJOOi4VBI1wCur1ToIiXUo7tWT2DuXAGIjuHlVWOOQnAC8TTIVKzZLnAsjDAUJb0
	 CSN4FxY36OahOm9I9JDqbK8GEeGkok4lLWBixhxS/KHd8uhqWoKNXjhHXRL6ryTLyL
	 qaZlqVx8RYMVWMkP8Y5xXWHnSPcHcziRzbbteGNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CC3F801F7;
	Mon,  9 Mar 2020 21:56:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB038F801EB; Mon,  9 Mar 2020 21:55:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10136F800B5
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 21:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10136F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="YuJ74zCS"
Received: by mail-wr1-x443.google.com with SMTP id z15so13031900wrl.1
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 13:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vhQE94JMdE+kOhEIbg2JbjKBD/IEFt/F1xmPKcV+cCA=;
 b=YuJ74zCSchT9R3Qw3rctLTy0ub6AzdBpEPLkSD80z+B+IQkXZa36AMPNVEM7doIeXL
 zd8Vpkkze/4ANcZsQ7e8Dr1Njf9f4PHcm7FKs+nm7r0UuFVfMQFa1Mrbpnw8xEZ9ZQ8v
 YfqZFMqOWMa+j/RfwTu4lYl9g14Srn1vG8+dTNYq6J0uQlTPQVPwCITtEfB8VSYBSzsH
 tyht4tdxYqCNSvFX0iMdVWadDTPODU60p/CoH123NYBypP+o6h/ypxiFNetmHzRnfYYs
 5VH1fYXNJFXiMp5VC8ZaOpHTtKCxTUuXMeb6O4EJ+kQYucaDX1WuNVEFqXrGKH3x5+cU
 afjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vhQE94JMdE+kOhEIbg2JbjKBD/IEFt/F1xmPKcV+cCA=;
 b=H0tintU6TfU5Vvo6Ghcmfv3RnYAAWvOUgBABo53KTobSTZne9EJpKeMsb2Q8EtZkd4
 XRa1+Qmbhbqn2pXgW0wkErjV4ES+AAuIvY1LjBvCDR/rxyJKNj8jC6NvShAW5KoHkWYg
 pnfbllt24tqiYCHu1M66VlMJ0P6Zi8HmD345oJPsXIdvN1BfFB5OSOPCyF94kKAkTnIS
 k4KM00aPugfrtejetolYOnPR6hot8JllxZ8MgtW7eerUPypAwzV+uKu1vX6P8EhzqxOS
 uLYbvR1zL9LOCZBaomD7GwDHOEbJOzTZ+D2zSW6erMbDxNxsR5ycUMFj9aq2t9VKjHNM
 q6sQ==
X-Gm-Message-State: ANhLgQ2CQf7bXa+irO9n0M2gge4ikhcCarPwG1Ni0JRgcnUjh1jaU/Nt
 lBHUPMD1AVr7DUdo2JF6moNAbA==
X-Google-Smtp-Source: ADFU+vuzi/IVOqxjAG2WysJRD8gtQgdniJdh8UtOI2sGJBVKb2NSoZEAo9jXf68Q3PWHcOJjeJmg6A==
X-Received: by 2002:adf:9087:: with SMTP id i7mr14374888wri.120.1583787355688; 
 Mon, 09 Mar 2020 13:55:55 -0700 (PDT)
Received: from ?IPv6:2a02:a03f:44b4:9700:886c:841d:dea2:ee2a?
 ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
 by smtp.gmail.com with ESMTPSA id i14sm10352273wrp.82.2020.03.09.13.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 13:55:55 -0700 (PDT)
Subject: Re: [PATCH 6/6 V3] ASoC: tas5756m: Add DT binding document
To: Rob Herring <robh@kernel.org>
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
 <20200308142509.27765-7-charles-antoine.couret@mind.be>
 <20200309203847.GA31358@bogus>
From: Couret Charles-Antoine <charles-antoine.couret@mind.be>
Message-ID: <e537768b-9d46-afcf-f5b9-0552630cdff7@mind.be>
Date: Mon, 9 Mar 2020 21:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309203847.GA31358@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

Le 09/03/2020 à 21:38, Rob Herring a écrit :
> On Sun,  8 Mar 2020 15:25:09 +0100, Charles-Antoine Couret wrote:
>> Document the bindings for the tas5756m driver.
>>
>> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
>> ---
>>   .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/sound/tas5756m.example.dts:23.37-38 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml] Error 1
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1251057
> Please check and re-submit.

Hi Rob,

I don't understand this issue. My example is based on a real device tree 
and it works fine.

I don't have access to your 
"Documentation/devicetree/bindings/sound/tas5756m.example.dts" file so I 
can not reproduce it. I executed your script before sending the patch 
(but without extracting the example) and it was fine.

Can you explain the issue please?

Thank you in advance and have a nice day,

Charles-Antoine Couret

