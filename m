Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750E158DAE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 12:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62941665;
	Tue, 11 Feb 2020 12:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62941665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581421470;
	bh=Pn/NF+PkPs98DS1Tn17Z4+GRMOnTid++VdeTpHitMQs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4vSGH8jadFIp/ia43p7sCBnKvC6tjAB+O3tV0riUeCIgUNZgNotApGAPI4judcVy
	 8ll+T6NdzoacyMe8oaJtuK7GTqsVWyHbm9QsYybs6dpetUVHoI4STCIhQjkQyJ9ilS
	 elkNHknVGlis/01129aHI+r/2S9AkKVhEmOmcB2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A03B1F80146;
	Tue, 11 Feb 2020 12:42:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B232F80145; Tue, 11 Feb 2020 12:42:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51090F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 12:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51090F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RQBAwKSJ"
Received: by mail-pj1-x1041.google.com with SMTP id m13so1144729pjb.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 03:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eMtYAOltTS55/voD4YIIDIQuDbCIU7QwDAsh+xh9z+0=;
 b=RQBAwKSJ5jjdTdzvJid/G9UHEQAUDQPKbASaPJ5LZOGJnau6jYyHulJxuN1gWnlla7
 i3EohY1ipFEibsfFWKS7DE6OyjFKPwX1N3omW19fsjod6u7yXqTITTV1qSx0+RH11K5G
 sbCZtTDBVAQdBOPTc+lHULGeR6dtBTiTFyrwYEzzwQtStCa2xdwMTY5GiE4Az8mn6R2X
 ene1Ng9ExiKTFINfCjnZZjq01tBcYls+P+5x/InP3MT5P4cQFYP9y76G1qHjzXBXJtWG
 8SVYX0947daZjOo9mthl8A1mH2Wrjlx6k9Dme+hAO3XY/hAwkXXA1QbTo0rYGNUXfx2l
 gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eMtYAOltTS55/voD4YIIDIQuDbCIU7QwDAsh+xh9z+0=;
 b=No7Dn5PQYaD8D+ZFFv9Ok3SnlmVqeCKvECgwXnzu6gvhBTxq7UtLtHFnuecx+8jigL
 XrbEh6Q+yNEfRa4/7SC3HHrtO1+kDQDHtQCNBXsiQYBDw5NiAur13PjVI7brRNxPlKsV
 BQFT/0u7IB3cruVnYAt66f+NVswRlastTGNsTJ77hKfKkpqVNH6uZmkyA8ZHu4AMBb1I
 fCiuefIx78tR+B5KZPuDVDMuk9T5n8BMkhYpWMly5/HFvSWSJkKsv6Xarl/D6n9ksojs
 +vxqbSxU3OZpOzPzbKueC4K7joMgKhXc00T7DjJdASKqrNyJxtoHx7St9knyCsIZstYo
 FWEQ==
X-Gm-Message-State: APjAAAXkisI4B/kuy0QTrHD4GWZdn5EtSmywzJ6CH3dlQIhQZDn571QD
 NYQ54Qlk2Tkj+NZLOXWOrqM=
X-Google-Smtp-Source: APXvYqzTIpafBVuLDUiwBEAxolN2iuDp40pL55M74XERnmN9bQb+rQv5ZZOxSM2Sc1YcYG8m+tnfvw==
X-Received: by 2002:a17:90a:1f8d:: with SMTP id
 x13mr3286677pja.27.1581421361825; 
 Tue, 11 Feb 2020 03:42:41 -0800 (PST)
Received: from f3 (ag119225.dynamic.ppp.asahi-net.or.jp. [157.107.119.225])
 by smtp.gmail.com with ESMTPSA id l13sm2863661pjq.23.2020.02.11.03.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 03:42:40 -0800 (PST)
Date: Tue, 11 Feb 2020 20:42:36 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200211114236.GA2691@f3>
References: <20200211055651.4405-1-benjamin.poirier@gmail.com>
 <20200211055651.4405-2-benjamin.poirier@gmail.com>
 <b23abac0-401c-9472-320c-4e9d7eab26de@perex.cz>
 <20200211081604.GA8286@f3>
 <901c395a-7fb5-5672-5955-d6d211824177@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <901c395a-7fb5-5672-5955-d6d211824177@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda/realtek - Fix Lenovo
 Thinkpad X1 Carbon 7th quirk value
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

On 2020/02/11 10:35 +0100, Jaroslav Kysela wrote:
> Dne 11. 02. 20 v 9:16 Benjamin Poirier napsal(a):
[...]
> > > 
> > > Why PA handles the rear volume control with the current driver code in the
> > > legacy ALSA driver? It should be handled like standard stereo device. I'll
> > > check.
> > 
> > The device comes up with "Analog Stereo Output" profile by default. I
> > changed it to "Analog Surround 4.0 Output" to test controlling each
> > channel individually:
> 
> Yes, but does the volume control work (does PA change the appropriate ALSA
> mixer volume)? Sometimes, it's difficult to see the difference between soft
> volume attenuation and the hardware volume control.

I see what you mean.
When set to the "Analog Surround 4.0 Output", pulseaudio didn't change
the "Bass Speaker" mixer (always at 0dB gain). It used a combination of
Master, Front and sometimes PCM mixers to control all four speakers.

For example:
pacmd list-sinks
	name: <alsa_output.pci-0000_00_1f.3.analog-surround-40>
	volume: front-left: 10349 /  16% / -48.09 dB,   front-right:
	39377 /  60% / -13.27 dB,   rear-left: 23979 /  37% / -26.20 dB,
	rear-right: 47974 /  73% / -8.13 dB
                balance 0.61
alsactl -f /tmp/output store 0
		iface MIXER
		name 'Front Playback Volume'
		value.0 33
		value.1 79
			range '0 - 87'

		name 'Bass Speaker Playback Volume'
		value.0 87
		value.1 87
			range '0 - 87'

		name 'Master Playback Volume'
		value 77
			range '0 - 87'

		name 'PCM Playback Volume'
		value.0 255
		value.1 255
			range '0 - 255'

> > > 
> > > You should also test PA with UCM.
> > 
> > Please let me know what do I need to test exactly? I'm not familiar with
> > UCM.
> 
> Just install the latest pulseaudio (latest from repo), alsa-lib and
> alsa-ucm-conf (also from repo). If pulseaudio detects UCM, it has the
> preference.

Using the packages in debian unstable, `pacmd list` shows "use_ucm=yes".
alsa-ucm-conf was already installed. Hopefully that's enough.

ii  alsa-ucm-conf    1.2.1.2-2    all          ALSA Use Case Manager configuration files
ii  libasound2:amd64 1.2.1.2-2    amd64        shared library for ALSA applications
ii  pulseaudio       13.0-5       amd64        PulseAudio sound server

pacmd list
        name: <module-alsa-card>
	argument: <device_id="0" name="pci-0000_00_1f.3"
	card_name="alsa_card.pci-0000_00_1f.3" namereg_fail=false
	tsched=yes fixed_latency_range=no ignore_dB=no
	deferred_volume=yes use_ucm=yes avoid_resampling=no
	card_properties="module-udev-detect.discovered=1">
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
