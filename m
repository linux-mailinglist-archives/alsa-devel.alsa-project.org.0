Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889D704AEA
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 12:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F4AE11C;
	Tue, 16 May 2023 12:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F4AE11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684233736;
	bh=XtZbOL9Baj+X/5+/vEMviRA2ZfSayirohcBwgckha8U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g6BWfOPD66O+gWIMonhn9ruF5Ngi8S62dPhM+DuDQRnyWX04zj98bi85LgOJIjkhT
	 SLzTIe/srCwYIelsBYv1MObcdq8YXYjftOa/KZVA56X2e8WLEtUyizs5loX6KqoQat
	 fKwLcB2oE9q5ePDwdP0AKd9FSJnM4DRicQ/iqVVE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE3BF80431; Tue, 16 May 2023 12:41:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4769DF8025A;
	Tue, 16 May 2023 12:41:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D0CF80272; Tue, 16 May 2023 12:41:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A349F8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 12:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A349F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GLaW26NG
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34G8VOmT026320;
	Tue, 16 May 2023 05:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=vAMh92l5h6Q7hcEh6WFWIgGftgCfxqWmMEVQrJ7Twmo=;
 b=GLaW26NG5Cj9mCLHLw9+IpvJmezaDN8LtyneTOQ9fOY33z71QwCmX3APWVoL2xdasX1h
 9dJGd4etzg4pdAU2aM8oQqU0W3KpmL/yqoffLhmSBUCn6zANCtCyFzV+kvHTQwKtKeOT
 8IZ4rwiLO1URvD940rPXeSGlhkju4vEjWSDD5OuvWeWAVACUNqxsNzf/jlaU84L9FhEn
 UllOpj0Jq12/6OZixxWy9B5Bt9JIyt6s9NC8saGsQTUCIXWGHPMydkynQFbk+H0vPZXq
 DoE00yt1TXPBa+1zK0uTspqYQwq8Vti/x8epmnwcgw4cLNqTVKVYCK/80lDvJO+Z4QPk TA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qj6ymv753-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 05:41:15 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 16 May
 2023 05:41:14 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 16 May 2023 05:41:14 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2CC28B38;
	Tue, 16 May 2023 10:41:14 +0000 (UTC)
Date: Tue, 16 May 2023 10:41:14 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, <broonie@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <linus.walleij@linaro.org>, <vkoul@kernel.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
Message-ID: <20230516104114.GU68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
 <86o7mpmvqq.wl-maz@kernel.org>
 <20230512153933.GH68926@ediswmail.ad.cirrus.com>
 <86mt29mt2m.wl-maz@kernel.org>
 <20230515112554.GA10825@google.com>
 <86h6scmzf7.wl-maz@kernel.org>
 <20230516100936.GF10825@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516100936.GF10825@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: gMHOED3BHFVkCy5V-NwvIXEY6a_cTz6p
X-Proofpoint-ORIG-GUID: gMHOED3BHFVkCy5V-NwvIXEY6a_cTz6p
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EBPDCJIYCR5KXPPG73V5JOVZSOEL6FP7
X-Message-ID-Hash: EBPDCJIYCR5KXPPG73V5JOVZSOEL6FP7
X-MailFrom: prvs=05004a7c2f=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBPDCJIYCR5KXPPG73V5JOVZSOEL6FP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 16, 2023 at 11:09:36AM +0100, Lee Jones wrote:
> On Tue, 16 May 2023, Marc Zyngier wrote:
> > On Mon, 15 May 2023 12:25:54 +0100,
> > Lee Jones <lee@kernel.org> wrote:
> > > On Fri, 12 May 2023, Marc Zyngier wrote:
> > > > On Fri, 12 May 2023 16:39:33 +0100,
> > > > Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> > > I'm not aware of another subsystem that deals with !IRQChip level IRQ
> > > controllers.  Where do simple or "second class" interrupt controllers
> > > go?
> > 
> > This isn't an interrupt controller. This is internal signalling, local
> > to a single component that has been artificially broken into discrete
> > bits, including an interrupt controller. The only *real* interrupts
> > here are the GPIOs.
> > 

I would question this statement a little, they are fixed function
IRQs sure but they are still real interrupts. These are lines which
receive a signal and on an edge they set a stick status bit, which
causes another signal to generate an edge, they have registers
which let you mask events, if it walks like a duck and all. The
only difference between this and a "real" interrupt is whether the
chip designer or the board designer was the person who decided
where the wire was connected.

> > I'm happy to see an interrupt controller for the GPIOs. But the rest
> > is just internal muck that doesn't really belong here. Where should it

Internal-ish, granted many of them are primarily useful to the
device itself. But it is very easy to construct situations where
say knowing the speaker thermals are high, or that a jack has
been inserted are useful outside of the CODEC driver itself.

> > go? Together with the rest of the stuff that manages the block as a
> > whole. Which looks like the MFD subsystem to me.
> 
> Very well.  Let's see this "muck" in a patch please!

Groovy I will do a re-spin moving the IRQ stuff to the MFD and
lets see where we get to.

Thank you all for your help in reviewing this so far.

Thanks,
Charles
