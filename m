Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AE426C2FF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 14:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3D216AB;
	Wed, 16 Sep 2020 14:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3D216AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600261005;
	bh=twqlpMqt43oL0iwdK90qMzFVBu8mELn3r2phB3xGm3Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQ2UgmuR+SBVRqEze6LC04tCZe9oRNJKPG1sjfkYTNvD7MnplNPx88No3CKUC4ZQa
	 FsSToL/HGBD2QO5pG6GYgMYUFo1hTDemCuJAuT6JRjbQJ182uaNkNuSLBpny0bBxi9
	 fQgvb0hE4lqjVdW3LYpjuxvASZwUBbNC/nO822ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 849A7F800BB;
	Wed, 16 Sep 2020 14:55:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57E8F8015A; Wed, 16 Sep 2020 14:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3A6DF800BB
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 14:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A6DF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DwQjIK9j"
Received: by mail-wr1-x444.google.com with SMTP id c18so6780464wrm.9
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 05:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rNdOPIdhtnzpSi7bofh8UM7utpbE8JYVa5S2O7zT4fI=;
 b=DwQjIK9jIFVQTFkcSQ2vr8IdWUj1C4q2OxsrErtqhYomjeFJ1ghMVXfsX/P4yLjqVy
 QyYEsMcxpnjbqCX7LKXdpCs7P3W0wvFLucbwmdPKmpA06VOu/H46HhWpM6WinrSmwnyD
 lrQr8TWBgc/fVMGYNjekmzf0hcXqgWD+Oivw/c/4O3XLfb/+XcLq0a3J5C/NQwyx5OjK
 PDtPtcgQ0JrIj+E1j/KnKNrdoaX65TzfwytWgXVqH8ocj85+81vqtjFPxyraisq7LIA1
 PT9DbzQoZ155ymq3YAFmcjpjmROKcvezmrSJMrWogLllaCwGvYO8p10sRnEmryfpjGV+
 JYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rNdOPIdhtnzpSi7bofh8UM7utpbE8JYVa5S2O7zT4fI=;
 b=bAGA1dq2xu9U/xpfmQjHTwjFyG5bZ3pbAGptDZ3sd6WDG2zkzx6HrqwGwjMohu0UKv
 8DNPKQhkghPom9oQPwqStMGmZ4Nc/ZKogEJh9/xKAFR9jQbFi5g3eKZAqUeSgfpOplkr
 irMit2KRwKcid4MZxpxrvfUfcYMLBHVzZe/OWX/zKgVb29VDEpfQrW0xMtkTxtt0WVpZ
 wuK8IixxfPW25ecOE4pTGqAq90b6m4vfIiGcJ2XSVNbQiaAeBH23BAauyvWuZoavPrlL
 eSoCUl6x2uWwpBRvzeA6nMyh10vLVoH9ynx3Jqfecoo1/Z3m1d1H3ttLej1XBvQ105I3
 2xzw==
X-Gm-Message-State: AOAM531o8/91aWs3FKqMiw+DIlxMFbPuZT9jpYFHU7ZgLLpc2E/Wxpij
 F7hbcSnnlmqk/CfhFmpUzYXijA==
X-Google-Smtp-Source: ABdhPJylYriyIC+58rMqaoF1MRMQTl5iINoKpVY3CaorGWN/xQCiINuEsSvG2wBXIB0D79cY2kLy2g==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr25606781wrn.145.1600260894009; 
 Wed, 16 Sep 2020 05:54:54 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z15sm32229569wrv.94.2020.09.16.05.54.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 05:54:53 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] soundwire: qcom: get max rows and cols info from
 compatible
To: Vinod Koul <vkoul@kernel.org>
References: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
 <20200916092125.30898-4-srinivas.kandagatla@linaro.org>
 <20200916124911.GN2968@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9f7c3e8b-872a-e53a-d144-4c558fa6c0b6@linaro.org>
Date: Wed, 16 Sep 2020 13:54:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200916124911.GN2968@vkoul-mobl>
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



On 16/09/2020 13:49, Vinod Koul wrote:
> On 16-09-20, 10:21, Srinivas Kandagatla wrote:
>> currently the max rows and cols values are hardcoded. In reality
>> these values depend on the IP version. So get these based on
>> device tree compatible strings.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 50 ++++++++++++++++++++++++++++------------
>>   1 file changed, 35 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 76963a7bdaa3..1dbf33684470 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -66,11 +66,6 @@
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
>> @@ -104,6 +99,8 @@ struct qcom_swrm_ctrl {
>>   	unsigned int version;
>>   	int num_din_ports;
>>   	int num_dout_ports;
>> +	int cols_index;
>> +	int rows_index;
>>   	unsigned long dout_port_mask;
>>   	unsigned long din_port_mask;
>>   	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>> @@ -113,6 +110,21 @@ struct qcom_swrm_ctrl {
>>   	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
>>   };
>>   
>> +struct qcom_swrm_data {
>> +	u32 default_cols;
>> +	u32 default_rows;
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
>> @@ -299,8 +311,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	u32 val;
>>   
>>   	/* Clear Rows and Cols */
>> -	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
>> -	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MIN_COL_VAL);
>> +	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK,
>> +			 ctrl->rows_index);
>> +	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK,
>> +			  ctrl->cols_index);
> 
> single line for these ?
My vimrc had this 80 line autowrap thingy which might have done this!!

> 
>>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>>   
>> @@ -378,8 +392,10 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
>>   	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
>>   	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
>>   
>> -	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MAX_COL_VAL);
>> -	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
>> +	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK,
>> +			  ctrl->cols_index);
>> +	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK,
>> +			  ctrl->rows_index);
> 
> here as well
> 
>>   
>>   	return ctrl->reg_write(ctrl, reg, val);
>>   }
>> @@ -780,6 +796,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	struct sdw_master_prop *prop;
>>   	struct sdw_bus_params *params;
>>   	struct qcom_swrm_ctrl *ctrl;
>> +	const struct qcom_swrm_data *data;
>>   	int ret;
>>   	u32 val;
>>   
>> @@ -787,6 +804,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	if (!ctrl)
>>   		return -ENOMEM;
>>   
>> +	data = of_device_get_match_data(dev);
> 
> Wont it be good to check if data is valid, we do dereference it few line
> below
We Should not hit that case as we will never reach here without matching 
compatible!
If you insist, I can add a check but data will be always be valid at the 
time of check!

> 
>> +	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>> +	ctrl->cols_index = sdw_find_col_index(data->default_cols);
>>   #if IS_ENABLED(CONFIG_SLIMBUS)
>>   	if (dev->parent->bus == &slimbus_bus) {
>>   #else
>> @@ -836,8 +856,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
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
>> @@ -847,8 +867,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
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
>> @@ -899,8 +919,8 @@ static int qcom_swrm_remove(struct platform_device *pdev)
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
