Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7723BD24
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 17:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC5D84D;
	Tue,  4 Aug 2020 17:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC5D84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596554583;
	bh=GEGOiLK/xrcWj3rE4Mj8xI38lTheEEzLy3c/l9zquTM=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwgyXD3kkapTxSzP+VCwj2k1fnaTOnwGC4qZTWvaUZWWlbKQqe5u1TAfl3hPpUOB8
	 rFMYKoK23MzYsQTIdtND7JX/xnIN3mJamSfu+n7zyORzcv3mKXzEqDOFXfdhtOkahk
	 EBtlmYtaHapmfdCGEUXqYWzoS8V0Qef40oERahgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5ABDF8015A;
	Tue,  4 Aug 2020 17:21:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA40DF80150; Tue,  4 Aug 2020 17:21:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11C26F80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 17:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11C26F80148
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net
 [82.255.60.242]) (Authenticated sender: hadess@hadess.net)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8B9F74000B;
 Tue,  4 Aug 2020 15:21:08 +0000 (UTC)
Message-ID: <f834d46cae7cc772d48c03ba298bda2681208a28.camel@hadess.net>
Subject: Re: Lenovo m720s combined audio jack not working (ALC233)
From: Bastien Nocera <hadess@hadess.net>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 alsa-devel@alsa-project.org
Date: Tue, 04 Aug 2020 17:21:07 +0200
In-Reply-To: <def6195d-776d-409d-518c-872a0dff17b6@linux.intel.com>
References: <fd8d4a187c86c3514e4442a404ad2568014c5d0b.camel@hadess.net>
 <def6195d-776d-409d-518c-872a0dff17b6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Mark Pearson <markpearson@lenovo.com>
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

On Tue, 2020-08-04 at 09:37 -0500, Pierre-Louis Bossart wrote:
> 
> On 8/4/20 4:56 AM, Bastien Nocera wrote:
> > Hey,
> > 
> > The front audio jack on my newly purchased (but not new) Lenovo
> > m720s
> > doesn't make a microphone output appear in PulseAudio when a
> > headset is
> > plugged in. The headphone part works correctly though. The "sof-
> > hda-dsp
> > Front Headphone" evdev device will switch the state of
> > SW_HEADPHONE_INSERT as expected.
> 
> I would first try with the HDaudio legacy driver to separate
> variables. 
> This will likely prevent your internal DMICs from working but will
> help 
> you test without UCM.
> 
> options snd_intel_dspcfg dsp_driver=1
> 
> That way you'll be able to see if the jack detection actually works.
> 
> If it doesn't, it's a codec configuration/driver issue.
> It it does, it's somehow a PulseAudio/UCM issue. If indeed the 
> information is reported as an event then I am leaning to a UCM issue 
> with the wrong mixer being used.

What sort of "event" are you talking about? I see events on the input
device that's associated with the jack, though I don't know how that
gets routed inside ALSA.

In any case, the module option seems to bring it back to a working
state. Any hints as to what to do now for the PulseAudio bug report if
I wanted to diagnose and report this is a UCM problem?

Cheers

