Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C67FD373FF
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 14:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47ABC1660;
	Thu,  6 Jun 2019 14:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47ABC1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559823577;
	bh=UsDs5C+IpiZAYDqbZDcYRqFkftuApye57NzL/WRIpBg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oC0qgdI4hGhNqAd/Sz6yG+4DMBAaskq5kXOwTA3HSKSdOaKwvsDdL0iqML0Umvsfa
	 FC6jh0KwLBFLWsA1jeQMUWkeG6+9CHpdCnPkxZJVVU1JRSsFPysxRhXzuCPUWHzO77
	 vG60ZewdziFv3Tyh8+1/Z/S1eh/aEap1Lp3TKTBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DBE7F896CE;
	Thu,  6 Jun 2019 14:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95874F896EF; Thu,  6 Jun 2019 14:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17F9FF80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 14:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17F9FF80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xlVPpLHF"
Received: by mail-wm1-x344.google.com with SMTP id t5so2194441wmh.3
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=azkuI4+MWwGW5E0d5xwZ4dlYelhXqH8PmCOhVxLXrWY=;
 b=xlVPpLHFONV8DhQiGCaJ3qmDH1rm9bj0FTTQwPZSr274qwc7bZzfMkx/ha5oe0YSNY
 ylk4PNuYpQKWzgR6XcFPrGgtpbU3C/lFS7voccxf5zTI4oCcKWKF52nxgAEZ6yg/g+wd
 pJa9SQQlHY/uiC/oMm7HP9Ikkr7nn7lxD1giEOK6h0xVKxf+D/lC5JGfMAtl1OUXFVnz
 gV4xiEdBG66sTU2W/Pgat5pHBTllcGNLANuF6CsKCsPTQ6A4KWcfIm8FjXr53VGTsoac
 SS5c84fRfiAKlDk3KB2P12u/73eumWsEE2p3TDsDbQL00yRcz75mOLXtg4FFPFAhskD8
 K+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=azkuI4+MWwGW5E0d5xwZ4dlYelhXqH8PmCOhVxLXrWY=;
 b=U8hYhoaEs/Q8xv0Y9DVWy5xR/AKds+HPxNvMByKgjVXaIwaon+mdbAz2ODKoLMWvGj
 AF3L22lhT2lIYZFAgMrEASjea5FBBCdtB22w+XvvjPwvp9paxCa49Tx224n/Ad0aeBzF
 qLgzeP8xeqgwM4iZl0AC4S9oMGq/4Arnm2RQ6mbYPN8AgIYCbdtrOZxCE8MUltPYiO/l
 OjQTWHLvBIZg36Ae+xFIqkstmhMUnh5PdQt7exK3hAGiegH4UqU00L2tSj/aPiV+WzDQ
 mUS0l+lstLYVSSiZ91SQO9uPPRoFp/RptiOyssRRI6Z4teDBcJXmWtD1+A+uYLP/OV+j
 Ieww==
X-Gm-Message-State: APjAAAVBhtKotc2X/rYzrBjhZMblDn2l7A1yJpqyUhGFWJglmH4d0OVw
 xkZ5RS/WxroplJDc3+4xAGqp+g==
X-Google-Smtp-Source: APXvYqwH/jszr4uALTkdlP+mnNr+rdHckw2wtCQBCkO2GqlxRaBueq8W+FcZFLpUVxdLNwrsnFC18Q==
X-Received: by 2002:a1c:99c9:: with SMTP id
 b192mr15555072wme.142.1559823465220; 
 Thu, 06 Jun 2019 05:17:45 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h17sm1502740wrq.79.2019.06.06.05.17.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 05:17:44 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20190606114002.17251-1-srinivas.kandagatla@linaro.org>
 <20190606115441.GB2456@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <db763118-b3d6-cddc-c8ea-965d67f8a798@linaro.org>
Date: Thu, 6 Jun 2019 13:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606115441.GB2456@sirena.org.uk>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Add sidetone
	support
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

Thanks for the review,

On 06/06/2019 12:54, Mark Brown wrote:
> On Thu, Jun 06, 2019 at 12:40:02PM +0100, Srinivas Kandagatla wrote:
> 
>> +	default:
>> +		pr_err("%s: event = %d not expected\n", __func__, event);
>> +	}
> 
> dev_err() please (and a break; as well, it isn't strictly needed but
> stops people having to check that it isn't needed).
> 
Sure I will add break.
I think the message itself is not required here as we would never come 
to this path.
>> +	SOC_SINGLE_EXT("IIR1 Enable Band1", IIR1, BAND1, 1, 0,
>> +	msm8x16_wcd_get_iir_enable_audio_mixer,
>> +	msm8x16_wcd_put_iir_enable_audio_mixer),
> 
> The indentation here is *really* messed up.  What are these controls,
> with names like "Enable" they sound like on/off controls in which case
> they should be standard Switch controls.
Yes, Switch controls should work, I will try that.

--srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
