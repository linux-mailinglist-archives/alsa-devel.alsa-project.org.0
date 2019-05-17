Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B321298
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 05:40:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E60A16C6;
	Fri, 17 May 2019 05:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E60A16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558064417;
	bh=smdUM8+N8zKrRXxyI7k5/m7D+hgG3fY7ef3YglY9/20=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D28EvZZINddUbQTPRblK2Tee+6fGVzquE+eF5QmpmL/hHyS8xBu5Dr3WvMZQZulQj
	 oeUV7r/iyPqHrg0/Bf1TO01E+zlt2+GREaDu43pCG+tRSfnAJRy5CRdFo9wLKJd6HP
	 IZlHX+X3zpXl9i2vvQIdBE7YZF7pOg/7WlvH5LlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B97E6F80759;
	Fri, 17 May 2019 05:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68C86F8968A; Fri, 17 May 2019 05:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CDBCF80759
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 05:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CDBCF80759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h2vftTu+"
Received: from localhost (unknown [122.167.103.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A57C0205C9;
 Fri, 17 May 2019 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558064304;
 bh=Inqijlo/ubtokw07cOWb7PUzdFrYCYtQJ/2gLJdFv44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h2vftTu+5LZZdenqZoyX78iVbKV7mU+pJufIgqLugOiuJCiE197AyLMg/FBpSQEjW
 3iZx/SEW9qlTIVjJzHkObm4TYYzQm1+mP6DQEoE1ogtq6mBzY1wUsywuRPE7bmXLN0
 CTKhn1z0SpKkuyIEnNseJ9HL4xaU9U2FEj0uAVlM=
Date: Fri, 17 May 2019 09:08:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190517033818.GE2707@vkoul-mobl>
References: <87mujl3n4t.wl-kuninori.morimoto.gx@renesas.com>
 <34505df5-e479-679c-7c67-ecb45d61414b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34505df5-e479-679c-7c67-ecb45d61414b@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-dpm: fixup DAI active
 unbalance
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

On 16-05-19, 22:21, Pierre-Louis Bossart wrote:
> On 5/16/19 8:21 PM, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > snd_soc_dai_link_event() is updating snd_soc_dai :: active,
> > but it is unbalance.
> > It counts up if it has startup callback.
> > 
> > 	case SND_SOC_DAPM_PRE_PMU:
> > 		...
> > 		snd_soc_dapm_widget_for_each_source_path(w, path) {
> > 			...
> > 			if (source->driver->ops->startup) {
> > 				...
> > =>				source->active++;
> > 			}
> > 			...
> > 		}
> > 		...
> > 
> > But, always counts down
> > 
> > 	case SND_SOC_DAPM_PRE_PMD:
> > 		...
> > 		snd_soc_dapm_widget_for_each_source_path(w, path) {
> > 			...
> > =>			source->active--;
> > 			...
> > 		}
> > 
> > This patch always counts up when SND_SOC_DAPM_PRE_PMD.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > Mark, Liam
> > 
> > I think this is bug, but I can't confirm it,
> > because my driver need to have .startup.
> > Thus, I added [RFC] on this patch.
> > I'm happy if someone can confirm it.

Right, seems a bug to me!

> This looks like a bug since the initial Intel contribution in 2015.
> 9b8ef9f6b3fc ('ASoC: dapm: Add startup & shutdown for dai_links') already
> has this imbalance.

Well yes this would be seen if someone has a dai_link without the
startup and shutdown calls (which is not mandatory). Agreed that it was
a miss to not put counters in right places.
> 
> I don't have a clue why this is not symmetric or not done as suggested by
> Morimoto-san. Vinod, any idea?

Since while testing we always had the calls and never run in imbalance,
but we should have done better!

I think you should be able to test it on Intel platforms with dai_links
and removing the optional calls.

The change looks fine to be

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> >   sound/soc/soc-dapm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> > index c864502..147ad9d 100644
> > --- a/sound/soc/soc-dapm.c
> > +++ b/sound/soc/soc-dapm.c
> > @@ -3828,8 +3828,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
> >   						ret);
> >   					goto out;
> >   				}
> > -				source->active++;
> >   			}
> > +			source->active++;
> >   			ret = soc_dai_hw_params(&substream, params, source);
> >   			if (ret < 0)
> >   				goto out;
> > @@ -3850,8 +3850,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
> >   						ret);
> >   					goto out;
> >   				}
> > -				sink->active++;
> >   			}
> > +			sink->active++;
> >   			ret = soc_dai_hw_params(&substream, params, sink);
> >   			if (ret < 0)
> >   				goto out;
> > 

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
