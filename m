Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B73008CD
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 17:42:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D890B1B13;
	Fri, 22 Jan 2021 17:41:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D890B1B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611333766;
	bh=C/geiDc2zIYRH4HMaZ2jFedLsrrWK3tEBTdTBYvj5uY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6w90CJclyF6UdF1j2aaGbmCjGaWGIqtB5Scik6LNl8XkScLGxEXd+j+OlcvmZfK1
	 VfhcLAe0i9s7XduXBu26/1YT8HWKdhxkZ2nz/fxw+jYdEi6q8wkF9ZcBgihxFYm2IE
	 xHNhJIa8vRGEKyHY136qGLNlqfzSse9jOwbu+PFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9DCF80129;
	Fri, 22 Jan 2021 17:41:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB9D8F8016E; Fri, 22 Jan 2021 17:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A94D1F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 17:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A94D1F80129
IronPort-SDR: 1cG8OoydoWGlODlbMGcGua6n08EBfJTTd6VGKBVLj3WAd84JPEoCXER/SvvlNlfV9k4wLRjgPx
 JWd0Hwvgtkyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="158649861"
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="158649861"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 08:40:56 -0800
IronPort-SDR: 5pxU+mVZNOVnvUXvnUwFOBkhp3hVbWG9a+ZCkzo1fjSzewKswqHZ10G0hsJxuSELuW4rDc2H5h
 /f72YB8dzWWQ==
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="400724151"
Received: from tflint-mobl.amr.corp.intel.com (HELO
 ovakana-MOBL1.amr.corp.intel.com) ([10.255.229.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 08:40:56 -0800
Message-ID: <9888b27b0dc9399861ecbee23d5d4ea0d844718c.camel@linux.intel.com>
Subject: Re: Question about hdac_ext_link ref_count management
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 22 Jan 2021 08:40:55 -0800
In-Reply-To: <s5h1red83ic.wl-tiwai@suse.de>
References: <aca60b522335f3f916f9f8f204693365bfc32231.camel@linux.intel.com>
 <s5h1red83ic.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

On Fri, 2021-01-22 at 15:12 +0100, Takashi Iwai wrote:
> On Fri, 22 Jan 2021 00:23:53 +0100,
> Ranjani Sridharan wrote:
> > Hi Takashi,
> > 
> > While exploring some power optimizations on Intel platforms, I
> > noticed
> > that the hdac_ext_link ref_count is incremented during codec probe
> > in hdac_hda_codec_probe() and the ref_count is held until the codec
> > device is removed. 
> > 
> > I was wondering if it would be possible to call the get/put for the
> > hdac_ext_link in the codec runtime suspend/resume callbacks so that
> > the
> > link is powered up only when the link is in use. Are there any
> > downsides to doing this? 
> 
> Wouldn't the  snd_hdac_ext_bus_link_power_up() / down() calls do the
> runtime PM stuff?  Maybe we need to revisit those link power
> management.  The ext stuff isn't well m
> and, I'm afraid.
Thanks, Takashi.
It looks like snd_hdac_ext_bus_link_power_up/down() are only called
during snd_hdac_ext_bus_link_get/put(). Actually, in my observation
disabling the CORB/RIRB buffer DMAs is what saves us power and this is
done only if snd_hdac_ext_bus_link_put() is called on all links.

> 
> The get() and put() are obviously for fully enabling and disabling
> the
> device, hence it's not suitable for the runtime PM suspend/resume.
> The power_up() / down() should be adjusted to fit with the runtime PM
> call, if any.

The only additional thing that snd_hdac_ext_bus_link_get/put() does on
top of snd_hdac_ext_bus_link_power_up/down() is to stop the CORB/RIRB
DMA when all the link ref_counts are 0. Do you think it is not
advisable to stop the CORB/RIRB DMA during runtime PM?

Thanks,
Ranjani

