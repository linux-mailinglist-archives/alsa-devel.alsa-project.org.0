Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA9C2E6604
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 17:08:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD51C1747;
	Mon, 28 Dec 2020 17:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD51C1747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609171706;
	bh=mqb+V8KwpniY5OTuAQBPlleqKjClqNjI5EX4LEXBC1s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i0iiFu2N20IKIkQmE1/DTIW0tbrum9JXlPCdSgdqB7yvxak79qIdvNCeqE/PONUBX
	 di33gAppEeU1/J8FWWgxJsCgEltjI1wfxYru8ucTCt9kxIaoeUbHUGtPmBdxklTx2A
	 RPsMDNLSn7mI+hc0gO6XQ13aD0ECMOWmKo+G9GLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61D70F8020B;
	Mon, 28 Dec 2020 17:06:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FE19F801F9; Mon, 28 Dec 2020 17:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95A67F801ED
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 17:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95A67F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YG+9hR2a"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD71720719;
 Mon, 28 Dec 2020 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609171593;
 bh=mqb+V8KwpniY5OTuAQBPlleqKjClqNjI5EX4LEXBC1s=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=YG+9hR2a0eQLdmIwqUt5+j9zwe/xDbB+DHADXmxHsKfP9h0EsYODWYptwZ+C3F3EP
 gv4Q0/d4Ko8GFYpte+01WTZjAYGyZAwMdhykFMFxfsctA4yJs6DpF7Cc3GPqTBwSZm
 0L4apwmL72WJ1Tb2M3pzsgb0X1O8KazpGKHBzoK0YryToyxJ1DPCAmzms59TlPRhcu
 5ekaF5r+N0uQHS9bx3g/Y4nB/1OSXuLSnF3wBm7VenOtY5wGfSFzCC7BFCniYtelir
 /iMa161BbjEBNkcl+gQh7SsuLIJtdcnV/L5SBqWxfgfX/yd9/fiy8YLon701DUBXXM
 1XYDVYY/E5dbQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20201208111805.6989-1-andriy.shevchenko@linux.intel.com>
References: <20201208111805.6989-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] ASoC: sprd: Switch to use list_entry_is_head() helper
Message-Id: <160917143257.51553.9711078590395339738.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:03:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 8 Dec 2020 13:18:05 +0200, Andy Shevchenko wrote:
> Since we got list_entry_is_head() helper in the generic header,
> we may switch driver to use it. This eliminates the need
> in additional variable.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sprd: Switch to use list_entry_is_head() helper
      commit: 57fc2bbc62ef9d505e8732acbae0d6b5c59836cd

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
