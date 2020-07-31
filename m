Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F06234597
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 14:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D4416A9;
	Fri, 31 Jul 2020 14:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D4416A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596197919;
	bh=QAqmxzW0jBfFRkg0WAhuxHqNirH7ZsUBicFo6mCNL94=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhtKUAFzizUpEZGuSWgBCD3y1bB6n31wIDcIPLD5YVCQ6oZHVdTQ7jVm0jxBhBaH5
	 db+LalvQ4hlSq8bVrSBIJeH/tFqqrTzzX6ASxSnZWtPu5RYiSa5iw6NVUD1GIE2cZn
	 iGdUA5uW0iuQksvKHaZgKuEeDtCEUE8R9JjyvHzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF3BDF80161;
	Fri, 31 Jul 2020 14:16:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 187ECF80171; Fri, 31 Jul 2020 14:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3F29F8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 14:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F29F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="guQm0pLx"
Received: by mail-wr1-x444.google.com with SMTP id z18so24243595wrm.12
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=xABj9o/+LF58yiAkW0qlTl8H60o66EHmFAlpoGa2r4s=;
 b=guQm0pLxZhuiFMgT/YoFDq1qAQEhYLykNn383MHzp5vyWxpMrZ36YkRNI78Ke5XpUO
 wq1Q16/L+GkWgoNJLEf/o9HsPCU4002b1qrN9oB5YQTivbxhsh1zAj0g5r0ZMwxbvFs1
 txNvI+MFOaQIhzLW6qF79AjMywqpt6i/uYmN/8D2yUkRL2lcCo6Gkf0uBOCa2BbXDEao
 4qz9YkoQ+hEyjr96b5l/hRkD13LxOen7ADjs35KCziHBvXijJ+P1sTq5917Lqjz9Qhls
 GuhtcRBBoFrYjiEniyu6H5zZ+JPnAkF9+FBAarSjzbmGdrE9u2Ki04mtXhJ06YEYcu5m
 yA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=xABj9o/+LF58yiAkW0qlTl8H60o66EHmFAlpoGa2r4s=;
 b=DCLrpi1Jbnb9/9lB2rO8f3AludaPJxustv6TEjijIvHFHZi0WV4T/ZWKkz+XOShKJ3
 7mEiy02hJ7R7iT7bpezQ4YkF03hNFF4pSCWVNeG3m4FD4JW3e3ryHBERsqSr4PwAlZMG
 DKPmXfdG7qpnimBO0uuRfUT12zZKVC7zUqz+R3ZpHBDRLgnpeaTuTS117KbE2s85OoAe
 ibB3FIELY/gE7v5G1aEBfxbjaoOuLGl1S/btFUauTmrZXmInx9hQ/Pj90NHju9SqyBMX
 fgGRqSSxhAImVTXhES6Mi7B1XE4YWY6FFLsbhqBaVod5vOpvPNKDa4tdWCD4ES1Lymy0
 Rkuw==
X-Gm-Message-State: AOAM533upPJTdulN2762OCsiFziQxAI1RDk90fQ9v5zx27qYp4KdouvX
 uOwAp5DodIG4Qkc1XAu/F6RdPw==
X-Google-Smtp-Source: ABdhPJwnWi9tvSXSrHuqSUu1kDUIIUV324uwyEKL0/F8EHAeFwamGr+7Nm01PLL6fMFhOXcprj35Sg==
X-Received: by 2002:adf:e6cc:: with SMTP id y12mr3266378wrm.391.1596197804388; 
 Fri, 31 Jul 2020 05:16:44 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g126sm12527702wme.16.2020.07.31.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:16:43 -0700 (PDT)
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
 <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
 <20200730185229.GH5055@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
In-reply-to: <20200730185229.GH5055@sirena.org.uk>
Date: Fri, 31 Jul 2020 14:16:43 +0200
Message-ID: <1j7duj98wk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, zhangn1985@outlook.com,
 linux-amlogic@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Thu 30 Jul 2020 at 20:52, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jul 30, 2020 at 11:06:23AM -0500, Pierre-Louis Bossart wrote:
>> On 7/30/20 4:04 AM, Jerome Brunet wrote:
>> > On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>> > > On 7/29/20 10:46 AM, Jerome Brunet wrote:
>
>> > > > The flag previously allowed card drivers to disable a stream direction on
>> > > > a link (whether or not such feature is deemed useful).
>
> Right, and I can see a use case for this if someone has a board that
> for some reason didn't physically connect one of the directions for some
> reason - perhaps they were running out of pins or something.  It's not
> clear if anyone's actually doing that though.
>
>> > > > Forcing the flags to be aligned with DAI caps just make the information
>> > > > the flag carry redundant with DAI caps, breaking a few cards along the way.
>
>> > > > This change drops the added error conditions and restore the initial flag
>> > > > semantics.
>
> I'm not 100% clear, have we actually found cases where the flags are
> used or is this something found through inspection and review?

One last thing I'd like to understand. Is this behavior of throwing an
error going to applied to the non-DPCM case as well ? so at least thing
are consistent between both cases ?

IOW:
 * An error is now throw if dpcm_capture is set on the link and the CPU
 DAI support playback_only
 * on non-DPCM links, will an error be thrown as well if playback_only
 is not set and the CPU on the link happen to not support capture ?
 
>
>> >   * It worked for every user of DPCM so a far.
>
>> Not completely true, when Morimoto-san added snd_soc_dai_stream_valid() it
>> exposed tons of cases where the information on direction was not provided in
>> a reliable at the DAI level. I will assert that we are still finding out
>> cases with broken DAI configurations, and as a result we will also find
>> broken dailink configurations. Your picture of DPCM as a perfectly
>> functional system that I broke is a distortion of reality.
>
>> The reality is that we have to work in steps, first make sure all DAIs are
>> properly described, then work on the dailinks and optimize at a later point.
>> we will need warnings to find out what the problem cases are, and move
>> slowly.
>
> This was all triggered by Morimoto-san's changes like you say.  DPCM has
> quite a lot of problems in general, here IIRC the issues were that we
> had multiple different ways of doing similar things which it wasn't
> quite clear if people were even using.  The intention with the warnings
> was to remove them one way or another, they're mainly intended to flush
> out actual active usage of the flags as opposed to redundant usage of
> them which could be confused/broken.
>
> This could definitely have been clearer in the changelogs though.

