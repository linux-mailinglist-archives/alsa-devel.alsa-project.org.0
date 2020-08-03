Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30C23A9F6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 17:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6701687;
	Mon,  3 Aug 2020 17:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6701687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596470226;
	bh=vaahV0Wz+3AuoIQ6Tg6OzhNMma9CyEZe3Re6JnQhIZQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jFnqTtQXmNXt5W2sp9OthEZmTdL1h8wsULV4HeAyVpCxRIEN4WxUGfZ3BYZdoEY8q
	 s1Pd2642CT7LuBwz04QL2LANzbRShTr4XU4gewqOO/aDe6eSa8nGvd6ju7HHHr+/3Z
	 DPJJlvs1dBd6ZJDtoDo5GNGQhzFdSEaoJOKrgDOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E08F802E8;
	Mon,  3 Aug 2020 17:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F565F802E8; Mon,  3 Aug 2020 17:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22208F802E0
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 17:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22208F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NdMwz98A"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 302C62072A;
 Mon,  3 Aug 2020 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596469981;
 bh=vaahV0Wz+3AuoIQ6Tg6OzhNMma9CyEZe3Re6JnQhIZQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=NdMwz98AZajS+0yfKz5XoMj0rDzI8WQ8hTIQFFG8KGz7wg0H6uLRmi7Og6kRnceOg
 z/TO5UKoiaJEW2oapz+Sh0a/6qTHOmXg6We3CdzTL6PW6f7cGP19WhZH654LBCNshc
 8+7bj1FgnHce8O4B9OR3e1R7+FQblo+Ajol2aXGE=
Date: Mon, 03 Aug 2020 16:52:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20200803141850.23713-1-tiwai@suse.de>
References: <20200803141850.23713-1-tiwai@suse.de>
Subject: Re: [PATCH 0/5] ASoC: tegra: Fix compile warning with CONFIG_PM=n
Message-Id: <159646994088.2524.15602026432264005105.b4-ty@kernel.org>
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
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

On Mon, 3 Aug 2020 16:18:45 +0200, Takashi Iwai wrote:
> this is a trivial patch set to add the missing __maybe_unused for
> covering the compile warnings with CONFIG_PM=n.
> 
> 
> Takashi
> 
> ===
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: tegra: tegra186_dspk: Fix compile warning with CONFIG_PM=n
      commit: b191f01a3756f8d5d0b92bad0a07dac7e373d8be
[2/5] ASoC: tegra: tegra210_admaif: Fix compile warning with CONFIG_PM=n
      commit: 1337f2c5f104c84d5a943b2eb644db3eaf4a64e0
[3/5] ASoC: tegra: tegra210_ahub: Fix compile warning with CONFIG_PM=n
      commit: fafac559604bd2e74f5f6febd58682df3738cdd9
[4/5] ASoC: tegra: tegra210_dmic: Fix compile warning with CONFIG_PM=n
      commit: 7543f16a04465db95e83e8409e246f49f35c874a
[5/5] ASoC: tegra: tegra210_i2s: Fix compile warning with CONFIG_PM=n
      commit: 823279c374669a15a139a29b891dc0d7460262c6

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
