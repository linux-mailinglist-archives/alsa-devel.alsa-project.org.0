Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3601367E2
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 08:05:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AECDC17A8;
	Fri, 10 Jan 2020 08:04:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AECDC17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578639931;
	bh=nkvJvLQ0F2CDiLYUi7wTJajRFGHILLj3MnbDHRzl3vw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q08Jh5fhugX7HWxL/BNwUw7/5i+jt7Qq+4c8S+Sz/6T3y151m1LYSYAH38VgEGYf6
	 RF/zpvXqn4EHfnS5O7KVNEr2eiaF1HdMJ5g5V5Tywyixv3p8zOP7sWYKL/G9YWmviH
	 KtYbHQcPRufU1YcBfu5+gm/UN8jOxX5UbAbzZ870=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847D2F80159;
	Fri, 10 Jan 2020 08:03:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68613F8011C; Fri, 10 Jan 2020 08:03:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CC46F800E4
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 08:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC46F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UtQke1VR"
Received: from localhost (unknown [223.226.110.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7C1B2080D;
 Fri, 10 Jan 2020 07:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578639818;
 bh=ZnMDBNhMvFkTRDhEtOEWNUKzKsBrxPyLSgZcAstK7P4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UtQke1VRM29qVQhxQo8REzyXvGu+GTluOSWfZzT6k+VFPNrFMg3X2bzUHZuQL+X2k
 BjsSJUg8qKqc5qHRh/w9VwVJaMpyPMRHtywDHfsH7NhD4/Kf4lSPJxdNp1Fho/7t+D
 SL74Mz+fmESqn7mF2LFvoOLY42ehtLOHPB3qjw34=
Date: Fri, 10 Jan 2020 12:33:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200110070321.GA2818@vkoul-mobl>
References: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
 <20200108175438.13121-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108175438.13121-7-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 6/6] soundwire: stream: don't program ports
 for a stream that has not been prepared
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
> From: Rander Wang <rander.wang@intel.com>
> 
> In the Intel QA multi-pipelines test case, there are two pipelines for
> playback and capture on the same bus. The test fails with an error
> when setting port params:
> 
> [  599.224812] rt711 sdw:0:25d:711:0: invalid dpn_prop direction 1 port_num 0
> [  599.224815] sdw_program_slave_port_params failed -22
> [  599.224819] intel-sdw sdw-master-0: Program transport params failed: -22
> [  599.224822] intel-sdw sdw-master-0: Program params failed: -22

side note, one of these above err logs should be removed :)

> [  599.224828] sdw_enable_stream: SDW0 Pin2-Playback: done
> 
> This problem is root-caused to the programming of the capture stream
> ports while it is not yet prepared, the calling sequence is:
> 
> (1) hw_params for playback. The playback stream provide the port
>     information to Bus.
> (2) stream_prepare for playback, Transport and port parameters
>     are computed for playback.
> (3) hw_params for capture. The capture stream provide the port
>     information to Bus, but it has not been prepared so is not
>     accounted for in the bandwidth allocation.
> (4) stream_enable for playback. Program transport and port parameters
>     for all masters and slaves. Since the transport and port parameters
>     are not computed for capture stream, sdw_program_slave_port_params
>     will generate a error when setting port params for capture.
> 
> in step (4), we should only program the ports for the stream that have
> been prepared. A stream that is only in CONFIGURED state should be
> ignored, its ports will be programmed when it becomes PREPARED.
> 
> Tested on Comet Lake.
> 
> GitHub issue: https://github.com/thesofproject/linux/issues/1637

This is not relevant for kernel, pls remove

> Signed-off-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/stream.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index da10f38298c0..198372977187 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -604,12 +604,23 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
>   *
>   * @bus: SDW bus instance
>   */
> -static int sdw_program_params(struct sdw_bus *bus)
> +static int sdw_program_params(struct sdw_bus *bus, bool prepare)
>  {
>  	struct sdw_master_runtime *m_rt;
>  	int ret = 0;
>  
>  	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
> +
> +		/*
> +		 * this loop walks through all master runtimes for a
> +		 * bus, but the ports can only be configured while
> +		 * explicitly preparing a stream or handling an
> +		 * already-prepared stream otherwise.

we can go upto 80 chars, make sure you align the above comment block as
such

> +		 */
> +		if (!prepare &&
> +		    m_rt->stream->state == SDW_STREAM_CONFIGURED)
> +			continue;
> +
>  		ret = sdw_program_port_params(m_rt);
>  		if (ret < 0) {
>  			dev_err(bus->dev,
> @@ -1502,7 +1513,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>  
>  program_params:
>  		/* Program params */
> -		ret = sdw_program_params(bus);
> +		ret = sdw_program_params(bus, true);
>  		if (ret < 0) {
>  			dev_err(bus->dev, "Program params failed: %d\n", ret);
>  			goto restore_params;
> @@ -1602,7 +1613,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>  		bus = m_rt->bus;
>  
>  		/* Program params */
> -		ret = sdw_program_params(bus);
> +		ret = sdw_program_params(bus, false);
>  		if (ret < 0) {
>  			dev_err(bus->dev, "Program params failed: %d\n", ret);
>  			return ret;
> @@ -1687,7 +1698,7 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
>  		struct sdw_bus *bus = m_rt->bus;
>  
>  		/* Program params */
> -		ret = sdw_program_params(bus);
> +		ret = sdw_program_params(bus, false);

Can you do a converse test as well, when the streams are running and
concurrently two stream are stopped, it would be good to get it confirmed...

>  		if (ret < 0) {
>  			dev_err(bus->dev, "Program params failed: %d\n", ret);
>  			return ret;
> @@ -1769,7 +1780,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
>  			m_rt->ch_count * m_rt->stream->params.bps;
>  
>  		/* Program params */
> -		ret = sdw_program_params(bus);
> +		ret = sdw_program_params(bus, false);
>  		if (ret < 0) {
>  			dev_err(bus->dev, "Program params failed: %d\n", ret);
>  			return ret;
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
