Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CF3AF5B0
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDD031696;
	Mon, 21 Jun 2021 20:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDD031696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624301547;
	bh=/OILYFrNI8JuScLMPbDFllbR2pKC/ijN5T2alXtxSbo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ggye5i8BJwuA0o7PlxNdRRpyE9+6EuCUHEc9JGPzi3aE6b1zdITolndzIsjAxz9gJ
	 k/9HWIzwIKbZJEs71ikgbe5uqLSOxAIylHF9GUo4fQfi0d80cd4Czl2Ox3EXKHqL86
	 m9ERGhgXWncCkvxkp5JinMWkxAvToBkDWYMIy6Mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C068F8051D;
	Mon, 21 Jun 2021 20:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28C80F804E5; Mon, 21 Jun 2021 20:47:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C66A1F804DA
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C66A1F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sy3m5mpO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37B7C61353;
 Mon, 21 Jun 2021 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301239;
 bh=/OILYFrNI8JuScLMPbDFllbR2pKC/ijN5T2alXtxSbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sy3m5mpOG+Bq50cPcVUbpAuPlIwb+Q+vY9yBP80r26VUHZKOcTikj4t+Y/LeAElNH
 YOzGUi+LMQohxt8f1A/mimRX3aXX6Wypf99esEvQ1UGHM0hk07S72+TurhbTvNJkXo
 YRn8VHztouweUnditVvAQDRte2ZIgKVl5SrKOyS9yZnSl+xWO7zGArS2UvXhkIJgiB
 x/l/jIcKZTqDxEr4xRgx21xmmGlDpwbws1lkIovQcRk0M/ZFADOINalUNXlHszjBFE
 UQpyCM7n4lZrlz4YweBaAYCW180zjkvVFQuglSfXMfoYWCKpxUWMrInqbGrkP9FOzd
 ou9awOl8rpYLg==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next 0/4] ASoC: samsung: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 21 Jun 2021 19:46:07 +0100
Message-Id: <162430055264.9224.5838866943547505866.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616091652.2552927-1-yangyingliang@huawei.com>
References: <20210616091652.2552927-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, krzysztof.kozlowski@canonical.com
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

On Wed, 16 Jun 2021 17:16:48 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Yang Yingliang (4):
>   ASoC: samsung: i2s: Use devm_platform_get_and_ioremap_resource()
>   ASoC: samsung: pcm: Use devm_platform_get_and_ioremap_resource()
>   ASoC: samsung: s3c2412-i2s: Use
>     devm_platform_get_and_ioremap_resource()
>   ASoC: samsung: s3c24xx-i2s: Use
>     devm_platform_get_and_ioremap_resource()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: samsung: i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 5eb8262c686509ffb60a5b04ca6ee562f02cbaf5
[2/4] ASoC: samsung: pcm: Use devm_platform_get_and_ioremap_resource()
      commit: c3255553d6b6cd5c8de42d2faa80e1d33401cb3b
[3/4] ASoC: samsung: s3c2412-i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 87a32d00249e6e3c6b1ac020d36136b2cd75fcc8
[4/4] ASoC: samsung: s3c24xx-i2s: Use devm_platform_get_and_ioremap_resource()
      commit: b73cbd7b1c2d477d143c544bdc2b3415bae58a14

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
