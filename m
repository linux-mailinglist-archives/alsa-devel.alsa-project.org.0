Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6C2E6695
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 17:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C39C1769;
	Mon, 28 Dec 2020 17:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C39C1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609172100;
	bh=Z8T/Po4tMN4CTn8FJ8JWegI7Mxk6hGinFt2fHJN8fRk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQU/lug7SGTO7aVJaMWP24eCZIJRoe1HWijzCG+YdhdM+jZRslZmj3V7QKDqRyAq+
	 lNxfPc/ClL9rp1wqHcC3IXQ9Nx9Y0xx/PW6B5SgK2kNYRx07XIdrQ2eVW1aB+ud4zL
	 Sx59SEpimCf5HGfJTJ+2HJ8VsPu4KUSyLNXrOJWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1CAF80143;
	Mon, 28 Dec 2020 17:13:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B63F80229; Mon, 28 Dec 2020 17:13:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70706F801F5
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 17:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70706F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uUgmPbKW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21868207FB;
 Mon, 28 Dec 2020 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609171996;
 bh=Z8T/Po4tMN4CTn8FJ8JWegI7Mxk6hGinFt2fHJN8fRk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uUgmPbKW4yKDrV9EqjAJPfqG595zeJTbVf9KtqsrAI8ax5IHOWu2YmTz+9SFD+GVO
 1wEyXKA1+bdfii/BuvAsMb0UXcrXKkE4m230qCsbbJM/+yheBPSkWVbB430iISeLiY
 H4Rv0NrnsGJjM4hXnI40uHcUeDY0WNdBmN4/CEbC622TAOeVK/su2H3LPqrnEIrPXi
 AlIjbJTSMt+QrOgdFEReYNbwlqumhE3ApCG0fAnJQP6Lz4TNo1xOgbfgfB04tK2VfK
 t1MvLl2Zn5NUd9Fr7oLMIsRnK8Y0wPvDIS6BjwlpOjZadarC7xpEWM51gcnIWFuXZ0
 Nb8cwrSkaywMg==
From: Mark Brown <broonie@kernel.org>
To: ALSA development <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20201227164109.269973-1-perex@perex.cz>
References: <20201227164109.269973-1-perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad
 X395
Message-Id: <160917197015.51862.16189401548597294110.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:12:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, stable@kernel.org
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

On Sun, 27 Dec 2020 17:41:09 +0100, Jaroslav Kysela wrote:
> The ThinkPad X395 latop does not have the internal digital
> microphone connected to the AMD's ACP bridge, but it's advertised
> via BIOS. The internal microphone is connected to the HDA codec.
> 
> Use DMI to block the microphone PCM device for this platform.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad X395
      commit: 1f092d1c8819679d78a7d9c62a46d4939d217a9d

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
