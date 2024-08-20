Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E365957BD2
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 05:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E9A320C;
	Tue, 20 Aug 2024 05:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E9A320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724123499;
	bh=nG26NZ3S/KuNQ2SHcuxORshAwbQgT5QZdIv23N6ZCqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SiH5d5lS0E+19kJCtNPfFfo9RBnGfFld439UevE/dYbq5MIeHyFad+sz/qrD/TIQb
	 ckmUDQjNBfXqPwtWduyTKmODYURAGhQL8cCxTy1bnpQw1OLcvc0kZ3jxkVGCGUjLb/
	 dD+GbDwQjjuXEDNc7hxY53FvoMvGHfc1hIJi1BBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84905F805A9; Tue, 20 Aug 2024 05:11:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59669F805AE;
	Tue, 20 Aug 2024 05:11:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81DF6F80494; Tue, 20 Aug 2024 05:00:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
	TIME_LIMIT_EXCEEDED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A98FF80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 04:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A98FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hHz7gq7T
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-39d22965434so13177505ab.0
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Aug 2024 19:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724122401; x=1724727201;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fT6vSqFxRxEeg2TyE8vAmieBZnT3qlYo8e/6USKHH/E=;
        b=hHz7gq7TNEJ9TlmFH9n7VgLLCMk7vlryhHAB/t8WLxom3RMpAMvH3EefCnLIAzEap7
         fEVd5AdgAG/+5aiJEzRyKJWyoRqYuYzPN2I5V/Zjmp6qiGxW0tFrzNDh+RqduCefEPeO
         X9AjIADn5wWGZGyBVb8wfX9dGtBsbvKpQv+2cwyZk4ixBcRiwR3pHQ712kW8KktDeVq8
         c4YioHKWomr1OBSYrwlmnHEz+AYdPpkHYGUPV6Dvuc/s3Ink5fnz0jr/jsipC347Ra3d
         htypplKu/yR/w2nRUuUY7e362HTT2qmfdOh3Pae9LuvsUP8IwO+6NkCmX+L/LOmPuMlk
         S0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724122401; x=1724727201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fT6vSqFxRxEeg2TyE8vAmieBZnT3qlYo8e/6USKHH/E=;
        b=icEcUz2ILSiK5j8ECQTxBZPd/vLrsrgoNZNTw4Jkjn/bURL9L6MNXXfB7Kcu130Ql/
         bLaDa7wmEu+uhQHvgUwgco7GFOB9kQHrvsGjlk82rzK6LuDGv2Y5CVih2sI3p0ZxJAX4
         dgfv9aJussbwxvXtqvcVA6RrQ41t/lNwQNFtY7we6tIVgszJDvZdEmAuqtcbJXHHA/Y5
         Oxxrzo78Bg14xBix5PI6G2v0uPg+DwDaFAHYKA+reJuOgGjLTSRQlAhhsczfyj3MU1uJ
         aaM8aScn2y3G+8EvuYM7x/cbapi4zmEQE2HGstEz0Hsfk1RuMk5S0lmqu1DJKx+uTUir
         PGMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY/wt2EMyNPGE8qNx8ifWwys/Gp6Xylr83A6Im8ALQ1G0XFlvJfkM8Eh2p4TT1P5fzxRZwJ0TqwAYT@alsa-project.org
X-Gm-Message-State: AOJu0YxYfb7XCB/M+lZrqDnr6i4cUPKEz4SafkPHiVXRUlKuxs5Vewr9
	dbriLoF5H27u9KVuePYGq9aaMo8XFlgkuI7z6tZSEM7Q0x1HIkaGqSCueSVetQ21YIZkm9zaoFJ
	bLk5qWUod9QkEdJVHcvtEHO8aGJ8=
X-Google-Smtp-Source: 
 AGHT+IGl4gRPN5RAOxKXugMK43Dh6VHASCDS5Twf9YsdPNqPWrRzvf3PhVgc7lqQMpYhRDm7MWOvnuVY3lUtLNY/Lo4=
X-Received: by 2002:a05:6e02:20cb:b0:39d:4d2d:d0de with SMTP id
 e9e14a558f8ab-39d56dd773emr21812545ab.3.1724122401038; Mon, 19 Aug 2024
 19:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
 <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
In-Reply-To: <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Aug 2024 10:53:10 +0800
Message-ID: 
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory
 function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: T62TWNFT7OSD4AK7ZODAPYWTAJAWPZF6
X-Message-ID-Hash: T62TWNFT7OSD4AK7ZODAPYWTAJAWPZF6
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T62TWNFT7OSD4AK7ZODAPYWTAJAWPZF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 19, 2024 at 3:42=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/16/24 12:42, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the compress framework, user can use this function with
> > compress ioctl interface.
> >
> > Define below private metadata key value for output
> > format, output rate and ratio modifier configuration.
> > ASRC_OUTPUT_FORMAT 0x80000001
> > ASRC_OUTPUT_RATE   0x80000002
> > ASRC_RATIO_MOD     0x80000003
>
> Can the output format/rate change at run-time?

Seldom I think.

>
> If no, then these parameters should be moved somewhere else - e.g.
> hw_params or something.

This means I will do some changes in compress_params.h, add
output format and output rate definition, follow Jaroslav's example
right?


>
> I am still not very clear on the expanding the SET_METADATA ioctl to
> deal with the ratio changes. This isn't linked to the control layer as
> suggested before, and there's no precedent of calling it multiple times
> during streaming.

Which control layer? if you means the snd_kcontrol_new?  it is bound
with sound card,  but in my case,  I need to the control bind with
the snd_compr_stream to support multi streams/instances.

>
> I also wonder how it was tested since tinycompress does not support this?

I wrote a unit test to test these ASRC M2M functions.

>
>
> > +static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
> > +                                     struct snd_compr_codec_caps *code=
c)
> > +{
> > +     struct fsl_asrc_m2m_cap cap;
> > +     __u32 rates[MAX_NUM_BITRATES];
> > +     snd_pcm_format_t k;
> > +     int i =3D 0, j =3D 0;
> > +     int ret;
> > +
> > +     ret =3D asrc->m2m_get_cap(&cap);
> > +     if (ret)
> > +             return -EINVAL;
> > +
> > +     if (cap.rate_in & SNDRV_PCM_RATE_5512)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_55=
12);
>
> this doesn't sound compatible with the patch2 definitions?
>
> cap->rate_in =3D SNDRV_PCM_RATE_8000_768000;

This ASRC M2M driver is designed for two kinds of hw ASRC modules.

one cap is : cap->rate_in =3D SNDRV_PCM_RATE_8000_192000 | SNDRV_PCM_RATE_5=
512;
another is : cap->rate_in =3D SNDRV_PCM_RATE_8000_768000;
they are in patch2 and patch3


>
> > +     if (cap.rate_in & SNDRV_PCM_RATE_8000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_80=
00);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_11025)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_11=
025);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_16000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_16=
000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_22050)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_22=
050);
>
> missing 24 kHz

There is no SNDRV_PCM_RATE_24000 in ALSA.

>
> > +     if (cap.rate_in & SNDRV_PCM_RATE_32000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_32=
000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_44100)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_44=
100);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_48000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_48=
000);
>
> missing 64kHz

Yes, will add it.

Best regards
Shengjiu Wang

>
> > +     if (cap.rate_in & SNDRV_PCM_RATE_88200)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_88=
200);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_96000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_96=
000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_176400)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_17=
6400);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_192000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_19=
2000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_352800)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_35=
2800);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_384000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_38=
4000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_705600)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_70=
5600);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_768000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_76=
8000);
> > +
> > +     pcm_for_each_format(k) {
> > +             if (pcm_format_to_bits(k) & cap.fmt_in) {
> > +                     codec->descriptor[j].max_ch =3D cap.chan_max;
> > +                     memcpy(codec->descriptor[j].sample_rates, rates, =
i * sizeof(__u32));
> > +                     codec->descriptor[j].num_sample_rates =3D i;
> > +                     codec->descriptor[j].formats =3D k;
> > +                     j++;
> > +             }
> > +     }
> > +
> > +     codec->codec =3D SND_AUDIOCODEC_PCM;
> > +     codec->num_descriptors =3D j;
> > +     return 0;
>
>
