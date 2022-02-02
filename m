Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490F4A71AD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 14:36:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92673172D;
	Wed,  2 Feb 2022 14:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92673172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643808988;
	bh=hmlZ41HJw9J3JHWdUsBjIgztv+biztPQs1grfLIHYE4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l4tDYiFNHwpQiRKAYTXwDUa7wPB9kZ1pQ9twyuImVh+8w6pfmx0WBxC0Pk3jfHkOQ
	 BUJMXZ5GAyWIKsBkiKF2+IKCRCBhxynXxe5aIYdbJw0k5tcfkdFyYSM3wCoYAfAn0V
	 LHiy0IEwJsDLDzlkpwbFakjluPRDIwYo0b2g3lA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02BA6F804B1;
	Wed,  2 Feb 2022 14:35:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7495F804B0; Wed,  2 Feb 2022 14:35:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 060DAF80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 14:35:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 060DAF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O9N+QiAX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212Cttd3016922;
 Wed, 2 Feb 2022 07:35:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=zil3erRqQ6REDNww3hB6SYg8k003yQMvo4dOPkUSjxM=;
 b=O9N+QiAXRJltqW1/AI1xHSiXgR42pnrXfOK3zM/n8i/nYSXKzy8vS2MGrt+6X7XQVQ/x
 1B0DJF2+bhW43NfSsmyQuN97uztITN8DenV7+7C4TPjNCmY8g//Vv5DxUJorCnKlNJN+
 08YaiPOC+W5HjikeQt19ZeScBjCB105ImYtXsnSlcYHT8PM5QbyqBPZS/gL6a98qqDZ8
 ZFiOTRizPSlvZZksVuEPVMOlFDdFxbMtLOI3ZORdq3f3f198zMzhdPNgwnOV4w/JDVkD
 2czddpoOnyD2gCdfBnB5ZkYKIBdCN6E81px4fHSxDuxzwNZcJ7BRCEUZ9Uj0XG82ien5 Dg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dxksx2wk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Feb 2022 07:35:13 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 13:35:11 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 2 Feb 2022 13:35:11 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CD6DD46C;
 Wed,  2 Feb 2022 13:35:11 +0000 (UTC)
Date: Wed, 2 Feb 2022 13:35:11 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220202133511.GB18506@ediswmail.ad.cirrus.com>
References: <20220201150113.880330-1-martin.kepplinger@puri.sm>
 <20220202095301.GZ18506@ediswmail.ad.cirrus.com>
 <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
 <20220202104657.GA18506@ediswmail.ad.cirrus.com>
 <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: iI9cdgR_6GcuaMQ8og95Bek4P1CUJXtj
X-Proofpoint-GUID: iI9cdgR_6GcuaMQ8og95Bek4P1CUJXtj
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

On Wed, Feb 02, 2022 at 12:55:04PM +0100, Martin Kepplinger wrote:
> Am Mittwoch, dem 02.02.2022 um 10:46 +0000 schrieb Charles Keepax:
> > On Wed, Feb 02, 2022 at 11:17:34AM +0100, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 02.02.2022 um 09:53 +0000 schrieb Charles Keepax:
> > > > On Tue, Feb 01, 2022 at 04:01:13PM +0100, Martin Kepplinger
> > > > wrote:
> > > Do you have a code example from a different codec that has roughly
> > > what
> > > is missing here? (the sound subsystem is new to me)
> > 
> > Full disclosure this is complete untested, but it should be
> > pretty close. Let me know if it does the trick and I will send a
> > proper patch to the list. I do have a Librem 5 in a draw
> > somewhere so can pull that out if we get really stuck, but that
> > might have to wait until the weekend :-).
> > 
> > I don't know if you guys are using the analogue bypass paths
> > around the digital core on the chip. I think those will still
> > work with the mics set to digital, so I have left the routes as
> > is, but that might require some checking at some point.
> 
> ok that's great and seems to work! that's luxury.
> 

Excellent glad that is working for you, I will prep up a proper
patch and send it to the list. Should get that done tomorrow
morning, if I don't manage it this afternoon.

> Volume / sensitivity of Analog input is too low, I saw that before.
> What would you try to change that?
> 

Hmm... you say you saw this before? I assume the input volume
is always low, not just low sometimes? I would probably start by
checking the voltage you have on the micbias, make sure that is
as expected. Does the signal coming into the IN3R pin look low on
a scope or is it just the level after it has been through the ADC
on the chip that seems low?

The input routing on this chip is pretty byzantine, the output of
just "amixer" showing all the controls in the relevant use-case
would probably be helpful to look over. I suspect there is a
reasonable chance something around the input PGA is not
configured to match the hardware, although I am not the most
familiar with this part so hard to guess at exactly what off the
top of my head.

Finally, do you know how much the amplitude is off by?

> you can do all of our tasks if you want to :)
> 

Ha! Not sure about that, but happy to help out where I can.

Thanks,
Charles
