Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830430ABFB
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:52:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25248177A;
	Mon,  1 Feb 2021 16:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25248177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612194770;
	bh=0r7Ozp7SmV4q4j37Tc6MaHRyQuCuvyT6WHvsgwq2BaE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oGmp1YfUEuQAFAztNG00EAhn4yev4/PWuhCoGg8fnqQ2RGTyrba2GfGCwgbAXjaOt
	 h8AqPAcse0WGwhVdHCDw57FH3408QRq1AcXIlOLx0OCQlBW36OvRsvUA9YtG0kqceI
	 sasXBVTKIC/Jbt8FhktP3lhuGMG2U/kslviB+Znk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C878F80234;
	Mon,  1 Feb 2021 16:50:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF7E0F80224; Mon,  1 Feb 2021 16:50:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34D86F80154
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:50:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D86F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="z7599Ovx"
Received: by mail-wr1-x434.google.com with SMTP id 7so17125050wrz.0
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jLXchjLYpfk30+3JtEghxJByQwUZC+98ZI/GjYhNUbg=;
 b=z7599OvxYrLMvpHxsHNK05a0YqO/c78Lfy4XVtHh6ZZAiQZf+GX3qcSBY3dOyupnJH
 WzhK+kImlQrQthVe2a6Q67Mun9T1xKgr0+ZFsdkRqB1fs6xElDf3LHkTDjwG0kcZ7sTw
 vP2r1qjM8H5wtH4rNomK9qsYtqlJ15hkTZROhL9OxCfC+CtgLdL1GzILYSevKINCP6ho
 u3heyPhv8ix87hUPyPW4cXCiFLxOSiWEI8rg/RHMmeI8VWZnKHM4RLs217ksX5ApWpGB
 qbKjEdXcAJ0qvOYVbSsKUE3KE7drPusCLbgKGJp7T5sA62rM374gnEXMWx65bF+7lh3g
 fofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jLXchjLYpfk30+3JtEghxJByQwUZC+98ZI/GjYhNUbg=;
 b=cxUJnF7jyzukIA8mZGhZER1nL7Iq5v9Xdie6WgX4WH9XDZYjrioGgKhXoNtgMawLkq
 PxpEJWNjSBokZnn9YTQZ0R76m1dmiGPIsnA+UU0F8LChbvsWxutJFvtfJSLwcj5fBcRk
 DY3BmkplJ4wHOlw6Z9kk0G5CkeXz+Hw9o/e9Tv6h363+wssOMLg0V6zZAVOV8WaiAdjF
 bu4JXsOjcZ2ksmAEtAAdD9tkTRbkASpVnmiTAbMufy4QqbSIxvq+4S8IMvD7j12UG+jY
 6/jrrvr+dkSws2+kEgg9ME4wd/R4CSRDzIa9OQw9MFCPmZZC6WNIVaTMZHw0y4ZMcbhl
 Dz1A==
X-Gm-Message-State: AOAM532O3jQgkmHpGVOxu1SPC48T9YfQgjQKq1I20vYxg6RA21nWcVfh
 T5qki2p85x+gQwgOEKoWKUOvP6Hs7vIClw==
X-Google-Smtp-Source: ABdhPJxvTN05V+JBPnV7r7zqKX3YZT+mvFxve6FYJKYvgJEGf46lnACLZCASNhUQsNJ33KB5Qeg3kA==
X-Received: by 2002:a5d:4242:: with SMTP id s2mr19168962wrr.108.1612194629550; 
 Mon, 01 Feb 2021 07:50:29 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id x9sm5316729wmb.14.2021.02.01.07.50.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:50:28 -0800 (PST)
Subject: Re: [PATCH 3/6] soundwire: qcom: set continue execution flag for
 ignored commands
To: Vinod Koul <vkoul@kernel.org>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-4-srinivas.kandagatla@linaro.org>
 <20210201141642.GB2771@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1fef14fe-b254-9282-c213-d23e3b7d5f61@linaro.org>
Date: Mon, 1 Feb 2021 15:50:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210201141642.GB2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 01/02/2021 14:16, Vinod Koul wrote:
>>   	/* Configure number of retries of a read/write cmd */
>> -	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, SWRM_RD_WR_CMD_RETRIES);
>> +	if (ctrl->version_major == 1 && ctrl->version_minor >= 5 &&
>> +	    ctrl->version_step >= 1) {
> why not use raw version value?
> 
>          if (ctrl->raw > 0x10501 )
> 
We can do that way as well, but Major Minor seems much clear to readers!

--srini


