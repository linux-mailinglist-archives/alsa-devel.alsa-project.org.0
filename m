Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9DF60BE69
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 01:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52EF457A4;
	Tue, 25 Oct 2022 01:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52EF457A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666653507;
	bh=YjuOzmttWb0ZHzslbkylBfXvXPUFq+qvy1vIDkbRbIs=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=veHMIiApFkUAAUcFU97ILi7JEH59dbCBhnWaBJYqD0k63ehYhpkWSm7MEqUWxDEPK
	 w74JlpFD+CxC7YPIM2jj2eaJ2VTXTkIGdpq1QskXJlI35oTPzBNQe2uIIATl/n//kp
	 N9A9nuiD00CxWyw8TA8gQVIovdDZ7abH0ddy7y8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACDFEF80240;
	Tue, 25 Oct 2022 01:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D36F3F80533; Tue, 25 Oct 2022 01:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_155,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69C39F80506
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 01:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C39F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AhItJiJe"
Received: by mail-wm1-x330.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so7438774wmq.4
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 16:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=YjuOzmttWb0ZHzslbkylBfXvXPUFq+qvy1vIDkbRbIs=;
 b=AhItJiJettksiQTOHFgseTFR6DqFe/e7wb0/Uo96LIVwtwKXo5K5/fE62sCVPmEZpS
 T/pPdLPGS+Fo/xdYbfJZ7GREbBXngiazcLSBEnVbB0TcLPfyDsun/5lvIGwZEW1CwE+C
 qpgsbYBGHuXqLJHEJoGDQ8r3eSutZpAqd8JRp3xBIKVT33rshMDX7sxM+U918g5DrEFq
 TKNzvDq0kkwrBm74FVZ28BUy8Ke9oXOcst+1EfjkmS3MX2xEM2S1YwZgSBuUrxuUIpfd
 PPOMhOE+fm5whqD2iXiTp+u7ih+OO4vYs+uag2KuURwed7Z7jsCxRkyO+DVITWs86dX4
 nSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YjuOzmttWb0ZHzslbkylBfXvXPUFq+qvy1vIDkbRbIs=;
 b=JHUb/kUAqrj2EfnYw6IJMuiiw+tBpiZdRAz3EevJECpjj9MoWvg1xOefzFYmH2NPI8
 CkvJSmABffDVazaeh/Qr+D7Gx6pZj1hMFW83gStl94fpUB9j6IBFn8MBBO62E0NZfDRR
 5pic2X6e4X7vA0hh/m28ZlJ/TWcACoW3t0lACld3T0laNC42mGVuDkR82Cr5u+0KZ0RN
 ZWlfpjWLv/iJKjmsLsd9+zmIFV+0aXYQcUEUbEaYiJqTxlb1YWrOSXVTe7/rF4BHhjUo
 yFHStSxNY/1PI51YmFDxpKMQKv3gVOkp4YddPCPYfRLEzP6DszvvEWVbfZQqfXFNq7Kp
 IRnQ==
X-Gm-Message-State: ACrzQf065SNecsDdu3SnVD43NLpkPtE/Y+Pp6ylffNAgCDwwareXjT7R
 HKFclHhCe3oo9dqBH8Jjdrs=
X-Google-Smtp-Source: AMsMyM53AgmwLyYunIQBEg2gGCQmAocCp13pfXXXYPFcoghYXPQXxXsg2wMoDiPu87pMc/o7slafXQ==
X-Received: by 2002:a05:600c:4618:b0:3c6:bf28:ae64 with SMTP id
 m24-20020a05600c461800b003c6bf28ae64mr45996137wmo.51.1666653446401; 
 Mon, 24 Oct 2022 16:17:26 -0700 (PDT)
Received: from localhost (94.197.2.59.threembb.co.uk. [94.197.2.59])
 by smtp.gmail.com with ESMTPSA id
 bl40-20020adfe268000000b002365cd93d05sm768366wrb.102.2022.10.24.16.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:17:25 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <Y1Z74/vKHbnaCLrX@sirena.org.uk>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system
 clock IDs
In-reply-to: <Y1Z74/vKHbnaCLrX@sirena.org.uk>
Date: Tue, 25 Oct 2022 00:17:25 +0100
Message-ID: <XaoRSEMyUlabAR8wEJITmm2lGCjwfPZg@localhost>
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

> On Sat, Oct 22, 2022 at 05:27:41PM +0100, Aidan MacDonald wrote:
>
>> Some DAIs have multiple system clock sources, which can be chosen
>> using the "clk_id" argument to snd_soc_dai_set_sysclk(). Currently
>> this is hardcoded to 0 when using simple cards, but that choice is
>> not always suitable.
>
> We already have clock bindings, if we need to configure clocks we should
> be using those to configure there.

The existing clock bindings are only useful for setting rates, and
.set_sysclk() does more than that. See my reply to Krzysztof if you
want an explanation, check nau8821 or tas2552 codecs for an example
of the kind of thing I'm talking about.

I picked those codecs at random, but they are fairly representative:
often a codec will allow the system clock to be derived from another
I2S clock (eg. BCLK), or provided directly, or maybe generated from an
internal PLL. In cases like that you need to configure the codec with
.set_sysclk() to select the right input. Many card drivers need to do
this, it's just as important as .set_fmt() or .hw_params().

Normal DT clocks don't seem capable of doing the job of .set_sysclk()
even in principle.

Regards,
Aidan
