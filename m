Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D14511B8E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 16:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE3C1636;
	Wed, 27 Apr 2022 16:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE3C1636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651071523;
	bh=VumHTy0Q15M0alQeTAOz+PVVA+ZdlEbpPv58iOKuFWA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBQLU/pAjYva3kqo3WqoWahNp0/KCa2mif/QEOYtSH1MUYsfqPmdddebQT5hVdber
	 fpH9zPYBnRgYlzXwBNbn+ncs6a925liqXYMaVGuXHh6r5ioPz2SJ1xmbJfwYPasFsp
	 SdjZ61nDmdKKAk0aIjddfpdh6MtIUOw3jT+o8jKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABC8FF80253;
	Wed, 27 Apr 2022 16:57:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B926F8016E; Wed, 27 Apr 2022 16:57:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A73AAF80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 16:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73AAF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VAriHx0G"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R7SaZp011017;
 Wed, 27 Apr 2022 09:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=x/NJB075tAz3g9woL+C+ucYSEZm2zFGVO8ptosHBm0E=;
 b=VAriHx0GjMHCsgSWZk6Yaw7TupO2aC4rur9CH3PjPIfoPaPd8hgSibZNvEGlouA25JJg
 NzFs8tyCVQvb9UfGgYcUzxsHMlt9bFJ8dJ3xDrI2iTh+SUpV6eyE7Moj7pPwDLkl6eNp
 dCWKxOBCyFziNKZKKGYLTJ3zOK3cr0vgIYdjxC6JHATWbQ5xByafu4hSK5NRSnQkwSYg
 SXa4iVxAdsakWu3nkUOTuSTCeBf6hwmfEViCmsEKtvTO3KrBKzAbohDLmlVRmHlrZHVt
 4vZF3V033Lsrgrl/d/TSj13/5O+NEVVds5ExAbUV7D2I57lJyBFw3QfKrFO67VKsFRoU XA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fprtb0vrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 09:57:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 15:57:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 15:57:30 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 09DBAB1A;
 Wed, 27 Apr 2022 14:57:30 +0000 (UTC)
Date: Wed, 27 Apr 2022 14:57:30 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: WM8962 crashing on suspend
Message-ID: <20220427145730.GE38351@ediswmail.ad.cirrus.com>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: hLyZKL4c4mO9qMC1OGdva_IWLLMp1oUv
X-Proofpoint-GUID: hLyZKL4c4mO9qMC1OGdva_IWLLMp1oUv
X-Proofpoint-Spam-Reason: safe
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:
> On Tue, Apr 26, 2022 at 12:41 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > On Tue, Apr 26, 2022 at 11:36:26AM -0500, Adam Ford wrote:
> > > I have an imx8m Mini with a wm8962 codec.  If I run a speaker test and
> > > suspend the board while the speaker test is running, I get the
> > > following upon wake:
> > >
> > > wm8962 3-001a: ASoC: error at soc_component_read_no_lock on wm8962.3-001a: -16
> > >
> > > This message repeats itself over and over again.  If I attempt to use
> > > any audio, it fails until I reboot the board.
> > >
> > > If I run the audio test, then exit and suspend, the audio works upon
> > > resume, so it appears to be related to suspending while running.
> > >
> > > I am hoping someone might have a suggestion as to what I might be able
> > > to do or try to allow this to successfully suspend and resume if the
> > > device is playing sound.
> > >
> >
> > Hmm... EBUSY is what regmap returns when a volatile register is
> > read whilst the chip is still in cache only. The driver does
> > appear to be missing the usually fairly important work around to
> > avoid the IRQ and the PM runtime deadlocking on resume. Although
> > not sure that would actually lead to the error message you are
> > seeing.
> >
> > Would be really handy to see a little more of the log leading up
> > to the failure if that is possible? And would be really awesome
> > if you had any idea which read was returning the error? You could
> > shove a dump_stack in _soc_component_ret next to the error
> > message.
> 
> Because NXP had a downstream kernel, and it didn't appear to happen
> when using their downstream kernel, I wanted to see the difference.
> I found this:
> 
> static const struct dev_pm_ops wm8962_pm = {
> + SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
> };
> 
> I applied this, and it appears to make the issue go away on a 5.15
> kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> would that be an acceptable solution to push upstream?
> 

Feels like those operations should be runtime PM, like there is
no reason to keep the CODEC in a high power state than necessary.

Let me add the necessary stuff to at least avoid the race with the
IRQ and lets see if that has any effect, although I am not totally
convinced your symptoms sound like that is the issue. But it is
fixing an issue regardless so might as well start there. Any of
the debug I requested previously would also be handy though.

Thanks,
Charles
