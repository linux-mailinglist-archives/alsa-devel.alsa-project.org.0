Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD9943602
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 21:01:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0842BDF;
	Wed, 31 Jul 2024 21:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0842BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722452498;
	bh=1biY0mwR6VJBJuHEOr9WJDOVOzJq5hdAvqynpXoc2lE=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GKuUCHgGFMGqhnVJSuzPuTQ72fBh9w6pYeINwUDxAIC6ZPhiiODDsOG9loeH9CWXd
	 qUsVHAvY6YHpZfXDRt6xO/BJvKwlkwh/kwqG4Hc937fXrqra5EjUclUqqXVoZ8Vsfv
	 vbEyF3DiKOzy2E/t0UWJy5tbzmTpKMFoF2V0/DnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 873F0F8058C; Wed, 31 Jul 2024 21:01:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A013F805AD;
	Wed, 31 Jul 2024 21:01:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA4AEF80448; Wed, 31 Jul 2024 20:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB6C2F80269
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 20:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB6C2F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Oua0bV0q
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46V4lq91024935;
	Wed, 31 Jul 2024 09:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tCTy3HpSclu/JVbVz20IopFee8JQbSd33LbqfZ73sEo=; b=
	Oua0bV0qSpVqBLWdgBUoJkfGZmleAF1cuAFxynR1Hu+pInZ+4WEC0UEyKKRvW7QN
	sGphaN/SHq/DPG60gRAajoCCKIyqcB6/b3KhpUfGr94N82eRgZQiM9TC6TrrHQw3
	DsLZSaxhqEvk2t1mODXCZnYKAqc+6g1VPx0oPE5tK2LjdvlkM+0fWTXNJYm/rVL8
	xdzQFwg09V7wGlGfbK2cxTi7yoOfwO3s+iBQ3YzUm9ux/obKdbw0+ggSasluUBOJ
	utswEIfKLD7eRSvnQ0bs3s0vheFIKHwo1xAibdS/TURxHdNYsNo+W4Blo7VaMGP1
	XE8u++imd53jridB15kd9Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ymw31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 09:53:50 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 15:53:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 31 Jul 2024 15:53:48 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6B8E4820244;
	Wed, 31 Jul 2024 14:53:48 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240730162907.300046-1-simont@opensource.cirrus.com>
In-Reply-To: <20240730162907.300046-1-simont@opensource.cirrus.com>
Subject: RE: [PATCH v2] ALSA: hda: cs35l56: Stop creating ALSA controls for
 firmware coefficients
Date: Wed, 31 Jul 2024 15:53:48 +0100
Message-ID: <002c01dae359$733e2ce0$59ba86a0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGzLZ/XK1mMQFNNtpXMWO+/fmdPEbJgVaBg
X-Proofpoint-GUID: 0dv5u5HeDXBJqM-AFenLSNnyVe_oR9NC
X-Proofpoint-ORIG-GUID: 0dv5u5HeDXBJqM-AFenLSNnyVe_oR9NC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3OF2PZJNWVDI4Q3JJM3GCN46QRSHONLH
X-Message-ID-Hash: 3OF2PZJNWVDI4Q3JJM3GCN46QRSHONLH
X-MailFrom: prvs=5942461a0a=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3OF2PZJNWVDI4Q3JJM3GCN46QRSHONLH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Takashi - whilst the reasons for not adding the ALSA controls are different
to
those of the CS35L41, given the dislike about being able to re-enable them
using a kernel parameter for debugging we'll send a V3 that removes all the
firmware control support.

Thanks
-Simon

> -----Original Message-----
> From: Simon Trimmer <simont@opensource.cirrus.com>
> Sent: Tuesday, July 30, 2024 5:29 PM
> To: tiwai@suse.com
> Cc: linux-sound@vger.kernel.org; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; patches@opensource.cirrus.com; Simon Trimmer
> <simont@opensource.cirrus.com>
> Subject: [PATCH v2] ALSA: hda: cs35l56: Stop creating ALSA controls for
> firmware coefficients
> 
> A number of laptops have gone to market with old firmware versions that
> export controls that have since been hidden, but we can't just install a
> newer firmware because the firmware for each product is customized and
> qualified by the OEM. The issue is that alsactl save and restore has no
> idea what controls are good to persist which can lead to
> misconfiguration.
> 
> As the ALSA controls for the firmware coefficients are not used in
> normal operation they can all be hidden, but add a kernel parameter so
> that they can be re-enabled for debugging.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---
> Changes in v2:
> - v1 was accidentally the backport version for older kernels instead of
>   the one for v6.11
> 
>  sound/pci/hda/cs35l56_hda.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 96d3f13c5abf..f2f623f713d1 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -23,6 +23,10 @@
>  #include "hda_cs_dsp_ctl.h"
>  #include "hda_generic.h"
> 
> +static bool expose_dsp_controls;
> +module_param(expose_dsp_controls, bool, 0444);
> +MODULE_PARM_DESC(expose_dsp_controls, "Expose firmware controls as
> ALSA controls 0=no (default), 1=yes");
> +
>   /*
>    * The cs35l56_hda_dai_config[] reg sequence configures the device as
>    *  ASP1_BCLK_FREQ = 3.072 MHz
> @@ -613,7 +617,7 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda
> *cs35l56)
>  	 */
>  	if (cs35l56->base.fw_patched)
>  		cs_dsp_power_down(&cs35l56->cs_dsp);
> -	else
> +	else if (expose_dsp_controls)
>  		add_dsp_controls_required = true;
> 
>  	cs35l56->base.fw_patched = false;
> --
> 2.43.0


