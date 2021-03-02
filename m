Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CE32993B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 11:14:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC83916F9;
	Tue,  2 Mar 2021 11:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC83916F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614680094;
	bh=9hZM6W2kM3D2+97Fycx2WfC2TT/FHWRKhXDlgjwZ8cw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Io0FmuDJ4Tt2FDq7hPenXgdgCiFcun9bApr26R08ddNq11QeW8ma883IJDXHKH9Ff
	 XYrkiQaGTIEbRzpenlO0d9f7N3RLY+jIwYPavD/ONAIlmiriLkNcFpNdlh8hm/Un+U
	 bOVbLkmxgCHvbDZVWacboS8FETo1ZSXd+58TmYzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3216DF80269;
	Tue,  2 Mar 2021 11:13:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25696F8025B; Tue,  2 Mar 2021 11:13:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D1EFF80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 11:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D1EFF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wfbHLmk1"
Received: by mail-wr1-x42f.google.com with SMTP id f12so15409319wrx.8
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 02:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xcr6nYe2UxMWOTbC9+BHvb9NVTHNUG0GFxt3b2FnksY=;
 b=wfbHLmk1lwwkYx86pI0Jkn8A4TeGXZ3p7PcqGzBtQL+jbzrKHa2QushbeL0kgmOdcy
 DgRzk8eyg9PolPbdM3IuVmiUiXwumX8jiYo+Az6BKjJQyHI/wxCidy0es4Sg/ui4IVRr
 CSoRejo3PTgnj9U5Q8z5qf5LdSLQyJ4FoWf0ejC0JtmtL5t4ClG4TNUyG9LMuPD8SiJw
 pUxrhmPmfIXj9Z2yLlTM5vOD7n1+AuoVDPFDVpg1naVBsWnTZLowkWzBE82WitZfKLfr
 Ok3Or4yLG9EruAJZj1F7LTSH/SsCefgCzU0y7P0wNZpObT7J/AwAQUyGpJEI8lBxCBId
 NK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xcr6nYe2UxMWOTbC9+BHvb9NVTHNUG0GFxt3b2FnksY=;
 b=aVMx6kG2opwKZcTO2aEOmNrClHnjwF2v85yGeVAqZ2o2zzjeBjN0GT3bcR9f98MHUx
 lnwH58RgbM63/76sYbDFhXe0++pzpN92sMOHLgBRga8RfSdXB2hVLrN3HG1bzoWY963s
 UBCMlTkeEkInkMRiY7G1O0zvLCzx/2py9AGa/Gk8QtmWmHI0BTNZAXR7IKMCXksKLM5O
 /UiQe/poNhXciXCt3R1Q2uFr0xxdaBTcO2by24BmJBNd7fzaGh2K9J+V4LzP+yUHlZ1/
 7dDRmfsJJOauSvLPe02SGxpq/LFGjd5+l9142ystP0/P/Lwgl+WLKRb+8lbMuCgSGQi0
 zRAw==
X-Gm-Message-State: AOAM531dQtqb9N8GMx0hNKmtSQPmWEc0twMgiv28ar30N4GPL86OAHq6
 /SivYnJAaK0MVWYL9nCz+VOU8/8X+8GbuQ==
X-Google-Smtp-Source: ABdhPJy4Qs3kI/CTheU4YQQqlrXckGJI2rZKeSgmj9W2cepKFmwaH6mvOExt2Nu/KMdKtNXug6CARg==
X-Received: by 2002:a5d:4fc5:: with SMTP id h5mr21901451wrw.33.1614679994411; 
 Tue, 02 Mar 2021 02:13:14 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 12sm2051210wmw.43.2021.03.02.02.13.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:13:13 -0800 (PST)
Subject: Re: [PATCH v2 1/5] soundwire: qcom: add support to missing transport
 params
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20210226155814.27536-1-srinivas.kandagatla@linaro.org>
 <20210226155814.27536-2-srinivas.kandagatla@linaro.org>
 <00842f73-c0fb-5728-3ed0-c0a1fd75f94e@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <31eca99d-9f84-e088-443b-9aae782c2df2@linaro.org>
Date: Tue, 2 Mar 2021 10:13:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <00842f73-c0fb-5728-3ed0-c0a1fd75f94e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Thanks Pierre for reviewing the patches!

On 26/02/2021 16:45, Pierre-Louis Bossart wrote:
> 
> 
> On 2/26/21 9:58 AM, Srinivas Kandagatla wrote:
>> Some of the transport parameters derived from device tree
>> are not fully parsed by the driver.
>>
>> This patch adds support to parse those missing parameters.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 99 ++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 95 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 6d22df01f354..fee7465c72c2 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -54,7 +54,13 @@
>>   #define SWRM_MCP_SLV_STATUS                    0x1090
>>   #define SWRM_MCP_SLV_STATUS_MASK                GENMASK(1, 0)
>>   #define SWRM_DP_PORT_CTRL_BANK(n, m)    (0x1124 + 0x100 * (n - 1) + 
>> 0x40 * m)
>> +#define SWRM_DP_PORT_CTRL_2_BANK(n, m)    (0x1128 + 0x100 * (n - 1) + 
>> 0x40 * m)
>> +#define SWRM_DP_BLOCK_CTRL_1(n)        (0x112C + 0x100 * (n - 1))
>> +#define SWRM_DP_BLOCK_CTRL2_BANK(n, m)    (0x1130 + 0x100 * (n - 1) + 
>> 0x40 * m)
>> +#define SWRM_DP_PORT_HCTRL_BANK(n, m)    (0x1134 + 0x100 * (n - 1) + 
>> 0x40 * m)
>>   #define SWRM_DP_BLOCK_CTRL3_BANK(n, m)    (0x1138 + 0x100 * (n - 1) 
>> + 0x40 * m)
>> +#define SWRM_DIN_DPn_PCM_PORT_CTRL(n)    (0x1054 + 0x100 * (n - 1))
>> +
>>   #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT                0x18
>>   #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT                0x10
>>   #define SWRM_DP_PORT_CTRL_OFFSET1_SHFT                0x08
>> @@ -73,12 +79,20 @@
>>   #define QCOM_SDW_MAX_PORTS    14
>>   #define DEFAULT_CLK_FREQ    9600000
>>   #define SWRM_MAX_DAIS        0xF
>> +#define SWR_INVALID_PARAM 0xFF
>> +#define SWR_HSTOP_MAX_VAL 0xF
>> +#define SWR_HSTART_MIN_VAL 0x0
>>   struct qcom_swrm_port_config {
>>       u8 si;
>>       u8 off1;
>>       u8 off2;
>>       u8 bp_mode;
>> +    u8 hstart;
>> +    u8 hstop;
>> +    u8 word_length;
>> +    u8 blk_group_count;
>> +    u8 lane_control;
>>   };
>>   struct qcom_swrm_ctrl {
>> @@ -396,7 +410,13 @@ static int qcom_swrm_port_params(struct sdw_bus 
>> *bus,
>>                    struct sdw_port_params *p_params,
>>                    unsigned int bank)
>>   {
>> -    /* TBD */
>> +    struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>> +
>> +    if (p_params->bps != SWR_INVALID_PARAM)
> 
> this is odd. sdw_port_params is a structure in 
> include/linux/soundwire/sdw.h, but here you are comparing the value with 
> a private qualcomm-defined value.
> 
> The Word length of the port is limited by the standard (64), so your 
> choice of 0xFF for SWR_INVALID_PARAM is legit, but it should be a 
> 'public' define.
> 
Am not sure if this really make sense to add it as a public define!

This is more of how the parameters are marked as not applicable for some 
ports while passing these values from device tree.


But I agree with your comments, now I have modified the code to look at 
the qcom_swrm_port_config instead of checking the "struct 
sdw_port_params" or "struct sdw_transport_params" which should make this 
INVALID flag not relevant to these data-structures anymore!


>> +        return ctrl->reg_write(ctrl,
>> +                       SWRM_DP_BLOCK_CTRL_1(p_params->num),
>> +                       p_params->bps - 1);
>> +
>>       return 0;
>>   }
>> @@ -415,10 +435,32 @@ static int qcom_swrm_transport_params(struct 
>> sdw_bus *bus,
>>       ret = ctrl->reg_write(ctrl, reg, value);
>> -    if (!ret && params->blk_pkg_mode) {
>> -        reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
>> +    if (params->lane_ctrl != SWR_INVALID_PARAM) {
>> +        reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
>> +        value = params->lane_ctrl;
>> +        ret = ctrl->reg_write(ctrl, reg, value);
>> +    }
>> -        ret = ctrl->reg_write(ctrl, reg, 1);
>> +    if (params->blk_grp_ctrl != SWR_INVALID_PARAM) {
>> +        reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
>> +        value = params->blk_grp_ctrl;
>> +        ret = ctrl->reg_write(ctrl, reg, value);
>> +    }
>> +
>> +    if (params->hstart != SWR_INVALID_PARAM
>> +            && params->hstop != SWR_INVALID_PARAM) {
>> +        reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
>> +        value = (params->hstop << 4) | params->hstart;
>> +        ret = ctrl->reg_write(ctrl, reg, value);
>> +    } else {
>> +        reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
>> +        value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
>> +        ret = ctrl->reg_write(ctrl, reg, value);
>> +    }
>> +
>> +    if (params->blk_pkg_mode != SWR_INVALID_PARAM) {
>> +        reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
>> +        ret = ctrl->reg_write(ctrl, reg, params->blk_pkg_mode);
>>       }
> 
> same comments here, you should define a public define for all those 
> parameters.
> 
>>       return ret;
>> @@ -470,6 +512,17 @@ static int qcom_swrm_compute_params(struct 
>> sdw_bus *bus)
>>               p_rt->transport_params.offset1 = pcfg->off1;
>>               p_rt->transport_params.offset2 = pcfg->off2;
>>               p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
>> +            p_rt->transport_params.blk_grp_ctrl = pcfg->blk_group_count;
>> +            p_rt->transport_params.hstart = pcfg->hstart;
>> +            p_rt->transport_params.hstop = pcfg->hstop;
>> +            p_rt->transport_params.lane_ctrl = pcfg->lane_control;
>> +            if (pcfg->word_length != SWR_INVALID_PARAM) {
>> +                sdw_fill_port_params(&p_rt->port_params,
>> +                         p_rt->num,  pcfg->word_length + 1,
>> +                         SDW_PORT_FLOW_MODE_ISOCH,
>> +                         SDW_PORT_DATA_MODE_NORMAL);
>> +            }
>> +
>>           }
>>           list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
>> @@ -481,6 +534,18 @@ static int qcom_swrm_compute_params(struct 
>> sdw_bus *bus)
>>                   p_rt->transport_params.offset1 = pcfg->off1;
>>                   p_rt->transport_params.offset2 = pcfg->off2;
>>                   p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
>> +                p_rt->transport_params.blk_grp_ctrl = 
>> pcfg->blk_group_count;
>> +
>> +                p_rt->transport_params.hstart = pcfg->hstart;
>> +                p_rt->transport_params.hstop = pcfg->hstop;
>> +                p_rt->transport_params.lane_ctrl = pcfg->lane_control;
>> +                if (pcfg->word_length != SWR_INVALID_PARAM) {
>> +                    sdw_fill_port_params(&p_rt->port_params,
>> +                             p_rt->num,
>> +                             pcfg->word_length + 1,
>> +                             SDW_PORT_FLOW_MODE_ISOCH,
>> +                             SDW_PORT_DATA_MODE_NORMAL);
>> +                }
>>                   i++;
>>               }
>>           }
>> @@ -728,6 +793,11 @@ static int qcom_swrm_get_port_config(struct 
>> qcom_swrm_ctrl *ctrl)
>>       u8 off2[QCOM_SDW_MAX_PORTS];
>>       u8 si[QCOM_SDW_MAX_PORTS];
>>       u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
>> +    u8 hstart[QCOM_SDW_MAX_PORTS];
>> +    u8 hstop[QCOM_SDW_MAX_PORTS];
>> +    u8 word_length[QCOM_SDW_MAX_PORTS];
>> +    u8 blk_group_count[QCOM_SDW_MAX_PORTS];
>> +    u8 lane_control[QCOM_SDW_MAX_PORTS];
>>       int i, ret, nports, val;
>>       ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
>> @@ -772,11 +842,32 @@ static int qcom_swrm_get_port_config(struct 
>> qcom_swrm_ctrl *ctrl)
>>       ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
>>                       bp_mode, nports);
>> +
>> +    memset(hstart, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
>> +    of_property_read_u8_array(np, "qcom,ports-hstart", hstart, nports);
>> +
>> +    memset(hstop, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
>> +    of_property_read_u8_array(np, "qcom,ports-hstop", hstop, nports);
>> +
>> +    memset(word_length, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
>> +    of_property_read_u8_array(np, "qcom,ports-word-length", 
>> word_length, nports);
>> +
>> +    memset(blk_group_count, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
>> +    of_property_read_u8_array(np, "qcom,ports-block-group-count", 
>> blk_group_count, nports);
>> +
>> +    memset(lane_control, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
>> +    of_property_read_u8_array(np, "qcom,ports-lane-control", 
>> lane_control, nports);
>> +
>>       for (i = 0; i < nports; i++) {
>>           ctrl->pconfig[i].si = si[i];
>>           ctrl->pconfig[i].off1 = off1[i];
>>           ctrl->pconfig[i].off2 = off2[i];
>>           ctrl->pconfig[i].bp_mode = bp_mode[i];
>> +        ctrl->pconfig[i].hstart = hstart[i];
>> +        ctrl->pconfig[i].hstop = hstop[i];
>> +        ctrl->pconfig[i].word_length = word_length[i];
>> +        ctrl->pconfig[i].blk_group_count = blk_group_count[i];
>> +        ctrl->pconfig[i].lane_control = lane_control[i];
>>       }
> 
> I don't get why you test the values parsed from DT before writing the 
> registers. Why do test them here? if some values are incorrect it's much 
> better to provide an error log instead of writing a partially valid 
> setup to hardware, no?

from DT we pass parameters for all the master ports, however some of 
these parameters are not really applicable for some of the ports! so the 
way we handle this is by marking them as 0xFF which means these values 
are not applicable for those ports! Having said that I think I should 
probably redefine SWR_INVALID_PARAM to QCOM_SWR_PARAM_NA or something on 
those lines!


--srini
>>       return 0;
>>
