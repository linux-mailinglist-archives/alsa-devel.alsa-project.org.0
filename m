Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FED15712
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 02:50:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D2E18EB;
	Tue,  7 May 2019 02:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D2E18EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557190250;
	bh=ccKEySqJdbEWbmCMethBxOzRMmiV2p/DjbVwenDSETU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=DmkxTGNGq5OPLVsrbdwG0Blv0W+XKdXeO33IFLYW4PtJlIXuZKa4ZpXIH1jcDRz93
	 DVgg0hB+WsMWXkeHCkpLSPSXuajiZ3MbKDWYz3cE5J+G8QP0C0zWDjivjxO4rWaFOW
	 G4c9GxjGL+yZa3imaS4A+qq0txTXZjbwMBIZblw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A1ECF80C07;
	Tue,  7 May 2019 02:49:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A8FF896F0; Tue,  7 May 2019 02:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from egnor-li.ofb.net (egnor-li.ofb.net [IPv6:2600:3c01:e000:283::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C0D3F80C07
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 02:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C0D3F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ofb.net header.i=@ofb.net
 header.b="oX/yamb3"
Received: from ofb.net (163.242.197.104.bc.googleusercontent.com
 [104.197.242.163])
 by egnor-li.ofb.net (Postfix) with ESMTP id 28C59117F5F;
 Tue,  7 May 2019 00:48:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [173.239.75.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ofb.net (Postfix) with ESMTPSA id BA4663E848;
 Mon,  6 May 2019 17:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ofb.net; s=ofb;
 t=1557190135; bh=PSzG3SfL9LdXtPBtKAK6kGK2rTaJkwQ8ywNynkdrDLw=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=oX/yamb376rh5ol8TzvNYpCvg4nKnHjC6maX+Ci209v5Qu59O5ax5B15k5MmH8TH8
 JXUV54P6snb7D87UupxY/IVvOJl2hRuzobsx1CvZaeiAzIWt2Ki7tZ2wPtYOE6CfJL
 zqem7fiq5zhwNiOB/HyhIOUFznvMnXX5GmUr1a2jCRU4An01rrlCOq+IlRYTfx5SED
 vmoqCyv5vOhXd75W+/tSFGeELd60e7nouLe65Ge/NPjmj+f/DpNdmc5lXVx3s5B69h
 fRwNG7ZWMlgK46RPV7o7DwFIXkpAd4KzOWcC6EvsG5NwyE9Ulal8MW14APuFe0YOtx
 USQt7j1XnD8Jw==
Received: from frederik by localhost.localdomain with local (Exim 4.92)
 (envelope-from <frederik@localhost.localdomain>)
 id 1hNoHu-0000zk-Q9; Mon, 06 May 2019 17:48:54 -0700
Date: Mon, 6 May 2019 17:48:54 -0700
From: frederik@ofb.net
To: Tanu Kaskinen <tanuk@iki.fi>
Message-ID: <20190507004854.dqhnp4fr5hc2fxy3@localhost>
References: <20190503180521.gtfv64hel5427dx7@localhost>
 <491dc670d9aaa8a9a72a6f0aaf5071be935a1aca.camel@iki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <491dc670d9aaa8a9a72a6f0aaf5071be935a1aca.camel@iki.fi>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org,
 georg@chini.tk
Subject: Re: [alsa-devel] ALSA -> pulseaudio channel mapping,
 what is it (and why?)
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
Reply-To: frederik@ofb.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear Tanu,

Thanks for your reply. I made comments inline:

On Mon, May 06, 2019 at 02:04:37PM +0300, Tanu Kaskinen wrote:
>On Fri, 2019-05-03 at 11:05 -0700, frederik@ofb.net wrote:
>> Dear ALSA developers,
>>
>> I ran into a problem which seems to be caused by some lines in
>> "alsa-plugins-1.1.8/pulse/pcm_pulse.c".
>>
>> The problem is that if I create a 6-channel PulseAudio device, and
>> then I configure an ALSA device in ~/.asoundrc to output to the
>> PulseAudio device, the channels of the ALSA device are mixed together
>> in various ways and don't correspond 1-1 with the channels of the
>> PulseAudio device.
>>
>> I find this to be counter-intuitive. If I wanted channels to be mixed
>> and remapped in various ways, I would use the PulseAudio module
>> module-remap-sink on the PulseAudio side, since AFAICT ALSA does not
>> support named channels.
>
>There is an API for querying and configuring PCM device channel maps.
>pcm_pulse.c doesn't seem to implement that API, though, so applications
>are expected to use the default channel map, and if that doesn't match
>the sink channel map, then PulseAudio will do the remapping (and
>possibly remixing, if the channel maps differ in other ways than just
>channel order).
>
>> I would not expect remixing to happen in the
>> ALSA->Pulse bridge, since the relevant PCM plugin contains no channel
>> map parameter.
>
>The remixing happens in PulseAudio, not in pcm_pulse.c. pcm_pulse.c
>just tells PulseAudio the channel map that the stream uses.

Yes, I understand that much.

>> I don't even know what channel map I should give the PulseAudio device
>> in order to prevent remixing from occurring. The file pcm_pulse.c
>> contains the lines:
>>
>>         for (c = pcm->ss.channels; c > 0; c--)
>>                 if (pa_channel_map_init_auto(&map, c, PA_CHANNEL_MAP_ALSA))
>>                         break;
>>
>> This refers to a macro in /usr/include/pulse/channelmap.h:
>>
>>     /** \cond fulldocs */
>>         PA_CHANNEL_MAP_ALSA,
>>         /**< The default mapping used by ALSA. This mapping is probably
>>          * not too useful since ALSA's default channel mapping depends on
>>          * the device string used. */
>>     /** \endcond */
>>
>> The comment says that the ALSA mapping is "not too useful" - so why
>> are we using it?
>
>pcm_pulse.c has to specify some channel map. Do you have better
>proposals than PA_CHANNEL_MAP_ALSA?

What's wrong with using the channel map of the underlying PulseAudio
sink? Maybe that's another way of phrasing what I was trying to
communicate in my first email. I just want the channels to go straight
through.

Obviously this would have to be something that users would enable with
an option (in the ALSA config), to preserve backwards compatibility,
but I don't see what's undesirable about it.

>> Also, how do I find out what it is, if it "depends on
>> the device string used"?
>
>There's currently no way to query the sink channel map through the ALSA
>API. There's snd_pcm_get_chmap() that pcm_pulse.c could maybe
>implement. There's the complication that usually the pulse PCM uses the
>default sink, and the default sink can change at any time, so the
>channel map can change at any time too, but that's probably not a huge
>problem in practice.
>
>> My preference would simply be to have a 1-1 channel map in pcm_pulse,
>> so that a PulseAudio device with 6 channels will turn into an ALSA
>> device with THE SAME 6 CHANNELS. No mixing. Mixing is confusing in
>> this context, and seems undocumented outside of the code.
>
>Remapping/remixing is very much expected in usual media playback cases.
>If you have a 5.1 movie, it's easier for the player application to play
>the audio in whatever channel order it wants and let the sound server
>to remap and remix as necessary.

Does this currently happen correctly with pcm_pulse? For example if I
play a movie with 6-channel (e.g. 5.1) sound through an ALSA "pulse"
PCM, do the channels get delivered correctly to PulseAudio? How does
ALSA know which ones are which?

I'm asking because you said "it's easier", but that would only be the
case if it works. What happens when my media player tries to play a
4-channel file, with named channels, to the 6-channel ALSA device?
Does "the sound server [..] remap and remix as necessary" in this
case? I know PulseAudio does it, but I wasn't aware about ALSA.

>> I tried using aux0 thru aux5 as the PulseAudio channel map, to prevent
>> geometry-based remixing. However, this results in silence - apparently
>> none of the 6 ALSA channels end up going anywhere. That was also
>> unexpected. Since I am playing 6-channel audio to a 6-channel device,
>> which emulates another 6-channel device, I would have thought that the
>> channel mapping wouldn't be complicated. Instead, it appears that the
>> PulseAudio sink needs to have channels with specific names in order to
>> receive data from ALSA.
>>
>> Can we fix this, or improve the user experience?
>
>What's the sink channel map in PulseAudio and what's your application's
>channel map? Apparently one of them is not using the default ALSA map
>for 6 channels.
>
>If your application is not using the default channel map, why not?

Well, as I mentioned I don't know what the default map is, I don't
know where it's documented and I don't know how to look it up or query
it. I only know it exists because of /usr/include/pulse/channelmap.h.

OK I found "pa_channel_map_init_auto" in
pulseaudio/src/pulse/channelmap.c. Maybe the pcm_pulse documentation
(which is where on my hard drive?) should point to this file, or
RFC3551 which is mentioned in the comments? Hope this is making sense.

>If the sink is not using the default channel map, then it's expected
>that PulseAudio shuffles the channels around, otherwise audio meant for
>the front left speaker could end up in the rear right speaker, for
>example.

I'm playing 6-channel audio to a 6-channel sink. It's a
"module-combine-sink" with 3 stereo sinks from USB soundcards. I
specified the channel map simply because I need to say which channels
go to which of the devices. If I could call the channels a,b,c,d,e,f
then I would do that. If I knew what the default map was then maybe
that would be a better solution; however currently the whole thing is
configured by a script, so I would have to have to know the default
map for not just 6 channels but 8, 10, 12, etc., depending on how many
speakers the user decided to connect. Also, there is no "subwoofer" so
I'm not sure that I want PA_CHANNEL_POSITION_LFE to be one of the
channels, I remember seeing something about special processing that is
applied to LFE channels?

Obviously I sometimes want to upmix stereo to my 6 speakers, but
that's something that I'd rather configure separately, rather than
using default channel definitions. For example if I have two
microphones, then I could write a script that plays sound through each
channel and uses the mics to figure out good upmix coefficients from
left and right stereo.

> Do you have a use case for ignoring the channel map? Maybe the
> SND_PCM_NO_AUTO_CHANNELS flag could be used in pcm_pulse.c to
> disable channel remapping (I'm not volunteering to implement that,
> though).

What is SND_PCM_NO_AUTO_CHANNELS, I see it in
alsa-lib-1.1.1/src/pcm/pcm_plug.c but I don't understand what it is. I
don't understand how ALSA does automatic conversion between PCMs with
different channel counts. I would have thought that you need an
"upmix" or "multi" device. I didn't even realize that ALSA has named
channel maps, although I see that you mentioned earlier that there is
an API for this.

Thank you for your time.

Frederick
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
