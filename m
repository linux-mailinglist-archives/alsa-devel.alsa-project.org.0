Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 239133AB6DD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F14517A5;
	Thu, 17 Jun 2021 17:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F14517A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623942253;
	bh=syZJZA6AiFXTfA5Kku0tqi/215ifUvvmL7TjrjU9VjU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btvcWoQZ7kL6rusxJQdlZIOkqKWTcYhkIHXXsdgX4gg8mmS2Pkl/nSR0NI2zTyX1J
	 2jSCJ0mw8YZLsCVXQFlhB6PIj3HKLzaFXgScF10P2a6ChYCKAv94Fy9/sGtG/WbI7a
	 2v96+BP34rdmoBIV4JXvb9LgnMXc3BksRHX3gYig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3DB9F802A9;
	Thu, 17 Jun 2021 17:01:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EB50F8028B; Thu, 17 Jun 2021 17:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92E7AF8025A
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92E7AF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cx3WU0Kd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9029F6113E;
 Thu, 17 Jun 2021 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623942110;
 bh=syZJZA6AiFXTfA5Kku0tqi/215ifUvvmL7TjrjU9VjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cx3WU0KdGMt/U2Y8hhk/VDOEd3hdXveR1n9wgR3io3a0Zn0OebqZZgkdUsY3JinlD
 m4A89dIpspVDIrjlCNgcFZgFt4BM2IWhUOihH80inMR+tbdX/LgLRFiVS4fLzfjExH
 bxuqszWSMzTLXXT2Gf7neO53EK5eMcbgErNPyqs28DARd9i4Q/MjtAsTU+tj8ARCnS
 ODBZPLMqWJG1sGnK925teM75T4eDYiPWGRtBLbprXUbZc2fKAIvIRRL887rHvMJHlU
 1yIH8WwW7q39PXJi+rUu9/lCtjLr1+fACWtyEG3J3Aakx0Ond8QYPoONx+pW6JNsm/
 crfcQlPPOUnBw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH -next 0/3] ASoC: stm32: Use
 devm_platform_get_and_ioremap_resource()
Date: Thu, 17 Jun 2021 16:01:16 +0100
Message-Id: <162394075660.19104.17632705011154431628.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617043847.1113092-1-yangyingliang@huawei.com>
References: <20210617043847.1113092-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, olivier.moysan@foss.st.com
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

On Thu, 17 Jun 2021 12:38:44 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Yang Yingliang (3):
>   ASoC: stm32: i2s: Use devm_platform_get_and_ioremap_resource()
>   ASoC: stm32: sai: Use devm_platform_get_and_ioremap_resource()
>   ASoC: stm32: spdifrx: Use devm_platform_get_and_ioremap_resource()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: stm32: i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 2f1776691978dfab30717548ffec0f3fa4ad0981
[2/3] ASoC: stm32: sai: Use devm_platform_get_and_ioremap_resource()
      commit: 003ee640abaeeaa7d11f931e5bb86bdc4becb594
[3/3] ASoC: stm32: spdifrx: Use devm_platform_get_and_ioremap_resource()
      commit: f3babad47e0db3daec301975b46de5bfadc15dd4

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
