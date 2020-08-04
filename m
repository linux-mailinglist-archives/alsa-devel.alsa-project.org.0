Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32D23B906
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 12:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D11D1669;
	Tue,  4 Aug 2020 12:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D11D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596537996;
	bh=ue70WnQkNqpirRYIA/tYzkfGcaOfMr7aIWtHY8lCIWk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+cKl5AmrWP1ZJETGns+5Vos2Fcla6Q3UyKkQJ0r9zRWcmlS96GKGdIjjwfyaWpAh
	 jvp5XcAPU9U1DifVbzRG/2Qm25H2i0EDz0L2Cv5fJGd9AjapAIShBgKY+yEoKEjYu1
	 yJWI8uoxBIzfg73S7Obnk8hO6j+8FE8Pd4kQoBdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B950CF8015A;
	Tue,  4 Aug 2020 12:44:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24839F80150; Tue,  4 Aug 2020 12:44:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D317F80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 12:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D317F80148
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net
 [82.255.60.242]) (Authenticated sender: hadess@hadess.net)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9E1C2C000D;
 Tue,  4 Aug 2020 10:44:42 +0000 (UTC)
Message-ID: <934480a020c68bee9ecbf2ab060fac338888db94.camel@hadess.net>
Subject: Re: Lenovo m720s combined audio jack not working (ALC233)
From: Bastien Nocera <hadess@hadess.net>
To: alsa-devel@alsa-project.org
Date: Tue, 04 Aug 2020 12:44:42 +0200
In-Reply-To: <177c5035121d784c06e07631121e1b276962b957.camel@hadess.net>
References: <fd8d4a187c86c3514e4442a404ad2568014c5d0b.camel@hadess.net>
 <177c5035121d784c06e07631121e1b276962b957.camel@hadess.net>
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

On Tue, 2020-08-04 at 12:03 +0200, Bastien Nocera wrote:
> On Tue, 2020-08-04 at 11:56 +0200, Bastien Nocera wrote:
> > Hey,
> > 
> > The front audio jack on my newly purchased (but not new) Lenovo
> > m720s
> > doesn't make a microphone output appear in PulseAudio when a
> > headset
> > is
> > plugged in. The headphone part works correctly though. The "sof-
> > hda-
> > dsp 
> > Front Headphone" evdev device will switch the state of
> > SW_HEADPHONE_INSERT as expected.
> > 
> > Does anyone know whether the headphones/headset switching is
> > supposed
> > to be automatic, or would that trigger a "what did you plug in"
> > dialogue as on some Dell machines I've worked with?
> > 
> > I couldn't find any quirks in sound/pci/hda that would be directly
> > related to this problem (eg. Lenovo, ALC233 and mic presence), so
> > I'm
> > a
> > bit stumped.
> > 
> > I've attached the pinout information from alsa-info.
> 
> I should note that I'm using BIOS version M1UKT21A, and that the
> latest
> is 25 releases newer, so that it's very possible that a newer BIOS
> would fix this. I'll have to try that first.

Updating to BIOS M1UKT59A [1] didn't fix the problem. dmesg contains
some more "pin mapping" info:
[    6.728470] sof-audio-pci 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
[    9.753117] skl_hda_dsp_generic skl_hda_dsp_generic: info: override BE DAI link iDisp1
[    9.753118] skl_hda_dsp_generic skl_hda_dsp_generic: info: override BE DAI link iDisp2
[    9.753119] skl_hda_dsp_generic skl_hda_dsp_generic: info: override BE DAI link iDisp3
[    9.753119] skl_hda_dsp_generic skl_hda_dsp_generic: info: override BE DAI link Analog Playback and Capture
[    9.753119] skl_hda_dsp_generic skl_hda_dsp_generic: info: override BE DAI link Digital Playback and Capture
[    9.753121] skl_hda_dsp_generic skl_hda_dsp_generic: info: override BE DAI link dmic01
[    9.753121] skl_hda_dsp_generic skl_hda_dsp_generic: info: override BE DAI link dmic16k
[   10.110831] skl_hda_dsp_generic skl_hda_dsp_generic: intel-hdmi-hifi1 <-> iDisp1 Pin mapping ok
[   10.110833] skl_hda_dsp_generic skl_hda_dsp_generic: intel-hdmi-hifi2 <-> iDisp2 Pin mapping ok
[   10.110834] skl_hda_dsp_generic skl_hda_dsp_generic: intel-hdmi-hifi3 <-> iDisp3 Pin mapping ok
[   10.110836] skl_hda_dsp_generic skl_hda_dsp_generic: Analog Codec DAI <-> Analog CPU DAI mapping ok
[   10.110838] skl_hda_dsp_generic skl_hda_dsp_generic: Digital Codec DAI <-> Digital CPU DAI mapping ok
[   10.110839] skl_hda_dsp_generic skl_hda_dsp_generic: dmic-hifi <-> DMIC01 Pin mapping ok
[   10.110840] skl_hda_dsp_generic skl_hda_dsp_generic: dmic-hifi <-> DMIC16k Pin mapping ok
[   10.110847] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> DMIC 6 mapping ok
[   10.110851] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> DMIC16kHz 7 mapping ok
[   10.110857] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> HDA Analog 0 mapping ok
[   10.110863] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> HDA Digital 1 mapping ok
[   10.110867] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> HDMI1 3 mapping ok
[   10.110871] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> HDMI2 4 mapping ok
[   10.110875] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> HDMI3 5 mapping ok
[   10.111103] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
[   10.111106] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
[   10.111109] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
[   10.111112] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
[   10.111114] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
[   10.111118] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
[   10.111121] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
[   10.111125] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
[   10.111129] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
[   10.111132] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
[   10.111136] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten
[   10.128765] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input26
[   10.129042] input: sof-hda-dsp Front Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input27
[   10.129230] input: sof-hda-dsp Line Out as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input28
[   10.129269] input: sof-hda-dsp Front Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input29
[   10.129484] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input30
[   10.129516] input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input31
[   10.129734] input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input32


[1]: which is scary as heck, as the thing tells you the new BIOS
doesn't match what you want to upgrade and asks whether you want to
proceed, but proceeds anyway after a couple of seconds, then fails to
boot at least 3 or 4 times after the upgrade.

