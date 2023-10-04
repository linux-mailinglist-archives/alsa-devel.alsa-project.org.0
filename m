Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D47B861E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 19:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6275E857;
	Wed,  4 Oct 2023 19:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6275E857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696439201;
	bh=BPrbOdjfDQnlu7PBBE6jMSOGqJlteSEMb7Ixz8XIRgc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=voso07y6BCKHaYFBV8wosTiy3weilw/+sbxep1CQDNad3L23PSJQB7T8mn1FXMKKg
	 RH3eftcQPxLAQDTdZS0NaJ/o1irR3lHH0n6rUquOG1kiC6M+kQxkrOIi5wjlXOJQG6
	 VHAu+8qkIhsD4klk703cYCPQfN+mYYSWJJx1WMdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F6A5F80130; Wed,  4 Oct 2023 19:05:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 402B1F80310;
	Wed,  4 Oct 2023 19:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB4A2F8047D; Wed,  4 Oct 2023 19:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7353CF80130;
	Wed,  4 Oct 2023 19:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7353CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i1/MWuyo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696439140; x=1727975140;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BPrbOdjfDQnlu7PBBE6jMSOGqJlteSEMb7Ixz8XIRgc=;
  b=i1/MWuyogp0qzXBr2S0asW0pxRb/fa3gj5ZUDbgWTe+i3q13m9QXIiBU
   VHdPGrMSLQEqjXjkYi/VGCgbMEGdSxg7cLU0trUmilOm2zisH9iIReMTp
   q8GlBB4uTeY9z49O9x9EtGTJHn49y3wL5CZ5hINP4C3lqRB5JXcv8g9MZ
   QGYzDLRywryVdS0tARIWeBGd+adcdTvdZNdtrCiCZzP9YXhXkDfF8l9n2
   gxzBDvZemIw4wgn6nPH+RIJaYTpLtXUU+0O0Vmr2tBPGRLBmbvZOUGi5h
   ZCwuGyhfjZ18vSBoP8u4FmGYGyNn9ALvzX0Q/8F08lZWUfFn86jE0HeXG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383138207"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="383138207"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755023978"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="755023978"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:03:55 -0700
Date: Wed, 4 Oct 2023 19:59:42 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
cc: Alsa-devel <alsa-devel@alsa-project.org>,
    Maarten Lankhorst <dev@lankhorst.se>, Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
    linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v6 11/12] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
In-Reply-To: <20231004145540.32321-12-maarten.lankhorst@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2310041953090.3390143@eliteleevi.tm.intel.com>
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
 <20231004145540.32321-12-maarten.lankhorst@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: H7OOYL7HAFWI3PNROZK3HD6VNGEFLAK3
X-Message-ID-Hash: H7OOYL7HAFWI3PNROZK3HD6VNGEFLAK3
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7OOYL7HAFWI3PNROZK3HD6VNGEFLAK3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I'm good with rest of the series, but one patch requires work.

On Wed, 4 Oct 2023, Maarten Lankhorst wrote:

> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue.
> 
> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> probe function.
> 
> The previously added probe_early can be used for this,
> and we also use the newly added remove_late for unbinding afterwards.
[...]
> --- a/sound/soc/sof/intel/hda-common-ops.c
> +++ b/sound/soc/sof/intel/hda-common-ops.c
> @@ -19,6 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
>  	.probe_early	= hda_dsp_probe_early,
>  	.probe		= hda_dsp_probe,
>  	.remove		= hda_dsp_remove,
> +	.remove_late	= hda_dsp_remove_late,
>  
>  	/* Register IO uses direct mmio */
>  
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 86a2571488bc..4eb7f04b8ae1 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -1160,6 +1160,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
>  		return -ENOMEM;
>  	sdev->pdata->hw_pdata = hdev;
>  	hdev->desc = chip;
> +	ret = hda_init(sdev);
>  
>  err:
>  	return ret;

I don't think this works. The hda_codec_i915_init() errors are ignored in 
hda_init() so this never returns -EPROBE_DEFER.

So something like this is needed on top (tested quickly on one SOF 
machine and this blocks SOF load until i915 or xe driver is loaded):

--cut--
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 9025bfaf6a7e..8b17c82dcc89 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -863,13 +863,20 @@ static int hda_init(struct snd_sof_dev *sdev)
        /* init i915 and HDMI codecs */
        ret = hda_codec_i915_init(sdev);
        if (ret < 0)
-               dev_warn(sdev->dev, "init of i915 and HDMI codec 
failed\n");
+               dev_warn(sdev->dev, "init of i915 and HDMI codec failed 
(%d)\n", ret);
+
+       if (ret < 0 && ret != -ENODEV)
+               goto out;
 
        /* get controller capabilities */
        ret = hda_dsp_ctrl_get_caps(sdev);
        if (ret < 0)
                dev_err(sdev->dev, "error: get caps error\n");
 
+out:
+       if (ret < 0)
+               iounmap(sof_to_bus(sdev)->remap_addr);
+
        return ret;
 }
--cut--

Br, Kai
