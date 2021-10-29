Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4143FEDF
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 17:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B224316EF;
	Fri, 29 Oct 2021 17:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B224316EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635519653;
	bh=mEBIcswgw9632dRuDbJzbqAYM5AZU2vSGumheCQp2Ro=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mgAwvlDcwvaK57VX6gGkBQCiiDbDcmv2wI2U3U/UmUSCdri0jHhuRhmRiht8n56tP
	 yhu9Jz9bmVMAGUOC56asXQ5GeTbO0IoEblXzpIwDrkrotDMXT1c5qo84O3Ig8q7ZHw
	 eWgAOfRaL8YtOyKJyAhMkp8vSpA6n8mGchqsCDDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA2EF800D1;
	Fri, 29 Oct 2021 16:59:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9146FF8025E; Fri, 29 Oct 2021 16:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A45D1F800F4
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 16:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A45D1F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KmcYAvjH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E69261184;
 Fri, 29 Oct 2021 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635519543;
 bh=mEBIcswgw9632dRuDbJzbqAYM5AZU2vSGumheCQp2Ro=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KmcYAvjHh68pAorsLxOts9w9lIiC0cES+aC7xR+/bdRa2d1oxoZSbQL6skMh0lVX+
 wqSgXHyc32CziuAP4T9p/VStKo7ceiO9K4Sy+6qvnlcr0ThbfZ6wpZBaGbqzw/aR37
 Z2IBMEACAUyCoeO9w/xdoT7i+wbTqOMq9aRJs0g4TvuKZcYYm0ishvWJkKX2UopdLV
 b8kfvvHMrvIrwf0Ip8R+01By2OH7eRhE38q2acOlU0vUdhzgtTA9RezwN+YTfWjjpR
 LU0omWqDbZzY7qgLEBR9T6HUgkH6tQPdOmpuq4esqxcn5169G4u6fmVqXWngCdmc2T
 ZGbG2AoMyIslQ==
From: Mark Brown <broonie@kernel.org>
To: trevor.wu@mediatek.com, arnd@arndb.de, perex@perex.cz,
 matthias.bgg@gmail.com, tzungbi@google.com, tiwai@suse.com,
 jiaxin.yu@mediatek.com, Julian Braha <julianbraha@gmail.com>,
 lgirdwood@gmail.com
In-Reply-To: <20211029001225.27218-1-julianbraha@gmail.com>
References: <20211029001225.27218-1-julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: fix unmet dependencies on GPIOLIB for
 SND_SOC_RT1015P
Message-Id: <163551954099.3555751.4265484307853649135.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 15:59:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 fazilyildiran@gmail.com, linux-arm-kernel@lists.infradead.org,
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

On Thu, 28 Oct 2021 20:12:25 -0400, Julian Braha wrote:
> When SND_SOC_MT8192_MT6359_RT1015_RT5682,
> SND_SOC_MT8192_MT6359_RT1015_RT5682,
> SND_SOC_MT8183_DA7219_MAX98357A, or
> SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A is selected,
> and GPIOLIB is not selected, Kbuild gives the following
> warnings, respectively:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fix unmet dependencies on GPIOLIB for SND_SOC_RT1015P
      commit: 2554877e4b08d258c2def27e3a0fd49d60a9a2c0

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
