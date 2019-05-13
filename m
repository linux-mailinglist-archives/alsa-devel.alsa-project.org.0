Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A731B2E7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 11:32:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DF816A4;
	Mon, 13 May 2019 11:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DF816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557739976;
	bh=M7VCU45CvAuJOpz95oQlEP6NnojZBqT8qLNOZ0B1bMw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmpOSXGA6JDR7lOQ1oymWz1urpvIoLhWQmFnfu3uCRFPs1UX72uH2bjqQUm7o7Os7
	 +OmT7bQgR/6AvA0vnuhhxMD8odF9go79kg+CO0T3TYevN0vloJ2SpPn2T86/bLYWmO
	 HfXXD3EWQ6bPHEzAQ2GuPzu6BbJcwa017/JWhyYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C70F89684;
	Mon, 13 May 2019 11:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47040F89684; Mon, 13 May 2019 11:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 943BBF8072A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 11:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 943BBF8072A
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4D9Uvrx027076,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x4D9Uvrx027076
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 17:30:57 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS12.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Mon, 13 May
 2019 17:30:57 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: Boot procudure on HDA driver
Thread-Index: AdUJaA6+JC6dm+NmSgqJxrJoam6Rn///gUUA//94hcA=
Date: Mon, 13 May 2019 09:30:56 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D766284@RTITMBSVM07.realtek.com.tw>
References: <6FAB7C47BCF00940BB0999A99BE3547A1D766254@RTITMBSVM07.realtek.com.tw>
 <s5hlfzalnxl.wl-tiwai@suse.de>
In-Reply-To: <s5hlfzalnxl.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Boot procudure on HDA driver
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
> Sent: Monday, May 13, 2019 5:11 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Boot procudure on HDA driver
> 
> On Mon, 13 May 2019 11:00:18 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > When System Boot up.
> > The Hda Driver running step was as below.
> >
> > alc_init();
> > alc_shutup();
> > alc_init();
> >
> > The depop procedure was put in spec->init_hook and spec->shutup.
> >
> > But I find more codec which run spec->shutup at boot up. It will occur pop
> noise.
> > If it doesn't run spec->shutup, it will not occur pop noise or reduce pop noise.
> >
> > How could the spec->shutup not run at boot up?
> >
> > I ever test to put the check in spec->shutup() for PM_EVENT_SUSPEND and
> PM_EVENT_HIBERNATE and shutdown.
> > But if power_save=1, it was have issue for this.
> > Codec was idle already in power_save=1 state. If system go suspend, it will
> not run spec->shutup() again.
> 
> I guess it's a runtime PM, hence it's neither PM_EVENT_SUSPEND nor
> PM_EVENT_HIBERNATE.
> 
runtime PM and suspend and hibernate and shutdown need to run spec->shutup(). It's no problem.
But spec->shutup() doesn't need to run in boot up.
And it will set power_save=1 on all dell machine.

If (codec->auto_runtime_pm || codec->bus->shutdown ||
      codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND ||
      codec->core.dev.power.power_state.event == PM_EVENT_HIBERNATE)

So, I need to put upper check code in spec->shutup(). Right?
Thanks.

> Actually, if the shutup procedure makes the problem on a certain platform, just
> skip it.  It's an optional behavior and would be fine without it (of course only if
> it's confirmed to work :)
> 
> 
> Takashi
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
