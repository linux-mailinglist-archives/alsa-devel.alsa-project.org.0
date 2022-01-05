Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D7485332
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 14:06:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CA5118EA;
	Wed,  5 Jan 2022 14:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CA5118EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641387989;
	bh=fuBptuYCoe7CoQW66NYSwVCBtN0+iUEyNZZbnnS8Jpc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rbz78QpLgdU5b28Sa1sR/UDdUCwSSOhymo0mmoPjSC9DXzdgj7Qp/qAbI2nrnEhvM
	 8YLisdVKfEt14ZRHr9eKnH8W/MqMnrNcBMxIea0jxhC0HDSsaN7bwogqjs/CCRta8E
	 AbwSg5icN+XHzMePM/2IiRehOWJ8By+YAIOKxoMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69799F8020C;
	Wed,  5 Jan 2022 14:05:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED653F801D8; Wed,  5 Jan 2022 14:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35501F8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 14:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35501F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cr7SoP7I"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2059JDVk015982;
 Wed, 5 Jan 2022 07:05:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=TSHvFPK4z1Ie3LRnhmdtzQot5Tuz4O0gVu7CkjwLivM=;
 b=cr7SoP7IQMxRILFtjeIKzBCvHHYUYrNzKHMkoCFJY3Bf/hyVMTp900MvcXXWJUCq/Fr9
 PyCueJhc4Sb9G7TSjgLAAY6UvtyLlFMj+CQKrV5accZe9pkf6AD3D+oxr2LUs6QrVTyQ
 V0Rn0QM+C071iyg9QS/IKfxNBnykdOEYnIUEpu9Fe8j6pzla+ODGydU+cpepRdrrw3BL
 Did1tMxFi5hWEUHbYo3lCI/hIKU/AdyVNzqni0+jEPfxfuR9OF/yZzTrSp4fAwYW7q+l
 yLbFvotgNVMMuIcl30JGAm5LqQRwviNd43rLVbIImhBdR7f4moRSTiDb+IMyKanJN5qE yw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dd8jy85jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 07:05:14 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 13:05:12 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 13:05:12 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 22A80475;
 Wed,  5 Jan 2022 13:05:12 +0000 (UTC)
Date: Wed, 5 Jan 2022 13:05:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/8] Add low power hibernation support to cs35l41
Message-ID: <20220105130512.GE18506@ediswmail.ad.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
 <s5hr19mie3i.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <s5hr19mie3i.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: LMrZ2Fx60J9UaBT7DaOeSUKlRw0QAE_K
X-Proofpoint-ORIG-GUID: LMrZ2Fx60J9UaBT7DaOeSUKlRw0QAE_K
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

On Wed, Jan 05, 2022 at 01:03:45PM +0100, Takashi Iwai wrote:
> On Wed, 05 Jan 2022 12:30:18 +0100,
> Charles Keepax wrote:
> > Patches 7,8 specifically will cause some very minor conflicts with
> > Lucas's currently outstanding work on the HDA version of cs35l41.
> > Whilst things will still build, this patch adds a test key function
> > his code will now have to call. If his patches are getting merged
> > first I will respin this series to update his code, he is currently on
> > holiday until the 12th of Jan, so if we want to wait for another spin
> > of those patches I can work with him to update them at that time. Or
> > alternatively we could just merge them all and I will do a quick fixup
> > patch at the end, since there is no build breakage.
> 
> FWIW, the ASoC part of Lucas's patch set has been already merged in
> Mark's asoc tree.  (HD-audio part isn't merged yet though).
> 

Yeah its the HDA part that would require a small change after
those last two patches to call the additional function. The
series is already based on top of the merged ASoC changes.

Thanks,
Charles
