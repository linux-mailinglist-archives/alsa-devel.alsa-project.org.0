Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE647476075
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 529AD1B12;
	Wed, 15 Dec 2021 19:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 529AD1B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639592154;
	bh=Qb6bAw7Yfc9ExsT/6JSWE8AUnkp9FXA4Nxscx9lbVAc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D9FBZutpSHqW4FCr92GOAasniCn2e4qEhSbymJ//eYKK95d08PYdVYixw6/0rjWWP
	 ScfjdV7S86XoteGG8uPz3EjoTxeGKeeoo3WQ54VwXbQZvf2rAWfd1fD/sMoopQWLPM
	 VUnQuRAKApr0Au59Of6ppb1oKAjIOBSnUoy/Niuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7799CF80238;
	Wed, 15 Dec 2021 19:14:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 638DAF80238; Wed, 15 Dec 2021 19:14:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE72FF800B0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE72FF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b/m6fdRO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FFA06164E;
 Wed, 15 Dec 2021 18:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4193CC36AE0;
 Wed, 15 Dec 2021 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639592044;
 bh=Qb6bAw7Yfc9ExsT/6JSWE8AUnkp9FXA4Nxscx9lbVAc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=b/m6fdROGoRDZ9dZZ5ErnWwO5gN1DTjK4jrqwDidzf+r6gRauKxDaVlmlQrTVQ6x3
 Fzs5w8j8HS6OabcUKAtpmPQrz0NVGIoQxOY0J1+2INW688ZF9b4DAhcMN8ujCd/iv1
 FYCUNM6tMXUXn+cdNVYgnhdfVRFqEJPoKy4x4zaNdSyjw3h+ZFEweUVKu8WgpfTEj2
 NC26IhuT3UmDnEc65mjt9NvdsFZF8fQaRF0BNM39UV4kgx1cmSC3tzrao98a0gjpzl
 iMoEsBtPvm+J+A5uh2msne5ApRiEtBP2AnEotLQd/ANPtt1d0o3et3eop2y7kK7vjO
 VCHiyrCBTOCAQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
References: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: two fixes (for 5.16)
Message-Id: <163959204298.2212554.815832977637183114.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 18:14:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jbrunet@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com
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

On Mon, 6 Dec 2021 22:08:02 +0100, Martin Blumenstingl wrote:
> In this series I am proposing two fixes for the "aiu" driver, used on
> Amlogic Meson8, Meson8b, Meson8m2, GXBB, GXL and GXM SoCs.
> 
> The first patch is the result of me trying to understand the way how
> we get the DMA buffer and address for the audio data. I'm not an expert
> in terms of DMA. From what I understand we need to inform DMA core
> about the limitations of the hardware. In case of AIU it's DMA address
> registers only take 32 bits, so DMA core should be aware of this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/2] ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
      commit: 1bcd326631dc4faa3322d60b4fc45e8b3747993e
[2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s
      commit: ee907afb0c39a41ee74b862882cfe12820c74b98

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
