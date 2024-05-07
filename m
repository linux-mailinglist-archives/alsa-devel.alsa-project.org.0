Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B18BDD87
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 10:55:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2EA7F4;
	Tue,  7 May 2024 10:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2EA7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715072100;
	bh=U8OQatDW4FjtbvC5rTx+PuIOqv56NEu7e4PvA5d1ACs=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RbQJ+Bh2C5nwwYVYolWUEuhrv6i24Nn09/3jpv5fH3jFte0pJD2tRzxoiIwxqnHO9
	 C4xEF/4sKofvAzYvtMez0RuwT4tovfPncd/6aD6P9MhaFlmJgRtfMgUUBlaGn7yGbV
	 pwGfBlpvkgruqtzpAwqW1X4Tw5RlLjx2XSYzr9SE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21264F80571; Tue,  7 May 2024 10:54:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1473EF80571;
	Tue,  7 May 2024 10:54:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 723DDF8049C; Tue,  7 May 2024 10:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD716F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 10:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD716F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ibOR8uo5
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-520f9d559f6so1372687e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715072000;
 x=1715676800; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=xCxOzDLdEh75jB6y9qUsYnk1sa4ucuKaEHLhrAj+2nA=;
        b=ibOR8uo5Y1cx/QB6ZSHAUHXR8uO6Ss7qF/dJaUec7r/2YIGmPMqj9yb/8WFzCRBNQW
         fZOqTPS7wXaCO6x2AfV4mISo8HWnFxlXENr454fXWsuK5K43gN/b+cLT65n1AvRB1tvZ
         nHrjAE7+hQxj9CXhsnDTOxkgRMVIatmiPZzI6/JkfAWFzo99HKSzgDW/qTltZGZTH8N7
         bljq9CZj0fsdBEwTdbUics/NtjW9vKUMB0hL2kbZ3AWolnfBaDImuNuyBsRWcyp9vuLb
         yFBiDkMsPRK2wkReny0Hx2Air6WtxaAC4npsTRHoCfrWLx/2H08HFACOgGOW7jWV0jDO
         V+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715072000; x=1715676800;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCxOzDLdEh75jB6y9qUsYnk1sa4ucuKaEHLhrAj+2nA=;
        b=GCMQ24ms/JoQDTiUUn6MTG2FUvVkgSgrKZpyE/xmfOf5wudMy3EuZ1MGSLQu1j9XGb
         XWLUpj7Qk/geINLkZZpyYnbVt80EsN4DqamZih+pe/6ZG/9mKAM75FcobYoFiV8uYSel
         DYIHb4+FTWv644pXFMzrWn+LWez3/c2QHHFLWTUPpaHy4MH8UaFAN5mOb+5wjNnWicnx
         WfH9dGsDEp7PjBDBVQvFuPO9/HY8QsyHIBVEuadGIuN+m6JXDK5hW+L8MAZniWz7ndw8
         bBSknc6wf5NFdcmEy9rIGNRLyfk5AQ06ceRaCdNyiQnyZuyiQ6W5sC1BtmB7n4tvzwb1
         +fCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXDNOyN092n0QltPw9qLLmWQ4UJPIAHfzRktTRoUgEZiLqdf/w+xRD2MKlVW2kngIpbeRgdPDijGITX4TWXJlXrvdvhsncuRYoj9U=
X-Gm-Message-State: AOJu0YzkuukhF+w980fF0+P/PtFC1n2hKvbRFz0CaO9zxy9DrSu4e15A
	Kv1XjB4PrVVnYrXQmq8hhcMnkRmBYK+3iYM0I2iUgj/4+U3ovyjroKHcJLhYOsk=
X-Google-Smtp-Source: 
 AGHT+IHowCcLFFaLyyT16y8DxcMAyDiK7IAn6wJm9zlWi1Dnoyl03rPbptGdEMLcTqFhlY4mJAuSmg==
X-Received: by 2002:ac2:58fb:0:b0:519:2d60:d71b with SMTP id
 v27-20020ac258fb000000b005192d60d71bmr7323830lfo.22.1715072000389;
        Tue, 07 May 2024 01:53:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:970:8464:9c54:e891])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b0041c542636bcsm22453098wmq.44.2024.05.07.01.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:53:19 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>,
 Jonathan  Corbet <corbet@lwn.net>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
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
Date: Tue, 07 May 2024 10:47:22 +0200
In-reply-to: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 3IIHPD5PSNJSZIPTVUM7UQ2XFYW5ORI5
X-Message-ID-Hash: 3IIHPD5PSNJSZIPTVUM7UQ2XFYW5ORI5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3IIHPD5PSNJSZIPTVUM7UQ2XFYW5ORI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 07 May 2024 at 04:32, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark, Pierre-Louis
> Cc each ASoC driver maintainer
>
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
>
> And because of its history, DPCM has been checking CPU side only. But it should
> check Codec side too same as non-DPCM. Some device/driver has been bypassed
> this check. It should be error. [2/3] patch indicates warning in such case.
>
> Because dpcm_xxx flag is no longer used by [1/3] patch, 
> snd_soc_dai_link_set_capabilities() is no longer needed. [3/3] patch remove it.
>
> These adds grace time for DPCM cleanup.
> I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be error,
> but maybe v6.11 or v6.12 ?
> Please check each driver by that time.

Hi Kuninori-san,

I have tested this series on an Amlogic device (vim3l)
This brings warnings for cases which are perfectly fine.

For example, one of the DPCM backends is the TDM interface. This
interface is capable of both playback and capture. It can be associated
with any i2s/TDM codec.

The codec may do playback and capture too, but it
may also do a single direction. Then usual example is the hdmi codec
which does playback only.

In this case I get:
 axg-sound-card sound: CPU capture is available but Codec capture is not (be.dai-link-6) Please update Codec driver

I don't think this is right.

>
> [1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
>
> Kuninori Morimoto (3):
>   ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
>   ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
>   ASoC: remove snd_soc_dai_link_set_capabilities()
>
>  include/sound/soc-dai.h               |  1 -
>  include/sound/soc.h                   |  1 +
>  sound/soc/fsl/imx-card.c              |  3 -
>  sound/soc/generic/audio-graph-card.c  |  2 -
>  sound/soc/generic/audio-graph-card2.c |  2 -
>  sound/soc/generic/simple-card.c       |  2 -
>  sound/soc/meson/axg-card.c            |  1 -
>  sound/soc/meson/gx-card.c             |  1 -
>  sound/soc/qcom/common.c               |  1 -
>  sound/soc/soc-dai.c                   | 38 -----------
>  sound/soc/soc-pcm.c                   | 96 ++++++++++++++++++---------
>  11 files changed, 67 insertions(+), 81 deletions(-)


-- 
Jerome
