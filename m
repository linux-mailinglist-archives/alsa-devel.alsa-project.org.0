Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6174350456
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 18:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F36F167F;
	Wed, 31 Mar 2021 18:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F36F167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617207523;
	bh=Dgrfovadg7mrOEFHJSnnpASSK5YQpJxnZ/A6yrk8+Bo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PeDJEi6wRYebR+8F4VaBiW1L3cTnkPToXP1tcsGFtM81ZjMVBByRHIv8FTnQFbnmD
	 7Uc+Ss1BmLSimQaj9mFQCE6A/Vo5BPLFohNsiTo33AKz6+uF+uhjqs7zPDL6NjXgZm
	 it1WRW1EKLgj2AvhRpcePZ4Dsm69UNz0Torqt5p0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A90E1F8016E;
	Wed, 31 Mar 2021 18:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51BA8F80166; Wed, 31 Mar 2021 18:17:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BFB6F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 18:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BFB6F8013C
IronPort-SDR: /FxlRAh4UINwOUstIYcB13OBmNvUhm8r3sbVsin92cfpYHBYGC/wbpuSthHqvXEtW+plk9ZCZL
 9kPnzP+fj6cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="189811072"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="189811072"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 09:16:38 -0700
IronPort-SDR: DAvSyos5VyO37OsDz+/VSlVYccihCVT7a1aUvmf/rVTJ4ciLMoLHMmSqRGq4DR0yEueub8DzUC
 yx3dHLfwfdVg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="610569212"
Received: from erikberx-mobl4.amr.corp.intel.com (HELO [10.212.230.42])
 ([10.212.230.42])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 09:16:36 -0700
Subject: Re: [PATCH V2] soundwire: qcom: use signed variable for error return
To: Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20210331155520.2987823-1-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4aafedf4-46f7-be2a-6422-e5611f8390f8@linux.intel.com>
Date: Wed, 31 Mar 2021 11:16:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210331155520.2987823-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 3/31/21 10:55 AM, Vinod Koul wrote:
> We get warning of using a unsigned variable being compared to less than
> zero. The comparison is correct as it checks for errors from previous
> call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
> variable here.
> 
> While at it, drop the superfluous initialization as well
> 
> drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
> condition '(devnum < 0) => (0-255 < 0)'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   drivers/soundwire/qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index b08ecb9b418c..ec86c4e53fdb 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   	struct qcom_swrm_ctrl *swrm = dev_id;
>   	u32 value, intr_sts, intr_sts_masked, slave_status;
>   	u32 i;
> -	u8 devnum = 0;
> +	int devnum;
>   	int ret = IRQ_HANDLED;
>   
>   	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> 
