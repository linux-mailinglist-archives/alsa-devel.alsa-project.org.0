Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C43AD6B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 05:07:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 275E31697;
	Mon, 10 Jun 2019 05:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 275E31697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560136058;
	bh=0v0FPYhMMPtW0Ec9VFloYzud89A5NsxcB6mN/28iSZU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=COBYIxnRqdxd0vw3xza4qBczFv+Os8BlJ3rmfOIEeU16iyN15fFmYIX6fEHKI67n4
	 A2MOcycNm6W5umwnNInS0sYbMgXyKlPOcq0LOlcd6EDlwSekahLEySbwfCGf9m1GWA
	 pW1aGlUXFtq/7f9ghSQ0PwDENKJGVGi0ARzb/aJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB78F896E3;
	Mon, 10 Jun 2019 05:05:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DAE1F80791; Mon, 10 Jun 2019 05:02:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED
 autolearn=unavailable version=3.4.0
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA58BF8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 04:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA58BF8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AzBYGQGs"
Received: by mail-vk1-xa43.google.com with SMTP id x129so1359875vkc.11
 for <alsa-devel@alsa-project.org>; Sun, 09 Jun 2019 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=soIO6aa299khHY4aBMlyprViMsAnavI8dZTSrsNtnB0=;
 b=AzBYGQGsUEPszL63unKPXvtzB/AB3ZrAP4oUXPmvuZ0xqcCpRUhiUVyCRK6JRfaZJT
 cffLUELq2sd+ZsQ1VIjF0kMB6gqzwFEG3B9jGsIGW7vEwtmLPRZdpD0AG0FCO2IVXn7f
 K20/qLuj4Umd/2TfmhhVu7EBqbvNrTXH25QbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=soIO6aa299khHY4aBMlyprViMsAnavI8dZTSrsNtnB0=;
 b=fPUVa2JiVH3j5EO9+rrEwT6Uw5aBzum8A8Vj1lUXe2tfwaozzMefP3pPNo2pJzuuKU
 iTQqd57on/FvRV+Jk83bCL3uCViZyjYN1saAogSwhJUEEALSuvwNcRBkuHuwHlSN2YRf
 kqU+HQV9cUhz2w3Pa2TYyp+lk9r0AJpammERMCU/cn7xPWlp9H0QVWFnKbRguEodxBaJ
 tjXoPd/ZEI+d5fz/FK6RHSktz5tISvESj6tGXKimvpsKoAlkR2nBM1DmS7Orhg/McJqA
 OwPLmjlpBH/V/ShU7MaS0jUxtA4pWv3s679YhW16Wauqhic3gkrmCSrODGCsIgighhz4
 MJPg==
X-Gm-Message-State: APjAAAU4XcOjzQgo51ph6TEB4rGV5G82EAJvWelsxuurVn4bprPlb+jk
 auoIjuOuZlCkaHe2/+OzmoiNbMSA3aQZCoeh5R7ibIunKgY=
X-Google-Smtp-Source: APXvYqwobxWQRCt38CRBLZmyga4viG8A/+kl2Q8h7at00N29/z26O0b5hr67TlqRGnKa1Vvy3AOtJ2qojeihBbWzYDM=
X-Received: by 2002:a1f:aad2:: with SMTP id t201mr8814598vke.74.1560135404911; 
 Sun, 09 Jun 2019 19:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190610021229.12005-1-KCHSU0@nuvoton.com>
 <20190610024029.12193-1-KCHSU0@nuvoton.com>
In-Reply-To: <20190610024029.12193-1-KCHSU0@nuvoton.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 10 Jun 2019 10:56:18 +0800
Message-ID: <CAFv8NwLHkP9zrHNbinz=8D9Gsf6Z8oTGN=CE-BX__72EhE6=Dg@mail.gmail.com>
To: John Hsu <KCHSU0@nuvoton.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, WTLI@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Yu-hsuan Hsu <yuhsuan@google.com>,
 YHCHuang@nuvoton.com, Mark Brown <broonie@kernel.org>, CTLIN0@nuvoton.com,
 mhkuo@nuvoton.com
Subject: Re: [alsa-devel] [PATCH] ASoC: nau8825: fix fake interruption when
	booting
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

On Mon, Jun 10, 2019 at 10:40 AM John Hsu <KCHSU0@nuvoton.com> wrote:
>
> There is no pull-up resistor at IRQ line where it connects from
> the codec to SoC. When booting, the signal of IRQ pin will keep low
> which makes the SoC invoke the ISR repeatedly because the IRQ is
> registered trigger low. It will not stop until the codec sets up
> the interruption and pulls the signal high. In the patch,
> nau8825 will internally pull the signal to high at booting in case
> the fake interrupts happen.
>
> What steps will reproduce the problem?
> Boot device
> What is the expected output?
> A lot of interrupts without any events
> What do you see instead?
> The fake interrupts are gone
> How frequently does this problem reproduce?
> Always
>
I guess you don't need these descriptions.

> Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
Please add my Tested-by.
Thanks!

> ---
>  sound/soc/codecs/nau8825.c | 4 ++++
>  sound/soc/codecs/nau8825.h | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
> index 47e65cf99879..83ec841f7865 100644
> --- a/sound/soc/codecs/nau8825.c
> +++ b/sound/soc/codecs/nau8825.c
> @@ -1881,6 +1881,10 @@ static void nau8825_init_regs(struct nau8825 *nau8825)
>                 NAU8825_JACK_EJECT_DEBOUNCE_MASK,
>                 nau8825->jack_eject_debounce << NAU8825_JACK_EJECT_DEBOUNCE_SFT);
>
> +       /* Pull up IRQ pin */
> +       regmap_update_bits(regmap, NAU8825_REG_INTERRUPT_MASK,
> +               NAU8825_IRQ_PIN_PULLUP | NAU8825_IRQ_PIN_PULL_EN,
> +               NAU8825_IRQ_PIN_PULLUP | NAU8825_IRQ_PIN_PULL_EN);
>         /* Mask unneeded IRQs: 1 - disable, 0 - enable */
>         regmap_update_bits(regmap, NAU8825_REG_INTERRUPT_MASK, 0x7ff, 0x7ff);
>
> diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
> index f6074c618569..3f41897ed3f6 100644
> --- a/sound/soc/codecs/nau8825.h
> +++ b/sound/soc/codecs/nau8825.h
> @@ -171,6 +171,8 @@
>  #define NAU8825_JACK_POLARITY  (1 << 1) /* 0 - active low, 1 - active high */
>
>  /* INTERRUPT_MASK (0xf) */
> +#define NAU8825_IRQ_PIN_PULLUP (1 << 14)
> +#define NAU8825_IRQ_PIN_PULL_EN (1 << 13)
>  #define NAU8825_IRQ_OUTPUT_EN (1 << 11)
>  #define NAU8825_IRQ_HEADSET_COMPLETE_EN (1 << 10)
>  #define NAU8825_IRQ_RMS_EN (1 << 8)
> --
> 2.21.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
