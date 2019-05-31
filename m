Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBDD31160
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 17:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DA515F2;
	Fri, 31 May 2019 17:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DA515F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559316787;
	bh=6zVewXmsU1Hc0b7I/qDh2kAJ2KAYXsFIgS542PglVEg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcLNtNATlpLq0eXmfYHxerCpy2Si1OxguCwCSTJtB2Ewy9LlGEYTWmbDogYvNsqZ7
	 tPNCMiGYD36J4tMiVhkV1lb0RQz5pZHKAgD2sG4iZ2MoGZHRn9znD4vRiYF/AoVuiy
	 6Pkvndc15R/m1Wz/K/p3uwx27DLlsPQoMWH4G1n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D4CF896E8;
	Fri, 31 May 2019 17:31:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F3F6F896E5; Fri, 31 May 2019 17:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D558F80757
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 17:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D558F80757
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 08:31:12 -0700
X-ExtLoop1: 1
Received: from hoangng2-mobl.amr.corp.intel.com ([10.254.19.252])
 by orsmga005.jf.intel.com with ESMTP; 31 May 2019 08:31:10 -0700
Message-ID: <c62fb44c59b2a417a8ec721af542f584519dee49.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Date: Fri, 31 May 2019 08:31:10 -0700
In-Reply-To: <20190531143820.10142-1-tiwai@suse.de>
References: <20190531143820.10142-1-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: hdac_hda: Fix unbalanced bus link
 refcount at probe error
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

On Fri, 2019-05-31 at 16:38 +0200, Takashi Iwai wrote:
> The error paths in hdac_hda_codec_probe() don't take care of the bus
> link refcount properly, which leave the refcount still high.
> This patch addresses them.
Hi Takashi,

Thanks for this. But I looked into hdac_hdmi probe and we have a
similar problem there as well. 

Thanks,
Ranjani


> Fixes: 6bae5ea94989 ("ASoC: hdac_hda: add asoc extension for legacy
> HDA codec drivers")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> A bug I found while digging for another problem :)
> 
>  sound/soc/codecs/hdac_hda.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdac_hda.c
> b/sound/soc/codecs/hdac_hda.c
> index 7d4940256914..b55deaeb1ebf 100644
> --- a/sound/soc/codecs/hdac_hda.c
> +++ b/sound/soc/codecs/hdac_hda.c
> @@ -475,8 +475,10 @@ static int hdac_hda_dev_probe(struct hdac_device
> *hdev)
>  	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
>  
>  	hda_pvt = hdac_to_hda_priv(hdev);
> -	if (!hda_pvt)
> -		return -ENOMEM;
> +	if (!hda_pvt) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
>  
>  	/* ASoC specific initialization */
>  	ret = devm_snd_soc_register_component(&hdev->dev,
> @@ -484,12 +486,13 @@ static int hdac_hda_dev_probe(struct
> hdac_device *hdev)
>  					 ARRAY_SIZE(hdac_hda_dais));
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "failed to register HDA codec
> %d\n", ret);
> -		return ret;
> +		goto error;
>  	}
>  
>  	dev_set_drvdata(&hdev->dev, hda_pvt);
> -	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
>  
> + error:
> +	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
>  	return ret;
>  }
>  

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
