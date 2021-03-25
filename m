Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1FA349862
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDF21669;
	Thu, 25 Mar 2021 18:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDF21669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616694007;
	bh=HV/RvIRBIybOa4JZsYULCIUHI4gNjbKCv4QSaa0D7Ng=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FB+C4M6AFg3sRqVE4rOOKtebRIafHwWJMT+8irBllfgRooKSWo4Tf4JfWIykmRj6g
	 wlmAOMONF2ZmlkAREOI7TDVngXWVKnI0PMU/MQ5UaLH16dkSci+/dgbnrkoR2G14Ok
	 oW9wgf++GfZOeWJoluI6J+4Mjcu34svJIQcWtYIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85727F80257;
	Thu, 25 Mar 2021 18:37:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9275DF8028D; Thu, 25 Mar 2021 18:37:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97F0F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97F0F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dpMNRTgH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51B2D61A30;
 Thu, 25 Mar 2021 17:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693858;
 bh=HV/RvIRBIybOa4JZsYULCIUHI4gNjbKCv4QSaa0D7Ng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dpMNRTgHQt3qZnbSJHg/yKrNIewNIJos4kXNOlKyik3uKYlu7hb3AQz2BE9bh6SEW
 vrZBqKn9kmR6JZ9RVukMdlDYB28u2HNWwNZnUEZn1p9TrQN3QV3pYOgDH9jQIIKHG0
 sX3kN46HZjC3mgtR4YRLtpsdq4d9saC2QFh30eDTmLXT0adKKjDymaRWexQ/gwN273
 TzU7rKNw/ABILVrYVtE5X+hL3jiOCW3jVuO5JbH90q8fKUPKDIdiY93BhOF6CcXFPX
 ISZpPPNyg2McKM2t92gQBTK1OkjcUBzufCHonQ6xLLjW8K8i9IDNagyKbN/JgMmxGE
 lmVqIhiL3ydBg==
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt1015: Add bclk detection and dc detection
Date: Thu, 25 Mar 2021 17:37:07 +0000
Message-Id: <161669370549.41585.3723755284285163188.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322055053.31797-1-jack.yu@realtek.com>
References: <20210322055053.31797-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

On Mon, 22 Mar 2021 13:50:53 +0800, Jack Yu wrote:
> Add bclk detection and dc detection before playback.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: Add bclk detection and dc detection
      commit: 9f44673b7af2e776b55b1d15b3a35d8e8eb51331

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
