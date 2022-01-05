Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93431485457
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 15:25:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4251916;
	Wed,  5 Jan 2022 15:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4251916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641392715;
	bh=HvZi9pgDUTmjPGJerFQCo2yKQZlPseOSa9rySxzT8So=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWM8VfPwcc6Sbe81fMB17h1VwxXp9bW72KKaPNj0g+/3UwYCOXP1wEBDLeJZr7VKM
	 zhA0mOgu/aGIDNbyLDJlzdViocmNa2ZGFRllRZTG6E+GVFN/ATN0ShpRN0VjPMW2qD
	 iDo2xH48BaAYWDQ7dr0/4nDK4SvIClRtkDszHNTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E37F8007E;
	Wed,  5 Jan 2022 15:24:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11023F8007E; Wed,  5 Jan 2022 15:24:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B353F80089
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 15:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B353F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MWdV4j0M"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205DNZkN010264;
 Wed, 5 Jan 2022 08:23:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=N75yOjWVihdzIT2EYl87894NuEPuIzPJIbyXRHwpt/Q=;
 b=MWdV4j0MLtapXFwZplZHCACyjPKek1Rp2aZBW+h9htAFuVWnX6ILieCLP+Jjkjekm2YF
 0p+ML464VAV2TkaxwUHw4bK6ns1IG+mqhObi68YG5BvtwBT2m4eLMZXlxEwGE5Dyp6tC
 QnL6yUheHgIQAgX2SYAd8zIdw9B3/8FPZPC+U07FvJW7HuQz49nO/T+EaZdgVA9iSh/i
 G/16vjah9/9/yf2xOAxHU67D4KM6fdXGKhNH40viggo9LWKsVCIx8gIlzRcJKzbkOF0q
 irBJDI7N4WN0BoY/jRK3lz126KipjgNJyg7Q0D10O9YOAIci/oPtBY5/oaDH7GnlSIDy 2Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dd7y3g94y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 08:23:56 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 14:23:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 14:23:54 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A55B9B0E;
 Wed,  5 Jan 2022 14:23:54 +0000 (UTC)
Date: Wed, 5 Jan 2022 14:23:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/8] Add low power hibernation support to cs35l41
Message-ID: <20220105142354.GF18506@ediswmail.ad.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
 <s5hr19mie3i.wl-tiwai@suse.de>
 <20220105130512.GE18506@ediswmail.ad.cirrus.com>
 <s5hmtkai8d4.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <s5hmtkai8d4.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 5QvTvVNjzb2el6tP82F9fYe6MfFL1SCf
X-Proofpoint-ORIG-GUID: 5QvTvVNjzb2el6tP82F9fYe6MfFL1SCf
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 05, 2022 at 03:07:35PM +0100, Takashi Iwai wrote:
> On Wed, 05 Jan 2022 14:05:12 +0100,
> Charles Keepax wrote:
> > 
> > On Wed, Jan 05, 2022 at 01:03:45PM +0100, Takashi Iwai wrote:
> > > On Wed, 05 Jan 2022 12:30:18 +0100,
> > > Charles Keepax wrote:
> > > > Patches 7,8 specifically will cause some very minor conflicts with
> > > > Lucas's currently outstanding work on the HDA version of cs35l41.
> > > > Whilst things will still build, this patch adds a test key function
> > > > his code will now have to call. If his patches are getting merged
> > > > first I will respin this series to update his code, he is currently on
> > > > holiday until the 12th of Jan, so if we want to wait for another spin
> > > > of those patches I can work with him to update them at that time. Or
> > > > alternatively we could just merge them all and I will do a quick fixup
> > > > patch at the end, since there is no build breakage.
> > > 
> > > FWIW, the ASoC part of Lucas's patch set has been already merged in
> > > Mark's asoc tree.  (HD-audio part isn't merged yet though).
> > > 
> > 
> > Yeah its the HDA part that would require a small change after
> > those last two patches to call the additional function. The
> > series is already based on top of the merged ASoC changes.
> 
> Ah, OK, that's what you commented in Lukas's v6 patchset, right?
> We can fix it up later after the merge, too.
> 
> Right now I'm waiting for the PR from Mark, then will merge v6 patches
> (modulo the ACPI one).

Yeah I suspect me just doing a small fix up patch at the end
might be the simplest solution.

Thanks,
Charles
