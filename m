Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52754B44E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 17:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2CAA189F;
	Tue, 14 Jun 2022 17:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2CAA189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655219749;
	bh=j9VGIf0zMXWC/ky8RMTbRLod5E9/MceYZUjWaMpKc+U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IB1bbyjTbPTCWwoLn+92qpsZHDH3kQiCPJERby6y7FAp8Paa4X+ExRZxU02JyWmNt
	 wKACZ9vImN3LQIDffIRegrwCqiKm60Jz/VRqQZ4haX5eOOzUj4EGpcs3yOp1zhEJBU
	 ftzgqao25S/fWN09ZyhYiZC3CNwJ/S95+NC0DP5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56710F800E1;
	Tue, 14 Jun 2022 17:14:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C48C2F80139; Tue, 14 Jun 2022 17:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64942F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 17:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64942F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="k/N/RtvJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BF1560C1A;
 Tue, 14 Jun 2022 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14664C3411B;
 Tue, 14 Jun 2022 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655219679;
 bh=j9VGIf0zMXWC/ky8RMTbRLod5E9/MceYZUjWaMpKc+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k/N/RtvJvBe9XPLoAXhbpTq5xuGqAr4XRugHJN/rEqlIPsmUzfDyl/2VvZ5fKbIse
 F8iyYx31VDnNSr/mobhTm1RlMJMxjYRv+XUk6BjF/TVopiWM/NOk5vpmsePyoy6Cyq
 hgs2TLQISsbgWrc8UCl3R3XRYXda+xV7HpcAmV2U=
Date: Tue, 14 Jun 2022 17:14:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: add trigger callback into
 sdw_callback
Message-ID: <Yqil3UDSmoXN3E9M@kroah.com>
References: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
 <20220614070817.2508-3-yung-chuan.liao@linux.intel.com>
 <Yqg01aSixhBq9d4+@kroah.com>
 <3fd14acb-1de9-3fd8-81ab-27fee4a42b84@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fd14acb-1de9-3fd8-81ab-27fee4a42b84@linux.intel.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
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

On Tue, Jun 14, 2022 at 09:55:41AM -0500, Pierre-Louis Bossart wrote:
> 
> >> @@ -809,6 +814,10 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
> >>  		if (!hda_use_tplg_nhlt)
> >>  			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
> >>  
> >> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
> >> +		sdw_callback.trigger = ipc4_be_dai_common_trigger;
> >> +#endif
> > 
> > #if should not be in .c files if at all possible.  Surely there's a
> > better way here...
> 
> we could use
> 
> if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))
>     sdw_callback.trigger = ipc4_be_dai_common_trigger;
> 
> would that work?

It's more readable, right?  Also easier to maintain over time.

> We try to keep this driver configurable, not all platforms require
> SoundWire or HDaudio, and that 'sdw_callback' ops structure is
> conditionally declared.

Perhaps don't conditionally declare that?  How much does it really save
to do that?

thanks,

greg k-h
