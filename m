Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A04EBD0B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 10:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FD6C17A3;
	Wed, 30 Mar 2022 10:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FD6C17A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648630734;
	bh=syQh7FxAEjyoKpHFIlGFQnq4c0yuYmZ2lKGfifiAsCw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TrEkC6pcPAe6yjwNaxsyPh/UGjlSqbcuI3w/0af7y+9toKZX0U/KKHj4qKbOavhPC
	 rDTj9tb2mU3WftunAr09fQHhT8wBasl0EX3V5NnoyX2TZFWoPMCxIHWGwN4OXcAKqq
	 Jh7c+Y5h8IL7fO5PzZJdMK9bkGh0VBD3s9b3/dEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE365F8025A;
	Wed, 30 Mar 2022 10:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7888F80155; Wed, 30 Mar 2022 10:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E5CF80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 10:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E5CF80155
Received: by m.b4.vu (Postfix, from userid 1000)
 id 8C42B613098B; Wed, 30 Mar 2022 19:27:29 +1030 (ACDT)
Date: Wed, 30 Mar 2022 19:27:29 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: ZTube <ztube@gmx.de>
Subject: Re: Focusrite Scarlett 8i6 silent input stream
Message-ID: <20220330085729.GA1605776@m.b4.vu>
References: <9146b00d-42c8-d965-4374-8b6689fd948f@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9146b00d-42c8-d965-4374-8b6689fd948f@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi ZTube,

On Tue, Mar 29, 2022 at 07:18:11PM +0200, ZTube wrote:
> I'm trying to get my Focusrite Scarlett 8i6 to run with alsa,
> however while the sound output to the device works fine, the input
> does not and merely delivers a silent stream. Since I can't find any
> reason for the input stream to be completely silent I suspect this
> might be a driver bug.
> 
> $ arecord -D hw:0,0 -f S32_LE -r 48000 -c 10 | aplay
> 
> just results in complete silence
> 
> 
> I'd be happy to provide more logs/detail if needed. Any idea what
> might be going on?
> 
> Thanks,
> 
> ZTube
> 
> [alsa-info.sh] https://paste.debian.net/1236037/

In your also-info.sh output I noticed that you have the PCM 1 input
set to "Off", so if your Analogue 1 input is the only one with
anything plugged in to it, you will not get any audio.

You can fix this by changing the capture routing using "alsamixer
-cUSB". Set PCM 01 to Analogue 1.

Please check out the alsa-scarlett-gui that I recently released which
replaces alsamixer functionality for Scarlett Gen 2/3 devices, shows
the routing in a visual way, and lets you drag-and-drop connections:
https://github.com/geoffreybennett/alsa-scarlett-gui/

Another possible cause for your problem is reported here against
pipewire:
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/1948 but it
seems that it could actually be an ALSA bug. See claudiocabral's
comment:

> I have the same issue on my 18i8. I've manged to reproduce it
> without using pipewire.
> 
> if I try to launch
> 
> aplay -D hw:USB -r 48000 -fS32_LE -c 8 /dev/zero
> 
> followed by
> 
> arecord -D hw:USB -r 48000 -fS32_LE -c20  out.wav
> 
> arecord fails with the message
> 
> arecord: set_params:1323: Broken configuration for this PCM: no
> configurations available
> 
> If I launch arecord first, both arecord and aplay work as intended.

Besides trying the above, you could also try downgrading your kernel
to 5.10 which apparently didn't have this problem.

Regards,
Geoffrey.
