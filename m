Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F94AC199
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 15:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD116183E;
	Mon,  7 Feb 2022 15:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD116183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644245268;
	bh=kLJe+XOA+c28UwOVtoVMCDuBjn+YNzlVE/48PxB8EOA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBO1zcWiq1FclVM2oR8IMvLYfSytCpLc3/UYdtKSuJxVvilkZK7uaWpjHW8hxwV5S
	 LhyMxRKSeE7sTPAR5UX8Xbm0LoJDkFEKDETwxueX02W/ERQ5+0mGH4HDjVJ/q1fxnQ
	 MbAnakWVUM8uNNzaIxKS0c3+5O/z/qcsAjek6Ieo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C28F8051C;
	Mon,  7 Feb 2022 15:45:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CABAF80310; Fri,  4 Feb 2022 10:50:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A9CDF80083
 for <alsa-devel@alsa-project.org>; Fri,  4 Feb 2022 10:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A9CDF80083
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id 46102DF8D8;
 Fri,  4 Feb 2022 01:50:37 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTOaaZ_tTbf7; Fri,  4 Feb 2022 01:50:36 -0800 (PST)
Message-ID: <801a26e88df1512391e436cc3520ac0fdf1ed386.camel@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 04 Feb 2022 10:50:32 +0100
In-Reply-To: <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
References: <20220201150113.880330-1-martin.kepplinger@puri.sm>
 <20220202095301.GZ18506@ediswmail.ad.cirrus.com>
 <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
 <20220202104657.GA18506@ediswmail.ad.cirrus.com>
 <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
 <20220202133511.GB18506@ediswmail.ad.cirrus.com>
 <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
 <20220203110518.GF18506@ediswmail.ad.cirrus.com>
 <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Feb 2022 15:45:24 +0100
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

Am Freitag, dem 04.02.2022 um 10:43 +0100 schrieb Martin Kepplinger:
> Am Donnerstag, dem 03.02.2022 um 11:05 +0000 schrieb Charles Keepax:
> > On Thu, Feb 03, 2022 at 10:57:44AM +0100, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 02.02.2022 um 13:35 +0000 schrieb Charles
> > > Keepax:
> > > > On Wed, Feb 02, 2022 at 12:55:04PM +0100, Martin Kepplinger
> > > > wrote:
> > > > > Am Mittwoch, dem 02.02.2022 um 10:46 +0000 schrieb Charles
> > > > > Keepax:
> > > > > > On Wed, Feb 02, 2022 at 11:17:34AM +0100, Martin Kepplinger
> > > > > > wrote:
> > > > > > > Am Mittwoch, dem 02.02.2022 um 09:53 +0000 schrieb
> > > > > > > Charles
> > > > > > > Keepax:
> > > > > > > > On Tue, Feb 01, 2022 at 04:01:13PM +0100, Martin
> > > > > > > > Kepplinger
> > > > > > > > wrote:
> > > > > Volume / sensitivity of Analog input is too low, I saw that
> > > > > before.
> > > > > What would you try to change that?
> > > > > 
> > > > 
> > > > Hmm... you say you saw this before? I assume the input volume
> > > > is always low, not just low sometimes? I would probably start
> > > > by
> > > > checking the voltage you have on the micbias, make sure that is
> > > > as expected. Does the signal coming into the IN3R pin look low
> > > > on
> > > > a scope or is it just the level after it has been through the
> > > > ADC
> > > > on the chip that seems low?
> > > 
> > > Literally *no* effort went into this yet :) All I see is when I
> > > set
> > > the
> > > "headset mic" volume to max in gnome settings, the recorded
> > > volume
> > > is
> > > something like "almost usable", so that's off a bit.
> > > 
> > > I can't easily measure, but different headset mics produce
> > > similar
> > > volume.
> > > 
> > 
> > No problem keep me posted any additional tests/info you guys get
> > might help out here. Looking through your routing I think you are
> > sending the mic directly to the speaker, I would definitely test
> > capturing the signal over the I2S as well to confirm it is
> > consistently a low volume on both paths.
> > 
> > > :) thank you very much so far. You already really helped. We can
> > > even
> > > make the mic available now (to enable manually by the user) while
> > > we
> > > look into the volume and detection.
> > > 
> > 
> > Happy to help, please feel free to keep the questions/debug info
> > coming.
> 
> yes my bad :) If I may, just let me describe my situation again and
> see
> whether anything else comes to your mind.
> 
> It's weird but I when I set "Capture Volume" to 60 instead of 29, I
> didn't hear a difference.
> 
> So far I don't hear a difference when setting "INPGAR IN1R Switch"
> on.
> 
> Does "Value" in this ucm description make any sense to you?
> 
> EnableSequence [                                                     
>                 cset "name='Digital Capture Volume' 127,127"         
>                 cset "name='Capture Volume' 63,63"                   
>                 cset "name='MIXINR IN3R Switch' on"                  
>                 cset "name='MIXINR IN3R Volume' 7"                   
>                 cset "name='INPGAR IN1R Switch' on"                  
>                 cset "name='Input Mode' Analog"                      
>         ]                                                            
>                                                                      
> DisableSequence [                                                    
>                 cset "name='INPGAR IN1R Switch' off"                 
>                 cset "name='MIXINR IN3R Switch' off"                 
>                 cset "name='MIXINR IN3R Volume' 0"                   
>                 cset "name='Input Mode' Digital"                     
>         ]                                                            
>                                                                      
> Value {                                                              
>                 CapturePriority "100"                                
>                 CaptureChannels "2"                                  
>                 CaptureSwitch "name='MIXINR IN3R Volume'"

sorry, of course this is a typo I've fixed: CaptureVolume

>             
>                 CaptureSwitch "name='MIXINR IN3R Switch'"            
>                 CapturePCM "hw:${CardId},0"                          
>                 JackControl "Headphones Jack"

I know this is a workaround until I have mic detection.

>  
>         }
> 
> 
> Let me just append the correct amixer contents where I hear my usual
> "quiet and bad signal" recording:
> 
> 


