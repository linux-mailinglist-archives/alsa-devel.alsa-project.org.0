Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DE786115
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 21:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F402A847;
	Wed, 23 Aug 2023 21:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F402A847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692820557;
	bh=3BXs+jmGfRUvLPCNF0fDwwzaEF8pVwCZrH829bm0Kew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PTLNwy3101ClqsZ9VQW97m+CBpaiX42g51hjUySuyel61G06/xYH/gYvg16isBodz
	 BTx8/VNn14BumSDABZH1i422b7yp0TubaPcJthr882OLfr50pp6epWPjIsyZIolqx9
	 DYVFaCXGb6zn6bxqN4PWWDiiJInRsipLb8rNNM3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDF44F8055B; Wed, 23 Aug 2023 21:54:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38125F80549;
	Wed, 23 Aug 2023 21:54:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6E79F80552; Wed, 23 Aug 2023 21:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D7CCF800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 21:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7CCF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OAKJrwAl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A341663B1;
	Wed, 23 Aug 2023 19:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42180C433C9;
	Wed, 23 Aug 2023 19:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692820451;
	bh=3BXs+jmGfRUvLPCNF0fDwwzaEF8pVwCZrH829bm0Kew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OAKJrwAlS/gLuUkE4X9F5RAUBilBnnGnk/ewUI94zRnebGNp2469Jryfw0s3M+2aZ
	 7/8ROIvEAd/gC5uVzkOH92jLlomxPrqYfwOVqRLOmG53ljnFe5NGnjxQsYkAqdAFIs
	 nLsJVZATA5n8Edq+6u5JgnncHNxiogTu0GuWNom6Bl0Q8MwY3yBTX4dCr9HHeK6/ll
	 qqdpjkhwnADy5auD+gGkEF9typ6Vs3Jdgl+OoSEkx1R4urPPVj2tttlnktt41WRTaJ
	 2Kjm+t6fJn33DFzlfawZurcmaJCXbXKfq3aArzRiUDSJyy0Hwc7b3qSy+sBnDYT5Nk
	 cIFQFhYefzOWQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
Subject: Re: (subset) [PATCH v2 0/5] Add I2S support for the StarFive
 JH7110 SoC
Message-Id: <169282044586.176026.15255891850559347673.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 20:54:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 3KA3CIWVQ7QFGRTCJO47QDH2CUBJZAXE
X-Message-ID-Hash: 3KA3CIWVQ7QFGRTCJO47QDH2CUBJZAXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KA3CIWVQ7QFGRTCJO47QDH2CUBJZAXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Aug 2023 22:41:46 +0800, Xingyu Wu wrote:
> This patch series adds I2S support for the StarFive JH7110 RISC-V
> SoC based on Designware I2S controller. There has three I2S channels
> (RX/TX0/TX1) on the JH7110 SoC, one of which is for record(RX) and
> two for playback(TX).
> 
> The first patch adds support for the StarFive JH7110 SoC in the
> Designware I2S bindings.
> The second patch adds the ops to get data from platform bus in the
> I2S driver.
> The third patch adds support for the StarFive JH7110 SoC in
> the Designware I2S driver.
> The fourth patch fixes the name of I2STX1 pinmux.
> The last patch adds device node of I2S RX/TX0/TX1 in JH7110 dts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC support
      commit: 206110c74c4af6772916acacae5f28993085bf18
[2/5] ASoC: dwc: Use ops to get platform data
      commit: d6d6c513f5d2d14651336fb4e30f097822b46f29
[3/5] ASoC: dwc: i2s: Add StarFive JH7110 SoC support
      commit: 52ea7c0543f8a39da8a6fc17a5ab36b7b58d5431

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

