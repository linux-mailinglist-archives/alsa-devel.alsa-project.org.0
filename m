Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91B3AA1BB
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 18:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB58116E3;
	Wed, 16 Jun 2021 18:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB58116E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623861903;
	bh=0Mnrn59mHPvGQI0AIZ/aQUlxSoDlnuliHsET8yMkHxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBs5EnHAkqVm6+MfgVftP76Gh6hJ4RlXHknQxYWdHfdfNuDv9I7fjK+TPC110hgJg
	 ahSXCV8FWmjCJi54Lf8jAPGXRiafawNGgYukexwH/6M05hzTTGXFmZW53uVG9o5t4/
	 2dXxqeKU6QohNqvlqlpxPIYF9HR4CrG3A47ZIA28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F75F804E5;
	Wed, 16 Jun 2021 18:42:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43EB0F804D1; Wed, 16 Jun 2021 18:42:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95094F804C3
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 18:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95094F804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O/2S8uCz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61D6A61019;
 Wed, 16 Jun 2021 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623861715;
 bh=0Mnrn59mHPvGQI0AIZ/aQUlxSoDlnuliHsET8yMkHxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O/2S8uCzHS2QWAd7s3Wly9w7Wujm9rMqp8X78fRCXgFC9j7Ej0ZfAZLKP6YNa6MdN
 Vyc98UEUO4ZaojB83B1rVOhjrDvG2rbVtMivFJtFm5sXZZ9Vl/dtSvakPjVuO2RkL0
 FmhG6aAtbOnw/Iooxr35sPZ0Ecg2wTK+gDHpJCuxxKI2I/rDmn3cWu7I+Kpjjqmtq1
 0AGKH+NWuY7uUYDnlZtwQJ+Kh+nd8OP3DKrIANF+mNaPbb7n7EzS6BN5bF589zOUue
 CNFEwEBj4FtkPw24xjF5rHzeq5bYtK6CR23G3ZYGNEMc0Vwex+/oQVcD3Bc3XuR2D1
 w9rvN74sUQewQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next 1/3] ASoC: rockchip: i2s: Use
 devm_platform_get_and_ioremap_resource()
Date: Wed, 16 Jun 2021 17:41:17 +0100
Message-Id: <162386001971.25644.14560050609437971056.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615141502.1683686-1-yangyingliang@huawei.com>
References: <20210615141502.1683686-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

On Tue, 15 Jun 2021 22:15:00 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rockchip: i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 4ffbcd4ab0b6f77d29acde69dc25bd95318fae5e
[2/3] ASoC: rockchip: pdm: Use devm_platform_get_and_ioremap_resource()
      commit: db4d6d2e6472a5a49801bb5f2c1bd96ed6ffa3d1
[3/3] ASoC: rockchip: spdif: Use devm_platform_get_and_ioremap_resource()
      commit: 3325b1515a92fc07ec16b4d33c8bccc0a83f12ca

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
