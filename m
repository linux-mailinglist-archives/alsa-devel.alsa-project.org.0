Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1F7545BA8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 07:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34FF320F2;
	Fri, 10 Jun 2022 07:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34FF320F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654838793;
	bh=I4f5JhTN7o6cdBtdV7WpYHM1lwzF1iBma58To0zMnS0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoAJR5dlHSgN1oIMoK0MPQJ9xIall5yYZfeuR4QAFL8za6GUX2iQih47fW0RfWIKS
	 kZh2XoiqA5X1LGonkW+qAH2ZY3d0Um3n+jNM0QnubT0Y026knyxHjjaOY79VqltjNF
	 Tm7INAiWdaeW+0NO9Rfp0lLvoDhAePOoa/7ZEB3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D396F800C7;
	Fri, 10 Jun 2022 07:25:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82CD4F804D2; Fri, 10 Jun 2022 07:25:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50983F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 07:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50983F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="0UkE3l5r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BD7C61DFD;
 Fri, 10 Jun 2022 05:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65137C34114;
 Fri, 10 Jun 2022 05:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1654838724;
 bh=I4f5JhTN7o6cdBtdV7WpYHM1lwzF1iBma58To0zMnS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0UkE3l5r3w+fPXvwvYCjmAlJQNoaa/1C+MQ4ByQB8xiqkwjaAmt5TLqaVRTjkd9gr
 AC8um02sbNnQHFAz22iFLaL3/+YZzAzAgftqvJubBr6iflbmjfzF1XNTOv8RWi53YY
 4PuvDEchYt73MBxiL9gMFGk2Y/uv5aZtmTfUG8to=
Date: Fri, 10 Jun 2022 07:25:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/2] soundwire: intel: uniquify debug message
Message-ID: <YqLVwqx9/Pos8T06@kroah.com>
References: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
 <20220610023537.27223-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610023537.27223-2-yung-chuan.liao@linux.intel.com>
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

On Fri, Jun 10, 2022 at 10:35:36AM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The same debug message is replicated multiple time, add __func__ to
> figure out what link is ignored.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 505c5ef061e3..808e2f320052 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1328,8 +1328,8 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>  
>  	if (bus->prop.hw_disabled) {
>  		dev_info(dev,
> -			 "SoundWire master %d is disabled, ignoring\n",
> -			 sdw->instance);
> +			 "%s: SoundWire master %d is disabled, ignoring\n",
> +			 __func__, sdw->instance);

This is not a debug message, please make it such if you want to have
__func__  And even then, it's not needed as you can get that from the
kernel automatically.

>  		return 0;
>  	}
>  
> @@ -1489,8 +1489,8 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
>  	bus = &sdw->cdns.bus;
>  
>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
> -		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> -			bus->link_id);
> +		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
> +			__func__, bus->link_id);
>  		return 0;
>  	}
>  
> @@ -1549,8 +1549,8 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
>  	int ret;
>  
>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
> -		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> -			bus->link_id);
> +		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
> +			__func__, bus->link_id);

Not needed, it is provided automatically if you ask the kernel for this.
Same for all other instances in this patch.

thanks,

greg k-h
