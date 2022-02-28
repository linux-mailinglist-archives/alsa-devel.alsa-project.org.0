Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C5D4C76C7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 19:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5286A17F4;
	Mon, 28 Feb 2022 19:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5286A17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646071594;
	bh=PhTJdotKJ2wTOUcIThvtagW0Hjoxa9a1PK57pi8jxnU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4Fe3S6hoHu0YUgRuysQZhu/Xv6EpYuQ4/nLioW19K4c/tH6QEGhX5qBD4Vz/2Xtf
	 +WAa3p1k4pog1Kqrq2EMZo6L1KlF461H7Xyz6IFhimirIlcBFUv7wEtSEOBRyrw4xe
	 wF0vEIrpwsmDQSyB1L5GK1W6FLrVJ0VyE6XC9vQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F4AEF80519;
	Mon, 28 Feb 2022 19:04:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0C6EF80054; Mon, 28 Feb 2022 19:04:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D45DFF80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 19:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45DFF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="E19QXtpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646071482; x=1677607482;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PhTJdotKJ2wTOUcIThvtagW0Hjoxa9a1PK57pi8jxnU=;
 b=E19QXtpXY73+Jg8MYIeVQxaloqAXZ9UjpsQ1wq6M+EBHs7AyVBV5swWo
 AH7lPvcGAKHgGxwX3XTOBON9LEDjpahc6Y+CCWwpcuIx1b0jFpdaEIFP5
 FagqhDe7lTr5DKGrwxKT1iOf0bJ4yDfptWyZwTLR3M0dK9E7lsCQIg79V
 CQcAbnRE9XFtLZBowS/54V71IWLPqheI7+Jsig1nPPFiq8LvHcQVcUL80
 +b6hvBb4XT9ivPOFB/dJkbjMb6PLlnaQ1/YPj+9oF9HLA3A6ly6t/i+Ci
 /WK2CbOp01Q6uyPjQCfFAkcADEm3f7ShENvXdXe4BAuGA9mVpD4dIrpe4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232919518"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="232919518"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:04:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="510184837"
Received: from ensymall-mobl.amr.corp.intel.com (HELO [10.212.116.28])
 ([10.212.116.28])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:04:35 -0800
Message-ID: <28a7aa9b-8322-54df-1cfa-275805e2b044@linux.intel.com>
Date: Mon, 28 Feb 2022 12:01:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] soundwire: qcom: add in-band wake up interrupt
 support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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


> @@ -1424,6 +1464,11 @@ static int swrm_runtime_resume(struct device *dev)
>  	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (ctrl->wake_irq > 0) {
> +		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
> +			disable_irq_nosync(ctrl->wake_irq);
> +	}
> +
>  	clk_prepare_enable(ctrl->hclk);

This one is quite interesting. If you disable the IRQ mechanism but
haven't yet resumed the clock, that leaves a time window where the
peripheral could attempt to drive the line high. what happens in that case?

>  
>  	if (ctrl->clock_stop_not_supported) {
> @@ -1491,6 +1536,11 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>  
>  	usleep_range(300, 305);
>  
> +	if (ctrl->wake_irq > 0) {
> +		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
> +			enable_irq(ctrl->wake_irq);
> +	}
> +

and this one is similar, you could have a case where the peripheral
signals a wake immediately after the ClockStopNow frame, but you may not
yet have enabled the wake detection interrupt.

Would that imply that the wake is missed?



>  	return 0;
>  }
>  
