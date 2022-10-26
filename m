Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E31060E8F0
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A8738A0;
	Wed, 26 Oct 2022 21:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A8738A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666812239;
	bh=e+3fgtWYWr/LZqi29IFpkd7kxdKLkA6xIq2eA7nitu8=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUHO/S4s44qGHeSytMFT4jbfAwQXFstQUpaN8Vh7IO6Daws1vpSTQCnzVSncxxgwG
	 yZU5hLsKDBOHl7L1D7Bh8in0pYAwghRA3YMKLYLdIrSDWKd6ok4jUB7BgW1bcUd909
	 3v4ssljSk9h4MIzqxCUa4+CipWsJAPGjcUd2wHrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD1DF80271;
	Wed, 26 Oct 2022 21:23:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3302DF80240; Wed, 26 Oct 2022 21:23:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9762F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9762F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hxpGP57O"
Received: by mail-wr1-x42f.google.com with SMTP id bs21so12223599wrb.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 12:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=XEgcn2r/w5ULwp6/az3hFeCeqevUoLHujjaPkWBEloY=;
 b=hxpGP57OCodC7yn5vO4V2LyPIixSPYpfWTiZQrnU6ptMawnFbtI2rVvcoS8olTP2WS
 gpv1JTpBNXlY87xOp0ikVV82E3W58Pz+OrK+RvvQCGg1QO0JIst3F/SNlnfhYNOkQd25
 CXvdUZRJVpCTE/7fhLPN4iA+/22Imv1KKL8XM9gR3lo/SYWL2WOTV9TNFgrSUVOpN8Di
 mHDIxrouTMYqQGug5iFiwOW36ktcPaQFJGRwqcOaXKsCKA2+gSGK+OSPOX4VuZKPPLAS
 bXmMJtN7Ung+7NBDJP+fCK01nXDzFwQmloWIE2IzjudSf2HUnZ0NRYnjJm4qr9LYJbvw
 Ss6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XEgcn2r/w5ULwp6/az3hFeCeqevUoLHujjaPkWBEloY=;
 b=lxqTb1CvDx4fzg8afaQ6dVAoXKwSZ1blwhbrJYv0XO/OrmhKAn+lcqGlxPG9bXFmkC
 INhOMC6dgOWzBS6f6ljwP5c9aaticmuxFIACCD0gTXME9puyoRq0ZCbZ5iewgv5srxuP
 XOHfftxPrLmH3XqmHj2Xxu/mx9bsHU5bGULSDgZKv+NYpesEhsgNOIb5dnosMGP8izAu
 cDR2gc4zh+7v7wtSl06JVwjtye7d+04z7ksyX7RZvRPTJsev6JkPkZi9QWvwr5l5BYc0
 xJq+r1iXoClQD7vL6rfCCEfIFp1N+JOKkUbjhx9VKD6rLJQa2K7vebghkwP+8FgNj8rY
 sJww==
X-Gm-Message-State: ACrzQf2W0I+MXEXMhx6gMFgWAw7Nhq1oFAgVgN4ntFOEtAWEYBi1B4N2
 VHULvhwkA/H7PdF+d5aftvQ=
X-Google-Smtp-Source: AMsMyM5QS3AYzIeljW/LCYF9j0fMMLIAvoGJKJBMiI4Bmw6zNI7dhLrfmUbYpRCmVqHA5XS9Xs5Vtg==
X-Received: by 2002:a5d:47cd:0:b0:22e:f98e:3b0b with SMTP id
 o13-20020a5d47cd000000b0022ef98e3b0bmr29646658wrc.556.1666812179741; 
 Wed, 26 Oct 2022 12:22:59 -0700 (PDT)
Received: from localhost (188.28.0.84.threembb.co.uk. [188.28.0.84])
 by smtp.gmail.com with ESMTPSA id
 bt18-20020a056000081200b002366b241cf3sm6192997wrb.35.2022.10.26.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:22:59 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <Y1Z74/vKHbnaCLrX@sirena.org.uk>
 <XaoRSEMyUlabAR8wEJITmm2lGCjwfPZg@localhost>
 <Y1fCfej+/WH8TI39@sirena.org.uk>
 <FgO8Xz5MtaEBdBidpT8So4X5posjL95Y@localhost>
 <Y1lOLgLNDgsmvfe5@sirena.org.uk>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system
 clock IDs
In-reply-to: <Y1lOLgLNDgsmvfe5@sirena.org.uk>
Date: Wed, 26 Oct 2022 20:22:59 +0100
Message-ID: <3vVkKn5WAgfH6HITfpqZP3wEVaTf1Kvc@localhost>
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

> On Wed, Oct 26, 2022 at 03:42:31PM +0100, Aidan MacDonald wrote:
>> Mark Brown <broonie@kernel.org> writes:
>>
>>> There is a strong case for saying that all the clocking in CODECs might
>>> fit into the clock API, especially given the whole DT thing.
>>>
>> The ASoC APIs don't speak "struct clk", which seems (to me) like a
>> prerequisite before we can think about doing anything with clocks.
>
> Right, they probably should.

Let me throw out an idea then... the clock API will probably need to
gain the ability to express constraints, eg. limit a clock to set of
frequencies or frequency ranges; ratio constraints to ensure a set of
clocks are in one of a specified set of ratios; and maybe require that
certain clocks be synchronous.

This'd go a long way toward making the clock API suitable for audio
clocking.

>> Even if ASoC began to use the clock API for codec clocking, it's not
>> clear how you maintain backward compatibility with the existing
>> simple-card bindings. You'd have to go over all DAIs and mimic the
>> effects of "snd_soc_dai_set_sysclk(dai, 0, freq, dir)" because there
>> could be a device tree relying on it somewhere.
>
> Of course, you'd need to define bindings for devices with multiple
> clocks such that things continue to work out compatibly.
>
>> So... given you're already stuck maintaining .set_sysclk() behavior
>> forever, is there much harm in exposing the sysclock ID to the DT?
>
> Yes, it's ABI and the more baked in this stuff gets the more issues we
> have when trying to integrate with the wider clock tree in the system -
> for example when devices are able to output their system clock to be
> used as a master clock for a device which can use the clock API as an
> input.  It's fine in kernel but we should be trying to keep it out of
> ABI.

Fair enough. It's too bad this limits the usefulness of simple-card,
but for the time being I'm happy maintaining these patches out of tree.

Regards,
Aidan
