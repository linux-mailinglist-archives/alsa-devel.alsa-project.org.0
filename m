Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE178FA33
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 10:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 581A0886;
	Fri,  1 Sep 2023 10:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 581A0886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693558192;
	bh=nZrl+DCyGKN6D4IukkbZUq0kPUeiK2dvWcA227zWvDU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=in/V3IN/LXDgJ8huBYM31+AbxgoD6KLqN2HpFlZIe7E7pQTTu1t5uco8sbto8MqaM
	 cy14EnaQ2ocsdKWtS/hYJSqYs1YsUU19KscJyLKrt94CXXF61VnB2St1MK/wuaLkH1
	 hX/bwEqnQw4HxgLsd0bDecMXM8flSUuCqc3f1uJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7496F8025F; Fri,  1 Sep 2023 10:49:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA07F80155;
	Fri,  1 Sep 2023 10:49:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D39F80158; Fri,  1 Sep 2023 10:48:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A61B3F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 10:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A61B3F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=e1TqXSR2
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3818QdxV020704;
	Fri, 1 Sep 2023 03:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=sYsYQEqfCKypMDe
	n35IJtnsfvBuwWP2nxKm1nldZM5A=; b=e1TqXSR2Guoazg0cdfvG9r5HPpq/PPg
	SBnR/48eCqXq3B3Opq5i77+/4WUxmMXZZv4JvxEvWW2aqUEUqoWYC76yXuDzuX0l
	G5yRg+P+DIfSYSGhKiltMqvOdSX6v8mFQfI1fjXu2GhVItBpay6T4CCehsNC43tQ
	9nQy2lWAsiWe9dhEgX2n7gYvtBgRLwe2z7ze2zQ7gFcMEcjtPhMG82cMTUmpMSC1
	8s4Dxl9YVZY+t30/Bx7KS/GRFxOnSjRdhCogDxoOpNMKs7JhQEIyCm8YNyPGbo+D
	4lXnugwEDBXHo6zaTyrn23XyDQKIsUTos9cp9NO8PViXKI4ukpbbGkA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj6sas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Sep 2023 03:48:45 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 1 Sep
 2023 09:48:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 1 Sep 2023 09:48:43 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 370973563;
	Fri,  1 Sep 2023 08:48:43 +0000 (UTC)
Date: Fri, 1 Sep 2023 08:48:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ricardo Rivera-Matos
	<rriveram@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Message-ID: <20230901084843.GZ103419@ediswmail.ad.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: jK_lMOmIoE1BPfC20nxayRbUEbYKGqi9
X-Proofpoint-GUID: jK_lMOmIoE1BPfC20nxayRbUEbYKGqi9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PWPXLHXVM2EGT3VGDACI6M6QRIGNKJAX
X-Message-ID-Hash: PWPXLHXVM2EGT3VGDACI6M6QRIGNKJAX
X-MailFrom: prvs=4608688732=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWPXLHXVM2EGT3VGDACI6M6QRIGNKJAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 31, 2023 at 11:20:39AM -0500, Vlad Karpovich wrote:
> From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> 
> Checks the index computed by the virq offset before printing the
> error condition in cs35l45_spk_safe_err() handler.
> 
> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs35l45.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index 2ac4612402eb..02b1172d2647 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c
> @@ -1023,7 +1023,10 @@ static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
>  
>  	i = irq - regmap_irq_get_virq(cs35l45->irq_data, 0);
>  
> -	dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
> +	if (i < 0 || i >= ARRAY_SIZE(cs35l45_irqs))

I am happy enough for this to be merged, since it clearly does
no harm. So:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

But I do still have a slight reservation of what is the point
of this error check?  This handler is static and can only be
called from within cs35l45.c and the only code that registers
IRQs goes through the cs35l45_irqs array and registers IRQs
from there, so how does this ever end up with i being out of
bounds?

And whilst I would not add this to this patch. I do also think
perhaps Ricardo had a point in his email, the IRQ handler
should probably be renamed, since it handles more than just
the spk_safe_err's, perhaps something like cs35l45_report_err.
On why the watchdog and global error call this as well, that
was a review comment on an earlier patch since the handlers for
those errors only printed a message, they might as well be
combined with the spk_safe error that also only printed a
message. If at some point separate handling is added for them
they can be split out.

Thanks,
Charles
