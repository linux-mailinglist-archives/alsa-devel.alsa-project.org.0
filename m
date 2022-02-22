Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FCF4C04EA
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:53:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7283518B9;
	Tue, 22 Feb 2022 23:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7283518B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645570403;
	bh=QTxYibYH0XA1pHtgDlTWGHs6DwZy5iOX+16f2J+YxbY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mu551dU/Mcge/ZiDSB7FaG+BxQ8fK6/sSUhimVYo7r1tr39nsCkSn4FTvPzZarPYo
	 bex8QbXLdhLouEhYi2kEn8lF+aS5AxPrc5ifrnptXahyGPYympnbhcBUXgIOtJnqIu
	 eQ9QOFeNKN/Cio0YDW/1CPk7AX9fhqXZnSjGx++c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 126C1F801EC;
	Tue, 22 Feb 2022 23:52:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C41A7F80238; Tue, 22 Feb 2022 23:52:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57BDAF801EC
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BDAF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JlBU679E"
Received: by mail-wr1-x42a.google.com with SMTP id j22so10149909wrb.13
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/EnLdcDCaY6axPEw3k6ZqOc6igFL4mnKPGEeDh9ZpYQ=;
 b=JlBU679E2RSWDtfPGZfq0mRe9IowogDAY4FI/8A2KbsQN3adCGWLzFglR/ESl0ximD
 jiiwoJjkosMGrOaWQov+altgqvmI+80/Nlm0sQA932DVQd0zeZKbu0Cq/OQIM118sEWN
 ZRNff4+TNcoySlMtlg3uQ+8O66yjEp5ROk7ukfcHedr2n9uK4nBy22SESUTa7y7QOYHh
 4fhUH5HcXrU8hy7y9rItzfvN5Uq4Gg5QB8PeeJ7TUq+OD+dxCnMXuz1IwwmQkzCXcyPo
 xdw4bedgVDHODG/3trm5BD2P0t/kqe68HvRGMj2ymEdItmrMjzgOX5ZG2og8iWfPMjhU
 H+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/EnLdcDCaY6axPEw3k6ZqOc6igFL4mnKPGEeDh9ZpYQ=;
 b=T10NTU1VThtxD7zG+qFQF/mT8QhuIEtdknDq8+8nBJD/zdhr17cW3+k7ovNpIDmqgO
 6u/yYZTAPBMXHf7tI1BdTnyES1KLAdVUyKNGybTt7UilrQsmXx377Yvh/RDEf6LrV9bV
 MTsc7fJJvLFdFOqudd1mSBaujU/zm0OZP3cmUOgVsNtpT3GFtK3itbwF2stN8pg1vzoQ
 xlqFp1+/EzIfVGCSplVQIpRWYYrC0RlSTSbht8anmLmzrqq/uARL4h8Txac84DJ0U5oA
 7R3G1N3/jKE9LbA39KL+lxeTfLUIoK9Nou9vwBJ3fS+JvB688vSNMDTZfGVBXMwXUwrJ
 iT/A==
X-Gm-Message-State: AOAM5319cTsePTPUQBD7j5FYxC9MERwJazzQL61IMvoqP2YS6e+zD7hs
 9SXEHw03gkKgVhuFevBQfjGNMg==
X-Google-Smtp-Source: ABdhPJxnBqQUGE8FatYN5I3AE2KTzM8vUylwQpMxfwtN0+FUJdGdMooq4XpfX0P1pMsgjqsaS4xNAQ==
X-Received: by 2002:a05:6000:18a5:b0:1eb:93a3:ebcb with SMTP id
 b5-20020a05600018a500b001eb93a3ebcbmr2595027wri.291.1645570347524; 
 Tue, 22 Feb 2022 14:52:27 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id b16sm4232325wmj.32.2022.02.22.14.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:52:26 -0800 (PST)
Message-ID: <1cb4e02f-f040-23bd-44d0-0675429332bd@linaro.org>
Date: Tue, 22 Feb 2022 22:52:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] soundwire: qcom: add wake up interrupt support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
 <20220221104127.15670-4-srinivas.kandagatla@linaro.org>
 <5e050d4c-e3d2-35fb-ca49-7be53579bc31@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <5e050d4c-e3d2-35fb-ca49-7be53579bc31@linux.intel.com>
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



On 22/02/2022 19:26, Pierre-Louis Bossart wrote:
> 
> 
> 
>> +static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct qcom_swrm_ctrl *swrm = dev_id;
>> +	int ret = IRQ_HANDLED;
>> +	struct sdw_slave *slave;
>> +
>> +	clk_prepare_enable(swrm->hclk);
>> +
>> +	if (swrm->wake_irq > 0) {
>> +		if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
>> +			disable_irq_nosync(swrm->wake_irq);
>> +	}
>> +
>> +	/*
>> +	 * resume all the slaves which must have potentially generated this
>> +	 * interrupt, this should also wake the controller at the same time.
>> +	 * this is much safer than waking controller directly that will deadlock!
>> +	 */
> There should be no difference if you first resume the controller and
> then attached peripherals, or do a loop where you rely on the pm_runtime
> framework.
> 
> The notion that there might be a dead-lock is surprising, you would need
> to elaborate here.Issue is, if wakeup interrupt resumes the controller first which can 
trigger an slave pending interrupt (ex: Button press event) in the 
middle of resume that will try to wake the slave device which in turn 
will try to wake parent in the middle of resume resulting in a dead lock.

This was the best way to avoid dead lock.

> 
>> +	list_for_each_entry(slave, &swrm->bus.slaves, node) {
>> +		ret = pm_runtime_get_sync(&slave->dev);
> 
> In my experience, you don't want to blur layers and take references on
> the child devices from the parent device. I don't know how many times we
> end-up with weird behavior.
> 
> we've done something similar on the Intel side but implemented in a less
> directive manner.
thanks, I can take some inspiration from that.


--srini
> 
> ret = device_for_each_child(bus->dev, NULL, intel_resume_child_device);
> 
> static int intel_resume_child_device(struct device *dev, void *data)
> {
> [...]	
> 	ret = pm_request_resume(dev);
> 	if (ret < 0)
> 		dev_err(dev, "%s: pm_request_resume failed: %d\n", __func__, ret);
> 
> 	return ret;
> }
> 
> 
>> +		if (ret < 0 && ret != -EACCES) {
>> +			dev_err_ratelimited(swrm->dev,
>> +					    "pm_runtime_get_sync failed in %s, ret %d\n",
>> +					    __func__, ret);
>> +			pm_runtime_put_noidle(&slave->dev);
>> +			ret = IRQ_NONE;
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	list_for_each_entry(slave, &swrm->bus.slaves, node) {
>> +		pm_runtime_mark_last_busy(&slave->dev);
>> +		pm_runtime_put_autosuspend(&slave->dev);
>> +	}
>> +err:
>> +	clk_disable_unprepare(swrm->hclk);
>> +	return IRQ_HANDLED;
>> +}
>> +
> 
