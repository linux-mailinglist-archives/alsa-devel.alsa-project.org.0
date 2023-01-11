Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DB6660B5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:37:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B4A7648;
	Wed, 11 Jan 2023 17:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B4A7648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455065;
	bh=76lSxpjS7AmOwz8nezqUoaA4XsIIg5n3XpwLhwUttg0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FqozcUGBMN377IG+UEj1oKJ/gG0dcGkNtNaTYvkFTGudhzU+Zcj+eyV1HzIJdHABx
	 c0xiphxpIoLrLxTVqV0UAkW67LaQmt0p+XKJo59tbRQmPwVbfdiaIz1sd1vU7vlc0X
	 YA6p6/6yhsCp9y5FY926J9XCXxCFKGGVyM/Tn6gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E4DF80548;
	Wed, 11 Jan 2023 17:36:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D325F8053A; Wed, 11 Jan 2023 17:36:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 767DDF8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767DDF8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ivLGY70P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454960; x=1704990960;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=76lSxpjS7AmOwz8nezqUoaA4XsIIg5n3XpwLhwUttg0=;
 b=ivLGY70PwzNo+Co+NonYKjAun2PWjZaKdmHZq4OD8JJYEThCZg1lD11/
 i52YubyyN26KrNLgHXltSDUgNXF/Vaf5BksLRAZ8NcIYQ5mAzRLTHDmJ6
 kov6yC44ewvlsQFMkNgaWwGKbmrbK//sNyMxrEzj4dMzJAUeXxrCy14wQ
 fxhS18jdgLStTh/yIk/pVQ/Tgio4V9nVwfI8bC2zD/CWdgUggYm3R1njP
 vZjEnkAiuoK838vhf1GLzoq9tx4i+UclaVfS3EeNEAUc8IIlresRY3Pfj
 ctWDVb/acqzmjLpkhgaaNFNiLYE1XNlBDfiZJaPsNjFwJyTV/ibmD2lAA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324704055"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324704055"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408415"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408415"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:16 -0800
Message-ID: <ff99cf26-56df-a3ae-ca0d-691d0cb034fc@linux.intel.com>
Date: Wed, 11 Jan 2023 09:19:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 05/19] soundwire: amd: add soundwire interrupt handling
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-6-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-6-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




>  
> +static void amd_sdwc_process_ping_status(u64 response, struct amd_sdwc_ctrl *ctrl)
> +{
> +	u64 slave_stat = 0;
> +	u32 val = 0;
> +	u16 dev_index;
> +
> +	/* slave status from ping response*/

response */

> +	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
> +	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
> +
> +	dev_dbg(ctrl->dev, "%s: slave_stat:0x%llx\n", __func__, slave_stat);
> +	for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
> +		val = (slave_stat >> (dev_index * 2)) & AMD_SDW_MCP_SLAVE_STATUS_MASK;
> +		dev_dbg(ctrl->dev, "%s val:0x%x\n", __func__, val);
> +		switch (val) {
> +		case SDW_SLAVE_ATTACHED:
> +			ctrl->status[dev_index] = SDW_SLAVE_ATTACHED;
> +			break;
> +		case SDW_SLAVE_UNATTACHED:
> +			ctrl->status[dev_index] = SDW_SLAVE_UNATTACHED;
> +			break;
> +		case SDW_SLAVE_ALERT:
> +			ctrl->status[dev_index] = SDW_SLAVE_ALERT;
> +			break;
> +		default:
> +			ctrl->status[dev_index] = SDW_SLAVE_RESERVED;
> +			break;
> +		}
> +	}
> +}
> +
> +static void amd_sdwc_read_and_process_ping_status(struct amd_sdwc_ctrl *ctrl)
> +{
> +	u64 response = 0;
> +
> +	mutex_lock(&ctrl->bus.msg_lock);
> +	response = amd_sdwc_send_cmd_get_resp(ctrl, 0, 0);
> +	mutex_unlock(&ctrl->bus.msg_lock);
> +	amd_sdwc_process_ping_status(response, ctrl);

Is this saying that you actually need to send a PING frame manually
every time the manager needs to check the device status, including
interrupts?

> +}
> +
>  static u32 amd_sdwc_read_ping_status(struct sdw_bus *bus)
>  {
>  	struct amd_sdwc_ctrl *ctrl = to_amd_sdw(bus);
> @@ -1132,6 +1173,119 @@ static int amd_sdwc_register_dais(struct amd_sdwc_ctrl *ctrl)
>  					       dais, num_dais);
>  }
>  
> +static void amd_sdwc_update_slave_status_work(struct work_struct *work)
> +{
> +	struct amd_sdwc_ctrl *ctrl =
> +		container_of(work, struct amd_sdwc_ctrl, amd_sdw_work);
> +	u32 sw_status_change_mask_0to7_reg;
> +	u32 sw_status_change_mask_8to11_reg;
> +
> +	switch (ctrl->instance) {
> +	case ACP_SDW0:
> +		sw_status_change_mask_0to7_reg = SW_STATE_CHANGE_STATUS_MASK_0TO7;
> +		sw_status_change_mask_8to11_reg = SW_STATE_CHANGE_STATUS_MASK_8TO11;
> +		break;
> +	case ACP_SDW1:
> +		sw_status_change_mask_0to7_reg = P1_SW_STATE_CHANGE_STATUS_MASK_0TO7;
> +		sw_status_change_mask_8to11_reg = P1_SW_STATE_CHANGE_STATUS_MASK_8TO11;
> +		break;
> +	default:
> +		dev_err(ctrl->dev, "Invalid Soundwire controller instance\n");
> +		return;
> +	}
> +
> +	if (ctrl->status[0] == SDW_SLAVE_ATTACHED) {
> +		acp_reg_writel(0, ctrl->mmio + sw_status_change_mask_0to7_reg);
> +		acp_reg_writel(0, ctrl->mmio + sw_status_change_mask_8to11_reg);
> +	}
> +
> +update_status:
> +	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
> +	if (ctrl->status[0] == SDW_SLAVE_ATTACHED) {
> +		acp_reg_writel(AMD_SDW_IRQ_MASK_0TO7, ctrl->mmio + sw_status_change_mask_0to7_reg);
> +		acp_reg_writel(AMD_SDW_IRQ_MASK_8TO11,
> +			       ctrl->mmio + sw_status_change_mask_8to11_reg);
> +		amd_sdwc_read_and_process_ping_status(ctrl);
> +		goto update_status;
> +	}

well no, you have to use some sort of retry count. You cannot handle
interrupts in a loop like this, a faulty or chatty device would keep
signaling an issue and you would be stuck here for a while.

In addition, it's not clear if this is really needed. We added this loop
in cadence_master.c because of issues with multiple devices becoming
attached at the same time and how the hardware works. As it turns out,
this update_status loop seems to be a paranoid case, the actually cause
for devices de-attaching was found by Cirrus Logic and fixed in
"soundwire: cadence: fix updating slave status when a bus has multiple
peripherals"

You would need to explain how the status is detected and if any race
conditions can occur.

