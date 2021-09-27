Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F3419DA5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C5CB16DA;
	Mon, 27 Sep 2021 19:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C5CB16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765331;
	bh=fo8UtX1qyDCUjoGqUbYWVlsvzl89Asms03FvPG0QBhE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nGa/Z2tCVnmSyVbgRftDHaPTPqO1jzVLPsot2iSXUtqKE8WK9P4VNY7BNRx/g3upZ
	 wsFYi39GxZvPrRgtjDjyfbf03Thc/M9ULGVX9K3sOQTWr5LJUYQx+zPDB/ejAe/sC8
	 MAa9X+QIml5D/IgmCnlBXtI+/2wtI+LGq9S2gk+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0DAF80588;
	Mon, 27 Sep 2021 19:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5709F80571; Mon, 27 Sep 2021 19:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE81FF8055C
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE81FF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QF8cOCMz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5DDA60F9B;
 Mon, 27 Sep 2021 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764880;
 bh=fo8UtX1qyDCUjoGqUbYWVlsvzl89Asms03FvPG0QBhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QF8cOCMzsi2AMYyy+h5gbgELrmdrEf0RHShbnEusBbThEX2IOu4PYuVtSm/Rp4fyQ
 I7JR5DYZYOy6std6liN79mx9+BsBqWrD5XyCI5Sy1nzCX6bxoe50pNrUR0TlVz2spo
 bQ5A3z7AWXyVSY7bQHS94teMUmc5IGqu9FEjalN6217ut/mah6wo63f7AZd/lxtbr3
 IZplnbwqLXzf2f+BJL8NS/RT1mLIG02hX0rMHfmNszaO0o0D0aaLMr385eTix1aBTB
 XipA4KzyMbOiNkzwRk44kuY28OU0Epou96nbdPdrLK77rq3Jo+Qd6EkXaTfk8gmbaW
 T+7m2jD9JYI7A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Banajit Goswami <bgoswami@codeaurora.org>
Subject: Re: [PATCH] ASoC: wcd9335: Use correct version to initialize Class H
Date: Mon, 27 Sep 2021 18:45:45 +0100
Message-Id: <163276442024.18200.12102853821778377525.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210925022339.786296-1-y.oudjana@protonmail.com>
References: <20210925022339.786296-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Sat, 25 Sep 2021 02:24:19 +0000, Yassine Oudjana wrote:
> The versioning scheme was changed in an earlier patch, which caused the version
> being used to initialize WCD9335 to be interpreted as if it was WCD937X, which
> changed code paths causing broken headphones output. Pass WCD9335 instead of
> WCD9335_VERSION_2_0 to wcd_clsh_ctrl_alloc to fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd9335: Use correct version to initialize Class H
      commit: a270bd9abdc3cd04ec194f1f3164823cbb5a905c

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
