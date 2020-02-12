Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5F015A5EB
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 11:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70F3A1679;
	Wed, 12 Feb 2020 11:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70F3A1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581502469;
	bh=5eIcOX1XqO8WEtm+Zq3LIG2ukAbor26UDjUyMFVaKTY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPXke5HxOlFOyLUUzCKLh+EOFv3SqEQd5fQ9fU3tf1RGHOj84lT0RoxB37Ou6J1h9
	 VdktDrWRuBShjVviT4hneImkBbjhRiNA+De52wSez8esbZYb/Y/M9ZCUDbDkQWQ9i9
	 5hOsxcNxeIbC3bGUXWq6fZSO4q8JbYAEfikUo7dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C4F3F80157;
	Wed, 12 Feb 2020 11:12:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3565DF8014F; Wed, 12 Feb 2020 11:12:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCA23F800F0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 11:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCA23F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u3KLHJfw"
Received: from localhost (unknown [223.226.122.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 085742082F;
 Wed, 12 Feb 2020 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581502360;
 bh=/31DSUbyPT9wvjIWjWYSvPsSt0/Uzn2WXGcTVsBqR4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u3KLHJfwWM5DHICrdvCb93YHo1u/HKp2PkWx0Hrp/vQvwo+SJkYyj/IMTFf5cX14S
 +nitThSNqpqLK2WPbX6qIrDRa4CH8uyAomaNW1qeVl+MXtMiA84M98sHqti59BTnN1
 g4s7coO9TL6NAKV3ulLgiYrC4GNxlE6XSHYWZNo8=
Date: Wed, 12 Feb 2020 15:42:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200212101233.GA2618@vkoul-mobl>
References: <20200114234257.14336-1-pierre-louis.bossart@linux.intel.com>
 <20200114234257.14336-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114234257.14336-5-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 4/5] soundwire: intel: add
 sdw_stream_setup helper for .startup callback
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

On 14-01-20, 17:42, Pierre-Louis Bossart wrote:
> From: Rander Wang <rander.wang@linux.intel.com>
> 
> The sdw stream is allocated and stored in dai to share the sdw runtime
> information.
> 
> Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 64 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 999aa2cd9fea..c498812522ab 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -617,6 +617,68 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
>   * DAI routines
>   */
>  
> +static int sdw_stream_setup(struct snd_pcm_substream *substream,
> +			    struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sdw_stream_runtime *sdw_stream = NULL;
> +	char *name;
> +	int i, ret;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		name = kasprintf(GFP_KERNEL, "%s-Playback", dai->name);
> +	else
> +		name = kasprintf(GFP_KERNEL, "%s-Capture", dai->name);

I don't see name being feed on success. It is nicely freed on error but on
success it should be freed when you close

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
