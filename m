Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D208C4E5A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 11:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6E9CF94;
	Tue, 14 May 2024 11:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6E9CF94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715677631;
	bh=JveulSWtJk0/yBRY2YIfL8dzWQxVPxJpo1BEZ+B42+4=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rtlSx5RG2U++0Y3xIuo4xhDFVDMavATyoGAQmlCa5BkOT3/iBGCp5Tc0urwycEeBD
	 G+/kBdBhX8d9hS0OkSpHsTa9MgbltyFR6nyH1F0MF6wEMAJmDzUXmMGYnwYectUDlQ
	 NtA4h6u6cyrn/Ff9ZA9XEFkXap++F/REQ7+D8MV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29132F805A1; Tue, 14 May 2024 11:06:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 133BCF8059F;
	Tue, 14 May 2024 11:06:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD04EF80224; Tue, 14 May 2024 11:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4FF6F800F5
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 11:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FF6F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OJ/1L2gY
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-420116a6652so18636245e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 14 May 2024 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715677581;
 x=1716282381; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=oR0ReylhKEqKzH5kHG2G6k5ALzu913m0pq1siK/oT9c=;
        b=OJ/1L2gY0gtkOb9e2mtNogHnZazqCtgwq2G9N7NGiLJpmQSGWXx9JK4LXbdPmBhlqT
         RKlF080xHOztcChSgvxH1VBO78C3nKslVDCyIOTxPDgEKbXtP8r9+aUgkUNaaYQ+KWgs
         MOj244TSoXGiRGYJJ1PljXda19NRbO+6viw7Hh5rpL5hiHvlnJf07kknZWQgSnm0wU6j
         6/F7yjcS6m6mIuyFcB5PBhd0uqZ/4mMvIJUr0M7BJSRz4+ck4HugdAMNW6hFKX9FHSOZ
         wjsgirHeDrIA7enuBg7BNcgEmLsdt8vHgEgYuJIlQ6Q2qzP/S2FCfO1/40jWKPqKFRKq
         WybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715677581; x=1716282381;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR0ReylhKEqKzH5kHG2G6k5ALzu913m0pq1siK/oT9c=;
        b=ZpaqofkfEn2ZZNVcJej3IYLZ64OhG5A2YGleGhgx8e2jgOvzZel5sqd7gY4sKce9W9
         9CIWZg/GF1x0fblRMiDLGmARdpvLSLDCuPZ9m4Jk3wTnMRGYMckEPnsjnD5TurS4xTL7
         CAO017ey0sSUVPRD9iRbf4h0ulqhQlWipLOpOe2Jxg3w7HatQ+n287u8+dyrEB51QuZZ
         ydLNRm6fON0qCd7u4/E5/whqmZvvs1FzzOVJwbZJ2cgWDO+2DG3QA/WRW+7+W77OmLx5
         geIAmc9kKqqARSrvOH+CQS9DeCLwfePqQ3j0EglGr22YmkvFoEr1GEToRrUEbqc4PcrA
         h5QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnoevJT0qdViOgjaJSYxTFzX7i9+FQuJIkQh72CajOkQX0EjvL+CNbvzFvR7dBavT3cQoRjMgcxp/9iwoeh4vn9ZI7YCvygq5H/B8=
X-Gm-Message-State: AOJu0YzYjzouY/YLLSJe0LE9q2GnXjKepsm9NfeSxjBvDjTavNwsdk1c
	0d/NUKDW/5/Rngud+ZTAXuIZELY2ZJbnzvLkslXrZXApVYfOoJRjYpcMBeUZBE4=
X-Google-Smtp-Source: 
 AGHT+IHW4C09dzKGpNnXI4nTfM4zJ0z+4B+aD9rH4pjOFB4gyI2EBMozVqvi/q5TDnnmVbzVUKgD6w==
X-Received: by 2002:a05:600c:438a:b0:41b:cc7d:1207 with SMTP id
 5b1f17b1804b1-41feaa4335cmr87706765e9.19.1715677581563;
        Tue, 14 May 2024 02:06:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3f47:f219:de13:38a7])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce24efsm186103125e9.19.2024.05.14.02.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 02:06:20 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
 <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
 <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
 <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
 <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
 <878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
 <1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
 <87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
 <1jseymyxa6.fsf@starbuckisacylon.baylibre.com>
 <87h6f1jn25.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Tue, 14 May 2024 11:04:40 +0200
In-reply-to: <87h6f1jn25.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j7cfwzrsj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: KLCI2JF2MT43AVIJF7QJ7AYS2HP3TEQ3
X-Message-ID-Hash: KLCI2JF2MT43AVIJF7QJ7AYS2HP3TEQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLCI2JF2MT43AVIJF7QJ7AYS2HP3TEQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 13 May 2024 at 23:42, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your reply
>
>> However, I'm a bit confused. If it is handled automatically by the CPUs
>> and Codecs settings, does it mean dpcm_playback/capture flags are
>> no-ops from now on ?
>
> Yes.
> dpcm_playback/capture flag itself will be exist for a while, but it will be
> removed soon (v6.11 ? v6.12 ? not yet fixed).
>
> Some driver might is using dpcm_xxx flag as limitation of direction. For
> example HW can use both playback/capture, but driver want to use playback
> only, in this case, driver might have dpcm_playback flag only.
>
> In this case, driver authoer need to update to use playback_only flag
> instead. [1/3] patch will indicate warning about it, for a while.
>
>
>> Should I update my card drivers to ditch those flags completely ?
>
> If the driver is using dpcm_xxx flag as limitation of direction,
> driver author need to update to use xxx_only flag.
> If the driver have no such flag miss, I will remove all dpcm_xxx flags
> when end of its support.
> Of course we can avoid extra problem if each driver author remove/update
> it by themself, instead of me ;P

Makes sense. I'll check your v2 and prepare the update of the related
card driver

>
>> May I still disable a direction on a link from the card driver, like in
>> the case I described above, when a TDM link has no slots for a direction ?
>
> For example, in case of CPU can handle both playback/capture, and Codec
> handles playback only, it will be playback only automatically, no Card
> settings is needed.
>
> If both CPU/Codec can handle playback/capture, but you want to enable
> playback only, you can use playback_only flag.
>
> Is it help you ?
>

Path forward is clear. Thanks a lot.

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
