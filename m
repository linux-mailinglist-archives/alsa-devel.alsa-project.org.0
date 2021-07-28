Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB63D9977
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 01:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3F861F73;
	Thu, 29 Jul 2021 01:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3F861F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627515068;
	bh=jKs2vwb9o0xiN7GQKe677wZ1TLjF+DReuPPA1627SKg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jE5ZAp//x81sbCLBYtfPD9RoWaivS/fRJFk2IU8tlFmtMlvxL+VrWUp0uLfpExB26
	 UOs57q5hLIf/sLVrpsH4z0Nti5JQHfTooOeubRGJstciNaOVvY8V7RoUy7nFhjTND4
	 yavAPdBsfhuE9NAVdy6GZNWmmq4Sn3V+SaonYUPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D241F804E3;
	Thu, 29 Jul 2021 01:29:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FA43F80212; Thu, 29 Jul 2021 01:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3DB4F80127
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 01:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3DB4F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fCz5915o"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5392F61039;
 Wed, 28 Jul 2021 23:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627514895;
 bh=jKs2vwb9o0xiN7GQKe677wZ1TLjF+DReuPPA1627SKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fCz5915orU5hvygX87AGjmlSVI++7uSL3g0dV5MZ57maKXHPG/DcF6vQKy+ZlDZbv
 4+KT16bFNpGYkT9c9wuAunMVQORbcmeKaVhSJ+ephy/vpAoznDnqx6/OKZzAcage2j
 Irt0soX1fLgTHAm2tKVOtX06dsUZVa5JblABwo9pDDxfzSmXT2WQxEAYm/BpHP/0kG
 kwmuhaqmdcPVRpiwsCcFYwkVrReAOzaAo9GDNIOSjzZ4N9vKME2ivSiSFzPcLQzVDt
 qJCVpnEKPDBcrxSSULYYpQdyCMm3djFGHjAT4jYhxvgTJnaJXK06s+Cb6kQbNFQwmF
 c+9ipdflznJ0g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] MAINTAINERS: Add sound devicetree bindings for Wolfson
 Micro devices
Date: Thu, 29 Jul 2021 00:27:54 +0100
Message-Id: <162751391068.10122.4445316157453147618.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727164948.4308-1-rf@opensource.cirrus.com>
References: <20210727164948.4308-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Tue, 27 Jul 2021 17:49:48 +0100, Richard Fitzgerald wrote:
> Include all wm* sound bindings in the section for Wolfson Micro
> drivers. This section already includes the actual driver source
> files.
> 
> Also update the existing entry to match all wlf,* sound bindings.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: Add sound devicetree bindings for Wolfson Micro devices
      commit: 830b69f6c059bc46451e7c4be8b796d483acb0bd

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
