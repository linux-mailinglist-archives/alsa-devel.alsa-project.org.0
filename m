Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 115752115F8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADB5E169B;
	Thu,  2 Jul 2020 00:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADB5E169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642372;
	bh=OFrydZJeoFPPEIsSLHrZKo0VwyTkGxBPs8O02wurO8c=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENH7tnkjqhgi/e0lfXtVkI4y2d72ttVMRR4zg6QtpkKew31yHlcghwcMiRCgS0eGj
	 iYOuy1zhfBvX/6p8QHWbnlf0dXFxxnl6YdvVe2gg0gaC1d0fPfnkl6Ggmfku4CRZf+
	 qFxFI/qlr4sUydyV2tAuSi1mFQO1jr1tPgXEza64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED4AF802DC;
	Thu,  2 Jul 2020 00:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C763F802DF; Thu,  2 Jul 2020 00:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D303F802DB
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D303F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GZmWkYxO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FECC20780;
 Wed,  1 Jul 2020 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642173;
 bh=OFrydZJeoFPPEIsSLHrZKo0VwyTkGxBPs8O02wurO8c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GZmWkYxOPzNNwVuxMoom4aqXVWovfXQu5bh8J4JDJXzgKkCGB4x2B/cruDd3rb6vZ
 xnwKuwmSM6EhpXr62i0t+39R4R8UXTplPBFXdE33qXlH3/OFzBeXTNL+2al91kXXH8
 W0YzNqLrr9zyF0wdf0ojuL+uoUnTuE/7ZIoykru0=
Date: Wed, 01 Jul 2020 23:22:50 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yu-Hsuan Hsu <yuhsuan@chromium.org>
In-Reply-To: <20200630091615.4020059-1-yuhsuan@chromium.org>
References: <20200630091615.4020059-1-yuhsuan@chromium.org>
Subject: Re: [PATCH] ASoC: rockchip: add format and rate constraints on rk3399
Message-Id: <159364215573.10630.1998520137231805857.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Tue, 30 Jun 2020 17:16:15 +0800, Yu-Hsuan Hsu wrote:
> S8 and S24 formats does not work on this machine driver so force to use
> S16_LE instead.
> 
> In addition, add constraint to limit the max value of rate because the
> rate higher than 96000(172000, 192000) is not stable either.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: add format and rate constraints on rk3399
      commit: 1eb96c198aff13162de4857e19f9488d59c4acb1

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
