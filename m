Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C472D8C0D69
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 11:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0293FDF9;
	Thu,  9 May 2024 11:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0293FDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715246391;
	bh=lcCQnxRMRJTW7GYII3BN87nmQecfBijYHLC7JbXBtcU=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qEMyR3hYFBK+AoM0rFpnfwyHTpjZJo1kcto0uofvk20yh08X651K1tz4ctr6o+x2n
	 qp1kuKKkzkNkPqdtH3w1CNe+YPxg6zuJcxBQ4gSmYx9FYAfhRoKDh5TWQWuxmN4tPE
	 NSHk/EzHF4CwkHV8pVeoHGLS4t7j98PmzTywF9+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C5D8F805A8; Thu,  9 May 2024 11:19:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6A8F80578;
	Thu,  9 May 2024 11:19:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53952F8049C; Thu,  9 May 2024 11:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31B46F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 11:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B46F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fZGjBzT5
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34d99ec52e1so504181f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715246339;
 x=1715851139; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=bLpM7TJDjRcXRO0i4lYjo6OZAM3sE3CuEsmwQ0zb4mw=;
        b=fZGjBzT5XPLxSl9hGK6/zn+v0Yrpcj76Y9N4hBrRn3oOt8AOiTXnU8EbVa7k3ResH3
         QbQGwzBo3O9svPJDBjQEYZtRuD/bQiFeaq6Tk0itElN5V8jZZjarl/S3LfkzKJhaCsw6
         VWozQKVE/r9fE0gX4N5SwUbHBpAdDwLVWcuzNCF2xHEA2s8c3yAuxvARUHLXlya/GWRM
         I1RiQ95KH811um+aS8HtkKooFbl6xEUPIk+9G9KXkEoR3XstrdYEZ4Sl4pdGU6sroESL
         Z6gHgntUM/VInrNolXCBJigzO5Ouk7HmQ17x4wQG1yMu+DyQnm1kO+KEtBuOLy2jEeOL
         LKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715246339; x=1715851139;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLpM7TJDjRcXRO0i4lYjo6OZAM3sE3CuEsmwQ0zb4mw=;
        b=vQpMVK8eOYIfltAO3A4vsQCY4VbUL5Jj4z4q14M8086E62Zx+HU4lWrd1u5EUdkPBE
         Y6YU09Vz9oYTVf7HynWZQM5Pz0kYl9TecdAepfH8e1QRHkluMo7tD13eOEFnKf1711M+
         Ms6IIAq4LMDKCENLOPmKLfoaLwRangEY6SzhVy8Sfrq0+dYRG30Bqym4Z7VsagvWljsc
         OwoRVyq+DteAitjGizFaOEYKXmt1HioiOVaacQyXaMCeEgwDjEINDB9ijUhTd73EibkZ
         BmHUAz1/7SB7q18w3/OGLLX5cCZpMC5KlaFsz9/FzhR+MP+8iBItAZC4FM/HpkZWdKsv
         NGSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+tMtHPuGkYx6B5QvZfXr7HNcEtqjHfPl7HjqxMOfsZ4MuPrODn0AtYUqXGIFq1jF28Z8Oy6gRtL6icRoO0nKpetYclpxxXXIvCCs=
X-Gm-Message-State: AOJu0Yybw9tkPrjLCibO1ZeeCyMYT/rsxIpH3K72PfaS/03jICb6RwMs
	2lPIz6vJFN84T6xv2t8lW5G2cM6VthvbMjAgaheBmaLFsZ6Da80Pqs760Vky/bw=
X-Google-Smtp-Source: 
 AGHT+IFsB5wyyg9+udb49eD6La4FDSf5anjooXUEPEJOhb5hbaV1MWw6t5Anw3NkxndfSAwplOMP8A==
X-Received: by 2002:adf:ca90:0:b0:34d:ef22:70d9 with SMTP id
 ffacd0b85a97d-34fca23f9ecmr3576359f8f.15.1715246338692;
        Thu, 09 May 2024 02:18:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:87e6:73a1:526b:a411])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bd40sm1179386f8f.4.2024.05.09.02.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:18:58 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
 <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
 <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
 <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Amadeusz =?utf-8?B?U8WCYXdpxYRz?=
 =?utf-8?B?a2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
   Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jiawei Wang <me@jwang.link>, Jonathan  Corbet <corbet@lwn.net>, Kai
  Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>, Matthias
  Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
Date: Thu, 09 May 2024 10:51:59 +0200
In-reply-to: <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: CJHGLUTP6MPNYHSGBWZFXRKQQ7XGWAMB
X-Message-ID-Hash: CJHGLUTP6MPNYHSGBWZFXRKQQ7XGWAMB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJHGLUTP6MPNYHSGBWZFXRKQQ7XGWAMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu 09 May 2024 at 05:50, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> I need your help
>
>> > I have tested this series on an Amlogic device (vim3l)
>> > This brings warnings for cases which are perfectly fine.
>> > 
>> > For example, one of the DPCM backends is the TDM interface. This
>> > interface is capable of both playback and capture. It can be associated
>> > with any i2s/TDM codec.
>> > 
>> > The codec may do playback and capture too, but it
>> > may also do a single direction. Then usual example is the hdmi codec
>> > which does playback only.
>> > 
>> > In this case I get:
>> >  axg-sound-card sound: CPU capture is available but Codec capture is not (be.dai-link-6) Please update Codec driver
>> > 
>> > I don't think this is right.
>> 
>> Hmm..., I'm confusing
>> Does it mean you want to use "playback only" on it ?
>> If so, did you get below warning too ?
>> 	 "both playback/capture are available, but not using playback_only flag (%s)\n",
>>

I've checked. No such trace, no.

>> If not, can you please fill below ?
>> 
>> Card
>> 	dpcm_playback = (0 or 1)
>> 	dpcm_capture  = (0 or 1)
>> 	playback_only = (0 or 1)
>> 	capture_only  = (0 or 1)
>> BE.CPU
>> 	playback = (available, not available)
>> 	capture  = (available, not available)
>> BE.Codec
>> 	playback = (available, not available)
>> 	capture  = (available, not available)
>> Expect
>> 	playback = (available, not available)
>> 	capture  = (available, not available)

I'm not too sure I undestand this. I'll try to illustrate the case
raising the warning as precisely as possible bellow

>
> I need feedback from you, it is still not clear for me.

Sorry. There are some national holidays in France. I'm not spending much
time near the keyboard ATM

> But I noticed that we want to update below. I'm happy if it can solve your
> issue.
>
> -	if (has_playback && !has_playback_both)
> +	if (has_playback && !has_playback_both && !dai_link->capture_only)
> 		dev_warn(rtd->card->dev, ...)
>
> -	if (has_capture && !has_capture_both)
> +	if (has_capture && !has_capture_both && !dai_link->playback_only)
> 		dev_warn(rtd->card->dev, ...)
>

Honestly I'm a bit lost in all these flag :/

Some for BE error reported here is the full picture

     PCM
 =====|=====
      V
    --------
    |CPU FE| This CPU (FIFO) does Playback only. 
    --------
      |  Because of the CPU, link a playback only one
      V
    ----------
    |Codec FE| Using Dummy here
    ----------
      |
      V
    ~~~~~~~~~~
    |Routing |
    ~~~~~~~~~~
      ^
      |
      V
    --------
    |CPU BE|  This is the TDM interface. Capable of both Playback and
    --------  Capture. Through routing it can be connected to Playback
      ^       and/or Capture FE CPUs.
      |
      |
      V
    -------------
    |BE Codec(s)| Possibly N codecs, supporting both direction, or a
    ------------- Single one, or one direction each. In this particular case
      |           it is Playback only C2C.
      |
 ---- V ------------------ From Here, it is specific to HDMI -------------
    ~~~~~~~~~~~~~
    |C2C Routing| SoC has routing has mux between the different TDM
    ~~~~~~~~~~~~~ interfaces and the HDMI controller
      |
      |
      V
    ---------
    |C2C CPU|     This is a playback only CPU for HDMI
    ---------
      |
      V
    -----------
    |HDMI Codec|  The usual HDMI codec, playback only
    -----------

Better picture are available in the SoC doc.
There is publicly available datasheet here [1]

Audio paths are displayed in Section 9, page 807, Figure 9-1.
A TDM interface in this figure is combination of a TDMOUT and a TDMIN
(axg-tdm-formatter.c). The axg-tdm-interface.c joins them because they
use the same pads and clocks.

[1]: https://dl.khadas.com/products/vim3l/datasheet/s905d3_datasheet_0.2_wesion.pdf

>
>
> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
