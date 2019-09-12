Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E21B0E92
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 14:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F7E174A;
	Thu, 12 Sep 2019 14:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F7E174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568290113;
	bh=GdcHUjxL0ixal7YNC5DieQqQVQts7rLweZJ6qvNw8mY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTYQ0eAtylKK/Qd3nd6BDAU5CwdmbKfpTNAidaGGjEEMTtDjYAPlJZO2reT+eKHbr
	 cmrEoL5JfOaNfLk3kcW8y9WcC8KWbQ2bTciSTUHSBLE1GM/QHTZwiuk1RpCw/DuRLk
	 FARcfFZBHFo0/lxrhYwZD+/0OZ5ZXtrjgHSG8DAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53653F80368;
	Thu, 12 Sep 2019 14:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49A5DF80368; Thu, 12 Sep 2019 14:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 297B4F801ED
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 14:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 297B4F801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 05:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="197210279"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2019 05:06:38 -0700
Date: Thu, 12 Sep 2019 15:06:37 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <92a31430-824a-8b8a-cdb4-602184db7def@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1909121453350.16459@zeliteleevi>
References: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
 <20190910182916.29693-5-kai.vehmanen@linux.intel.com>
 <92a31430-824a-8b8a-cdb4-602184db7def@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 04/10] ASoC: SOF: Intel: add support for
 snd-hda-codec-hdmi
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

On Tue, 10 Sep 2019, Pierre-Louis Bossart wrote:
> > --- a/sound/soc/sof/intel/hda-codec.c
> > +++ b/sound/soc/sof/intel/hda-codec.c
> > @@ -84,6 +84,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int
[...]
> > +	/*
> > +	 * if common HDMI codec driver is not used, codec load
> > +	 * is skipped here and hdac_hdmi is used instead
> > +	 */
> > +	if ((mach_params && mach_params->common_hdmi_codec_drv) ||
> > +	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
> >   		hdev->type = HDA_DEV_LEGACY;
> >   		hda_codec_load_module(&hda_priv->codec);
> 
> This part is might be problematic. For SoundWire stuff, I had to move all the
> machine detection part out of hda_init_caps() and at the end of hda_dsp_probe.
> It's not final since I am still trying to figure out what the earliest time I
> can power-up the SoundWire IP is, but it would help if you don't make strong
> assumptions on when mach_params is set. The fact that all this code is
> currently in hda_init_caps() is not really by design, more because of
> incremental code changes.

hmm. Currently the settings part of 'common_hdmi_codec_drv' is in in 
init_caps, just before call to hda_codec_probe_bus() (which uses the 
flag). There are also other fields set there (like 
mach_params->codec_mask), so issues should apply to codec_mask passing as 
well. I.e. if functionality is moved out from init_caps, the call to bus 
probe should be moved as well.

Other options to pass the flag do not seem good. We don't want to add hw 
specific stuff like this to snd_sof_dev or hdac_bus (latter used to pass 
"codec_mask"). If this becomes an issue, maybe we just need an explicit 
parameter to hda_codec_probe_bus(), and/or move the module parameter 
directly to intel/hda-codec.c. Both are a bit ugly, but at least contained 
in the "sof/intel/" subfolder.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
