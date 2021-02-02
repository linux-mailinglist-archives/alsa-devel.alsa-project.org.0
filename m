Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E030B474
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 02:10:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0040F173B;
	Tue,  2 Feb 2021 02:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0040F173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612228201;
	bh=Jo2CpIsril2fh0G5Byx74yx+hi4bxeo5WIZLOXGS6Cg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vJVZF7sZBwAiWXC+BsEgLJGdjEyFp8nmPsSgiOwyzUXx1w27AJP31eq0LDj7j+52P
	 PBV6+nJVBheznYw1/lwC1adQPFCYxm+BkuaKlMCYPPb2dzOJLY7oI47ToOFagI8Yyj
	 8i0zuFe4bqA8wjSyImHLFGZYrNucu7xCb4P2Et0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0499DF80154;
	Tue,  2 Feb 2021 02:08:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9CF4F80153; Tue,  2 Feb 2021 02:08:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 716D6F800E9
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 02:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 716D6F800E9
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id a7ba8305;
 Tue, 2 Feb 2021 01:08:22 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id d5d3235e;
 Tue, 2 Feb 2021 01:08:19 +0000 (GMT)
Received: from base.nu ([192.168.178.2]) by baphomet.hell with ESMTPSA
 id ART8FAOmGGD39QAAnQSWfg
 (envelope-from <livvy@base.nu>); Tue, 02 Feb 2021 01:08:19 +0000
Date: Tue, 2 Feb 2021 01:08:08 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: Fabian Lesniak <fabian@lesniak-it.de>
Subject: Re: [PATCH] ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
Message-ID: <20210202010808.lgramo5bvukxub3i@base.nu>
References: <20210128160338.dac4vrj7wjiykcxm@base.nu>
 <3031135.XsSY7s2paC@artex>
 <ed9f5c04-0898-e66d-a7ce-ce161efc753a@frantovo.cz>
 <18968431.YylxmPiuJ6@artex>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18968431.YylxmPiuJ6@artex>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 =?utf-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <franta-linux@frantovo.cz>
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

Hi all,

I did a little exploration of this before too and though I would share my
notes FWIW.

Some things we might be able to do right off the bat:
	1. Move wIndex from each item into the control group:
>		struct snd_pioneer_djm_option_group {
>			const char *name;
>			const struct snd_pioneer_djm_option *options;
>			const size_t count;
>			const u16 default_value;
>			const u16 windex;
>		};
>
	2. Generate labels based on wValue perhaps in the fashion of
		where each case is an enum or define (e.g. PHONO = 0x3):
>		static char *snd_pioneer_djm_get_label(u8 input_type) {
>		      switch (input_type) {
>		      case LINE:      return "Control Tone LINE\0";
>		      case CDLINE:    return "Control Tone CD/LINE\0";
>		      case PHONO:     return "Control Tone PHONO\0";
>		      case PFADER:    return "Post Fader\0";
>		      case XFADERA:   return "Cross Fader A\0";
>		      case XFADERB:   return "Cross Fader B\0";
>		      case MIC:       return "Mic\0";
>		      case RECOUT:    return "Rec Out\0";
>		      case AUX:       return "Aux\0";
>		      case NONE:      return "None\0";
>		      case PFADERCH1: return "Post Fader CH1\0";
>		      case PFADERCH2: return "Post Fader CH2\0";
>		      default:	return "\0"; // 'EINVAL'
>		};
>}	

This should get us 90% to where we need to be. I originally had lots of
huge code snippets that I were going to send but I think this is more
readable!

Other wildcard ideas I explored:
	1. Bitmask of values stored in u32 private_data. This could work
		since it only takes up 12bits but it seems like an abuse of
		private_data's intended function and it feels like the
		unwrapping process would be somewhat length and messy.

		I think this is similar to your idea Fabian.

---

Maybe these notes will help provide some inspiration or something.
If I have the time I'll pick up from here tomorrow. Comments/input/
different ideas very welcome :).

Kindest regards,
Olivia


On Mon, Feb 01, 2021 at 10:37:21PM +0100, Fabian Lesniak wrote:
> Hi Franta,
> 
> I've just submitted mixer quirks for the 900NXS2, following the design of 
> Olivia and you. Seems quite clean, but if anyone comes up with a clever idea 
> on how to share code between the channel arrays, I'd highly appreciate that. 
> My experiments so far turned out quite complex: I thought about adding flags 
> like "DEVICE_HAS_DIGITAL", "DEVICE_HAS_AUX" etc. which are evaluated during 
> control creation and usage. The code became unreadable and complex, so I 
> ditched that idea. Creating the controls arrays dynamically would maybe help.
> 
> The 900NXS2 uses the same wValue/wIndex as your 250Mk2, just expanded to five 
> channels. It does not allow to set playback channels via USB, that can only be 
> done in hardware using the input source knob. I guess that is same for the 
> DJM-700. The 900NXS2 allows querying the currently selected playback channel 
> though, but I think this is of no great use so I did not implement it in this 
> patch (although it was in my original draft from last year: https://
> gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4). If you think it's 
> worth it, I could have a look at that again.
> 
> Cheers
> Fabian
> 
> Am Montag, 1. Februar 2021, 16:34:29 CET schrieb František Kučera:
> > Dne 29. 01. 21 v 15:09 Fabian Lesniak napsal(a):
> > > In general, I'm wondering whether it is a good way to implement more and
> > > more Pioneer devices in such a hard coded way. mixer_quirks.c already has
> > > >3k LOC, and the 900NXS2 support will add at least 100 more if written in
> > > the same scheme. It may be good to either dynamically create controls
> > > depending on the model or move pioneer support to an extra file.
> > 
> > The original idea was to reduce complexity rather than lines of code and
> > keep it straightforward without many IF branching and special cases.
> > 
> > Maybe more data/configuration (declared arrays) can be shared among multiple
> > devices – like the capture_level.
> > 
> > Does not the DJM750 support also mapping of MIC, AUX and REC OUT or any
> > playback mapping? If it would, more configuration might be shared. And is
> > it DJM-750MK2 or DJM-750-K? At least the specification of DJM-750-K talks
> > about a sound card with 4 stereo inputs and 4 stereo outputs.
> > 
> > Does anybody know/have other DJM hardware? Does it use the same codes
> > (wValue/wIndex)?
> > 
> > Franta
> 
> 
