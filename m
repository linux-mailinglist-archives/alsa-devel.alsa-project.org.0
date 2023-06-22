Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497FD73AC93
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 00:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91CB1839;
	Fri, 23 Jun 2023 00:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91CB1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687473279;
	bh=wP5iYCJHzA+hCBB51KqK3bEREmtRlXHKh26/82qwFDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qjPA4Yp68whpp8uQPQxtyhrOrEPeSDKeNvmPS4eD+nFBahwPfvNxZqmhWhjDPNUBv
	 GFUP6aSaKFBnFEp+odsrFv3FI+jdTb/FGFmQJKxZB7gNuREHimgC6W9ssPPixJHS9u
	 yqsB/umrSVJoyM4p+jjlJTbN1uSjsS/PyQl37gHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5941CF8051E; Fri, 23 Jun 2023 00:33:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C7BF80163;
	Fri, 23 Jun 2023 00:33:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78DA7F80141; Fri, 23 Jun 2023 00:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34421F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 00:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34421F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ssH+p4Ba
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0013561903;
	Thu, 22 Jun 2023 22:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3D2C433C8;
	Thu, 22 Jun 2023 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687473220;
	bh=wP5iYCJHzA+hCBB51KqK3bEREmtRlXHKh26/82qwFDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ssH+p4BaxnsIM0BKtv2UJNG2p5L0vhErzN1IOK6XILmij1WwGEh1ViosLCPKaFOzr
	 dtW7Ca/Sdfb1PzLV0XPv4fb0bExLCFS64R2Wdi2VKHCGa6qyawvN+n88JW4oLRF7+i
	 vP69ZO24fYXHexeWj2TNR8lGPL3703hktTrlMTJ9qdKPEGpEAkCN6vNCr3i6sQSBFu
	 m+IZ5SHfp6qGeDpv89J0Sl54TS4Vuowue8HEKC7HrvuI5hSS5ezjXnvaLd/LX1xK5/
	 x0lYBLgIhwU+l1VA/NAr4GwvvImVaq0ArrV/GBxnPexv+t5RbCH+/kaBPpv6BkHu1v
	 0LkI2DbzYQKOA==
From: Mark Brown <broonie@kernel.org>
To: Yingkun Meng <mengyingkun@loongson.cn>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230622101235.3230941-1-arnd@kernel.org>
References: <20230622101235.3230941-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: loongson: fix address space confusion
Message-Id: <168747321729.318849.3547476102614344468.b4-ty@kernel.org>
Date: Thu, 22 Jun 2023 23:33:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: KJCX6BDZSYMO4CT2REC44CSFZCCMXT3E
X-Message-ID-Hash: KJCX6BDZSYMO4CT2REC44CSFZCCMXT3E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJCX6BDZSYMO4CT2REC44CSFZCCMXT3E/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 Jun 2023 12:12:22 +0200, Arnd Bergmann wrote:
> The i2s driver uses the mapped __iomem address of the FIFO as the DMA
> address for the device. This apparently works on loongarch because of
> the way it handles __iomem pointers as aliases of physical addresses,
> but this is not portable to other architectures and causes a compiler
> warning when dma addresses are not the same size as pointers:
> 
> sound/soc/loongson/loongson_i2s_pci.c: In function 'loongson_i2s_pci_probe':
> sound/soc/loongson/loongson_i2s_pci.c:110:29: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   110 |         tx_data->dev_addr = (dma_addr_t)i2s->reg_base + LS_I2S_TX_DATA;
>       |                             ^
> sound/soc/loongson/loongson_i2s_pci.c:113:29: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   113 |         rx_data->dev_addr = (dma_addr_t)i2s->reg_base + LS_I2S_RX_DATA;
>       |                             ^
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: loongson: fix address space confusion
      commit: 012fa2622e30675f61413485785e708ba02be78b

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

