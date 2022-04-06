Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA6B4F6008
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC0D1720;
	Wed,  6 Apr 2022 15:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC0D1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649251912;
	bh=HlOW/rtcooRbC/awUJEDc/IhUFjAooRRWlUwyIeWzk0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8nOm1AuLK8q0F0j0yHGy3j/wl5ieHBu0/AALpy/tROon6m87YfG0mrRSaUs+u0Dw
	 Y3PSxC/TqXGZqoC5CcNhyppG/aIVNo7HPahan9nyrxmqsjzahVHpDVueOfffXeW1Nj
	 eJO++oGBg2r2o7Bk5rkUZDejxlsFlarVQMLz5fWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19493F80538;
	Wed,  6 Apr 2022 15:29:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BFFAF80528; Wed,  6 Apr 2022 15:28:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0C8AF80525
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0C8AF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AlbjvL82"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2907D615B1;
 Wed,  6 Apr 2022 13:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7329CC385A1;
 Wed,  6 Apr 2022 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251732;
 bh=HlOW/rtcooRbC/awUJEDc/IhUFjAooRRWlUwyIeWzk0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AlbjvL82cmQ3T9Y795YHAd/6YC1Dw9MkbRoVaRz7zzJJJPZsh/b10LMIwRWxrQ3jG
 O/I8MhrZpH8c70e9OQKoIBX0fgoCy2TQIegLQSwo3cdaE2zyVQSEGsXYbTV0Q5ZFXp
 AJgDWdkhsUOdWmJ0uiB74asWDoKTYuzOM+e4epnJ6wsO+vg6MwM8hGTC27zno0ShN+
 tjqTisRyehuF5ys/MmLB0BYeMXrPd1xomDcTrUsFtm9gStSl9TGUum4U+necRmv367
 fMuyLvhBQbbMfPsJ+Bwh9bIi4QCZXJISG4JEaFrY8Q/VpOfc47XxyQTUMDaVmzeLtL
 02yHYm5qsjpPA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, narmstrong@baylibre.com, khilman@baylibre.com,
 perex@perex.cz, jbrunet@baylibre.com, lgirdwood@gmail.com,
 hkallweit1@gmail.com, martin.blumenstingl@googlemail.com
In-Reply-To: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory
 error
Message-Id: <164925173019.83821.614218458873558335.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 9 Mar 2022 21:20:01 +0100, Heiner Kallweit wrote:
> On a S905W-based system I get the following error:
> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
> 
> Turned out that multiple components having the same name triggers this
> error in soc_init_component_debugfs(). The proposed solution allows
> other drivers to adopt the same approach with minimal effort.
> With the patch the error is gone and that's the debugfs entries.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core: add debugfs_prefix member to snd_soc_component_driver
      commit: d462f6ed2aeac30c0b440a91fb05d964956935f9
[2/2] ASoC: meson: aiu: fix duplicate debugfs directory error
      commit: 89bac792faf03fae5a9564bebfaacab53a029932

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
