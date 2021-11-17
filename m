Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D0454553
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 12:02:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B8F7185F;
	Wed, 17 Nov 2021 12:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B8F7185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637146978;
	bh=bR5faSYqlSoX1JQ/Lhs0sZ0Z+hrlhW683AB9bR2tOzs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ht96//9bJK+B5mwj1pyQtQ//40K5Z05wTI7nnqXvdAjICvhE/ra700qEO4pd549xA
	 duNbx/cq1Sv3QdjgIW8a1FRw0Ep81gWTA+TD4ezOIsomOUST60k8HdZwCeY/BICYQZ
	 A2GmSD/5CqKZXRh3VXoGGpQ/sdpTF/OadxhtHyE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8870F804BB;
	Wed, 17 Nov 2021 12:01:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCAD6F8027D; Wed, 17 Nov 2021 12:01:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B50DAF80134
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 12:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B50DAF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="L0IqkmmG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH4qhVM020405;
 Wed, 17 Nov 2021 05:00:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=PM2cq25iT99QHflhpvg7GstfduZUCwNr69YKGcLToRM=;
 b=L0IqkmmGuityHymJGHSmk7E8VlWMuDHoAgXlY7ZoBJikIfpgQ7Lup2NovRU8/IKOkTfJ
 J5HzyW39OJYOabXKqcsjAdroqmX1e4ifhhXBYn8+JwNn+/DfjBaZVrO9PdFs3xNPoKRm
 6bZlbmWl+mQecH/MJaI0bzlTrK2Wvqje7EFtgY37B2mP7LJv//iDRBY2bL4WEnZ6Vb+S
 UsZ013qN2Hhj4q7afwViVRBZkoWpJX+18P8Xa/DJB+EgVZvFqpNpcc+zKBzA0ePWHQgH
 emuFz+FCjhEJB6+V0ta0dCS30U3zFjAVNj02yCw1FMh/4VE1PxiupXuAOeBUBrDKiYE5 mQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ccgtn10bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 05:00:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 11:00:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 17 Nov 2021 11:00:52 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D1F2C46D;
 Wed, 17 Nov 2021 11:00:46 +0000 (UTC)
Date: Wed, 17 Nov 2021 11:00:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH 03/10] firmware: cs_dsp: Add version checks on
 coefficient loading
Message-ID: <20211117110046.GE18506@ediswmail.ad.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
 <20211116161609.12223-3-ckeepax@opensource.cirrus.com>
 <YZPzgvB2+oXaCupw@sirena.org.uk>
 <001901d7db19$efbc2830$cf347890$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <001901d7db19$efbc2830$cf347890$@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: YFf5TIw-De6D5ek_LVOe_020bG01_WCx
X-Proofpoint-ORIG-GUID: YFf5TIw-De6D5ek_LVOe_020bG01_WCx
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 'Mark Brown' <broonie@kernel.org>, lgirdwood@gmail.com
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

On Tue, Nov 16, 2021 at 06:44:06PM -0000, Simon Trimmer wrote:
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> > > ---
> > 
> > This has Simon's signoff after yours but no other indication of his
> > involvement?
> 
> I have been working with Charles on most of these patches over the last few
> months and I'd fixed some internal review comments on this one before we
> shared it. If it helps I can certainly ack the chain?
> 

Yeah apologies I am never quite sure what to do in this
situation. We internally have someone add their sign-off when
they make a change to a patch. I could change this to a
Co-authored-by: if that is the preferred upstream approach?

Thanks,
Charles
