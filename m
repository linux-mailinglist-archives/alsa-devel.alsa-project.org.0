Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146E91C59B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 20:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02ECC231C;
	Fri, 28 Jun 2024 20:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02ECC231C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719599077;
	bh=PSU3tdTo76FLPP7xiWLKc41rwOiwu52i+9dzvpqpwII=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RwgIYy85NqXPIIS9WRf6m/JWzGoRTACnz0r4Pc2tAyQhZjme1Lgjddk3rXnxfgpcP
	 tePXNN2qtx5rw654qEdAhvUmvg4zy25LfNoZ8icECStH47tUK0gzTnCFCeTevWqwrZ
	 +4YJ7ABaOSP5LO/i/QMWtfbX9Cy3TNkFJaPIidxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D56DF805B2; Fri, 28 Jun 2024 20:24:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59004F8049C;
	Fri, 28 Jun 2024 20:24:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F36F80423; Fri, 28 Jun 2024 20:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A62E5F8013D
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 20:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A62E5F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZdyI0W+n
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52FDCCE4250;
	Fri, 28 Jun 2024 18:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72894C116B1;
	Fri, 28 Jun 2024 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719599023;
	bh=PSU3tdTo76FLPP7xiWLKc41rwOiwu52i+9dzvpqpwII=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZdyI0W+nmqUJCWipPdNf4cmBtY+rypYDwx+itWdMspkZMxFXGqTXLiqwqj+P/L2HW
	 ayxR9qnJXpys3ydRLPfokVQx98MOeqM03nKa/ytsBexikuA9liqDpHV1OfVVALU+tE
	 f7Fj4nqi4PEUTPns+yPNM8egQuCOh0Ovv/wpOD+UZ/8SlcGE22Ghaiomf6798XikSx
	 0fgHRjbt7tZT77y95s6ou8xunrmc2rYTHBH4XJGA+fSkOoEi4YpexqWOIht15+aPX7
	 D00T9WThNkC2oKuTUBzvB83od0XpV7aqlLaIS7DCv64svIp/Io9uTUPLn1flWW5vhe
	 Y1c3dtBmP4QfA==
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Corentin Labbe <clabbe@baylibre.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Subject: Re: (subset) [Patch v5 00/12] Add audio support for LPC32XX CPUs
Message-Id: <171959901719.141669.17001815513243855671.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 19:23:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: X4QAIZP7GXWRCWOJV6XW2GONGASE7Q2C
X-Message-ID-Hash: X4QAIZP7GXWRCWOJV6XW2GONGASE7Q2C
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4QAIZP7GXWRCWOJV6XW2GONGASE7Q2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jun 2024 17:00:18 +0200, Piotr Wojtaszczyk wrote:
> This pach set is to bring back audio to machines with a LPC32XX CPU.
> The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
> The support was dropped due to lack of interest from mainaeners.
> 
> Piotr Wojtaszczyk (12):
>   dt-bindings: dma: pl08x: Add dma-cells description
>   dt-bindings: dma: Add lpc32xx DMA mux binding
>   ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
>   ARM: dts: lpc32xx: Use simple-mfd for clock control block
>   ARM: dts: lpc32xx: Add missing dma properties
>   ARM: dts: lpc32xx: Add missing i2s properties
>   clk: lpc32xx: initialize regmap using parent syscon
>   dmaengine: Add dma router for pl08x in LPC32XX SoC
>   ARM: lpc32xx: Remove pl08x platform data in favor for device tree
>   mtd: rawnand: lpx32xx: Request DMA channels using DT entries
>   ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
>   i2x: pnx: Fix potential deadlock warning from del_timer_sync() call in
>     isr
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[03/12] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
        commit: 752fea92d9b3e4255a2f75e7efa6fe148562ccbf
[11/12] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
        commit: 0959de657a10cc40b2cc41cff9169ab0e0fd4456

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

