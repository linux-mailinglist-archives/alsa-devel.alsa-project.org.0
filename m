Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B08C060
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 20:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 938AC167D;
	Tue, 13 Aug 2019 20:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 938AC167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565720341;
	bh=CwsieTKmqgHomfrMFF0HmKf8UGjw378+TQvvqQs3VT4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqq6HjYYwhUY0CAloGhCYjk+sS8qFvmI2t+1UuxrVHweX9khCjGUGkaD+/PpCunVh
	 CCKZSdBqVA1HKMkTZxA2kzSwrI5NlGyYiiEfoNSjIuLndUzfcFoVANM1OHfC3oUFAx
	 r3vbp7/oWAO3HorVJjnYZQD6VnONVyjv7CF43U4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3597EF80273;
	Tue, 13 Aug 2019 20:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6447BF80273; Tue, 13 Aug 2019 20:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13E56F8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 20:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E56F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IZr+C1Iz"
Received: by mail-wr1-x442.google.com with SMTP id r3so14900588wrt.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EPkqHFTT1KvxgsaHnKLv7VXPezcT4eKkPTs4jCtFfDM=;
 b=IZr+C1IzDl55t6GTa2m5J043jUJjCECxfdNp4mzjhSWfxcBwii/qZ0rxBDRHviGetc
 vPhWnCIpy/GOrFojZXDQB4CEG5UAaUJubJCrynkow/sMK/FSUC0SKDxJeTvazGezY5Z6
 aCVmUkUD36h5qNQJ+sXABBJHsUBLceges1UNXbeURj4Uc9Oy3P5JmU/xwk3uQENa7RIj
 AiAsBOefbWNRoty29pYp8bRktkiCUo0UnmLxt/k+qHLys8iXeUqIDB46oo3tSaLNpnru
 SOa4UVLzZJ1tMC6Lu0LocylCkVpSt+tPuAe3qhWPBHv30A4V45nnQ1t7Bch8JVPdzT0X
 C9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EPkqHFTT1KvxgsaHnKLv7VXPezcT4eKkPTs4jCtFfDM=;
 b=q8n++3VCxWEtz1ZBS5XRiXvX5fuCHeqqMp8zadDUn9MlYPzI3KokjD/8OYfRZtkyDa
 n4N8EdhaG4z6NIMCZspfo0v/Aix9Nqwpesg7bpotPV4BSwSneXzvAtcNMnS9avYZC8cT
 V9p6FNhBafccFnLg8UDmWMDuncMio4cY6gLkCMXfgTEvNpzjbhlthTdcbr72abaixGHH
 cyeqDnRxzHPhviEWV+l7PAEqp175XTLLSlPHAdDvWD6RKLQftQywcIB5GBrtfQwqGc3R
 IAGTT+aVpaun9xFXjU4kc8pHmFIfGBo3nUrd4h7nKUxPWkDEdph+AQa6fEWX3y7TnE/U
 +6Tg==
X-Gm-Message-State: APjAAAXVoDdM8J+vvSVcqA73c+1J6hkT98RaGk3KhcKcs3w1IC4jg7Hg
 0Hp+q9i/xNgdKDHTs502Vvufqg==
X-Google-Smtp-Source: APXvYqxmRERDkAw8Vs6MjMd4K+FOgvlYItlA7RSbC053dvmaYrmvTDCtWuRg32Fud5EUiR4kYm0DYw==
X-Received: by 2002:a05:6000:118a:: with SMTP id
 g10mr47193038wrx.175.1565720232097; 
 Tue, 13 Aug 2019 11:17:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c6sm3191349wma.25.2019.08.13.11.17.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 11:17:11 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-2-srinivas.kandagatla@linaro.org>
 <7e462330-a357-698a-b259-5ff136963a57@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1a02f190-0aab-d512-ceb0-4a21014705e8@linaro.org>
Date: Tue, 13 Aug 2019 19:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7e462330-a357-698a-b259-5ff136963a57@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 1/5] soundwire: Add compute_params
	callback
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



On 13/08/2019 15:34, Pierre-Louis Bossart wrote:
> On 8/13/19 3:35 AM, Srinivas Kandagatla wrote:
>> From: Vinod Koul <vkoul@kernel.org>
>>
>> This callback allows masters to compute the bus parameters required.
> 
> This looks like a partial use of the patch ('soundwire: Add Intel 
> resource management algorithm')? see comments below
> 

Yes it duplicate indeed!

I will use that patch!

--srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
