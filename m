Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CC447B891
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A264173E;
	Tue, 21 Dec 2021 03:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A264173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055111;
	bh=9FyG3W5ip2zv6ci01ldf1DOdvGhwMGzdqpxjmFLSxxw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LlPtiCr1HkLJYYZDBiAoSJ2QZsh0083tnVRTtt2ARmHzw4s3lqK/Z9YLLg6eoDPNV
	 xP2/u3i4TQvsJOzqn+sYUHSxmRWt2nsuNKwAphUBp1+vfSGDRzty9Ds4cDjY/h7rFr
	 Ibg5FbSIUN/Mh0I7OfowiB4/gRZ+EjIp/Ym8xGwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D05F80125;
	Tue, 21 Dec 2021 03:50:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7085EF800E3; Tue, 21 Dec 2021 03:50:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8D10F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8D10F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="drh8QKpz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8945F61365;
 Tue, 21 Dec 2021 02:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F9BC36AE8;
 Tue, 21 Dec 2021 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055036;
 bh=9FyG3W5ip2zv6ci01ldf1DOdvGhwMGzdqpxjmFLSxxw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=drh8QKpzxuAT25mPaCSbOhqZK7c8+1M02Rvw3TLmlMOzg1ARUcZ9T/J8XxiYRiW03
 IDmixepuqCaZX7Ufo5qYKU7qrr/XjLS27l3+y+h0fUe6IQcPXpdCDIls8Qx7Cr8qr6
 5apcwzda1wtxxvt9JthZU3PWxA70TgOGaanGHi0owlBOW3qVydPON77ZbGBO4XZ03Z
 3Q4vG3kIdqJEgFSrDIhakR9JDo4mJ/Kyr4TZnvfTGOqvhLt8cDVRZNvFl2KN+nm+Li
 rDxCLMwnaL/f6B0NUvtKw2W5NV30I8HuwI7FUKTVTqoSQ6LDz7ZeMVVQdRSdQz5bcD
 j4UtzYi6E/bbw==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
In-Reply-To: <20211216022424.28470-1-trevor.wu@mediatek.com>
References: <20211216022424.28470-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: correct default value
Message-Id: <164005503431.2647762.14895672771692403341.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, 16 Dec 2021 10:24:24 +0800, Trevor Wu wrote:
> mt8195_cg_patch is used to reset the default value of audio cg, so the
> register value could be consistent with CCF reference count.
> Nevertheless, AUDIO_TOP_CON1[1:0] is used to control an internal mux,
> and it's expected to keep the default value 0.
> 
> This patch corrects the default value in case an unexpected behavior
> happens in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt8195: correct default value
      commit: 30e693ee82d20361f2caacca3b68c79e1a7cb16c

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
