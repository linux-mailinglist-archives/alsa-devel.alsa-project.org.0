Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A677511C6E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 18:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F3782B;
	Wed, 27 Apr 2022 18:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F3782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651078179;
	bh=Tg8xMFZqrD2B4O4aTq//W3Bu9b70wCe5oCYcBcARiHU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXbT2T0rJouHvRQnkkJvmG//d6rTuqku7J+5c48TqwzasYBMihxzUJ1eo2/fAaSPC
	 5JpKr5FeAHQ9CBgdfvnG0TBVqdITVg2uF7HW5cqd0c4j6zShESwaFSOx6SFXefgLZo
	 OFcF785mIGLc+1UVCQLrsNy1MKS2xZnnzWYgAIBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D3DF80100;
	Wed, 27 Apr 2022 18:48:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEF18F8016E; Wed, 27 Apr 2022 18:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B16F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 18:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B16F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UtvDzA/Q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RBKMfK032257;
 Wed, 27 Apr 2022 11:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=UQP5Re2D+ZlNbaItPsbOGBMGmkrZUZksV2a/EjJbN8A=;
 b=UtvDzA/QistlUJ4K0dowTPRIZ19F7cbKK9V3NCz76uHPbrSqLZGyqCFgvRDHbofNkleb
 tpF1eTItg2OsNj3vgBARX2KgBYsnyfMaFFWmXUBJK3GZSJkandEYHPgyPwvUXBAFCuw9
 kif6NIrkTvRVbq6+OPQ6rU3fMqlUNqqtzrcexJtUb3sXTTWJNLbPvC8wagges5ZCsmMN
 KT5NXd5HIvAnmXygzVh56Sx4oK7UQiqTxN435LeWVcoxDfbKGNfpVkawpG5bHdcXHrNS
 ANbNIWRlcX0sLk95ffEtDFWlzPIg8vOaHMO81cS4Io8gvlTDUvurUadGWyYDpMv/xelT DA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fprtb11he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 11:48:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 17:48:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 17:48:25 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E9FDB1A;
 Wed, 27 Apr 2022 16:48:25 +0000 (UTC)
Date: Wed, 27 Apr 2022 16:48:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: WM8962 crashing on suspend
Message-ID: <20220427164825.GH38351@ediswmail.ad.cirrus.com>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <20220427145730.GE38351@ediswmail.ad.cirrus.com>
 <YmlgL+Ur6BeWiUtr@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YmlgL+Ur6BeWiUtr@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ygRqT4L4LuLkZvhPrkevVWF0FKutIFr-
X-Proofpoint-GUID: ygRqT4L4LuLkZvhPrkevVWF0FKutIFr-
X-Proofpoint-Spam-Reason: safe
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Adam Ford <aford173@gmail.com>
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

On Wed, Apr 27, 2022 at 04:24:31PM +0100, Mark Brown wrote:
> On Wed, Apr 27, 2022 at 02:57:30PM +0000, Charles Keepax wrote:
> > On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:
> > > static const struct dev_pm_ops wm8962_pm = {
> > > + SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> > > SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
> > > };
> 
> > > I applied this, and it appears to make the issue go away on a 5.15
> > > kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> > > would that be an acceptable solution to push upstream?
> 
> > Feels like those operations should be runtime PM, like there is
> > no reason to keep the CODEC in a high power state than necessary.
> 
> The issue Adam reported was suspending during playback - if you suspend
> during playback or capture the device is not idle at the point where we
> start trying to suspend so it shouldn't be in runtime suspend and won't
> by default be runtime suspended by the PM core.

Yeah in my head snd_soc_suspend would have been called which
would (assuming the DAI doesn't have ignore_suspend set) shut
down the DAPM graph for the audio route, causing the runtime
references to all be released and the CODEC to be suspended
through runtime_pm. Not sure if I missed something there, and
that also allows for systems where the CODEC doesn't suspend
during system suspend. That said guess there probably arn't
any use-cases for that on wm8962 and I am more than happy to
use the force_suspend ops if you are happy with it.

Thanks,
Charles
