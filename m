Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9587B3F16
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:14:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10B95829;
	Sat, 30 Sep 2023 10:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10B95829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061659;
	bh=pZt2ORMloIQ68kI3viFoZaFl6tVUdPEThfvXwOxXfK4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S678tThdy3h2yyxRM8W1bgHy/2T/CXr/3JJrtU14MT/1IbFctfF0mx9rtxYHQ6Msf
	 2QYro7lCuiJyx5heaRAsntThNFvtLmmYOPwJhwJXP3vlBMd0hWr/43imGXbc5hmpu/
	 Xkd0fG8C4m6PmJXE1t5J5RHac59xPbgF0R2VPZDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B467F8055A; Sat, 30 Sep 2023 10:12:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71406F80558;
	Sat, 30 Sep 2023 10:12:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93FA2F801D5; Thu, 28 Sep 2023 04:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CC98F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 04:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC98F8007C
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978092:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Thu, 28 Sep 2023 10:03:00 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 28 Sep
 2023 10:03:00 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Thu, 28 Sep 2023 10:03:00 +0800
Date: Thu, 28 Sep 2023 10:03:00 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Allen Lin
	<allen_lin@richtek.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: rtq9128: Add TDM data source selection
Message-ID: <20230928020300.GA18024@linuxcarl2.richtek.com>
References: <1695780376-32301-1-git-send-email-cy_huang@richtek.com>
 <ZRPyMolOIjLBWXPC@finisterre.sirena.org.uk>
 <20230927094637.GA25905@linuxcarl2.richtek.com>
 <ZRP9Aw904ynL5Se/@finisterre.sirena.org.uk>
 <20230927101948.GA27975@linuxcarl2.richtek.com>
 <ZRQDzZG7PPovUIsf@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRQDzZG7PPovUIsf@finisterre.sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MailFrom: prvs=1631658C43=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PTBOOQRXCCXQOEHMHLU6RU3FAW3KEL7V
X-Message-ID-Hash: PTBOOQRXCCXQOEHMHLU6RU3FAW3KEL7V
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 27, 2023 at 12:28:29PM +0200, Mark Brown wrote:
> On Wed, Sep 27, 2023 at 06:19:48PM +0800, ChiYuan Huang wrote:
> > On Wed, Sep 27, 2023 at 11:59:31AM +0200, Mark Brown wrote:
> 
> > > Sure, but is that actually a practical design - or if someone is doing
> > > this shouldn't it be joined up with the TDM configuration since with
> > > just the control it'd only be possible to switch the pins but not change
> > > the TDM layout?  I'm not sure that this control works as a standalone
> > > thing.
> 
> > I think if two data source input for different scenarios, then the data source
> > switch will become practical. For the standalone usage, keep a device property
> > to decide this may be enough. But consider the future application, to keep this
> > in general mixer control is still usable to meet the complex design.
> 
> My concern is that the control might not actually be usable without also
> changing the TDM mode so we might need the machine driver to add a
> control which flips the input and also changes the TDM mode - it feels
> likley that if there are two inputs they won't have identical formats.

Yap, your concern may be correct. This change is really becuase our default register
is badly defined. it choose TDM CH12 from 'DATA1' and CH34 from 'DATA2'. If it can
choose both default to either one, this doesn't make it confused. Also, there's the
another option is 'to tell user if TDM will be used, plase connect 'DATA1' and 'DATA2'
together'. But our datasheet did not directly define this.

I'll prepare another patch to define a device property, parsing at probe function and
configure this input source source directly in 'set_tdm_slot' API when TDM is chosen
to use.

Thanks for all the comment.
