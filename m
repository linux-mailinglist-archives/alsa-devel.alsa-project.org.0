Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB037160DC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 11:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4252A17D2;
	Tue,  7 May 2019 11:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4252A17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557221203;
	bh=fQytKXnN+nuXOYxZM+e1c4BjAJpKSLg1+8A4A2jeOJs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/xAx8flIqjeBi8cgwq0IdoWUluy8C0MNXTbtvzeAhbDC0Hf1JYEnger9lvMI7Xf5
	 aghWGAKpt2mj8Wu/i8VR6sO5W+Y2f/E6DMVIfdDDcQHywGBY0o51OeKDVs2ffKeT6Y
	 snG+rz/GC8ptY2UwSJZqcUNX9X6M+GbxgXecXYl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0A42F8970E;
	Tue,  7 May 2019 11:25:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C579F89682; Tue,  7 May 2019 11:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C17FF89673
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 11:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C17FF89673
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x479PCai018196,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x479PCai018196
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 7 May 2019 17:25:12 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS12.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Tue, 7 May 2019
 17:25:11 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: FW: move eapd coef function before ACT_PRE_PROBE state
Thread-Index: AdT/J/zgDi+/s6pzRJ+XG6C5XTeJJQErwFhQADei07D//3ubgP//eW0Q
Date: Tue, 7 May 2019 09:25:10 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765ACE@RTITMBSVM07.realtek.com.tw>
References: <6FAB7C47BCF00940BB0999A99BE3547A1D765A9D@RTITMBSVM07.realtek.com.tw>
 <s5hmujy39go.wl-tiwai@suse.de>
In-Reply-To: <s5hmujy39go.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] FW: move eapd coef function before ACT_PRE_PROBE
	state
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
> Sent: Tuesday, May 7, 2019 5:23 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: FW: move eapd coef function before ACT_PRE_PROBE state
> 
> On Tue, 07 May 2019 11:17:15 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > This one.
> 
> I already replied twice.  The patch needs rewrite.
> Didn't you get the post?

Yes, I didn't get.
Ok! I rewrite patch again.

> 
> 
> thanks,
> 
> Takashi
> 
> >
> > -----Original Message-----
> > From: Kailang
> > Sent: Monday, May 6, 2019 2:46 PM
> > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > Subject: RE: move eapd coef function before ACT_PRE_PROBE state
> >
> > Hi Takashi,
> >
> > Are you available for apply this ?
> > Thanks.
> >
> > BR,
> > Kailang
> >
> > > -----Original Message-----
> > > From: Kailang
> > > Sent: Tuesday, April 30, 2019 3:41 PM
> > > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: move eapd coef function before ACT_PRE_PROBE state
> > >
> > > Hi Takashi,
> > >
> > > alc_fill_eapd_coef(),this function was change EAPD control to default.
> > > Default was set EAPD by verb control.
> > > This function was run in ACT_INIT state.
> > > Move it to ACT_PRE_PROBE above. It will have a chance to change EAPD
> > > control on ACT_PRE_PROBE state. It could change control by 0x20 coef bit.
> > >
> > > BR,
> > > Kailang
> > [2 0000-move-eapd-coef-func.patch <application/octet-stream (base64)>]
> >
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
