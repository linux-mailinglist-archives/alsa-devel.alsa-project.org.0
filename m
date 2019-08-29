Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D8A1D8E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725051686;
	Thu, 29 Aug 2019 16:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725051686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090089;
	bh=F6VgoLrlVlCwC7H6wqSptguDONoUCpcH3lgmkLqa6dc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqmtBxdmBXqgJL9exLhV52ERCYg/WwuXCjBSnQ8VYJCHMQhmMb+3kKyxi8opT4/3Q
	 pIkd0q5wnUUEUhghsdgxe9q9O5Vh2+ZMSnPztSLUnCgPamelARfwCzUkViPTUbCFgY
	 CUdkJD1GUFj3B7eUVkcjQLB+wRpCGvUFLo7qngl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4514F89866;
	Thu, 29 Aug 2019 12:38:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 561F5F89864; Thu, 29 Aug 2019 12:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_29,PRX_BODY_30,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id AE4A0F89847
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 12:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE4A0F89847
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id 30FEF209D35A; Thu, 29 Aug 2019 12:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su 30FEF209D35A
Date: Thu, 29 Aug 2019 12:38:05 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190829103805.GA1525@xn--80adja5bqm.su>
References: <20190404192430.GA24729@xn--80adja5bqm.su>
 <20190719111231.GA26592@xn--80adja5bqm.su>
 <s5hzhla9j8b.wl-tiwai@suse.de>
 <20190720165435.GA5855@xn--80adja5bqm.su>
 <20190819195714.GA2737@xn--80adja5bqm.su>
 <s5hef1dthbk.wl-tiwai@suse.de>
 <20190822203031.GA22363@xn--80adja5bqm.su>
 <s5h5zmg48u2.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h5zmg48u2.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Surround speaker connection on Acer 8951G
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

Hi Takashi,

On Thu, Aug 29, 2019 at 11:30:45AM +0200, Takashi Iwai wrote:
> On Thu, 22 Aug 2019 22:30:31 +0200,
> Sergey 'Jin' Bostandzhyan wrote:
> > 
> > Next thing I am looking at is the problem with automute when HP are plugged in,
> > I hope you can point me in the right direction here.
> > 
> > As described in one of my earlier posts, rear speakers share the pin with 
> > the headphones jack and they get correctly muted when headphones are plugged in.
> > 
> > However, all other speakers (front, center) remain unmuted.
> 
> That's an ugly situation, and currently no clean way to deal with such
> a shared pin for outputs, unfortunately.  The auto-parser can handle
> the case with input/output switching (e.g. sharing mic and surround),
> but not about the two outputs.
> 
> One possible way with the current code (and your latest patch) would
> be to create a UCM profile.  The driver should still provide the jack
> detection on the pin 0x1b as "Surround Jack", and this can be used as
> the headphone jack detection.

I gogled it up and I did find HDAudio-Gigabyte-ALC1220DualCodecs as an
example, so basically the solution in this case would be split between
the driver and alsa-lib?

Are there any disadvantages to muting the other channels directly in the
driver? Or would it be a viable option to extend the auto-parser to
handle the remaining channels?

Personally, I would prefer a solution at one place, but I follow your lead here,
if you say that UCM is the way to go, then so be it.

I played around with jack detection and I had the feeling that it did not work
reliably, or maybe I misunderstood something?

Who is responsible for setting spec->gen.hp_jack_present? I thought that
this variable always represents the current presence state of the hp jack?

I tried printing it from my automute hook, but it never changed. My assumption
is, that due to 0x1b's pin configuration its not treated by the driver
as an hp_out, its also not added the hp_outs array.

I tried to add the pin to the hp_outs array manually, but I could not
see any difference.

In the end I configured the 0x1b pin to allow jack sensing, but I noticed that
the hook will not get triggered during playback, is this a bug or am I missing 
something?

I tried the following:

static void alc662_aspire_ethos_hp_automute_hook(struct hda_codec *codec,
                     struct hda_jack_callback *jack)
{
    struct alc_spec *spec = codec->spec;
    unsigned int hp_jack_old_state = spec->gen.hp_jack_present;

    if (snd_hda_jack_detect(codec, 0x1b) == HDA_JACK_PRESENT) {
        printk("HP AUTOMUTE HOOK: hp plugged in\n");
        spec->gen.hp_jack_present = 1;
    } else {
        printk("HP AUTOMUTE HOOK: hp unplugged\n");
        spec->gen.hp_jack_present = 0;
    }
    if (hp_jack_old_state != spec->gen.hp_jack_present) {
        printk("Detected state change on pin 0x1b, jack present: %d\n",
            spec->gen.hp_jack_present);
    }
}

I kept watching dmesg, when nothing is playing the plugged in/unplugged
messages appear correctly, but if I start speaker test and replug during
the playback, nothing is printed.
 
Meanwhile I made progress on the LFE topic:
>> Could someone hint me how to proceed in "finding the LFE"? Where should I be
>> digging? I did also have a look at parser hints documentation and tried some,
>> but this was more a random attempt and did not really help me.
>
> It might be some other external stuff like an external amp that is
> missing.  Often it's managed via GPIO or EAPD (that is controlled by
> HD-audio itself), but sometimes via a vendor-specific verb, or even
> over a completely different i2c...
>
> In the case of vendor verbs, you can take a look at other quirks for
> similar models that touches lots of COEF stuff.

Turned out it was indeed a GPIO, I won't describe all the things I tried, in the
end it was a lucky click on the dir_out checkbox in hda-analyzer while I was
debugging the shared pin issue :)

The below HDA_FIXUP_VERBS does the trick, so I do have all 6 speakers working, 
finally!

{0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02}

The only thing that is not quite clear to me is - does LFE still have its
own pin and I was just not able to find it, but managed to unmute it via
the GPIO? Or is the LFE speaker somehow "intenrally managed"? It works
correctly though, alsa mixer is also capable of controlling LFE volume
separately so it's fine, everything is also working with pulseaudio and a 5.1
profile on top.

So right now muting seems to be indeed the last remaining piece of the puzzle.

> In anyway, could you give alsa-info.sh outputs with and without your
> patch?

Here is the original output of the unmodified system:
http://alsa-project.org/db/?f=3adde87164f5fc349c3c78b211ee63e416ebf10b

Here is my current state:
http://alsa-project.org/db/?f=5f1c8730d3099099b4c7442cb09d475e5618c3c6

I also pushed my code to github:
https://github.com/jin-eld/hda-intel-alc669x

Thank you very much for not giving up on me :) Your feedback is very valuable!

Kind regards,
Jin

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
