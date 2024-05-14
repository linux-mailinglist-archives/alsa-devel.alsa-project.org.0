Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F5E8C580D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 16:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28606208;
	Tue, 14 May 2024 16:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28606208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715697272;
	bh=+IxW0MEtemQ59ohxen6OsJDtFiyIBSyf4pXlzCYNPeg=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=czJQsN4jGx05EHt4QDzeCvHu5n2tEMUm9a97nZA4c9MJwJuvOCLVBB9NW/xIet5QG
	 V+DeaxxFS4fyWRyiPbp25MCYJrvwB4408Q+4Chq/GMRbmZrVSP7ECPvBJo7g7JsIsV
	 2yKY8BCoP1DuMu5Ly1yCqXyNBD064mM05DLGKAYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0757DF8057C; Tue, 14 May 2024 16:34:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68427F80571;
	Tue, 14 May 2024 16:34:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4577F80224; Tue, 14 May 2024 16:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 673EAF800F5
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 16:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673EAF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2mYfjviG
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so48040291fa.1
        for <alsa-devel@alsa-project.org>;
 Tue, 14 May 2024 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715697230;
 x=1716302030; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2HpNVPq3YKqLVtMUiQ9jyLRuvtM9nOeWOTnThXBUYyw=;
        b=2mYfjviG43/YeVCQ8iNCfn+Odu8jSMyg5yf8qU3LQXUgKNiwNd3Vjg27pOPvJAG/B8
         VmwzC+86LMFpta2L2CFIeEoyQQF1o8RbpzbjT21UM1HyFlk2mX6jb5HuUydPAf6USP9W
         OtDUOmeA4M0ZmT0ZqhaBWr8qeWccivEDBT5ksQmpO8mxuDbei+BGSh8RJnKzY1fE+kHE
         kxGvSND9l/uqzKk8xxtuDb5vzDe3kNW6CQL+laMCz8WHLVyLQskA8VnTWP6FY9qzePkz
         8JizKPrde8C5/plUe+fNZPs+2ontEihQDl3fsvo51armUmam0h+Daq2crk2U9tkOS4+k
         sjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697230; x=1716302030;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HpNVPq3YKqLVtMUiQ9jyLRuvtM9nOeWOTnThXBUYyw=;
        b=ZqC0CpfJarp7pKUnz3R7NXq6a63qiXTY5qgf96MTRMzhugePFPn+9dz1BQ36RpLijO
         T1g0GBmnlAyaBg4n/hIJj8wFebdj6nSHup48qyjh1VzNGJJ25ef7xVXgNWthRe7dJ3e5
         838l3JuZ+KVlcQeOyRN0IVfzhDL+CvnIyQVkrJtlVvt/sA93BwJ0I4LWo40ilDspPNQ5
         8FYJ0ZxRBqJRT57TtKREJYewqqpmjk/dP7Pm3GcJ27p5BFmxTp1OGUYh5KbwQ7NvSCRi
         tU3Fbn84EnefMyCSWJZn7gxHvaS/IWrWjGNTtv11yB6AZzRNPCIOPaKAwi6EPoUvP2KB
         vcbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmbPjhCXfyXo7hxZdkkS0LMY2+DOr0bm9mm3ayQH22RaGy2uHTCW8vAINV20W/PXV8rKTUqXN0Fb50/bNsRuQHLgsHC/SFRsjFomc=
X-Gm-Message-State: AOJu0YyUMw0BtHMsX8xLmlIEyBhFIpprNaXOwwziXi5QtIG5NOd/Q4gQ
	aMonHN41oP5n92c4J/mk2bbeBfwfmnMZcJplVKGE9idUClWdqXh2xswbqtLaAUw=
X-Google-Smtp-Source: 
 AGHT+IFD4/QQf7DSCFn7BpKaHqZVvWjrhBM0s1pr0jlg9Ch9ima5C7dw+J80WKNKg5qjzUacSgKW4Q==
X-Received: by 2002:a2e:a175:0:b0:2e3:3b4e:43e4 with SMTP id
 38308e7fff4ca-2e5204b2ed4mr86104081fa.32.1715697229984;
        Tue, 14 May 2024 07:33:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3f47:f219:de13:38a7])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a76e6sm13856362f8f.62.2024.05.14.07.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:33:49 -0700 (PDT)
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 0/3] ASoC: grace time for DPCM cleanup
Date: Tue, 14 May 2024 16:31:55 +0200
In-reply-to: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jttj0xy2b.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: RUDBNDN4UMYTG5F2NDCIS6RJTOUUVGEQ
X-Message-ID-Hash: RUDBNDN4UMYTG5F2NDCIS6RJTOUUVGEQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUDBNDN4UMYTG5F2NDCIS6RJTOUUVGEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 13 May 2024 at 00:31, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark, Pierre-Louis, Jerome
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
>
> [1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
>
> Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
>
> v1 -> v2
> 	- tidyup Codec check warning output condition
>
> Kuninori Morimoto (3):
>   ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
>   ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
>   ASoC: remove snd_soc_dai_link_set_capabilities()

For Amlogic, with the change sent as RFC on this series.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
>  include/sound/soc-dai.h               |   1 -
>  include/sound/soc.h                   |   1 +
>  sound/soc/fsl/imx-card.c              |   3 -
>  sound/soc/generic/audio-graph-card.c  |   2 -
>  sound/soc/generic/audio-graph-card2.c |   2 -
>  sound/soc/generic/simple-card.c       |   2 -
>  sound/soc/meson/axg-card.c            |   1 -
>  sound/soc/meson/gx-card.c             |   1 -
>  sound/soc/qcom/common.c               |   1 -
>  sound/soc/soc-dai.c                   |  38 ---------
>  sound/soc/soc-pcm.c                   | 110 +++++++++++++++++++-------
>  11 files changed, 81 insertions(+), 81 deletions(-)


-- 
Jerome
