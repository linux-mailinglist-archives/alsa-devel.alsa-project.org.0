Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A299857B96
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 07:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E43F16F5;
	Thu, 27 Jun 2019 07:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E43F16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561613880;
	bh=TB/GA8p6E/c6pw6SWwhELXrGPV1c/jPa186MWF0o8kg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jRsKWhuUqMqM35IXkHP5TivgLPTaJkhJsDqphq2fHh9Y2HFiVyNj0SDocyOWOMz4F
	 IexPGPcgA9oMu3Lm39Nq0tHEeDtegMIIloltt+NxlpikvXeIWOExNvvOl/h83/Kb3L
	 1u5DWueTaa9hy3EoHYAXhNE0aJ/4CKEeStIpEIGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFFBBF896FC;
	Thu, 27 Jun 2019 07:36:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4564F896F6; Thu, 27 Jun 2019 07:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B58F4F806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 07:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B58F4F806F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 22:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="183368449"
Received: from vwhye-mobl.amr.corp.intel.com ([10.254.102.53])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2019 22:36:06 -0700
Message-ID: <c7d866c6289956df7152f57dbe0108001752bb8a.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Wed, 26 Jun 2019 22:36:05 -0700
In-Reply-To: <388c2dce-a235-c592-b88e-0f6deca76220@intel.com>
References: <20190626202229.16312-1-ranjani.sridharan@linux.intel.com>
 <20190626202229.16312-3-ranjani.sridharan@linux.intel.com>
 <388c2dce-a235-c592-b88e-0f6deca76220@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: Intel: hda: Enable jack
 detection in sof hda driver
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

On Wed, 2019-06-26 at 23:03 +0200, Cezary Rojewski wrote:
> On 2019-06-26 22:22, Ranjani Sridharan wrote:
> > From: Rander Wang <rander.wang@linux.intel.com>
> > 
> > In commit 7d4f606c50ff ("ALSA: hda - WAKEEN feature enabling for
> > runtime pm"), legacy HD-A driver sets hda controller in reset mode
> > after
> > entering runtime-suspend. And when resuming from suspend mode, it
> > checks
> > hda controller & codec status to detect headphone hotplug event.
> > Now
> > this patch does the same job in SOF runtime pm functions.
> > 
> > And we need to check all the non-hdmi codecs for some cases like
> > playback
> > with HDMI or capture with DMIC connected to dsp. In these cases,
> > only
> > controller is active and codecs are suspended, so codecs can't send
> > unsolicited event to controller. The jack polling operation will
> > activate
> > codecs and unsolicited event can work even codecs become suspended
> > later.
> > 
> > Tested on whiskylake with hda codecs.
> > 
> > Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> > Signed-off-by: Pierre-Louis Bossart <
> > pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
> > >
> > ---
> >   sound/soc/sof/intel/hda-codec.c | 45
> > +++++++++++++++++++++++++++++++--
> >   sound/soc/sof/intel/hda-dsp.c   | 29 ++++++++++++++++-----
> >   sound/soc/sof/intel/hda.h       |  4 +++
> >   3 files changed, 70 insertions(+), 8 deletions(-)
> > 
> > diff --git a/sound/soc/sof/intel/hda-codec.c
> > b/sound/soc/sof/intel/hda-codec.c
> > index b8b37f082309..c711792534da 100644
> > --- a/sound/soc/sof/intel/hda-codec.c
> > +++ b/sound/soc/sof/intel/hda-codec.c
> > @@ -10,6 +10,7 @@
> >   
> >   #include <linux/module.h>
> >   #include <sound/hdaudio_ext.h>
> > +#include <sound/hda_register.h>
> >   #include <sound/hda_codec.h>
> >   #include <sound/hda_i915.h>
> >   #include <sound/sof.h>
> > @@ -37,16 +38,55 @@ static void hda_codec_load_module(struct
> > hda_codec *codec)
> >   static void hda_codec_load_module(struct hda_codec *codec) {}
> >   #endif
> >   
> > +/* check jack status after resuming from suspend mode */
> > +void hda_codec_jack_check(struct snd_sof_dev *sdev, int status)
> > +{
> > +	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
> > +	struct hda_bus *hbus = sof_to_hbus(sdev);
> > +	struct hdac_bus *bus = sof_to_bus(sdev);
> > +	struct hda_codec *codec;
> > +	int mask;
> > +
> > +	/*
> > +	 * there are two reasons for runtime resume
> > +	 * (1) waken up by interrupt triggered by WAKEEN feature
> > +	 * (2) waken up by pm get functions for some audio operations
> > +	 * For case (1), the bits in status mean which codec triggers
> > +	 * the interrupt and jacks will be checked on these codecs.
> > +	 * For case (2), we need to check all the non-hdmi codecs for
> > some
> > +	 * cases like playback with HDMI or capture with DMIC. In these
> > +	 * cases, only controller is active and codecs are suspended,
> > so
> > +	 * codecs can't send unsolicited event to controller. The jack
> > polling
> > +	 * operation will activate codecs and unsolicited event can
> > work
> > +	 * even codecs become suspended later.
> > +	 */
> 
> This block is huge. I'd suggest entering some whitespaces to make it 
> more readable.
> 
> On the second thought, I bet this stuff is not SOF specific and if
> so, 
> being more strict may prove more informative than being so explicit
> - 
> reference to HDA spec/ kernel HDA documentation etc.
> 
> > +	mask = status ? status : hda->hda_codec_mask;
> > +
> > +	list_for_each_codec(codec, hbus)
> > +		if (mask & BIT(codec->core.addr))
> > +			schedule_delayed_work(&codec->jackpoll_work,
> > +					      codec-
> > >jackpoll_interval);
> > +
> > +	/* disable controller Wake Up event*/
> > +	snd_hdac_chip_writew(bus, WAKEEN,
> > +			     snd_hdac_chip_readw(bus, WAKEEN) &
> > +			     ~hda->hda_codec_mask);
> 
> Any reason for not using snd_hdac_chip_updatew?
Thanks, Cezary for the feedback. We're working to optimize the jack
detection logic during runtime suspend. Let me get back with a v2 and
address your concerns.

Thanks,
Ranjani

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
