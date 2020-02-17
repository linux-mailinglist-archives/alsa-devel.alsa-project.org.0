Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA1161329
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 14:20:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BECF166E;
	Mon, 17 Feb 2020 14:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BECF166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581945659;
	bh=IMjHiKRJfdwNmaD87hdfJXPxx9pUcuBBBQWTKkgoBdE=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwD4JcJLq72PrFrrheuPsRE4Pdu6ko0uKk8cHzwdo1vXBKjnrgomv7YcgIFYDARdd
	 MVGzYOS7R1tvY0arzQv1Ini4NrACrSt7s9qG53udi2wZh1pgWfGw/1igThM8SOU749
	 jw/0ZIDDUzLpukPqk8Dknu0GDlh+7qgF8L3Hwi9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A2CF801F4;
	Mon, 17 Feb 2020 14:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D36F80172; Mon, 17 Feb 2020 14:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D1F4F8015E
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 14:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D1F4F8015E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 05:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,452,1574150400"; d="scan'208";a="433791068"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 17 Feb 2020 05:17:55 -0800
Date: Mon, 17 Feb 2020 15:17:54 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20200216203516.10869-1-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.2002171506330.2957@eliteleevi.tm.intel.com>
References: <20200216203516.10869-1-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: intel: Fix probe error without
 i915 graphics
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

Hey,

On Sun, 16 Feb 2020, Takashi Iwai wrote:

> @@ -200,6 +202,9 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
>  	struct hdac_bus *bus = sof_to_bus(sdev);
>  	int ret;
>  
> +	if (!bus->audio_component) /* not bound with i915 */
> +		return 0;
> +
>  	hda_codec_i915_display_power(sdev, false);
>  
>  	ret = snd_hdac_i915_exit(bus);

hmm, actually found the issue in my patch. It turned out to be a bit 
suprising issue with acomp&devres.

 snd_hdac_i915_exit() calls
   -> snd_hdac_acomp_exit(), which again calls
   -> component.c:component_master_del(dev, &hdac_component_master_ops);
   -> component.c:take_down_master()
   -> devres.c:devres_release_group(master->dev, NULL);

...  now that is somewhat suprising. Basicly that goes on to release all 
devres resources for the hdac_bus device (not just those related to 
acomp!).

I can fix my immediate problem by not calling snd_hdac_i915_exit() if 
hdac_bus contineus to be used, but I'm a bit worried we could hit this in 
other flows.

Anyways, FYI at least for the list archives.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
