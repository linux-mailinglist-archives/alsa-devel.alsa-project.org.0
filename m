Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E58815FE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 11:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A55A1684;
	Mon,  5 Aug 2019 11:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A55A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564998982;
	bh=U8hLoWjoXGjcsnkUSmh6b4oneMYLD/w2qPRdo06YKao=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LF/Q1uijQCaXb+6OI/58DMmd9bSumkWBtU7rw9IX6Bwm9aPqTbTJbGY1OYklPIdyR
	 RJyLtoxzaFGzEu7E0GaDhV/kQgaYEAAlSDgQ+6a4s099idocMwppJU6GBIERM+cPgQ
	 FVfUxdlbN0Afrc01WtMl7aUhgekUdsIa+E7lYJRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7292F8011B;
	Mon,  5 Aug 2019 11:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04B3FF8011B; Mon,  5 Aug 2019 11:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26DE9F8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 11:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DE9F8011B
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 02:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="349059850"
Received: from buildpc-hp-z230.iind.intel.com (HELO buildpc-HP-Z230)
 ([10.223.89.34])
 by orsmga005.jf.intel.com with ESMTP; 05 Aug 2019 02:54:28 -0700
Date: Mon, 5 Aug 2019 15:26:20 +0530
From: Sanyog Kale <sanyog.r.kale@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190805095620.GD22437@buildpc-HP-Z230>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-24-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-24-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
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

On Thu, Jul 25, 2019 at 06:40:15PM -0500, Pierre-Louis Bossart wrote:
> When we disable the stream and then call hw_free, two bank switches
> will be handled and as a result we re-enable the stream on hw_free.
>

I didnt quite get why there will be two bank switches as part of disable flow
which leads to enabling of stream?

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

-- 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
