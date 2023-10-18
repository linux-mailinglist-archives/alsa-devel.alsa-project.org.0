Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899BD7CFC2F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:12:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7A71FE;
	Thu, 19 Oct 2023 16:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7A71FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724774;
	bh=+b6MrpibNwRDkAxbGe5094fEFInCK5bTh3PC1pcYnDc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hrPBNWLNQaVt2II4TtrS2I2wcmzD66jLvs3dlPuFxhVTFepYQKueM8VX2T7I98F8L
	 lXfkqUlIfbY46Hs0fM3G5flB9r2sTVQB6wN+llkt4ElAmbtbLBQsufL/1inPGM1EL9
	 zgdonQWllpM19vT2369XfoxwHQqJpv1HV6qNUkHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19AAF805B5; Thu, 19 Oct 2023 16:10:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F069AF805B5;
	Thu, 19 Oct 2023 16:10:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE929F8025F; Wed, 18 Oct 2023 08:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89E2EF80236
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 08:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89E2EF80236
Received: from p200300ccff145f001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff14:5f00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qszw7-00580I-U3; Wed, 18 Oct 2023 08:21:44 +0200
Date: Wed, 18 Oct 2023 08:21:42 +0200
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
Message-ID: <20231018082142.5b7d3ad5@aktux>
In-Reply-To: <20231018052345.GK34982@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
	<20230705190324.355282-2-andreas@kemnade.info>
	<7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
	<20230920063353.GQ5285@atomide.com>
	<dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
	<20230921121626.GT5285@atomide.com>
	<20231006102348.GK34982@atomide.com>
	<20231006213003.0fbac87a@aktux>
	<20231007062518.GM34982@atomide.com>
	<20231015234815.637f5c14@aktux>
	<20231018052345.GK34982@atomide.com>
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
Message-ID-Hash: QLCZ267Y6ZJZ2DWTIULLPXQNLDJKYI5R
X-Message-ID-Hash: QLCZ267Y6ZJZ2DWTIULLPXQNLDJKYI5R
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:10:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLCZ267Y6ZJZ2DWTIULLPXQNLDJKYI5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 18 Oct 2023 08:23:45 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [231015 21:48]:
> > On Sat, 7 Oct 2023 09:25:18 +0300
> > Tony Lindgren <tony@atomide.com> wrote:  
> > > If so then the following might be a fix, not familiar with runtime PM
> > > done by ASoC though and not sure if some kind of locking would be
> > > needed here.
> > >   
> > just checked: that one fixes the regression. runtime suspends again.  
> 
> OK good to hear. So is there some fixes tag for this one or where did this
> start happening? I'm not quite following how the dropping of platform data
> could have affected this, maybe it just hid the problem because of
> returning early?
> 
yes I think so. From a perspective of OMAP[45] mith McBSP in master mode,
applying  "clk: ti: Fix missing omap4 mcbsp functional clock and aliases"
on top of "ASoC: ti: omap-mcbsp: Ignore errors for getting  fck_src"
is a regression. For everyone else not. So 
"clk: ti: Fix missing omap4 mcbsp functional clock and aliases"
did uncover a hidden problem, but of course it is the right step
forward.

Regards
Andreas
