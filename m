Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1BC8998FF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A95652CF7;
	Fri,  5 Apr 2024 11:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A95652CF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308076;
	bh=wgbkCTuBbl1v4iGyL5raRIfbmwPPU/O4ePJXdJnc/o8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QvfcEPeSDDrlmfsJixJzC/nQNQMJL/JSNVNX+p79rdmB2eA96Iy+XaVi+9IWgJqCz
	 gkvdE0DRqO1sqYT+rVKONcipTaOD5iRxcf0n79Jfb3HigQ9cZVJJUKzXwuG4NJB6bu
	 ZIg1IyJwpHgNZBq6O4Lrx3Sy+NB2h3jylXiFGE2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7116F80589; Fri,  5 Apr 2024 11:07:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AAEFF8059F;
	Fri,  5 Apr 2024 11:07:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DCFEF8020D; Fri,  5 Apr 2024 11:07:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA57DF80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA57DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jPNFZ/J3
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516d536f6f2so368830e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712308027;
 x=1712912827; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=dx7Q6iClG4dKjPFFAd0xEXzHEYFgFMGOrT79d2/WULs=;
        b=jPNFZ/J3XCy6s0HPO0yy4Ed1GMsTpBdSqTTnPhAMngJcy1uvVsCgIbuSsRc0a3zyUq
         Xw59b87FSNpo8k9IeWGVcShwbEa5tHpINaYV0EyQ4H1GftP6yF1rNWvUwLoXpqdhKgN7
         whx3ZRsukOAQqaMjifzqBRPB5hqfx9glG6VxU9Qfl78SFgWH157sfLPYwED5SMS7pNKu
         W16gVoGUEi4umDN6j4YKEU0C2axyzb/KBEQSRO9/Hs+pXZoXefy1sLeNqi8EjtaXxcIz
         clZ2TRhGUiOL44tJHscn46DNLdKSsN56P3lUve2S4nfGvpP8C1H213C21TRPPqTGF9pF
         ohZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712308027; x=1712912827;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx7Q6iClG4dKjPFFAd0xEXzHEYFgFMGOrT79d2/WULs=;
        b=boX5vyjypUhXC/DvXKd2jfumaC1Jx7SNqHH0bXjBSLkWcQlol0vWl+v8xL9onSuBZ6
         J0Y8zzUAlicmUr83JVPjHUkv6HROZix9wz2xkvXunnuELN/3lu0qxGb7o/Y/EGtVGmqt
         tg92AGQIAoPeVoESunfFyWz/N3hsBXiJUF7ZAEz3pXLIjDK74+pdFVwLGdQdEVCPkgVe
         jJM1cBjq5MHUZeMCxO7+xU2iRnre0wW0dZRJ2pYkQL6OTay/4ZGpAX43t0WC7NiB/n0n
         XZNf0+9IBamB2p5uEzYNo/g8SX8AS9MCeDWYDtjM0Yxl3LiDL+24fIH7dCpXuPLeAszr
         plfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqOpcDosT0C1jpq/NZ/5ibfFk53yRVXtd+s1XrYAmLJerEww+Z0gx3qaucM2u259pK2j/rESyQRAQ/xNr6x1OFM+VnNuwCFCqUuRA=
X-Gm-Message-State: AOJu0YzyXy3hind4xGEN+e+obupcLWYNEsrzigtxNPySdrKoiXWEfOTk
	Q2JF6XnuokdXPbBAF+TRtaXEJbJ9CAbvQWpIANbbU+jUFVY24jfAc6zQFSO0UhM=
X-Google-Smtp-Source: 
 AGHT+IFzNpI2nNYaTUkEnZn7gYRwkIeFIyuTNluFylKpIC0pmqbq+2qkk9YMdM/xrAATLZryy+1B1A==
X-Received: by 2002:a2e:8084:0:b0:2d6:ec7b:b69b with SMTP id
 i4-20020a2e8084000000b002d6ec7bb69bmr693984ljg.7.1712308027074;
        Fri, 05 Apr 2024 02:07:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd7a:d766:e9e8:454c])
        by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b00414887d9329sm2122868wmb.46.2024.04.05.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 02:07:06 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
 <877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, Takashi
 Iwai <tiwai@suse.com>, Sylwester  Nawrocki <s.nawrocki@samsung.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Linus Walleij
 <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Kevin
  Hilman <khilman@baylibre.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Jaroslav  Kysela <perex@perex.cz>, Hans de
 Goede <hdegoede@redhat.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Brent  Lu <brent.lu@intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Banajit Goswami <bgoswami@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 00/16] ASoC: Replace dpcm_playback/capture to
 playback/capture_only
Date: Fri, 05 Apr 2024 10:59:20 +0200
In-reply-to: <877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j5xwwp491.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: PG6EH6BX3EQHZKCKYU5STE7L2POK7PQE
X-Message-ID-Hash: PG6EH6BX3EQHZKCKYU5STE7L2POK7PQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PG6EH6BX3EQHZKCKYU5STE7L2POK7PQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu 04 Apr 2024 at 23:13, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback
>
>> playback_only and capture_only have implication on each other. If one is
>> set, the other can/must not be set. This leads to conditions which can
>> be fairly hard to read and possibly bugs.
> (snip)
>> Wouldn't it be better to replace those 2 flags with a single bitfield ?
>> 
>> something like:
>> 
>> unsigned int directions;
>> #define PLAYBACK_VALID	BIT(0)
>> #define CAPTURE_VALID BIT(1)
>
> I think Amadeusz indicated similar idea, and basically I can agree about
> it.

I've seen it afterward. It is similar indeed but I don't think 'None' or
'Both' should have a dedicated bit. That would be yet another
redundance/implication between flags/bits ... so another source of
bugs/complexity IMO.

> But in this patch-set, I want focus to removing dpcm_xxx flag as 1st
> step. So I'm happy to create such patch-set, but I want to handle it as
> another patch-set.

Fine by me ... at least for the Amlogic part.

>
> Thank you for your help !!
>

Thanks for your work !

> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
