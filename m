Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4970262964
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 09:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B658169D;
	Wed,  9 Sep 2020 09:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B658169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599638324;
	bh=Bf70SM+kDaHrKWyPoY+mR++Vc7f3euS8X37jgXJRFFU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BYTU0agHpDCuHcPhTsm8uxCmodXTqQgWwX3BZje2RnRMhcnJrve25vpU8f4Q9E7AC
	 KL7ROhiCkerT7nGO3PDSKzlE7uzaosfNVTtBTArW5sI1zuKZ2So8ee1QmHroMT7Zc+
	 2A9EVCo3PUM1MOEWLH8y1T0kaht86sRW9OoFN6L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FAFF80274;
	Wed,  9 Sep 2020 09:57:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBCDCF80256; Wed,  9 Sep 2020 09:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89C5CF8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 09:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89C5CF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1VpgHjuQ"
Received: from localhost (unknown [122.179.21.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4F8F21D7B;
 Wed,  9 Sep 2020 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599638235;
 bh=Bf70SM+kDaHrKWyPoY+mR++Vc7f3euS8X37jgXJRFFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1VpgHjuQqy0qC77in66ZvJ/1xh+WhYpKzk2D7MZQ1IPUaQojAhsNUjD9TwMMqydk4
 OWfbEr7YduDhzqvlcRF6gCdHhjVj5MqZWQ6vFGCaZ1LGXRIb53fVwfTwYXmb0oII+v
 +ZySsnhvuRyTnGm8Z26fsZ6HIymEeJT9Ne0XD0BE=
Date: Wed, 9 Sep 2020 13:27:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] soundwire: qcom: fix SLIBMUS/SLIMBUS typo
Message-ID: <20200909075707.GL77521@vkoul-mobl>
References: <20200908140818.28373-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908140818.28373-1-jonathan@marek.ca>
Cc: "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 linux-arm-msm@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 08-09-20, 10:08, Jonathan Marek wrote:
> Fix slimbus case being broken thanks to a typo.
> 

Applied, thanks

> Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")
> 

No need of blank line here

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
> This should be squashed into the problematic patch if possible,
> but I'm not sure if that's possible since its already in linux-next?
> 
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 100af93a5eab..c406a079d237 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -780,7 +780,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	if (!ctrl)
>  		return -ENOMEM;
>  
> -#if IS_ENABLED(CONFIG_SLIBMUS)
> +#if IS_ENABLED(CONFIG_SLIMBUS)
>  	if (dev->parent->bus == &slimbus_bus) {
>  #else
>  	if (false) {
> -- 
> 2.26.1

-- 
~Vinod
