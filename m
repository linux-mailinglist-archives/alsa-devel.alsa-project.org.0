Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05AF607C6E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:38:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9701C7B8B;
	Fri, 21 Oct 2022 18:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9701C7B8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666370322;
	bh=1WmcIR8LQUdwWI92mwL+lEDUUMAxr+M2w9pm5h8V3XA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b4CIhfHbF8Yx9ipVYNjisuDS0InAnANdkqlrS1KvamtCd5Kr3q8sK1/aUXbMXPBWX
	 R4SnhnAlCNAgU6I1RjgLYPinZKV+oRpOcrL6iNUzON0P3c9OvEfxeaeRY7RsnBCvQt
	 TpFsgCVUfyObweE8t6b6BYJc3ifhTwk42C3Rbzyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18297F80256;
	Fri, 21 Oct 2022 18:37:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DD21F80134; Fri, 21 Oct 2022 18:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97DF3F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97DF3F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xd0jNJ2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666370261; x=1697906261;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1WmcIR8LQUdwWI92mwL+lEDUUMAxr+M2w9pm5h8V3XA=;
 b=Xd0jNJ2s1kC92Vf5QoXJr5Ux7KxhfPA8Y8m2fHVlDyuIMGcyUYFukG+C
 /DeJmfnir+fWNJgE25kVid7cfjD0s4ZSQ4h3uzKXooYlj7FO9ZJUdQRRV
 ++ITpRK4rVzI0ko0XF7uJ20+W7gQnxR2gHBMbzsRUlgYGNzwaH1uBhWXS
 6IJzCOitzKJw/IZzMTmloBti2wnde+CJ3MQT2rYSux73mSO3ActVRjL9D
 4xmSYKkN2nIy0pZ/DmeP+1Kk9+ASgncZAIl3ZQZbvE2depOOinBwP31YG
 Ur0Jm1+Y+LAF/oTD/6m7wSsSD+XzWA7cqH/kunOfJeEp/gI5PaVh0qNSz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="333622388"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="333622388"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 09:37:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="755874415"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="755874415"
Received: from legomezl-mobl1.amr.corp.intel.com (HELO [10.213.170.111])
 ([10.213.170.111])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 09:37:06 -0700
Message-ID: <ad0a158f-6311-4da9-ee78-68e72decb056@linux.intel.com>
Date: Fri, 21 Oct 2022 11:37:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] soundwire: intel: Initialize clock stop timeout
Content-Language: en-US
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20221020015624.1703950-1-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221020015624.1703950-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: bard.liao@intel.com, vinod.koul@linaro.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
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



On 10/19/22 20:56, Bard Liao wrote:
> From: Sjoerd Simons <sjoerd@collabora.com>
> 
> The bus->clk_stop_timeout member is only initialized to a non-zero value
> during the codec driver probe. This can lead to corner cases where this
> value remains pegged at zero when the bus suspends, which results in an
> endless loop in sdw_bus_wait_for_clk_prep_deprep().
> 
> Corner cases include configurations with no codecs described in the
> firmware, or delays in probing codec drivers.
> 
> Initializing the default timeout to the smallest non-zero value avoid this
> problem and allows for the existing logic to be preserved: the
> bus->clk_stop_timeout is set as the maximum required by all codecs
> connected on the bus.
> 
> Fixes: 1f2dcf3a154ac ("soundwire: intel: set dev_num_ida_min")
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Chao Song <chao.song@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>

this patch should be sent to GregKH/Linus as a 6.1-rcx fix, it does seem
to make the life of Arch/Debian users less miserable - for some reason
very large delays on driver probe seem to trigger this corner case and
make things even worse.

see https://github.com/thesofproject/linux/issues/3777 for details.

Thanks Vinod.

> ---
>  drivers/soundwire/intel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 25ec9c272239..78d35bb4852c 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1311,6 +1311,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
>  
>  	bus->link_id = auxdev->id;
>  	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
> +	bus->clk_stop_timeout = 1;
>  
>  	sdw_cdns_probe(cdns);
>  
