Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CB487AB1
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 17:49:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 012E718CD;
	Fri,  7 Jan 2022 17:48:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 012E718CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641574140;
	bh=YFBB7u1dNx2htT36gBhYlAy5JsGkSkds2X7H2J8qXts=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEZQ1uzn0/Sg5BpmWu5sbNhLGH3RIGjUAxF/QrtCcjznQTzQDxSEPYPAFk2sogLMf
	 /weOPXZWRQGV8b6CZPL3OWNh1gGRfOtZUtwp/0T5KbcOdR/NmRRcM200Cc9HyhKqPi
	 ErdEJqMxwk31BXXCRn3vydUjOtsv7rcwd56h+dl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40943F8007E;
	Fri,  7 Jan 2022 17:47:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56633F80249; Fri,  7 Jan 2022 17:47:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6DD5F8007E
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 17:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6DD5F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mfjrlyjY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207Fo5gv008257;
 Fri, 7 Jan 2022 10:47:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=nEIaGxqDjLaUY2Uoy+EU0FF0u7G62WmW/l8R41Q6dn8=;
 b=mfjrlyjYgKKvPAMWUWrAw1Kj+7+A8gzOgSzY1dhzCxk9R7R96LOpgFQLqAUOJRSsQBJj
 /l9xAh8CatVLlp41l7vw2AY2/TT4d7rG0+2giR4EMQd2pP80ahIBVKpnFEM4SIqkB9AQ
 k6MZgl3eC4QSipeZG4gXTox9ZD220fBxskUDOhoA+wD6EhxuQVb7zp53hWLhMzOhOCcD
 ZNIDrS4VaCfR+eDnuu28UfmwpGNSB5CDsyEQI0lbqO7+5X3wvB7NATyPCNQizQpw6z43
 rr9eiSVEOOaNi0kYuh69/tYfZFtk05NA/FC8NF6JrQcz2t6MzelRQJGoC916paQTsaFd bA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dergng2cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 07 Jan 2022 10:47:39 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 7 Jan
 2022 16:47:37 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 7 Jan 2022 16:47:37 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7271411D7;
 Fri,  7 Jan 2022 16:47:37 +0000 (UTC)
Date: Fri, 7 Jan 2022 16:47:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/2] Add low power hibernation support to cs35l41
Message-ID: <20220107164737.GH18506@ediswmail.ad.cirrus.com>
References: <20220107160636.6555-1-ckeepax@opensource.cirrus.com>
 <s5hy23rfrnr.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <s5hy23rfrnr.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 2UR989gwuuCh1tvRGoNQPKuHo5F6i-69
X-Proofpoint-ORIG-GUID: 2UR989gwuuCh1tvRGoNQPKuHo5F6i-69
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

On Fri, Jan 07, 2022 at 05:15:52PM +0100, Takashi Iwai wrote:
> On Fri, 07 Jan 2022 17:06:34 +0100,
> Charles Keepax wrote:
> > 
> > This patch series adds support for the low power hibernation feature
> > on cs35l41. This allows the DSP memory to be retained whilst the
> > device enters a very low power state.
> > 
> > These patches will cause some very minor conflicts with Lucas's
> > currently outstanding work on the HDA version of cs35l41.  Whilst
> > things will still build (well now I fixed my silly mistake), this
> > patch adds a test key function his code will now have to call.
> > 
> > It looks like Lucas's patch might get a respin based on the comments
> > from Andy, in which case I guess we can pull the small change into the
> > next version of it. But either way these patches are not urgent so I
> > am happy if they sit around until Lucas's stuff is merged too.
> 
> Well, I've already merged HD-audio part, so any changes will be
> incremental over it.
> 
> CS35L41 HD-audio stuff still won't work as of now with my tree alone
> because of the lack of the ACPI patch.  So it's fine to merge those
> changes to Mark's tree and break the stuff now, supposing it'll be
> synced again before 5.17-rc1 pull request.  After it's merged to my
> tree, you can submit the HD-audio fix, to be merged before rc1. 
> 

Apologies I didn't realise those were already merged. I will do a
patch to update them to use the new functions.

Thanks,
Charles
