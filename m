Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1B5150E9
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 18:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2054825;
	Fri, 29 Apr 2022 18:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2054825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651249859;
	bh=9JJLmBDdDaVDkWtdj2AlikPdhwkYMqvNxao/Uvuy9zc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYBS/E75TYXh+wfB0APyak4Vt8688VUrl8yc38jdhBGYNrZjoGWyw0oOU27hTVvHc
	 hiP9acrxRulf7JWJUwXzFka335BCZnlWpqkqsZgzdbELx2mGusTt3FpuNGcHR1o1+w
	 S0HDAx+ZG8YB32GcZMhzzXLfDZH3WW9zzLHeud6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BA96F80269;
	Fri, 29 Apr 2022 18:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4E2BF8025D; Fri, 29 Apr 2022 18:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C8CFF8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 18:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C8CFF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kcH9mmGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651249789; x=1682785789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9JJLmBDdDaVDkWtdj2AlikPdhwkYMqvNxao/Uvuy9zc=;
 b=kcH9mmGfz3lIwgZaL577UigheXCN0OzFhm0JHh8HyuSCi742Nmg5Al+I
 P3lurtK0tSSymk1etJfI92lFYOBs1qcERAgHNd86ZrzsElQ9odSimtVRz
 We1Qy46W1HMfREmTi9cgDV9Y6PG6Q81efDhvxS3hYvRRFbX365GriUdW6
 Lz24FQOaQnak4CY/LHO2mexBS+JMipj361U2MkQzAD61eLbazFfJCGVMT
 ueEy+b6v3NzV05vHe2mnnapNZV0UChw1GtckUhPJjKWrmahMT4tFA2BJb
 aBMnD55v2i0ohYP11HaKLmEAWIFlcE8qDiW3veSV1a+AwR4DUKe+Sy4QO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="264279646"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="264279646"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 09:29:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="685089587"
Received: from aleeshax-mobl.amr.corp.intel.com (HELO [10.212.139.246])
 ([10.212.139.246])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 09:29:42 -0700
Message-ID: <e9f4001d-a9f4-fae7-521a-76f8880ba82b@linux.intel.com>
Date: Fri, 29 Apr 2022 11:19:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220429160928.24614-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220429160928.24614-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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



On 4/29/22 11:09, Srinivas Kandagatla wrote:
> Currently timeout for autoenumeration during probe and bus reset is set to
> 2 secs which is really a big value. This can have an adverse effect on
> boot time if the slave device is not ready/reset.
> This was the case with wcd938x which was not reset yet but we spent 2
> secs waiting in the soundwire controller probe. Reduce this time to
> 1/10 of Hz which should be good enough time to finish autoenumeration
> if any slaves are available on the bus.

Can I ask why this is dependent on a software configuration you have no control on?

Why not simply:

#define TIMEOUT_MS		100

?

> 
> Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index da1ad7ebb1aa..432e5cb9a4d2 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -105,7 +105,7 @@
>  
>  #define SWRM_SPECIAL_CMD_ID	0xF
>  #define MAX_FREQ_NUM		1
> -#define TIMEOUT_MS		(2 * HZ)
> +#define TIMEOUT_MS		(HZ/10)
>  #define QCOM_SWRM_MAX_RD_LEN	0x1
>  #define QCOM_SDW_MAX_PORTS	14
>  #define DEFAULT_CLK_FREQ	9600000
