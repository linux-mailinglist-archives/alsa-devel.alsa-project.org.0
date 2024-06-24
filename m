Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E986E914E7D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 15:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A5E851;
	Mon, 24 Jun 2024 15:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A5E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719235749;
	bh=KtYCEeq8JRhBkkEXlVP+XorOG+4SzhjWy5Mxmxnw4WE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lrS+BPqOxsuqZphCWjOklStPE60r+qEsa5A2tWHo1ZUJ4XTcn9a5F8ZXNulvwNN7K
	 /iTKN0mF1gqYhmg0EhfM6pBSZ0CLSvLCaYYffw+fPGKksWCgvHZR05+mwPmB1fFXRj
	 L8OtlUnbTAx5mw7N2p1ZU4XalKnbzi5XPsDJBBcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2C1EF805AF; Mon, 24 Jun 2024 15:28:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1144F805AF;
	Mon, 24 Jun 2024 15:28:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A787F80495; Mon, 24 Jun 2024 15:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64AEBF800ED
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 15:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64AEBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IeobTVvw
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45O7jFln001265;
	Mon, 24 Jun 2024 08:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=OxGydhnFWd50JeZqTj
	odUxtVhoYb7kohs0XAF/4HDQU=; b=IeobTVvwhOzlNW/D7vfckZXva6Sg4C2lh+
	zHXcmhf6tm2yenFztbSk96wsVHsAgLw6SebGcFBYYpjxy8oEkpKQ1zPwuC0B/Bu+
	e9jiTDlBruZOLv1cYmnG70XGIjXWnVpw0b62G6x+0qBIu1U7z8eY0/FeLjMeZg5u
	V/yw1Q8ToeEBLbfPV53/RsTTE5Xj3P6CSZeKoOt7BxXYSmtyjA3IR9hmBiDCCxQj
	YytDewIQ4NXQl6hZm+lrmRri/lGVFstuJjk4m+tZ+B31wElmqiDFpTPYFVqMBnEU
	LtUdLhwJ3AuBXckdiymyftAPgIoq7Ivl2ijZIvEER7r6cndL2ICA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ywv0x9mnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 08:28:04 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 14:28:01 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 24 Jun 2024 14:28:01 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B0806820248;
	Mon, 24 Jun 2024 13:28:01 +0000 (UTC)
Date: Mon, 24 Jun 2024 14:28:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add support for
 cs42l43/cs35l56 bridge configuration
Message-ID: <Znl0YIGSDmtP1fIs@opensource.cirrus.com>
References: <20240624122041.952863-1-ckeepax@opensource.cirrus.com>
 <20240624122041.952863-2-ckeepax@opensource.cirrus.com>
 <ba0f2827-fdf8-4496-b782-fa4129958a9a@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ba0f2827-fdf8-4496-b782-fa4129958a9a@perex.cz>
X-Proofpoint-ORIG-GUID: QH1IIVBeWPZIGfOx_fVyRPHR-QdqbVkP
X-Proofpoint-GUID: QH1IIVBeWPZIGfOx_fVyRPHR-QdqbVkP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: W7LIQN4FMMEUPEBTB3O7YU54FNDZGWDC
X-Message-ID-Hash: W7LIQN4FMMEUPEBTB3O7YU54FNDZGWDC
X-MailFrom: prvs=3905e7e383=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7LIQN4FMMEUPEBTB3O7YU54FNDZGWDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 24, 2024 at 02:41:45PM +0200, Jaroslav Kysela wrote:
> On 24. 06. 24 14:20, Charles Keepax wrote:
> > The cs42l43 has both a SPI master and an I2S interface, in some
> > configurations 2 cs35l56 amplifiers are connected to these to provide
> > bass speakers whilst the cs42l43's internal speaker drivers are used for
> > the tweeters. Add UCM configuration for this type of system.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >   ucm2/sof-soundwire/cs35l56-bridge.conf | 61 ++++++++++++++++++++++++++
> >   ucm2/sof-soundwire/sof-soundwire.conf  |  2 +-
> >   2 files changed, 62 insertions(+), 1 deletion(-)
> >   create mode 100644 ucm2/sof-soundwire/cs35l56-bridge.conf
> > 
> > diff --git a/ucm2/sof-soundwire/cs35l56-bridge.conf b/ucm2/sof-soundwire/cs35l56-bridge.conf
> > new file mode 100644
> > index 0000000..6fafc80
> > --- /dev/null
> > +++ b/ucm2/sof-soundwire/cs35l56-bridge.conf
> > @@ -0,0 +1,61 @@
> > +# Use case Configuration for sof-soundwire card
> > +
> > +LibraryConfig.remap.Config {
> > +	ctl.default.map {
> > +		"name='cs42l43 Bridge Switch'" {
> > +			"name='AMPL Speaker Switch'".vindex.0 0
> > +			"name='AMPR Speaker Switch'".vindex.1 0
> 
> The logical/abstract names should not contains any chip or specific hardware
> identification. Just use "Speaker Switch" and "Speaker Volume" to not
> confuse users.
> 

Can do.

> For my information - "AMPL/R Speaker Volume" is digital or analog volume control?
> 

It's a digital volume, although I guess technically its
controlled by firmware in this case, so in the future it could
be updated to actually control the analog volume, but I am not
aware of any plans to do so.

Thanks,
Charles
