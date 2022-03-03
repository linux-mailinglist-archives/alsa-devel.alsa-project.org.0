Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7114CBC84
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 12:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29BF517B5;
	Thu,  3 Mar 2022 12:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29BF517B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646306900;
	bh=tV/Ow5Jp4b3MHtm2QDHCd+vujg3ZfeZ36OEjSUEriUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l63+eBUxl1+26DsIsaYwu2QgSvc3EGbGOpFDFYwF3NqogWRP1PGtYUU0tzkgHB73O
	 8Dbfn2r8Hfskb4RzpvG66p40KvsksoCK2Jn65Symlv21wJwYoAEBAYDi4DtobScxXK
	 Qf4EpNkytE2WgREPqcQp1PnB17fBzcmBgnodFWzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DAAF80166;
	Thu,  3 Mar 2022 12:27:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 396FCF80152; Thu,  3 Mar 2022 12:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8877BF80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 12:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8877BF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="C2vF6nFQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 223509Bm013880;
 Thu, 3 Mar 2022 05:27:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=EAVQ9BTgA44GRc27JLLgB99fSIgoFgOWBfBA7P8DU7o=;
 b=C2vF6nFQPlgkzR4J/aTvN3MgR2zWtIREBe87y4x18cu+Pmzi81wYPwU8NGyjvrIT4EmI
 nTzQ1CgeAlAi1BYbPZPLnsNoACB6SudKYC3lVY3KGsCrNRWXBMJT/Dj94nSYnOJw6hVF
 LZ5CbL7ahza0LYVpIGkAvbkrrvYr99o4h26m2AMWAOkLa/rNjmWU+Vif9m19pyn+0CRT
 OHHgiaWvw8RsLEqZGhYNAWeEGKYIaJgBlVsQXjplWHMTswPDy4FJA9B8ts2z9yYV3DRw
 8dP5Rdru2/Hgz+3Pa/ESbCJE4K2PffPlZUqfKI7kdKkmDQF9RWy0E/wb5wFwTEWyoonS nw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8fv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 05:27:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 11:27:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 11:27:00 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CFAF42A1;
 Thu,  3 Mar 2022 11:27:00 +0000 (UTC)
Date: Thu, 3 Mar 2022 11:27:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220303112700.GM38351@ediswmail.ad.cirrus.com>
References: <20220203110518.GF18506@ediswmail.ad.cirrus.com>
 <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
 <20220204172116.GG18506@ediswmail.ad.cirrus.com>
 <fca54f527f619e21c19918ed3165d9ec8f85f6f6.camel@puri.sm>
 <20220207142129.GB112838@ediswmail.ad.cirrus.com>
 <20220301134441.GK38351@ediswmail.ad.cirrus.com>
 <b867e8d576536907d383e66f85afee995074b53b.camel@puri.sm>
 <ebede30e994b8178c4a929814c7f85739656c621.camel@puri.sm>
 <20220302134017.GL38351@ediswmail.ad.cirrus.com>
 <1eecf3fec0b1e7a2f229f4b6cb6dea3955f19dff.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1eecf3fec0b1e7a2f229f4b6cb6dea3955f19dff.camel@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: SHAbAPGswAgFV9BjismtGd7wHEZpIs6w
X-Proofpoint-GUID: SHAbAPGswAgFV9BjismtGd7wHEZpIs6w
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@puri.sm, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org, geert@glider.be,
 daniel.baluta@nxp.com
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

On Wed, Mar 02, 2022 at 03:11:00PM +0100, Martin Kepplinger wrote:
> Am Mittwoch, dem 02.03.2022 um 13:40 +0000 schrieb Charles Keepax:
> > On Wed, Mar 02, 2022 at 12:48:28PM +0100, Martin Kepplinger wrote:
> > > Am Dienstag, dem 01.03.2022 um 15:00 +0100 schrieb Martin
> > > > Am Dienstag, dem 01.03.2022 um 13:44 +0000 schrieb Charles
> > > > > On Mon, Feb 07, 2022 at 02:21:29PM +0000, Charles Keepax wrote:
> > > > > > On Mon, Feb 07, 2022 at 11:49:32AM +0100, Martin Kepplinger
> > > > > > > Am Freitag, dem 04.02.2022 um 17:21 +0000 schrieb Charles
> > > > > > > > On Fri, Feb 04, 2022 at 10:43:53AM +0100, Martin
> > Although your previous control dumps had that input set
> > on. I suspect if you have both enabled you will get some slightly
> > weird effects, there is probably a slightly phase delay through
> > the PGA and there won't be on the direct path, so when they mix
> > together it will likely sound weird.
> 
> it was not that bad but with your changes, especially a recorded "s"
> sounds indeed better now.
> 

Awesome hopefully that should be us getting pretty close.

> > Hopefully that gets us to a clean signal. The settings described
> > in your commit message give +9dB analogue gain which seems
> > reasonable to me, and from the patch itself looks like you have
> > +15dB digital gain, which feels a little high but not total
> > unreasonable.
> I left MIXINR PGA Volume at 1 and Capture Volume ("Input PGA Volume
> Control") at 39 for now since I think it shouldn't be quieter than that
> at least.

I think we probably bump the PGA gain up another 3dB, maybe even
6dB if you really need to, I would just be careful to test some
very loud sound levels to make sure your not starting to clip the
signal.

Thanks,
Charles
