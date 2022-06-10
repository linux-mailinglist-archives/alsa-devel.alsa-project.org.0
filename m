Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE6545BA9
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 07:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD4420D3;
	Fri, 10 Jun 2022 07:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD4420D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654838835;
	bh=gwCK9uMfRUGm8E6XoELsFSqRflgNay8yFNDnSDJjIw8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwSSPXvb/IgYh0EYIz6zIyxl8XXSvMJ6LdXIT+V2If9oMzZ2JV1vo7hfD2n8IvfvY
	 jXn4vaeQar6Pd0Pq1X6VmoqWQqHk7tbkLWDDt+KcLuGXUv9pjibzEFmGmHlMb4/I4K
	 XKA+CmiDZZ7uS4ERNgwjMc0edTwcMyDFDmVKmCr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C7DBF804DA;
	Fri, 10 Jun 2022 07:26:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CBCEF804E7; Fri, 10 Jun 2022 07:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40DB8F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 07:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40DB8F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="GxdUSQ2Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4927C61E33;
 Fri, 10 Jun 2022 05:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE92C34114;
 Fri, 10 Jun 2022 05:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1654838768;
 bh=gwCK9uMfRUGm8E6XoELsFSqRflgNay8yFNDnSDJjIw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GxdUSQ2YDkvS3Pl8dMqe65wnQRwTnSFBKsCTFUh8i9zW47JnZ11Tk/6J+WRSGBO38
 soK+Wv94GzKlQGFUh4wJITycUkm7Z3Y3+PIGLMf7CB6jNTWPZyoCLuUp6r1JCVNaKt
 X+drEUBA4JfjILQuvuKd7ictTayLxW0Qo5/IfZGE=
Date: Fri, 10 Jun 2022 07:26:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/2] soundwire: Intel: add trigger callback
Message-ID: <YqLV7qexsdhCI7ZZ@kroah.com>
References: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
 <20220610023537.27223-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610023537.27223-3-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, bard.liao@intel.com
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

On Fri, Jun 10, 2022 at 10:35:37AM +0800, Bard Liao wrote:
> When a pipeline is split into FE and BE parts, the BE pipeline may need to
> be triggered separately in the BE trigger op. So add the trigger callback
> in the link_res ops that will be invoked during BE DAI trigger.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  drivers/soundwire/intel.c           | 8 ++++++++
>  include/linux/soundwire/sdw_intel.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 808e2f320052..3f3c2c99cb8e 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1004,9 +1004,17 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
>  {
>  	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
> +	struct sdw_intel_link_res *res = sdw->link_res;
>  	struct sdw_cdns_dma_data *dma;
>  	int ret = 0;
>  
> +	/* The .trigger callback is used to send required IPC to audio
> +	 * firmware. The .free_stream callback will still be called
> +	 * by intel_free_stream() in the TRIGGER_SUSPEND case.
> +	 */
> +	if (res->ops && res->ops->trigger)
> +		res->ops->trigger(dai, cmd, substream->stream);
> +
>  	dma = snd_soc_dai_get_dma_data(dai, substream);
>  	if (!dma) {
>  		dev_err(dai->dev, "failed to get dma data in %s\n",
> diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
> index 67e0d3e750b5..f638707fd712 100644
> --- a/include/linux/soundwire/sdw_intel.h
> +++ b/include/linux/soundwire/sdw_intel.h
> @@ -119,6 +119,7 @@ struct sdw_intel_ops {
>  			     struct sdw_intel_stream_params_data *params_data);
>  	int (*free_stream)(struct device *dev,
>  			   struct sdw_intel_stream_free_data *free_data);
> +	int (*trigger)(struct snd_soc_dai *dai, int cmd, int stream);
>  };
>  
>  /**
> -- 
> 2.17.1
> 

Where is the in-kernel user of this new callback?  Without that, there
is no need for this, NOR is there a way to properly review this commit.

sorry,

greg k-h
