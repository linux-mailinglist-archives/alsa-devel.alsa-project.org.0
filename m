Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54B2EBBB9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 10:32:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF83B1680;
	Wed,  6 Jan 2021 10:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF83B1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609925573;
	bh=AEpXdsrE5JKREcFpu6FTa0A3+Lm3TC2ygXxgVZvbRiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8jItXjrKI2CVVwOrCnriS+q1WLbBKBPPwlIwk94J/keNs+miXPDJnTZhs4bLhYwR
	 hl8oTYR4yDT9vkJXoF+jxvV9SEp2+lvsab+n8J4VngI+H8OdTQOa74KWdaJxFZcxn7
	 3eb/D+TRny+M3zSWPPpy3+CnAJpfl/lIkUPyEj2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A20A1F800DD;
	Wed,  6 Jan 2021 10:31:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A1D3F80166; Wed,  6 Jan 2021 10:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D7E5F800FD;
 Wed,  6 Jan 2021 10:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7E5F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ssUHgab+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE3422310E;
 Wed,  6 Jan 2021 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609925460;
 bh=AEpXdsrE5JKREcFpu6FTa0A3+Lm3TC2ygXxgVZvbRiQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ssUHgab+xlU/+H4qyvtBbX40m7iPcwVJlGYM4IX0hDLb+yv2DjeS6oUHeLKabpPgP
 Gp8NLTzNj107gdAr/0lKafQZXprsQWTUfEuvA1Eys5ZSEewglZHr/CLBC7RDkT9RS2
 dRDeyhgL1IdNzy42WdhRTK63/UXdK9RsOY6xwOYIQP0p93VyWftk3jyvAbAEOg0nn+
 S4zMwivzpM5BY1sSDCAMPfMhfW1fpqRP6VMTS6MoZGPZtfqpOzGN1vqx//mEA8eeyh
 xV7jCTyC041+3RqiTjY2LFLi7tLr+YW7OxEDoo19BBrYMfVdCx4Zgao+hv9wElayqt
 bdYHiVcEIDfyg==
Received: by mail-oo1-f41.google.com with SMTP id k9so617437oop.6;
 Wed, 06 Jan 2021 01:30:59 -0800 (PST)
X-Gm-Message-State: AOAM531ZV8hjwyWNC5Idh4ezM4d9BzZoC1GOhF3sHDBtDj6jf7NkkDee
 k7V0TAXco+vZjGlndBLImpmM+wEC9rDnxLrib+k=
X-Google-Smtp-Source: ABdhPJxM7UasfYeKIHhnv5W454ns/4XqwHwyDFdt8OhYxwQZJfx6fDHCHg5ls3wHfkG+PAaDDTZZ9JPKz0GXfHCQ7OU=
X-Received: by 2002:a4a:2cc9:: with SMTP id o192mr2198217ooo.66.1609925459053; 
 Wed, 06 Jan 2021 01:30:59 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
 <20210105190808.613050-1-arnd@kernel.org>
In-Reply-To: <20210105190808.613050-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 6 Jan 2021 10:30:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1rp3d_H4uFN1hy_nASYTCZouH3x8ZhQ1JVvMYr+LsK_g@mail.gmail.com>
Message-ID: <CAK8P3a1rp3d_H4uFN1hy_nASYTCZouH3x8ZhQ1JVvMYr+LsK_g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: avoid reverse module dependency
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

On Tue, Jan 5, 2021 at 8:07 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The SOF-ACPI driver is backwards from the normal Linux model, it has a
> generic driver that knows about all the specific drivers, as opposed to
> having hardware specific drivers that link against a common framework.
>
> This requires ugly Kconfig magic and leads to missed dependencies as
> seen in this link error:
>
> arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_acpi_probe':
> sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'
>
> Change it to use the normal probe order of starting with a specific
> device in a driver, turning the sof-acpi-dev.c driver into a library.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

There were a couple of build failures introduced by this version. I have
one that does build now, and can post that if others think this is the
direction they want to go.

      Arnd
