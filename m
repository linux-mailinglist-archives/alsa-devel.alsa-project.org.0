Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084017A72E8
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 08:38:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5316822;
	Wed, 20 Sep 2023 08:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5316822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695191920;
	bh=S5W7jrUTvURed6e7jxOFTpjjwOukm4nedMawbRI8REU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZxM5orwx0V4ApdKFz0z4n337BKxRHQULGQOPP9Ghu0Tt62wznRCyxDx5X8efQugDd
	 nrLZ4Vr8FDV218XzooSilqKSblQrdHbwSdIwLFjxcLlc3daLnAjEl0ZKhohhfVknIx
	 7CJ2alY9AMCOKjgJgoU38k/UHk7dOtwdFZhR1CwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB2A0F800F4; Wed, 20 Sep 2023 08:37:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F766F801F5;
	Wed, 20 Sep 2023 08:37:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82B93F8025A; Wed, 20 Sep 2023 08:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from muru.com (muru.com [72.249.23.125])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA7CF800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 08:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BA7CF800F4
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 0E52680E0;
	Wed, 20 Sep 2023 06:33:55 +0000 (UTC)
Date: Wed, 20 Sep 2023 09:33:53 +0300
From: Tony Lindgren <tony@atomide.com>
To: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, bcousson@baylibre.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20230920063353.GQ5285@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
Message-ID-Hash: MFAHP7KWP5I3G7FX5SUN4KLHOFQQFNN7
X-Message-ID-Hash: MFAHP7KWP5I3G7FX5SUN4KLHOFQQFNN7
X-MailFrom: tony@atomide.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFAHP7KWP5I3G7FX5SUN4KLHOFQQFNN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

* Péter Ujfalusi <peter.ujfalusi@gmail.com> [230919 18:25]:
> 
> 
> On 7/5/23 22:03, Andreas Kemnade wrote:
> > Commit 349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp")
> > dropped prcm_fck for omap4,

The prcm_fck should be there in the dts for each mcbsp interconnect targe
module as "fck" alias and get's enabled/disabled when the mcbsp driver
calls runtime PM.

So maybe the description should explain that things broke as the aliases
for prcm_fck and pad_ck no longer get added.

> it also dropped the pad_fck for that matter.

OK so an alias is needed for that too.

That's the MCPDM_CLKCTRL pad_clks_ck alias, right? Seems like the
pad_clks_ck should be claimed by the mcpdm and mcbsp drivers if they are
used? I guess it would be for some external device use case?

> > so the clk_src might not be >available making the
> > clk_get(src) fail.
> 
> Wow, so OMAP4 audio is pretty broken if would ever need to select FCLK?
> By default we don't on OMAP4, but this is astonishing.

So sounds like we just got lucky because of -ENOSUCHUSERS? The mcbsp works
for me, not sure how come I'm not seeing this issue, does it now only work
for the default clock source?

Do we have some other examples for devices using other type of clocking?

> > In such cases, rely on the devicetree to assign
> > the correct parent.
> 
> You cannot rely on DT to dynamically select the FCLK parent for
> different use cases.
> The dai_set_dai_sysclk() cannot select between internal or external
> source of the reference clock and DT cannot handle this.
> If one sampling frequency is available with pad_fck while other is only
> possible with internal clock then this is no longer possible.

If the functional clock source needs to be changed, seems things
should work. The parent interconnect target module driver does not care
about the fck rate. Not sure if the clock usage count causes issues
though with reparenting, if so, sounds like reparenting needs to be
done in runtime PM suspended state to do the switch.

> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  sound/soc/ti/omap-mcbsp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> > index 21fa7b9787997..f9fe96b61852b 100644
> > --- a/sound/soc/ti/omap-mcbsp.c
> > +++ b/sound/soc/ti/omap-mcbsp.c
> > @@ -70,8 +70,8 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
> >  
> >  	fck_src = clk_get(mcbsp->dev, src);
> >  	if (IS_ERR(fck_src)) {
> > -		dev_err(mcbsp->dev, "CLKS: could not clk_get() %s\n", src);
> > -		return -EINVAL;
> > +		dev_info(mcbsp->dev, "CLKS: could not clk_get() %s\n", src);
> > +		return 0;
> 
> I would rather have some clock alias for OMAP4/5 to provide the clocks
> that we need for the fclk.
> If we did not got the clock we needed to select we cannot say that all
> is good, carry on.
> Normally the machine driver does this and it thinks that we switched
> clocks while we did not and the clocking is all wrong now.

How about someting like below to deal with getting the fck in a bit more
future proof way:

fck_src = clk_get(mcbsp->dev, src);
if (IS_ERR(fck_src)) {
	fck_src = clk_get(mcbsp->dev->parent, "fck):
	...
}

Also sounds like we should also add the missing the aliases too like Peter
pointed out if mcbsp driver needs to reparent. But just adding the alias
will possibly cause trouble for anybody adding mcbsp support for some other
SoC variant.

To me it seems in the long run the mcbsp configurations using pad_fck
should configure it in the dts for the interconnect target module node
instead as the default clock. Then mcbsp can still look up the fck
of the parent device, and change it dynamically as needed.

Regards,

Tony
