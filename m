Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E081B09BB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:41:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1FA91682;
	Mon, 20 Apr 2020 14:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1FA91682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587386514;
	bh=s5e1VqW0QjnRLNCatIsR5iwN4mlQmQpPwxVQvj0oYho=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCcs4KggboMdAzUoHUTtFmaEvn1vXj2EpIRn+moj1p9bo55MscN3bk3TxbEu4krqW
	 Qelf/MJ9ujbY4ZOBDsxVY9JYdzNHbWHFm+x05jJMBN90a5FISQ5DtiuqJ1IoRAkR2H
	 /Cz7A6kRWgXeRL325sE32AIrj2Oo3VKljWHt0Kw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DD2BF8020C;
	Mon, 20 Apr 2020 14:40:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACBB9F801D9; Mon, 20 Apr 2020 14:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB9A5F800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB9A5F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Z97oOiuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587386405;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=oXxexsYRDtOPrQZEnq+PZd0z9qABoPhwVIqisTt12NI=;
 b=Z97oOiuS0wQGDKgJg5u6YSo9zvxFoMm8QxBtFzwt4XQznn4vF8VX6VqSxq+IYEU7j3
 BLLZSJ7kCSvGUIl4WvGdBvTiaIsUq1pcd13k8Rq4yK/3kgJQo4Wm/0iKLO2iyxGZ+iB2
 ifSTT57j9n4JCMMFvr7h6EPAkuPE1cM2bp3uJhp61gwju78W+AiY/uYQrfUN4dh+knbX
 Rvx5hlkFgbq9ZSr4apW3BF7+yHQGqtukG6ty5rwL9k6P/FJ6FBdQNj/Fll2KryD1LPWY
 pOIYJi4gyNN+3v8VE9x6vPn05HpZQLLEuDONZEpYHx7iYTS9I5RvgDiAShe6DUm3WR0v
 qXqw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/HYoo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
 with ESMTPSA id I0a766w3KCe4FsW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 20 Apr 2020 14:40:04 +0200 (CEST)
Date: Mon, 20 Apr 2020 14:39:59 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qdsp6: fix default FE dais and routings.
Message-ID: <20200420123959.GA171069@gerhold.net>
References: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
 <20200417112455.GA7558@gerhold.net>
 <03d0d14c-d52c-460b-0232-184156f62eb7@linaro.org>
 <20200417153534.GA65143@gerhold.net>
 <0f4db56a-70c8-37c1-9c18-847a75b60444@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f4db56a-70c8-37c1-9c18-847a75b60444@linaro.org>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Mon, Apr 20, 2020 at 09:32:18AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 17/04/2020 16:35, Stephan Gerhold wrote:
> > On Fri, Apr 17, 2020 at 02:02:08PM +0100, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 17/04/2020 12:24, Stephan Gerhold wrote:
> > > > Hi Srini,
> > > > 
> > > > On Wed, Mar 11, 2020 at 06:04:20PM +0000, Srinivas Kandagatla wrote:
> > > > > QDSP6 Frontend dais can be configured to work in rx or tx or both rx/tx mode,
> > > > > however the default routing do not honour this DT configuration making sound
> > > > > card fail to probe. FE dais are also not fully honouring device tree configuration.
> > > > > Fix both of them.
> > > > > 
> > > > 
> > > > I discovered this patch set when QDSP6 audio stopped working after
> > > > upgrading to Linux 5.7-rc1. As far as I understand, device tree bindings
> > > > should attempt to be backwards compatible wherever possible.
> > > > This isn't the case here, although this is not the reason for my mail.
> > > > (I don't mind updating my device tree, especially since it is not
> > > > upstream yet...)
> > > > 
> > > > I have a general question about the design here.
> > > > 
> > > > I understand the original motivation for this patch set: Attempting to
> > > > configure a TX/RX-only DAI was not possible due to the default routing.
> > > > In my opinion this is only relevant for the compressed DAI case.
> > > > 
> > > > If we ignore the compressed DAIs for a moment (which can be
> > > > unidirectional only), I think we shouldn't care how userspace uses the
> > > > available FE/MultiMedia DAIs. We have this huge routing matrix in q6routing,
> > > > with 800+ mixers that can be configured in any way possible from userspace.
> > > > 
> > > > In "ASoC: qdsp6: q6asm-dai: only enable dais from device tree" you mention:
> > > > 
> > > > > This can lead to un-necessary dais in the system which will never be
> > > > > used. So honour whats specfied in device tree.
> > > > 
> > > > but IMO the FE DAIs are a negligible overhead compared to the routing
> > > > matrix and the many BE DAIs that are really never going to be used
> > > > (because nothing is physically connected to the ports).
> > > 
> > > Two things, one unnecessary mixers, second thing is we need to know how many
> > > FE dais are in the system, which should be derived from the number of dai
> > > child nodes. These can potentially be SoC specific or firmware specific.
> > > 
> > 
> > So there are SoCs/firmwares that just support e.g. MultiMedia1-4 and not
> > all 8 MultiMedia FE DAIs?
> > 
> 
> This all depends on vendor customization to the firmware.
> Normally Q6ASM supports up to 8 concurrent streams.
> 

I see, thank you!

> > > My plan is to cleanup the BE DAIs as well!, any patches welcome!
> > > 
> > > > 
> > > > Even if you restrict FE DAIs to RX/TX only, or disable them entirely,
> > > 
> > > I think this is mistake from myside. Alteast according to bindings direction
> > > property is only "Required for Compress offload dais", code should have
> > > explicitly ignored it. Here is change that should fix it.
> > > 
> > 
> > This would make the MultiMedia1-3 bi-directional in sdm845-db845c,
> > but MultiMedia5-8 would still be disabled.
> > 
> > My question here would then be similar as above:
> > Is this an arbitrary selection of a reasonable amount of FE DAIs,
> > or actually based on some firmware limitations?
> Yes, it is purely firmware limitation.
> 
> > 
> > As I described in the rest of my mail (below your diff),
> > before this patch set it was simple to just expose all 8 FE DAIs.
> > At least on MSM8916 all of them work in exactly the same way,
> > there is no difference between any of them.
> > 
> > If we list what is working in SoC/firmware in the device tree,
> > would I just list all 8 FE DAIs?
> 
> That is the direction, which should also include any dai specific properties
> like compressed case.
> 
> > 
> > Basically I'm still trying to understand why we limit the number of
> > FE/MultiMedia DAIs that we expose, when all of them would be working
> > fine. :)
> I don't think we need to limit this from Linux side, but Its important to
> take care of the max allowed Q6ASM dais w.r.t DSP.
> 

I think the approach you added in this patch set makes sense if there
are DSP firmwares that offer less FE/MultiMedia DAIs.

For the future it would be nice if we could make this less "confusing"
by hiding/removing the invalid mixers, e.g. if you have only
MultiMedia1 enabled you don't see all the mixers for MultiMedia2-8.
For that it doesn't matter if we do it in q6routing (might become
quite complex with all the macros there), or in a generic way by walking
the DAPM graph as Mark mentioned.

I was also thinking if we can somehow restore the default routing
in a conditional way, so that you don't need to duplicate the
information in the device tree:

  e.g. right now you need to add

	&q6asm {
		dai@0 {
			reg = <0>;
		};
	};

  *and* the routing

	sound {
		audio-routing =
			"MM_DL1", "MultiMedia1 Playback",
			"MultiMedia1 Capture", "MM_UL1";
	};

When I made these changes I needed several tries until I had it correct,
because sometimes I forgot one of the routes, sometimes I mixed up some
numbers etc. And especially when you add all 8 FE DAIs this becomes
really noisy for an information that we could (theoretically) infer
only based on the part under &q6asm.

I will think about it some more and see if I come up with something nice.

Thanks,
Stephan

> > > --------------------------->cut<---------------------------------
> > > diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c
> > > b/sound/soc/qcom/qdsp6/q6asm-dai.c
> > > index 125af00bba53..31f46b25978e 100644
> > > --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> > > +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> > > @@ -1067,6 +1067,11 @@ static int of_q6asm_parse_dai_data(struct device
> > > *dev,
> > >                  dai_drv = &pdata->dais[idx++];
> > >                  *dai_drv = q6asm_fe_dais_template[id];
> > > 
> > > +               if (of_property_read_bool(node, "is-compress-dai"))
> > > +                       dai_drv->compress_new = snd_soc_new_compress;
> > > +               else
> > > +                       continue;
> > > +
> > >                  ret = of_property_read_u32(node, "direction", &dir);
> > >                  if (ret)
> > >                          continue;
> > > @@ -1076,8 +1081,6 @@ static int of_q6asm_parse_dai_data(struct device *dev,
> > >                  else if (dir == Q6ASM_DAI_TX)
> > >                          dai_drv->playback = empty_stream;
> > > 
> > > -               if (of_property_read_bool(node, "is-compress-dai"))
> > > -                       dai_drv->compress_new = snd_soc_new_compress;
> > >          }
> > > 
> > >          return 0;
> > > 
> > > --------------------------->cut<---------------------------------
> > > 
> > > Thanks,
> > > srini
> > > 
> > > > all the routing mixers still exist for them. They will just result in
> > > > configurations that are not usable in any way. IMO the only thing we
> > > > gain by restricting the FE DAIs is that the available mixers no longer
> > > > match possible configurations.
> > > > 
> > > > Before this patch set I used a slightly different approach in my device
> > > > tree for MSM8916: I kept all FE DAIs bi-directional, and added DAI links
> > > > for all of them. This means that I actually had 8 bi-directional PCM
> > > > devices in userspace.
> > > > 
> > > > I didn't use all of them - my ALSA UCM configuration only uses
> > > > MultiMedia1 for playback and MultiMedia2 for capture.
> > > > However, some other userspace (let's say Android) could have chosen
> > > > different FE DAIs for whatever reason. We have the overhead for the
> > > > routing matrix anyway, so we might as well expose it in my opinion.
> > > > 
> > > > My question is: In what way are the FE DAIs really board-specific?
> > > > 
> > > > If we expose only some FE DAIs with intended usage per board,
> > > > e.g. MultiMedia1 for HDMI, MultiMedia2 for slimbus playback,
> > > >        MultiMedia3 for slimbus capture,
> > > > I could almost argue that we don't need DPCM at all.
> > > > The FE DAIs are always going to be used for the same backend anyway.
> > > > 
> > > > This is a bit exaggerated - for example if you have a single compress
> > > > DAI per board you probably intend to use it for both HDMI/slimbus.
> > > > But this is the feeling I get if we configure the FE DAIs separately
> > > > for each board.
> > > > 
> > > > I wonder if we should leave configuration of the FE DAIs up to userspace
> > > > (e.g. ALSA UCM), and expose the same full set of FE DAIs for each board.
> > > > 
> > > > I think this is mostly a matter of convention for configuring FE DAIs
> > > > in the device tree - I have some ideas how to make that work
> > > > with the existing device tree bindings and for compressed DAIs.
> > > > But this mail is already long enough as-is. ;)
> > > > 
> > > > I also don't mind if we keep everything as-is
> > > > - I just wanted to share what I have been thinking about.
> > > > 
> > > > What do you think?
> > > > 
> > > > Thanks for reading! ;)
> > > > Stephan
> > > > 
> > > > > Originally  issue was reported by Vinod Koul
> > > > > 
> > > > > Srinivas Kandagatla (2):
> > > > >     ASoC: qdsp6: q6asm-dai: only enable dais from device tree
> > > > >     ASoC: qdsp6: q6routing: remove default routing
> > > > > 
> > > > >    sound/soc/qcom/qdsp6/q6asm-dai.c | 30 +++++++++++++++++++++++-------
> > > > >    sound/soc/qcom/qdsp6/q6routing.c | 19 -------------------
> > > > >    2 files changed, 23 insertions(+), 26 deletions(-)
> > > > > 
> > > > > -- 
> > > > > 2.21.0
> > > > > 
