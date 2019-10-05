Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB3ECCA9E
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 16:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 647A21686;
	Sat,  5 Oct 2019 16:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 647A21686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570286906;
	bh=O8k5OLmw3lfjoqWcEg3ZcjkZu0W8JoTTfqDb2vTdWhA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7fddFTuhPZeeJYxula6oTO3NC0hcbK2+Siww7PdEyPd9Gvk2CX3RlUGNAASpS6xV
	 APDoBYjBaBC7Jxdq7zANDo/UKPs5GU9N1nzXo13AiJptfL/tcBI3T+T91kEHw+UBwc
	 GVW44r1Hr40qRoNBRIs0efOgBwsFhXeEgXcG7ckE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98534F80506;
	Sat,  5 Oct 2019 16:46:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA503F80506; Sat,  5 Oct 2019 16:46:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B9FAF80137
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 16:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B9FAF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UKtEXJel"
Received: by mail-pl1-x642.google.com with SMTP id j11so4565025plk.3
 for <alsa-devel@alsa-project.org>; Sat, 05 Oct 2019 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2GBi70vECOwhvce3BLHU/TuI7brFfv83/feCAkJLZ/c=;
 b=UKtEXJel0u05+vlSu3xZpzDAWFVP3LWyjOaJSTpUd/sc07UrcEjRjQz3K1Hrp47pnq
 IgOc3c7udWwb7ObmkWeyotAPTVVkWJGlG+DHJilRYLdaCXmAzdHVLAU2M2XPuczpt+hB
 S9x0fC9QxsnYkh0BWetanvmy4YOtfm24DnwS4g72/Qujah1WSvAMvuU/yqk0Y3Pgi0wi
 YBaKjRTKWwcsVo2m4G9gR6rzYsIO16hP0S+Uv3TBH1UGfDkYx6bSiYrFEN3H5HmSIOkd
 NlW90npX6MThEl7ilkxkubw+LMkPCJkC2sbC12WB87SUErtbt2C9kY3rgZP0dlihY/pP
 Bymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2GBi70vECOwhvce3BLHU/TuI7brFfv83/feCAkJLZ/c=;
 b=i7maFD0PMK1W9TD+KxMrG8s6CH9oHN6uT1d40rT4ekmxLJgm6yJ283J5ojoTbGYMSg
 0e10yUndthFNr7LWDqxVND8n0LKPLnwpiRxkctm2B8pMGUP2mMY/kV2XVFiFBujuXJWx
 klCS4F+UEQalp4nFHjccpvfckp0NBuZf1v+hq8oDM7LWe5haKNcUtf8IsoZrlERMzLgR
 YmtmFko1nISu8pBiWTqahKn9kuNZDt1WoM/s4s3riyabK6xMfEW+BOSA9WmtCEt2+I3v
 PMUK185Gae/rg99FhHx1eV/VQou6cVJYsMQDo+jTCOUMW8NB8P9KpmJ/lhkqCL3hxZ3K
 94Aw==
X-Gm-Message-State: APjAAAWbaIOATbdZunWLmXnj9asBqllMa5G3f0zK4+MkdjY1zySpQAsg
 mfs8xtoccYIKFkgujQNJX5g=
X-Google-Smtp-Source: APXvYqy5nnJWpToIzpmPi2+B9C1Dqm2j3J7M5hxdQH8GNYd8wNm8nJ3WWc4HSSeAVwLdt3kRX8x5zg==
X-Received: by 2002:a17:902:ff12:: with SMTP id
 f18mr21218570plj.266.1570286793693; 
 Sat, 05 Oct 2019 07:46:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 16sm9934352pfi.55.2019.10.05.07.46.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Oct 2019 07:46:32 -0700 (PDT)
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
 <a0b2e9a3-ca77-814f-b7bd-edc69f00fce2@roeck-us.net>
 <1570255179.29077.24.camel@mtksdaap41>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <70b77fb3-7186-734d-3415-64acb30bab8f@roeck-us.net>
Date: Sat, 5 Oct 2019 07:46:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570255179.29077.24.camel@mtksdaap41>
Content-Language: en-US
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 yong.liang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 eason.yen@mediatek.com, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add
	reset controller
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

On 10/4/19 10:59 PM, Yingjoe Chen wrote:
> On Thu, 2019-10-03 at 06:49 -0700, Guenter Roeck wrote:
>> On 9/27/19 3:31 AM, Jiaxin Yu wrote:
> 
> <snip..>
> 
> 
>>> +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
>>> +			       unsigned long id)
>>> +{
>>> +	unsigned int tmp;
>>> +	unsigned long flags;
>>> +	struct toprgu_reset *data = container_of(rcdev,
>>> +				struct toprgu_reset, rcdev);
>>> +
>>> +	spin_lock_irqsave(&data->lock, flags);
>>> +
>>> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
>>> +	tmp |= BIT(id);
>>> +	tmp |= WDT_SWSYS_RST_KEY;
>>> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
>>> +
>>> +	spin_unlock_irqrestore(&data->lock, flags);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
>>> +				 unsigned long id)
>>> +{
>>> +	unsigned int tmp;
>>> +	unsigned long flags;
>>> +	struct toprgu_reset *data = container_of(rcdev,
>>> +					struct toprgu_reset, rcdev);
>>> +
>>> +	spin_lock_irqsave(&data->lock, flags);
>>> +
>>> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
>>> +	tmp &= ~BIT(id);
>>> +	tmp |= WDT_SWSYS_RST_KEY;
>>> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
>>> +
>>> +	spin_unlock_irqrestore(&data->lock, flags);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int toprgu_reset(struct reset_controller_dev *rcdev,
>>> +			unsigned long id)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = toprgu_reset_assert(rcdev, id);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return toprgu_reset_deassert(rcdev, id);
>>
>> Unless there is additional synchronization elsewhere, parallel calls
>> to the -> assert, and ->reset callbacks may result in the reset being
>> deasserted while at least one caller (the one who called the ->assert
>> function) believes that it is still asserted.
>>
>> [ ... and if there _is_ additional synchronization elsewhere, the
>>     local spinlock would be unnecessary ]
>>
> 
> I'm not sure if this count as additional synchronization, but you could
> get exclusive control to the reset by calling
> reset_control_get_exclusive so others won't try to reset the component
> while you are using it.
> 
> In this case, you still need spinlock because other drivers might trying
> to reset their components and they share same register.
> 
That isn't what I meant. I referred to synchronization in the reset
controller core. AFAICS the reset controller core prevents parallel
calls into the same reset controller driver using atomics. Unfortunately,
it is not well defined if additional synchronization on driver level
is needed - some drivers implement it, some drivers don't, and I don't
find a documentation. Maybe Philip can provide guidance.

Thanks,
Guenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
