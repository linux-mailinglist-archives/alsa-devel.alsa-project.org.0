Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C404B0EEF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 14:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 610331915;
	Thu, 10 Feb 2022 14:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 610331915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644500369;
	bh=gAO3e038tfnaSDdissyBQOdJAZGLYn06il3KVMfenhw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hiBUwF6mcI85X3ywH9+PGcgZyDVFOQlfmYsnS4n+MCEdz5AKcI/OvbpGrHWBkxBbE
	 xCk3NqD1zptNfyllg0y2tg7+efRmpCCn4Qc50PzoIOHrrPeP+l7oKArm/oE/1BBIqN
	 A/WjrGwAKIPci61/ilxlZp0WEJ+el61xxQ76JFrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D09D5F80054;
	Thu, 10 Feb 2022 14:38:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D3E0F8028B; Thu, 10 Feb 2022 14:38:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77D66F80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 14:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D66F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rmlj2+Rg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAE3C611DE;
 Thu, 10 Feb 2022 13:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4006C004E1;
 Thu, 10 Feb 2022 13:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644500294;
 bh=gAO3e038tfnaSDdissyBQOdJAZGLYn06il3KVMfenhw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rmlj2+Rgua8lTjyMX6K+sKsWM50ahVH2UbEvqxY0RKBdEDu2hI3ljoheDNumnVf2p
 Himx02oVPQ8q1GnvcqGCzdYxmdzQX+g963Wk+MPRVQt5JeaJMC1nZyoaOxbDUWyNdS
 l6vfzGoPBaJSrUPni3Z/BR4BV7tDIvrudwz6/69bajzEerAcndHSkGAhUZxcYaOZV/
 FXdZAN3pVzZlVERx87R2CKIQO0DTATs/sDaN0z49hr33NR4Q4mBjfxXj/AgGyrY2qo
 4KZkZajmHMoOyyukdL/Q6L49Pb79Ag+fM/tQlu6uWwp8HXrgTat06RT3vNtgWJam9r
 EmflE7GyDp/cw==
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220209232520.4017634-1-swboyd@chromium.org>
References: <20220209232520.4017634-1-swboyd@chromium.org>
Subject: Re: [PATCH] ASoC: qcom: Actually clear DMA interrupt register for HDMI
Message-Id: <164450029256.1000223.6826935774856204278.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 13:38:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-kernel@vger.kernel.org
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

On Wed, 9 Feb 2022 15:25:20 -0800, Stephen Boyd wrote:
> In commit da0363f7bfd3 ("ASoC: qcom: Fix for DMA interrupt clear reg
> overwriting") we changed regmap_write() to regmap_update_bits() so that
> we can avoid overwriting bits that we didn't intend to modify.
> Unfortunately this change breaks the case where a register is writable
> but not readable, which is exactly how the HDMI irq clear register is
> designed (grep around LPASS_HDMITX_APP_IRQCLEAR_REG to see how it's
> write only). That's because regmap_update_bits() tries to read the
> register from the hardware and if it isn't readable it looks in the
> regmap cache to see what was written there last time to compare against
> what we want to write there. Eventually, we're unable to modify this
> register at all because the bits that we're trying to set are already
> set in the cache.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: qcom: Actually clear DMA interrupt register for HDMI
      commit: c8d251f51ee61df06ee0e419348d8c9160bbfb86

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
