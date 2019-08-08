Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064C863A9
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 15:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9821615;
	Thu,  8 Aug 2019 15:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9821615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565272220;
	bh=aroP/OfhkDa0ENXNF9cWymt4mH4FVoOICMWObOpfwVk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXzf2iAMZ7BHVPlvW/fz9/8XyNFFjweAGcsNfe+5p4aLMRK1UKI9Js9QRktJFlx21
	 uIn5ad5FwzXwzn6kmXPn19Uw+FqdDx7iC3q4JYbbUSfmajlWe0IV0xQfMkdNJwqmMx
	 qsXG54+wpJ2gxmR3fIMRgXOEiRn7yeVSNs/PXBlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5407F80535;
	Thu,  8 Aug 2019 15:48:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45841F80534; Thu,  8 Aug 2019 15:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC998F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 15:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC998F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="apJXGsYi"
Received: by mail-wr1-x441.google.com with SMTP id z1so95010440wru.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GcZ3zbECdiPLNKqqmt56+5zBkRjZxc9TD5pjLBob95w=;
 b=apJXGsYiKecvN9aCUGlleABvwzWhhNUx8AvT93d1B9Z5KX/hgJJ82oq6sg2KSpD0HN
 YqPcBygscdSw1OzzUUentXgHGBy5uA43+V1bcAX4xW2IzYYPEv0ByC5DJQLD2RzCtWXo
 3ICiGlPzerdFCozXtxwSHBayKvVOLwI+pAY33dMaTtb4NqUy8qUiaN9UTxFNUwFow7/6
 hSQex81nJ+byGTscj9e2GwGRcJcyo6pJ+TRhC4LxqV57tFdC94ZomJRhKplMYLaVOCac
 UnQ9gpjvOVuP7hTmfsPBj7QjhO2uZGrN1r2USGPjMyuZ4yFbPbSpOoNUef42Z5YLvtLJ
 KHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GcZ3zbECdiPLNKqqmt56+5zBkRjZxc9TD5pjLBob95w=;
 b=OKbxOj2w0oy9f9hdVdu9O19oGXzvxxDubNzS4tlC9Wy9t+9ErPRzOwBMU9Pq5ofSvY
 7zzEWsWbWIEjZADkAuiS74o+ZDeEXwna/fqP1uu/KqTzU2ZAg9yKn9xqCiIC9f9Tct60
 RMB6uURlC1/A17KAM6V7bSlpybI5ThQ7YzhK2rFusfQ0qVjCJ79RcdwpA2+cbPtIqdDe
 4ism6wy78Pd6KDkVGQzGZOMWs+rUz+y6NJg0H0Ru3tnzL+BmGiE5iekHXRwB52CQB0hN
 AiqY5jQEGf/8Dr7M9xFlAyGs/Y4b4gyaLeQjDR5fLfCbAbT/jimVTHmOomMrZOwT93YL
 wkSw==
X-Gm-Message-State: APjAAAXV+Q+rMmR5Y1NXkWS8IyEc4qkW5Q8flMDHkuanXFbqCbLn75IO
 pgyQbxstaRRKSu0f7HqMqBucIQ==
X-Google-Smtp-Source: APXvYqzZEKSzRsVNoSQVYnVv+D/4c8aED8O3MSMhnUXr1S/gKC93rsWnOKFzP1VrFFrVyOnWbqjP6g==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr16242610wre.226.1565272110713; 
 Thu, 08 Aug 2019 06:48:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id v23sm3153431wmj.32.2019.08.08.06.48.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 06:48:29 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8529d213-bfbb-780a-092d-3607eeb5e543@linaro.org>
Date: Thu, 8 Aug 2019 14:48:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, jank@cadence.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: fix regmap dependencies and
 align with other serial links
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



On 19/07/2019 00:02, Pierre-Louis Bossart wrote:
> The existing code has a mixed select/depend usage which makes no sense.
> 
> config SOUNDWIRE_BUS
>         tristate
>         select REGMAP_SOUNDWIRE
> 
> config REGMAP_SOUNDWIRE
>          tristate
>          depends on SOUNDWIRE_BUS
> 
> Let's remove one layer of Kconfig definitions and align with the
> solutions used by all other serial links.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/base/regmap/Kconfig | 2 +-
>   drivers/soundwire/Kconfig   | 7 +------
>   drivers/soundwire/Makefile  | 2 +-
>   3 files changed, 3 insertions(+), 8 deletions(-)

I have been using some thing similar in my setup.
I did test this with Qualcomm WSA881x codec.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
