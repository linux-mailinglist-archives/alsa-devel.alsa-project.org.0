Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17830326670
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 18:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DAD1169A;
	Fri, 26 Feb 2021 18:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DAD1169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614361668;
	bh=FpAID+yww7ECl6+7sMP3KvaXMYoESRrDorcePwbRnJo=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SOHY2bdaDYJHKG1/NTbNTbpbJir7y8fhNPJgP49rR4ajPIj5gEPQs4Hks0h4mxUIe
	 I/TTzgyktJXYTBI++YcM7TWl1zE5WQccaHYGGwVfPd3wExgnCtvZvhTP+YGORpIUif
	 G0QvOOwd8BZTW+IxP4FFzd77dci6UeqBRzP15Mp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4805F80154;
	Fri, 26 Feb 2021 18:46:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A040F8016C; Fri, 26 Feb 2021 18:46:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DFA7F80161
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 18:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DFA7F80161
IronPort-SDR: QSYj/IuWyMtUdxJp9ODnK8m3M3v+KVjxvccWfnQyZZZNVnKXnxjvO9cVcY+OFkUg8F7BuTHkZM
 SnoaespZVytA==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="185262051"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="185262051"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 09:45:39 -0800
IronPort-SDR: Y0GiQagDo5GTv1ZbQ03rpUeN62xAuAnWazm1QzYWLEEBE5IEnu7+iFEmPfDYwUlwJYTFCKD63S
 b7lsREAmef/w==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="432857280"
Received: from esnyder-desk.amr.corp.intel.com (HELO [10.255.230.205])
 ([10.255.230.205])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 09:45:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/3] soundwire: qcom: add auto enumeration support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
 <20210226170250.9067-3-srinivas.kandagatla@linaro.org>
Message-ID: <0c551b23-7ed4-59d7-72c2-284bdf8584f1@linux.intel.com>
Date: Fri, 26 Feb 2021 11:44:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226170250.9067-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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


> +static int qcom_swrm_enumerate(struct sdw_bus *bus)
> +{
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	struct sdw_slave *slave, *_s;
> +	struct sdw_slave_id id;
> +	u32 val1, val2;
> +	u64 addr;
> +	int i;
> +	char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
> +
> +	for (i = 1; i < (SDW_MAX_DEVICES + 1); i++) {

I don't understand the (SDW_MAX_DEVICES + 1)?


> +		/*SCP_Devid5 - Devid 4*/
> +		ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
> +
> +		/*SCP_Devid3 - DevId 2 Devid 1 Devid 0*/
> +		ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_2(i), &val2);

Do you mind explaining a bit what happens here?
Does the hardware issue commands to read all DevID registers and set the 
device number automagically?
If yes, then in SoundWire parlance the enumeration is complete. What you 
are doing below is no longer part of the enumeration.


> +
> +		if (!val1 && !val2)
> +			break;
> +
> +		addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
> +			((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
> +			((u64)buf1[0] << 40);
> +
> +		sdw_extract_slave_id(bus, addr, &id);
> +		/* Now compare with entries */
> +		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
> +			if (sdw_compare_devid(slave, id) == 0) {
> +				u32 status = qcom_swrm_get_n_device_status(ctrl, i);
> +				if (status == SDW_SLAVE_ATTACHED) {
> +					slave->dev_num = i;
> +					mutex_lock(&bus->bus_lock);
> +					set_bit(i, bus->assigned);
> +					mutex_unlock(&bus->bus_lock);
> +
> +				}

And that part is strange as well. The bus->assigned bit should be set 
even if the Slave is not in the list provided by platform firmware. It's 
really tracking the state of the hardware, and it should not be 
influenced by what software knows to manage.

> +				break;
> +			}
> +		}
> +	}
> +
> +	complete(&ctrl->enumeration);

you have init_completion() and complete() in this patch, but no 
wait_for_completion(), so that should be added in a later patch, no?

> +	return 0;
> +}
> +
>   static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   {
>   	struct qcom_swrm_ctrl *swrm = dev_id;
> -	u32 value, intr_sts, intr_sts_masked;
> +	u32 value, intr_sts, intr_sts_masked, slave_status;
>   	u32 i;
>   	u8 devnum = 0;
>   	int ret = IRQ_HANDLED;
> @@ -382,10 +443,19 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   				break;
>   			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
>   			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
> -				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
> +				dev_err_ratelimited(swrm->dev, "%s: SWR slave status changed\n",
>   					__func__);
> -				qcom_swrm_get_device_status(swrm);
> -				sdw_handle_slave_status(&swrm->bus, swrm->status);
> +				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
> +				if (swrm->slave_status == slave_status) {
> +					dev_err(swrm->dev, "Slave status not changed %x\n",
> +						slave_status);
> +					break;
> +				} else {
> +					dev_err(swrm->dev, "Slave status handle %x\n", slave_status);
> +					qcom_swrm_get_device_status(swrm);
> +					qcom_swrm_enumerate(&swrm->bus);
> +					sdw_handle_slave_status(&swrm->bus, swrm->status);
> +				}
>   				break;
>   			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
>   				dev_err_ratelimited(swrm->dev,
> @@ -472,8 +542,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>   
>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>   
> -	/* Disable Auto enumeration */
> -	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
> +	/* Enable Auto enumeration */
> +	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
>   
>   	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
>   	/* Mask soundwire interrupts */
> @@ -507,6 +577,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>   		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
>   				SWRM_INTERRUPT_STATUS_RMSK);
>   	}
> +	ctrl->slave_status = 0;
>   	return 0;
>   }
>   
> @@ -1068,6 +1139,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	dev_set_drvdata(&pdev->dev, ctrl);
>   	mutex_init(&ctrl->port_lock);
>   	init_completion(&ctrl->broadcast);
> +	init_completion(&ctrl->enumeration);
>   
>   	ctrl->bus.ops = &qcom_swrm_ops;
>   	ctrl->bus.port_ops = &qcom_swrm_port_ops;
> 
