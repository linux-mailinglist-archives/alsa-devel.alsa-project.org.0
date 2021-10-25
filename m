Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7CD439BF1
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835B916DF;
	Mon, 25 Oct 2021 18:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835B916DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635180210;
	bh=fF5cSayVIa+Mq3//Y3/uSO0Zcvx9pJtBzmiNBJwGKIw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aSVHyPYGomDoN1oRxw2MzGSNlUPbLc9qzv0rxjnBBAOKuxyAP3ziMhZ0BsYuMwm/Z
	 u+ufCpLefqzUMMoiDsSjJG49bfdk8LOfaWhF2Ar43Z3sSbGMDH8wePF19E6nzkeqNc
	 bq7/LYECc7MOunsf8CBRlKSTxkpCdD++ZATn3ii8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52EE6F80519;
	Mon, 25 Oct 2021 18:40:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94F58F8051A; Mon, 25 Oct 2021 18:40:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F078F80510
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F078F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q/YlcQMj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A6DA60F92;
 Mon, 25 Oct 2021 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635179996;
 bh=fF5cSayVIa+Mq3//Y3/uSO0Zcvx9pJtBzmiNBJwGKIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q/YlcQMjKKhERE3IWcGzFMLjvBy5e2e5bV8/oxn4AgdQDBog+RAL2W2mJkaqD9vhD
 0ATBospMg+U38SaEZi2miHhgMwogH046tmQ3PUxHzsDmPN7gItNeH+ACN92XGB3EA9
 krCbSoAxc9LhLkqDoRRGNf8hPY+94cDv3/sU+yoPetn97oBQYslUxv8yvy4H6/4iL7
 OhueefBfTiWftsKBrTJt7a5pu5M7uj1t65JjMgG+U9IoqxLfpbe3uOKRmANHWnTHjm
 xcHVPRH414b/8vbaY/MYDyiQB8DC/8v4a/ToG15UxKKIV2Ww3z1HuzuXNcLWEOoiLJ
 vdJ0vI1qiGxFw==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: tegra: Restore AC97 support
Date: Mon, 25 Oct 2021 17:39:28 +0100
Message-Id: <163517996155.3558038.6605154852450538832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211024192853.21957-1-digetx@gmail.com>
References: <20211024192853.21957-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Sun, 24 Oct 2021 22:28:52 +0300, Dmitry Osipenko wrote:
> The device-tree of AC97 codecs need to be parsed differently from I2S
> codecs, plus codec device may need to be created. This was missed by the
> patch that unified machine drivers into a single driver, fix it. It should
> restore audio on Toradex Colibri board.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tegra: Restore AC97 support
      commit: de8fc2b0a3f9930f3cbe801d40758bb1d80b0ad8
[2/2] ASoC: tegra: Set default card name for Trimslice
      commit: 824edd866a13db7dbb0d8e26d2142f10271b6460

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
