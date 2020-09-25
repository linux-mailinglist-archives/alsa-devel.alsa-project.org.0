Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E48278E60
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23445187B;
	Fri, 25 Sep 2020 18:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23445187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601051180;
	bh=4f5kCSH9uux3LZAmYJcaB7GcAfzQRgd2b4a43OyTX58=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqY0upolNzOu/2kafUa2DSi5lgZBkoOik2BTz/VuYt2nS9rBQGCdiT7mwYWXk0X/x
	 s8WwgPTvBar1rRbGLsIt1BHfyqe3tjEY12eTQ7zbTqTDBqJRd1U85WZj0PbyMvHJXA
	 TQvGJNJTFmvsmskiFWDt9kgOmnzsoHrp4nXmHzPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36E76F800F6;
	Fri, 25 Sep 2020 18:24:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B93DF801EB; Fri, 25 Sep 2020 18:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D2CF80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D2CF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JC2GZgiw"
Received: by mail-wr1-x442.google.com with SMTP id k15so4195705wrn.10
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 09:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I5b2yYA2H4VM6u2qVjxGaHJdOStB2ElKEN8vnfRBiuU=;
 b=JC2GZgiwESKVcRillVvGHypsWw7t/2fF4DPXUTEW1axdMbkJJOXfI05bjVGjDiUchJ
 FNa3MdOl8MLfgYDy3U17p92epChx/2ZABKw3rMrOPld/YpwHr9Duf5u5u4vu+bWXrav1
 tZYTHQCl9s6qZuOLyAKZPD+LQfywXIWli/RPNvPvgXwV2yBF8kpe7266fU1xunt82o2F
 Mgb7v6cpFtlb9kwVAHGWaiYkq/t18t8ZmK8QCCCVhtjLi22+ByrgD4pdLoln5kH0FpDM
 iM6QgonnXBzrvR0yC4ay8Ir4ewF7FrTJyHzj0bUTGcB/Yu5zEjGFc8H26pgxYB30PX7U
 vwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I5b2yYA2H4VM6u2qVjxGaHJdOStB2ElKEN8vnfRBiuU=;
 b=hv6SbcHfLwy9gZ6b2w92TUg3IZU0jAXkQMz27/4jMGux/ualYpYXqQUGOeK/qqKUQV
 PKlp9c06JpbxhJDPqmhg26DCwrjAryyKLyAgc2nOjmIV0/fnHsD31L5ZEEnExMyW8Tyy
 JZFbaYSaU9pqFw8BcGkdvgl6tBKCncbEdruVgUlHqEs86gzd2i4LL0xjU720qUJaFRyd
 ShayXcBpG902TyeCfaoXNEdzqRCZSU4xka5sAwYX9dwlJYHIjiq+kShrD0ivKHqC+Y90
 LDeoaMHQctGwbMXraPZYtQbsOHoV7Iljd/1qKW/c0iyRAFcjnhYRb0kRnyR6miYP5VKj
 O+Og==
X-Gm-Message-State: AOAM530g63OcZzFHayFAUuZ6ECCFXojgUnPltLdKip8+lO4KhE0VAG/i
 SCoHqJWCKrCWYGciyyuxCiURqA==
X-Google-Smtp-Source: ABdhPJznA5uI0Mqe7T4SzwF0kpNwQkFcevBQ/k+9mJVhy2ipxF0AfU2ypVRZ7ErBn3iG0ItkIvgCPA==
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr5723869wrc.71.1601051069083; 
 Fri, 25 Sep 2020 09:24:29 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id k6sm3296080wmi.1.2020.09.25.09.24.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Sep 2020 09:24:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] ASoC: qdsp6: Drop of_match_ptr to fix
 -Wunused-const-variable
To: Mark Brown <broonie@kernel.org>
References: <20200925084925.26926-1-srinivas.kandagatla@linaro.org>
 <20200925084925.26926-2-srinivas.kandagatla@linaro.org>
 <20200925161736.GE4841@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <04e564b5-2345-2e44-72f3-9a388e76b4ab@linaro.org>
Date: Fri, 25 Sep 2020 17:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200925161736.GE4841@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, tiwai@suse.com
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



On 25/09/2020 17:17, Mark Brown wrote:
> On Fri, Sep 25, 2020 at 09:49:24AM +0100, Srinivas Kandagatla wrote:
>> The of_device_id is included unconditionally by of.h header and used
>> in the driver as well.  Remove of_match_ptr to fix W=1 compile test
>> warning with !CONFIG_OF:
> 
> It's better to fix this by adding #ifdefs around the table so that we
> don't have unneeded bloat from the match table in !OF cases.
> 
sure, I will respin series with that change!

--srini
