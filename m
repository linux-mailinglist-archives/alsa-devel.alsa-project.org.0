Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B188C69A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:16:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF26299C;
	Tue, 26 Mar 2024 16:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF26299C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466189;
	bh=3gXKT6njw2omMEaAzNf2JprBTRNJLMuF9mO6Lmjgq/s=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h8e3lnNYtApK5cZUtDYbcF/nQyDt0F24sMGiZtXkQB00veydZfsKfaMgD1PaMOVO5
	 xnV/ujjrNjb6zF/TfyAtiDMoexcPcDHxTjyb3gYL7FkNBzoXBuL5l+KtB8veI3JWNY
	 BVAEm9BfcFSEJ/sDDwnn6SRdIFwpSQ26R11PVeUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C63ACF8057D; Tue, 26 Mar 2024 16:16:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 912DDF805A9;
	Tue, 26 Mar 2024 16:16:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA9E7F8057E; Tue, 26 Mar 2024 16:16:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23676F8057A
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23676F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=aYOsB3mn
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33ed5b6bf59so4038233f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Mar 2024 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711466026;
 x=1712070826; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K91MeUI92QSNqtrLE2UhY+c3/vxq+M1n6BAajR3fU8=;
        b=aYOsB3mnypMR1To7EF/a00q7a3UFJRdb1pURtsJrUrdoPtltPdeawGWOjBfGJr7tc+
         5BtGhHZ0WBm9/X+mniS6LBCjP+5he7zNSVk2eHtf16SLPPgVhXHdKwEg/zn0oHSqcUUz
         VGjLJEf60hSHKAYroBE/16wmMchb7fiM+catJC6psl+c+hF+rHci+zF2DyWY7onmsLKM
         gu9GAl4u/oGlFm3szicaD2xOjLIakFNEM9krlVC3relUFsnHP4IBiJFZMeV4ApmBDlRN
         TivoppGuVMzCrelECAAgiCrGMEDVfyCw4Z7OqZ5z8703QbH3RI6pPiX1uDIPa4/DkAai
         I3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466026; x=1712070826;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8K91MeUI92QSNqtrLE2UhY+c3/vxq+M1n6BAajR3fU8=;
        b=h1Y3EqzlFlAhTXH+oTxItNkhpwjay+J5FskA+YEfHBabd0QqXmGVnYBmqCs/euyc+T
         K0baaMSZOVgPXCA7jf3n2hPehrfsQDdzrtT9iLqDUGNKpaHUvsMB9jekJ5FRRyLTF+tx
         bobE3NAB41jqjp+P8rE6D59vMkaVAGCO/2sh0jTk0eaKLdw5iHcnTc7XCAcMXtCNRZ0i
         kVHiTYlP8mcm+7+BW6isXg27c9bvXyJycOvYz0oxvsJtqfc+eiX3Zq1QZt6uzsa5C3V3
         ee0OFjrHe5nnCAemGwCXd9xEf2G9QI37NlHwTR8g0JoGkYVvXE2WcNGsnh5FAO4rcwxK
         oQFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJpaiPgNiibklEPXZCMv+HDcGM6rCzTQnlyHoAdIS6hS1ZG2tuRBRtq1LUEt/NrhbGk4B+Jujx6hBvvLeESWlasvpj48dEAMiN2eQ=
X-Gm-Message-State: AOJu0Yz8J0SeSuqCpn9WroSxgNhVAfbCW/GgFB1/NuTvtTIQs0QHneDK
	7H1LIx8NFQACCGSRzWNEQ5YkUBZHsAlnwD5rrw+FxQF/ckdhyB21G4iTRYMbPXs=
X-Google-Smtp-Source: 
 AGHT+IG7juK6Fs9BqzuZzCmGJd8YvjlgEl/Mjp8jyHt2HJpd+O8407YSUES9NqM6v17Ag53YwrSUMg==
X-Received: by 2002:a5d:6d09:0:b0:33e:bdea:629e with SMTP id
 e9-20020a5d6d09000000b0033ebdea629emr1525056wrq.37.1711466025887;
        Tue, 26 Mar 2024 08:13:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:97a2:bb9f:463a:6468])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a056000174a00b0033ec9ddc638sm12480834wrf.31.2024.03.26.08.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:13:45 -0700 (PDT)
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi
 Yasak <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
  Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam  Girdwood <lgirdwood@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 15/15] ASoC: soc-pcm: indicate warning if DPCM BE Codec
 has no settings
Date: Tue, 26 Mar 2024 15:58:06 +0100
In-reply-to: <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RPLMSCYRVUUTALQGDYZUZF5WDHXRMSBM
X-Message-ID-Hash: RPLMSCYRVUUTALQGDYZUZF5WDHXRMSBM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPLMSCYRVUUTALQGDYZUZF5WDHXRMSBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 25 Mar 2024 at 04:37, Kuninori Morimoto <kuninori.morimoto.gx@renesa=
s.com> wrote:

> Historically, ASoC doesn't have validation check for DPCM BE Codec,
> but it should have. Current ASoC is ignoring it same as before,
> but let's indicate the warning about that.
>
> This warning and code should be removed and cleanuped if DPCM BE Codec
> has necessary settings.

Hello Kuninori-san,

I'm not quite sure what you mean by "should have validation" and what
setting exactly we should validate ?

I know I should be able to able to understand that
from the code below but, somehow I have trouble deciphering it.

Could you explain it a bit more ?

I wonder if this going to trip over the same corner case as last time:

Where you have a CPU supporting both direction and 2 codecs, each
supporting 1 stream direction ? This is a valid i2s configuration.

Maybe I'm not understanding the patchset correctly.

> One of the big user which doesn't have it is Intel.
>
> 	--- sound/soc/codecs/hda.c ---
>
> 	static struct snd_soc_dai_driver card_binder_dai =3D {
> 		.id =3D -1,
> 		.name =3D "codec-probing-DAI",
> +		.capture.channels_min =3D 1,
> +		.playback.channels_min =3D 1,
> 	};
>
> 	--- sound/pci/hda/patch_hdmi.c ---
>
> 	static int generic_hdmi_build_pcms(...)
> 	{
> 		...
> 		for (...) {
> 			...
> +			pstr->channels_min =3D 1;
> 		}
>
> 		return 0;
> 	}
>
> Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linu=
x.intel.com
> Cc: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index ac42c089815b..9a54d5d49b65 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2796,7 +2796,6 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
>  	struct snd_soc_dai_link_ch_map *ch_maps;
>  	struct snd_soc_dai *cpu_dai;
>  	struct snd_soc_dai *codec_dai;
> -	struct snd_soc_dai *dummy_dai =3D snd_soc_find_dai(&snd_soc_dummy_dlc);
>  	int cpu_playback;
>  	int cpu_capture;
>  	int has_playback =3D 0;
> @@ -2817,24 +2816,37 @@ static int soc_get_playback_capture(struct snd_so=
c_pcm_runtime *rtd,
>  	 *	soc.h :: [dai_link->ch_maps Image sample]
>  	 */
>  	for_each_rtd_ch_maps(rtd, i, ch_maps) {
> -		cpu_dai	  =3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> -		codec_dai =3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +		int cpu_play_t, cpu_capture_t;
> +		int codec_play_t, codec_capture_t;
> +
> +		cpu_dai		=3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> +		codec_dai	=3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +
> +		cpu_play_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_playback);
> +		codec_play_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_=
PLAYBACK);
> +
> +		cpu_capture_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_capture);
> +		codec_capture_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STRE=
AM_CAPTURE);
>=20=20
>  		/*
> -		 * FIXME
> +		 * FIXME / CLEAN-UP-ME
>  		 *
>  		 * DPCM BE Codec has been no checked before.
>  		 * It should be checked, but it breaks compatibility.
>  		 * It ignores BE Codec here, so far.
>  		 */
> -		if (dai_link->no_pcm)
> -			codec_dai =3D dummy_dai;
> +		if ((dai_link->no_pcm) &&
> +		    ((cpu_play_t	&& !codec_play_t) ||
> +		     (cpu_capture_t	&& !codec_capture_t))) {
> +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
> +				      codec_dai->name);

Taking one codec at a time, would you trigger a warning for the use case I
described above ?

> +			codec_play_t	=3D 1;
> +			codec_capture_t	=3D 1;
> +		}
>=20=20
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +		if (cpu_play_t && codec_play_t)
>  			has_playback =3D 1;
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +		if (cpu_capture_t && codec_capture_t)
>  			has_capture =3D 1;
>  	}


--=20
Jerome
