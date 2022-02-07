Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C804AC113
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 15:22:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A0117AA;
	Mon,  7 Feb 2022 15:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A0117AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644243764;
	bh=vyQboMuod2Foq1LBMcBZ21gamrd6H+BAk28vS/E2gHo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+4Zj/g2tOh4EuD1XQKH8gmVUWqGzlHBTg3UbvWcxPHXf842iHfjz2gT5WUrIvuFz
	 d5aZS7OtFALDvfjGHAFEVCJKAMP88AYmgoGGke76JqdSAX4XCtWwkxVfUyH6SPl4+c
	 oyC7f7V2/+mdHNRIrAjfksip35yjQ8bffr/aHvBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3ACDF800E1;
	Mon,  7 Feb 2022 15:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA7F4F80240; Mon,  7 Feb 2022 15:21:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 207FFF800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 15:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 207FFF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="R5G+Jsjz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EAkfE005957;
 Mon, 7 Feb 2022 08:21:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=aiQdobHVu+OZo+WepQox1wI4nh4eTBu1JSfdpz/m9nQ=;
 b=R5G+JsjzTY0XiU8drZ7R/2avIUB4k2UAcxHd9kVTlXsEjCBLecPfmxOw9uNho0YHz6iD
 85Xu6BMU1TysZl2Ba4sUmF3qZtOiwuaLWPG/0N3wG9dPwM3kyjLe3vQoRrvZQXz6qE6E
 JgciHcJF4iq2+03OrypivI+98/+Bu/FKm3xwxna9R7q5avgVOzvqKVpgA/nFczo2z4QP
 20omERcse98k+yCfrkZfQlSfj/3mGk7Zq4U3rMf/wKvXXl633TE/hOdZY6C126BmlSwX
 AYvRPsaHT6TFHVSJl53My7lEmxtA4CypXZNhbax9mq/WXQCfK3eLB121R8rLnhI1ExGw wQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e34y5r0cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 07 Feb 2022 08:21:30 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Feb
 2022 14:21:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Mon, 7 Feb 2022 14:21:29 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 28629B16;
 Mon,  7 Feb 2022 14:21:29 +0000 (UTC)
Date: Mon, 7 Feb 2022 14:21:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220207142129.GB112838@ediswmail.ad.cirrus.com>
References: <20220202095301.GZ18506@ediswmail.ad.cirrus.com>
 <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
 <20220202104657.GA18506@ediswmail.ad.cirrus.com>
 <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
 <20220202133511.GB18506@ediswmail.ad.cirrus.com>
 <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
 <20220203110518.GF18506@ediswmail.ad.cirrus.com>
 <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
 <20220204172116.GG18506@ediswmail.ad.cirrus.com>
 <fca54f527f619e21c19918ed3165d9ec8f85f6f6.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fca54f527f619e21c19918ed3165d9ec8f85f6f6.camel@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: sIRDfwxHUcNOZs_4qZ-j6P9tPM8ojMe3
X-Proofpoint-ORIG-GUID: sIRDfwxHUcNOZs_4qZ-j6P9tPM8ojMe3
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

On Mon, Feb 07, 2022 at 11:49:32AM +0100, Martin Kepplinger wrote:
> Am Freitag, dem 04.02.2022 um 17:21 +0000 schrieb Charles Keepax:
> > On Fri, Feb 04, 2022 at 10:43:53AM +0100, Martin Kepplinger wrote:
> > > numid=92,iface=MIXER,name='MIXINR IN3R Switch'
> > >   ; type=BOOLEAN,access=rw------,values=1
> > >   : values=on
> > > numid=93,iface=MIXER,name='MIXINR PGA Switch'
> > >   ; type=BOOLEAN,access=rw------,values=1
> > >   : values=on
> > 
> > I don't think you should have both the IN3R and PGA switches
> > enabled at once. I would suggest only using the PGA switch.
> > 
> > Ok, I think what is happening here is you have both of
> > these connected, and because you have the PGA muted, you are
> > only hearing the unboosted mic signal coming through MIXINR
> > IN3R. This would explain both why the Capture Volume has no
> > effect and why your signal is quiet.
> 
> ok. I keep MIXINR IN3R Switch disabled now and the volume is indeed
> high now, and I control volume using
> 
> CaptureSwitch "name='Capture Volume'"
> 
> Volume itself indeed is good now. Recorded voice is very "metallic" and
> "shallow" if you know what I mean - and distorted when using MAX
> volume. The gnome audio recorder doesn't show *any* signal in the UI,
> so that must still be kind of bad - even though I understand recorded
> voice way better now than before.
> 

My first thought is that the signal is clipping somewhere in the
chain. You have a lot of the gaines up very high from when you
were trying to working around the low signal level issues.

Can we be clear here on what paths are in play here. Presumably
the gnome audio recorder is capturing over the I2S. When you say
you can understand the recorded voice way better now, do you mean
in the file captured by the gnome audio recorder? Or are you
listening to that on another path, like direct to the headphones?

> thanks for all the time and help, and sorry for all the wrong amixer
> output I sent you,
> 

No problem, always a bit of back and forth in these debugging
exercises.

> numid=10,iface=MIXER,name='Capture Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=63,step=0
>   : values=63,63
>   | dBscale-min=-23.25dB,step=0.75dB,mute=0

This is +24dB, I would start with something like +0dB, +3dB or
+6dB.

> numid=7,iface=MIXER,name='MIXINR PGA Volume'
>   ; type=INTEGER,access=rw---R--,values=1,min=0,max=7,step=0
>   : values=7
>   | dBrange-
>     rangemin=0,,rangemax=1
>       | dBscale-min=0.00dB,step=6.00dB,mute=0
>     rangemin=2,,rangemax=2
>       | dBscale-min=13.00dB,step=13.00dB,mute=0
>     rangemin=3,,rangemax=4
>       | dBscale-min=18.00dB,step=2.00dB,mute=0
>     rangemin=5,,rangemax=5
>       | dBscale-min=24.00dB,step=0.00dB,mute=0
>     rangemin=6,,rangemax=7
>       | dBscale-min=27.00dB,step=3.00dB,mute=0
> 

Hmm... step size here seems to disagree with the datasheet but
this is either +29dB or +30dB depending on who we trust.

So combining those two you have like +54dB of analogue gain, like
no way that isn't causing the signal to clip.

I would start with 0dB on each, then bump them up to like
+6dB if the signal is really quiet. But somewhere you should
be able to get specs on the mic and work out what actual gain
you need to get a full scale signal out of the mic for the
given micbias voltage. Your hardware folks should be able to help
out there.

Thanks,
Charles
