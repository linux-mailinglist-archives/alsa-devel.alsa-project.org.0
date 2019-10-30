Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48AAE9997
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 10:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7361C2339;
	Wed, 30 Oct 2019 10:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7361C2339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572429423;
	bh=+r2/4oiaY+532ttEVpuxfakDVQpkSmlaBpF6KdHgJ4E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfOavzhUyT9ehU+/o/EyiPFwQuOwEsvZXFeiO2zWaBV7KNmBzaqhWXms9qM30DxCO
	 QXP2e/HD6hcOyUUHBuRgHysNCQLRNfeTAM+8E10SdoJMzhWeVQaDbRaDCNnwP+0YQB
	 Au01V2ba62xwvqzXvgFlTDcUh2/7hD5lf32icK+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE10EF80361;
	Wed, 30 Oct 2019 10:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 218F4F80361; Wed, 30 Oct 2019 10:55:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6170F802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 10:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6170F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GOMrdPbt"
Received: by mail-wr1-x443.google.com with SMTP id l10so1547810wrb.2
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hs0Xj3TpOFo7Xi2C92NXMI0mClPmgg9hIzDJgVyM7dI=;
 b=GOMrdPbtza7bahmXFnK8BFCvQpxJK0EQx9lvmMYCWiUB8A+wjb7ykcc+ZmPoJ8CvTM
 jbyq/wUOW8NOvHiKNVmSnOYslZCf5BVbXBM+9pgUmRnmYbWAJ63oxlKbgAIbtYO6bvz8
 m/OtQlCrNANBMhVXthUDHMx4y0ZR3qqXBkI/C5auNKC2tYlJ10Qfxk4M12PXQExMxYb+
 QWWWervwvAlSmyLn037zf39ucwHSn8ESM+PcaORjBd6NWlYu0Q7I1q9gkWYPO5+X19Ip
 OSwsj3JqkQxj4M4epdlGZ/m8HpkLhowk+0Reki9OuLANr649y8RLZyGnq1wGz0de2K0q
 ZJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hs0Xj3TpOFo7Xi2C92NXMI0mClPmgg9hIzDJgVyM7dI=;
 b=OQCdnlKti/573GELs2SQIrWhKLUk/UULGKNdKmk74tXtHcV4LT2WiASL23V7whgtDh
 8s7cpCN0Yxh1LcXS1voj4cSYwaEeuaI4fAm5WrdxYVU4jffXwvI9wiYmoUaj2kflbQqO
 HbQjp/ymHgwiWjxR+1Kh3FsKVVYmJ2R36HINm9TpARnYe0jn4l2beq/TbypNvkcyZ3Bs
 GUTkLPiqYy/e91mAdF9NuWoONgHQK7N4z/xQ3Zy11itpvd3R5bAFc1lsvzMwJ4eNUlJP
 GJV135g41aY00sTga06Lplce9zMSzgFSC/gsldipnyTznZf0ohFA86toYDorfJZn0QAl
 uHFA==
X-Gm-Message-State: APjAAAUcfCe4y1q7s3ZdC0zy2IwruT11v3CC9vOqUSihuOLrnKg5fuLh
 ecmeYoUymDYM9RVQNIescRTzfg==
X-Google-Smtp-Source: APXvYqyEXL1nWX9W5G1Oh1yg4gjs2XsDhJV/J4RZbb5xTf2TxaEp1juTXqmwC1y55FdaXSwMim9fMQ==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr9057873wrq.46.1572429314643; 
 Wed, 30 Oct 2019 02:55:14 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id g5sm1675086wmg.12.2019.10.30.02.55.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 02:55:13 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
 <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
 <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
Date: Wed, 30 Oct 2019 09:55:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Vinod Koul <vinod.koul@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 29/10/2019 20:47, Rob Herring wrote:
> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
>>> Its Phandle.
>>>
>>> something like this is okay?
>>>
>>> slim-ifc-dev:
>>>     $ref: '/schemas/types.yaml#/definitions/phandle-array'
>>
>> Sorry this should not be an array, so something like this:
>>
>>     slim-ifc-dev:
>>       description: SLIMBus Interface device phandle
> 
> You're just spelling out the abbreviated name. I can do that much.
> What is 'SLIMBus Interface device'?

Each SLIMBus Component contains one Interface Device. Which is 
responsible for Monitoring and reporting the status of component, Data 
line to Data pin connection setup for SLIMBus streaming. Interface 
device is enumerated just like any other slim device.

We already have exactly same bindings for WCD9335 in upstream at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42

> 
> Is it a standard SLIMBus property? If so, document it in the right
> place. If not, then needs a vendor prefix.

"SLIMBus Interface Device" itself is documented in SLIMBus Specification.

If I remember it correctly You suggested me to move to "slim-ifc-dev" 
as this is part of SLIMBus Specification.

Thanks,
srini


> 
>>       $ref: '/schemas/types.yaml#/definitions/phandle'
>>
>>
>>>     description: SLIMBus Interface device phandle
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
