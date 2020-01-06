Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A313F130B1E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 02:02:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27D961807;
	Mon,  6 Jan 2020 02:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27D961807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578272564;
	bh=NOtbkhR6MwHZ7eIAcepZi2/VsG2IHbZV9Qhap9jQPu8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2hyMojBBZ54J3n2vTrhjKBz4gG3soMNEx8YoyggHs/bAPNPVMj5JodWXX7AFY7it
	 I2JPTKm4r/fz5D8W9rsIGJQt2K973arvsyVJPS83dd+fm4a/fMUjNVisSsLhV4iPER
	 JTqRT6gHti4yV8xEzJBDLTTwIbdMyPYpBKuccvQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F389F80140;
	Mon,  6 Jan 2020 02:01:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D089F8014A; Mon,  6 Jan 2020 02:00:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDA96F8013F
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 02:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDA96F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UVCu4J1O"
Received: by mail-qk1-x741.google.com with SMTP id w127so38179245qkb.11
 for <alsa-devel@alsa-project.org>; Sun, 05 Jan 2020 17:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5lANSHP4q9rweTnrRQtTiM/mjXaWP1ILP1EGHybJ4E=;
 b=UVCu4J1OEyGR79Mtvuwodhq4YYw6PXw702wsfJlE2mYkC2F3tsnQ5Enxxms3YjzXU1
 UiAIYN7vCW/HyH/QkulwmNkg4NsUKXUs/30BhVBgfdS8kj+rHvFBhXQP3ONgHrI5jH0r
 ERU6cncc007tSaE5qaaOwjBdANYqXhopzxParKpt96pfA4lw1WmGA0ES0vcj73LaNDlx
 wy91+fsNMszhpGmDuj9KLYdtciXOojjKLjOfSXUxENW6/GuCFJnjUP9qLc0s967BtmyM
 Rw2xc9dcvv2ogptrML6CMfe9CRsjDB+nwTMZAa19Y7XkiCG1FYbt9aC+8ZADOTBDCVXb
 bx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5lANSHP4q9rweTnrRQtTiM/mjXaWP1ILP1EGHybJ4E=;
 b=nwQKCAg0ruIauAeNxh0BqBLKKddOJ2U/76JLKCxZBrXl6lhJflckW4vwc5w6GiRPuQ
 vnVl4qYNU8sqV4aFPyV1napAL8wIycYmZKQ32/7KQB9qmgaWoFVCvQHgIYUf1CBXB3Mk
 MrIJmf4d1/AyPXCdZkW1BdutRvedVhFS+k2OF30BFwIKL0EGRXiuJlALYXlrzNq7ASJ6
 huCfLRrK2vcxMv+AF2PaUDRkrQ/YjnMt6fEpUlZ/KnV4wwmfg8JNdZLOKOXn+ezYRdp/
 BteEhXGM8NYrMK2G5hx3EWvJlhB4mcMGBEMPrcNFXqqbIKigJLxUFUGFv5QzX5HHJrsH
 mfBw==
X-Gm-Message-State: APjAAAU8pTo+EjvgPmsQAXJUemeNalJ42CbnkPS5jdPIrHQO9IlTa0ll
 agFF2deTq6qIqtaDMw6fytiLZvBcN/xdM6fhAq8=
X-Google-Smtp-Source: APXvYqybuzopPSeNdmLoXao916O+l2vSH9mPv246GJM5T7P+8JcjGIREfMiL/hSbNsqDdBtN37LdrOSiIeHe0QQjbLQ=
X-Received: by 2002:a05:620a:134d:: with SMTP id
 c13mr77619363qkl.322.1578272450465; 
 Sun, 05 Jan 2020 17:00:50 -0800 (PST)
MIME-Version: 1.0
References: <5e02cab4.1c69fb81.83bec.f334@mx.google.com>
 <s5heewq5f3d.wl-tiwai@suse.de>
In-Reply-To: <s5heewq5f3d.wl-tiwai@suse.de>
From: Nick Kossifidis <mickflemm@gmail.com>
Date: Mon, 6 Jan 2020 03:00:39 +0200
Message-ID: <CAFtRNNwdf1PMJnmRDbtioUXRBGdLcPtNxrvQ+4X8WFVAvU1DKg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Add support for Presonus
	Studio 1810c
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

Hello Takashi, happy new year and thanks for the feedback,


On Fri, Dec 27, 2019 at 10:48 AM Takashi Iwai <tiwai@suse.de> wrote:
> > diff --git a/sound/usb/format.c b/sound/usb/format.c
> > index d79db7130..edf3f2a55 100644
> > --- a/sound/usb/format.c
> > +++ b/sound/usb/format.c
> > @@ -262,6 +262,23 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
> >               }
> >
> >               for (rate = min; rate <= max; rate += res) {
> > +
> > +                     /*
> > +                      * Presonus Studio 1810c anounces invalid
> > +                      * sampling rates for its streams.
> > +                      */
> > +                     if (chip->usb_id == USB_ID(0x0194f, 0x010c) &&
> > +                     ((rate > 48000 && fp->altsetting == 1) ||
> > +                      ((rate < 88200 || rate > 96000)
> > +                       && fp->altsetting == 2) ||
> > +                      ((rate < 176400 || rate > 192000)
> > +                       && fp->altsetting == 3))) {
> > +                             if (res)
> > +                                     continue;
> > +                             else
> > +                                     break;
> > +                     }
>
> It's hard to imagine what result this would lead to, because the
> conditions are so complex.
> Maybe better to prepare a fixed table instead?  Or, can we simply take
> a fixed quirk?
>

I thought of using a fixed table but on the other hand the card does
support reporting rates via the UAC2-compliant command and I noticed
there are similar quirks on parse_audio_format_rates_v1. Maybe have a
new quirk function that we can call from within the for loop for both
UAC1/2 to filter misreported rates in one place ? I think it'll be
cleaner that way.

> > +static int
> > +snd_s1810c_switch_set(struct snd_kcontrol *kctl,
> > +                   struct snd_ctl_elem_value *ctl_elem)
> > +{
> > +     struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
> > +     struct usb_mixer_interface *mixer = list->mixer;
> > +     uint32_t curval = 0;
> > +     uint32_t newval = (uint32_t) ctl_elem->value.integer.value[0];
> > +     int ret = 0;
> > +
> > +     ret = snd_s1810c_get_switch_state(mixer, kctl, &curval);
> > +     if (ret < 0)
> > +             return 0;
> > +
> > +     if (curval == newval)
> > +             return 0;
> > +
> > +     kctl->private_value &= ~(0x1 << 16);
> > +     kctl->private_value |= (unsigned int)(newval & 0x1) << 16;
> > +     ret = snd_s1810c_set_switch_state(mixer, kctl);
>
> Hm, this can be racy.  The control get/put isn't protected, so you
> might get the inconsistency here when multiple kctls are accessed
> concurrently.
>

There is a lock on get/set_switch_state to serialize access to the
card, it should take care of that.

> > +     .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> > +     .name = "Line 1/2 source type",
>
> The control name should consist of words starting with a capital
> letter, so it should be "Line 1/2 Source Type".
> Also, usually a control name needs a standard suffix.  Though, this
> has a special return enum type, so it can be OK as is.
>
> However...
>
> > +     .info = snd_s1810c_line_sw_info,
> > +     .get = snd_s1810c_switch_get,
> > +     .put = snd_s1810c_switch_set,
>
> ... this shows that the combination is invalid.  The enum type doesn't
> get/put the values in integer fields.  It's incompatible.
>

I didn't get that one, isn't enum type an integer ? All controls added
here are on/off switches and use the same get/set functions, I just
wanted to provide some more info for some of them so I added custom
.info functions.

> > +     .private_value = (SC1810C_STATE_LINE_SW | SC1810C_CTL_LINE_SW << 8)
> > +};
> > +
> > +static struct snd_kcontrol_new snd_s1810c_mute_sw = {
> > +     .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> > +     .name = "Mute Main Out",
>
> ... and this one, for example, should deserve for "Switch" suffix, as
> it's a standard boolean switch (which use integer fields unlike
> enum).
>

Isn't "Switch" superfluous ? I don't see anything similar on the mixer
controls of my other sound cards, e.g. it says "Mic Boost" not "Switch
Mic Boost on". Also I still don't get the enum part, how can this be a
standard boolean switch and the others not ? You mean because it uses
snd_ctl_boolean_mono_info ?

> > +/* Entry point, called from mixer_quirks.c */
> > +int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
> > +{
> > +     struct s1810_mixer_state *private = NULL;
> > +     struct snd_usb_audio *chip = mixer->chip;
> > +     struct usb_device *dev = chip->dev;
> > +     int ret = 0;
> > +
> > +     /* Run this only once */
> > +     if (!list_empty(&chip->mixer_list))
> > +             return 0;
> > +
> > +     dev_info(&dev->dev,
> > +              "Presonus Studio 1810c, device_setup: %u\n", chip->setup);
> > +     if (chip->setup == 1)
> > +             dev_info(&dev->dev, "(8out/18in @ 48KHz)\n");
> > +     else if (chip->setup == 2)
> > +             dev_info(&dev->dev, "(6out/8in @ 192KHz)\n");
> > +     else
> > +             dev_info(&dev->dev, "(8out/14in @ 96KHz)\n");
> > +
> > +     ret = snd_s1810c_init_mixer_maps(chip);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     private = vzalloc(sizeof(struct s1810_mixer_state));
>
> I don't think vmalloc is needed here, as the object is so small.
> Use kzalloc() and kfree() instead (unless I overlook something).
>

Good point, I'll switch to kzalloc/kfree, this will also make the bot happy.


-- 
GPG ID: 0xEE878588
As you read this post global entropy rises. Have Fun ;-)
Nick
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
