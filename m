Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AA9A35FB
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD39886;
	Fri, 30 Aug 2019 13:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD39886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567165659;
	bh=m648SDeiAlsV3OAh38RNn+txw+FFlhqMRdCfUaKn8t0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qhoxdeKaoE/FnbznKKGcMRJTvKQev8gcud2vjEgs8SagDHz2GFiLH5kF9F8a9/yZG
	 Etk1EQAz0ZO5akWVGt3TPV6MXP7NYrmTpg+nyRrfDbHjmxXhr77cBBxMsUa6PCpfEJ
	 owYXrGGyAXBfttsdQLeS7ubrOtkEKnLpLaKgiHAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C2AF805F5;
	Fri, 30 Aug 2019 13:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0734BF8038F; Fri, 30 Aug 2019 13:45:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_29, PRX_BODY_30, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id 14F62F800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F62F800D1
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id 8232C209D35A; Fri, 30 Aug 2019 13:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su 8232C209D35A
Date: Fri, 30 Aug 2019 13:45:10 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190830114510.GA10027@xn--80adja5bqm.su>
References: <20190404192430.GA24729@xn--80adja5bqm.su>
 <20190719111231.GA26592@xn--80adja5bqm.su>
 <s5hzhla9j8b.wl-tiwai@suse.de>
 <20190720165435.GA5855@xn--80adja5bqm.su>
 <20190819195714.GA2737@xn--80adja5bqm.su>
 <s5hef1dthbk.wl-tiwai@suse.de>
 <20190822203031.GA22363@xn--80adja5bqm.su>
 <s5h5zmg48u2.wl-tiwai@suse.de>
 <20190829103805.GA1525@xn--80adja5bqm.su>
 <s5hsgpk2os6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hsgpk2os6.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Surround speaker connection on Acer 8951G
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

Hi Takashi,

On Thu, Aug 29, 2019 at 01:29:13PM +0200, Takashi Iwai wrote:
> > > One possible way with the current code (and your latest patch) would
> > > be to create a UCM profile.  The driver should still provide the jack
> > > detection on the pin 0x1b as "Surround Jack", and this can be used as
> > > the headphone jack detection.
> > 
> > I gogled it up and I did find HDAudio-Gigabyte-ALC1220DualCodecs as an
> > example, so basically the solution in this case would be split between
> > the driver and alsa-lib?
> 
> Right.

I did some digging yesterday and found out that documentation on the UCM
profiles is sparse. I cloned your alsa-lib repo from github and looked
at the available profiles. One thing that is not clear to me:
the configurations have entries for JackControl and JackHWMute, however
unless I totally missed it - those strings are not being parsed anywhere
in the code? I first looked at parser.c as suggested by the man page and
later grepped through the whole tree - nothing.

From various examples which I found when searching for answers I could see,
that in most cases the desired _verb section of the profile is activated
via a udev rule, but I was not able to find anything that would be
hooked to jack sense to switch between devices? 

I know it could be done via acpid, is this the way it is meant to be used or
am I missing something, especially in regard to those JackHWMute strings?

How exactly is card longname which can be set in the driver connected to all 
this, I understand there is no automatic mechanism and that everyone needs to 
set up their custom udev scripts anyway?

I more or less got things to behave using a custom profile with device
sections for Speakers and Headphones, which basically mutes everything
except surround in Headphone mode, so technically I could hook it up to
acpid and be done with it. To be honest, I'd be more happy with an "out of the
box" experience, which leads me back to the driver.

> > Are there any disadvantages to muting the other channels directly in the
> > driver? Or would it be a viable option to extend the auto-parser to
> > handle the remaining channels?
> 
> It's not so trivial to extend.  The logic of driver parser assumes the
> single purpose pins, and if they appear doubly, the behavior becomes
> confusing.  For example, if you just add the same pin to both
> speaker_pins[] and hp_pins[], all speaker_pins[] get muted by the
> auto-mute, hence you'll mute the headphone again.  OTOH, if you don't
> list up the pin in speaker_pins[], it won't be used for speakers for
> multi-channels, obviously.

This confirms what I have seen when trying things out last week, the pin could
be either a speaker or a headphone, but not both, meaning I would either "lose"
the ability to use 5.1 profiles or the system would not "see" the headphones
as headphones.

> > Personally, I would prefer a solution at one place, but I follow your lead here,
> > if you say that UCM is the way to go, then so be it.
> 
> We can give it a try.  If it doesn't work as expected, we'd need more
> extension in the driver side.


Would you accept a model-quirk solution that is purely in the driver, which 
monitors jack presence on 0x1b and simply mutes the remaining speakers directly?

This way it could simply work as expected without an additional userspace
setup of alsaucm, udev, acpid.

> > I played around with jack detection and I had the feeling that it did not work
> > reliably, or maybe I misunderstood something?

[...]

> > I kept watching dmesg, when nothing is playing the plugged in/unplugged
> > messages appear correctly, but if I start speaker test and replug during
> > the playback, nothing is printed.
> 
> Check rather "Speaker Surround Jack" state upon plugging the
> headphone.  Does it change reliably?

Check - where exactly? I did the following test:
- ran speaker test
- watched dmesg -wH with my printouts + ran alsa_listen in another terminal

While alsa_listen was correctly showing:
jack/lineout LINEOUT plug
jack/lineout LINEOUT unplug

dmesg remained silent. I figured that I may be hooking to the wrong function,
in the code I pasted earlier I was hooking up to the hp_automute_hook, so I
changed it to line_automute_hook, but the behavior is the same:

when something is playing, the automute hook is not being triggered upon
plugging/unplugging. When nothing is playing, its being called reliably and
the printouts are in sync with acpi_listen.

Which leads me to the following question: is the automute hook the right
place for jack sensing in the driver at all? I did search for examples, but
I failed at figuring out the proper way to hook up to jack state changes, or
rather, I coul dsee that hda_jack_callback is being hooked to automute
everywhere.

To make it clearer: at this point its not about the "correct state" of the jack,
but rather about being triggered at all when something gets physically plugged
into or unplugged from the port during an ongoing playback.

> Note that even if you set such flags manually like the above, it won't
> work, because of the reasons I already mentioned.

Right, makes sense. In my debug code I was mostly misusing
spec->gen.hp_jack_present as a "free" variable for remembering the state.

> > Turned out it was indeed a GPIO, I won't describe all the things I tried, in the
> > end it was a lucky click on the dir_out checkbox in hda-analyzer while I was
> > debugging the shared pin issue :)
> > 
> > The below HDA_FIXUP_VERBS does the trick, so I do have all 6 speakers working, 
> > finally!
> > 
> > {0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02}
> 
> Actually this must be paired with the corresponding bit of GPIO_DATA,
> too.  Is the bit 0x02 of GPIO_DATA set or cleared?  Usually setting it
> turns on the amp, but sometimes inverted.

If I understood everything correctly, then the bit is set, meaning that the
GPIO signal is configured as output. I'll be honest, I exported the
hda-analyzer setting as a python script (nice feature btw) and deducted the
fixup verb setting from there (relevant part of the hda-analyzer export below):

def set(nid, verb, param):
  verb = (nid << 24) | (verb << 8) | param
  res = ioctl(FD, IOCTL_VERB_WRITE, struct.pack('II', verb, 0))  

set(0x01, 0x717,   0x02) # 0x01071702 (SET_GPIO_DIRECTION)


> > The only thing that is not quite clear to me is - does LFE still have its
> > own pin and I was just not able to find it, but managed to unmute it via
> > the GPIO? Or is the LFE speaker somehow "intenrally managed"? It works
> > correctly though, alsa mixer is also capable of controlling LFE volume
> > separately so it's fine, everything is also working with pulseaudio and a 5.1
> > profile on top.
> 
> It's usually just the external amp controlled via GPIO, and the signal
> must go through the pin 0x18 as well as the center channel, I suppose.

Ah, I see, I could try confirming if 0x18 is indeed the LFE speaker or not
by "disconnecting" it in the pin configuration, I'd like to know for sure :)

To sum it up:

would you be OK with the "mute remaning channels upon jack sense
in the driver" approach?
 
If the above is a yes, could you please point me to the right way of getting 
triggered upon jack state changes in the driver, since automute hooks seem 
not to trigger while something is playing?

Kind regards,
Sergey

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
