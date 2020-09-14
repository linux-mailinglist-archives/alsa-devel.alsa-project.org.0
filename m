Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CE4268E97
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 16:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7796F168C;
	Mon, 14 Sep 2020 16:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7796F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600095464;
	bh=cZBt/BYXGb7XMmjCUMxtBhCxEA94mJlipi9mDTE83sM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nmNvcDWRoTSCGMhyW8Mucsw02sSpQ53GgJs34Fyao0C3X7l80rKMDWMwLNsDJ4uN8
	 mGT2PuOLKD9P7mQe+0uYbHBM3PmyYIuaM+Pu384hxZKXLP1ckxi0FcxTYtlYDFZQyV
	 PBQUgifH4JmeIg2YcCcAJr1QGppdo27RvhzBwve0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B163DF80307;
	Mon, 14 Sep 2020 16:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE02F802F7; Mon, 14 Sep 2020 16:52:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2501EF802F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 16:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2501EF802F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d5ifTqJK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EDC6206BE;
 Mon, 14 Sep 2020 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600095148;
 bh=cZBt/BYXGb7XMmjCUMxtBhCxEA94mJlipi9mDTE83sM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=d5ifTqJKTWvyHHbPZgIuvbmo2IFAAh3lnZuFAlkurNs9YbM6I3b7TYOxxRQkq0ylv
 jdXALa300eyOYZ2JtdoC/atrHX17vYwScCc9mQ6nEvHYXz7N4LisLUG6vOMcaUwfpu
 oI0clGmmToM2VuztaBRIfu5ZELNJTeE2KWQl/nzw=
Date: Mon, 14 Sep 2020 15:51:40 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, baijiaju1990@163.com, Tuo Li <tuoli96@outlook.com>,
 lgirdwood@gmail.com, tiwai@suse.com, heiko@sntech.de, islituo@163.com
In-Reply-To: <TY2PR04MB4029799E60A5BCAAD5B7B5BBB8280@TY2PR04MB4029.apcprd04.prod.outlook.com>
References: <TY2PR04MB4029799E60A5BCAAD5B7B5BBB8280@TY2PR04MB4029.apcprd04.prod.outlook.com>
Subject: Re: [PATCH] ALSA: rockchip_i2s: fix a possible divide-by-zero bug in
 rockchip_i2s_hw_params()
Message-Id: <160009506912.439.250974884973031810.b4-ty@kernel.org>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, 7 Sep 2020 21:09:37 +0800, Tuo Li wrote:
> The variable bclk_rate is checked in:
>   if (bclk_rate && mclk_rate % bclk_rate)
> 
> This indicates that bclk_rate can be zero.
> If so, a divide-by-zero bug will occur:
>   div_bclk = mclk_rate / bclk_rate;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ALSA: rockchip_i2s: fix a possible divide-by-zero bug in rockchip_i2s_hw_params()
      commit: 375e2c352582442783178e6a33c279d6bc9354a2

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
