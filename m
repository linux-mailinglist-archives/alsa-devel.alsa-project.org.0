Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD793DBEB4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 21:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 023B920A7;
	Fri, 30 Jul 2021 21:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 023B920A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627671945;
	bh=TY2LPGRIJuK2iU0iLZqPl0A+ea1bC5iQxu9ZtLUwNlw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9gI+59z2xYCdMXiKNn7WnKmPbHsZsoq0ZlBUY7UJgvvauClYdwfIJPJPAZqbKYdU
	 n7pn1bAYiH2/k5fX6sQKprSY68YZ2MrJ8VRpgtRFlL8Zu8EXAt6rKCBe6vZxR/oCHU
	 Lavfp0jpkv8jmrIlSLGA1VXHGPzd3pkH82cfNkDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4945AF8049E;
	Fri, 30 Jul 2021 21:04:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57DE1F800E9; Fri, 30 Jul 2021 21:04:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B369BF800E9
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 21:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B369BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cAcpwMVK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53FC460F4B;
 Fri, 30 Jul 2021 19:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627671834;
 bh=TY2LPGRIJuK2iU0iLZqPl0A+ea1bC5iQxu9ZtLUwNlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cAcpwMVK0WZxSzC/hvdozHI94g7pHd8cCU+eJpe3BmeEKpvAwr5XJcKgk2SLwXKDk
 x84uuNJOiSv/HMBlNsIoF67uoO/COILvG8jPr8dVCCE6ac99CQ66DNaNIaEkbtV9OK
 8ZtT/SQJSfXdCo2gN+vv7QR4nOGvfwTBtoYoeqTEhbfiCjU7c+Vn0foSzmMx8BCULk
 Ge35HQkqjzm8XHSdxH5yrjSxlL+4VG5eHqydhge61hrydNmUPwNvE6sp11/ZhP+Qda
 jwNoMc0hTXqfNQubKC4CgPy9ZLjjcHYCxGQYyg6+yNuR+CfRSvbJqrdqwG7QW61yDr
 I8H2Yck5IqvEg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/5] ASoC: amd: Fix reference to PCM buffer address
Date: Fri, 30 Jul 2021 20:03:35 +0100
Message-Id: <162767143673.56427.5656341194627198116.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728112353.6675-2-tiwai@suse.de>
References: <20210728112353.6675-1-tiwai@suse.de>
 <20210728112353.6675-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
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

On Wed, 28 Jul 2021 13:23:49 +0200, Takashi Iwai wrote:
> PCM buffers might be allocated dynamically when the buffer
> preallocation failed or a larger buffer is requested, and it's not
> guaranteed that substream->dma_buffer points to the actually used
> buffer.  The driver needs to refer to substream->runtime->dma_addr
> instead for the buffer address.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: Fix reference to PCM buffer address
      (no commit info)
[2/5] ASoC: intel: atom: Fix reference to PCM buffer address
      commit: 2e6b836312a477d647a7920b56810a5a25f6c856
[3/5] ASoC: xilinx: Fix reference to PCM buffer address
      commit: 42bc62c9f1d3d4880bdc27acb5ab4784209bb0b0
[4/5] ASoC: uniphier: Fix reference to PCM buffer address
      commit: 827f3164aaa579eee6fd50c6654861d54f282a11
[5/5] ASoC: kirkwood: Fix reference to PCM buffer address
      commit: bb6a40fc5a830cae45ddd5cd6cfa151b008522ed

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
