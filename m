Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF981E2770
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 18:48:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B0CD1762;
	Tue, 26 May 2020 18:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B0CD1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590511714;
	bh=XOChMk8gnrUoD6TmiuzV6PPv/YGwIxQm8tqk/nDusow=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AiCy94Und/uoHPms63cIvu3Du352j0KTA3imyQSH79gVCaJz/YB3nn3BoDvZW0Gkm
	 2jWiz+Tn98zWUdWB9TCJoVmGJOR6mjTVygTDmRZk3DOlY68Atd5Pp0c2fbTf0omjtI
	 pH8yJOHbCwNWilNuiaPp7w5UQWmbK4mPqnqZ8tF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F172F8014A;
	Tue, 26 May 2020 18:47:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4580F8028F; Tue, 26 May 2020 18:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D23CF80278
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 18:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D23CF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tcmQUE3r"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2771120787;
 Tue, 26 May 2020 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590511555;
 bh=XOChMk8gnrUoD6TmiuzV6PPv/YGwIxQm8tqk/nDusow=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=tcmQUE3ryk37EbisWbA+aKPXcV4hwxJtkoKRvBtFxt++O2PQuAsURLEhcbL4Bt0gI
 C0fgmYv4qEZZsxMjzGojjwnSQTFd0Y0oIlV122g2vfxKGh4cuS3rBz3N/Ww1pmL2HG
 Qw/EZd+JkCoMY6PEKJpj/kgfaVCV/j70gCAelFlY=
Date: Tue, 26 May 2020 17:45:53 +0100
From: Mark Brown <broonie@kernel.org>
To: kjlu@umn.edu, Dinghao Liu <dinghao.liu@zju.edu.cn>
In-Reply-To: <20200525085848.4227-1-dinghao.liu@zju.edu.cn>
References: <20200525085848.4227-1-dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] [v2] ASoC: ti: Fix runtime PM imbalance in
 omap2_mcbsp_set_clks_src
Message-Id: <159051153752.36309.9642221556598180618.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

On Mon, 25 May 2020 16:58:48 +0800, Dinghao Liu wrote:
> When clk_set_parent() returns an error code, a pairing
> runtime PM usage counter increment is needed to keep the
> counter balanced.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: Fix runtime PM imbalance in omap2_mcbsp_set_clks_src
      commit: c553d290577093553098a56c954e516950c35c59

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
