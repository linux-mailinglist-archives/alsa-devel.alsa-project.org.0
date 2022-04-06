Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1354F6005
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBCB61740;
	Wed,  6 Apr 2022 15:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBCB61740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649251881;
	bh=wrlDarUYr+POHLopISxa2klaErhzsz1GFbTKgE4YGMQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=og8cMtRGazLJlgkgMTE4rIxOTw1P7avJtzJY4UcG5eyLcl1eQQVDG35Dft+ridqSq
	 6swwMMOh5sJCep8wOq5KlyIzfiE68y7Yx0nv49ligvHcJp4taeupSiQ263Bnxa85v6
	 uEVYl6riU59iX9oCRYzABJ4OFzmstIgt9soGjDHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C48F80533;
	Wed,  6 Apr 2022 15:28:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91C64F80520; Wed,  6 Apr 2022 15:28:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E853F8051B
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E853F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hptvgCYb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 43049CE2399;
 Wed,  6 Apr 2022 13:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EC5C385A7;
 Wed,  6 Apr 2022 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251725;
 bh=wrlDarUYr+POHLopISxa2klaErhzsz1GFbTKgE4YGMQ=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=hptvgCYbXfPVMNu4m4jzXX5XKLZ+8spVqUxqesj7+kKljTkTZXRdUMBGSiO4IwHAS
 uev6Ca/DMhcBHB7QvdZW6dTp9SZbU0M6bjfPH3rNgfyFbuBDRJcR/7TEXbIcR08i2B
 tdSQWEGfbUSPwUUZRZa3IcACiZBcvpoUKlf10Gy3jlQzVcVTKktXvyrR/dT0+T17P2
 Vir6B6DzJEfeK6XicRH+xjKF2bGwp1lZVvSqmAJ3YkoIrdtFFczsJ3mm9JUFU24f2w
 7iYNoZqGzpkcV64hUuo6iFUJBdZC6KpujTdOGIpynnRKqooIOAYTarQQiJfweOy6eF
 RDIalhj67V7EQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, colin.king@intel.com, tiwai@suse.com,
 weiyongjun1@huawei.com, jiapeng.chong@linux.alibaba.com, linmq006@gmail.com,
 frattaroli.nicolas@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 perex@perex.cz, lee.jones@linaro.org, macromorgan@hotmail.com
In-Reply-To: <20220404090753.17940-1-linmq006@gmail.com>
References: <20220404090753.17940-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: rk817: Use devm_clk_get() in rk817_platform_probe
Message-Id: <164925172314.83821.3548187523065750918.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:43 +0100
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

On Mon, 4 Apr 2022 09:07:46 +0000, Miaoqian Lin wrote:
> We need to call clk_put() to undo clk_get() in the error path.
> Use devm_clk_get() to obtain a reference to the clock, It has
> the benefit that clk_put() is no longer required.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rk817: Use devm_clk_get() in rk817_platform_probe
      commit: 8ba08d3a367a70f707b7c5d53ad92b98b960ee88

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
