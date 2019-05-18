Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93462245F
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 19:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5CD167A;
	Sat, 18 May 2019 19:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5CD167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558202149;
	bh=o0vaTlxBnqxs2GyR3GyN8uduPKQqVG9AozZYvqhBObg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQNHoTwIuZYe3P0y29gxtx87qPgGpqOjMr6Ha9/8UdNQtRtFMQHT282dKp/AOA/M2
	 9gzYWvJA2q4RA+3Ka4y2mmQyrDMzA5ggTJkj69LSo1+/PzGDNzxI6IIXhlv0xWoMN6
	 AXZj/BUhWcdPJEi9YuprCbkQ/BspNTIFwaKyufDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FDDF896B9;
	Sat, 18 May 2019 19:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DCE6F896B9; Sat, 18 May 2019 19:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EE8AF80C18
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 19:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EE8AF80C18
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 10:54:45 -0700
X-ExtLoop1: 1
Received: from jkwan-mobl.amr.corp.intel.com ([10.255.90.170])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 10:54:44 -0700
Message-ID: <7b48709fa2fa360d4425f07261e218b429383b9f.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Vinod Koul <vkoul@kernel.org>
Date: Sat, 18 May 2019 10:54:44 -0700
In-Reply-To: <c1fb57af-0710-98ca-9cc2-05e14dd221ac@linux.intel.com>
References: <87h89t39t6.wl-kuninori.morimoto.gx@renesas.com>
 <c1fb57af-0710-98ca-9cc2-05e14dd221ac@linux.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-pcm: fixup try_module_get()
 calling timing
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

On Fri, 2019-05-17 at 08:22 -0500, Pierre-Louis Bossart wrote:
> 
> On 5/17/19 1:08 AM, Kuninori Morimoto wrote:
> > 
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > soc_pcm_components_open() try to call try_module_get()
> > based on component->driver->module_get_upon_open.
> > But, it should be always called, not relatead to .open callback.
> > It should be called at (A) istead of (B)
> > 
> > => (A)
> > 	if (!component->driver->ops ||
> > 	    !component->driver->ops->open)
> > 		continue;
> > => (B)
> > 	if (component->driver->module_get_upon_open &&
> > 	    !try_module_get(component->dev->driver->owner)) {
> > 		...
> > 	}
> > 
> > 	ret = component->driver->ops->open(substream);
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > Mark, Pierre-Louis, Vinod, Liam
> > 
> > I think this patch is correct, but I'm not sure.
> > I'm happy if someone can confirm it.
> 
> The try_module_get()/module_put() mechanism is based on the
> assumption 
> that the .open and .close callbacks are both mandatory.
Hi Pierre,
But is this enforced? We could end up doing a try_module_get() without
checking if there is a close callback in which case we'd never do the
module_put(), isnt it?

Thanks,
Ranjani
> 
> open flow:
> 		if (!component->driver->ops ||
> 		    !component->driver->ops->open)
> 			continue;
> 
> 		if (component->driver->module_get_upon_open &&
> 		    !try_module_get(component->dev->driver->owner)) {
> 			ret = -ENODEV;
> 			goto module_err;
> 		}
> 
> 		ret = component->driver->ops->open(substream);
> 
> close flow:
> 		if (!component->driver->ops ||
> 		    !component->driver->ops->close)
> 			continue;
> 
> 		component->driver->ops->close(substream);
> 
> 		if (component->driver->module_get_upon_open)
> 			module_put(component->dev->driver->owner);
> 
> it'd be odd to allow the refcount to be increased when there is no 
> .open, since if there is no .close either then the refcount never
> decreases.
> 
> > 
> > 
> >   sound/soc/soc-pcm.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> > index 7737e00..7b4cda6 100644
> > --- a/sound/soc/soc-pcm.c
> > +++ b/sound/soc/soc-pcm.c
> > @@ -440,10 +440,6 @@ static int soc_pcm_components_open(struct
> > snd_pcm_substream *substream,
> >   		component = rtdcom->component;
> >   		*last = component;
> >   
> > -		if (!component->driver->ops ||
> > -		    !component->driver->ops->open)
> > -			continue;
> > -
> >   		if (component->driver->module_get_upon_open &&
> >   		    !try_module_get(component->dev->driver->owner)) {
> >   			dev_err(component->dev,
> > @@ -452,6 +448,10 @@ static int soc_pcm_components_open(struct
> > snd_pcm_substream *substream,
> >   			return -ENODEV;
> >   		}
> >   
> > +		if (!component->driver->ops ||
> > +		    !component->driver->ops->open)
> > +			continue;
> > +
> >   		ret = component->driver->ops->open(substream);
> >   		if (ret < 0) {
> >   			dev_err(component->dev,
> > 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
