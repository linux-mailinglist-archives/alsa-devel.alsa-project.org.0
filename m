Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABE7CFC0D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:07:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8712B836;
	Thu, 19 Oct 2023 16:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8712B836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724426;
	bh=Yqq9RZtF31/xwd6QCXwjXF5pY3ODZCnNCiOSuSnZdKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pCnzunp7LGLlJReKVQVkNJPLcMwSXsXZ/5Fs9aKqluWvn8eIp/NEpFP8siuqxg6/5
	 1dQB3kmlPkBGwXXyguozGcADWDwCEoLGS/0Dg+8jc5sCPuojH8kt0cEZSm6xekzZJ7
	 tBCRLV0R6Xlvxcome9wx+igy9Nz6pPYmvKfyPqYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13ED8F80568; Thu, 19 Oct 2023 16:05:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7674F8055A;
	Thu, 19 Oct 2023 16:05:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDE78F8025F; Sun, 15 Oct 2023 23:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.andi.de1.cc (unknown [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED6D1F80166
	for <alsa-devel@alsa-project.org>; Sun, 15 Oct 2023 23:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6D1F80166
Received: from p5dc58b95.dip0.t-ipconnect.de ([93.197.139.149] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qs8y9-0052jb-1N; Sun, 15 Oct 2023 23:48:17 +0200
Date: Sun, 15 Oct 2023 23:48:15 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
 bcousson@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20231015234815.637f5c14@aktux>
In-Reply-To: <20231007062518.GM34982@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
	<20230705190324.355282-2-andreas@kemnade.info>
	<7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
	<20230920063353.GQ5285@atomide.com>
	<dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
	<20230921121626.GT5285@atomide.com>
	<20231006102348.GK34982@atomide.com>
	<20231006213003.0fbac87a@aktux>
	<20231007062518.GM34982@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: andreas@kemnade.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IPJUFXXIVCE2KGO4F5QZSDNVOVYH42TC
X-Message-ID-Hash: IPJUFXXIVCE2KGO4F5QZSDNVOVYH42TC
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:05:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPJUFXXIVCE2KGO4F5QZSDNVOVYH42TC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Tony,

On Sat, 7 Oct 2023 09:25:18 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [231006 19:30]:
> > On Fri, 6 Oct 2023 13:23:48 +0300
> > Tony Lindgren <tony@atomide.com> wrote:  
> > > Here's what I think the regression fix for omap4 clocks would be, the
> > > old main_clk is not the same as the module clock that we get by default.
> > > If this looks OK I'll do a similar fix also for omap5.
> > > 
> > > Or is something else also needed?
> > >   
> > 
> > hmm,
> > audio output works, the waring is away, but something new is here:  
> 
> OK good to hear it works, I'll send out fixes for omap4 and 5, seems
> the runtime PM warning is something different.
> 
> > omap-mcbsp 40124000.mcbsp: Runtime PM usage count underflow!
> > # cat /sys/bus/platform/devices/40124000.mcbsp/power/runtime_status 
> > active
> > 
> > even with no sound.  
> 
> I guess if the mcbsp instance is not used, runtime PM is enabled but
> pm_runtime_resume_and_get() is never called by ASoC?
> 
> If so then the following might be a fix, not familiar with runtime PM
> done by ASoC though and not sure if some kind of locking would be
> needed here.
> 
just checked: that one fixes the regression. runtime suspends again.

Regards,
Andreas
