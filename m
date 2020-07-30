Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AC3233B65
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:31:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE7116A2;
	Fri, 31 Jul 2020 00:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE7116A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148293;
	bh=sICKhXLzYVnqGvQwZXhmh6fb6BgmxZUPgTYnny23kNg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oM0YkxCBu2/AFa/PwF1ht7JReLik3x8L4kbKK0ma8CvPTB2lXvagT8oMgX9q9Fjdx
	 YgKdsf3eLSJuDGQZ8lVhYlXv2+GTxm8jOpF9FgW+GxR8eb9JKGouvUMT+lsLtQTYs8
	 REzI6CBgBN2iC7/XSGyiBlUQDkCpNed8HPoYVWNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 449EEF800C9;
	Fri, 31 Jul 2020 00:28:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C799F8029B; Fri, 31 Jul 2020 00:28:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D519F800C9
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D519F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qijBm0VL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 248F620829;
 Thu, 30 Jul 2020 22:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148086;
 bh=sICKhXLzYVnqGvQwZXhmh6fb6BgmxZUPgTYnny23kNg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qijBm0VLPypL4LAeMcvLFr6igVgdJuQNixjfpLTiuK5Icd0Fo8j47AnBlTOFrf0hb
 RYTmX1x0twdIOneweSjsQ3B5wWOAPMPTM0kN4u77NhamEN2XEK3T+jVJzlmJqOrKwL
 FXincf7FT4F+cIdFViKBwmygPV17HS/v2Gd9hXHg=
Date: Thu, 30 Jul 2020 23:27:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20200717135959.19212-1-festevam@gmail.com>
References: <20200717135959.19212-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
Message-Id: <159614804536.1473.9793339383824600649.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 shengjiu.wang@nxp.com, kuninori.morimoto.gx@renesas.com
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

On Fri, 17 Jul 2020 10:59:59 -0300, Fabio Estevam wrote:
> According to the WM8962 datasheet, there is no register at address 0x200.
> 
> WM8962_GPIO_BASE is just a base address for the GPIO registers and not a
> real register, so remove it from wm8962_readable_register().
> 
> Also, Register 515 (WM8962_GPIO_BASE + 3) does not exist, so skip
> its access.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Do not access WM8962_GPIO_BASE
      commit: 658bb297e3930b90f80c08ddff18b4065b89a132

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
