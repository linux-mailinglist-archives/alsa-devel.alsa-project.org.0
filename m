Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBACBD5B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 16:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F52A1685;
	Fri,  4 Oct 2019 16:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F52A1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570199705;
	bh=B0PaWdr+EuzgXyG20jUYmt+EAhRhr6I5CfQVQf3fpMA=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSbz1GZonKvhwSKpD14Qkmn8iUcHkrAZKLeyEnBqt95KIZEtMSsdijxayurVoeQN9
	 gsxNc6oaSpkw+xdBjqrFwVQlp/6j1E0uds4vkw+zhmlreCENQQttzv5yGEaqBVpb//
	 naBGTrUFUe7vQi73oQzkRtQVUtIUiIU3KPYYTFPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 610B2F803D5;
	Fri,  4 Oct 2019 16:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B0C2F80391; Fri,  4 Oct 2019 16:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93BFCF80137
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 16:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BFCF80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 07:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="222170180"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2019 07:33:09 -0700
Date: Fri, 4 Oct 2019 17:33:08 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: ed nwave <ed.nwave@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <CACtB+u17_napoSXO0L+NhJ7r0abZCN2hMXMTRg8OAtJc+hXFKw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1910041731450.16459@zeliteleevi>
References: <CACtB+u13jj1_Q1EgyP13i0VCyN9vEjJpsSt8vbhwvbY4q4a7vA@mail.gmail.com>
 <alpine.DEB.2.21.1910041416100.16459@zeliteleevi>
 <CACtB+u17_napoSXO0L+NhJ7r0abZCN2hMXMTRg8OAtJc+hXFKw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.1910041642180.16459@zeliteleevi>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] Custom Kernel driver to open and use another ALSA
 PCM
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

Hi,

(routing back to alsa-devel, Ed's alsa-devel subscription is still
pending so he can't sent to the list, forwarding with his permission)

On Fri, 4 Oct 2019, ed nwave wrote:

> The example used of a voice changing app was just an illustration of how =

> I need=A0to connect "my driver" directly to a sound card driver that's =

> all. I understand the user-space comment entirely.=A0 =A0The actual =

> objective is one common driver ( my PCM driver ) being used by 4 music =

> applications where I can dynamically switch the output PCM without =

> restarting the applications or the applications even knowing the output =

> cards not real. =


so far this is pretty much directly from original design goals of JACK.
But ok, then you mention this:

> I must have direct access to audio hardware i.e. hw:1,0 =

> for applications like RoonReady/ RAAT. So Pulseaudio's out. I require =

> the ability to

Now this can be a problem of course if you cannot modify the apps.
The you would have to route this via alsa-lib plugins.

> follow ( like and MPD playlist ). As I understand Jack is set for a =

> certain rate and format at the start when connecting and does not update =

> rates automatically if the rate of the songs change; can jack connect =

> directly to hw and handle DSD rates?. This is all part of a headless =


I've been out of the loop for some years now, but no, I don't think JACK =

supports these. But you are anyways customizing quite a lot of SW, so =

you could e.g. consider extending JACK and/or some other audio =

server for this purpose, or just write a new one. =


> Other requirements are my applications must have no plugins or dmix and =

> connect directly to hardware i.e. hw:1,0 - due to rate demands, no =

> remixing. Another requirement is the latency required by one company to =

> attain multi-room streaming being about 1ms max, this is for =

> certification. Finally there's the need to change bit rate settings =


I think reaching the latency requirement (and not doing mixing) can =

certainly be done in user-space, so I still read the "need to access =

harwdare directly" more as "existing user-space components are not =

suitable for my needs" than a strict requirement for doing this in kernel.

But alas, I get your context and I understand these constraints are real =

for you as well. Just wanted to make sure you have taken good enough look =

at user-space options.

> All that's left for me to do is to connect pipe the data directly to the =

> driver for the my sound card. Question is can it be done? And if so, =

> where do I even start? How can I import snd_usb_audio and open it so it =

> appears a the typical snd_card struct?

The longrunning trend has been to push stuff like this to user-space, so =

you will not find much examples. I haven't done this myself, so I'll let =

other people make recommendations. I'd start by looking at ALSA OSS =

emulation and the virtualized drivers we have (like sound/xen/).

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
