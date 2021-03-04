Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE732C56D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 01:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016E519FD;
	Thu,  4 Mar 2021 01:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016E519FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819564;
	bh=J50c6MSt4szRnHViANGO4o4su8hX114G43wCQDJVhz0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOXpI8IVVrgVAS+ypJyDxMY+nCUHRujdWNeJCqsRravFnPiWQFCatRKoG7gH8VG30
	 fFmW0tlpK0DwGR9ibAu0nEhhKQxFQgg1NMIH/3hBEfujf8w5aFOnJ5uSP2DYELkk/B
	 m+O59TLjRuaX+p54MXPkHDIbhzx3SUNrE9eXlN/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A65F804CF;
	Thu,  4 Mar 2021 01:55:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4029BF804C1; Thu,  4 Mar 2021 01:55:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB4C3F804AF
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB4C3F804AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TlXEuVYi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBAD664E99;
 Thu,  4 Mar 2021 00:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819348;
 bh=J50c6MSt4szRnHViANGO4o4su8hX114G43wCQDJVhz0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TlXEuVYiLV3zoIljPwRVd8uikAbUzeWiSjOvUf6w8Uj9q8IKdd5gQ3zrwlUS/YrQ1
 UnUljVk+NI5VdbrH5omCzobkpii98txBtp1bTtypWdfeKpnJ033HykIHm7HiyMKhPa
 kyX08d3n/fan8pPvhVvk14I57a2Bplm94qCt+gDRudf5iq3JF+wQIKZPZQpiBaJFEN
 D4gCtRRPdBYe1WGpnFtOoG3GuuuhprLHd0b12aPlTKEkOkvcFZhUjFEBtB96AYeCWD
 bG0N2B53nGTZBaA1MBVlWeXmgvZ8jat+cv0JkeWl+Y5edlXa1T1Rjjq4KjQm64rgCk
 5S2JBnbP0Yyfw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <1614762481-102466-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1614762481-102466-1-git-send-email-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] SoC: codecs: fix platform_no_drv_owner.cocci warnings
Message-Id: <161481924070.9553.6743190852417137735.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com
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

On Wed, 3 Mar 2021 17:08:01 +0800, Yang Li wrote:
> ./sound/soc/codecs/lpass-rx-macro.c:3588:3-8: No need to set .owner here.
> The core will do it.
> 
> Remove .owner field if calls are used which set it automatically

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] SoC: codecs: fix platform_no_drv_owner.cocci warnings
      commit: 0ce5d3ac4ffe5c3b2d3ead09692e0bd7ff7487ca

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
