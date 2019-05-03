Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C11337C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 20:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEB11801;
	Fri,  3 May 2019 20:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEB11801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556906836;
	bh=/BwQX/QzseZPtxGBaBCJ5zW5ZKbKAF2yBh76w2I0FM4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=Sj2NPbrQcvgsImJPE0MwI6SNFz7dAKRoYT8PJtgojagpejQQrhoYnSLfLW0PWoFJS
	 1HKHp5dqElytDIZFKmvD5aoOHMjMN40BBwG4nlG8VF0LhLsZAWk4gJ+zQtRjYZ/MgL
	 BW3a1d154E9/RH/gI+EX699U1X6hr7owKC89Dntg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DED6EF896B7;
	Fri,  3 May 2019 20:05:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F2F2F896B7; Fri,  3 May 2019 20:05:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from egnor-li.ofb.net (egnor-li.ofb.net [IPv6:2600:3c01:e000:283::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3DC2F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 20:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DC2F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ofb.net header.i=@ofb.net
 header.b="k5AgGq7y"
Received: from ofb.net (163.242.197.104.bc.googleusercontent.com
 [104.197.242.163])
 by egnor-li.ofb.net (Postfix) with ESMTP id 79AC6117FBE;
 Fri,  3 May 2019 18:05:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [173.239.75.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ofb.net (Postfix) with ESMTPSA id 323B73EE22;
 Fri,  3 May 2019 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ofb.net; s=ofb;
 t=1556906722; bh=qybE5ehb66rLFTVg3cRZsH3yy1HXDFYRM7lyftVoneM=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=k5AgGq7ymjXEM+zkgWUBY75jv/SMwOYWy2aScgkFtBYECWYwTlSxlLwD9y2qarL8i
 Z2sCOQsYRY5D2QnKE7pLdAOhUWwsEkqKdDfb16HvAyv1dDubsEUxk+dXsAD6CY0qqK
 Q/R1+nVn35A/dcoazAAurwfIYO1CFvGXZDiBBdxPP43sDUrdqHGMvXGyTdtw1NmuAC
 rNkR5oem5xmbqbYgKWZqdqhBN7BwfHCztTHrc4c8woUs8WJsm+mZsLv/H9x1Zz7Hjo
 v93v3cFHaZInbsGfe12vf/7EyQ2FPwpcKMe8sXFCjgh9+Hg+xd/7PIgxJ+BIwXT7Sc
 x/3AqTuZVwYIA==
Received: from frederik by localhost.localdomain with local (Exim 4.92)
 (envelope-from <frederik@localhost.localdomain>)
 id 1hMcYj-0002TN-G2; Fri, 03 May 2019 11:05:21 -0700
Date: Fri, 3 May 2019 11:05:21 -0700
From: frederik@ofb.net
To: alsa-devel@alsa-project.org
Message-ID: <20190503180521.gtfv64hel5427dx7@localhost>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Cc: pulseaudio-discuss@lists.freedesktop.org, georg@chini.tk
Subject: [alsa-devel] ALSA -> pulseaudio channel mapping,
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

Dear ALSA developers,

I ran into a problem which seems to be caused by some lines in
"alsa-plugins-1.1.8/pulse/pcm_pulse.c".

The problem is that if I create a 6-channel PulseAudio device, and
then I configure an ALSA device in ~/.asoundrc to output to the
PulseAudio device, the channels of the ALSA device are mixed together
in various ways and don't correspond 1-1 with the channels of the
PulseAudio device.

I find this to be counter-intuitive. If I wanted channels to be mixed
and remapped in various ways, I would use the PulseAudio module
module-remap-sink on the PulseAudio side, since AFAICT ALSA does not
support named channels. I would not expect remixing to happen in the
ALSA->Pulse bridge, since the relevant PCM plugin contains no channel
map parameter.

I don't even know what channel map I should give the PulseAudio device
in order to prevent remixing from occurring. The file pcm_pulse.c
contains the lines:

        for (c = pcm->ss.channels; c > 0; c--)
                if (pa_channel_map_init_auto(&map, c, PA_CHANNEL_MAP_ALSA))
                        break;

This refers to a macro in /usr/include/pulse/channelmap.h:

    /** \cond fulldocs */
        PA_CHANNEL_MAP_ALSA,
        /**< The default mapping used by ALSA. This mapping is probably
         * not too useful since ALSA's default channel mapping depends on
         * the device string used. */
    /** \endcond */

The comment says that the ALSA mapping is "not too useful" - so why
are we using it? Also, how do I find out what it is, if it "depends on
the device string used"?

My preference would simply be to have a 1-1 channel map in pcm_pulse,
so that a PulseAudio device with 6 channels will turn into an ALSA
device with THE SAME 6 CHANNELS. No mixing. Mixing is confusing in
this context, and seems undocumented outside of the code.

I tried using aux0 thru aux5 as the PulseAudio channel map, to prevent
geometry-based remixing. However, this results in silence - apparently
none of the 6 ALSA channels end up going anywhere. That was also
unexpected. Since I am playing 6-channel audio to a 6-channel device,
which emulates another 6-channel device, I would have thought that the
channel mapping wouldn't be complicated. Instead, it appears that the
PulseAudio sink needs to have channels with specific names in order to
receive data from ALSA.

Can we fix this, or improve the user experience?

Thanks,

Frederick
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
