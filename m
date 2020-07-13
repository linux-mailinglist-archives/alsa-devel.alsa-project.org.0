Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7DF21DEC2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 19:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3433D1665;
	Mon, 13 Jul 2020 19:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3433D1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594661402;
	bh=mda1KYJa8jMzutT3sFOkf1x3bT2HgB0n+bFgHnA9638=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFXKaHkuUMlIUYkgNlyLPT13X40QD3C6EfHn7RUfyg+ZuHUnbgNct0v9m9JOemVHK
	 OQO9jn3p53jehzawXy1n8yrEIrblQpOwuoVvdo8CdDvTVXT6Ue50n2YcD99Vp03A1m
	 yA6aDSFBzOVTO5AJKoN+EX/X3VncLz67jX0J19mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E832F80116;
	Mon, 13 Jul 2020 19:28:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 109B1F8021D; Mon, 13 Jul 2020 19:28:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EDD7F800B2
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 19:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EDD7F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="obeGCXoX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C86E320663;
 Mon, 13 Jul 2020 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594661286;
 bh=mda1KYJa8jMzutT3sFOkf1x3bT2HgB0n+bFgHnA9638=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=obeGCXoXN6quEH5ACDh21ZkU0lBtu/kT5WLlSmQpiBmCoT4t13GPZ9tBUsBNjmAqT
 cOUhkzz2gpAe4HIy1eV35BNid0Tro44dksgbDgm5i/2k09DLw9UYhJd+eUaq2O4q5A
 MvVn1PO9/zUP6l2fwKCrZ0dltYJ+zBVtqaDNQveg=
Date: Mon, 13 Jul 2020 18:27:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
In-Reply-To: <1594635960-67855-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1594635960-67855-1-git-send-email-sugar.zhang@rock-chips.com>
Subject: Re: [PATCH] ASoC: rockchip: spdif: Handle clk by pm runtime
Message-Id: <159466127771.57184.7108021750802359859.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 13 Jul 2020 18:26:00 +0800, Sugar Zhang wrote:
> This patch handle the clk by pm runtime mechanism to simplify
> the clk management.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: spdif: Handle clk by pm runtime
      commit: f50d67f9eff62f8078fe6e98ede3f4fb1defc361

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
