Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE5560BE1C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 01:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97716672C;
	Tue, 25 Oct 2022 01:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97716672C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666652601;
	bh=E3/7FizKlCQ0WTF7InNROlplHupX8DeTut+qzJv09S0=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIIqPnNd4MIFYEHXdN+/Rw2dbANXz3Prv/j+jEO/ZUBji1yE3XRJQbzZdKS26Ksxd
	 2KC14asgRz47qhEK/ldwJPhCDbzPL/0hdS7rWw7XCorUeZK/pehhmfkabNj6z5cPZE
	 sZgpCg/YBGJ3PaCXFXXS+VKLH5SrItHe6VNp+yak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0675BF8053D;
	Tue, 25 Oct 2022 01:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FA81F80533; Tue, 25 Oct 2022 01:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1CFAF80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 01:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CFAF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IV2RWjSs"
Received: by mail-wr1-x42b.google.com with SMTP id o4so10049888wrq.6
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 16:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=KaoGSotGAFceXqyyQYu9XCTEP8cta6cn87AncWEkKJY=;
 b=IV2RWjSsTpxEczaXY2qgq5ATQ4pPYPFWTulRqg14h2wu3f4harvqBv1HOrabkiZ+0C
 6uqhrFrj6umwZTfzAtlLbL+oI2y7aydQdeBU1Tec9XtdwZshkL8s7FHKYJv6mpJgI/OC
 hOAg1uByJ1ku79XAe1A9ku/XwkitmNY39TeANEY6lcMm0oFzOuHaZvAu98RNcogZFv8m
 X3Gc/5TB3MOtiAiJjJZFd3S2iDCrSMF2+r3nINt1MjurFsaZSG2xsCZ+s+3M4tXEbOch
 7NgXLOLGU35Yo4tZfQN2b6wfGYlEBbrSOpYo5F0/gwiRNvb6OQvLoFm5ZU6LYXAWZq68
 vHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KaoGSotGAFceXqyyQYu9XCTEP8cta6cn87AncWEkKJY=;
 b=f91bx++KTy93teztWQeflSYv12qAsFl015nQnXIsuFKJqdgK90uMI7eHT6tH0IpImw
 UQ2f8+6QWy4miTAYaDZdaWj35wqd9yERgUBsnDKugsOunrdJog0R11FrD0E6n6fEN0Fn
 sQGOxybCSqQxQ3uhkq4WFVTGnbyc3syc53t6gD4RJllVkVufGX+Qdr9sVC5S5y2XKtew
 hddRJ3ZV1PQ7n6c6d8qlRlMJ16Z4io9qeKLI3kF/Ev4Gr7UDGXXF4DQ+Ur6Z2FKbfL4S
 06+l3j+V9b0Ba1vW6RoNhw7fIDMC+kT2dG6utLnjapiGIDecV/T1edR04/NMB0J90MDy
 Y0Dw==
X-Gm-Message-State: ACrzQf2A2U6BwTaLaHo3lL5KkD1RSqLkeCm+WFNCCxYeaS2+Q87FQPdR
 pbEwhlRah4HUgoz3jLvk2Vs=
X-Google-Smtp-Source: AMsMyM7GyNXIsaHwAiWktSz5FIbnYUO2r4ym96pAz6HpvYe5hMahqSmSxp5DkSTuWtfbQhqNnjxFjg==
X-Received: by 2002:a5d:64e9:0:b0:22e:7631:bcab with SMTP id
 g9-20020a5d64e9000000b0022e7631bcabmr24146249wri.36.1666652534115; 
 Mon, 24 Oct 2022 16:02:14 -0700 (PDT)
Received: from localhost (94.197.2.59.threembb.co.uk. [94.197.2.59])
 by smtp.gmail.com with ESMTPSA id
 t7-20020adfe107000000b0022da3977ec5sm742225wrz.113.2022.10.24.16.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:02:13 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <87fsfem6zd.wl-kuninori.morimoto.gx@renesas.com>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system
 clock IDs
Date: Mon, 24 Oct 2022 10:18:15 +0100
In-reply-to: <87fsfem6zd.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <MXQXY4d7ZMjCu1ChI1EL7daeg1zENP5H@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org
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


Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> writes:

> Hi Aidan
>
> Thank you for your patch
>
>> Some DAIs have multiple system clock sources, which can be chosen
>> using the "clk_id" argument to snd_soc_dai_set_sysclk(). Currently
>> this is hardcoded to 0 when using simple cards, but that choice is
>> not always suitable.
>>
>> Add the "system-clock-id" property to allow selecting a different
>> clock ID on a per-DAI basis.
>>
>> To simplify the logic on DPCM cards, add a dummy "asoc_simple_dai"
>> instance and use that for the dummy components on DPCM links. This
>> ensures that when we're iterating over DAIs in the PCM runtime there
>> is always a matching "asoc_simple_dai" we can dereference.
>>
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>
> I think adding "system-clock-id" and adding "dummy asoc_simple_dai" are
> different topics. This patch should be separated into 2 patches.

Sounds good to me.

> And I couldn't understand the reason why we need to add dummy asoc_simple_dai.
> In my understanding, we don't parse DT for dummy connection.
> Which process are you talking about specifically here?
>
> 	This ensures that when we're iterating over DAIs in the PCM runtime there
> 	is always a matching "asoc_simple_dai" we can dereference.
> -
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

DPCM DAI links have some real DAIs and one dummy DAI. Each real DAI has
an asoc_simple_dai associated with it to contain the information parsed
from the DT. The dummy DAI does not have an asoc_simple_dai. I'm adding
a dummy asoc_simple_dai for these dummy DAIs to make the mapping of
snd_soc_dai to asoc_simple_dai 1-to-1.

The non 1-to-1 mapping is problematic, because if I have a snd_soc_dai
and want to look up a simple-card property I would need to check if the
matching asoc_simple_dai exists first, and have a special case for DPCM
dummy DAIs. With a 1-to-1 mapping I can handle all DAIs the same way.

Regards,
Aidan
