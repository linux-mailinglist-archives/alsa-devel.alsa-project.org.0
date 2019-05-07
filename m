Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE29160D0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 11:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A031865;
	Tue,  7 May 2019 11:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A031865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557221122;
	bh=PPaBpeJwJFSMAW0/2snb9hblRHrAL62M1EsYlfRSxmM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qo0Z+MaEDuWi2Nr34yHnFx4bxnXpTsWSmAVUgDfnkF4hheJb1W9DVtcYrsEL0A3uS
	 Y471Nt9DGDxnoH71yE5ZtxE6bjDKV+aYG6x4TERjmrILKAgCOZERS7XVqCGpD0dipZ
	 VukzoMbXxfv6q7A829/anhRZy5co78OqTntNX45U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D147F89671;
	Tue,  7 May 2019 11:23:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8777F89678; Tue,  7 May 2019 11:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B4BF807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 11:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B4BF807B5
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x479NQM3017397,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x479NQM3017397
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 7 May 2019 17:23:26 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS12.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Tue, 7 May 2019
 17:23:26 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: Support low power consumption for ALC3254
Thread-Index: AdUEqfFNg0PmEGXzT5G9nIHf8haChv//htAA//90EGCAAJXtgP//eDTA
Date: Tue, 7 May 2019 09:23:25 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765ABD@RTITMBSVM07.realtek.com.tw>
References: <6FAB7C47BCF00940BB0999A99BE3547A1D765A46@RTITMBSVM07.realtek.com.tw>
 <s5himumirp1.wl-tiwai@suse.de>
 <6FAB7C47BCF00940BB0999A99BE3547A1D765A7C@RTITMBSVM07.realtek.com.tw>
 <s5hpnou39sk.wl-tiwai@suse.de>
In-Reply-To: <s5hpnou39sk.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Support low power consumption for ALC3254
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, May 7, 2019 5:15 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Support low power consumption for ALC3254
> 
> On Tue, 07 May 2019 11:07:14 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > I had sent other patch before.
> > Could it can apply?
> 
> Which patch, specifically?

I resent again.

> 
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Tuesday, May 7, 2019 4:40 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Re: Support low power consumption for ALC3254
> > >
> > > On Tue, 07 May 2019 09:53:24 +0200,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > Chrome OS want to support low power consumption.
> > > > This patch will support low consumption.
> > >
> > > Looks mostly OK, but one question: why hp_pin isn't set?
> >
> > If hp_pin not assigned, depop procedure must run.
> > So, if system doesn't have HP. It must assigned default 0x21 pin to run depop
> procedure.
> 
> OK, point taken.  So it's not a headphone pin but other output pin that
> requires the same depop workaround.

But machine without HP was very few. I don't find it until now.
> 
> Now applied the patch.  Thanks.
> 
> 
> Takashi
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
