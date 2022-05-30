Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A019F537927
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 12:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5241933;
	Mon, 30 May 2022 12:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5241933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653906927;
	bh=dTT+3CsVzE3+sgZ5CW+jC5dwUWtw8BJo6nexH+qCIo4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMJs/bvIsGsycDPg2OhOdWSXK1jP+Nl2Pat8Cn9j+yc7OJ3YuX7sT1vorgJGR9R3a
	 MdlmyBJPvRCelSP5oUQb3284BuTdjPuY9gqK+1PAmxIrC1LBAFeG1bG3K/KKi830ux
	 hHVwLravBFnHnreQoFc7AayNFfrGfdHqyzNZQ8Y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0AB8F801F5;
	Mon, 30 May 2022 12:34:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 577A5F8019D; Mon, 30 May 2022 12:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA84F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 12:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA84F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GcHNGFl0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U7BcIt005120;
 Mon, 30 May 2022 05:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=GzhyoGx51XkZ9Mo3yhwG2V/CjnZBylrKcAb8Wsb0AU8=;
 b=GcHNGFl0pZZOMvptLaW9tCAD6pcRDHpIlPTZg8delS0F0HJBwukNRnMzOSy5vDQnoSz+
 DQwsxwyWUdlWgMFcJfDcnlF7QP+/PpQrDZR2+7biV/yNNdryTf/1QfUSb5Oi0l+e2zSs
 bLnNs62iqnX8Qr57MB3usJe4RWcwckMijBcdR8iFQP40p+9V4l35IqZh5J4L70f+2G6b
 FKlAs+z2ijuW01Cw4KkhLUWjUZU5JqgCgpWAw+nF6uFGB6XbHMXPGavdjaFOOySD72+r
 2wN0sWPENalzHps4xD5+Cw76fNeLui7fN/B0Zwm2+3EkjTzvKK6v4ntT5ER+2DR4jtyD Ng== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gbg5nhn79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 May 2022 05:34:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 30 May
 2022 11:34:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 30 May 2022 11:34:21 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6FD2411D1;
 Mon, 30 May 2022 10:34:15 +0000 (UTC)
Date: Mon, 30 May 2022 10:34:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4 00/17] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Message-ID: <20220530103415.GU38351@ediswmail.ad.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
 <871qwf0x8t.wl-tiwai@suse.de>
 <20220530090846.GS38351@ediswmail.ad.cirrus.com>
 <87czfvxtsc.wl-tiwai@suse.de>
 <20220530093639.GT38351@ediswmail.ad.cirrus.com>
 <87a6azxr7h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87a6azxr7h.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: -lN94J1CuJ_EtnbX0lK0T_eaHPkE3bhG
X-Proofpoint-GUID: -lN94J1CuJ_EtnbX0lK0T_eaHPkE3bhG
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Mon, May 30, 2022 at 12:14:26PM +0200, Takashi Iwai wrote:
> On Mon, 30 May 2022 11:36:39 +0200,
> Charles Keepax wrote:
> > On Mon, May 30, 2022 at 11:18:43AM +0200, Takashi Iwai wrote:
> > > On Mon, 30 May 2022 11:08:46 +0200,
> > > Charles Keepax wrote:
> > > > On Fri, May 27, 2022 at 06:13:38PM +0200, Takashi Iwai wrote:
> > > > > On Wed, 25 May 2022 15:16:21 +0200,
> > > > > Vitaly Rodionov wrote:
> > Yeah that should be what is happening here. Although it looks
> > like this code might be removing all the controls if the firmware
> > is unloaded. I will discuss that with the guys, we normal just
> > disable the controls on the wm_adsp stuff.
> 
> OK, that sounds good.  Basically my concern came up from the code
> snippet doing asynchronous addition/removal via work.  This showed
> some yellow signal, as such a pattern doesn't appear in the normal
> implementation.  If this is (still) really necessary, it has to be
> clarified as an exception.
> 

Hm... ok we will think about that. I think that part will
probably still be necessary. Because there is an ALSA control
that selects the firmware, then it is necesarry to defer creating
the controls to some work, since you are already holding the
lock.

I guess we could look at adding locked versions of the add
control functions as well if that might be preferred?

Thanks,
Charles
