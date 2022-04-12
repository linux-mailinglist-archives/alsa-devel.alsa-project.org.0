Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104594FE760
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 19:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A030018D1;
	Tue, 12 Apr 2022 19:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A030018D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649785219;
	bh=VsiW3CuUG+R7QVT9cZrUKPYiW2B49SVijz2OAHaLQF4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ch/ynYBYFczr4vWOoHkjRifin/aPMu0Pb4l/itHeQyhUcYhvn6KcxsuGMADLRyU9M
	 4O4PQyXRI2v2/GymgHqHrgRlSgBu6tJfxcdRuGLm67FWJej575ylwJ3kPN7X++VsRX
	 uk9Ihwhq+goXaztnHOpIvGNNwF62JRMnfu/kJRYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06513F80511;
	Tue, 12 Apr 2022 19:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BD69F80526; Tue, 12 Apr 2022 19:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 214F5F80511
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 19:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 214F5F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BveF8bkv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A86FB81F5A;
 Tue, 12 Apr 2022 17:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F5EC385A1;
 Tue, 12 Apr 2022 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649785099;
 bh=VsiW3CuUG+R7QVT9cZrUKPYiW2B49SVijz2OAHaLQF4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BveF8bkvE+lr22QTXpRwLJ6STY4ghFnr6cz1scbsP+oqFS4cxL0HVhKTwKEgvFY9Y
 iwU5I9ZrxspDXCMdZpGGzcCpTRXa8FJgYMoYJLPvvQ9kjCw6hcjn7Um00F6YMz50RE
 JzQzdRX6OHI6MKNS8yMhk2BdYvCcB+BsnxBGCh4lTE3TTJMnc2tv5keysKjTkD4xLS
 L1vbHdDFnxpfs46Hx6v6DWkf5Lv/CHEBcknYuOxXfUPGhmLh5kfSoKDK/km7KRNbCV
 D9tWF3Y7P5ySdMo+Rj9CbKUFWGnfdFLfwr5JkqcwKzBHLKMYhu6fmecLxNoO7h0mfG
 h/0m56u9a37Ig==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com
In-Reply-To: <20220411165929.1302333-1-rf@opensource.cirrus.com>
References: <20220411165929.1302333-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l45: Make exports namespaced
Message-Id: <164978509825.404572.4732190389821838906.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 18:38:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Mon, 11 Apr 2022 17:59:29 +0100, Richard Fitzgerald wrote:
> Use the new EXPORT_SYMBOL_NS_GPL() for exports from the set of
> drivers for cs35l45.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l45: Make exports namespaced
      commit: 31c90dd56ae2945ce46ffa9728d1e1502f5a0c2e

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
