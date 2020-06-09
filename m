Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AC1F370E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 11:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FCE01698;
	Tue,  9 Jun 2020 11:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FCE01698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591694895;
	bh=ueOfkvGKEwvIcGR+sLDhUorNqA2ZYfx2hELl7wye1uE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k60LJvKauiXsKAMwLirmnML79m0Mh8J5q1fWq8NdajPiNHBcCvvUKrRx1R6orW9az
	 E6Y9f0ws9LBg8hOOGXQQUokCRiWjOGIE84KUHoDBoHysjqExKRq69iGMBqsqfxQ2qG
	 t0aB6nNjMqnLwG/H81PR31POPPTpm8oYwOMyEmDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B763F80088;
	Tue,  9 Jun 2020 11:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46C6F8028C; Tue,  9 Jun 2020 11:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32788F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 11:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32788F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lwGlA9aF"
Received: by mail-wr1-x444.google.com with SMTP id h5so20462520wrc.7
 for <alsa-devel@alsa-project.org>; Tue, 09 Jun 2020 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OYOer7lO0HMljBOHZ7VovGKXhgNnImZ/DWlp+lLXDhQ=;
 b=lwGlA9aFiWXoQo1DkoldN6nVQ6xfAmPPpEBNreQ/NY8mCy1e5jYCYL4LzarPPBhOPj
 psuNkcGRcO69SKRqTAcHPKoBP9vvtaeMvXgBuYaL5TcCATeNIuFJZ0iUOguVCImoPCdK
 SBGq19n2APiuvZPfc+IVAggLo1ys2yio/nm5ml6EnIqYvlHBj9TZsz3bVSoXVwsH4ZEN
 aoCmQl4YzjUoDr8hMwazPRvBOgPbUUDa3+GPOdEI85rbMxuXuHoizvwN4dInjJHY//xM
 PVrN6ZiLu2DQ5p4B5S1SQvL4nuO/gskTnkuE5KVpW0yOWQBuNejazQzZ4uReaCAv7tVC
 zXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OYOer7lO0HMljBOHZ7VovGKXhgNnImZ/DWlp+lLXDhQ=;
 b=HSu3ZlzxuB6YE1kxGj1zD2aqw7MYte+jB0CuydZoTD5aRDJ5WgbMG8c3BNPvNi/HPD
 9VKwp6lejLmAYw+bZsQBdwfPipHqjv6AUGQfxjBUbHFp50qzD1HWB500XK2gTUE0YFbf
 ap+bJLYbpoFJHaPy+j+EvVaI6pXctS9gcnad9GOkclTpxDI2Ci/TwkBQ/PZ0vye0Qcoq
 UAWykCS+b1Rxpnja0F+3+vBPZpAxZouMeaUXEzkJqX/gVh4thfjk/BqoDcxkmaIDfK2X
 VfCxyDnpoXWkAMTrfT2RkawCq8bgUYhiu2sTXkjALjcof9osRw0BWk/8vCiRTZ3ZIPVu
 1PUg==
X-Gm-Message-State: AOAM531zYRFVl2UmkgfjJr0XD/0tEwExnG9iaJ3JEsNSZBdCQW4c9pEK
 5P1uZ1vRMxoknku753TQXMiFCw==
X-Google-Smtp-Source: ABdhPJxWMvDjtTmVzjIvQ5bnpDEp9HTCwOBamTqcDavKulml7UlPJ+hGq9M6TEK4ho5i4CsMZThnYw==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr3170101wrt.381.1591694788647; 
 Tue, 09 Jun 2020 02:26:28 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id b8sm2862295wrs.36.2020.06.09.02.26.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 02:26:28 -0700 (PDT)
Subject: Re: [PATCH 0/5] soundwire: qcom: add mmio support
To: Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
References: <20200608204347.19685-1-jonathan@marek.ca>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7fc23e7d-b6ef-b97d-0252-8b6fafae64ac@linaro.org>
Date: Tue, 9 Jun 2020 10:26:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

Thanks Jonathan for the patches,

On 08/06/2020 21:43, Jonathan Marek wrote:
> This adds initial support for soundwire device on sm8250.
> 

One thing off my list!!

> Tested with the "wsa" sdw device, which is simpler than the others.

WSA881x?

did you test both enumeration and streaming?

Are you planing to add any new WSA or WCD codec support for this SoC?

thanks,
srini

> 
> Jonathan Marek (5):
>    soundwire: qcom: fix abh/ahb typo
>    soundwire: qcom: add support for mmio soundwire devices
>    soundwire: qcom: add v1.5.1 compatible
>    soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
>    soundwire: qcom: enable CPU interrupts for mmio devices
> 
>   drivers/soundwire/Kconfig |  1 -
>   drivers/soundwire/qcom.c  | 42 +++++++++++++++++++++++++++++++++++----
>   2 files changed, 38 insertions(+), 5 deletions(-)
> 
