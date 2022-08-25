Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D025A10F5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:47:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C487886E;
	Thu, 25 Aug 2022 14:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C487886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661431654;
	bh=ElHYmszbwnSEnunCPdIUSiZIw9jDr1XaG2phyYXOQts=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opvZ4gw9G6soL6fwxWv71WaavTKeqa5sSqAgn6GOfuCUoCc0lXR10VqhGpwiJbLUW
	 uFsnchQ6wPfQW+nPF77/EwZ0awrJuM9FbHkpApjSyqFIbQ+kUFLhHb8fBb4EIcBeC3
	 TLozG2IfGjQOXYtPjA1s+Y6ew2Fkx81OKSXJ0W5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 515F6F80537;
	Thu, 25 Aug 2022 14:45:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A766F800BD; Thu, 25 Aug 2022 14:45:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D934EF800BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 14:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D934EF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NcCCQ6h/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E5D861C01;
 Thu, 25 Aug 2022 12:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6653C433D7;
 Thu, 25 Aug 2022 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661431514;
 bh=ElHYmszbwnSEnunCPdIUSiZIw9jDr1XaG2phyYXOQts=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NcCCQ6h/n3nIxjvQEHGsHGwZTHi7S0oQbaYzgNXgNsxRH8/vR6NQw+xPLU8qaeJ0f
 TwoPbvqXZBmjN92JannXJ5Dv8FmZl4e4YZYmLbdQLmrDeXo0ynbD2fCECqH10eyA/k
 3XXQlTDTpScLdJM0La2gaxbbSMUqHoU749QPqk/Y+o6qGlMarEHtznZN4ydfBpEcB5
 bh1UEqZ49xzInzxr+LHk05C+pWW8H1Ij6Zlx9akJ+qlIraboihP8nfXi8XN7qlqYQ1
 pfgEzRDQQmTNpazM7dmc0GYiOwQSB4fWg9k3HZGZJSTEezFCocUcSKcW6zgYQQ1KI/
 LxblKQD4Q+7fg==
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
In-Reply-To: <20220825101714.81580-1-tommaso.merciai@amarulasolutions.com>
References: <20220825101714.81580-1-tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH] ASoC: max98088: add support for noise gate reg
Message-Id: <166143151246.98448.3045084214547332329.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 13:45:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linuxfancy@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amarula@amarulasolutions.com
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

On Thu, 25 Aug 2022 12:17:13 +0200, Tommaso Merciai wrote:
> Add support for Noise Gate Threshold reg (ANTH reg 0x40 bit 4 to 7)
> 
> References:
>  - https://datasheets.maximintegrated.com/en/ds/MAX98089.pdf, p75
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98088: add support for noise gate reg
      commit: 671d119e75c8dfbf25c1813a167eeb2616c8acd5

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
