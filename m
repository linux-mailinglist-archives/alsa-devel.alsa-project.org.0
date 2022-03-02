Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6BB4CA42A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 12:50:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BF42010;
	Wed,  2 Mar 2022 12:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BF42010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646221828;
	bh=Z+JT0JaK2DEQ9ki284ivjVJ1uaRhASvqWRq504nzxMU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gm/1djZX2A7+Melnt5XO35OEen3qXg97RaqZNK5yr6L9MmETKj2xJIgiiZHGkTiIk
	 8UB/QzVLdKuL6uahEVz6phlRm+aWCOD5SruLF7INQS/iybkM5xIGrcnCRzqgBriIfW
	 NbJ694NSMlJUhXYjNI/c8Jd7sDW24Vt22kkyojEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3776AF80154;
	Wed,  2 Mar 2022 12:49:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AD0DF801D5; Wed,  2 Mar 2022 12:49:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2119FF80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 12:49:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2119FF80154
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id A33C5DF9DA;
 Wed,  2 Mar 2022 03:48:35 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2-5v90DzmPF; Wed,  2 Mar 2022 03:48:34 -0800 (PST)
Message-ID: <ebede30e994b8178c4a929814c7f85739656c621.camel@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Wed, 02 Mar 2022 12:48:28 +0100
In-Reply-To: <b867e8d576536907d383e66f85afee995074b53b.camel@puri.sm>
References: <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
 <20220202104657.GA18506@ediswmail.ad.cirrus.com>
 <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
 <20220202133511.GB18506@ediswmail.ad.cirrus.com>
 <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
 <20220203110518.GF18506@ediswmail.ad.cirrus.com>
 <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
 <20220204172116.GG18506@ediswmail.ad.cirrus.com>
 <fca54f527f619e21c19918ed3165d9ec8f85f6f6.camel@puri.sm>
 <20220207142129.GB112838@ediswmail.ad.cirrus.com>
 <20220301134441.GK38351@ediswmail.ad.cirrus.com>
 <b867e8d576536907d383e66f85afee995074b53b.camel@puri.sm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Am Dienstag, dem 01.03.2022 um 15:00 +0100 schrieb Martin Kepplinger:
> Am Dienstag, dem 01.03.2022 um 13:44 +0000 schrieb Charles Keepax:
> > On Mon, Feb 07, 2022 at 02:21:29PM +0000, Charles Keepax wrote:
> > > On Mon, Feb 07, 2022 at 11:49:32AM +0100, Martin Kepplinger
> > > wrote:
> > > > Am Freitag, dem 04.02.2022 um 17:21 +0000 schrieb Charles
> > > > Keepax:
> > > > > On Fri, Feb 04, 2022 at 10:43:53AM +0100, Martin Kepplinger
> > > > > wrote:
> > > > Volume itself indeed is good now. Recorded voice is very
> > > > "metallic" and
> > > > "shallow" if you know what I mean - and distorted when using
> > > > MAX
> > > > volume. The gnome audio recorder doesn't show *any* signal in
> > > > the
> > > > UI,
> > > > so that must still be kind of bad - even though I understand
> > > > recorded
> > > > voice way better now than before.
> > > > 
> > > 
> > > My first thought is that the signal is clipping somewhere in the
> > > chain. You have a lot of the gaines up very high from when you
> > > were trying to working around the low signal level issues.
> > > 
> > > Can we be clear here on what paths are in play here. Presumably
> > > the gnome audio recorder is capturing over the I2S. When you say
> > > you can understand the recorded voice way better now, do you mean
> > > in the file captured by the gnome audio recorder? Or are you
> > > listening to that on another path, like direct to the headphones?
> > > 
> > > > thanks for all the time and help, and sorry for all the wrong
> > > > amixer
> > > > output I sent you,
> > > > 
> > > 
> > 
> > Hey, just wanted to check everything was going ok on this stuff?
> > Did the volume tweaks get things sounding more normal, and any
> > other problems you guys are having?
> > 
> > Thanks,
> > charles
> 
> Hi Charles!
> 
> that's really nice of you to ask. Sorry for not replying earlier.
> Mainly cset "name='MIXINR PGA Volume' 0,0" made things much better
> indeed. I took a break from this then and the issue is still open,
> here:
> https://source.puri.sm/Librem5/librem5-base/-/merge_requests/296
> or if you want to look at the current ucm file:
> https://source.puri.sm/Librem5/librem5-base/-/blob/bb48912242dd0db1f35c6de8425984414c6d37bb/default/audio/ucm2/Librem_5/HiFi.conf
> 
> As you know I'm no expert with the codec and this definitely can be
> improved: When visualizing the signal, it doesn't look "good" yet and
> the signal strength seems to only go to 50% of the available scale
> (in
> the gnome volume setting). Actually I'll talk about this to Guido
> tomorrow and even though it is kind of usable now, I hope to that we
> can come up with a profile that we're preliminarliy happy with.
> 
> Of course we already use your "Input Mode" control.
> 
> thanks,
> 
>                                 martin
> 
> 

Hi Charles,

Let me forward the commit message I just did for the ucm settings here,
now that I have a *bit* of an overview of the codec:

There are 3 Volume controls for the analog parts, all before the ADC.
In order from Jack to ADC, they are:

numid=10,iface=MIXER,name='Capture Volume'
   ; type=INTEGER,access=rw---R--,values=2,min=0,max=63,step=0
   : values=63,63
   | dBscale-min=-23.25dB,step=0.75dB,mute=0

"Input PGA Volume Control". 31=0dB. We use 39=+6dB.


numid=7,iface=MIXER,name='MIXINR PGA Volume'
   ; type=INTEGER,access=rw---R--,values=1,min=0,max=7,step=0
   : values=7
   | dBrange-
     rangemin=0,,rangemax=1
       | dBscale-min=0.00dB,step=6.00dB,mute=0
     rangemin=2,,rangemax=2
       | dBscale-min=13.00dB,step=13.00dB,mute=0
     rangemin=3,,rangemax=4
       | dBscale-min=18.00dB,step=2.00dB,mute=0
     rangemin=5,,rangemax=5
       | dBscale-min=24.00dB,step=0.00dB,mute=0
     rangemin=6,,rangemax=7
       | dBscale-min=27.00dB,step=3.00dB,mute=0

"Right input PGA to Right input Boost-Mixer Gain"
0=0dB. we use 1=+3dB.


numid=8,iface=MIXER,name='MIXINR IN3R Volume'
  ; type=INTEGER,access=rw---R--,values=1,min=0,max=7,step=0
  : values=6
  | dBscale-min=-15.00dB,step=3.00dB,mute=0

5=0dB. we use 6=+3dB. That's a later amplifier, "Boost-Mixer Gain".

("quotes" are from the datasheet)

Still, the recording sounds pretty good I think, but since gnome sound-
recording doesn't visualize the signal waves - whatever that means :)
I'll look at the file in audacity or something similar later.


thanks for having a look,

                         martin


