Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE82F1AF5
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 17:31:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 677F21731;
	Mon, 11 Jan 2021 17:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 677F21731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610382663;
	bh=DxCU3KTWi4TR+plfEQqeb91xnsxQqrV47FrVpoqwwbs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uf9bqvk+2zomcNb7B7I7mMfXBoLZtz+hL/W2tfg2Uwu7ik/9z1i5M2gVTm7xzeyxy
	 q0t8vhJRZC7iA9KPH1xdfgRHHYr7MVUWCi4tCEHB91kdqOw7OymBc9eKJALkXWQXfM
	 iGZxh20n7je090NDWwvHl5EEb+kd6vbYSToWshfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE4D0F804CB;
	Mon, 11 Jan 2021 17:28:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BD56F804C2; Mon, 11 Jan 2021 17:28:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A168EF8013D
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 17:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A168EF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lPZKKfF0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9772223E4;
 Mon, 11 Jan 2021 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610382508;
 bh=DxCU3KTWi4TR+plfEQqeb91xnsxQqrV47FrVpoqwwbs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lPZKKfF0suyd1EFM0Bnjrl5Nh2cp7JUIfhoMR9cLowrflq/aKBivmgx59U7vVpFJI
 rfoHxil6MZjRjxI0Pn+0MPOmbIarkziSXRQoU/3vnRgeAm3Hh7InJLLhHkICBlVkK6
 mABh7FhvJyYZWpQrx5eFyg8ONdzUE0hJC4p6ZaANKkbbuG73aWNu1YRK1+HeSbZMj+
 vJbFNTOhAC9f8wpRRSlquYNm9d2x7FGi7+62HuIMQjNKjCiytT74R5a8Bw29BlBOff
 KxovRzplV7y9sQE3t0dmZ+Ly6JSQxOylzqC0gV9Xz9lhL4vdGdYnnkDXx81jBpl8cV
 iMS7a70cx7mAA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, lgirdwood@gmail.com, tiwai@suse.com,
 Souptick Joarder <jrdr.linux@gmail.com>
In-Reply-To: <1610163901-5523-1-git-send-email-jrdr.linux@gmail.com>
References: <1610163901-5523-1-git-send-email-jrdr.linux@gmail.com>
Subject: Re: [PATCH] ASoC: soc-pcm: return correct -ERRNO in failure path
Message-Id: <161038245912.32701.902192524271148760.b4-ty@kernel.org>
Date: Mon, 11 Jan 2021 16:27:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sat, 9 Jan 2021 09:15:01 +0530, Souptick Joarder wrote:
> Kernel test robot throws below error ->
> 
> sound/soc/soc-pcm.c:2523 dpcm_run_update_startup() error: uninitialized
> symbol 'ret'.
> 
> Initializing ret = 0 and returning correct -ERRNO in failure path.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: return correct -ERRNO in failure path
      commit: 4eeed5f40354735c4e68e71904db528ed19c9cbb

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
