Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD62388E143
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 13:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 298182C06;
	Wed, 27 Mar 2024 13:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 298182C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711544189;
	bh=7tvzWOMU15U3qLtaG45FvaCp1yBq+rNh+P9CuovlHu4=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OZoH4b8fyi52LJaEDUg67/XrsqY7u1Z2o9yreJe1lIdwWWYxJfmN2Y6mBPiDErsNb
	 FkGUfQRPWxaukosUhHfmmmExljEmGZH1Pc49HvR43W9uNjfg7irK7CnntloC7BKVHC
	 VHcSlkYxDIkS68IKy5V3YZtcx0BjhdRT385SbxYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EED33F80589; Wed, 27 Mar 2024 13:55:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22874F8057B;
	Wed, 27 Mar 2024 13:55:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE236F8025F; Wed, 27 Mar 2024 13:55:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14DA2F80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 13:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14DA2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Fc+OgUF4
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-341cf28dff6so2153351f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711544137;
 x=1712148937; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp48KocudoiGALvWKkmTWkUXKZEVfSQEtoMbBwrHz/0=;
        b=Fc+OgUF4Jom2qk5N2KZwCL9iAW8QSs7rX9vctwlGXLSipmyfgizNnwLXtlN1CdeDIj
         v4Nd7HcAUQWUxvApWIbmCS4UEufJocPdpjZUfEaC/szG7Urmt4vST9tBMsp8vIaywIXr
         2BH0r1IMppCPTvRhH0mgZUthdXz1aMqODTWYiGk+KmZQm60vfihVZoj1VKON4SQpGUXo
         aHz3kdndZVdeXRecgnouvEYSVUR4FgzsRG4dXowLyaUMSUlC/7PzKNvQ1catgfkqCypw
         gQVHTOxUvtKYUrVJxzJfaes8iIPS/rDMqOz82ETuq0f7auvM9Dd+vgsJ0C+Q4+qXOLlT
         DxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711544137; x=1712148937;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp48KocudoiGALvWKkmTWkUXKZEVfSQEtoMbBwrHz/0=;
        b=I40NVx42otyQ3jbDEgUCV65/WbGXzmiH5vMPGFJGMWLbXey905pAnzLbrkrxEcrfC0
         styfQE+CCebOVNlvcv9hdy5gd7R7qNagPJSuM+HhVRP3T6K5L3Zl4GiGyl5Nrh7VyoEd
         ADuzBTaw01+cYgUIkrzBd1qLiaiZNn84cNNIU/cSPghXfJS7FEsLqimqmrcb5ZGCcB2I
         QqOxiHhkOeDdpaf23l/BItLMtRNqrdsrsqYVISDVGdznTjOBuJY8IL51vHt1Oawm+nf/
         Bf77pb4fChXx5xMkQDNNoglavXaMYIZyieqtvAOyOvfip2AMvTQrFFdlhObnrhdohQpG
         Iczg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXbmoHc20GYQMmmTUL5VStIwn6ElxxAEkIwkYIo1/rjhYcOI62aINEQR3qoo2mT/fkcJVsaC7c3aO6u4sg9jpJZv525nuTuXtP+KM=
X-Gm-Message-State: AOJu0Yx/4kUGXbQsMykFq3BpJj5wLkSTV9gj352xQqlRHT3y0dLS5TIq
	Sx+RUUJFAm+vEsmxF1sky4sx2YzRrRTgf/wzV7mdFxD9hUKtMhpybSsy0mZLUEQ=
X-Google-Smtp-Source: 
 AGHT+IFNNxBDz2Tx/jpDPmwWEphhbXKgsW+qHx/Yz0edPYKGGY5dsGFKtIqCm7B13uhNEaK0FJ6NZA==
X-Received: by 2002:adf:a3d0:0:b0:33e:1ee0:6292 with SMTP id
 m16-20020adfa3d0000000b0033e1ee06292mr4235689wrb.58.1711544137249;
        Wed, 27 Mar 2024 05:55:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e2f0:34bb:2ffe:1a3b])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b00341c162a6d4sm11641186wrt.107.2024.03.27.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:55:36 -0700 (PDT)
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
 <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
 <87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Amadeusz =?utf-8?B?U8WCYXdpxYRz?=
 =?utf-8?B?a2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
   Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
   Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin  Hilman <khilman@baylibre.com>, Liam  Girdwood
 <lgirdwood@gmail.com>, Linus  Walleij <linus.walleij@linaro.org>, Mark
 Brown <broonie@kernel.org>, Maso  Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
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
Date: Wed, 27 Mar 2024 13:30:32 +0100
In-reply-to: <87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jcyrfal6f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: DZYKRITZ724IN4ZBD7W36VTIJZHMWO3X
X-Message-ID-Hash: DZYKRITZ724IN4ZBD7W36VTIJZHMWO3X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZYKRITZ724IN4ZBD7W36VTIJZHMWO3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed 27 Mar 2024 at 01:06, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback
>
>> I'm not quite sure what you mean by "should have validation" and what
>> setting exactly we should validate ?
>> 
>> I know I should be able to able to understand that
>> from the code below but, somehow I have trouble deciphering it.
>
> Current ASoC have validation for ^^^ part
>
> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^                   (A)
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
>
> (In many case, this "xxxx" is "dummy")

Yes for many DPCM user, you have:

       DPCM
               [CPU/dummy]-[dummy/Codec]

FYI: on Amlogic it is mostly the following
(only considering DCPM, omitting C2C ...)

       DPCM
               [CPU-FE/dummy]-[CPU-BE/Codec]

With possibly several BE instances per FE, and several codecs per BE.

And there is even this for loopbacks:

       DPCM
               [CPU-FE/dummy]-[CPU-BE/dummy]


> By this patch-set, It will check all cases
>
> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^^^^^^   ^^^^^^^^^^ (B)
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
>
> At first, in [CPU/xxxx] case, "xxxx" part should be also checked
> (in many case, this "xxxx" is "dummy").
>
> And, because it didn't check (A) part before,
> (B) part might be error on some board (at least Intel board).
> To avoid such case, temporally it uses "dummy" instead of "Codec"
> before [15/15]. This means (B) part checked as like below.
>
> 	[xxxx/Codec] -> [xxxx/dummy]
>
> Because "dummy" will pass all cases, (B) part is almost same as no check.
> Yes, it is no meaning, but the code will be simple.
>
>> Where you have a CPU supporting both direction and 2 codecs, each
>> supporting 1 stream direction ? This is a valid i2s configuration.
> (snip)
>> >  		/*
>> > -		 * FIXME
>> > +		 * FIXME / CLEAN-UP-ME
>> >  		 *
>> >  		 * DPCM BE Codec has been no checked before.
>> >  		 * It should be checked, but it breaks compatibility.
>> >  		 * It ignores BE Codec here, so far.
>> >  		 */
>> > -		if (dai_link->no_pcm)
>> > -			codec_dai = dummy_dai;
>> > +		if ((dai_link->no_pcm) &&
>> > +		    ((cpu_play_t	&& !codec_play_t) ||
>> > +		     (cpu_capture_t	&& !codec_capture_t))) {
>> > +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
>> > +				      codec_dai->name);
>> 
>> Taking one codec at a time, would you trigger a warning for the use case I
>> described above ?
>
> Oops, indeed it will indicate warning in your case.
> How about this ?
>
> 	if ((dai_link->no_pcm) &&
                         ^ Actually my comment applies to all links, DPCM backend or not

> 	    (!codec_play_t && !codec_capture_t)) {

A codec that does not support playback and does not support capture does
not support much, does it ? ;)

I suppose you meant something like:

>           (!cpu_play_t && !codec_capture_t)) { 

Then at first glance, maybe ... CPU and codec seem to exclude each other but
that will only work as long as DCPM is limited to a single CPU per link.

> 		dev_warn_once(...)
> 		...
> 	}
>
> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
