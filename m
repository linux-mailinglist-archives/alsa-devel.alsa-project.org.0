Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1D6E0C3D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 13:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9EF8ED1;
	Thu, 13 Apr 2023 13:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9EF8ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681384486;
	bh=oRQTOvWlvOG58LXFBourkdL1/87NWzOld4ElSBgThhk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GEbAnftsvaP14bqh225O7EA+yQDtkd2oj0ikh+Kwc6WL4qB4hWHMGbbD3/OKeevT5
	 8V8PAHqhwP8tct0fdWOF+zIAYOaxbGpypuxXljM2VljQC6MEKxtQMMfa8jqK5hO/jy
	 ZRZ0mZVeOo+DCCP68ZU6Va0DE6H+kngYqpd7SiQY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6ACDF8023A;
	Thu, 13 Apr 2023 13:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFEFCF8032B; Thu, 13 Apr 2023 13:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C866F80100
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 13:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C866F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ce7Ykmyf
Received: by mail-wm1-x329.google.com with SMTP id he13so13242049wmb.2
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Apr 2023 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681384428; x=1683976428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xu5iHmAI74LntjacqdR4S9D15dGARBm9ijbA4dIB1mU=;
        b=Ce7YkmyfE4edmy/xh5dZokk5cjTyw2u79YYbAlKNKWUfhIkS0FUNHMunTxeKBAnOPR
         7fqMjBqLJpsOZmRBTsJwokWFVc3fefdPviv3U9ucJk6Xm7D9V8FCV8Vu7occmrmV8o6d
         jyop++cFiub9GsqbHfiZAevm+KIhYKHn1BpbuVLWh5zUkh85WKuPUBvDUHlRlTojwoMu
         45JcByBhuv5tD5G/zf+NnGi+GyAH9GGYaH9RsE2/HlXrym1uT95rirlMG81FWAa9WQv8
         4bcl7/cT8AA/xC7SwyJshGZhBAjto4lmr7tNsTLva2FZJYTG62x2haZoaVk8+osP35zh
         7BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681384428; x=1683976428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xu5iHmAI74LntjacqdR4S9D15dGARBm9ijbA4dIB1mU=;
        b=EGK0LCwBL9cMJW6W948vnAxU+lvnBjnu7upWubwcw1w6taOtUz0y2CRFQHuZliNFqQ
         2soX8mK7R3QiUTpOh4mQ7CuMwnCyEyaYqJY9aBqSZITwObPidRc3rel8cmjs/xbZY2Ip
         r+TwMqrqzJRrBV6N8lUIVwxKQwY3NRMP9Vztt5sh27AJ5DbgrRAJXqQt2Iiv7Iamsqs5
         NO1Wwq0zoG/YzdZF5oaLdp+B8mlnAj3Wf+x8Sdqvb8Qoce9uXFUmH8OMqETtAcxm7/SO
         LFqOXWbtOXTYlAxMnbZfNhTmgf9But/9KzN8NSRASz0RrzIQPcfQT6eKr93viSEMjzvT
         ETWg==
X-Gm-Message-State: AAQBX9fbk5mJejYS1UWVFNa22cA4G4+gOTyF8GDF0iJUpQ4El+kIH7MM
	GLxynt2pBbCuotH6xjqITmFgkQ==
X-Google-Smtp-Source: 
 AKy350YkGL+DZuyinVtjmzmPDCOEWVfEdfHvFyx8ri8T1lNBeYyeTHGnHH7afEkpfk7wwov10WCYmQ==
X-Received: by 2002:a05:600c:2247:b0:3eb:f5a2:2d67 with SMTP id
 a7-20020a05600c224700b003ebf5a22d67mr1443635wmm.33.1681384428335;
        Thu, 13 Apr 2023 04:13:48 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 c7-20020a05600c0a4700b003ef4cd057f5sm5310671wmq.4.2023.04.13.04.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 04:13:47 -0700 (PDT)
Message-ID: <728d682c-bd2a-11e6-b09a-225908104325@linaro.org>
Date: Thu, 13 Apr 2023 12:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/7] soundwire: qcom: use consistently 'ctrl' as state
 variable name
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-5-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230403132503.62090-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 36WNRWWL6GMRIU532R2ZJMGA7XOQCJA7
X-Message-ID-Hash: 36WNRWWL6GMRIU532R2ZJMGA7XOQCJA7
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36WNRWWL6GMRIU532R2ZJMGA7XOQCJA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 03/04/2023 14:25, Krzysztof Kozlowski wrote:
> The pointer to 'struct qcom_swrm_ctrl' was called sometimes 'swrm' and
> sometimes 'ctrl' variable.  Choose one - 'ctrl' - so the code will be
> consistent and easier to read.
> 
> No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Srinivas Kandagagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivas Kandagagatla <srinivas.kandagatla@linaro.org>

--srini

>   drivers/soundwire/qcom.c | 168 +++++++++++++++++++--------------------
>   1 file changed, 84 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index faa091e7472a..00522de47b6f 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -279,14 +279,14 @@ static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
>   	return val;
>   }
>   
> -static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
> +static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *ctrl)
>   {
>   	u32 fifo_outstanding_data, value;
>   	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
>   
>   	do {
>   		/* Check for fifo underflow during read */
> -		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
>   		fifo_outstanding_data = FIELD_GET(SWRM_RD_CMD_FIFO_CNT_MASK, value);
>   
>   		/* Check if read data is available in read fifo */
> @@ -297,39 +297,39 @@ static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
>   	} while (fifo_retry_count--);
>   
>   	if (fifo_outstanding_data == 0) {
> -		dev_err_ratelimited(swrm->dev, "%s err read underflow\n", __func__);
> +		dev_err_ratelimited(ctrl->dev, "%s err read underflow\n", __func__);
>   		return -EIO;
>   	}
>   
>   	return 0;
>   }
>   
> -static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *swrm)
> +static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *ctrl)
>   {
>   	u32 fifo_outstanding_cmds, value;
>   	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
>   
>   	do {
>   		/* Check for fifo overflow during write */
> -		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
>   		fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
>   
>   		/* Check for space in write fifo before writing */
> -		if (fifo_outstanding_cmds < swrm->wr_fifo_depth)
> +		if (fifo_outstanding_cmds < ctrl->wr_fifo_depth)
>   			return 0;
>   
>   		usleep_range(500, 510);
>   	} while (fifo_retry_count--);
>   
> -	if (fifo_outstanding_cmds == swrm->wr_fifo_depth) {
> -		dev_err_ratelimited(swrm->dev, "%s err write overflow\n", __func__);
> +	if (fifo_outstanding_cmds == ctrl->wr_fifo_depth) {
> +		dev_err_ratelimited(ctrl->dev, "%s err write overflow\n", __func__);
>   		return -EIO;
>   	}
>   
>   	return 0;
>   }
>   
> -static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
> +static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
>   				     u8 dev_addr, u16 reg_addr)
>   {
>   
> @@ -342,20 +342,20 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>   		val = swrm_get_packed_reg_val(&cmd_id, cmd_data,
>   					      dev_addr, reg_addr);
>   	} else {
> -		val = swrm_get_packed_reg_val(&swrm->wcmd_id, cmd_data,
> +		val = swrm_get_packed_reg_val(&ctrl->wcmd_id, cmd_data,
>   					      dev_addr, reg_addr);
>   	}
>   
> -	if (swrm_wait_for_wr_fifo_avail(swrm))
> +	if (swrm_wait_for_wr_fifo_avail(ctrl))
>   		return SDW_CMD_FAIL_OTHER;
>   
>   	if (cmd_id == SWR_BROADCAST_CMD_ID)
> -		reinit_completion(&swrm->broadcast);
> +		reinit_completion(&ctrl->broadcast);
>   
>   	/* Its assumed that write is okay as we do not get any status back */
> -	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
> +	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
>   
> -	if (swrm->version <= SWRM_VERSION_1_3_0)
> +	if (ctrl->version <= SWRM_VERSION_1_3_0)
>   		usleep_range(150, 155);
>   
>   	if (cmd_id == SWR_BROADCAST_CMD_ID) {
> @@ -363,7 +363,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>   		 * sleep for 10ms for MSM soundwire variant to allow broadcast
>   		 * command to complete.
>   		 */
> -		ret = wait_for_completion_timeout(&swrm->broadcast,
> +		ret = wait_for_completion_timeout(&ctrl->broadcast,
>   						  msecs_to_jiffies(TIMEOUT_MS));
>   		if (!ret)
>   			ret = SDW_CMD_IGNORED;
> @@ -376,41 +376,41 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>   	return ret;
>   }
>   
> -static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
>   				     u8 dev_addr, u16 reg_addr,
>   				     u32 len, u8 *rval)
>   {
>   	u32 cmd_data, cmd_id, val, retry_attempt = 0;
>   
> -	val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, reg_addr);
> +	val = swrm_get_packed_reg_val(&ctrl->rcmd_id, len, dev_addr, reg_addr);
>   
>   	/*
>   	 * Check for outstanding cmd wrt. write fifo depth to avoid
>   	 * overflow as read will also increase write fifo cnt.
>   	 */
> -	swrm_wait_for_wr_fifo_avail(swrm);
> +	swrm_wait_for_wr_fifo_avail(ctrl);
>   
>   	/* wait for FIFO RD to complete to avoid overflow */
>   	usleep_range(100, 105);
> -	swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
> +	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
>   	/* wait for FIFO RD CMD complete to avoid overflow */
>   	usleep_range(250, 255);
>   
> -	if (swrm_wait_for_rd_fifo_avail(swrm))
> +	if (swrm_wait_for_rd_fifo_avail(ctrl))
>   		return SDW_CMD_FAIL_OTHER;
>   
>   	do {
> -		swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
> +		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
>   		rval[0] = cmd_data & 0xFF;
>   		cmd_id = FIELD_GET(SWRM_RD_FIFO_CMD_ID_MASK, cmd_data);
>   
> -		if (cmd_id != swrm->rcmd_id) {
> +		if (cmd_id != ctrl->rcmd_id) {
>   			if (retry_attempt < (MAX_FIFO_RD_RETRY - 1)) {
>   				/* wait 500 us before retry on fifo read failure */
>   				usleep_range(500, 505);
> -				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD,
> +				ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD,
>   						SWRM_CMD_FIFO_FLUSH);
> -				swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
> +				ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
>   			}
>   			retry_attempt++;
>   		} else {
> @@ -419,9 +419,9 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
>   
>   	} while (retry_attempt < MAX_FIFO_RD_RETRY);
>   
> -	dev_err(swrm->dev, "failed to read fifo: reg: 0x%x, rcmd_id: 0x%x,\
> +	dev_err(ctrl->dev, "failed to read fifo: reg: 0x%x, rcmd_id: 0x%x,\
>   		dev_num: 0x%x, cmd_data: 0x%x\n",
> -		reg_addr, swrm->rcmd_id, dev_addr, cmd_data);
> +		reg_addr, ctrl->rcmd_id, dev_addr, cmd_data);
>   
>   	return SDW_CMD_IGNORED;
>   }
> @@ -533,39 +533,39 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>   
>   static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
>   {
> -	struct qcom_swrm_ctrl *swrm = dev_id;
> +	struct qcom_swrm_ctrl *ctrl = dev_id;
>   	int ret;
>   
> -	ret = pm_runtime_resume_and_get(swrm->dev);
> +	ret = pm_runtime_resume_and_get(ctrl->dev);
>   	if (ret < 0 && ret != -EACCES) {
> -		dev_err_ratelimited(swrm->dev,
> +		dev_err_ratelimited(ctrl->dev,
>   				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
>   				    __func__, ret);
>   		return ret;
>   	}
>   
> -	if (swrm->wake_irq > 0) {
> -		if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
> -			disable_irq_nosync(swrm->wake_irq);
> +	if (ctrl->wake_irq > 0) {
> +		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
> +			disable_irq_nosync(ctrl->wake_irq);
>   	}
>   
> -	pm_runtime_mark_last_busy(swrm->dev);
> -	pm_runtime_put_autosuspend(swrm->dev);
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
>   
>   	return IRQ_HANDLED;
>   }
>   
>   static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   {
> -	struct qcom_swrm_ctrl *swrm = dev_id;
> +	struct qcom_swrm_ctrl *ctrl = dev_id;
>   	u32 value, intr_sts, intr_sts_masked, slave_status;
>   	u32 i;
>   	int devnum;
>   	int ret = IRQ_HANDLED;
> -	clk_prepare_enable(swrm->hclk);
> +	clk_prepare_enable(ctrl->hclk);
>   
> -	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> -	intr_sts_masked = intr_sts & swrm->intr_mask;
> +	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &intr_sts);
> +	intr_sts_masked = intr_sts & ctrl->intr_mask;
>   
>   	do {
>   		for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
> @@ -575,80 +575,80 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   
>   			switch (value) {
>   			case SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ:
> -				devnum = qcom_swrm_get_alert_slave_dev_num(swrm);
> +				devnum = qcom_swrm_get_alert_slave_dev_num(ctrl);
>   				if (devnum < 0) {
> -					dev_err_ratelimited(swrm->dev,
> +					dev_err_ratelimited(ctrl->dev,
>   					    "no slave alert found.spurious interrupt\n");
>   				} else {
> -					sdw_handle_slave_status(&swrm->bus, swrm->status);
> +					sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>   				}
>   
>   				break;
>   			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
>   			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
> -				dev_dbg_ratelimited(swrm->dev, "SWR new slave attached\n");
> -				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
> -				if (swrm->slave_status == slave_status) {
> -					dev_dbg(swrm->dev, "Slave status not changed %x\n",
> +				dev_dbg_ratelimited(ctrl->dev, "SWR new slave attached\n");
> +				ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &slave_status);
> +				if (ctrl->slave_status == slave_status) {
> +					dev_dbg(ctrl->dev, "Slave status not changed %x\n",
>   						slave_status);
>   				} else {
> -					qcom_swrm_get_device_status(swrm);
> -					qcom_swrm_enumerate(&swrm->bus);
> -					sdw_handle_slave_status(&swrm->bus, swrm->status);
> +					qcom_swrm_get_device_status(ctrl);
> +					qcom_swrm_enumerate(&ctrl->bus);
> +					sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>   				}
>   				break;
>   			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
> -				dev_err_ratelimited(swrm->dev,
> +				dev_err_ratelimited(ctrl->dev,
>   						"%s: SWR bus clsh detected\n",
>   						__func__);
> -				swrm->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> -				swrm->reg_write(swrm, SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
> +				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> +				ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW:
> -				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> -				dev_err_ratelimited(swrm->dev,
> +				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
> +				dev_err_ratelimited(ctrl->dev,
>   					"%s: SWR read FIFO overflow fifo status 0x%x\n",
>   					__func__, value);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW:
> -				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> -				dev_err_ratelimited(swrm->dev,
> +				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
> +				dev_err_ratelimited(ctrl->dev,
>   					"%s: SWR read FIFO underflow fifo status 0x%x\n",
>   					__func__, value);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW:
> -				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> -				dev_err(swrm->dev,
> +				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
> +				dev_err(ctrl->dev,
>   					"%s: SWR write FIFO overflow fifo status %x\n",
>   					__func__, value);
> -				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
> +				ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_CMD_ERROR:
> -				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> -				dev_err_ratelimited(swrm->dev,
> +				ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
> +				dev_err_ratelimited(ctrl->dev,
>   					"%s: SWR CMD error, fifo status 0x%x, flushing fifo\n",
>   					__func__, value);
> -				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
> +				ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION:
> -				dev_err_ratelimited(swrm->dev,
> +				dev_err_ratelimited(ctrl->dev,
>   						"%s: SWR Port collision detected\n",
>   						__func__);
> -				swrm->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
> -				swrm->reg_write(swrm,
> -					SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
> +				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
> +				ctrl->reg_write(ctrl,
> +					SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH:
> -				dev_err_ratelimited(swrm->dev,
> +				dev_err_ratelimited(ctrl->dev,
>   					"%s: SWR read enable valid mismatch\n",
>   					__func__);
> -				swrm->intr_mask &=
> +				ctrl->intr_mask &=
>   					~SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH;
> -				swrm->reg_write(swrm,
> -					SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
> +				ctrl->reg_write(ctrl,
> +					SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
> -				complete(&swrm->broadcast);
> +				complete(&ctrl->broadcast);
>   				break;
>   			case SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2:
>   				break;
> @@ -657,19 +657,19 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   			case SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP:
>   				break;
>   			default:
> -				dev_err_ratelimited(swrm->dev,
> +				dev_err_ratelimited(ctrl->dev,
>   						"%s: SWR unknown interrupt value: %d\n",
>   						__func__, value);
>   				ret = IRQ_NONE;
>   				break;
>   			}
>   		}
> -		swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, intr_sts);
> -		swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> -		intr_sts_masked = intr_sts & swrm->intr_mask;
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, intr_sts);
> +		ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &intr_sts);
> +		intr_sts_masked = intr_sts & ctrl->intr_mask;
>   	} while (intr_sts_masked);
>   
> -	clk_disable_unprepare(swrm->hclk);
> +	clk_disable_unprepare(ctrl->hclk);
>   	return ret;
>   }
>   
> @@ -1301,23 +1301,23 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   #ifdef CONFIG_DEBUG_FS
>   static int swrm_reg_show(struct seq_file *s_file, void *data)
>   {
> -	struct qcom_swrm_ctrl *swrm = s_file->private;
> +	struct qcom_swrm_ctrl *ctrl = s_file->private;
>   	int reg, reg_val, ret;
>   
> -	ret = pm_runtime_resume_and_get(swrm->dev);
> +	ret = pm_runtime_resume_and_get(ctrl->dev);
>   	if (ret < 0 && ret != -EACCES) {
> -		dev_err_ratelimited(swrm->dev,
> +		dev_err_ratelimited(ctrl->dev,
>   				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
>   				    __func__, ret);
>   		return ret;
>   	}
>   
>   	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
> -		swrm->reg_read(swrm, reg, &reg_val);
> +		ctrl->reg_read(ctrl, reg, &reg_val);
>   		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
>   	}
> -	pm_runtime_mark_last_busy(swrm->dev);
> -	pm_runtime_put_autosuspend(swrm->dev);
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
>   
>   
>   	return 0;
> @@ -1498,13 +1498,13 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *swrm)
> +static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
>   {
>   	int retry = SWRM_LINK_STATUS_RETRY_CNT;
>   	int comp_sts;
>   
>   	do {
> -		swrm->reg_read(swrm, SWRM_COMP_STATUS, &comp_sts);
> +		ctrl->reg_read(ctrl, SWRM_COMP_STATUS, &comp_sts);
>   
>   		if (comp_sts & SWRM_FRM_GEN_ENABLED)
>   			return true;
> @@ -1512,7 +1512,7 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *swrm)
>   		usleep_range(500, 510);
>   	} while (retry--);
>   
> -	dev_err(swrm->dev, "%s: link status not %s\n", __func__,
> +	dev_err(ctrl->dev, "%s: link status not %s\n", __func__,
>   		comp_sts & SWRM_FRM_GEN_ENABLED ? "connected" : "disconnected");
>   
>   	return false;
