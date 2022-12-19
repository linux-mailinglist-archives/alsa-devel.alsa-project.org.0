Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20B650EAE
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 16:34:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681D72C70;
	Mon, 19 Dec 2022 16:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681D72C70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671464052;
	bh=xJw1uxeBNes78QwjuDvfy3qudptX7Djj3G/F/8+rfZI=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mCMVXnJ7adwUi1Pr2NATDDz8HfqNKTvxs/8otxApZ93rK2pG5ZkNavm79UhG7Z9xV
	 kWOtgi6+naaq8Woyi2n6k4LQhPLunzmnHeNUdFn3HVNyol6Nxzr4knFVoKOItpC5Ag
	 LuaP5jO/YtBASwZly7xVT3GLG6/QDqbMKeiWeHrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 255EEF800DF;
	Mon, 19 Dec 2022 16:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E587F80423; Mon, 19 Dec 2022 16:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93AD6F800DF
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 16:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AD6F800DF
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Insg6f7y
Received: by mail-lf1-x12b.google.com with SMTP id cf42so14232080lfb.1
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:content-language
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTYRVtrBCWvTbbm1id6yk46NA4foNt4C1COiVzWNk/A=;
 b=Insg6f7y+IPpAFrxlboZlF32xM0/+r2Po6VW390uUA1COFsO2mugcOpBlV/s75jj8o
 l6mPtuI1PCEIHNA8VXkKGXvz5cko8S0pCLkPBP+1BJXA1S/gPGVyhs8A9sG+FNwKQVO6
 XlWFgz45VbTNr42F2k9uenYBzGTqSAJ4IKWton21NA/ky7VQlK3M1e6ot516TQ0dc43R
 zZu1Q3JwJ64AIswKQ6iXcSB9XBnl46eKA8OTNC0cjhHRTkS1RyzvsRXPW4wUBN1gMxFv
 F0ezSwjqWG8hy6ARvxU1eT1+OrRs80riA6VmuN/aNekeBkKkHCkaL2GxnlMCHOl/pt0i
 c0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:content-language
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PTYRVtrBCWvTbbm1id6yk46NA4foNt4C1COiVzWNk/A=;
 b=SLAs+OTfR3lxN81WbGTbKojXFM9P0qEsYF5wwzXRtLYbLb/V8vwG6STL8opTxZi0tg
 lrhkNCr4a16PEmI1Y6nLaI8IYhJqpgrgzH+38suVAB+/u0QsCVR5BhhWsWFPEuiQAH6/
 rfPEowc/yZJAYoMeVQDOctoXSx6/KiSeGGrOeGV1A5zU5zVU+KEn+21/vy/N8D71zAev
 IO/y1TtknEVlT6bqZ7BWukzrYbg2wzWm7dfm5oK93KlSqOCkCniLDh+eFdK6nSWUYwHc
 KG4arpbZyye4k/hFh6CBpGdDd84xiKQvCnWfYgg9ZEkRou+5qrIq9bQJ92sPa7Dsqcz+
 lkbA==
X-Gm-Message-State: ANoB5pnUPWGIDi1qsdcSpgRmGFi14qooZBeTM43mzYbbItgGL+c1sbyR
 mHwc/+NG5xAgZRytO0+zTfc=
X-Google-Smtp-Source: AA0mqf6j9J2ITGvHGbil5qMW1XANOnr4H7x2vAlRqkx27/nWngyc+1D60iClP2o9yXk2Q+4fCyVOhg==
X-Received: by 2002:a05:6512:260c:b0:4b5:9183:5ad0 with SMTP id
 bt12-20020a056512260c00b004b591835ad0mr15799354lfb.63.1671463986139; 
 Mon, 19 Dec 2022 07:33:06 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-38-8.kaisa-laajakaista.fi.
 [185.69.38.8]) by smtp.gmail.com with ESMTPSA id
 s12-20020ac25c4c000000b004b591829352sm1127788lfp.64.2022.12.19.07.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 07:33:05 -0800 (PST)
Message-ID: <bcf910a6-34cf-f668-6b5f-3f9fcde3fcf3@gmail.com>
Date: Mon, 19 Dec 2022 17:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
 <20221216163919.GA2863056-robh@kernel.org>
 <CAMuHMdWEbVqD3z69-nJe9ST35_S4AZSJLrYqC3f=F+VONSPn0Q@mail.gmail.com>
 <CAMuHMdXNeJxzWoR6b+GOst9X49yK=vB574Lk1hmAS0WXDZrwPg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,pcm3168a: Convert to
 json-schema
In-Reply-To: <CAMuHMdXNeJxzWoR6b+GOst9X49yK=vB574Lk1hmAS0WXDZrwPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: nikita.yoush@cogentembedded.com, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Geert,

On 19/12/2022 10:45, Geert Uytterhoeven wrote:
> Oops, Peter is no longer at TI...

Yup.

> 
> On Mon, Dec 19, 2022 at 9:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> CC Peter
>>
>> On Fri, Dec 16, 2022 at 5:39 PM Rob Herring <robh@kernel.org> wrote:
>>> On Thu, Dec 15, 2022 at 01:10:44PM +0100, Geert Uytterhoeven wrote:
>>>> On Thu, Dec 15, 2022 at 12:47 PM Mark Brown <broonie@kernel.org> wrote:
>>>>> On Thu, Dec 15, 2022 at 12:03:02PM +0100, Geert Uytterhoeven wrote:
>>>>>> On Wed, Dec 14, 2022 at 2:23 AM Kuninori Morimoto
>>>>>>> +maintainers:
>>>>>>> +  - Damien Horsley <Damien.Horsley@imgtec.com>
>>>>>
>>>>>> For v2, I had planned
>>>>>
>>>>>>      -+  - Damien Horsley <Damien.Horsley@imgtec.com>
>>>>>>      ++  - Jaroslav Kysela <perex@perex.cz>
>>>>>>      ++  - Takashi Iwai <tiwai@suse.com>
>>>>>
>>>>>> as Damien's address bounces.
>>>>>
>>>>> I wouldn't do that, I gather the maintainers for DT bindings are
>>>>> supposed to be people who know and care about the specific binding in
>>>>> particular.
>>>>
>>>> Sure.  But how can they (still) care, if we cannot reach them?
>>>> There's no email message from Damien to be found during the past
>>>> 7 years.
>>>
>>> Then put someone that would care if the binding is deleted. As this is
>>> used on Renesas board(s), I can think of a few candidates.
>>
>> Or perhaps someone from TI? ;-)
>> This is a TI component, and also used on a TI K3 board...

Can it go w/o a Maintainer? ;)
The driver is (close to) feature complete and only needs framework 
change updates.
I don't particularly care about this driver as such. Yes, the j721e EVM 
uses it (which I still maintain along with the TI audio stack).

Unfortunately I don't know anyone at TI who could be assigned...

Nikita did a fix quite recently to the driver.
Nikita, are you interested?

-- 
Péter
