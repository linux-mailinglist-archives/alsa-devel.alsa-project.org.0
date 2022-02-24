Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 446B54C30AD
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 16:59:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2E11AB3;
	Thu, 24 Feb 2022 16:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2E11AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645718372;
	bh=SvOwU+BP5TatpmYXSFRSqDkxLVZf1n4ALXQbU3cjpBY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YwcharKplSEqqMwaaAgtXhpzgIIKDT51kxDPqSDEgUCiEBfzCojvvebXvitW3N/XS
	 gBuaeYJ0njV8dtWAoJ547zeC/f58jzWXcwBo/FDU2dE5AcVSiAsk32ZyYULKxhIbyZ
	 9xhKklINBTvFKtS0NE5hh7NSuloK4mZ7MiYwvCzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D173F80310;
	Thu, 24 Feb 2022 16:58:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6888F8030F; Thu, 24 Feb 2022 16:58:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 420C1F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 16:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 420C1F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uLqbKonl"
Received: by mail-wr1-x433.google.com with SMTP id u1so315268wrg.11
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cHggUxZ2d6PFKqdQLzVPT8UbBPpze8bsOzv1kvrdrlo=;
 b=uLqbKonlTeDMASK8EgJjQw1+cd5N+/lABIBHk1MxzHAA8xedvKecOXkanT+MpMCDK3
 eGhDQZKUrTZu920ISxBr2+tWsr8lS8FbKyZdKUvefRAN6YNFzoaT81b3EeXKiRDHuPC3
 l1EO3GOyA/9C10IfLSl4MoTC99veIjsaWNCrYfY438nN4/dDv2EWQK+FOYOpHd6fJR/n
 AOo+3vdrXDzla6QR+RLClnVI8NIgpiH/liMgoqBYyNLgIJLTOO1j5Dop6cvv0PvImon3
 p8WPmE1zElfiLAR4zGn+b+2/2DjzqRATz5PGci7lF5cHat+OQEd/S76f3wbadlMBnWyY
 QiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cHggUxZ2d6PFKqdQLzVPT8UbBPpze8bsOzv1kvrdrlo=;
 b=Nec4gVGjm+H+aWC5RX6Z9kmXOiTK4mxv4E0zgfcxFWaYZNBbgX7tl9rj/T3MKZqnYd
 0P0BJ1u1VDFAmZdXCnku+T4bpldhz8qReFi8lTqGe6iY+tYgaN63mY2lVDbau7lbuFkY
 ckgYMuYJi3ooicrDMEH8V9hwByoiZpiRDyu/NeNtVTw8E/vXh39vvUv/Z0+MN579PzVe
 dYnRdRb9XOFWf1NH0HQHOC1LqVnivYIx7cnC24ssOGY6oJweXkUR5APmoA75yeUlyWs4
 a7rIBvFlGrWtn0pmjusAdUVZkTwyVasSnj46mny6mipo3SYLLyQkmisHq/eeJIvx/Lc1
 wkYQ==
X-Gm-Message-State: AOAM532e8UfqNUrd7aXWQ91hQVr5ZNmH176QwmYBCgjX07iC0crKBCXS
 MKX6Prqr9/yLfvMIoivjnA5Utw==
X-Google-Smtp-Source: ABdhPJybbfb1DD6u3EohFr6j+SFN/2b6PczIRrH7DpwSghsm9siYp0NGbochHvlp1lJ++O8pqoiL1w==
X-Received: by 2002:adf:f1ca:0:b0:1ed:e2d7:b5f3 with SMTP id
 z10-20020adff1ca000000b001ede2d7b5f3mr2828386wro.75.1645718298367; 
 Thu, 24 Feb 2022 07:58:18 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a7bc5c4000000b0037e0c62604fsm3007605wmk.14.2022.02.24.07.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 07:58:17 -0800 (PST)
Message-ID: <be9c99ac-ebdb-e0c1-669b-1257f630f267@linaro.org>
Date: Thu, 24 Feb 2022 15:58:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] soundwire: qcom: add runtime pm support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
 <20220224133125.6674-2-srinivas.kandagatla@linaro.org>
 <3dbed2f1-0c6d-9ba6-232f-db57ec9097ce@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <3dbed2f1-0c6d-9ba6-232f-db57ec9097ce@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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



On 24/02/2022 15:41, Pierre-Louis Bossart wrote:
> 
>>   static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
>> @@ -1197,12 +1224,23 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>>   static int swrm_reg_show(struct seq_file *s_file, void *data)
>>   {
>>   	struct qcom_swrm_ctrl *swrm = s_file->private;
>> -	int reg, reg_val;
>> +	int reg, reg_val, ret;
>> +
>> +	ret = pm_runtime_get_sync(swrm->dev);
>> +	if (ret < 0 && ret != -EACCES) {
>> +		dev_err_ratelimited(swrm->dev,
>> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
>> +				    __func__, ret);
>> +		pm_runtime_put_noidle(swrm->dev);
>> +	}
>>   
>>   	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
>>   		swrm->reg_read(swrm, reg, &reg_val);
>>   		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
>>   	}
>> +	pm_runtime_mark_last_busy(swrm->dev);
>> +	pm_runtime_put_autosuspend(swrm->dev);
>> +
> 
> question: is there a reason why this specific set of reg_read() is
> surrounded pm_runtime stuff? Is this saying that in all other case where
> the callback is used, the controller is already resumed and fully
> operational? That's be worthy of a comment.

controller register reads require clk to be ON, which might not be 
always ON. In suspended case we switch off the clocks.

Other places so far that I have seen is that controller is either 
already resumed or clk is on (interrupt case) and resume case.



>> struct qcom_swrm_ctrl *swrm
>> struct qcom_swrm_ctrl *ctrl
> 
> nit-pick: it helps reviewers when the same variable name is used
> consistently.

Yes, I did notice this, but for some reason I forgot to fix it.

> 
>> +static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>> +{
>> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!ctrl->clock_stop_not_supported) {
>> +		/* Mask bus clash interrupt */
>> +		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
>> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
>> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
>> +	}
>> +	/* Prepare slaves for clock stop */
>> +	ret = sdw_bus_prep_clk_stop(&ctrl->bus);
>> +	if (ret < 0) {
> 
> if (ret < 0 && ret != -ENODATA) {
> 
> ?
> 
>> +		dev_err(dev, "prepare clock stop failed %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = sdw_bus_clk_stop(&ctrl->bus);
>> +	if (ret < 0 && ret != -ENODATA) {
>> +		dev_err(dev, "bus clock stop failed %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	clk_disable_unprepare(ctrl->hclk);
>> +
>> +	usleep_range(300, 305);
>> +
>> +	return 0;
>> +}
