Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AD2CF177
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 17:05:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 920F91834;
	Fri,  4 Dec 2020 17:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 920F91834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607097906;
	bh=zrhWOnWyWAxM2P7doKySEAD3xW8YyUx3K8F4yJKqyw4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OlLqolCwj1bCKhDIDebKD/5CoOTQ6f6L+LUsg4mSmKNDLc70BWOwUKumaL956+Oz0
	 Wz6S4d4Kth6wIeKSdP583WZLyN5KtbO+sv2H9GfjhFUn4AOAAzmEM/xf+Smk1CqMfX
	 nGXY9qTGf/XZtFWeK5NCRhgh93iN+ixO4+K0P1hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD3E8F8049C;
	Fri,  4 Dec 2020 17:03:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB95FF80278; Fri,  4 Dec 2020 17:03:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFC57F800E8
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 17:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFC57F800E8
IronPort-SDR: fDdw3FGyB1LugPkRsMLp0pWzIdOZnRZ5mucZ3LUwKe580s53b8C83HPf+Lwa6YNrhYkP4uFIeV
 NADD7RsWe/Ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="237512474"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="237512474"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 08:03:16 -0800
IronPort-SDR: /SIAt6AXx4ob0LCsOSeQ1gW9ktDI70TDWFTpVGfBprl3q2Ms/Sgazfz/0P13Bthv1hLmI2lt+Q
 w2KfKBhgMwrA==
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="373960693"
Received: from emogena-mobl1.amr.corp.intel.com (HELO [10.212.90.42])
 ([10.212.90.42])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 08:03:15 -0800
Subject: Re: [PATCH] soundwire: intel: fix another unused-function warning
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20201203230502.1480063-1-arnd@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <070e64b8-88e4-ccf1-b51e-99de513ab55c@linux.intel.com>
Date: Thu, 3 Dec 2020 17:48:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203230502.1480063-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Rander Wang <rander.wang@intel.com>
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



On 12/3/20 5:04 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without CONFIG_PM, there is another warning about an unused function:
> 
> drivers/soundwire/intel.c:530:12: error: 'intel_link_power_down' defined but not used [-Werror=unused-function]
> 
> After a previous fix, the driver already uses both an #ifdef and
> a __maybe_unused annotation but still gets it wrong. Remove the
> ifdef and instead use __maybe_unused consistently to avoid the
> problem for good.
> 
> Fixes: f046b2334083 ("soundwire: intel: fix intel_suspend/resume defined but not used warning")
> Fixes: ebf878eddbb4 ("soundwire: intel: add pm_runtime support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch Arnd, indeed that's a miss.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   drivers/soundwire/intel.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 6a1e862b16c3..66adb258a425 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1585,8 +1585,6 @@ int intel_master_process_wakeen_event(struct platform_device *pdev)
>    * PM calls
>    */
>   
> -#ifdef CONFIG_PM
> -
>   static int __maybe_unused intel_suspend(struct device *dev)
>   {
>   	struct sdw_cdns *cdns = dev_get_drvdata(dev);
> @@ -1641,7 +1639,7 @@ static int __maybe_unused intel_suspend(struct device *dev)
>   	return 0;
>   }
>   
> -static int intel_suspend_runtime(struct device *dev)
> +static int __maybe_unused intel_suspend_runtime(struct device *dev)
>   {
>   	struct sdw_cdns *cdns = dev_get_drvdata(dev);
>   	struct sdw_intel *sdw = cdns_to_intel(cdns);
> @@ -1796,7 +1794,7 @@ static int __maybe_unused intel_resume(struct device *dev)
>   	return ret;
>   }
>   
> -static int intel_resume_runtime(struct device *dev)
> +static int __maybe_unused intel_resume_runtime(struct device *dev)
>   {
>   	struct sdw_cdns *cdns = dev_get_drvdata(dev);
>   	struct sdw_intel *sdw = cdns_to_intel(cdns);
> @@ -1969,8 +1967,6 @@ static int intel_resume_runtime(struct device *dev)
>   	return ret;
>   }
>   
> -#endif
> -
>   static const struct dev_pm_ops intel_pm = {
>   	SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
>   	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
> 
