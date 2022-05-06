Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B97DA51DB70
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 17:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB4C1849;
	Fri,  6 May 2022 17:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB4C1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651849417;
	bh=JtteZAMTQXi+wE2QvFf74UIXeiYI3rgZRBcRNFpRR2c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YauXBz2ODKNLgLgEi3UWkPJf27RHD9O+eIgUSMawIQ9KIcbs8mejwwY921nSz0sMQ
	 tv/efr0DTubVmlB4Sa86a49OXCF/UuKsKUIg6rtRVGq5WQXF69Ie3E8Ftx++mp8yho
	 powstazptjVcpvc9CCjuh/VcKWrelkJEULDtpIxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B570FF80171;
	Fri,  6 May 2022 17:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C68C4F8014B; Fri,  6 May 2022 17:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADABEF800E3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 17:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADABEF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QoOFhAlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651849351; x=1683385351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JtteZAMTQXi+wE2QvFf74UIXeiYI3rgZRBcRNFpRR2c=;
 b=QoOFhAlUHtVHVWMp53DmUwSKF2ZcAlj5Hv6mVYIsIB8jA3/gUkRtsH3H
 aKh3qbKbay4i5keEy9SZ00Ijwn6acp1d4In6XsePItx6Y0/caTx/CMLZX
 jS7n910XpUW7vQTX4KpZEhZauKHHIOkuX5HZQZdpOO3G++lt8FvRWE4jR
 EuL319lQG9GFEFnOrEoNsAEKK42dp8e7541Ehb83fpOX6t4MTYGnfyldt
 yEFxkvtuJhVeazMWPRxSkLscxvkJ+jCsLKjoqhEquf36iAtoLOZHHTc3H
 e6M0reU0R0ysFSyLLARi67JGIZ+kepaqf3FVuoLvFuSwmtYmQN4sp4UzZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="255972889"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="255972889"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:02:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="654729242"
Received: from ysomasun-mobl1.amr.corp.intel.com (HELO [10.209.0.67])
 ([10.209.0.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:02:23 -0700
Message-ID: <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
Date: Fri, 6 May 2022 09:13:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
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



On 5/6/22 03:47, Srinivas Kandagatla wrote:
> Currently timeout for autoenumeration during probe and bus reset is set to
> 2 secs which is really a big value. This can have an adverse effect on
> boot time if the slave device is not ready/reset.
> This was the case with wcd938x which was not reset yet but we spent 2
> secs waiting in the soundwire controller probe. Reduce this time to
> 1/10 of Hz which should be good enough time to finish autoenumeration
> if any slaves are available on the bus.

Humm, now that I think of it I am not sure what reducing the timeout does.

It's clear that autoenumeration should be very fast, but if there is
nothing to enumerate what would happen then? It seems that reducing the
timeout value only forces an inconsistent configuration to be exposed
earlier, but that would not result in a functional change where the
missing device would magically appear, would it? Is this change mainly
to make the tests fail faster? If the 'slave device is not ready/reset',
is there a recovery mechanism to recheck later?

Would you mind clarifying what happens after the timeout, and why the
timeout would happen in the first place?

Thanks!

> 
> Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> Changes since v1:
> 	replaced HZ/10 with 100 as suggested by Pierre
> 
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 7367aa88b8ac..d6111f69d320 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -105,7 +105,7 @@
>  
>  #define SWRM_SPECIAL_CMD_ID	0xF
>  #define MAX_FREQ_NUM		1
> -#define TIMEOUT_MS		(2 * HZ)
> +#define TIMEOUT_MS		100
>  #define QCOM_SWRM_MAX_RD_LEN	0x1
>  #define QCOM_SDW_MAX_PORTS	14
>  #define DEFAULT_CLK_FREQ	9600000
