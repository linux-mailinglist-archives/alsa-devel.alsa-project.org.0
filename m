Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 652955B9BA2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 15:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F9D1957;
	Thu, 15 Sep 2022 15:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F9D1957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663247492;
	bh=HoCpplRGmLa8NMZ/Auv5ElmwuTYU4eLsbnw+GC1f8LU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9OF8KaGjUlDi9qgxNI3iBLs0XMwdQYXHsavTWeslKehzHKTkSjyVaOHDc7ZBTDVM
	 n7yv+TtA5YZRkmMiPAEhUu9fjxJHUR+VrDiAEgK81ObGwtJDIX6szij+jYga+FWbX2
	 o/oDPFWJdF9i1Z6fZxvDFAl4EE4RrGY/CZbF81T4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E6AF8008E;
	Thu, 15 Sep 2022 15:10:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4D07F80238; Thu, 15 Sep 2022 15:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48B48F800B5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 15:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B48F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YnkEJwtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663247427; x=1694783427;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HoCpplRGmLa8NMZ/Auv5ElmwuTYU4eLsbnw+GC1f8LU=;
 b=YnkEJwtCS86KAIdLBtBJkHPyR/6ze0G/g3eeSp6y6sZ2FGH2IqPGFUuC
 fADpF4ExttjFM+dUBXxiZm6n3G1LDmnMsz2e+ykSK3+cG+WFnJCGYDw2/
 krriiNi/wjLdtVTTIu1qVvoOKp5u5/8jUX8Z2Oe4bii9Vk6SI3vWLNew9
 rtMGUOGUGrOUHCVhssCBxwmdDxiH7Cnfj7pMhTUQ7YqON/hQrQVkFGCyo
 cw9HmWFAJmClniyBemsOLpblNq3WTL5IsUEBOWUuGNyx8vE5xVPI8sVen
 2JKlxIinLoMoJtRsfcILFeL4quZ4KyaNnAMNhc1vlOUtJsnEWEGKNO8mf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="362667803"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="362667803"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 06:10:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="617269024"
Received: from bhomann-mobl.ger.corp.intel.com (HELO [10.252.61.7])
 ([10.252.61.7])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 06:10:21 -0700
Message-ID: <3962348a-33b4-5941-4a0b-cb447a513a41@linux.intel.com>
Date: Thu, 15 Sep 2022 15:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: update status from device id 1
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
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



On 9/15/22 14:42, Srinivas Kandagatla wrote:
> By default autoenumeration is enabled on QCom SoundWire controller
> which means the core should not be dealing with device 0 w.r.t enumeration.
> Currently device 0 status is also shared with SoundWire core which confuses
> the core sometimes and we endup adding 0:0:0:0 slave device.

The change looks fine, but the description of the issue is surprising.

Whether autoenumeration is enabled or not is irrelevant, by spec the
device0 cannot be in ALERT status and throw in-band interrupts to the
host with this mechanism.

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index e21a3306bf01..871e4d8b32c7 100644
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
> @@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>  	ctrl->slave_status = val;
>  
> -	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
> +	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>  		u32 s;
>  
>  		s = (val >> (i * 2));
