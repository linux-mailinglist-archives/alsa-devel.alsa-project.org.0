Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A031F36F7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 11:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABF7316AE;
	Tue,  9 Jun 2020 11:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABF7316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591694423;
	bh=fKOlT3ZuUypiU6lWPHCFL/HWTltuhrzJYp9d3yTci2I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFmGKI5GuJky7Cv7BHCUacviVluCI6lgwwAEtrAfAOgmhdomJNkpoYoN8Ih2wnGTl
	 Q3cMuWOEqD7+U4NpqUDRskp2uYHoXnvsSPJ/xgfhrIRw/G0OSwDLB6UoZ2dZf2DaVo
	 HLQn8ubFI53gSO9vCgKDFOIKCR7tKHJ/Yk6a5S00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EC1F802A0;
	Tue,  9 Jun 2020 11:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99A7FF8029A; Tue,  9 Jun 2020 11:18:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C2DF80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 11:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C2DF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="onLY9YXB"
Received: by mail-wm1-x344.google.com with SMTP id l26so2102465wme.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Jun 2020 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tJGJ8BJzJg4ieVtius6n8SlkvkWPHRf40VIWTRbTGp4=;
 b=onLY9YXBv0zZ1owBUiEvSRRyNUTGRGTX851cnDVpoTsoiuXouSWpa2T2oevDIJG2CC
 iwNavKavGT1QQxAYnzUukRJeALf84jtVWigrgkG3IhMztEm6lcdYCDeRYfOytC3r/i1G
 Mh9+8zv77OQ4Squv7bwfM+DB3FZeA21LlKjZhWbZ7NGJoFuLJCrVNTw04fRAh2Ud2TMz
 W9+hsIA/3+DVLqg6OmYq+QlJ37FXtg2k1qwoHVHKYda9HrGOGSBsihPwihaSiZ3g/bqU
 w5vetSIcEgsjeBlHcr+yzajZIYpGw1AewYKllpm7hNud3qfTLBnG3PSQlpFreZBMsZR0
 SWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tJGJ8BJzJg4ieVtius6n8SlkvkWPHRf40VIWTRbTGp4=;
 b=tzCCqVW993YkYi3LmNme0ZQ4mR5RoVGi95S0ksRkWxTN0q7EVRkwK32fh8SipF3Y0f
 GsaohZ/gocBgRYHbjE15yMT3o1OCi46eMYCYfwAbsjjns4snZr+A8YnddPPJZ7hcRgE7
 xVUGKdH1tU94WlBfUVhFG861RpaJhQO2Q67rdlgXslLBar0kG6bCL8MK2qPFC24BPJIm
 7U9jQTuq0t5vDeLrpJc0HzmZL2/vrSNu13HQ/StHQkDQTef1uHRASu6Le9PtdATn4DWk
 j6ABJC2H5tyjEum+tbiPa4+OMLw2qqLgb31FGCtE980f9HeqCtRKrlLBA/VD7O66EAIt
 7hTA==
X-Gm-Message-State: AOAM532QNOc+CKSG1fRpEQ4lJd8Ovc+L6ZnfP5J6cH0HLd5dasC6tXme
 G8rA8rUSuJL6n1D3Pwg2syR0tQ==
X-Google-Smtp-Source: ABdhPJy3WHAQJGO4JkS4h3AF6dFtlj9Bma6Ox7rmVQPv43GtLZYFlXU4vOi1Pw23nUnmup0PobpffQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr2999490wmk.35.1591694316851; 
 Tue, 09 Jun 2020 02:18:36 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id y80sm2308211wmc.34.2020.06.09.02.18.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 02:18:36 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To: Vinod Koul <vkoul@kernel.org>, Jonathan Marek <jonathan@marek.ca>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
 <20200609043420.GA1084979@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bbb552ce-4b13-0395-e1bc-0b6c5766f4ae@linaro.org>
Date: Tue, 9 Jun 2020 10:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200609043420.GA1084979@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 09/06/2020 05:34, Vinod Koul wrote:
> Hi Jonathan,
> 
> On 08-06-20, 16:43, Jonathan Marek wrote:
>> Adds support for qcom soundwire devices with memory mapped IO registers.
> 
> Please use 'SoundWire Master devices' instead :)
> 
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index f38d1fd3679f..628747df1c75 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>>   	struct sdw_bus bus;
>>   	struct device *dev;
>>   	struct regmap *regmap;
>> +	void __iomem *mmio;
>>   	struct completion *comp;
>>   	struct work_struct slave_work;
>>   	/* read/write lock */
>> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
>>   	return SDW_CMD_OK;
>>   }
>>   
>> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>> +				  u32 *val)
>> +{
>> +	*val = readl(ctrl->mmio + reg);
>> +	return SDW_CMD_OK;
>> +}
>> +
>> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
>> +				   int val)
>> +{
>> +	writel(val, ctrl->mmio + reg);
>> +	return SDW_CMD_OK;
>> +}
> 
> this looks fine but regmap supports mmio also, so I am thinking we
> should remove these and set regmap (mmio/slim)... Srini..?

That is doable, but not going to add great value in this case, unless we 
are having another layer of abstraction. So keeping it as readl/writel 
seems okay to me.

--srini


> 
