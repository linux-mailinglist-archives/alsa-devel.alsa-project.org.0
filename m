Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088A8C3C48
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 09:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1E02B76;
	Mon, 13 May 2024 09:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1E02B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715586406;
	bh=bqeLw0EURFczvr0ROK0JvPzdR2l1fwgPdWTPSS0ztK0=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rv0zVnX1nkfIqUW9PsxgHH3ayjajFdf4NlFpUAtZ8mmg0OB3BeZAQIPvk4ldBCGf1
	 LYOONalE/dVjx9/2Mu14and/7s5buNkoxRI8V9lRp3JoJKw7ZB6TJCNjVdoS/C/O61
	 wTc3D8R0wXBKDZXe6ZmtLfUAvNBgZbBIaIJbLLng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBB61F80580; Mon, 13 May 2024 09:46:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3571F805A0;
	Mon, 13 May 2024 09:46:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D431F80224; Mon, 13 May 2024 09:41:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAEFAF800E9
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 09:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAEFAF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=t3Zq8YAY
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42011507a54so7406245e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 13 May 2024 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715586050;
 x=1716190850; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=jxDvLqtM5HD3XxV36Sf1rEr7tbwcAskZhewDbNVJWu8=;
        b=t3Zq8YAY+GDntYUDz+k/l4G6gYVVV4BS9TXwPTkl0EDzJljtwV8bGyIY8+djKoPYxv
         cwMYxuTX/n59Go2LDXUhPySuz9CxFPV8Ardy6ToIkQ15iKqm7rA/Hb0lDsIiG23yTLBF
         37J1mIDqB7+k/WkYfWlsWKc7aeRy2xkmBnwZ1AEmzZdMrG4zEeYOkckh3zWdYghFHtEA
         42rkhiVaqokFdEvbzKszAotMf9DKpDwAXZvcUWT+LWfTNWLqd7OcvP0HjWEyQ1esv3Nb
         SxH6A34OvnsP7BgawP0sBVi4KJxWiY3xQhP2bD5EB5dBY6fAO1DFMH1US4ZBS5HtGhGt
         lUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715586050; x=1716190850;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxDvLqtM5HD3XxV36Sf1rEr7tbwcAskZhewDbNVJWu8=;
        b=TTy2KYro2tmBTsbwRa5DOnj/C2erpanSHJf0RthxZzNpq+mCEhAw2h+eBpUmMrPDTw
         GSllJSqnj8evf9AvyamJNOl3dQAiTk2p2D2YrMz0T+Oyo3HDyixNepJ+6KIde0Mk7haM
         YTejKAGhZ57lhtU8mNjk/hQkb/j5qcgMDb37kfoyiyI6VMCZc4XBUON+ty2lnX2SJS4y
         niZTU8fpvU43mX7TGh2llp+AlLyIvXCuEOJf1XlPHb1/mFg4A9xS4PySqk9nbIazUfEX
         WnO9OYSxOII5rPXOfxTHKs6cHawT8e9aCZFIbCeVkB46J96qB+JZ64RH3c789qRlXgYd
         jk2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnDYaqX05ca01JgqYkjQAZUGgj1Dw/bl2MYzdt6akzZq8kGKa2pCphQ034iWRrrJPt1Kq6c7IYLeHEsJ6xvmex3y0ZrHwIEBMAZyo=
X-Gm-Message-State: AOJu0YzHaAAm7TkizP7W+x+kRwhCOpFc2SWyk6uJ+PtnCLxIBcJkD2Ex
	36YZaRrRYKuUDwVFrvd3d7JpmrK2KS9ApB3NYoBgN2SPsSvXSRzVNRtUtvL4VWs=
X-Google-Smtp-Source: 
 AGHT+IGyShzaHstWPtHJJ6LRI/e/nWyJHEwUq6cM85MqUwzsSvsHegJxxu5ykS/QCDfvcEJlaBd6rQ==
X-Received: by 2002:a05:600c:3112:b0:41b:e55c:8dc1 with SMTP id
 5b1f17b1804b1-41fbd1b2e40mr93356095e9.20.1715586050311;
        Mon, 13 May 2024 00:40:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a1dsm10367679f8f.32.2024.05.13.00.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 00:40:49 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
 <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
 <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
 <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
 <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
 <878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
 <1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
 <87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 13 May 2024 09:36:03 +0200
In-reply-to: <87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jseymyxa6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: BMJWRC45GVEDBSUCRH2BJDRYF4E7ZFC5
X-Message-ID-Hash: BMJWRC45GVEDBSUCRH2BJDRYF4E7ZFC5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMJWRC45GVEDBSUCRH2BJDRYF4E7ZFC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 13 May 2024 at 00:11, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback and analysis !
>
>>  - 1st problem: I see that following your removal of
>>    snd_soc_dai_link_set_capabilities(), the dpcm_playback/capture flags
>>    are no longer properly initialised in the amlogic card drivers.
>>    That will need fixing.
> (snip)
>> This codec is not meant to have capture channels.
>> I think DT description and the card driver settings (before the removal of
>> snd_soc_dai_link_set_capabilities()) are correct.
>
> OK, I see. Thank you for your analysis.
>
> The problem was my patch checks CPU direction vs Codec direction only,
> thus, it will indicates unexpected warnings, like this case.
>
> Thank you for finding it, I hope v2 patch should be OK for you.
>

I'll check

>> IMO, those check become too restrictive. We are adding a lot of code I'm
>> not sure I understand what we stand by going so far in the
>> consistency checks.
>> 
>> Initially those dpcm_playback/capture flag could be used to just
>> forcefully disable a link direction, regardless of the CPUs or codecs present
>> on the link. It was just another setting and it was not required to be consistent
>> with anything. It just declared whether the direction was allowed on the
>> link, or not.
>> 
>> It changed this commit, and the flags suddenly needed to be consistent
>> with whatever was on link:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc?h=v6.9-rc7&id=b73287f0b074
>> 
>> I complained back then and I still don't think this change was good.
>> 
>> If the flags needs to consistent with what is on the link, and we have
>> the ability to check it, why let card drivers set it and then complain
>> about it in ASoC checks ? Why not deal with it in the framework directly ?
>> 
>> I think the simplest solution would to just go back to the initial
>> meaning of these flags which was just the card driver declaring the
>> direction allowed/disallowed on a link. Then ASoC can mix that
>> information with whatever it finds with DAI drivers and figure out what
>> is actually possible.
>> 
>> It would give a clear and separate semantic meaning to those flags
>> instead something redundant with the DAI driver info.
>> 
>> What we have currently is not straight forward to set and check.
>> It makes the code unnecessarily complicated and difficult to maintain. I
>> think the difficulties with this patchset are a good illustration of
>> that, unfortunately.
>
> By this patch-set, it will be handled automatically via CPU and Codec
> driver settings, Card driver will no longer need to consider about
> direction (like non-DPCM), and I hope people (including you) will be
> happy about that.
>

If it makes things simpler, I am happy for sure :)

However, I'm a bit confused. If it is handled automatically by the CPUs
and Codecs settings, does it mean dpcm_playback/capture flags are
no-ops from now on ?

Should I update my card drivers to ditch those flags completely ?

May I still disable a direction on a link from the card driver, like in
the case I described above, when a TDM link has no slots for a direction ?

> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
