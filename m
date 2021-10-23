Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D20438379
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 13:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB371673;
	Sat, 23 Oct 2021 13:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB371673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634989504;
	bh=Yvlt04UMZo9r9G03SEhseVvENp7wes7fQwwecv9UEPA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HFn66U5jyzrwhO2AgoFW2CwPRrF7gjQ2X2MY50iWsvphOGfpgCvg50ceqZzi+rSHW
	 +v2M66d2LeS0DL2DEELIRq8vBZsKdM030L+uUEj48ay1TgJUual/5Nb0IgrHXRmk24
	 BZTa3tPLct1VvdtRQbKNyaaGQ5oKi1ROJEFdBsGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DC4F801DB;
	Sat, 23 Oct 2021 13:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7FD0F80249; Sat, 23 Oct 2021 13:43:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCCDBF80086
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 13:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCCDBF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NtqYuzB1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 173E860F46;
 Sat, 23 Oct 2021 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634989390;
 bh=Yvlt04UMZo9r9G03SEhseVvENp7wes7fQwwecv9UEPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NtqYuzB10yjdrgBHxR1eky3iUFsvQBe5VmO0YSh6VagOql//MHx0LVaal0QdroL92
 mJ706Sv0mFheW9Kq/mkpbHGbMjdbcuh4rmp8N6XT+I7s4n457sRRYZZ8wA7n5Txovf
 Yn6rd0E7mW73K/xTDu7IWglpHDG7nMJvKfPizMXA2AbLjuI+X8znvVzsraDSjsAcy7
 9Ja7noE0ofJPwxpOSbZcT8fQKBinraa66fDhFTE37tmHNu123+H5EfV3N7Lmm0Nd2k
 K/76y+TG7vsbaashcBELDvx/Jk5mP9SdBaqJvErxlWA8VKTLtkRl6XhTgOwauPIxIS
 ef6AvYSTnzyBQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Julian Braha <julianbraha@gmail.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: fix unmet dependency on GPIOLIB
Date: Sat, 23 Oct 2021 12:43:07 +0100
Message-Id: <163498938018.2020965.6267176645734620337.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010215627.17869-1-julianbraha@gmail.com>
References: <20211010215627.17869-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: bgoswami@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
 ajitp@codeaurora.org, Mark Brown <broonie@kernel.org>
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

On Sun, 10 Oct 2021 17:56:27 -0400, Julian Braha wrote:
> When SND_SOC_SC7180 or SND_SOC_STORM is selected,
> and GPIOLIB is not selected, Kbuild gives the following
> warning:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]
>   - SND_SOC_SC7180 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && I2C [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fix unmet dependency on GPIOLIB
      commit: 6cace797f1a8d54ecb42a3d327cbc0b231114ed0

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
