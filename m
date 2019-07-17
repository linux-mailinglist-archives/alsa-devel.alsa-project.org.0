Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1256BFD6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71B7516BD;
	Wed, 17 Jul 2019 18:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71B7516BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563382196;
	bh=HQl0OGRWq6RFWclgejz7OP5eXH5ro2KlnXexErwgsko=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5fu9ZbW1TLsbRDJg10pBj587RvsF7iobP6buJPgfAcb6+bym+7WDQ8nlu20WL007
	 cc+BjlmIQAF0nYIxipN96bv3vpNdZiSPlibd2z5BuKatXq/B/2kUdzFQrBCdRNlR7C
	 feLCCW0H+JEPTb9Rxrrey1t/WvisC0Wi2KvjMFW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DAC4F8036B;
	Wed, 17 Jul 2019 18:49:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37C6CF80368; Wed, 17 Jul 2019 18:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C08FEF800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C08FEF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MhVx2YaE"
Received: by mail-lj1-x22d.google.com with SMTP id m23so24271447lje.12
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NgGtrv5SKEz++WGnlB/B3rFdiXYpyY07rfhEUYiUwH8=;
 b=MhVx2YaEcVUQ11yWhLge7sp5/jqEHDI9LwX1f7kbBfbqaM7o3uiYPPGBZjkDAy2qUF
 c2ZVP3Uz525C/YSfM0Jy916Ikg4yFoUVyxsKxpHEjxl8UwoJ7xZJ3FcNetIJAYSdjJyb
 DEIJRDQkMixS7AirdetBhDeUGPd5AGMq7zsL47Cxfb62l64UhW+7xnQZMkzIvMz7HyZX
 n7V8cRrHES0dnhqOuAFOanJd1jKkQp3I/U6fI1jfbAaW4O+sy/yLdlQRe5Lx0BnycI0V
 Ntk1tJ7bUe9nP7mefHHpPRTm8e0wDeMbcCp8iTldKBkZLc9H0xp0tRis4ncsM77NI+M4
 yEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NgGtrv5SKEz++WGnlB/B3rFdiXYpyY07rfhEUYiUwH8=;
 b=H7sIii09/yZJ50tydGDjsB8IFFHKBqWsdwX6gKpVxj/hu604GHhrVrZP9/G5NahMt0
 6nBFTvFHXRHq/UNRfltg8TmljjVOMvmwErqP7JsTDqvfuAPKmX1wjDi8GndIT91i5kIw
 GXJc3PC8rpSDww/sP8Js9N8zU8kPvRxXMiTlYmveFsccR8T6d5TnEH/yZ7Cb1b571VPE
 Q8V0L59exhaCXu2dvjHgI0+6rgwSJCjsu5eCoZo2FUh0dO/WHiSYD6oBEVTDTPXsllUj
 zRIdy9FnSNlpDXIaKDlW2+NWwFfEqPPtsVRYodaTehX+Q22hX81guJT8gI5Xpe1kqi/X
 KJKg==
X-Gm-Message-State: APjAAAXTvpepky3nL3FN0rwBmc3XpA0kcOOC5U355+uaN4yh5IFuGGQG
 1CiDQcRs01MgK8M4uXz5NyUImydSEPdoK2aXg6M=
X-Google-Smtp-Source: APXvYqzZRziD4tOV2evLHyib9pi+Lz6pPgFdw3aIoEAcs6WrhDBp/XFRW/fvkedarSqoyKSPHiydWYsSbR1K8gOXcRE=
X-Received: by 2002:a2e:a311:: with SMTP id l17mr20837046lje.214.1563382133648; 
 Wed, 17 Jul 2019 09:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
 <20190717163014.429-3-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-3-oleksandr.suvorov@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2019 13:48:43 -0300
Message-ID: <CAOMZO5AgCqH+8W36vh4n3tCFvqUE=H+4Zp0jG1NQi5UFOsSSAQ@mail.gmail.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 2/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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

On Wed, Jul 17, 2019 at 1:30 PM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
> Change VAG power on/off control according to the following algorithm:
> - turn VAG power ON on the 1st incoming event.
> - keep it ON if there is any active VAG consumer (ADC/DAC/HP/Line-In).
> - turn VAG power OFF when there is the latest consumer's pre-down event
>   come.
> - always delay after VAG power OFF to avoid pop.
> - delay after VAG power ON if the initiative consumer is Line-In, this
>   prevents pop during line-in muxing.
>
> Also, according to the data sheet [1], to avoid any pops/clicks,
> the outputs should be muted during input/output
> routing changes.
>
> [1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Fixes: 9b34e6cc3bc2 ("ASoC: Add Freescale SGTL5000 codec support")

Reviewed-by: Fabio Estevam <festevam@gmail.com>

By the way, I prefer the description you put in the cover letter as it
explicitly talks about a bug being fixed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
