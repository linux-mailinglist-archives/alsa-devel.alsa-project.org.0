Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A337D50857F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 12:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A9C01A7C;
	Wed, 20 Apr 2022 12:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A9C01A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650449290;
	bh=NBbH5KaUdxQuLfM25jq+TYIWQ6pDnzigq1lGhN0NsWc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWrZTI3YmX7XnZQ1adZsG8mNtzX8JohLd086TIIlk5lZbe+MzFWpOmhjVfHUnAwRG
	 aXkiPW8sdYKf1RcemVY6z2DVWC6t+qy/T+dnS8gq4uzcnEKFd5JwPK3RHoHZyOm7Om
	 xbjM2av6uBvEuILg4QH/15m38hJnWxccNPMOTAKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A118DF80128;
	Wed, 20 Apr 2022 12:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF150F800C1; Wed, 20 Apr 2022 12:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F6FF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 12:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F6FF800C1
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nh7Eh-0003GG-RX; Wed, 20 Apr 2022 12:06:59 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nh7Eh-0000fi-0s; Wed, 20 Apr 2022 12:06:59 +0200
Date: Wed, 20 Apr 2022 12:06:59 +0200
From: Sascha Hauer <sha@pengutronix.de>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v3 1/6] ASoC: dmaengine: do not use a NULL
 prepare_slave_config() callback
Message-ID: <20220420100658.GU4012@pengutronix.de>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
 <20220307122202.2251639-2-codrin.ciubotariu@microchip.com>
 <20220420091552.GD2387@pengutronix.de>
 <968f9bfb-bddf-a8f0-6d8f-18b92d865aa2@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <968f9bfb-bddf-a8f0-6d8f-18b92d865aa2@microchip.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:03:21 up 20 days, 22:33, 67 users,  load average: 0.55, 0.31, 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 Nicolas.Ferre@microchip.com
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

On Wed, Apr 20, 2022 at 09:58:06AM +0000, Codrin.Ciubotariu@microchip.com wrote:
> On 20.04.2022 12:15, Sascha Hauer wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi,
> 
> Hi Sascha,
> 
> > 
> > On Mon, Mar 07, 2022 at 02:21:57PM +0200, Codrin Ciubotariu wrote:
> >> Even if struct snd_dmaengine_pcm_config is used, prepare_slave_config()
> >> callback might not be set. Check if this callback is set before using it.
> >>
> >> Fixes: fa654e085300 ("ASoC: dmaengine-pcm: Provide default config")
> >> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> >> ---
> >>
> >> Changes in v2,v3:
> >>   - none
> >>
> >>   sound/soc/soc-generic-dmaengine-pcm.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> >> index 285441d6aeed..2ab2ddc1294d 100644
> >> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> >> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> >> @@ -86,10 +86,10 @@ static int dmaengine_pcm_hw_params(struct snd_soc_component *component,
> >>
> >>        memset(&slave_config, 0, sizeof(slave_config));
> >>
> >> -     if (!pcm->config)
> >> -             prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
> >> -     else
> >> +     if (pcm->config && pcm->config->prepare_slave_config)
> >>                prepare_slave_config = pcm->config->prepare_slave_config;
> >> +     else
> >> +             prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
> >>
> >>        if (prepare_slave_config) {
> >>                int ret = prepare_slave_config(substream, params, &slave_config);
> > 
> > I wonder if this patch is correct. There are drivers like
> > sound/soc/mxs/mxs-pcm.c which call snd_dmaengine_pcm_register() with a
> > config which has the prepare_slave_config callback unset. For these
> > drivers dmaengine_pcm_hw_params() previously was a no-op. Now with this
> > patch snd_dmaengine_pcm_prepare_slave_config() and
> > dmaengine_slave_config() are called. At least for the mxs-pcm driver
> > calling dmaengine_slave_config() will return -ENOSYS.
> > 
> > At least the "Check if this callback is set before using it" part is
> > wrong, the callback is checked before using it with
> > 
> >          if (prepare_slave_config) {
> >                  ...
> >          }
> > 
> > I don't have any mxs hardware at hand to test this. I just stumbled upon
> > the change of behaviour when rebasing
> > https://patchwork.kernel.org/project/alsa-devel/patch/20220301122111.1073174-1-s.hauer@pengutronix.de/
> > on current master.
> 
> You are right. I changed the behavior from:
> if (pmc->config && !pcm->config->prepare_slave_config)
> 	<do nothing>
> to:
> if (pmc->config && !pcm->config->prepare_slave_config)
> 	snd_dmaengine_pcm_prepare_slave_config()
> 
> It was not intended and I agree that the commit message is not accurate. 
> I guess some drivers might not need dmaengine_slave_config()...
> However, in my case, for the mchp-pdmc driver, I do have pcm->config 
> with pcm->config->prepare_slave_config NULL, but I still need 
> snd_dmaengine_pcm_prepare_slave_config() to be called. Should we add a 
> separate flag to call snd_dmaengine_pcm_prepare_slave_config() if 
> pcm->config->prepare_slave_config is NULL?

Other drivers set pcm->config->prepare_slave_config to
snd_dmaengine_pcm_prepare_slave_config() explicitly:

sound/soc/fsl/imx-pcm-dma.c:33: .prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,

I think that's the way to go.

Regards,
Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
