Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6D3ACE7
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 04:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E5F0167F;
	Mon, 10 Jun 2019 04:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E5F0167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560133369;
	bh=kUl7xps2RT3ddoNzqNp0iyN35wFoVqkZk8v7aYbo7ek=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHcv6wk/SjEnvrhaW29p8iUEz49KI/sNSnC7kU/dH6po/OU8QyxHK35yvlPNrRXZW
	 fADUVpQWPUptJkvyS4x6ptmLHoR7d8CttZDhHFvba7mcrm6l9QgCWEnw6b49FmlPO6
	 cDuCSQt+Qe8OUliEMtHKBl4ziQuZ+j846yAFKMXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B92F896E0;
	Mon, 10 Jun 2019 04:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDC9AF896E0; Mon, 10 Jun 2019 04:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 T_DKIMWL_WL_HIGH,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF4FF8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 04:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF4FF8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DoZJJ0SS"
Received: by mail-vs1-xe42.google.com with SMTP id 190so799281vsf.9
 for <alsa-devel@alsa-project.org>; Sun, 09 Jun 2019 19:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5fRAXCIWrbr/OFEJVt26RpY/v058jlo1UQ/6AWM+tc0=;
 b=DoZJJ0SSklZoxlLBWXyFqJ51eVQ/OfzKjm4i5+ycBf7NR2uEMcv6yz/+VSXxqsDjw9
 V4mtRkILpCVuQD9W7znYrGz2m/HYUGmcfEFJa/cNRSR14E0wuHbCPon7kyMm34ZWZXOY
 6a+qcoyNP1V6PpjfM2Wo4b34rRaLUsBk4VLGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5fRAXCIWrbr/OFEJVt26RpY/v058jlo1UQ/6AWM+tc0=;
 b=pWIrZGEzU19xpry5kN2mpY5LFoy74OyemIhCHbzotd+z2nuMwrdh/++A5+Q1/u993Z
 cILGBWRabGETedQZhIkIaOSKc3KaPZ4oEuPqsYG7TQcId4oEeQzmaN9RPjKJcp8Nrs/m
 BLqMIegQVyqu0IsrtWB32uKMs48qdHQNk68iXF1ksRIVKxR6XeV1Qj7iHr8/zRlAEK5b
 M35X6+4depF1mqkJyUeTrSwt+c5G4z2wh1OylQ1zNZvBGYdZoLMKk8Fqy3xrZspsc4KP
 9iYcdsMlP8LTJoLmy0lkQYYsU9ej8Ps+OU+NaLGxa7Nm1inlSQOETn0wM4WJMwOop5O/
 Jgog==
X-Gm-Message-State: APjAAAX0j15J+9isiqIhjfd0QlzAYpTNNDibnAw8+t0t47k367mz/q8w
 3wSs70z2422xhG9iZ5QaIq2Pb2LDCkNxAahmrYuWzA==
X-Google-Smtp-Source: APXvYqxj1b+UoHnb0KrqkTqVDd2GZ8dQa8umvCh2Gt2ePxHXoED54sAnpr4fEiPLaoi1FWvUf8L9GD8+frGdlZ9orV4=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr7956701vso.138.1560133165400; 
 Sun, 09 Jun 2019 19:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190610021229.12005-1-KCHSU0@nuvoton.com>
In-Reply-To: <20190610021229.12005-1-KCHSU0@nuvoton.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 10 Jun 2019 10:18:58 +0800
Message-ID: <CAFv8NwKNCR=vRSHQUkptdtW4+3AxfDsuoWEj6VQuVMffNh4Ryw@mail.gmail.com>
To: John Hsu <KCHSU0@nuvoton.com>
Cc: anatol@chromium.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
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

On Mon, Jun 10, 2019 at 10:13 AM John Hsu <KCHSU0@nuvoton.com> wrote:
>
> There is no pull-up resistor at IRQ line where it connects from
> the codec to SoC. When booting, the signal of IRQ pin will keep low
> which makes the SoC invoke the ISR repeatedly because the IRQ is
> registered trigger low. It will not stop until the codec sets up
> the interruption and pulls the signal high. In the patch,
> nau8825 will internally pull the signal to high at booting in case
> the fake interrupts happen.
>
> The patch help to fix the issue as follows:
> Google issue 133904101: Cave: excessive number of interrupts before Nau8825 codec is initialized
> Reported Issue
> Chrome OS Version  :  ChromeOS R76-12217.0.0
> Type of hardware   :
>
> What steps will reproduce the problem?
> Boot device
> What is the expected output?
> A lot of interrupts without any events
> What do you see instead?
> The fake interrupts are gone
>
> How frequently does this problem reproduce?
> Always
>
> What is the impact to the user, and is there a workaround?
> If so, what is it?
>
> BUG=b:133904101
> TEST=Boot device, and then check the interrupts are real.
>
> Signed-off-by: John Hsu <KCHSU0@nuvoton.com>

Tested-by: Cheng-Yi Chiang <cychiang@chromium.org>

Thank you for the fix.
I think you can remove the description about issue 133904101 in the
commit messages and BUG and TEST fields.




>
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
