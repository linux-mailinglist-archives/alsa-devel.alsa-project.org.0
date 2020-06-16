Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB01FB895
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 17:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BAB1679;
	Tue, 16 Jun 2020 17:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BAB1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592323063;
	bh=tGt4X6X5MDC+rL9QLsixkWIDZmqyYaVYA6UNXtduLNc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6nx2Cv77zyVm35wbZcRdQ1MqdKrHNZc4Gly+LF5dzjNWuj8+cMdDLfqaV9UAhwpX
	 Jwh/vYecCpAdw0GmiMHmyn7/a2NUgy1VVpjfEQ/YF0EvJOJD0HlODahOPTzGDkHpCj
	 6/RILet9jIClN97F/MaoHeJGxxqguAIwWZaBfri8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD38F80217;
	Tue, 16 Jun 2020 17:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65298F8022B; Tue, 16 Jun 2020 17:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E66F800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 17:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E66F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="BndG78KD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592322951;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/hRQtqQdPcW31VaOnz7hJpQ5gkvzVJFvwwSGWyexsGU=;
 b=BndG78KDEHkbU38hymDKYjsRk8g9tZ2I3ZVz9khiYvJr9UiynnkW+kK5cDD4HdDE/9
 KcGb5H7FGMWpD8bJaOgtJUcWmgIFNqyXroffi3ntRIEXB4q3IWctSsWtNGrt67xoKV4j
 kLGDuPJyB3GOetdPnVp3HsJFaK8gT0ZGh9WR9csNrbUCoQLaOjT1eq0eh1r9gq/zaJBc
 zczQLkToh8hIBpOznKOnO7KnUQzUOzdvjZLuH84gofy8T3Ze13krLrz/2UQSN6wVYMKY
 9ujlmwlh91jRkvf6S08KFUQZ1Sg0RfirGM8qsd+/ttT90UuCyelEMqjFUqtq/ENOZUdI
 Q+Uw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 6005e9w5GFtmVYy
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 Jun 2020 17:55:48 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:55:44 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200616155544.GA8891@gerhold.net>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net>
 <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Tue, Jun 16, 2020 at 10:05:39AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 6/16/20 9:52 AM, Mark Brown wrote:
> > On Tue, Jun 16, 2020 at 09:23:25AM -0500, Pierre-Louis Bossart wrote:
> > > On 6/16/20 4:02 AM, Stephan Gerhold wrote:
> > > > On Tue, Jun 16, 2020 at 10:54:17AM +0200, Stephan Gerhold wrote:
> > 
> > > > > For the QCOM case it may be feasible to set dpcm_playback/dpcm_capture
> > > > > appropriately because it is basically only used with one particular
> > > > > DAI driver. But simple-audio-card is generic and used with many
> > > > > different drivers so hard-coding a call into some other driver like
> > > > > Srinivas did above won't work in that case.
> > 
> > > Doesn't simple-card rely on DT blobs that can also be updated?
> > 
> > DT is an ABI just like ACPI - it's just more featureful.  Many systems
> > can easily update their DTs but not all of them and users don't always
> > want to try to keep it in lock step with the kernel.  Stuff like this is
> > why I've been dubious about putting DPCM things in there, it's too much
> > of a hard coding of internal APIs.
> 
> ok, but is there any actual use of dpcm_playback/capture outside of C code?
> 
> simple-card.c and audio-graph-card do hard-code but that's done with C in
> the driver:
> 
> 	ret = asoc_simple_parse_daifmt(dev, cpu_ep, codec_ep,
> 				       NULL, &dai_link->dai_fmt);
> 	if (ret < 0)
> 		goto out_put_node;
> 
> 	dai_link->dpcm_playback		= 1;
> 	dai_link->dpcm_capture		= 1;
> 
> 
> that that should be fixed based on the DAI format used in that dai_link - in
> other words we can make sure the capabilities of the dailink are aligned
> with the dais while parsing the DT blobs.

But how do you know which capabilities to set? The device tree doesn't
tells us that. We could add some code to look up the snd_soc_dai_driver
early, based on the references in the device tree (basically something
like snd_soc_of_get_dai_name(), see
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/soc-core.c#n2988)

At least to me that function doesn't exactly look trivial though,
and that's just to properly fill in the dpcm_playback/capture
parameters. Essentially those parameters only complicate the current
device tree use case,  where you want the DAI link to be for both
playback/capture, but restricted to the capabilities of the DAI.

Just wondering if setting up dpcm_playback/capture properly is worth it
at all in this case. This isn't necessary for the non-DPCM case either,
there we automatically set it based on the DAI capabilities.

Thanks,
Stephan
