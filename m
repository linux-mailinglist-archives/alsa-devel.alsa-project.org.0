Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D90168CFF
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Feb 2020 07:55:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F86F16CC;
	Sat, 22 Feb 2020 07:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F86F16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582354514;
	bh=LT3r03nKQTi3BCdKRZKhRxShtV58Iw2CRkPjXm6rJJQ=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OlagTJRJ6TY4TEhBaHcicu9St86ipSf/99dvyKqN5tYgdsIpQjxn4CtuBWVLXSILj
	 yu8kUpH78nRecxCqcbiXSkEcTzm7DMh4Ir3lMDxeiIZ8+oAqVhWNmkKrvvNNfVL4QQ
	 Z7PmqVc+mXBmt6G16/O5mscuo8VUn3SAQHgS2jCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA1EF8011D;
	Sat, 22 Feb 2020 07:53:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F27F80148; Sat, 22 Feb 2020 07:53:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_PASS,SPF_NEUTRAL,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00F62F8011D
 for <alsa-devel@alsa-project.org>; Sat, 22 Feb 2020 07:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00F62F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ak/R1E1n"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1ACCA548;
 Sat, 22 Feb 2020 01:53:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 22 Feb 2020 01:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=DAiYFLRAw63ZkiYgzIoY2uVvgcSdll8JYAkCTo1jl
 +s=; b=ak/R1E1nDhJMMPhVUzu8DD66c5MZf9Jlr2bK/jjjkMmjN921sis5YlT93
 QAQoxdGf8H2kDkIjn1zOOrRJ81pB9lwVdXlyIPczYKSs4+L1U4iHksCMentxNOXX
 HDjr5zXiNHVDsvKh6v6jMnn6hfUUmvooA7CRgWSN2ZyrNK0+r1OjG0wzRaFdyEUR
 qH0W0wX7QzbHajmc45eBvrw36+/Sqlgma7+lHHyzaMVj/8M8vRFpxJRpmgZjbIew
 wZGImlNgmjRNUOihe0sRQHlHtIzukwbWJ4RWGGGvRDBbDPHQX9W7lWJ7FQ7JEblt
 F1rqBgp9df+RguOMTPXZyk3PARyNg==
X-ME-Sender: <xms:3s9QXnXSBbyKUH4tTF5qFZ1d50NL7uSk1l-gZu56oxrDsoMLbtLlIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeehgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehprg
 htrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeduleeirddvgeeg
 rdduledurdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:3s9QXjFvQ_mP8CfUFuap5dK1sUy5PaZS08Ec5GhQfP5eUhTqghAbMw>
 <xmx:3s9QXqI4GAVPBMUH2pjLmXSAzQf9epHlghOmeIQeEtTuJCqStBdQnQ>
 <xmx:3s9QXgmmTHMQqWAde-YWd7KbsryZjXdNtENS-znc92tlUuMTHnK4rQ>
 <xmx:4M9QXsZz_Pm2zteFwLRFIBEgQpL8wCz69okbSRk_4jZVmMIcloCXrg>
Received: from laptop (unknown [196.244.191.114])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF83F3280059;
 Sat, 22 Feb 2020 01:53:17 -0500 (EST)
Message-ID: <9c35a20952f53624c8cd082a5e7de33d2d34adca.camel@iki.fi>
Subject: Re: [pulseaudio-discuss] [alsa-devel] Question about the various
 mixer options in UCM
From: Tanu Kaskinen <tanuk@iki.fi>
To: Jaroslav Kysela <perex@perex.cz>, General PulseAudio Discussion
 <pulseaudio-discuss@lists.freedesktop.org>, alsa-devel
 <alsa-devel@alsa-project.org>
Date: Sat, 22 Feb 2020 08:53:13 +0200
In-Reply-To: <fc493e83-3eaa-3580-483b-4bb7754245ef@perex.cz>
References: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
 <cb58008e-e9cc-8390-cfc8-c5c93d31c862@perex.cz>
 <ae7b6d8a745ef718d8a6f3f2d7e4aeabe4f7d2b6.camel@iki.fi>
 <99522cac281eb998981ef2552c7e06846171b25f.camel@iki.fi>
 <fc493e83-3eaa-3580-483b-4bb7754245ef@perex.cz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sun, 2020-02-16 at 18:38 +0100, Jaroslav Kysela wrote:
> Dne 16. 02. 20 v 11:06 Tanu Kaskinen napsal(a):
> > On Sun, 2020-02-16 at 11:42 +0200, Tanu Kaskinen wrote:
> > > + pulseaudio-discuss@lists.freedesktop.org
> > > 
> > > On Sat, 2020-02-15 at 17:25 +0100, Jaroslav Kysela wrote:
> > > > Dne 15. 02. 20 v 7:29 Tanu Kaskinen napsal(a):
> > > > > What's the difference between PlaybackVolume, PlaybackMixerElem and
> > > > > PlaybackMasterElem? Other than the obvious difference that
> > > > > PlaybackVolume is used only to configure the volume control, whereas
> > > > > PlaybackMixerElem and PlaybackMasterElem are used also to configure the
> > > > > mute control.
> > > > 
> > > > At first, I don't really know if someone uses PlaybackVolume/PlaybackSwitch.
> > > > It was defined for the direct control interface (not the mixer interface). I
> > > > do not think that we should support this.
> > > 
> > > PlaybackVolume/Switch is currently defined for PandaBoard,
> > > PandaBoardES, SDP4430 and sof-hda-dsp. Do you mean those definitions
> > > should be removed and replaced with PlaybackMixerElem? It seems that
> > > PlaybackVolume and PlaybackSwitch don't always match the same simple
> > > mixer element (e.g. PandaBoard), so I'm not sure if it's possible to
> > > use PlaybackMixerElem with those platforms.
> > > 
> > > As you know, PulseAudio added support for PlaybackVolume recently.
> > > Should we remove the support? I'm not against that, if
> > > PlaybackMixerElem is the canonical way to control volume.
> > > 
> > > AFAIK CRAS is a major user of UCM, are there others? I think the CRAS
> > > developers' opinion would be very useful here.
> > > 
> > > > I defined new PlaybackMixerElem to select the simple mixer element which
> > > > controls both volume and switch (mute) in the ALSA API. The master volume
> > > > might be also in the chain (thus PlaybackMasterElem) was introduced.
> > > > 
> > > > It seems that it might be not enough and I play with an idea to build custom
> > > > mixer description to handle the special cases (like several speakers with the
> > > > different volume controls connected to the single stereo stream etc.).
> > > > 
> > > > To keep things simple, I would probably hide all functionality to
> > > > PlaybackMixer/PlaybackMixerElem and CaptureMixer/CaptureMixerElem . The
> > > > special mixer name will create the abstract mixer for the applications and
> > > > only one simple mixer element control will set the appropriate volume for
> > > > the stream (like pulseaudio actually does for the legacy ALSA support - volume
> > > > synthetizer). So UCM will describe the mixer for alsa-lib and application will
> > > > use only abstract interface to set / get the volume and mute state.
> > > 
> > > Hiding everything behind an abstract mixer element sounds VERY good,
> > > but how to handle a situation where the application uses two devices at
> > > the same time and the devices share a volume control? For example, a
> > > phone playing a ringtone to both headphones and speakers. If the
> > > headphone output has its own abstract mixer element and the speaker
> > > output has its own abstract mixer element, the application may imagine
> > > that it can change the volumes independently, but if the outputs share
> > > a master volume control that is used by both abstract volume elements,
> > > the volumes aren't really independent, and the resulting volumes may
> > > not be what the application intended.
> 
> This is something which should UCM take in the account. In this case, the 
> "common" parts should be probably set to a maximum value (or the safe maximum 
> value) in UCM. Another way is to mark those devices as "conflicting", thus the 
> I/O won't be used simultaneously.

Hmm, in my example I assumed (but I didn't say) that the headphones and
speaker use the same PCM device. In this case the devices will be
marked as conflicting anyway, which I didn't take into account, so if
an application nevertheless wants to use both outputs, there needs to
be a separate headphones+speaker device, which can set up the volume
control in a sensible way. The application won't have control over the
independent volumes, unless some new UCM feature is invented, but
that's a separate issue. In conclusion, in this case the abstract
element idea works well.

If the PCMs are separate, I guess it's less likely that the two devices
will share a master volume control.

> > > > Actually, I am also trying to resolve the description of the speaker
> > > > configuration. It may not be only enough to give the PCM device, because we
> > > > don't know, if user connected the stereo or surround speakers to the sound
> > > > card output for example. I play with an idea to add device variants to UCM,
> > > > but the question is, how we can map this to pulseaudio profile/port schematics.
> > > > 
> > > > My quick idea is to export those variants via the verbs, so the exported verb
> > > > names might look like:
> > > > 
> > > > HiFi:Speaker-Stereo
> > > > HiFi:Speaker-5.1
> > > > 
> > > > Where 'HiFi' is the verb name, 'Speaker' is the device name and 'Stereo' is
> > > > the variant name.
> > > > 
> > > > If we need to define multiple variants, all may be exported like:
> > > > 
> > > > HiFi:Speaker-5.1,Mic-4.0
> > > > 
> > > > Also, we can enhance this and store the configuration to a file, thus 'HiFi'
> > > > can refer to 'HiFi@Speaker-5.1,Mic-4.0' by default.
> > > 
> > > Verb + list-of-device-variants sounds like a good way to map UCM
> > > devices to pulseaudio profiles (and if there's just one verb, which I
> > > expect to be the common case, don't show it in the profile name). I
> > > don't know how the variants should be configured in UCM, but I know
> > > that device variants should be able to declare conflicts with other
> > > devices (or device variants). For example, 5.1 speaker output may make
> > > recording impossible, while stereo speaker output can be used toghether
> > > with a mic. If this information is not provided by UCM, pulseaudio will
> > > have to probe all variant combinations (like it currently does with the
> > > legacy mixer system).
> > 
> > Sorry, now I realized that the Verb + list-of-device-variants scheme
> > doesn't really work after all as the profile scheme. Or maybe it does,
> > but it's significantly different from what we do currently. Switching
> > between Headphones and Speaker-Stereo often doesn't require reopening
> > the PCM device, so there's no need for separate Headphones and Speaker-
> > Stereo profiles. I guess we could still create separate profiles, it
> > just means that the profile list will get much longer.
> > 
> > We could add a separate optimization step to the profile creation
> > process. That is, first create all possible device-variant combinations
> > as the initial profile list, and then inspect which profiles can be
> > merged. Naming the merged profiles becomes a problem, but I imagine
> > it's solvable with static rules (e.g. merging Speakers-Stereo and
> > Headphones becomes Analog-Stereo), and if necessary the merging can be
> > improved gradually over time.
> > 
> > > From profile creation perspective the ideal scheme would be not based
> > on UCM devices but on PCM devices and their configuration variants, but
> > I imagine naming would be an even bigger problem with this scheme (how
> > to map PCM device names to sensible user friendly names?).
> 
> I think that I didn't explain my idea in detail. The variant verbs may be 
> almost identical (thus all devices will be defined) like the "master" one. But 
> the specific variant configuration will be returned to the application. So it 
> will differ only in the channel count value for the Speaker device or so. The 
> PCM device name + PCM parameters check will be fine. I don't think that we 
> should modify something on the PA side. PA activates only one verb per 
> soundcard now.

Oh, you want to create variant verbs? Is the idea that all possible
device combinations will be made separate verbs? That would make life
easier for PulseAudio, but wouldn't it mean a lot more work for UCM
configuration writers? Rather than generating the device combinations
automatically in PulseAudio, the combinations would have to be manually
listed in every UCM configuration.

I think it would be better to define only one verb per sound card and
declare the conflicts between the devices or device variants, and let
PulseAudio automatically generate the device combinations as profiles.

I may be misunderstanding something, I didn't for example understand
what you meant by "the PCM device name + PCM parameters check will be
fine". Some examples could be useful. Let's say that there's a sound
card that has stereo output (either headphones or line-out), 4.0
output, 5.1 output, SPDIF output and stereo input. If input is used,
5.1 output can't be used at the same time. Would UCM define the
following verbs?:

HiFi:Headphones,SPDIF,Mic
HiFi:Line-Stereo,SPDIF,Mic
HiFi:Line-4.0,SPDIF,Mic
HiFi:Line-5.1,SPDIF

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

