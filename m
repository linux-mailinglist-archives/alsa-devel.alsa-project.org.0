Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594B76C19
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D6E208F;
	Fri, 26 Jul 2019 16:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D6E208F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564152806;
	bh=J333w/2yv4/eYYl0k5H1WRegoAu3X6YBHKlj5tdc9eQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qr1ro4gknXnG6Kpo3sXUZnKsdiC8IYc9s53FJVt1pGQ4U/zjGCbr6DY+jzpZtgI8I
	 JpSdgB7NQ9NRICOSiuZYWpo39gKpiP56DbD/IuiJKbA9D98A0D7pO+jeBJ4JWWZk5l
	 YdVOlyoIDmvVgHC7E9oExdJRHhT0Oeirw9ysikfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 342F8F803D5;
	Fri, 26 Jul 2019 16:51:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35333F800BE; Fri, 26 Jul 2019 16:51:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49999F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49999F800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="370101454"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2019 07:51:30 -0700
Date: Fri, 26 Jul 2019 16:51:29 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726145129.GI16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-24-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-24-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 23/40] soundwire: stream: fix disable
 sequence
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Unrelated to this specific patch, but I looked at _sdw_disable_stream()
and I see this there (again, maybe my version is outdated already):

	struct sdw_master_runtime *m_rt = NULL;
	struct sdw_bus *bus = NULL;

where both those initialisations are redundant. Moreover:

On Thu, Jul 25, 2019 at 06:40:15PM -0500, Pierre-Louis Bossart wrote:
> When we disable the stream and then call hw_free, two bank switches
> will be handled and as a result we re-enable the stream on hw_free.
> 
> Make sure the stream is disabled on both banks.
> 
> TODO: we need to completely revisit all this and make sure we have a
> mirroring mechanism between current and alternate banks.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/stream.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 53f5e790fcd7..75b9ad1fb1a6 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1637,7 +1637,24 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
>  		}
>  	}
>  
> -	return do_bank_switch(stream);
> +	ret = do_bank_switch(stream);
> +	if (ret < 0) {
> +		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* make sure alternate bank (previous current) is also disabled */
> +	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
> +		bus = m_rt->bus;

"bus" is only used below, so at least take that line under "if (ret < 0)"
or even just do "dev_err(m_rt->bus->dev,...)" everywhere in this function
and remove the variable altogether...

Thanks
Guennadi

> +		/* Disable port(s) */
> +		ret = sdw_enable_disable_ports(m_rt, false);
> +		if (ret < 0) {
> +			dev_err(bus->dev, "Disable port(s) failed: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
