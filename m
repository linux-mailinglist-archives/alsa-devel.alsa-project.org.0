Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023441367B8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 07:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C44917B6;
	Fri, 10 Jan 2020 07:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C44917B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578639443;
	bh=cz5jEeEG2DrHYWBwhw3wbb24pnAAArPYYQVzKhaAY6w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jGtN+lhr7w5yYmKi5cDI7VLlk8Q3SvJqjsqNf9NNRRe7TmlbGG2yvymP/lXpDOgkU
	 yLY695MYa108WSQv2mYSLxAbP3KD7Kea/W2IC5EVvGZNpzfNOoa+indbHDIYpNirtR
	 K7vKyJ66torjR3rM5hD2B3nfTHleG6M4qH4YhhCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2586FF8011C;
	Fri, 10 Jan 2020 07:55:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9C60F8011C; Fri, 10 Jan 2020 07:55:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88CC8F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 07:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CC8F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SHCdJvtN"
Received: from localhost (unknown [223.226.110.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 555F520673;
 Fri, 10 Jan 2020 06:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578639331;
 bh=mDdpGN6yAPTKX7BA5XVzBBicXNXPQHC6lQFxfVSspJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SHCdJvtNhXFB0/NU0dDmLeGd+X9JoYG8hffqvDNSwBrFJOVvdlF4H7rOfVytunauI
 ziP7OwMBdmawlB6imnkyH8X4QKUmsz6ERAG7DadxbfdwC1H3sjsQtLS0qLzAgewNwW
 Mcaargnu6SfRqseS2HwXtOgRCSAkmTttWdf8U1Ls=
Date: Fri, 10 Jan 2020 12:25:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200110065515.GZ2818@vkoul-mobl>
References: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
 <20200108175438.13121-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108175438.13121-5-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 4/6] soundwire: stream: do not update
 parameters during DISABLED-PREPARED transition
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

On 08-01-20, 11:54, Pierre-Louis Bossart wrote:
> After a system suspend, the ALSA/ASoC core will invoke the .prepare()
> callback and a TRIGGER_START when INFO_RESUME is not supported.
> 
> Likewise, when an underflow occurs, the .prepare callback will be invoked.
> 
> In both cases, the stream can be in DISABLED mode, and will transition
> into the PREPARED mode. We however don't want the bus bandwidth to be
> recomputed.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/stream.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index bd0bddf73830..c28ce7f0d742 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1460,7 +1460,8 @@ static void sdw_release_bus_lock(struct sdw_stream_runtime *stream)
>  	}
>  }
>  
> -static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
> +static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
> +			       bool update_params)
>  {
>  	struct sdw_master_runtime *m_rt;
>  	struct sdw_bus *bus = NULL;
> @@ -1480,6 +1481,9 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
>  			return -EINVAL;
>  		}
>  
> +		if (!update_params)
> +			goto program_params;
> +
>  		/* Increment cumulative bus bandwidth */
>  		/* TODO: Update this during Device-Device support */
>  		bus->params.bandwidth += m_rt->stream->params.rate *
> @@ -1495,6 +1499,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
>  			}
>  		}
>  
> +program_params:
>  		/* Program params */
>  		ret = sdw_program_params(bus);
>  		if (ret < 0) {
> @@ -1544,6 +1549,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
>   */
>  int sdw_prepare_stream(struct sdw_stream_runtime *stream)
>  {
> +	bool update_params = true;
>  	int ret;
>  
>  	if (!stream) {
> @@ -1567,7 +1573,16 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
>  		goto state_err;
>  	}
>  
> -	ret = _sdw_prepare_stream(stream);
> +	/*
> +	 * when the stream is DISABLED, this means sdw_prepare_stream()
> +	 * is called as a result of an underflow or a resume operation.
> +	 * In this case, the bus parameters shall not be recomputed, but
> +	 * still need to be re-applied
> +	 */
> +	if (stream->state == SDW_STREAM_DISABLED)
> +		update_params = false;

Should this not be handled by the caller..? I do not like to deduce this
here as the info is already available in dai driver, so go ahead and
propagate it and get it from caller when it is required..

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
