Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BAC1CF25F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 12:30:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 729A9168D;
	Tue, 12 May 2020 12:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 729A9168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589279407;
	bh=uUUBbP8EaZMPnIIp30nshyT98I1oZwm7gc2V5X55qwM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XC8uSNyqkpffDFOZDC3+xSRM0RYgD8rMLkt7z50t58Nr8S0KUxayzxVyu5zMPJqrk
	 MrHEyHwe8WVShwXTjhvfMI2X6PHgH5Jy0axK5S/xoI7qT/w3+zxBtvwBc98uiZYor4
	 G3axYB3Uk9Znlf/yqvMluKMNr3g1JgZ+85D2z5Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F29F80158;
	Tue, 12 May 2020 12:28:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EF25F8014C; Tue, 12 May 2020 12:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21B20F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 12:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21B20F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gxn8SyvA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79873206A3;
 Tue, 12 May 2020 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589279290;
 bh=uUUBbP8EaZMPnIIp30nshyT98I1oZwm7gc2V5X55qwM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gxn8SyvAfBlFzIgPrZCy4c8NABKRXC2ezSM7qka0kxq/wAqzD6aPu0VACynXnIdQj
 JgwLs8oz7XctyGrHluBZ+gUVaGDEvEYytJGQr7DtByCJE/OdNMwKpXpH/Xj8RAiNhm
 hYyRXQzqX3hexI48WFaiCl81HLS1lcBn2naCGnKo=
Date: Tue, 12 May 2020 11:28:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Yongbo Zhang <giraffesnn123@gmail.com>
In-Reply-To: <20200512093003.28332-1-giraffesnn123@gmail.com>
References: <20200511160731.GA3618@sirena.org.uk>
 <20200512093003.28332-1-giraffesnn123@gmail.com>
Subject: Re: [PATCH v2] SoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-Id: <158927928738.28481.10666315188457403591.b4-ty@kernel.org>
Cc: Chen Li <licheng0822@thundersoft.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Tue, 12 May 2020 17:30:03 +0800, Yongbo Zhang wrote:
> SSI BUSIF buffer is possible to overflow or underflow, especially in a
> hypervisor environment. If there is no interrupt support, it will eventually
> lead to errors in pcm data.
> This patch adds overflow and underflow interrupt support for SSI BUSIF buffer.
> 
> Reported-by: Chen Li <licheng0822@thundersoft.com>
> Signed-off-by: Yongbo Zhang <giraffesnn123@gmail.com>
> Tested-by: Chen Li <licheng0822@thundersoft.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] SoC: rsnd: add interrupt support for SSI BUSIF buffer
      commit: 66c705d07d784fb6b4622c6e47b6acae357472db

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
