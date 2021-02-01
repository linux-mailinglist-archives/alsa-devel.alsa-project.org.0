Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662230AC09
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 16:54:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75C0B175C;
	Mon,  1 Feb 2021 16:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75C0B175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612194861;
	bh=KOnZ8BI89InFyYoTjqdNVoraekM4k541KpMMQrehfgI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OH3KRlfsc+aX4CDheWkJO/LnSb3XwEbJHOEFIDJQLvoonT3n9J0ceBNczrl7ZpzqD
	 M5edvGn5tovozzWMPCE/s+woRwDiofUORd4KVaOxQ+r65aPWB+/1i9eB+/DoAb7m1z
	 K94VZ0dGKG79KS0m38ik9ScHM1dhdvLXutLv8a3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3223CF802E3;
	Mon,  1 Feb 2021 16:51:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2004EF802E7; Mon,  1 Feb 2021 16:51:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F021F802E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 16:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F021F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LXNkK8kw"
Received: by mail-wm1-x329.google.com with SMTP id m2so13051518wmm.1
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 07:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i8SSWQkh0zibtdmIQx4/MVlmjgE4oTGxCuh2hS6Ocs8=;
 b=LXNkK8kwS8I5EYdGd7Oqp4ltpd/3evnlQ9pODT/h+yVwWkFHNuIhMNhNTFGw5egXWJ
 ZQGrUs6qt700Yx7YMsLTpZoEbIeFpm6dshhsv9+8OcvLUtJkYwogAGqJO/N6ftIR2psT
 eVkHu39yqNiJH1yonF3G9Hz/xhiE5afc2Yq5FJBzBO5CyeDJoZWGh86RPetubs69yzT/
 Pxk93n+LMdMMLgEfN0xX9gzAda36Q+KWgeZfL4sfabRWxvB3Ij1C0Zs/Ea8qnMi5Rffw
 tSScHgfzWfMWORkU2DAz4Rr3SQswUtHFFiW06I1KdN75wHzvDx/CXKaDgnZV4PdHV2D5
 mTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i8SSWQkh0zibtdmIQx4/MVlmjgE4oTGxCuh2hS6Ocs8=;
 b=iojb5NFXsy9v3JIAN2vYr6CAXlQa0FWST5KegXTj8nQSs320mdMlSQG7ad6VVIjoLw
 DyWGvjl2gNcN4QOEIot1iFKrpdy+J+IrGiUdYEaxKwnExFhyfehAvJOBW9MboiRb+J1Y
 CSgTtid1NwJgL23hxi+y3LKKSw+tDXHbJ2BZ7FBtpWGV/TzhQPutCaprDJHxM4t/Tu6w
 Q+dkqR9IEqmSYJTbaSNhsQEcU8Ai6vuPuU1dAeQ4q121fLsPv0/Dpm0PtBXXVETxeEs0
 BZTW7uoHbyNF0ApZYy+Y+X3CKfnIiApBHNOVL5VvaOk/CaR+q9v+B093NsE5YwdJLWA1
 qPTQ==
X-Gm-Message-State: AOAM5330wMxbkp1qGyG3cAiMyQHa2lJzyrlgu87SQfVMun8hLsfZHB6V
 uW3o9oesOgZTcJ78wUhZseS8XSSEjhsLYw==
X-Google-Smtp-Source: ABdhPJxVwcj/Tzs67NWgjWLOxFNI8hXNwGk/OlY4fTw0XWnFUmQzw1ruGX7vri5Fn1bpsdnnea+9Tw==
X-Received: by 2002:a1c:acc9:: with SMTP id v192mr10609384wme.22.1612194674792; 
 Mon, 01 Feb 2021 07:51:14 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id p15sm27327790wrt.15.2021.02.01.07.51.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:51:14 -0800 (PST)
Subject: Re: [PATCH 6/6] soundwire: qcom: add support to new interrupts
To: Vinod Koul <vkoul@kernel.org>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-7-srinivas.kandagatla@linaro.org>
 <20210201143116.GE2771@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5275b56b-bc6b-8e75-5407-d9be77ec5a34@linaro.org>
Date: Mon, 1 Feb 2021 15:51:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210201143116.GE2771@vkoul-mobl>
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



On 01/02/2021 14:31, Vinod Koul wrote:
> On 29-01-21, 17:32, Srinivas Kandagatla wrote:
>> Add support to new interrupts and update irq routine in a way
>> to deal with multiple pending interrupts with in a single interrupt!
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 191 ++++++++++++++++++++++++++++++---------
>>   1 file changed, 146 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index d61b204dc284..c699bd51d29a 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -28,10 +28,21 @@
>>   #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
>>   #define SWRM_INTERRUPT_STATUS					0x200
>>   #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
>> +#define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
>>   #define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
>>   #define SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS		BIT(2)
>> +#define SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET			BIT(3)
>> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW			BIT(4)
>> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW			BIT(5)
>> +#define SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW		BIT(6)
>>   #define SWRM_INTERRUPT_STATUS_CMD_ERROR				BIT(7)
>> +#define SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION		BIT(8)
>> +#define SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH		BIT(9)
>>   #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
>> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
>> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
>> +#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
>> +#define SWRM_INTERRUPT_MAX					17
>>   #define SWRM_INTERRUPT_MASK_ADDR				0x204
>>   #define SWRM_INTERRUPT_CLEAR					0x208
>>   #define SWRM_INTERRUPT_CPU_EN					0x210
>> @@ -105,11 +116,8 @@ struct qcom_swrm_ctrl {
>>   	struct device *dev;
>>   	struct regmap *regmap;
>>   	void __iomem *mmio;
>> -	struct completion *comp;
>>   	struct completion broadcast;
>>   	struct work_struct slave_work;
>> -	/* read/write lock */
>> -	spinlock_t comp_lock;
>>   	/* Port alloc/free lock */
>>   	struct mutex port_lock;
>>   	struct mutex io_lock;
>> @@ -126,6 +134,7 @@ struct qcom_swrm_ctrl {
>>   	int rows_index;
>>   	unsigned long dout_port_mask;
>>   	unsigned long din_port_mask;
>> +	u32 intr_mask;
>>   	u8 rcmd_id;
>>   	u8 wcmd_id;
>>   	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>> @@ -315,6 +324,27 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
>>   	return ret;
>>   }
>>   
>> +static int qcom_swrm_get_alert_slave(struct qcom_swrm_ctrl *ctrl)
>> +{
>> +	u32 val;
>> +	int i;
>> +
>> +	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>> +
>> +	for (i = 0; i < SDW_MAX_DEVICES; i++) {
>> +		u32 s;
> 
> define at top of the function pls, also maybe better name status?
Sure,
> 
>> +
>> +		s = (val >> (i * 2));
> 
> why * 2 ? Maybe add a comment for this logic

This is status mask of 2 bits! Will clarify this in next version!

> 
>> +
>> +		if ((s & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
>> +			ctrl->status[i] = s;
>> +			return i;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>>   static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
>>   {
>>   	u32 val;
>> @@ -333,40 +363,122 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
>>   
>>   static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>>   {
>> -	struct qcom_swrm_ctrl *ctrl = dev_id;
>> -	u32 sts, value;
>> -	unsigned long flags;
>> -
>> -	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
>> -
>> -	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
>> -		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
>> -		dev_err_ratelimited(ctrl->dev,
>> -				    "CMD error, fifo status 0x%x\n",
>> -				     value);
>> -		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
>> -	}
>> +	struct qcom_swrm_ctrl *swrm = dev_id;
>> +	u32 value, intr_sts, intr_sts_masked;
>> +	u32 i;
>> +	u8 devnum = 0;
>> +	int ret = IRQ_HANDLED;
>> +
>> +
>> +	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
>> +	intr_sts_masked = intr_sts & swrm->intr_mask;
>> +
>> +handle_irq:
> 
> maybe move this into a fn and avoid a goto for non err path?
> 
Makes sense!


--srini
