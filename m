Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D79350662
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 20:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28694166D;
	Wed, 31 Mar 2021 20:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28694166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617215637;
	bh=Lyz80fue7C8Ra9rz+0ltCU39jw5PDLF8g3B/hTZWLto=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUzvbFiH/937CoweR/ZFefndbZzYEbFyMXQ732BTxj4p+ZI4vwejdSEJP9ZsdKrD0
	 DrGwP5xsi0ZVaS66apqYOlZF0uC4IPCpKrZZ1X5rZDfE/7yAldUDnTXl17fFgRBwzA
	 dYmiI8U/aAi1KpvXxgYp9yhxthQAbGf5XoXvQ5Pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D5CF8016E;
	Wed, 31 Mar 2021 20:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 070BFF80166; Wed, 31 Mar 2021 20:32:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F15CF8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 20:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F15CF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RtkjC0li"
Received: by mail-oi1-x235.google.com with SMTP id x2so20950309oiv.2
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 11:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qpDJgLSf+XhBZgWjOA4HUIRo8TMIOMt4qQN8xcUT7Yc=;
 b=RtkjC0li+ibQ4Jqa4lRUa7G264zhtqFQ0ippTOexSIit4u0rgqCjWmvEi59FLRlMJw
 C5hGgoCAT+8X5Kekza3SlgPOZrermppqx8iclo+ZGv4pOiGm8ijyOryQEWcdaDvg3HHM
 7HNknHiNiQ8NGjA6BRXHp3flO7hmlITbC7q+UWXljyawBsgHl+vIId6wnt4wSzuMNrxi
 XA9Hkdm9GBzSRo0BqVo0CMtXFewl6RpbRQAY6N4lZF5d1/eaz5rXGKzogaFHVggYOmbT
 yv95yUjZ+5Qj3sNovTijK8saN4Mm3GpY7Jm93T88BLJToE9P3dMchHidaBzTdz8l7MKT
 PtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qpDJgLSf+XhBZgWjOA4HUIRo8TMIOMt4qQN8xcUT7Yc=;
 b=p9e0oFRaclTiMfa5e4BMhKWBKlMNvfzGzD9yRI07KL04uJ1dAogJApBlaNyuyoOw5Z
 6uJ3i0yaXHW7/tq188KW1ZVVkTHNdcTNM9KRvDZqjBlgDDW7X91RnikY1fCg26lEmN78
 vu5Sz3kpICnD7pHuVQv3lnifr3uDfrvVP9Pqg6ofFYMRN1xRMuRYSI9Jw3nO3Tu5z5Vs
 l8A7XLgwFnqNaT5lhOXD5nv6RtxxsOou52YhwqMNDDadzz+McNHTsRKJNM1fM7k8J2eX
 yrlDKtQs8ZliN25zsN7nynJFUGpKCpOXckdxuEXJODp5tLpLzUcV1aBlmjmvN1t8sDNJ
 BOtA==
X-Gm-Message-State: AOAM531/VUBxQ/mVPcWTR0Kysmfxjl0dorrIXzwFl5iS6yEs3az7/llu
 IebxfNtBqgRmrz0s6yzKrn7PYA==
X-Google-Smtp-Source: ABdhPJw9aZIIFK4bl49eSq1vxFZv/ytgNjkVTf40RbmdsFrI/AGg7PHyskOnmBX5Uo3IKDlviOZN8g==
X-Received: by 2002:aca:d442:: with SMTP id l63mr3114260oig.49.1617215538553; 
 Wed, 31 Mar 2021 11:32:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d1sm577516oop.0.2021.03.31.11.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 11:32:18 -0700 (PDT)
Date: Wed, 31 Mar 2021 13:32:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] soundwire: qcom: Fix a u8 comparison with less
 than zero
Message-ID: <20210331183216.GM904837@yoga>
References: <20210331140944.1421940-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331140944.1421940-1-colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Wed 31 Mar 09:09 CDT 2021, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable devnum is being checked for a less than zero error return
> however the comparison will always be false because devnum is an 8 bit
> unsigned integer. Fix this by making devnum an int.  Also there is no
> need to iniitialize devnum with zero as this value is no read, so
> remove the redundant assignment.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: c7d49c76d1d5 ("soundwire: qcom: add support to new interrupts")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index b08ecb9b418c..ec86c4e53fdb 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  	struct qcom_swrm_ctrl *swrm = dev_id;
>  	u32 value, intr_sts, intr_sts_masked, slave_status;
>  	u32 i;
> -	u8 devnum = 0;
> +	int devnum;
>  	int ret = IRQ_HANDLED;
>  
>  	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> -- 
> 2.30.2
> 
