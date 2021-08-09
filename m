Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC703E4954
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 17:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD3C1686;
	Mon,  9 Aug 2021 17:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD3C1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628524606;
	bh=vcdfpziR404S9Inxgldn37afl9+I3dbup99eK9aqxGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X5dycb3c3JNVfMLB80OuARsEL4EQYGrH58c9OAAHmW5hycwajOH5t+JDqUHHuD52m
	 gcP+muNhkGCg16wvMU85nPNVcKT4gQtufz0iLDImgqwU0Tyj34Ft+wo4oLD0MEtYFo
	 o7SEmS8CAi6WhFgiGD4ArqKucdyo0cWXT88P/9JY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 870E4F804B4;
	Mon,  9 Aug 2021 17:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA179F804C3; Mon,  9 Aug 2021 17:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5B31F800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 17:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B31F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZNhK56xU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 585C161040;
 Mon,  9 Aug 2021 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628524496;
 bh=vcdfpziR404S9Inxgldn37afl9+I3dbup99eK9aqxGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZNhK56xUZLtUfoniWZUVjzUT91PTJeFQugmf6HM4iT3EcyaJweL7JIqkzRS4cDohB
 MAK2gigZ58SQ1tPT2yAWNLc6pg4KHpImDVAnhkKR7MssVjlgbBsCJ5FV36mKWSbHIe
 MnO7kSgVeDkcs8YCd5pN8xfNOCzPpj8ZNDRbqoLeOEJ2P1ZQLWnNUbxcAV441Z3jQu
 97D/1eVQE8ieQsXURdwdb8dUda82TvM+KVhZeKEq0gdrVza7BQABaqqP0Y1h4UCbjq
 rW3fjSKU5LA5xDEZxDiaa56Ra2e53/mEwAhRDeEczKs6uFvU8JorYiZA1zKMyc25Am
 dhhN8G96dwWiQ==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org,
	Jack Yu <jack.yu@realtek.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: rt1015p: add new compatible id
Date: Mon,  9 Aug 2021 16:54:34 +0100
Message-Id: <162852418088.21716.5893582085716795538.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ce9e2f298f0c4fc59f756c39736a297a@realtek.com>
References: <ce9e2f298f0c4fc59f756c39736a297a@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de,
 =?UTF-8?q?kent=5Fchen=20=40=20realtek=20=2E=20com=20=5B=E9=99=B3=E5=BB=BA=E5=AE=8F=5D?=
 <kent_chen@realtek.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Derek=20=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>,
 =?UTF-8?q?Shuming=20=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

On Mon, 9 Aug 2021 10:27:14 +0000, Jack Yu wrote:
> Add new compatible ID for rt1015p in dt-bindings document.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: dt-bindings: rt1015p: add new compatible id
      commit: 064478e4877c76b0c1fd1155934f226f1561aab3

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
