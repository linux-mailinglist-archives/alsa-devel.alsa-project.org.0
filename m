Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E24A9D97
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Feb 2022 18:22:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A162616B1;
	Fri,  4 Feb 2022 18:21:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A162616B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643995352;
	bh=KRcIHRc116VynviLuD6q46B/Hmesg79de0V7xvYmSp4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYfIhFsKI81UTxNzwklSvnJhm0mZsw/ahz1qBR7nhAmi3d5//l2hFhc0AQPnylEic
	 mRVlb+wwrB9Nxzi7wuh5r+Dxv0c3NyIidRCx0D/NsGoKifKZpR49b0Rcm0sJ5pdx4v
	 X/E4YOEJSb5+kPvLu4oYZlXgsxgVq/WoBp9Sn++M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00073F80169;
	Fri,  4 Feb 2022 18:21:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3740F80310; Fri,  4 Feb 2022 18:21:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01251F80159
 for <alsa-devel@alsa-project.org>; Fri,  4 Feb 2022 18:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01251F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VpF4GpVs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214D67Ud010048;
 Fri, 4 Feb 2022 11:21:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=xdBwBuv96t+JrYm0JwGstW1HY4kaie1mfnT+D0ViQvE=;
 b=VpF4GpVsNQ/OOi74Vpl4F/GZaKp7l8FC/BCoGICr3Iga8UzfEwz/NkUoe43rygCbECXv
 pqgq6S6P4qtQqkZWr98X66Nq03SayT0MT8vBVxuegsEjBf+o5HvHJL+0YgbNEhiZhSOf
 fRC+XntVx/K4NFPprxiTmY/VHZ5Y39KHkVsamFTBOc8CATnwcpjEol3PJL7/Fj/uyUFK
 fbRMevGi52ncWnKR2OBrG6z9Qnbc+4jgAuKSd4AWXVi4EXywmUGG+tQ7+RoSoldceXdK
 0ZoFckT/WoGNu8sHZHzFUwexHJs7rkZZIRmcg1vrnXT1LCeuMBl4oVn63lvyZcmoiueW cw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e14qn08da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Feb 2022 11:21:18 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Feb
 2022 17:21:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Feb 2022 17:21:17 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E830C11D7;
 Fri,  4 Feb 2022 17:21:16 +0000 (UTC)
Date: Fri, 4 Feb 2022 17:21:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220204172116.GG18506@ediswmail.ad.cirrus.com>
References: <20220201150113.880330-1-martin.kepplinger@puri.sm>
 <20220202095301.GZ18506@ediswmail.ad.cirrus.com>
 <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
 <20220202104657.GA18506@ediswmail.ad.cirrus.com>
 <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
 <20220202133511.GB18506@ediswmail.ad.cirrus.com>
 <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
 <20220203110518.GF18506@ediswmail.ad.cirrus.com>
 <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 6qxj-1TpkBaSrbP7GT0f9JFy_e1u52Eo
X-Proofpoint-GUID: 6qxj-1TpkBaSrbP7GT0f9JFy_e1u52Eo
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

On Fri, Feb 04, 2022 at 10:43:53AM +0100, Martin Kepplinger wrote:
> yes my bad :) If I may, just let me describe my situation again and see
> whether anything else comes to your mind.
> 
> It's weird but I when I set "Capture Volume" to 60 instead of 29, I
> didn't hear a difference.
> 
> So far I don't hear a difference when setting "INPGAR IN1R Switch" on.
> 
> Does "Value" in this ucm description make any sense to you?

Mostly a couple comments inline.

> 
> EnableSequence [                                                      
>                 cset "name='Digital Capture Volume' 127,127"          
>                 cset "name='Capture Volume' 63,63"                    
>                 cset "name='MIXINR IN3R Switch' on"                   
>                 cset "name='MIXINR IN3R Volume' 7"                    
>                 cset "name='INPGAR IN1R Switch' on"                   
>                 cset "name='Input Mode' Analog"                       

Little hard to say without the rest of the ucm file (happy to
have a look at that if you had a handy link?), but this
looks a bit weird. Why are you connecting the MIXINR IN3R stuff
here, you want to go through the PGA most likely?

>         ]                                                             
>                                                                       
> DisableSequence [                                                     
>                 cset "name='INPGAR IN1R Switch' off"                  
>                 cset "name='MIXINR IN3R Switch' off"                  
>                 cset "name='MIXINR IN3R Volume' 0"                    
>                 cset "name='Input Mode' Digital"                      
>         ]                                                             
>                                                                       
> Value {                                                               
>                 CapturePriority "100"                                 
>                 CaptureChannels "2"                                   
>                 CaptureSwitch "name='MIXINR IN3R Volume'"             

This should probably be CaptureVolume, rather than CaptureSwitch.

>                 CaptureSwitch "name='MIXINR IN3R Switch'"             
>                 CapturePCM "hw:${CardId},0"                           
>                 JackControl "Headphones Jack"                         

Assuming your machine driver creates an appropriately named
control.

>         }
> 
> 
> Let me just append the correct amixer contents where I hear my usual
> "quiet and bad signal" recording:

> numid=11,iface=MIXER,name='Capture Switch'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=off,off

This still looks weird, I wouldn't expect you would hear anything
with the "Capture Switch" off, it mutes the PGA. Can you confirm
if this is on whilst you are actually capturing audio?

> numid=84,iface=MIXER,name='INPGAR IN1R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on

I definitely would consider turning this on as just a test thing
not a recommendation on how the part should be used, until we see
if it helps. It was just a weird hunch, I feel the routing is
probably more sensible without it.

> numid=92,iface=MIXER,name='MIXINR IN3R Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
> numid=93,iface=MIXER,name='MIXINR PGA Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on

I don't think you should have both the IN3R and PGA switches
enabled at once. I would suggest only using the PGA switch.

Ok, I think what is happening here is you have both of
these connected, and because you have the PGA muted, you are
only hearing the unboosted mic signal coming through MIXINR
IN3R. This would explain both why the Capture Volume has no
effect and why your signal is quiet.

Thanks,
Charles
