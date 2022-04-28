Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA947512E2F
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 10:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49BE3AE8;
	Thu, 28 Apr 2022 10:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49BE3AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651134274;
	bh=utY0TJJDYksc8K1Cbz8lopodtzgd3eqgjxLf4RKTC4w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPg4WqyYYCAMKMGxJF4a+CE/nkjwHE/47/Y8nr7KvIc6Cc1LcSBUjcp8b0cOoy6Oy
	 tuiR4WKPEKQ50XuwAFkYxIdkBXU6PL5jKCgGvk7GmhQ3OfV8R2oUSMKd8A6N1iz6A9
	 NOq2jsi33Mba6R5GdeK5Mxu4xAHI9r8Ii42pfKB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5A13F80311;
	Thu, 28 Apr 2022 10:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B690EF8016E; Thu, 28 Apr 2022 10:23:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 720BAF8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 10:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720BAF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZqMzD44p"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S8567J013814;
 Thu, 28 Apr 2022 03:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=a5mj9TC7SBtuwpAFQ6mhy7Z/T9gjVnh5vllhtUwr+Dg=;
 b=ZqMzD44pjcXugAaKQ3Pp1718kb45WG1aE1rbUFeZGNo+PXEc5HbOTENr8yI4e5acJDVH
 hEzmHhZxFWYvyi0SBZhyq9M/QiVoH099gCvKQXB/NKT39WlciMv1G7FOus7mnMR0cpYu
 GW34GCYYI9hrE4AwB5eLlojPmI3v/gh1mEjGiosewne82N2+wW1+JS4g0gQlJNO2z50p
 l43oSHKFs1OKC57fCXmikMVWVI+LqYSeIjaG8gNds7TBhcXNR6USMK/J28ET9Zjml5pT
 Mg2xg4+4MSEZJGS1Jpg1Qf69/tkhrL6elRko4fnjZaamReqWAXtebOQ5B9XuBr1RWaW3 Wg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt61uu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 03:23:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 09:23:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 28 Apr 2022 09:23:21 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 402E1B10;
 Thu, 28 Apr 2022 08:23:21 +0000 (UTC)
Date: Thu, 28 Apr 2022 08:23:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: WM8962 crashing on suspend
Message-ID: <20220428082321.GI38351@ediswmail.ad.cirrus.com>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <20220427145730.GE38351@ediswmail.ad.cirrus.com>
 <YmlgL+Ur6BeWiUtr@sirena.org.uk>
 <20220427164825.GH38351@ediswmail.ad.cirrus.com>
 <CAHCN7xJSpYsZbVRrCmt8QobEOk+bvRLs=qgTHqqsh-K1xEUgUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHCN7xJSpYsZbVRrCmt8QobEOk+bvRLs=qgTHqqsh-K1xEUgUA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8DwGxAWjaS7zZz6S2H1MmILeCRT7SqYD
X-Proofpoint-ORIG-GUID: 8DwGxAWjaS7zZz6S2H1MmILeCRT7SqYD
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

On Wed, Apr 27, 2022 at 11:54:40AM -0500, Adam Ford wrote:
> On Wed, Apr 27, 2022 at 11:48 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Wed, Apr 27, 2022 at 04:24:31PM +0100, Mark Brown wrote:
> > > On Wed, Apr 27, 2022 at 02:57:30PM +0000, Charles Keepax wrote:
> > > > On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:
> > > > > I applied this, and it appears to make the issue go away on a 5.15
> > > > > kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> > > > > would that be an acceptable solution to push upstream?
> > >
> > > > Feels like those operations should be runtime PM, like there is
> > > > no reason to keep the CODEC in a high power state than necessary.
> > >
> > > The issue Adam reported was suspending during playback - if you suspend
> > > during playback or capture the device is not idle at the point where we
> > > start trying to suspend so it shouldn't be in runtime suspend and won't
> > > by default be runtime suspended by the PM core.
> >
> > Yeah in my head snd_soc_suspend would have been called which
> > would (assuming the DAI doesn't have ignore_suspend set) shut
> > down the DAPM graph for the audio route, causing the runtime
> > references to all be released and the CODEC to be suspended
> > through runtime_pm. Not sure if I missed something there, and
> > that also allows for systems where the CODEC doesn't suspend
> > during system suspend. That said guess there probably arn't
> > any use-cases for that on wm8962 and I am more than happy to
> > use the force_suspend ops if you are happy with it.
> 
> I am not familiar with this driver or the force_suspend ops, so I am
> not sure if there are going to be side-effects.
> I don't mind collecting more data if it's helpful.  I probably won't
> be able to add more debug info until this weekend at the earliest.
> 

Nah, its good your ok to upstream your out of tree patch, just
making sure I fill in the holes in my knowledge with Mark :-)

Thanks,
Charles
