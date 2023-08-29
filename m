Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9D78CC38
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F73B102D;
	Tue, 29 Aug 2023 20:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F73B102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334164;
	bh=Q/0aWIxhWSak6DTBu6Ui89cl7udG2w39JRP3oozGyNs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U7aSSikpYW8XcrIdpi8XA6s281H4g1U9JHllAt3AZtF4NRHoyiR0mzGF0xFFLK01x
	 Ts2TxFAniHxgUI+LWvSGhxs83UNH03FjvAOCtquMBE6tXjbU3zWGmvkhIdPqVGRQKv
	 TeCLNDmbsqncIXgxDte6d9nbqceJUxOs+xSpsIQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DF6EF80005; Tue, 29 Aug 2023 20:29:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97437F806AA;
	Tue, 29 Aug 2023 20:29:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5830F80158; Tue, 29 Aug 2023 20:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66D18F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 20:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D18F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=n0D4h4ks
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37T4t9v0016954;
	Tue, 29 Aug 2023 13:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=hjJtFK3sukLgeT/0rAr92cHseae6nq/j1ezpqygbTVM=; b=
	n0D4h4ksgc3nAuB+PCHyDw9ER30T5ZoITOWKWS8RfEFQGM3mWQdTeRV0Wx4UVTaG
	raLaZWT0v/Ed6C5sma7ARces5Gn3N0B/I6rfBDrlXH0u7KysLu6L1PMKTjyOTCVm
	7Y8ttmpkcP94MFyGAZfhJwHtKGIBBXLrwAV+IupXtNS20J3z2UwSpfQrSPxtFOly
	y5gp/vTk44inT3mgPt+1p9ItuTEF9Vu/6MTYHwxDtBE38Se4mGrUpUnXnrMm9hN4
	z85S0T/UJF125EkkMlXtWxzkx1T4ZRvqBBEMgkw7MptqhHwl2YRCpGlqOxb8UtRx
	TO6blrfw2wHAX4cN9ej9iw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyby57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 13:17:34 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 29 Aug
 2023 19:17:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 29 Aug 2023 19:17:32 +0100
Received: from vkarpovich-home (unknown [141.131.78.71])
	by ediswmail.ad.cirrus.com (Postfix) with SMTP id BA7DA357C;
	Tue, 29 Aug 2023 18:17:29 +0000 (UTC)
Date: Tue, 29 Aug 2023 13:17:23 -0500
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Rob
 Herring" <robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ricardo Rivera-Matos
	<rriveram@opensource.cirrus.com>
Subject: Re: [PATCH 3/7] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Message-ID: <20230829131723.f0df743f3ce9293878422cc3@opensource.cirrus.com>
In-Reply-To: <20230829100751.GR103419@ediswmail.ad.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
	<20230828170525.335671-3-vkarpovi@opensource.cirrus.com>
	<20230829100751.GR103419@ediswmail.ad.cirrus.com>
Organization: Cirrus Logic
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K4ZE7d_kF-hVehEcIWC6k5UYWOc4ysoC
X-Proofpoint-GUID: K4ZE7d_kF-hVehEcIWC6k5UYWOc4ysoC
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4605e08f6d=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CC7W3NWNHP6S6K7C2HE7NBM3IM5GX4JE
X-Message-ID-Hash: CC7W3NWNHP6S6K7C2HE7NBM3IM5GX4JE
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CC7W3NWNHP6S6K7C2HE7NBM3IM5GX4JE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 10:07:51 +0000
Charles Keepax <ckeepax@opensource.cirrus.com> wrote:

> On Mon, Aug 28, 2023 at 12:05:21PM -0500, Vlad Karpovich wrote:
> > Checks the index computed by the virq offset before printing the
> > error condition in cs35l45_spk_safe_err() handler.
> > 
> > Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> > Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> > ---
> >  sound/soc/codecs/cs35l45.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> > index 40fb64904260..2c9b41171a05 100644
> > --- a/sound/soc/codecs/cs35l45.c
> > +++ b/sound/soc/codecs/cs35l45.c
> > @@ -1023,7 +1023,10 @@ static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
> >  
> >  	i = irq - regmap_irq_get_virq(cs35l45->irq_data, 0);
> >  
> > -	dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
> > +	if (i < 0 || i > 6)
> 
> This looks a little odd, there appear to be 8 IRQs attached to
> this function whereas this says 6. Also this check seems like
> it will be hard to keep in sync as things change.
> 
> Assuming this error check is actually necessary, would it be
> perhaps better to check i is smaller than ARRAY_SIZE(cs35l45_irqs)
> and check that the attached function is cs35l45_spk_safe_err.
> That should be more robust against future changes to the IRQs.
> 
> Thanks,
> Charles
Thank you. It was picked up from a different branch,I will change to ARRAY_SIZE.

-- 
Vlad Karpovich <vkarpovi@opensource.cirrus.com>
