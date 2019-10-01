Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF73C39BD
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 18:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DFC167C;
	Tue,  1 Oct 2019 18:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DFC167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569945681;
	bh=yK7XawW45ieBw9PhAsWs9iNiGSenmhG3SHYrqKsmwDA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cH0Gvzwo8oke6ZRtbe5OrQQTF1+QYjPZkierGSJ4wLuzDTpHAJfODErCJNk5KY4RZ
	 Fi3zZx2yvmg0ZOWRc1pkS/KKyuGxjnAn6o5CP40563n4hJscMvLMil8AcX+WhEkTRS
	 Oa4CgiDdpUg/a8g0XJQjuDdbZ0ytgJIKzjjUETNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61426F80506;
	Tue,  1 Oct 2019 17:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 221E4F80506; Tue,  1 Oct 2019 17:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D371F80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 17:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D371F80482
Received: by mail-qk1-f194.google.com with SMTP id p10so11715597qkg.8
 for <alsa-devel@alsa-project.org>; Tue, 01 Oct 2019 08:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PVA9zycwwTmxrHgzivoqyA4S7B6/Ae12ZgJJqfTA6ZE=;
 b=bjYEoQvLP0aMMhfVPqi4/1E1H4BC1i8XrJSgZmyfSPwPuTPAS5KWL+rJ8X72mSCD9C
 darTi60wB0vvAmptszeEo8kZjvdOzIjyrP2fZSGdZ4iDjs+3qsm1Hae/JCJW58vPsw/q
 YC/EhGQeuB+vzWyJp9Pckb4OGG9dZDeXToIC8ZbTidbj0m9in0K04S0AFJAMT+4AlRcU
 orWz1O0BDuQFXLrZbB7J9PiJQ76YvUL4XTa8wjO+wbhB+36NWfUYivrb/3AX5tb8XsnN
 YTP5awQsJc076NiBaa88ML1gDKe6iyLztLbxdTCAG2mWIgHTH4VtpJp67mpAZVzeg0L0
 2vHw==
X-Gm-Message-State: APjAAAUdv4ITEDTyUFmxYZBhDvip+i7Zphji6GyGcJuV8EbZuswWcj6e
 ucOzTcf4fovyxBihX0LHkGauFtScvSkVWjVU984=
X-Google-Smtp-Source: APXvYqw8OSzTRQKAtzD5yJNb3X/TKsuG58PVn13xDbhiPbbzHk02DUCmHWqaGsNg1xN9FhUJmk9LIa3wCb6Y08Qz7k8=
X-Received: by 2002:ae9:ef8c:: with SMTP id d134mr1425740qkg.286.1569945569712; 
 Tue, 01 Oct 2019 08:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191001142116.1172290-1-arnd@arndb.de>
 <20191001142734.GD4106@piout.net>
In-Reply-To: <20191001142734.GD4106@piout.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Oct 2019 17:59:13 +0200
Message-ID: <CAK8P3a3ovgR4THuXb17Fh7DDts188jWRqP3OAZ7cknNUsWQ-dg@mail.gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: atmel: fix atmel_ssc_set_audio link
	failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Oct 1, 2019 at 4:27 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> > -obj-$(CONFIG_SND_ATMEL_SOC_PDC) += snd-soc-atmel-pcm-pdc.o
> > -obj-$(CONFIG_SND_ATMEL_SOC_DMA) += snd-soc-atmel-pcm-dma.o
> > +# pdc and dma need to both be built-in if any user of
> > +# ssc is built-in.
> > +ifdef CONFIG_SND_ATMEL_SOC_PDC
> > +obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-pdc.o
> > +endif
> > +ifdef CONFIG_SND_ATMEL_SOC_DMA
> > +obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-dma.o
> > +endif
>
> Doesn't that prevent them to be built as a module at all?
> I'm not sure there is a use case though.

It should not: the idea was that snd-soc-atmel-pcm-{pdc,dma}.o
get built as modules if CONFIG_SND_ATMEL_SOC_SSC=m.

      arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
