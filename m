Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3179752F7
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 14:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9D6832;
	Wed, 11 Sep 2024 14:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9D6832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726059373;
	bh=PXGl3Yh3gPOigFyEjo+1kizXmz5AFYgovU6M8wIOaVc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KfhHt7o1nKbvzJ2qUBY1qtkYOzuU+G6LywpDxAl1r3GBGNxYGlq2HaXc6K0R/yCIY
	 G7txjfkUkrcKkwTF0sWb++TMKTAnl9uJY6carXT4HU4ioAa7yEPp5TfO/uz5G6/G1p
	 xdhoVgtx9zMpTsQ2tKKEattm3oAYYzCSiPTFHecM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB90EF805A9; Wed, 11 Sep 2024 14:55:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC279F805B0;
	Wed, 11 Sep 2024 14:55:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02FD3F801F5; Wed, 11 Sep 2024 14:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D179DF8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 14:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D179DF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=tRIzhXyx
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42cba0dc922so25073565e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 11 Sep 2024 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726059335;
 x=1726664135; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9RGOZIYc6ayBD37YXP/MMFqFNqPPZai0Orn0846COw=;
        b=tRIzhXyxMhH0PVkay257glFUmdWP6H9dsYLuasn6MTskFBbSb0IZRB9wZuITLHwsXs
         3qJjl3w71dLL9h1WVcssj5FlmwYhF6miV70V5QOMBwWPo7daKanh/6vzQ0bfThco8M3s
         ryx1c1RYoQ+SgxeeiY+ZDgA1SkkzMn8tJbmDAPflk/QIXIQLbXlXevQu2cYr2APIEyMP
         5NsxBxegi4lD6/Bfw6QitCIHhvv8y+Fi21Rn1Srov/nlfa60wTcRAOtR3L1+Iyj1+x9X
         SPdX6b7R8XhCFrPkjUUZUOaSTQON9feMkGEylALLxkmxGN5Rs+cHuSF3i9QXP19oVQqP
         da8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726059335; x=1726664135;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9RGOZIYc6ayBD37YXP/MMFqFNqPPZai0Orn0846COw=;
        b=vvbTjfTF1GDiI94nT7qlcLFDsaC9gox5x2uX+6D7RGPKmTsY0ZQ5F5vvNI3bQNtfuH
         qX68KXEsyKgAMYtbyojOIF6qamFmxyOXfl6a443pctzmuXYnpd/7sFV23fG43VjDWLHD
         slhNl/zFu3hhUdBVhIxBECAESJ87zfVzVN7ntTZpGQTtz9xWfWmalTLM3XUAl8jsfGY0
         HWJFKT+bftFfQ0+NDjEPESfye0GoF+3cVtziY3/6/R8/ynxU6klNGGJ8CNWatQMn0QuL
         EbXCzaf9RxaqgYLsnVzNInL0aRjZMpEJvGla2QqL7ZXeAnR46lo0QYkIlDtqOijQ/rBr
         VEVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHvT/9hNik2c9jAKRm5G1olgWCyJn7kYlDDqQP4mU85NWmXqFPN5DUpINjZHAudHr74dr9P0+tKGkN@alsa-project.org
X-Gm-Message-State: AOJu0Yx9wxdXVgVtfbHZE4lvY+iHIWRRBiw+h+zdu8cVhCJgH9CbXpxT
	tAMyQQfsnxzVZELz5H7qwDt0Bzabr2yKlUq/knaZ09lstacNCFkFLQ559FYM6kE=
X-Google-Smtp-Source: 
 AGHT+IFUI5RsJEYiRmeXktzyq/H2NLWoogpCMjeueVb9QXdTRobrP0ALCRQbHrSB3n16d3kmTZ3FAg==
X-Received: by 2002:a05:600c:5107:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42cad760f6bmr113201445e9.13.1726059333802;
        Wed, 11 Sep 2024 05:55:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7388:2adc:a5d5:ff63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb0dbcb6bsm136949845e9.30.2024.09.11.05.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 05:55:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: =?utf-8?Q?P=C3=A9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
  Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  David Rhodes <david.rhodes@cirrus.com>,
  Richard Fitzgerald <rf@opensource.cirrus.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Cezary Rojewski
 <cezary.rojewski@intel.com>,  Liam Girdwood
 <liam.r.girdwood@linux.intel.com>,  Bard Liao
 <yung-chuan.liao@linux.intel.com>,  Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,  Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,  Chen-Yu Tsai <wens@csie.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org,
  patches@opensource.cirrus.com,  alsa-devel@alsa-project.org,
  linux-arm-msm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
In-Reply-To: <87y13y31kq.wl-tiwai@suse.de> (Takashi Iwai's message of "Wed, 11
	Sep 2024 12:51:49 +0200")
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
	<20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
	<1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
	<87ed5q4kbe.wl-tiwai@suse.de>
	<5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
	<87y13y31kq.wl-tiwai@suse.de>
Date: Wed, 11 Sep 2024 14:55:32 +0200
Message-ID: <1j34m6s62j.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VH6E22NPK2QQL5DMQYVQFBX6XY2OBK6W
X-Message-ID-Hash: VH6E22NPK2QQL5DMQYVQFBX6XY2OBK6W
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VH6E22NPK2QQL5DMQYVQFBX6XY2OBK6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed 11 Sep 2024 at 12:51, Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 11 Sep 2024 12:33:01 +0200,
> P=C3=A9ter Ujfalusi wrote:
>>=20
>> On 11/09/2024 12:21, Takashi Iwai wrote:
>> >> Wondering if this is backwards compatible with the alsa-lib definitio=
ns,
>> >> specifically the topology parts which did unfortunately have a list of
>> >> rates that will map to a different index now:
>> >>
>> >>
>> >> typedef enum _snd_pcm_rates {
>> >> 	SND_PCM_RATE_UNKNOWN =3D -1,
>> >> 	SND_PCM_RATE_5512 =3D 0,
>> >> 	SND_PCM_RATE_8000,
>> >> 	SND_PCM_RATE_11025,
>> >> 	SND_PCM_RATE_16000,
>> >> 	SND_PCM_RATE_22050,
>> >> 	SND_PCM_RATE_32000,
>> >> 	SND_PCM_RATE_44100,
>> >> 	SND_PCM_RATE_48000,
>> >> 	SND_PCM_RATE_64000,
>> >> 	SND_PCM_RATE_88200,
>> >> 	SND_PCM_RATE_96000,
>> >> 	SND_PCM_RATE_176400,
>> >> 	SND_PCM_RATE_192000,
>> >> 	SND_PCM_RATE_CONTINUOUS =3D 30,
>> >> 	SND_PCM_RATE_KNOT =3D 31,
>> >> 	SND_PCM_RATE_LAST =3D SND_PCM_RATE_KNOT,
>> >> } snd_pcm_rates_t;
>> >=20
>> > As far as I understand correctly, those rate bits used for topology
>> > are independent from the bits used for PCM core, although it used to
>> > be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
>> > it's clearer only for topology stuff.
>>=20
>> Even if we rename these in alsa-lib we will need translation from
>> SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?
>>=20
>> The topology files are out there and this is an ABI...
>>=20
>> > But it'd be better if anyone can double-check.
>>=20
>> Since the kernel just copies the rates bitfield, any rate above 11025
>> will be misaligned and result broken setup.
>
> Yep, I noticed it now, too.
>
> Below is the fix patch, totally untested.
> It'd be appreciated if anyone can test it quickly.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: pcm: Fix breakage of PCM rates used for topology
>
> It turned out that the topology ABI takes the standard PCM rate bits
> as is, and it means that the recent change of the PCM rate bits would
> lead to the inconsistent rate values used for topology.
>
> This patch reverts the original PCM rate bit definitions while adding
> the new rates to the extended bits instead.  This needed the change of
> snd_pcm_known_rates, too.  And this also required to fix the handling
> in snd_pcm_hw_limit_rates() that blindly assumed that the list is
> sorted while it became unsorted now.
>
> Fixes: 090624b7dc83 ("ALSA: pcm: add more sample rate definitions")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/sound/pcm.h     | 35 ++++++++++++++++++-----------------
>  sound/core/pcm_misc.c   | 18 ++++++++++--------
>  sound/core/pcm_native.c | 10 +++++++---
>  3 files changed, 35 insertions(+), 28 deletions(-)
>
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index c993350975a9..824216799070 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -109,23 +109,24 @@ struct snd_pcm_ops {
>  #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
>  #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
>  #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
> -#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
> -#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
> -#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
> -#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
> -#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
> -#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
> -#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
> -#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
> -#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
> -#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
> -#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
> -#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
> -#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
> -#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
> -#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
> -#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
> -#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
> +#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
> +#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
> +#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
> +#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
> +#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
> +#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
> +#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
> +#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
> +#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
> +#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
> +#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
> +#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
> +#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
> +#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
> +/* extended rates */
> +#define SNDRV_PCM_RATE_12000		(1U<<17)	/* 12000Hz */
> +#define SNDRV_PCM_RATE_24000		(1U<<18)	/* 24000Hz */
> +#define SNDRV_PCM_RATE_128000		(1U<<19)	/* 128000Hz */
>=20=20
>  #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
>  #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous ra=
tes */
> diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
> index 5588b6a1ee8b..4f556211bb56 100644
> --- a/sound/core/pcm_misc.c
> +++ b/sound/core/pcm_misc.c
> @@ -494,18 +494,20 @@ EXPORT_SYMBOL(snd_pcm_format_set_silence);
>  int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw)
>  {
>  	int i;
> +	unsigned int rmin, rmax;
> +
> +	rmin =3D UINT_MAX;
> +	rmax =3D 0;
>  	for (i =3D 0; i < (int)snd_pcm_known_rates.count; i++) {
>  		if (hw->rates & (1 << i)) {
> -			hw->rate_min =3D snd_pcm_known_rates.list[i];
> -			break;
> -		}
> -	}
> -	for (i =3D (int)snd_pcm_known_rates.count - 1; i >=3D 0; i--) {
> -		if (hw->rates & (1 << i)) {
> -			hw->rate_max =3D snd_pcm_known_rates.list[i];
> -			break;
> +			rmin =3D min(rmin, snd_pcm_known_rates.list[i]);
> +			rmax =3D max(rmax, snd_pcm_known_rates.list[i]);
>  		}
>  	}
> +	if (rmin > rmax)
> +		return -EINVAL;
> +	hw->rate_min =3D rmin;
> +	hw->rate_max =3D rmax;
>  	return 0;
>  }
>  EXPORT_SYMBOL(snd_pcm_hw_limit_rates);
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 7461a727615c..5e1e6006707b 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2418,13 +2418,17 @@ static int snd_pcm_hw_rule_sample_bits(struct snd=
_pcm_hw_params *params,
>  	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
>  }
>=20=20
> -#if SNDRV_PCM_RATE_5512 !=3D 1 << 0 || SNDRV_PCM_RATE_768000 !=3D 1 << 19
> +#if SNDRV_PCM_RATE_5512 !=3D 1 << 0 || SNDRV_PCM_RATE_192000 !=3D 1 << 1=
2 ||\
> +	SNDRV_PCM_RATE_128000 !=3D 1 << 19
>  #error "Change this table"
>  #endif
>=20=20
> +/* NOTE: the list is unsorted! */
>  static const unsigned int rates[] =3D {
> -	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 640=
00,
> -	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
> +	5512, 8000, 11025, 16000, 22050, 32000, 44100,
> +	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768=
000,
> +	/* extended */
> +	12000, 24000, 128000
>  };
>=20=20
>  const struct snd_pcm_hw_constraint_list snd_pcm_known_rates =3D {

I've quickly tested this version with a few rates (48, 128, 768k),
amlogic device.

Looks Ok.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

Can't say for topology.

--=20
Jerome
