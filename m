Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60635203E88
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 19:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA67A1710;
	Mon, 22 Jun 2020 19:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA67A1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592848579;
	bh=uGUqHNYQMlZfV77taVRX1dlQ31m7F3RDwATU0BzpX4U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ix0QxZ4wkzDhoW01HbTbqV97Ok4IABwGA2v4UWIk5OPfAtjyI6mGqubqdomZNMDi/
	 N4SpLrNPuCJKF6JmRFl2TTwA0eXeL3hWgg+g9QQ0OdiuOAXgv7Chv6i08zcZG2tM1r
	 xA5YM/jmVJCxJWeqcJgKlKg7U1Gd2xL8+kO6AOEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A7D8F8010D;
	Mon, 22 Jun 2020 19:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9686AF8015B; Mon, 22 Jun 2020 19:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98276F8010D
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 19:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98276F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="I7bLO9lH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592848470;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=oCr6AOnb5631o7vYirZq7zrjVtC+bPuwmPg15eBKCHo=;
 b=I7bLO9lHgY7vM1pgjN7+CqshzEmWZSGmwes3DN/T6wmiiwt4JvJhW8GWAgBg0EtbwD
 iF/4VLwqJT5d2k/BFfb3TNNhy+8cUL1tyoBOw6Z9e9P4ZVPRQPcE7UXgKjYVbkTc4kWE
 KWrGJMaTeSpn0YAR72LgF+dUzOd13t2fKkRxIDeyKa3Rkt0yBM7FSm4z/5sc/t/oswmD
 +hZNjLoxl/yeCwkVtg1elxvAYQsJnpQSLYy7N/YmSXVQN7L705RJXnCGIMywXGie10FG
 8DnsRcCnIisclw5giL7amhzKvhTtaJYEbfAq4oBOegQtU0Ut9/mqQNxSTHMl1P9ZuAxs
 HB3g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczHboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 6005e9w5MHsS6UR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 22 Jun 2020 19:54:28 +0200 (CEST)
Date: Mon, 22 Jun 2020 19:54:23 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200622175423.GA8907@gerhold.net>
References: <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616155544.GA8891@gerhold.net>
 <7cbc9233-e5f2-03e0-5659-cf22dea75e53@linux.intel.com>
 <45d43cc9-be22-a7d2-1628-3fb30232bd7c@linux.intel.com>
 <20200617090112.GA38317@gerhold.net>
 <62ccb59f-9d08-c241-952b-bb7af8311618@linux.intel.com>
 <20200617174635.GA40060@gerhold.net>
 <20200618150143.GJ5789@sirena.org.uk>
 <145da893-5cb4-63fc-b988-c048ee839785@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <145da893-5cb4-63fc-b988-c048ee839785@linux.intel.com>
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

On Thu, Jun 18, 2020 at 10:45:45AM -0500, Pierre-Louis Bossart wrote:
> On 6/18/20 10:01 AM, Mark Brown wrote:
> > On Wed, Jun 17, 2020 at 07:46:35PM +0200, Stephan Gerhold wrote:
> > 
> > > At the end the question is if those machine drivers that have
> > > dpcm_playback/capture hardcoded just set it because it was required to
> > > make DPCM work, or if they actually use it to restrict the direction of
> > > a DAI link.
> 
> I think those flags are absolutely not DPCM specific, the only use I see for
> the flags is to set:
> 
> 	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
> 		if (playback)
> 			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
> 		if (capture)
> 			pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
> 		goto out;
> 	}
> 
> and that's why I highlighted some time back that they are probably redundant
> with capture_only and playback_only. We don't need 4 flags to specify 2
> directions.
> 
> In all cases the use for those flags seems to be to restrict the direction
> of a DAI link.
> 
> Note that people can screw-up the configurations without DPCM, e.g. by not
> setting capture_only for a microphone, I found last week a WoV DAI link on
> Broadwell where the capture_only flag was not set... DPCM does not have a
> monopoly on brokenness...
> 
> > The other question would be if they are restricting it to limit the
> > direction of a DAI link beyond the limits that the hardware has why are
> > they doing that?  I'm not sure that'd be a sensible thing to do.
> 
> I don't see any such case. When both directions are not set, it's only
> because the hardware is only capable of one, e.g. dmic, HDMI or SoundWire.
> 

If we end up simplifying those flags, and eventually removing
dpcm_playback/capture entirely, wouldn't it be the easiest solution to
just relax the error checks for 5.8? (Like the diff I suggested?)

Pierre's diff to set dpcm_playback/capture correctly for
simple-audio-card etc would work too, but I'm not sure if this is worth
it if we end up removing those anyway.

Thanks,
Stephan
