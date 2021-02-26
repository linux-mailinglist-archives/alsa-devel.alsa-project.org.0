Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C811C3265D6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 17:48:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530B9167D;
	Fri, 26 Feb 2021 17:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530B9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614358137;
	bh=wXlKYic5ByqLsribBs/Rb/VHEgS/vdoe19yW5JaGjBQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XpY/KNtlhkWtzNtZS2jGeMBlarFNw8W0j61G1Undczs+SIwOC2ydDlBUZkO2D+87T
	 FFa07QS9ESUZAjiO0dH7A7ueoHZ79lDPA6zfXhESSUx+GbITokUzLYMESM7BNPFH8t
	 3BAmaFr6VUd189GGU2V7mL+ne5WKICYxPm72tj1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E3DCF8022B;
	Fri, 26 Feb 2021 17:47:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A38F8016C; Fri, 26 Feb 2021 17:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5228F80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 17:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5228F80159
IronPort-SDR: pjyxLoolql6HOuEpbuN7zgjHBxdWBEMKdBhuIWLJOqHdwaO7W23F+Q+zijv0zmhu62+uMDeIyP
 YQc5qqvcNp7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="183469207"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="183469207"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 08:47:05 -0800
IronPort-SDR: n6jJbB9MjjJrSSnt6rQaFpgc/1MgM9npPnr/g5jLkmTutNCSOZsSqUYr5VT7zM0l8ue2uGZWPF
 4u13XDNie6Kg==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="367846793"
Received: from ate-mobl.amr.corp.intel.com (HELO [10.209.93.21])
 ([10.209.93.21])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 08:47:04 -0800
Subject: Re: [PATCH v2 1/5] soundwire: qcom: add support to missing transport
 params
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210226155814.27536-1-srinivas.kandagatla@linaro.org>
 <20210226155814.27536-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <00842f73-c0fb-5728-3ed0-c0a1fd75f94e@linux.intel.com>
Date: Fri, 26 Feb 2021 10:45:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226155814.27536-2-srinivas.kandagatla@linaro.org>
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



On 2/26/21 9:58 AM, Srinivas Kandagatla wrote:
> Some of the transport parameters derived from device tree
> are not fully parsed by the driver.
> 
> This patch adds support to parse those missing parameters.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/soundwire/qcom.c | 99 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 95 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6d22df01f354..fee7465c72c2 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -54,7 +54,13 @@
>   #define SWRM_MCP_SLV_STATUS					0x1090
>   #define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
>   #define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
> +#define SWRM_DP_PORT_CTRL_2_BANK(n, m)	(0x1128 + 0x100 * (n - 1) + 0x40 * m)
> +#define SWRM_DP_BLOCK_CTRL_1(n)		(0x112C + 0x100 * (n - 1))
> +#define SWRM_DP_BLOCK_CTRL2_BANK(n, m)	(0x1130 + 0x100 * (n - 1) + 0x40 * m)
> +#define SWRM_DP_PORT_HCTRL_BANK(n, m)	(0x1134 + 0x100 * (n - 1) + 0x40 * m)
>   #define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
> +#define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
> +
>   #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>   #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
>   #define SWRM_DP_PORT_CTRL_OFFSET1_SHFT				0x08
> @@ -73,12 +79,20 @@
>   #define QCOM_SDW_MAX_PORTS	14
>   #define DEFAULT_CLK_FREQ	9600000
>   #define SWRM_MAX_DAIS		0xF
> +#define SWR_INVALID_PARAM 0xFF
> +#define SWR_HSTOP_MAX_VAL 0xF
> +#define SWR_HSTART_MIN_VAL 0x0
>   
>   struct qcom_swrm_port_config {
>   	u8 si;
>   	u8 off1;
>   	u8 off2;
>   	u8 bp_mode;
> +	u8 hstart;
> +	u8 hstop;
> +	u8 word_length;
> +	u8 blk_group_count;
> +	u8 lane_control;
>   };
>   
>   struct qcom_swrm_ctrl {
> @@ -396,7 +410,13 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
>   				 struct sdw_port_params *p_params,
>   				 unsigned int bank)
>   {
> -	/* TBD */
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +
> +	if (p_params->bps != SWR_INVALID_PARAM)

this is odd. sdw_port_params is a structure in 
include/linux/soundwire/sdw.h, but here you are comparing the value with 
a private qualcomm-defined value.

The Word length of the port is limited by the standard (64), so your 
choice of 0xFF for SWR_INVALID_PARAM is legit, but it should be a 
'public' define.

> +		return ctrl->reg_write(ctrl,
> +				       SWRM_DP_BLOCK_CTRL_1(p_params->num),
> +				       p_params->bps - 1);
> +
>   	return 0;
>   }
>   
> @@ -415,10 +435,32 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
>   
>   	ret = ctrl->reg_write(ctrl, reg, value);
>   
> -	if (!ret && params->blk_pkg_mode) {
> -		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
> +	if (params->lane_ctrl != SWR_INVALID_PARAM) {
> +		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
> +		value = params->lane_ctrl;
> +		ret = ctrl->reg_write(ctrl, reg, value);
> +	}
>   
> -		ret = ctrl->reg_write(ctrl, reg, 1);
> +	if (params->blk_grp_ctrl != SWR_INVALID_PARAM) {
> +		reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
> +		value = params->blk_grp_ctrl;
> +		ret = ctrl->reg_write(ctrl, reg, value);
> +	}
> +
> +	if (params->hstart != SWR_INVALID_PARAM
> +			&& params->hstop != SWR_INVALID_PARAM) {
> +		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
> +		value = (params->hstop << 4) | params->hstart;
> +		ret = ctrl->reg_write(ctrl, reg, value);
> +	} else {
> +		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
> +		value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
> +		ret = ctrl->reg_write(ctrl, reg, value);
> +	}
> +
> +	if (params->blk_pkg_mode != SWR_INVALID_PARAM) {
> +		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
> +		ret = ctrl->reg_write(ctrl, reg, params->blk_pkg_mode);
>   	}

same comments here, you should define a public define for all those 
parameters.

>   	return ret;
> @@ -470,6 +512,17 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
>   			p_rt->transport_params.offset1 = pcfg->off1;
>   			p_rt->transport_params.offset2 = pcfg->off2;
>   			p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
> +			p_rt->transport_params.blk_grp_ctrl = pcfg->blk_group_count;
> +			p_rt->transport_params.hstart = pcfg->hstart;
> +			p_rt->transport_params.hstop = pcfg->hstop;
> +			p_rt->transport_params.lane_ctrl = pcfg->lane_control;
> +			if (pcfg->word_length != SWR_INVALID_PARAM) {
> +				sdw_fill_port_params(&p_rt->port_params,
> +					     p_rt->num,  pcfg->word_length + 1,
> +					     SDW_PORT_FLOW_MODE_ISOCH,
> +					     SDW_PORT_DATA_MODE_NORMAL);
> +			}
> +
>   		}
>   
>   		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
> @@ -481,6 +534,18 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
>   				p_rt->transport_params.offset1 = pcfg->off1;
>   				p_rt->transport_params.offset2 = pcfg->off2;
>   				p_rt->transport_params.blk_pkg_mode = pcfg->bp_mode;
> +				p_rt->transport_params.blk_grp_ctrl = pcfg->blk_group_count;
> +
> +				p_rt->transport_params.hstart = pcfg->hstart;
> +				p_rt->transport_params.hstop = pcfg->hstop;
> +				p_rt->transport_params.lane_ctrl = pcfg->lane_control;
> +				if (pcfg->word_length != SWR_INVALID_PARAM) {
> +					sdw_fill_port_params(&p_rt->port_params,
> +						     p_rt->num,
> +						     pcfg->word_length + 1,
> +						     SDW_PORT_FLOW_MODE_ISOCH,
> +						     SDW_PORT_DATA_MODE_NORMAL);
> +				}
>   				i++;
>   			}
>   		}
> @@ -728,6 +793,11 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   	u8 off2[QCOM_SDW_MAX_PORTS];
>   	u8 si[QCOM_SDW_MAX_PORTS];
>   	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
> +	u8 hstart[QCOM_SDW_MAX_PORTS];
> +	u8 hstop[QCOM_SDW_MAX_PORTS];
> +	u8 word_length[QCOM_SDW_MAX_PORTS];
> +	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
> +	u8 lane_control[QCOM_SDW_MAX_PORTS];
>   	int i, ret, nports, val;
>   
>   	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
> @@ -772,11 +842,32 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   
>   	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
>   					bp_mode, nports);
> +
> +	memset(hstart, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> +	of_property_read_u8_array(np, "qcom,ports-hstart", hstart, nports);
> +
> +	memset(hstop, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> +	of_property_read_u8_array(np, "qcom,ports-hstop", hstop, nports);
> +
> +	memset(word_length, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> +	of_property_read_u8_array(np, "qcom,ports-word-length", word_length, nports);
> +
> +	memset(blk_group_count, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> +	of_property_read_u8_array(np, "qcom,ports-block-group-count", blk_group_count, nports);
> +
> +	memset(lane_control, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> +	of_property_read_u8_array(np, "qcom,ports-lane-control", lane_control, nports);
> +
>   	for (i = 0; i < nports; i++) {
>   		ctrl->pconfig[i].si = si[i];
>   		ctrl->pconfig[i].off1 = off1[i];
>   		ctrl->pconfig[i].off2 = off2[i];
>   		ctrl->pconfig[i].bp_mode = bp_mode[i];
> +		ctrl->pconfig[i].hstart = hstart[i];
> +		ctrl->pconfig[i].hstop = hstop[i];
> +		ctrl->pconfig[i].word_length = word_length[i];
> +		ctrl->pconfig[i].blk_group_count = blk_group_count[i];
> +		ctrl->pconfig[i].lane_control = lane_control[i];
>   	}

I don't get why you test the values parsed from DT before writing the 
registers. Why do test them here? if some values are incorrect it's much 
better to provide an error log instead of writing a partially valid 
setup to hardware, no?
>   
>   	return 0;
> 
