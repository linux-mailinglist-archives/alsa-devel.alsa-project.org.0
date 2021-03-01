Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989E32954D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:42:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84AF7168B;
	Tue,  2 Mar 2021 00:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84AF7168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642130;
	bh=OXn2w4QvSs25QXj+LXz63ezJThpwuM2Oj696ai6hxcA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2TZnDZQj+sRI6LkY+xITQ10eF5o2e9kBOxGxQA8HsNi91tsNGryoPJVnDjn4BAoO
	 M3g+QHRPGhcrkOFqOH+H8r+vKcIOKR+a2I13FLPh8kE7i25MGF6P16EAuGfynTDQON
	 EwK90+iAhbx3o7No0xeo6lstBQHxvf7TGV2ZiRd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4868F804FE;
	Tue,  2 Mar 2021 00:37:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33523F804FD; Tue,  2 Mar 2021 00:37:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8C99F804FB
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C99F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UYp1xdmG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B82CC6024A;
 Mon,  1 Mar 2021 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641812;
 bh=OXn2w4QvSs25QXj+LXz63ezJThpwuM2Oj696ai6hxcA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UYp1xdmGSKZ+3D5uQyZGl5G9nSV19j5bj9f1ZfeEVuKRY1UabjBYDvN909rKoyFKh
 pWegKe2XY9f/UXrvNzmqjrCZ75UiO3O5bQpdG0c6xnk1ppBpFLYCSNa9dcFpDXHeOK
 J5WGFHRydCNISrJvGvHegvipjn/+cIaRjJIHWHyzc+k+3dbrdj4oCmY3R5bQPb8BCS
 MZQhp6afiMP+PGXD6bLbUYPXerSbdGfyOXKcz6xBw1VFYNrITCebiIB7dHtEtCDFI3
 vrFJ/4zwMLnbfi7YiPR4bm1EUGbDaCTPIifXaRlE67sy19EIUEI7MNwdpofPTNEfeg
 63uWKYj5l26XQ==
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20210223090759.15323-1-shumingf@realtek.com>
References: <20210223090759.15323-1-shumingf@realtek.com>
Subject: Re: [PATCH v3] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
Message-Id: <161464168098.31144.8183811338150364365.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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

On Tue, 23 Feb 2021 17:07:59 +0800, shumingf@realtek.com wrote:
> This is the initial amplifier driver for rt1316 SDCA version.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
      commit: a262057df51370aa17ced7add470851784c345f0

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
