Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF7263F6C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 10:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31225166A;
	Thu, 10 Sep 2020 10:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31225166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599725500;
	bh=DR98Hi6kcFCnOM6iwD5sBng+7YNap/nakuLle9t5lJM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sC3BZJNCJWdTklTaH5ytuadPepW0AlDzpYua4axRqpzWXZQD/iBmg3YEvtaT+ZDC3
	 0eQoX6Aml42meF6bh4n8RKY52KIvw1A31WhnKG09L2KNDrK9zhOacFDs47UpmHU1PF
	 uflPXEamA5Im/sa09p39kkceTegLbp3rF9h+ARvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36B26F801F2;
	Thu, 10 Sep 2020 10:09:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E310F80264; Thu, 10 Sep 2020 10:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF1EF800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 10:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF1EF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HfnozHbW"
Received: by mail-wr1-x444.google.com with SMTP id c18so5624561wrm.9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 01:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HW5X6FWMv5/e4KSBh82l0NpUQWigGJ0PbEh/1MkAVKU=;
 b=HfnozHbWaTguajYcFNCVKxZ75ih8D/HaTbS53P9AhX6OU9DY9b7kQa5XoK9ZDPIxub
 zJe8aLjRn9bjJ5T3+tEDTbLvam1KHVi5P9mMtPf8daiKa/RSLEzjln21/fTxFXLpfTXW
 DKsaaIKEPDTGy7ODLODbWhH2nMKYMmm144Pz7c5NEuokuV+78OaRiJGNz5ljTTrv2mXi
 R4VXcAYCkdUJd3ToDY7dbZH2g1UwXOvC74FNzUZlOmnFypZz2GUMA7AXvZ01Rg+0Rh1I
 uF3+Sc6P73+SmQC1I05a9Kg17PHHd8xtExKuT9X1rujIXJRtv49pCn6nwwP0bHgqVpx0
 qDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HW5X6FWMv5/e4KSBh82l0NpUQWigGJ0PbEh/1MkAVKU=;
 b=bhGdcRokSxLvS7OaOswT1yyOSNHdRvRBYiRYn2aG9BDk/WHes6/BR9JVcVUAqQGlbl
 xfy1ZwckXOTw843I6u0bqJMFfteW8JHOzEDkGO+PMHBTbIQMD+5YtwflH8C3UoapIguG
 rNzf405HuVO64xXV/xz5Z5Aoe6uJkjjTn0rF4kwhJ9f1Xtg3FrGZANFOJM7/6jsD1mFg
 9rzGvh3FUiH3WQoYsY9a7q/iOoRUxnEoizSbTLaZ1+CzyggMFaPWuOB/eDeI39hDiKij
 wONRmfDvbRttZ2soynIxih5mwud39Y8tyqf8vAdk+Ae1YyVD3dWAAQBV7t9Pfl7OImEZ
 v2rg==
X-Gm-Message-State: AOAM530nzXHtGU90BlobVKrfdB7Mhnr+Iojjo6GxI6zUbhR7CdO2/E8+
 w95Pk0f51xwFUXAYQcn+jwqpkg==
X-Google-Smtp-Source: ABdhPJyC24439Plq0OYUSmUtWSm/IIc4tZh9ord4BIkHn4H3dQ3W41vvJq9aF+i00RtWqgOdPeQmOw==
X-Received: by 2002:adf:8544:: with SMTP id 62mr7749987wrh.262.1599725381930; 
 Thu, 10 Sep 2020 01:09:41 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 197sm2616771wme.10.2020.09.10.01.09.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 01:09:41 -0700 (PDT)
Subject: Re: [PATCH 2/2] soundwire: qcom: get max rows and cols info from
 compatible
To: Vinod Koul <vkoul@kernel.org>
References: <20200909160912.3656-1-srinivas.kandagatla@linaro.org>
 <20200909160912.3656-3-srinivas.kandagatla@linaro.org>
 <20200910063940.GR77521@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c14cf97f-5a42-95a5-d44c-bc6ac9ea35a3@linaro.org>
Date: Thu, 10 Sep 2020 09:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200910063940.GR77521@vkoul-mobl>
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



On 10/09/2020 07:39, Vinod Koul wrote:
> On 09-09-20, 17:09, Srinivas Kandagatla wrote:
>> currently the max rows and cols values are hardcoded. In reality
>> these values depend on the IP version. So get these based on
>> device tree compatible strings.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 46 +++++++++++++++++++++++++++-------------
>>   1 file changed, 31 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 1ec0ee931f5b..03c5bc05fc6e 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -69,11 +69,6 @@
>>   #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
>>   			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
>>   
>> -#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
>> -#define SWRM_DEFAULT_ROWS	48
>> -#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
>> -#define SWRM_DEFAULT_COL	16
>> -#define SWRM_MAX_COL_VAL	7
>>   #define SWRM_SPECIAL_CMD_ID	0xF
>>   #define MAX_FREQ_NUM		1
>>   #define TIMEOUT_MS		(2 * HZ)
>> @@ -107,6 +102,8 @@ struct qcom_swrm_ctrl {
>>   	unsigned int version;
>>   	int num_din_ports;
>>   	int num_dout_ports;
>> +	int cols_index;
>> +	int rows_index;
>>   	unsigned long dout_port_mask;
>>   	unsigned long din_port_mask;
>>   	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>> @@ -116,6 +113,21 @@ struct qcom_swrm_ctrl {
>>   	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
>>   };
>>   
>> +struct qcom_swrm_data {
>> +	int default_cols;
>> +	int default_rows;
> 
> unsigned int for these?
Yes, we could do that but does it really add anything, given the range 
is up to 256.

> 
>> +};
>> +
>> +static struct qcom_swrm_data swrm_v1_3_data = {
>> +	.default_rows = 48,
>> +	.default_cols = 16,
>> +};
>> +
>> +static struct qcom_swrm_data swrm_v1_5_data = {
>> +	.default_rows = 50,
>> +	.default_cols = 16,
>> +};
>> +
>>   #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>>   
>>   static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>> @@ -302,8 +314,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	u32 val;
>>   
>>   	/* Clear Rows and Cols */
>> -	val = (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
>> -	       SWRM_MIN_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
>> +	val = ctrl->rows_index << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
>> +		ctrl->cols_index << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT;
> 
> use FIELD_{GET|SET} / u32_encode_bits for these
> 
> Please rebase on sdw-next, this has already been updated in next

Yes, I will do that!
> 
>>   
>>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>>   
>> @@ -382,8 +394,8 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
>>   	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
>>   	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
>>   
>> -	val |= (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
>> -		SWRM_MAX_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
>> +	val |= ctrl->rows_index << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
>> +	       ctrl->cols_index << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT;
>>   
>>   	return ctrl->reg_write(ctrl, reg, val);
>>   }
>> @@ -784,6 +796,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	struct sdw_master_prop *prop;
>>   	struct sdw_bus_params *params;
>>   	struct qcom_swrm_ctrl *ctrl;
>> +	const struct qcom_swrm_data *data;
>>   	struct resource *res;
>>   	int ret;
>>   	u32 val;
>> @@ -792,6 +805,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	if (!ctrl)
>>   		return -ENOMEM;
>>   
>> +	data = of_device_get_match_data(dev);
> 
> how about checking data is valid?
I think the check would be unnecessary here, as we would not endup here 
without a matching compatible!

--srini
> 
>> +	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>> +	ctrl->cols_index = sdw_find_col_index(data->default_cols);
>>   #ifdef CONFIG_SLIMBUS
>>   	if (dev->parent->bus == &slimbus_bus) {
>>   #else
>> @@ -844,8 +860,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	params = &ctrl->bus.params;
>>   	params->max_dr_freq = DEFAULT_CLK_FREQ;
>>   	params->curr_dr_freq = DEFAULT_CLK_FREQ;
>> -	params->col = SWRM_DEFAULT_COL;
>> -	params->row = SWRM_DEFAULT_ROWS;
>> +	params->col = data->default_cols;
>> +	params->row = data->default_rows;
>>   	ctrl->reg_read(ctrl, SWRM_MCP_STATUS, &val);
>>   	params->curr_bank = val & SWRM_MCP_STATUS_BANK_NUM_MASK;
>>   	params->next_bank = !params->curr_bank;
>> @@ -855,8 +871,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	prop->num_clk_gears = 0;
>>   	prop->num_clk_freq = MAX_FREQ_NUM;
>>   	prop->clk_freq = &qcom_swrm_freq_tbl[0];
>> -	prop->default_col = SWRM_DEFAULT_COL;
>> -	prop->default_row = SWRM_DEFAULT_ROWS;
>> +	prop->default_col = data->default_cols;
>> +	prop->default_row = data->default_rows;
>>   
>>   	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
>>   
>> @@ -907,8 +923,8 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id qcom_swrm_of_match[] = {
>> -	{ .compatible = "qcom,soundwire-v1.3.0", },
>> -	{ .compatible = "qcom,soundwire-v1.5.1", },
>> +	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>> +	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
>>   	{/* sentinel */},
>>   };
>>   
>> -- 
>> 2.21.0
> 
