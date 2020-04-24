Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6186D1B7211
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 12:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F362D16A0;
	Fri, 24 Apr 2020 12:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F362D16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587724398;
	bh=h66Ml5FnOsOSWU6lMS3uLnKawUO+JUEIXmAgQhGYYbI=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvATBao3EEw7OLjvVjWhbQAUI9gV+bEkKEnwN+qrnRhsMszWie25rgyX71e8jYvBo
	 rC6gfYvLMNIToTJlWFjGTHMHIcw3V0y+iafw0w7QURlHf2Kk2xqZBkgjtS696TW33U
	 7nfKpclZlRPZi1TQUluTzXAk0xnDCoWx0YzIBf8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15002F800BE;
	Fri, 24 Apr 2020 12:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 540C5F80142; Fri, 24 Apr 2020 12:31:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5394F800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 12:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5394F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iPEubyNK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE6722071E;
 Fri, 24 Apr 2020 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587724282;
 bh=h66Ml5FnOsOSWU6lMS3uLnKawUO+JUEIXmAgQhGYYbI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=iPEubyNKFt0g7XIDtD7BIoymS6NCtN+DD747wgEWgF+cfYeYd1t6wh2B37G6Tlsni
 YyFxwMKh8JP9LtstkVzcy1x0b3PE3q8c4Nm6v1MZJzmxAt4KF2mKpfijSm/rEbovdc
 vj7YXG0cCEqssjx4gLYfN4Mc1EK8UX2OqUf+d53o=
Date: Fri, 24 Apr 2020 11:31:19 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, alsa-devel@alsa-project.org, tglx@linutronix.de,
 allison@lohutok.net, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, info@metux.net
In-Reply-To: <6d25d5b36d4b9aeb8655b5e947dad52214e34177.1587693523.git.shengjiu.wang@nxp.com>
References: <6d25d5b36d4b9aeb8655b5e947dad52214e34177.1587693523.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8962: set CLOCKING2 as non-volatile register
Message-Id: <158772427980.54572.3910251949812603149.b4-ty@kernel.org>
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

On Fri, 24 Apr 2020 10:01:38 +0800, Shengjiu Wang wrote:
> Previously CLOCKING2 is set as a volatile register, but cause
> issue at suspend & resume, that some bits of CLOCKING2 is not
> restored at resume, for example SYSCLK_SRC bits, then the output
> clock is wrong.
> 
> The volatile property is caused by CLASSD_CLK_DIV bits,
> which are controlled by the chip itself. But the datasheet
> claims these are read only and protected by the security key,
> and they are not read by the driver at all.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: wm8962: set CLOCKING2 as non-volatile register
      commit: c38b608504aa1ad8bfa00d85abd61cffad57f27f

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
