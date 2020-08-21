Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6924CD15
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 07:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660311682;
	Fri, 21 Aug 2020 07:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660311682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597986236;
	bh=keywDDnmc2BgdhkVQo4jd6Uf3rJXgxmDUgazsUR4kHU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqMsubPBaIQi5icSYjhszhgeltoFAU8WzrsYky4YGTae/ZYfRVnwo7mGEkjrs1/Zm
	 oxKEk7o7zsjs3nE3jkSg/1UGyZNGEpJT+7jxFcUjmm7SxM9TRbYuia+5OvkKGiJmPw
	 ZMXqCgs3MroqR8dXWbMti/dT6brnKgU7gRy9LS70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF75F800D2;
	Fri, 21 Aug 2020 07:02:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B230F80218; Fri, 21 Aug 2020 07:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7ECDF800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 07:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7ECDF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jaqjnY1j"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28C57208E4;
 Fri, 21 Aug 2020 05:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597986124;
 bh=keywDDnmc2BgdhkVQo4jd6Uf3rJXgxmDUgazsUR4kHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jaqjnY1jUD/EE/weN+QRcHhIfwnA6shexdxHlqictJXVnjtmLACrg6OktI6asGzAi
 l2/SrNW89m35FhlEPidgDvvw9CG782isX6FVDeQycw8yu6M+TiLDrWYisPewKjoXSV
 GOV1DP9pXMqZ2lscIl36v3GJ3/Ae7DBM4NbtJvfQ=
Date: Fri, 21 Aug 2020 10:31:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: fix CONFIG_PM and CONFIG_PM_SLEEP
 confusion
Message-ID: <20200821050159.GH2639@vkoul-mobl>
References: <20200820140441.9478-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820140441.9478-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 20-08-20, 22:04, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> When CONFIG_PM_SLEEP is not defined, GCC throws compilation warnings:
> 
> drivers/soundwire/intel.c:1816:12: warning: ‘intel_resume’ defined but
> not used [-Wunused-function]
>  1816 | static int intel_resume(struct device *dev)
>       |            ^~~~~~~~~~~~
> 
> drivers/soundwire/intel.c:1697:12: warning: ‘intel_suspend’ defined
> but not used [-Wunused-function]
>  1697 | static int intel_suspend(struct device *dev)
> 
> Fix by adding the missing CONFIG_PM_SLEEP.

Can you rather use __maybe for for these rather than wrapping in another
ifdef, that is the recommended way to do this

Thanks

> Note that we could move code around and use only 2 ifdefs, but this
> will generate conflicts so let's do this when all the pm handling is
> merged.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index dbcbe2708563..a2f0026cb2c1 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1525,7 +1525,7 @@ int intel_master_process_wakeen_event(struct platform_device *pdev)
>   * PM calls
>   */
>  
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_PM_SLEEP
>  
>  static int intel_suspend(struct device *dev)
>  {
> @@ -1562,6 +1562,9 @@ static int intel_suspend(struct device *dev)
>  
>  	return 0;
>  }
> +#endif
> +
> +#ifdef CONFIG_PM
>  
>  static int intel_suspend_runtime(struct device *dev)
>  {
> @@ -1624,6 +1627,9 @@ static int intel_suspend_runtime(struct device *dev)
>  
>  	return ret;
>  }
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
>  
>  static int intel_resume(struct device *dev)
>  {
> @@ -1691,6 +1697,9 @@ static int intel_resume(struct device *dev)
>  
>  	return ret;
>  }
> +#endif
> +
> +#ifdef CONFIG_PM
>  
>  static int intel_resume_runtime(struct device *dev)
>  {
> @@ -1797,7 +1806,6 @@ static int intel_resume_runtime(struct device *dev)
>  
>  	return ret;
>  }
> -
>  #endif
>  
>  static const struct dev_pm_ops intel_pm = {
> -- 
> 2.17.1

-- 
~Vinod
