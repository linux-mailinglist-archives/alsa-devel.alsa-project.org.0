Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFC148AD
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 13:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D581855;
	Mon,  6 May 2019 13:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D581855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557140842;
	bh=3M33xqy9ynPfAbsHaal0RnT0TNtJdetBAnonJIzhDt4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=da9gCQE+4UKeByMitmEgW5vc5WF417qESqqK9YS3Jyr5lCjkOxOyL+NVbuMzwSL2/
	 2GYzDsJNnO5LUVKtbWjzKlaBRT2Hk+N8iXQ2eSC2xyalJ7fFzW8UTXSh16hqNRaMJB
	 vcjkvfbpSbMzVzMe6VObeUcNFfRSbxvTpMWwPbHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9B1F896E6;
	Mon,  6 May 2019 13:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CFDBF896F0; Mon,  6 May 2019 13:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D91AF80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 13:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D91AF80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0n1C4MZB"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AF5062387A;
 Mon,  6 May 2019 07:05:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 06 May 2019 07:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ZuMnHLk9PMyrx+JlWiSie99J2IIkOvoJSNrq59IAM
 9Y=; b=0n1C4MZBtCoYz97KWylxTHNPyYQhtH32iEho8TEG+NJ3NVB7qow6bN1pS
 Rh8TvPSSNin0cZNn7/1QrzBJ6r8CeF+KR+sx2Qc83ElXkfa0CBHWpAbbOrJnTHeX
 5AoTchwyLQ/Vm4tJKFt7qxTUqFfc60s0TOSh/ie/4T0wrL1Iqzcoq+mIafwQCcUb
 TYg8CO8X8jQJXNTaUkiBHaB7UvfS73w8DHT2PZt9i3flIEkNp3NzS3/ei5asLzHx
 HisbdQnlUG+fM5rQnc6Pp5QfbfiLq2I90ZEqbJZ2nD6xuxRfJmW0ddrmeYfWJ+6R
 uLrOFjqdiaxU6bKk3P+JPeaOn7iCA==
X-ME-Sender: <xms:-RTQXE4zHIvn0yh9ExICIUP3RXNnQtAUEkspjunfxE5mkjN7y3U4gA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthejre
 dttderjeenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhi
 rdhfiheqnecuffhomhgrihhnpehlihgsvghrrghprgihrdgtohhmpdhprghtrhgvohhnrd
 gtohhmnecukfhppeduledvrdegtddrleehrddvjeenucfrrghrrghmpehmrghilhhfrhho
 mhepthgrnhhukhesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:-RTQXCTLFVLFqPWWjxge6nEo8XwPi8UerkwzDSqLLYKF2qvqzH992w>
 <xmx:-RTQXGTD40TrottsMCm5cK1seaFstva5l6Z-szr7AUSchN5-y-Vbjw>
 <xmx:-RTQXIP_qzfOxXdAtA2hOZudSaMQLg3DV2ftxLqiB8syz1kYiDEVgA>
 <xmx:-hTQXNJmhShYEoymGqIsUhUMiNfGopUAxFH1arVXiSEXRtxnEhyJFg>
Received: from laptop (unknown [192.40.95.27])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9AC8E448F;
 Mon,  6 May 2019 07:05:28 -0400 (EDT)
Message-ID: <491dc670d9aaa8a9a72a6f0aaf5071be935a1aca.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: frederik@ofb.net, alsa-devel@alsa-project.org
Date: Mon, 06 May 2019 14:04:37 +0300
In-Reply-To: <20190503180521.gtfv64hel5427dx7@localhost>
References: <20190503180521.gtfv64hel5427dx7@localhost>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: pulseaudio-discuss@lists.freedesktop.org, georg@chini.tk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 2019-05-03 at 11:05 -0700, frederik@ofb.net wrote:
> Dear ALSA developers,
> 
> I ran into a problem which seems to be caused by some lines in
> "alsa-plugins-1.1.8/pulse/pcm_pulse.c".
> 
> The problem is that if I create a 6-channel PulseAudio device, and
> then I configure an ALSA device in ~/.asoundrc to output to the
> PulseAudio device, the channels of the ALSA device are mixed together
> in various ways and don't correspond 1-1 with the channels of the
> PulseAudio device.
> 
> I find this to be counter-intuitive. If I wanted channels to be mixed
> and remapped in various ways, I would use the PulseAudio module
> module-remap-sink on the PulseAudio side, since AFAICT ALSA does not
> support named channels.

There is an API for querying and configuring PCM device channel maps.
pcm_pulse.c doesn't seem to implement that API, though, so applications
are expected to use the default channel map, and if that doesn't match
the sink channel map, then PulseAudio will do the remapping (and
possibly remixing, if the channel maps differ in other ways than just
channel order).

> I would not expect remixing to happen in the
> ALSA->Pulse bridge, since the relevant PCM plugin contains no channel
> map parameter.

The remixing happens in PulseAudio, not in pcm_pulse.c. pcm_pulse.c
just tells PulseAudio the channel map that the stream uses.

> I don't even know what channel map I should give the PulseAudio device
> in order to prevent remixing from occurring. The file pcm_pulse.c
> contains the lines:
> 
>         for (c = pcm->ss.channels; c > 0; c--)
>                 if (pa_channel_map_init_auto(&map, c, PA_CHANNEL_MAP_ALSA))
>                         break;
> 
> This refers to a macro in /usr/include/pulse/channelmap.h:
> 
>     /** \cond fulldocs */
>         PA_CHANNEL_MAP_ALSA,
>         /**< The default mapping used by ALSA. This mapping is probably
>          * not too useful since ALSA's default channel mapping depends on
>          * the device string used. */
>     /** \endcond */
> 
> The comment says that the ALSA mapping is "not too useful" - so why
> are we using it?

pcm_pulse.c has to specify some channel map. Do you have better
proposals than PA_CHANNEL_MAP_ALSA?

> Also, how do I find out what it is, if it "depends on
> the device string used"?

There's currently no way to query the sink channel map through the ALSA
API. There's snd_pcm_get_chmap() that pcm_pulse.c could maybe
implement. There's the complication that usually the pulse PCM uses the
default sink, and the default sink can change at any time, so the
channel map can change at any time too, but that's probably not a huge
problem in practice.

> My preference would simply be to have a 1-1 channel map in pcm_pulse,
> so that a PulseAudio device with 6 channels will turn into an ALSA
> device with THE SAME 6 CHANNELS. No mixing. Mixing is confusing in
> this context, and seems undocumented outside of the code.

Remapping/remixing is very much expected in usual media playback cases.
If you have a 5.1 movie, it's easier for the player application to play
the audio in whatever channel order it wants and let the sound server
to remap and remix as necessary.

> I tried using aux0 thru aux5 as the PulseAudio channel map, to prevent
> geometry-based remixing. However, this results in silence - apparently
> none of the 6 ALSA channels end up going anywhere. That was also
> unexpected. Since I am playing 6-channel audio to a 6-channel device,
> which emulates another 6-channel device, I would have thought that the
> channel mapping wouldn't be complicated. Instead, it appears that the
> PulseAudio sink needs to have channels with specific names in order to
> receive data from ALSA.
> 
> Can we fix this, or improve the user experience?

What's the sink channel map in PulseAudio and what's your application's
channel map? Apparently one of them is not using the default ALSA map
for 6 channels.

If your application is not using the default channel map, why not?

If the sink is not using the default channel map, then it's expected
that PulseAudio shuffles the channels around, otherwise audio meant for
the front left speaker could end up in the rear right speaker, for
example. Do you have a use case for ignoring the channel map? Maybe the
SND_PCM_NO_AUTO_CHANNELS flag could be used in pcm_pulse.c to disable
channel remapping (I'm not volunteering to implement that, though).

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
