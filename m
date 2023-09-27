Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1917B3EFC
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21F7ED6;
	Sat, 30 Sep 2023 10:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21F7ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061291;
	bh=7ofPMqqF7hKZ/KNvv5khNQVnRR72QWJfnsa0KqMkttc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=baDk+vGH7tkcXPciWCTofdYSm78gKiZpjW7OEff5JguSpmMEBDLHo//U+FM7cl80s
	 tuf9eMG+1eX3ccnsqm8/ARxwhZJtfyf/ulY1yf+r+f/wpJtaBuc/WWub+4dUvTklLp
	 uLL7Ym6b+2Mcln4NplKOQ9t4F2Ge6tDQvmxoRgQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88AE9F805D6; Sat, 30 Sep 2023 10:06:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8D57F805E2;
	Sat, 30 Sep 2023 10:06:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E43DAF8016A; Wed, 27 Sep 2023 11:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id BE76AF800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 11:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE76AF800AA
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978120:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Wed, 27 Sep 2023 17:46:38 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 27 Sep
 2023 17:46:37 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 27 Sep 2023 17:46:37 +0800
Date: Wed, 27 Sep 2023 17:46:37 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Allen Lin
	<allen_lin@richtek.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: rtq9128: Add TDM data source selection
Message-ID: <20230927094637.GA25905@linuxcarl2.richtek.com>
References: <1695780376-32301-1-git-send-email-cy_huang@richtek.com>
 <ZRPyMolOIjLBWXPC@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRPyMolOIjLBWXPC@finisterre.sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MailFrom: prvs=1631658C43=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZXDVMG3UWFXZFJCSRIU2XYPX46PZYF7A
X-Message-ID-Hash: ZXDVMG3UWFXZFJCSRIU2XYPX46PZYF7A
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:06:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXDVMG3UWFXZFJCSRIU2XYPX46PZYF7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 27, 2023 at 11:13:22AM +0200, Mark Brown wrote:
> On Wed, Sep 27, 2023 at 10:06:16AM +0800, cy_huang@richtek.com wrote:
> 
> > Since rtq9128 can support 4 channel I2S mode audio data, there are two
> > dedicated data input pins for CH12 and CH34.  But in TDM mode, input
> > source was already drived on one data pin for multiple data slots. In
> > this case, only one input source is needed for TDM mode.
> > 
> > This patch is to add the data source pin selection for CH12 and CH34.
> 
> > +	SOC_ENUM("CH12 TDM Data Select", rtq9128_ch12_tdm_data_select_enum),
> > +	SOC_ENUM("CH34 TDM Data Select", rtq9128_ch34_tdm_data_select_enum),
> 
> Is this something that's going to be changing dynamically at runtime or
> should this be a device property that's set either by firmware or when
> we're doing the TDM setup?  This sounds like something I'd expect to be
> fixed by the board design.

I may think one case if ASoC platform support multiple data source outputs
that share the same bck/lcrk on different data pin. If it can be dynamically
adjusted for the scenarios, this will keep the flexibility for the differet
platform design.

Like as in most codecs, there could be mux design that can use to choose the 
dedicated data input. If we fixed in device property, the flexibility will be
missing. It's our original thought to have the control for the data select
mutiplexer.
