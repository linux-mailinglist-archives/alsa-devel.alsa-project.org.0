Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F1B60E399
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 16:43:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 481E33A30;
	Wed, 26 Oct 2022 16:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 481E33A30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666795412;
	bh=OOQ+kDA4G+wlVL+Ry3C2hNPCcp5na+qrAnLo83Besj4=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUvnZ1gtLzTNRX8CAI1gLbkRdilbt758x8zzjP/THN3wJiY0PmfZU4seoEVM2Wu2Z
	 6ST4yfpRVpJQ+DBreRYO5h3FEE5LnCsel3ichebP5Rp3vwEUgYQ3eBAy4EVKjWwR7n
	 p3WZ18Q0y+eD4RMiXdWGEYn5D8N7jSXW92YhXd0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C258F80100;
	Wed, 26 Oct 2022 16:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6768AF80240; Wed, 26 Oct 2022 16:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_155,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1BA0F80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 16:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1BA0F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NsT4aKIW"
Received: by mail-wr1-x433.google.com with SMTP id g12so13920271wrs.10
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 07:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=OOQ+kDA4G+wlVL+Ry3C2hNPCcp5na+qrAnLo83Besj4=;
 b=NsT4aKIWNh8VI1pqGxDuMdij95PeSRomq9fcVnLuUdufvUhkiJenOSIq4zjBZcpguL
 YHwYgOdkenfpk64mO5RIPHJOucrjh2Ak0Q0NrslVONPd/XfgVznuQTvYmiVTkWmEDUx3
 CSW1gg23t7h/JH4EkTVhztriJju1ZSQBqvvYQ9blkWaDu/W7fGmOY60IQL50ffUV5eG3
 AuxSAJwmjXCDkZLf63CIkr4yYedZ5gSKGYTpoEixWgeZ0Y9lMNRlxliPiPDQI3UkfdEh
 idW0PZT2K5Z6pirybjnWPe2e7aZ5Ei2QAzt4bioCuWu4jfToiAZc2HCuj27wU9SBzOty
 euNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOQ+kDA4G+wlVL+Ry3C2hNPCcp5na+qrAnLo83Besj4=;
 b=dHZxQzgrrigeGLBYZ+gtG5DZpx42q3qCahhqxphGRfBIohKOYg99VemhD0bUruYW7+
 L+sMCFxNx9653aLCo7AbwEHwrKuKTy53Z5gNnIQ2vcv3PAKyGiPvvsq/mNIN1Z32UU2Y
 Oiooe7hVBoeWtYH1nsmc4iO8i+uQE5jptDi2Id+OQ7gFZQaM85POAqI8m3DBOBVIQtKf
 28rnF0hwv3m0d1N33p737qHPfNLS979GffcnSRecdpRgi8XNgNxKNjYaBNrI5zZokNxM
 Y7n3FWFMYWM97xFjdzjC3JOPbWh5SUdef+/eX3HMFOFcweyz+k+VsjEjAzT8ZbyD3lfy
 +O0A==
X-Gm-Message-State: ACrzQf0DhV0Bw7tigNMXFjTB8C562DRfqYdNZic2UInUJNDE3nfakDN8
 L9BfHq86PEKggvewap/SPUg=
X-Google-Smtp-Source: AMsMyM6+iea+6w9Q40omuHqI7vrbCP13G0UnlyON5YvJ3pwG56gCmnZU/yp0hMeTDVBPdrJbQC1f/A==
X-Received: by 2002:a05:6000:18c7:b0:22e:5503:9c46 with SMTP id
 w7-20020a05600018c700b0022e55039c46mr27782051wrq.668.1666795351099; 
 Wed, 26 Oct 2022 07:42:31 -0700 (PDT)
Received: from localhost (94.197.44.200.threembb.co.uk. [94.197.44.200])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b003cf4eac8e80sm690283wmq.23.2022.10.26.07.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 07:42:30 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <Y1Z74/vKHbnaCLrX@sirena.org.uk>
 <XaoRSEMyUlabAR8wEJITmm2lGCjwfPZg@localhost>
 <Y1fCfej+/WH8TI39@sirena.org.uk>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system
 clock IDs
In-reply-to: <Y1fCfej+/WH8TI39@sirena.org.uk>
Date: Wed, 26 Oct 2022 15:42:31 +0100
Message-ID: <FgO8Xz5MtaEBdBidpT8So4X5posjL95Y@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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


Mark Brown <broonie@kernel.org> writes:

> On Tue, Oct 25, 2022 at 12:17:25AM +0100, Aidan MacDonald wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> > We already have clock bindings, if we need to configure clocks we should
>> > be using those to configure there.
>
>> The existing clock bindings are only useful for setting rates, and
>> .set_sysclk() does more than that. See my reply to Krzysztof if you
>> want an explanation, check nau8821 or tas2552 codecs for an example
>> of the kind of thing I'm talking about.
>
> I thought there was stuff for muxes, but in any case if you are adding a
> new binding here you could just as well add one to the clock bindings.
>
>> I picked those codecs at random, but they are fairly representative:
>> often a codec will allow the system clock to be derived from another
>> I2S clock (eg. BCLK), or provided directly, or maybe generated from an
>> internal PLL. In cases like that you need to configure the codec with
>> .set_sysclk() to select the right input. Many card drivers need to do
>> this, it's just as important as .set_fmt() or .hw_params().
>
> There is a strong case for saying that all the clocking in CODECs might
> fit into the clock API, especially given the whole DT thing.

The ASoC APIs don't speak "struct clk", which seems (to me) like a
prerequisite before we can think about doing anything with clocks.

Even if ASoC began to use the clock API for codec clocking, it's not
clear how you maintain backward compatibility with the existing
simple-card bindings. You'd have to go over all DAIs and mimic the
effects of "snd_soc_dai_set_sysclk(dai, 0, freq, dir)" because there
could be a device tree relying on it somewhere.

So... given you're already stuck maintaining .set_sysclk() behavior
forever, is there much harm in exposing the sysclock ID to the DT?
