Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7658422C0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 12:20:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C2FF50;
	Tue, 30 Jan 2024 12:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C2FF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706613607;
	bh=s70PcDfdKXIabz66bTOUuUFV2uNNbNxl1c/riZr0MiQ=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pQrtxWGcG9V7cHztC7/ZCQpDTC4vWIxVvBbDaUFQcsW+Fengh4gkij6befj0/akrN
	 WYSLSIZy8VraJsc4NHyALQffDUtRFwdAyhbbFDkGJR2I1PdPK+SD73+TemW+lULTVh
	 drifmxaBMrulhhmXsnXnKCnZT8BSKrsxPVnaeau0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41506F80589; Tue, 30 Jan 2024 12:19:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB33EF80567;
	Tue, 30 Jan 2024 12:19:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67E10F8055C; Tue, 30 Jan 2024 12:19:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 468DCF80548
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 12:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 468DCF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UES6Peze
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40U6iRsK012474;
	Tue, 30 Jan 2024 05:19:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=Ukr1kR4PFuuto5kMeCHeJHaq5ynfZ1UT2dmL/7dyb4k=; b=
	UES6PezeE76ROxOmmxDiwBhE2hq3PdiS2dOR1RgbbD7snLVIEjpAEnIe038MG4CS
	EEMB7feNI4IaZTgMVTyd468BE5CU19w9FPFc2k13QuKlFLPSHbh2wHQIikU6uIQ/
	BlNGCE91LjNvSww2/NhX5dVcN31H+dGTzF7jBabFe3l4fgxejWe+bGHVYUvX6/c/
	hG2fJKVIwl22PRVONIMYWNBneYzUAQscTz9XDQCcJEqbkdykFuUa0VT4kQmEcE75
	kiOxpAHQ/TibXwPOdcemDVTlliQHmYLh9ZxJ3eguZ41CS/axqCy5J7JCGJG8ZGh6
	0hO1Dv3UKR4JSBo4bLhIdA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nu8bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 05:19:18 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 11:19:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 30 Jan 2024 11:19:17 +0000
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.61.65.148])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0CD31820241;
	Tue, 30 Jan 2024 11:19:17 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Takashi Iwai' <tiwai@suse.de>, 'Kenzo Gomez' <kenzo.sgomez@gmail.com>
CC: <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>,
        <james.schulman@cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <perex@perex.cz>, <rf@opensource.cirrus.com>, <tiwai@suse.com>
References: <874jfdwsfg.wl-tiwai@suse.de>
	<20240127164621.26431-1-kenzo.sgomez@gmail.com> <87jznr3wvs.wl-tiwai@suse.de>
In-Reply-To: <87jznr3wvs.wl-tiwai@suse.de>
Subject: RE: [PATCH v3] ALSA: hda: cs35l41: Support additional ASUS Zenbook
 UX3402VA
Date: Tue, 30 Jan 2024 11:19:16 +0000
Message-ID: <001401da536e$29b9a070$7d2ce150$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMwSTp61jXDtCjZqGhsSN60gQXN/ADh2+gYAkptiTOuLOdmIA==
X-Proofpoint-ORIG-GUID: FiXCtoKUHx4eaglYTZ9jVRv6zeFZnGXQ
X-Proofpoint-GUID: FiXCtoKUHx4eaglYTZ9jVRv6zeFZnGXQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4KJOVZ5SLAVIDECKHIUHSMEPBPUFH4UW
X-Message-ID-Hash: 4KJOVZ5SLAVIDECKHIUHSMEPBPUFH4UW
X-MailFrom: prvs=9759f81bb2=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KJOVZ5SLAVIDECKHIUHSMEPBPUFH4UW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, January 30, 2024 11:05 AM
> To: Kenzo Gomez <kenzo.sgomez@gmail.com>
> Cc: alsa-devel@alsa-project.org; david.rhodes@cirrus.com;
> james.schulman@cirrus.com; linux-kernel@vger.kernel.org; linux-
> sound@vger.kernel.org; patches@opensource.cirrus.com;
> perex@perex.cz; rf@opensource.cirrus.com;
> sbinding@opensource.cirrus.com; tiwai@suse.com
> Subject: Re: [PATCH v3] ALSA: hda: cs35l41: Support additional ASUS
> Zenbook UX3402VA
> 
> On Sat, 27 Jan 2024 17:46:21 +0100,
> Kenzo Gomez wrote:
> >
> > Add new model entry into configuration table.
> >
> > Signed-off-by: Kenzo Gomez <kenzo.sgomez@gmail.com>
> 
> Cirrus people, could you take a look?
> I'm inclined to take as is, unless you have any objections.

Looks good to me.

Thanks,
Stefan

> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  sound/pci/hda/cs35l41_hda_property.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/sound/pci/hda/cs35l41_hda_property.c
> b/sound/pci/hda/cs35l41_hda_property.c
> > index 35277ce890a4..59504852adc6 100644
> > --- a/sound/pci/hda/cs35l41_hda_property.c
> > +++ b/sound/pci/hda/cs35l41_hda_property.c
> > @@ -76,6 +76,7 @@ static const struct cs35l41_config
> cs35l41_config_table[] = {
> >  	{ "10431533", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0,
> 0 }, 0, 1, -1, 1000, 4500, 24 },
> >  	{ "10431573", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0,
> 0 }, 1, 2, 0, 1000, 4500, 24 },
> >  	{ "10431663", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0,
> 0 }, 1, -1, 0, 1000, 4500, 24 },
> > +	{ "104316A3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0,
> 0 }, 1, 2, 0, 0, 0, 0 },
> >  	{ "104316D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0,
> 0 }, 1, 2, 0, 0, 0, 0 },
> >  	{ "104316F3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0,
> 0 }, 1, 2, 0, 0, 0, 0 },
> >  	{ "104317F3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0,
> 0 }, 0, 1, -1, 1000, 4500, 24 },
> > @@ -410,6 +411,7 @@ static const struct cs35l41_prop_model
> cs35l41_prop_model_table[] = {
> >  	{ "CSC3551", "10431533", generic_dsd_config },
> >  	{ "CSC3551", "10431573", generic_dsd_config },
> >  	{ "CSC3551", "10431663", generic_dsd_config },
> > +	{ "CSC3551", "104316A3", generic_dsd_config },
> >  	{ "CSC3551", "104316D3", generic_dsd_config },
> >  	{ "CSC3551", "104316F3", generic_dsd_config },
> >  	{ "CSC3551", "104317F3", generic_dsd_config },
> > --
> > 2.43.0
> >


