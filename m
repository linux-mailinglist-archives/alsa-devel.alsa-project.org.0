Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C12B5525
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 00:38:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E81E171F;
	Tue, 17 Nov 2020 00:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E81E171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605569881;
	bh=lG8vjtafSwJlzpTe4ZWzO3xTe2KC9KSe1kymL1F6xJo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBh6RGEfI1bLXspQrG/BNlzhIrWzFwtTfuainWRfsz/rBoiMjBM4ADh9HLX5oYchW
	 kOlggXNlKZhMfWrxGz7wJspyqPRufRK9TyomrDY0aLVHkcsVMQPllxYscA5XCHBke0
	 xarffOACutF6595pE77oPf/QDcuadMjlZuEt9/6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1BEAF804F2;
	Tue, 17 Nov 2020 00:33:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC2FDF804FD; Tue, 17 Nov 2020 00:33:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE3CF804F2
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 00:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE3CF804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JlvKzOhl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7491822280;
 Mon, 16 Nov 2020 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569630;
 bh=lG8vjtafSwJlzpTe4ZWzO3xTe2KC9KSe1kymL1F6xJo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JlvKzOhlcrAT+uQ0LdSTp/rSUQoUXnPxaf0cJ3Bqu40UHuJVjP8qQpoMkmuwF3Q4f
 sla8xzK9k705EWOb6rMqXtHlYAwVmFXSFv1kGdT0WuVJWxoOQRn2EoA00j6E3QZy05
 SQSalKDIKfH3CXMc85AXKBnZBwByPKw7jXvo2YGU=
Date: Mon, 16 Nov 2020 23:33:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20201116172423.546855-1-jbrunet@baylibre.com>
References: <20201116172423.546855-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: fix COMPILE_TEST error
Message-Id: <160556956525.29683.11005029623520003708.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>
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

On Mon, 16 Nov 2020 18:24:23 +0100, Jerome Brunet wrote:
> When compiled with CONFIG_HAVE_CLK, the kernel need to get provider for the
> clock API. This is usually selected by the platform and the sound drivers
> should not really care about this. However COMPILE_TEST is special and the
> platform required may not have been selected, leading to this type of
> error:
> 
> > aiu-encoder-spdif.c:(.text+0x3a0): undefined reference to `clk_set_parent'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: fix COMPILE_TEST error
      commit: 299fe9937dbd1a4d9a1da6a2b6f222298534ca57

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
