Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE28419DA6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8CA16DD;
	Mon, 27 Sep 2021 19:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8CA16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765351;
	bh=QRhbO8bX3SmT52uuD9nsgfiMfFfwq/qkLvxpaWorHyc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AmpOwJ4UQ8D+OcRNphyBYZwETE/C4cziCW3+ZzswtM7REGkjcl0aZz1DgsJxUaGyZ
	 6ddP7xltZMcRTHADlgAxvr3BGjtJYjxASWlJTMig+8VsCamBIV+NfSL8/L08QqNaql
	 Z/xvsrRwmU/Ly1WZ9sHrGRMXOLF0c1Z2oYIN6JPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68ACBF80579;
	Mon, 27 Sep 2021 19:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCFB0F80588; Mon, 27 Sep 2021 19:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2AC3F80571
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2AC3F80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cl+Jy8If"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D472560F92;
 Mon, 27 Sep 2021 17:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764883;
 bh=QRhbO8bX3SmT52uuD9nsgfiMfFfwq/qkLvxpaWorHyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cl+Jy8IfnizKX55vjSEeDRigeSmgiHKxvT+EzF8KUfgbjvEI4VJpmaIARLxZHaEqo
 AgdhsK9WMfk+q+KQRb0GJKzbtBOZdDbmyNlIsu8BkSVVMA/pT54ZVkxoMUb9afM5t8
 Bf9IPc+mbopmfFj7n0o4EeprZzQgLk6+h51UCZXhTb5dcN0e5z3+TdT5mVcL8HHdww
 wgjNWdXY/jqBUmj8i4ryIeDsstkLSRl3UVJMzz1V93jzIAiY3rGNk2TI9STiVJPPCt
 AdBblxhc2e72P+4nF+GuoRzwjM2uYZbPLa653Y+ITD/GxyL3XHizG2IubT8QMfXR0g
 ClgeM4JvVX5ZA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: dwc-i2s: Update to modern clocking terminology
Date: Mon, 27 Sep 2021 18:45:46 +0100
Message-Id: <163276442022.18200.14228355146857618179.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921205313.46710-1-broonie@kernel.org>
References: <20210921205313.46710-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 21 Sep 2021 21:53:13 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the dwc-i2s driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc-i2s: Update to modern clocking terminology
      commit: d0900042522345ed51127d787f02e1171e110e27

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
