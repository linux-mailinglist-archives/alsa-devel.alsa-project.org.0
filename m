Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8425730ABFF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:53:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10A3F1799;
	Mon,  1 Feb 2021 16:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10A3F1799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612194831;
	bh=uMzPbm3Tn+yhAQPNya32G9/1QNq8FHYEZFRwA8pHW7w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o17qbSZJMFBGZToDRrOnN9TJzIY0tGHAwkbaNok6xkeZvif218NaASSmrNAMWjrJg
	 X6DN9KkytKS362Vsh6uE/DwsKSIL4sNcvVAn6BAqrBeSu46uZ9EudxQCisqswu9DkC
	 uk0aLrZV/Rw0o3ctLuGHfs07TBLhbe8tES1RjQaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D9E5F802E2;
	Mon,  1 Feb 2021 16:51:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D19A3F802E0; Mon,  1 Feb 2021 16:50:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43E97F802D2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E97F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zOBcVOc/"
Received: by mail-wr1-x432.google.com with SMTP id l12so17125682wry.2
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 07:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Agocalx6amvT73iAIsJBAp9BxcyNS8PBS87OaAq8r9c=;
 b=zOBcVOc/nM0Zcz4TaDR88FVVE4Hd7YUH+VUSQRJWlNnAQTUQU1BTPmlLuHVhU2v4og
 PvAdZt9WIcif2Ue8X7K86tmeQbh9fEtq8wjrE7/VsGMrbpLR8+j+lxQSwOyHTyiW/SD5
 xxxrvnsmXwdp3/v5F9EA2XqAENTmrjdAWkNSLDU6bbW0RHIWuBcNZqkcgLQzbRGWk8cQ
 P+7AUOzUO34H3LbHeeUY/tsqoGa0cjHyZaZlET8Y40HP7BHsNCpUxli73HX5Og7CQpsv
 tMjIen90IZk4xwtIzr3VUOFaN1SdSZWBc4Lc0niNgpydHSHxAdPVpcZfYXweRNLJ35sb
 Rg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Agocalx6amvT73iAIsJBAp9BxcyNS8PBS87OaAq8r9c=;
 b=N+OSfA2mXXGQusqOzNvvkfOtj5A5GEiYapb60O9dg9YRvKHpvBzzsj6dfkDMEBCKfy
 e8r9Gj7wjVs2XVdkrnh9hLHYIjLLgFdszpGjsNLI218hRT4bnW6ZbgH4rvj3dtTu/4gL
 2Eb8VSGSZ7S/DSTX+bt/i1iWxYkvr9HcerqJ0zVM7VJJ6eW5VaN3cOffwA9FmgZOV+IZ
 GLifUTpBvDiSqjMw+/M1gXmfD3Z1HTDNV6TV9hihdY3vm9CNklPAzFhXB1Com7EII0AC
 wPFSYtL2ByMXPB9qvVKan8R5/Q6yzEtPMCzYTFhaYtCfFcKi4Pp3obQgUhnsXs7G18uL
 IA1Q==
X-Gm-Message-State: AOAM531QqWHRFYYyM/cOfZYYQ8L7BapFoIdhMKDursIZh3Ojm0w6Bvda
 S2PWKELKPyDsznMotevIIsMWTS3bSvR9mQ==
X-Google-Smtp-Source: ABdhPJzq24GaWng9oX8jhpJlFLNOrjO9zZuq9VNBlVEJtJP2x0T9bjA3eRiOb0vFnzf15VTo90I/JQ==
X-Received: by 2002:adf:fb85:: with SMTP id a5mr18737695wrr.331.1612194654681; 
 Mon, 01 Feb 2021 07:50:54 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j7sm3494258wrp.72.2021.02.01.07.50.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:50:54 -0800 (PST)
Subject: Re: [PATCH 5/6] soundwire: qcom: update register read/write routine
To: Vinod Koul <vkoul@kernel.org>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
 <20210201142646.GD2771@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <360ddca6-6f64-5297-2e88-9507500dfd4d@linaro.org>
Date: Mon, 1 Feb 2021 15:50:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210201142646.GD2771@vkoul-mobl>
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



On 01/02/2021 14:26, Vinod Koul wrote:
> On 29-01-21, 17:32, Srinivas Kandagatla wrote:
>> In the existing code every soundwire register read and register write
>> are kinda blocked. Each of these are using a special command id that
>> generates interrupt after it successfully finishes. This is really
>> overhead, limiting and not really necessary unless we are doing
>> something special.
>>
>> We can simply read/write the fifo that should also give exactly
>> what we need! This will also allow to read/write registers in
>> interrupt context, which was not possible with the special
> 
> Okay but then why use a mutex ?

Read and writes can come from two places,
1> from SoundWire Core itself which takes care of locking
2> from interrupt handler in the driver itself, which is why we need an 
additional locking!

Having said that I did have look at the current state of driver 
interrupt handler, and it does not do any soundwire register read/writes 
from interrupt handler so we can remove the lock for now!

> 
>> command approach.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 148 +++++++++++++++++++++++++--------------
>>   1 file changed, 96 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 83df15d83935..d61b204dc284 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -78,13 +78,15 @@
>>   #define SWRM_SPECIAL_CMD_ID	0xF
>>   #define MAX_FREQ_NUM		1
>>   #define TIMEOUT_MS		(2 * HZ)
>> -#define QCOM_SWRM_MAX_RD_LEN	0xf
>> +#define QCOM_SWRM_MAX_RD_LEN	0x1
>>   #define QCOM_SDW_MAX_PORTS	14
>>   #define DEFAULT_CLK_FREQ	9600000
>>   #define SWRM_MAX_DAIS		0xF
>>   #define SWR_INVALID_PARAM 0xFF
>>   #define SWR_HSTOP_MAX_VAL 0xF
>>   #define SWR_HSTART_MIN_VAL 0x0
>> +#define SWR_BROADCAST_CMD_ID    0x0F
>> +#define MAX_FIFO_RD_FAIL_RETRY 3
>>   
>>   struct qcom_swrm_port_config {
>>   	u8 si;
>> @@ -104,11 +106,13 @@ struct qcom_swrm_ctrl {
>>   	struct regmap *regmap;
>>   	void __iomem *mmio;
>>   	struct completion *comp;
>> +	struct completion broadcast;
>>   	struct work_struct slave_work;
>>   	/* read/write lock */
>>   	spinlock_t comp_lock;
>>   	/* Port alloc/free lock */
>>   	struct mutex port_lock;
>> +	struct mutex io_lock;
>>   	struct clk *hclk;
>>   	u8 wr_cmd_id;
>>   	u8 rd_cmd_id;
>> @@ -122,6 +126,8 @@ struct qcom_swrm_ctrl {
>>   	int rows_index;
>>   	unsigned long dout_port_mask;
>>   	unsigned long din_port_mask;
>> +	u8 rcmd_id;
>> +	u8 wcmd_id;
>>   	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>>   	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>>   	enum sdw_slave_status status[SDW_MAX_DEVICES];
>> @@ -200,75 +206,111 @@ static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
>>   	return SDW_CMD_OK;
>>   }
>>   
>> -static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
>> -				     u8 dev_addr, u16 reg_addr)
>> +static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
>> +				 u8 dev_addr, u16 reg_addr)
>>   {
>> -	DECLARE_COMPLETION_ONSTACK(comp);
>> -	unsigned long flags;
>>   	u32 val;
>> -	int ret;
>> -
>> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
>> -	ctrl->comp = &comp;
>> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
>> -	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr,
>> -				SWRM_SPECIAL_CMD_ID, reg_addr);
>> -	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
>> -	if (ret)
>> -		goto err;
>> -
>> -	ret = wait_for_completion_timeout(ctrl->comp,
>> -					  msecs_to_jiffies(TIMEOUT_MS));
>> +	u8 id = *cmd_id;
>>   
>> -	if (!ret)
>> -		ret = SDW_CMD_IGNORED;
>> -	else
>> -		ret = SDW_CMD_OK;
>> -err:
>> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
>> -	ctrl->comp = NULL;
>> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
>> +	if (id != SWR_BROADCAST_CMD_ID) {
>> +		if (id < 14)
>> +			id += 1;
>> +		else
>> +			id = 0;
>> +		*cmd_id = id;
>> +	}
>> +	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
>>   
>> -	return ret;
>> +	return val;
>>   }
>>   
>> -static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
>> -				     u8 dev_addr, u16 reg_addr,
>> -				     u32 len, u8 *rval)
>> +
>> +static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>> +				     u8 dev_addr, u16 reg_addr)
>>   {
>> -	int i, ret;
>> +
>>   	u32 val;
>> -	DECLARE_COMPLETION_ONSTACK(comp);
>> -	unsigned long flags;
>> +	int ret = 0;
>> +	u8 cmd_id = 0x0;
>> +
>> +	mutex_lock(&swrm->io_lock);
>> +	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
>> +		cmd_id = SWR_BROADCAST_CMD_ID;
>> +		val = swrm_get_packed_reg_val(&cmd_id, cmd_data,
>> +					      dev_addr, reg_addr);
>> +	} else {
>> +		val = swrm_get_packed_reg_val(&swrm->wcmd_id, cmd_data,
>> +					      dev_addr, reg_addr);
>> +	}
>>   
>> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
>> -	ctrl->comp = &comp;
>> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
>> +	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
>>   
>> -	val = SWRM_REG_VAL_PACK(len, dev_addr, SWRM_SPECIAL_CMD_ID, reg_addr);
>> -	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
>> -	if (ret)
>> -		goto err;
>> +	/* version 1.3 or less */
>> +	if (swrm->version_major == 1 && swrm->version_minor <= 3)
>> +		usleep_range(150, 155);
>>   
>> -	ret = wait_for_completion_timeout(ctrl->comp,
>> -					  msecs_to_jif
--srini
fies(TIMEOUT_MS));
>> +	if (cmd_id == SWR_BROADCAST_CMD_ID) {
>> +		/*
>> +		 * sleep for 10ms for MSM soundwire variant to allow broadcast
>> +		 * command to complete.
>> +		 */
>> +		ret = wait_for_completion_timeout(&swrm->broadcast, (2 * HZ/10));
>> +		if (!ret)
>> +			ret = SDW_CMD_IGNORED;
>> +		else
>> +			ret = SDW_CMD_OK;
>>   
>> -	if (!ret) {
>> -		ret = SDW_CMD_IGNORED;
>> -		goto err;
>>   	} else {
>>   		ret = SDW_CMD_OK;
>>   	}
>> +	mutex_unlock(&swrm->io_lock);
>> +	return ret;
>> +}
>>   
>> -	for (i = 0; i < len; i++) {
>> -		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR, &val);
>> -		rval[i] = val & 0xFF;
>> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
>> +				     u8 dev_addr, u16 reg_addr,
>> +				     u32 len, u8 *rval)
>> +{
>> +	u32 val;
>> +	u32 retry_attempt = 0;
>> +	u32 cmd_data;
>> +	int ret = SDW_CMD_OK;
>> +
>> +	mutex_lock(&swrm->io_lock);
>> +	val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, reg_addr);
>> +
>> +	/* wait for FIFO RD to complete to avoid overflow */
>> +	usleep_range(100, 105);
>> +	swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
>> +	/* wait for FIFO RD CMD complete to avoid overflow */
>> +	usleep_range(250, 255);
>> +
>> +retry_read:
> 
> do while{} ?

Sure!

> 
>> +
>> +	swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
>> +	rval[0] = cmd_data & 0xFF;
>> +
>> +	if ((((cmd_data) & 0xF00) >> 8) != swrm->rcmd_id) {
>> +		if (retry_attempt < MAX_FIFO_RD_FAIL_RETRY) {
>> +			/* wait 500 us before retry on fifo read failure */
>> +			usleep_range(500, 505);
>> +			if (retry_attempt == (MAX_FIFO_RD_FAIL_RETRY - 1)) {
> 
> why not do this at the end if retry fails, that will make code look
> neater

I agree, will clean this one in next version!

> 
>> +				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
>> +				swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
>> +			}
>> +			retry_attempt++;
>> +			goto retry_read;
>> +		} else {
>> +			dev_err(swrm->dev,
>> +					"failed to read fifo: reg: 0x%x, \
>> +					rcmd_id: 0x%x, dev_num: 0x%x, cmd_data: 0x%x\n",
>> +					reg_addr, swrm->rcmd_id,
>> +					dev_addr, cmd_data);
> 
> Do you want to log retry as err..?
> 
>> +			ret = SDW_CMD_IGNORED;
>> +		}
>>   	}
>>   
>> -err:
>> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
>> -	ctrl->comp = NULL;
>> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
>> +	mutex_unlock(&swrm->io_lock);
>>   
>>   	return ret;
>>   }
>> @@ -949,6 +991,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	dev_set_drvdata(&pdev->dev, ctrl);
>>   	spin_lock_init(&ctrl->comp_lock);
>>   	mutex_init(&ctrl->port_lock);
>> +	mutex_init(&ctrl->io_lock);
>> +	init_completion(&ctrl->broadcast);
>>   	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
>>   
>>   	ctrl->bus.ops = &qcom_swrm_ops;
>> -- 
>> 2.21.0
> 
