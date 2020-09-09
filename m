Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD0262F5E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 15:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2346816E2;
	Wed,  9 Sep 2020 15:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2346816E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599659541;
	bh=b1gyGuCvzpVgMKlYyDwVCJ60Ooszrpc2nEBYw2QvlZg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tkwAJs40h2KYEvHoE7kWV4WRDh26H+1+Bn2gGRdQUIazqRXdUhora1Z4ZpybipFfI
	 yKEwXbAVEx5KZhuHsmhwAKoQdnuHE6EmaTCQDiJrhRCFkAJVVLHYIuYm7IWuaxx4EW
	 7Z8wuUjHjoysWa2M0H43D4P9pV1aT8XTKwlF0Hfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE791F802C3;
	Wed,  9 Sep 2020 15:49:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2E9EF80227; Wed,  9 Sep 2020 15:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FD29F8021C
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 15:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FD29F8021C
IronPort-SDR: S9vCX8BEEsyfmgIvqpVy9k/NXs7RFOxwxntuPSBG9cbXShCMA5Qr1MUMKKcX0spKmlIfOFw8/+
 ZodtMAfaA9Sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="158362302"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="158362302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 06:49:26 -0700
IronPort-SDR: y782X0eff+IGeTeKdlXJWyejH8ArzkbdbpXRdce83ifEs2ysMjfkaoanYmSAds9BB+zVYm7HDX
 nG4T8f6lNeww==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="505456868"
Received: from rsetyawa-mobl1.amr.corp.intel.com (HELO [10.212.20.145])
 ([10.212.20.145])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 06:49:25 -0700
Subject: Re: [PATCH -next] soundwire: intel: Remove ununsed function
To: YueHaibing <yuehaibing@huawei.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20200909131531.31380-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <14a09132-d0ed-7129-73df-cbeb3154429b@linux.intel.com>
Date: Wed, 9 Sep 2020 08:46:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909131531.31380-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 9/9/20 8:15 AM, YueHaibing wrote:
> If CONFIG_PM is not set, build warns:
> 
> drivers/soundwire/intel.c:488:12: warning: 'intel_link_power_down' defined but not used [-Wunused-function]
> 
> Move this to #ifdef block.

Yes, thanks for the report, it's a valid issue, but maybe the fix is to 
add __maybe_unused more consistently and remove the CONFIG_PM dependency.

Vinod, what would you prefer?

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index e047910d73f5..7640308174ab 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1540,8 +1540,6 @@ int intel_master_process_wakeen_event(struct 
platform_device *pdev)
   * PM calls
   */

-#ifdef CONFIG_PM
-
  static int __maybe_unused intel_suspend(struct device *dev)
  {
         struct sdw_cdns *cdns = dev_get_drvdata(dev);
@@ -1596,7 +1594,7 @@ static int __maybe_unused intel_suspend(struct 
device *dev)
         return 0;
  }

-static int intel_suspend_runtime(struct device *dev)
+static int __maybe_unused intel_suspend_runtime(struct device *dev)
  {
         struct sdw_cdns *cdns = dev_get_drvdata(dev);
         struct sdw_intel *sdw = cdns_to_intel(cdns);
@@ -1751,7 +1749,7 @@ static int __maybe_unused intel_resume(struct 
device *dev)
         return ret;
  }

-static int intel_resume_runtime(struct device *dev)
+static int __maybe_unused intel_resume_runtime(struct device *dev)
  {
         struct sdw_cdns *cdns = dev_get_drvdata(dev);
         struct sdw_intel *sdw = cdns_to_intel(cdns);
@@ -1924,8 +1922,6 @@ static int intel_resume_runtime(struct device *dev)
         return ret;
  }

-#endif
-
  static const struct dev_pm_ops intel_pm = {
         SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
         SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, 
NULL)


