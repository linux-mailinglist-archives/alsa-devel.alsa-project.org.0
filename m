Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1F5BAF4E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 16:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052BE1AAE;
	Fri, 16 Sep 2022 16:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052BE1AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663338408;
	bh=xjBzwUqb8jHwtsdnaFdl5y3s0GzS9ZhCO/JEXoWOV0w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSlZyhD0XYpV3RRVE63ihyyKs6AdJEWgk+56cg2/H+2uwPAX3TvmjNnuzsWvs1iiJ
	 MofeJF8hy55KyepVkJhYf6FdOpyHHlRBj1qheKOYEnUnQFHWp8BbY9Ag9YjlBxtIUx
	 FCQsNYU6IDTgc/+aLYycRrSn6gYmfDXgU5hTBRyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB0CF80566;
	Fri, 16 Sep 2022 16:24:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88163F802BE; Fri, 16 Sep 2022 16:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E05EAF80564
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 16:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E05EAF80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jH+J3O3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663338291; x=1694874291;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xjBzwUqb8jHwtsdnaFdl5y3s0GzS9ZhCO/JEXoWOV0w=;
 b=jH+J3O3aK/hFOSIUnYwruPvHvhY42aOmIhYr2qb6XtRX3MODjY85ykcW
 aINxSjfwNE9lvUT8k2bbkopUjG60J0nJR6q4GflSzxyzpKgJmH8pPK7/w
 AKXFhBL/KN1eQY6l+qZ16mVlAQ95B8dQMN6qS04CFGdM3i0NJ5ef8yxfR
 L3sDv5SQsvHfbibUcsIv87eaeXI5f7UmcL/FKGFTuwc58fonyrqFH4WP2
 ZIogNPWJX3TX/qElphVsjfwNw8IzzOr2b1q8BcIr34d6O9EP7n2+7y4km
 vftP0U4KpnM8sjsI1XziDGh2RZQxLRLH2b08my14XDV//II6/fSKRZS+R A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="362963863"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="362963863"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:24:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="650889151"
Received: from kchan21-mobl1.ger.corp.intel.com (HELO [10.252.61.56])
 ([10.252.61.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:24:33 -0700
Message-ID: <78c9421e-d66a-3477-9dff-f819e1ac9414@linux.intel.com>
Date: Fri, 16 Sep 2022 16:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] soundwire: qcom: do not send status of device 0
 during alert
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
 <20220916135352.19114-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220916135352.19114-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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



On 9/16/22 15:53, Srinivas Kandagatla wrote:
> Device0 can not be in alter status. And for consistency reasons do not

typo: alert

> send status of device0 to core.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index d3ce580cdeaf..a04a8863b228 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -428,7 +428,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
>  
>  	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>  
> -	for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
> +	for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>  		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
>  
>  		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
