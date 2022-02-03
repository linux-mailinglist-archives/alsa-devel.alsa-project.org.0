Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005A64A82DC
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 12:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860F516D0;
	Thu,  3 Feb 2022 12:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860F516D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643886398;
	bh=jOPFswXv8z9x8hXVnzqvGPLhfuyzo0liD0LA2ii6V8w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcA3/ge8S3FBw5OMFzhmUczt7iBNdOe6qAPAKrporl91+08n/S2v0sSYfHkJrmD3f
	 jmgk6TGCjU6hfXCc9McLCM5tuA5WwYm7dgZHFhE32Xpde51+UI1qiKJk3LaO0mK9ad
	 YRb4HURLtfJEs5qaqqjzgz0c3SKlqQAKcS93lzrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC780F80082;
	Thu,  3 Feb 2022 12:05:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26EC5F8027C; Thu,  3 Feb 2022 12:05:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E78DF80163
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 12:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E78DF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="D4XsO+vS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21387l5i011362;
 Thu, 3 Feb 2022 05:05:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ljdKv3PQZQtecWzBTHMmhj7GOld7dp9YljFx7IU7Aig=;
 b=D4XsO+vSR71czvFsXzjh44Y9jIocdmxodEVU4FqAvuhuILQarxmUO7G0WwQiI1DQeIld
 kJLO3ghif348OyfgP2TMrlZtFSUNe2q0vuN2i8l9qm+5cfTVfK0uh7PYIm+5v0XOsYiJ
 WqukJiEg5GGDCvND+ALz/AzSBPpirzGI0MIgfgvOb1JFajnQsT7QjU6h78tc4WCYYRCk
 RprsP3NYNKHCCxwGXwc182EgENEHFZa+a05aLQK3k4wyDx8lAtnaQWMLw8dQov5aP0BV
 lZOUFB1LkzMYNiDmgS8JyeYw4MiV5q9TfXyG8Vl2MNORAP4+bfvBPfOleSRc1+kmGP6e lQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e0b8vg4sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Feb 2022 05:05:21 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 11:05:19 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Feb 2022 11:05:19 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EC3D02A9;
 Thu,  3 Feb 2022 11:05:18 +0000 (UTC)
Date: Thu, 3 Feb 2022 11:05:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220203110518.GF18506@ediswmail.ad.cirrus.com>
References: <20220201150113.880330-1-martin.kepplinger@puri.sm>
 <20220202095301.GZ18506@ediswmail.ad.cirrus.com>
 <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
 <20220202104657.GA18506@ediswmail.ad.cirrus.com>
 <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
 <20220202133511.GB18506@ediswmail.ad.cirrus.com>
 <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: bZDgyw5IXXTzDTRurfiNMzJOP-BSG0G0
X-Proofpoint-GUID: bZDgyw5IXXTzDTRurfiNMzJOP-BSG0G0
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

On Thu, Feb 03, 2022 at 10:57:44AM +0100, Martin Kepplinger wrote:
> Am Mittwoch, dem 02.02.2022 um 13:35 +0000 schrieb Charles Keepax:
> > On Wed, Feb 02, 2022 at 12:55:04PM +0100, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 02.02.2022 um 10:46 +0000 schrieb Charles Keepax:
> > > > On Wed, Feb 02, 2022 at 11:17:34AM +0100, Martin Kepplinger
> > > > wrote:
> > > > > Am Mittwoch, dem 02.02.2022 um 09:53 +0000 schrieb Charles
> > > > > Keepax:
> > > > > > On Tue, Feb 01, 2022 at 04:01:13PM +0100, Martin Kepplinger
> > > > > > wrote:
> > > Volume / sensitivity of Analog input is too low, I saw that before.
> > > What would you try to change that?
> > > 
> > 
> > Hmm... you say you saw this before? I assume the input volume
> > is always low, not just low sometimes? I would probably start by
> > checking the voltage you have on the micbias, make sure that is
> > as expected. Does the signal coming into the IN3R pin look low on
> > a scope or is it just the level after it has been through the ADC
> > on the chip that seems low?
> 
> Literally *no* effort went into this yet :) All I see is when I set the
> "headset mic" volume to max in gnome settings, the recorded volume is
> something like "almost usable", so that's off a bit.
> 
> I can't easily measure, but different headset mics produce similar
> volume.
> 

No problem keep me posted any additional tests/info you guys get
might help out here. Looking through your routing I think you are
sending the mic directly to the speaker, I would definitely test
capturing the signal over the I2S as well to confirm it is
consistently a low volume on both paths.

> :) thank you very much so far. You already really helped. We can even
> make the mic available now (to enable manually by the user) while we
> look into the volume and detection.
> 

Happy to help, please feel free to keep the questions/debug info
coming.

> numid=11,iface=MIXER,name='Capture Switch'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=off,off

Ermm.... this should be muting the input PGA? I wouldn't expect
any input from the analogue here.

> numid=10,iface=MIXER,name='Capture Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=63,step=0
>   : values=29,29
>   | dBscale-min=-23.25dB,step=0.75dB,mute=0

This is the PGA volume on the inputs and appears to be set to
-1.5dB. Not sure if that might be part of the problem?

> numid=23,iface=MIXER,name='DAC Monomix Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
> numid=9,iface=MIXER,name='Digital Capture Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=127,step=0
>   : values=116,116
>   | dBscale-min=-72.00dB,step=0.75dB,mute=1

This looks set to +15dB at the moment, so presumably no problem
here.

> numid=84,iface=MIXER,name='INPGAR IN1R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off

This is a total random hunch and might just be my unfamilarity
with the chip. But I would definitely try a test with this switch
turned on. From the input circuitry diagrams in the data sheet
kinda looks like it will be needed to connect one side of the
input PGA to the grounded output in your schematic.

> numid=85,iface=MIXER,name='INPGAR IN2R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off
> numid=86,iface=MIXER,name='INPGAR IN3R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
> numid=87,iface=MIXER,name='INPGAR IN4R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off
> numid=2,iface=MIXER,name='Input Mixer Switch'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=off,on
> numid=94,iface=MIXER,name='Input Mode'
>   ; type=ENUMERATED,access=rw------,values=1,items=2
>   ; Item #0 'Analog'
>   ; Item #1 'Digital'
>   : values=1

Ah... I think you have the wrong path configured here. This
appears to be coming from the digital mics. Just to confirm it is
the analog mics you are having issues with?

> numid=91,iface=MIXER,name='MIXINR IN2R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off
> numid=6,iface=MIXER,name='MIXINR IN2R Volume'
>   ; type=INTEGER,access=rw---R--,values=1,min=0,max=7,step=0
>   : values=7
>   | dBscale-min=-15.00dB,step=3.00dB,mute=0
> numid=92,iface=MIXER,name='MIXINR IN3R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off
> numid=8,iface=MIXER,name='MIXINR IN3R Volume'
>   ; type=INTEGER,access=rw---R--,values=1,min=0,max=7,step=0
>   : values=0
>   | dBscale-min=-15.00dB,step=3.00dB,mute=0
> numid=93,iface=MIXER,name='MIXINR PGA Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
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

Plenty of gain on the PGA.

> numid=65,iface=MIXER,name='Speaker Switch'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=on,off
> numid=64,iface=MIXER,name='Speaker Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=127,step=0
>   : values=121,121
>   | dBscale-min=-121.00dB,step=1.00dB,mute=1

Thanks,
Charles
