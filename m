Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983245DB53
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:39:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0CE18C1;
	Thu, 25 Nov 2021 14:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0CE18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637847559;
	bh=B1iBf1QPUALSQQKiuuX3NST4yrrSJuif87J5949d9G0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gT/a/3YrMtBHa5EHeq4N5El+bYAYVR/R7hN/Nxct/22Qt/RLqfDFPiOrtl4wMyEVT
	 S/CjXh9b0lm2qv4BTD5WNuIidqMw+wZjmBRVOfGfy2mfRd10H7h/GHaZPE5NQEpimz
	 IaDlu1EXQz6jLvy2oQHu/AkOPh3oYRbk6VMfy4Y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B705F804FD;
	Thu, 25 Nov 2021 14:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E07AFF804FF; Thu, 25 Nov 2021 14:37:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 501BCF804EB
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 14:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 501BCF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NHKMBCqh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B6CD6109D;
 Thu, 25 Nov 2021 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637847423;
 bh=B1iBf1QPUALSQQKiuuX3NST4yrrSJuif87J5949d9G0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NHKMBCqhpUQzYWt6Yk+i5Yatrz8lrc1N6FV9SoJPRtOz1NlFG59UFGMMvGrd5RXvo
 XMnFnOfypyogSMUpLxvW2uTQQr/xMK5oc1+TmUdY5brHhhT3+GQ7S42tmAnZbCBZO9
 9PDHxyQV+clYZQUy40CsOy5sYiSgYaS9RdilQn8kIqxjvDAiys5XXxYf8FlEzue4qB
 Ke5ZamvTqBoGvvB8wHdb+s2Di8xbDc0ew35t/f6h1qtVU2OBkHaa4N3XqwrYMg5ME6
 zR6BiJPPo12GqFYZczjAwe61ya381hNf4YY0AZ2xp+RS050EFa76rJkTP0V2lJwe0k
 nfg7hh0eBWqgw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
In-Reply-To: <20211125095158.8394-1-lukas.bulwahn@gmail.com>
References: <20211125095158.8394-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 0/2] Kconfig symbol clean-up for sound
Message-Id: <163784742137.3101847.1051508589113120656.b4-ty@kernel.org>
Date: Thu, 25 Nov 2021 13:37:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 25 Nov 2021 10:51:56 +0100, Lukas Bulwahn wrote:
> The script ./scripts/checkkconfigsymbols.py warns on invalid references to
> Kconfig symbols (often, minor typos, name confusions or outdated references).
> This is a patch series addressing the issues reported by
> ./scripts/checkkconfigsymbols.py in the ./sound/ directory for Kconfig files,
> quickly filtered down with:
> 
>   ./scripts/checkkconfigsymbols.py | grep "sound.*Kconfig" -B 1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: uniphier: drop selecting non-existing SND_SOC_UNIPHIER_AIO_DMA
      commit: 49f893253ab43566e34332a969324531fea463f6
[2/2] ASoC: codecs: wcd938x: add SND_SOC_WCD938_SDW to codec list instead
      commit: 2039cc1da4bee1fd0df644e26b28ed769cd32a81

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
