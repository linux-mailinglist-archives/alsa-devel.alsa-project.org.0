Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E140D311
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 08:14:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27B2E179E;
	Thu, 16 Sep 2021 08:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27B2E179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631772882;
	bh=3mKQb79BAjNpga43BqLBfgqsTx/o0Vwr+DxK85XHOVQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOjZKo+eml24QVw2XKGMcfmsLdKuuIHnWPLGQ5yXpyaxejXX8OyDdESaAZcvz2F+r
	 2+yQvITIlCWJb0jK4ti/EVjg0zFwa0+E0UoBmHw0Bbi1QRBaQczO6kS9BdVrG/JAIr
	 c92RFYU+VvdF0Y0PA/CfDgoVs/LFLlqkvcozvWkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71349F800D3;
	Thu, 16 Sep 2021 08:13:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94AF4F8025E; Thu, 16 Sep 2021 08:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 263AFF80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 08:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 263AFF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UM+SG2I4"
Received: by mail-pj1-x1031.google.com with SMTP id t20so3785730pju.5
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 23:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HZNMA7tSuMA5GuIgtUt30cR/nYDH9U6KmyMDsA2yVKk=;
 b=UM+SG2I4ApMT5a6jYksOAFCRUkdA6ptwCn5cf6uCQsIOslU2CZmXj9eYvcIIzQFfvI
 dFYYHy8DmJD1AIF9aAAOHCHNDNmbmoBV+ZkLZza8YQB4WJ5I0D40udc7knOPt3g8XVsu
 07KuLd5K43HtPWrbNGYvnbLtoctmvFvJ7H6YwXz8ueTChZ2akgbLMw4vVJM17FA59cse
 TBcd3nxQ96/LrZiYgpQHpaahXwg2jmyn6AFD5sIGtbiw/S4njHzP5lwu5ddzO/kVEbdS
 +iyfWKBObyM/Cgv+WNTFQhLJmTP8IAgig3RYtgaDcdbKZ7PZS/aYd7Q+jZZc0Q8eyBFz
 xipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HZNMA7tSuMA5GuIgtUt30cR/nYDH9U6KmyMDsA2yVKk=;
 b=ns5Tk1RVKDlxaYTG65PN5rv2goZd93h8gSLndQXRh9wAoYLgFl4Yb+7GrYY3reirEf
 JBEdK120JEy/5J8tQp3Qb2wzwltmgb59nBJ5b3xddtAiudJWp3OK/OcMna2Ls5Pj71iV
 tuF4u0f9p52GwgslrCjHvB5GX/o2CkSJ/7B9OYP5Y+NSu0JvLMq+gQbZvS1ThHkeGRDE
 07PnRTeQvws+ZkVrhSWjvwGQRyAwVZ9WZ+P4fyAexVi9bQucstwozEL1nAr/Nm/JRRcT
 VGxFaVW9ug56tXdUnEO6qXaaRIzwwjkDfUVl9OEYp/wqYQsrT393t9YWLu2LYkVDKiPt
 175w==
X-Gm-Message-State: AOAM530o/tRl/PjJkOiDk6xcNoI4AZu3OCoYLVFIfE2z6uifvjbGDhXc
 9vPeBeguNzjmkA42Xan3gsg=
X-Google-Smtp-Source: ABdhPJxniqEzHW0Hj/qTNRFp/EmbLDkt0LRt8Z9manXvEI1SfEFwKhvvcsI94UXRUp25JRTIHlB+ew==
X-Received: by 2002:a17:90b:4b0f:: with SMTP id
 lx15mr4123499pjb.126.1631772796058; 
 Wed, 15 Sep 2021 23:13:16 -0700 (PDT)
Received: from ?IPv6:2001:b400:e3df:8666:8c4:83c8:7e76:8fe1?
 (2001-b400-e3df-8666-08c4-83c8-7e76-8fe1.emome-ip6.hinet.net.
 [2001:b400:e3df:8666:8c4:83c8:7e76:8fe1])
 by smtp.gmail.com with ESMTPSA id k127sm1771943pfd.1.2021.09.15.23.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 23:13:15 -0700 (PDT)
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
To: Mark Brown <broonie@kernel.org>, Seven Lee <wtli@nuvoton.com>
References: <20210824041647.1732378-1-wtli@nuvoton.com>
 <YSfMWOwwV30vdMy5@sirena.org.uk>
From: Seven Lee <scott6986@gmail.com>
Message-ID: <55b88b67-5585-16ac-0837-e22d56fc75f0@gmail.com>
Date: Thu, 16 Sep 2021 14:13:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YSfMWOwwV30vdMy5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 supercraig0719@gmail.com
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


On 2021/8/27 上午 01:16, Mark Brown wrote:
> On Tue, Aug 24, 2021 at 12:16:47PM +0800, Seven Lee wrote:
>
>> @@ -0,0 +1,1804 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * nau8821.c -- Nuvoton NAU88L21 audio codec driver
>> + *
> Please make the entire comment a C++ one so things look more
> intentional.

Okay, I will fix this comment for look more international.

>
>> +/**
>> + * nau8821_sema_acquire - acquire the semaphore of nau8821
>> + * @nau8821:  component to register the codec private data with
>> + * @timeout: how long in jiffies to wait before failure or zero to wait
>> + * until release
>> + *
>> + * Attempts to acquire the semaphore with number of jiffies. If no more
>> + * tasks are allowed to acquire the semaphore, calling this function will
>> + * put the task to sleep. If the semaphore is not released within the
>> + * specified number of jiffies, this function returns.
>> + * If the semaphore is not released within the specified number of jiffies,
>> + * this function returns -ETIME. If the sleep is interrupted by a signal,
>> + * this function will return -EINTR. It returns 0 if the semaphore was
>> + * acquired successfully.
>> + *
>> + * Acquires the semaphore without jiffies. Try to acquire the semaphore
>> + * atomically. Returns 0 if the semaphore has been acquired successfully
>> + * or 1 if it cannot be acquired.
>> + */
> As I said in reply to Pierre's mail and as I have said on
> previous verisons of this patch can you please explain what is
> going on with the semaphore - why it's being used, how it's
> supposed to work and so on.  The above comment just documents
> what a semaphore is which isn't the compliated or unusual part
> here, what's complicated and unusual is the fact that there's a
> semaphore in use at all.
>
> As I have also suggested in reply to previous versions of this
> patch I strongly recommend splitting the semaphore related
> functionality out into separate patches so that it doesn't block
> the rest of the driver.
>
> Please don't ignore review comments, people are generally making them
> for a reason and are likely to have the same concerns if issues remain
> unaddressed.  Having to repeat the same comments can get repetitive and
> make people question the value of time spent reviewing.  If you disagree
> with the review comments that's fine but you need to reply and discuss
> your concerns so that the reviewer can understand your decisions.

we have deleted the semaphore and actual measurement. We plan to
remove the semaphore after estimation and discussion. We estimate that the
operation time of jack detection is less 100ms so that the risk is much 
smaller.

