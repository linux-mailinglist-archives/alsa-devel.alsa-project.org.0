Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301B2F4E1C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:05:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E50B16EA;
	Wed, 13 Jan 2021 16:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E50B16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610550336;
	bh=mdZ9xaK93T9xg2/cC8R0G7sEHqKCi2sF6l3ld9KnZUc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VTnP97KF7BhlUh0culeJtITn/mLhy9BEVs2nGhY0sEHBUUhCksRLnx/vaZbSBUVja
	 v5Gr45U9NSuFS0jO0OiU2KZIRkLPVdBENaTeb94KcQK/xC3JYn3/kelYs9pewIhef9
	 nAJ8BaA0raus/GljNWFFR0edOXpchgHa6lW9jmPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B20AF80254;
	Wed, 13 Jan 2021 16:04:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E617F801ED; Wed, 13 Jan 2021 16:03:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28D7FF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28D7FF80085
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net
 [82.255.60.242]) (Authenticated sender: hadess@hadess.net)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A40FFFF811;
 Wed, 13 Jan 2021 15:03:40 +0000 (UTC)
Message-ID: <8adebcef15874187b18b930d5a71e79c6297ee80.camel@hadess.net>
Subject: Re: USB Wireless device support
From: Bastien Nocera <hadess@hadess.net>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 13 Jan 2021 16:03:39 +0100
In-Reply-To: <s5h4kjkopsu.wl-tiwai@suse.de>
References: <e1e944b48ae44106a57c74de19dd74d6193495fe.camel@hadess.net>
 <3b322bb54a1df4b2a45586bc687fba3be5f9e3d8.camel@hadess.net>
 <s5h4kjkopsu.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 2021-01-13 at 15:49 +0100, Takashi Iwai wrote:
> On Wed, 13 Jan 2021 15:36:19 +0100,
> Bastien Nocera wrote:
> > 
> > Hey,
> > 
> > On Wed, 2020-12-09 at 14:30 +0100, Bastien Nocera wrote:
> > > Hey,
> > > 
> > > I've recently bought a SteelSeries Arctis 1 wireless headset:
> > > https://steelseries.com/gaming-headsets/arctis-1-wireless-xbox
> > > and wanted to write a kernel driver to export a few features of
> > > the
> > > device, and needed some help getting started.
> > > 
> > > The receiver shows up as a audio class USB device, with extra
> > > features
> > > on a separate USB interface.[1]
> > > 
> > > The extra features that can be accessed are:
> > > - Presence detection. I wanted to use that so PulseAudio or
> > > Pipewire
> > > could make routing decisions based on whether the headset is
> > > available,
> > > or probably better, implementing a "jack detection" emulation for
> > > the
> > > main audio interface?
> > > - A slider to change the sidetone volume
> > > - Export the battery level
> > > 
> > > The latter is the only one I know how to do, so I'd be happy with
> > > any
> > > pointers or examples about the first two items.
> > 
> > 
> > I sent this in December and didn't get any answers, and I would
> > appreciate any guidance/examples if you have any into implementing
> > this.
> 
> Judging from the link, is it controlled through HID?  If so, it's
> primarily done by a HID driver, and it doesn't belong to the sound
> card stuff, so far.
> Though....
> 
> > I would imagine that the new features would be implemented through
> > a
> > separate ALSA device with few features, which PulseAudio/Pipewire
> > could
> > merge with the existing USB audio device.
> 
> ... given that it's implemented in a HID driver, the integration to
> the system is a different question.  But unless it's implemented as a
> sound card device, the rest will become a totally different,
> e.g. another PA or PW module.

I think that it might be good to have the sidetone configuration
implemented as a channel mixer, so it could be shown along with the
device volume in sound settings.

I believe there's already a device group feature in PulseAudio that
could be used to merge the sidetone level with the rest of the USB
audio mixers.

Is there an example of a mixer like that implemented in a hid or
another type of non-ALSA/sound driver?

