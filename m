Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D92350476
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 18:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85055167F;
	Wed, 31 Mar 2021 18:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85055167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617208083;
	bh=RwgBNiTfKecVj8BFUcZ9+M8axnZ9b79AJMlPAFNX9nI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vCET0UfxuELyFJHAjpBzgPBbkUwripPEs4paohqbAOXmoOGRXhcLr7DRO0Gn4Thqm
	 RB01gm8D4XMHVJlcpylH0615mUEqnmyRkRTz8HutBGMOCUDFeghzIReeVWd7XA2Xni
	 tscpserk/YypLt0u4N2tKHu9gJy3pZoy6+lpCG3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CE6F801DB;
	Wed, 31 Mar 2021 18:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F734F8015A; Wed, 31 Mar 2021 18:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 854B5F8014E
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 18:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 854B5F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZZd/A3Vh"
Received: by mail-ot1-x32e.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so19460789otb.7
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FbposqgapdTdAS+TUQHgC3JJ2yt1So9MQA6oTHq2HyM=;
 b=ZZd/A3VhaWLf87FVg8P1ETQbMeM4bycDbJ6/1pg/jHN5ZUmh2n5Da+wqk6B7ZfXQq5
 TjZba8TFJ4YiC2U86OvgIh0n6PTxMPmEapCOoACsT7Umo4ooYYa06ngCiyuMeYt7bCj4
 QA5SmAajb8S2AAna5rS6c9UA13qFcyelWqdHL4aDt2vdAXTaRByz4GKuB6GzL+6YpEXx
 gdeXnFsuE+P+/9hyu+uqqUPTAk9NJZAvlcBlHgRFNGndjEn2CxWjjLRPIL9xbTn6D2tL
 7Ac0d0yNm0Q/a7e0J8Q9oYA7OACz9cTKwo0eAj36rkCPMS19Of5iHuAVBd0kwxyLe9YV
 GRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FbposqgapdTdAS+TUQHgC3JJ2yt1So9MQA6oTHq2HyM=;
 b=XyQBKUlqwN6XZfL2bXYeMf9+6XByHFKnUUUk3fn+ZofWiak6kLUb5OMXJ+YO9ZcE93
 IGIkC7Hpi2Wfw7A05Usw1Uq8fg33wOw3AkjTdwDJvvLQ2gN58hM0fWl3q9P4v/3epUAg
 P6XCZ05B0CW5OwWKEGgkvh1qYRPem4myn5dJeCCFF9gwRrs3vBflvvMlZs+QoWuna274
 hFqQTvWZ3ovdvMfRM2NFJr9Qqb71Rz3qfXcfDBOnVv2UHF/NotxMD02n/4egyCTSyi/U
 WKPOE805t50mOEj3U5bbmRPtoR/oshvbulhPaL2jvAveFYqnlrFUP/ZNrcEc8awy74n5
 niLA==
X-Gm-Message-State: AOAM533K1xEigJNvomnOCY4ClW2ovQehDfhOUL1RxzZmAgbpk9jYKNsd
 twjzoe/8kT+nbklaFrigmZFRfw==
X-Google-Smtp-Source: ABdhPJwpuw4Dcj+wqGcEfRmuYfn1e+Gs7VXG66D29ALgKuCxRO8vT4VsmB0HRn/ZbEem/ltTw2GQoQ==
X-Received: by 2002:a05:6830:1282:: with SMTP id
 z2mr3401766otp.30.1617207982514; 
 Wed, 31 Mar 2021 09:26:22 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id f29sm571110ots.22.2021.03.31.09.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 09:26:22 -0700 (PDT)
Date: Wed, 31 Mar 2021 11:26:19 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH V2] soundwire: qcom: use signed variable for error return
Message-ID: <20210331162619.GK904837@yoga>
References: <20210331155520.2987823-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331155520.2987823-1-vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
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

On Wed 31 Mar 10:55 CDT 2021, Vinod Koul wrote:

> We get warning of using a unsigned variable being compared to less than
> zero. The comparison is correct as it checks for errors from previous
> call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
> variable here.
> 
> While at it, drop the superfluous initialization as well
> 
> drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
> condition '(devnum < 0) => (0-255 < 0)'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

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
> 2.26.3
> 
