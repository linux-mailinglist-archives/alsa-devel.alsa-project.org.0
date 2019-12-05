Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05D114148
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 14:15:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DAE51668;
	Thu,  5 Dec 2019 14:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DAE51668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575551730;
	bh=GPf9uyQG3B0naHbXMhfy/GsT4DXqpZiTp7dB1EyCd4g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1FSOrnVE88L5ctFl/1ugLOwp08JwcuInyQpKA6v0gaoFpctOByZKr8/KFHDCSeAB
	 UTA76f3y9KPTTtTm1Y4dOyXadZCArux3BCnv+u76qd3CAnpk+4TaTGfnmVVQuMbQWO
	 QjUhsPOaUgA8dfWKMJd6WUgS1El0lavjFoUWv/Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1178BF80228;
	Thu,  5 Dec 2019 14:13:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C069DF801F8; Thu,  5 Dec 2019 14:13:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heaven.argudo.org (heaven.argudo.org [195.154.250.235])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B77C2F8010F
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 14:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B77C2F8010F
Received: by heaven.argudo.org (Postfix, from userid 1008)
 id 44557150271F; Thu,  5 Dec 2019 14:13:10 +0100 (CET)
Received: from deiphobe (maison [78.229.44.71]) (Authenticated sender: jpa)
 by heaven.argudo.org (Postfix) with ESMTPSA id 0BB101501F81;
 Thu,  5 Dec 2019 14:13:09 +0100 (CET)
Message-ID: <1b39dd4025e812ed3bb6bd1c998bd75569293b49.camel@argudo.org>
From: Jean-Paul Argudo <jpa@argudo.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Thu, 05 Dec 2019 14:13:08 +0100
In-Reply-To: <20191109123634.GA22893@workstation>
References: <769b9f5dae864cf1eb433ab84eed385a161931c8.camel@argudo.org>
 <20191030091540.GA1856@workstation>
 <ad6f8c036538aa755017efe976ac223bb7c90be3.camel@argudo.org>
 <c4b792255de178094fd53d80a25fc75b795e3acb.camel@argudo.org>
 <20191030115001.GB6313@workstation>
 <b5a6913851d53f19a892ee88042921a38b1a7628.camel@argudo.org>
 <20191109123634.GA22893@workstation>
Organization: PostgreSQL Fr
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] snd-bebob : from kernel 4.13 to 5.3.19 and .20
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi, Hi all,

Le samedi 09 novembre 2019 =E0 21:36 +0900, Takashi Sakamoto a =E9crit :
> Hi,
> =

> I'm sorry to be late for reply but I have a short vacation in this
> week.

Same here, I was in vacation in Asia until late last week!

> =

> On Wed, Oct 30, 2019 at 03:40:03PM +0100, Jean-Paul Argudo wrote:
> > >  * /proc/asound/cardX/firewire/firmware
> > =

> > $ cat /proc/asound/card3/firewire/firmware =

> > Manufacturer:	bridgeCo
> > Protocol Ver:	1
> > Build Ver:	0
> > GUID:		0x00130E010004394C
> > Model ID:	0x02
> > Model Rev:	1
> > Firmware Date:	20061207
> > Firmware Time:	140826
> > Firmware ID:	0x0
> > Firmware Ver:	16850194
> > Base Addr:	0x20080000
> > Max Size:	1572864
> > Loader Date:	20051019
> > Loader Time:	094952
> =

> Before vacation I made arrangement to buy Focusrite Saffire LE in
> used
> market and today it arrived. As long as I can see, the unit uses the
> same
> firmware which your unit uses.

Great, thanks for that...

> =

> > > > At startup it lights green ok, but no sound is playable, then
> > > > the
> > > > lights turn orange (like it is when it's not working), I hear a
> > > > "relay sound" (a electric clic of a relay), then, the Saffire
> > > > LE
> > > > disapears from the sound menu in Ubuntu sound menu.
> =

> I can regenerate this phenomena.

Uff! :)

> =

> > > > I can see this in dmesg:
> > > > =

> > > > [   19.083583] snd-bebob fw1.0: Detect discontinuity of CIP: 10
> > > > 50
> > > > [   19.746665] snd-bebob fw1.0: Detect discontinuity of CIP: A0
> > > > A8
> > > > ...
> > > > [  284.965508] snd-bebob fw1.0: Detect discontinuity of CIP: D0
> > > > 10
> > > > [  285.469348] snd-bebob fw1.0: Detect discontinuity of CIP: 68
> > > > A8
> > > > [  285.965174] snd-bebob fw1.0: Detect discontinuity of CIP: 20
> > > > 60
> > > > [  285.981618] firewire_core 0000:05:01.0: phy config: new
> > > > root=3Dffc1,
> > > > gap_count=3D5
> > > > [  290.103982] firewire_core 0000:05:01.0: phy config: new
> > > > root=3Dffc1, gap_count=3D5
> =

> I can see as well.
> =

> Then, I realized that these discontinuity occurs in packet streaming
> of 'second or later'. In short, once disconnection of packet
> streaming,
> the unit transfers packets with discontinuity in packet streaming of
> reconnection. Furthermore, the discontinuity is in the early isoc
> cycles of packet streaming.
> =

> I've already commit to avoid the detection of discontinuity in recent
> commit for v5.5 kernel (under development):
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/so=
und/firewire/bebob?id=3Dacfedcbe1ce4c69e1da914f39c02d945c80198d4

Thanks for the patch, unfortunately I don't have time until this week-
end to test the linux kernel version of the patch..

BUT:

> =

> =

> In this patch, isoc packets from the device are captured enough after
> connection to skip early cycles of packet streaming, thus the
> discontinuity is not detected.
> =

> As long as I tested, this version of ALSA BeBoB driver works well
> with
> the device. I'd like you to test with backport drivers as well:
> https://github.com/takaswie/snd-firewire-improve

I tested this DKMS version, it's easier for me and with less impacts.

What I can say is that my unit is running now normaly on my computer, =

with =


$ uname -a
Linux deiphobe 5.3.0-20-lowlatency #21-Ubuntu SMP PREEMPT Wed Oct 23
17:03:51 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

kernel, on Ubuntu 19.10

Running the simple DKMS install version on the README of the snd-
firewire-improve, with a recent git clone

Tell me if you need more information so far.

I continue on testing things, but for the moment, 0 problems (I also
have a audio unit on USB (GTX headset on USB) for audioconferencing
stuff (Zoom) and so far, no problem at all, I can use both.

Same with the NVDIA output over HDMI, on my screen (with a crappy small
stereo inside the screen). =


Very cool to have the ADAM F7 monitors sound back!!!!!!


**thanks**** !!

> =

> =

> =

> Regards
> =

> Takashi Sakamoto
> =


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
