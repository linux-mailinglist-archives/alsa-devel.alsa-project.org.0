Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A6565366
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0E11755;
	Mon,  4 Jul 2022 13:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0E11755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934143;
	bh=PzSQe20vyGgKjj7bh4FY+eUYxZ15YBI0Skb7DjyLz/8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d21YNlkPCyMgIG0noChLZiVZdrCviaIrtk4lBLWBpgCoDczUCY+QWNhhNU2cdwIH2
	 73s/diAd3hZHwDTa/swJy/wArx4cLqpEu/l7kGvXJ+HIWdSIseGhhAnBzg7HoBFpOC
	 7bzv6vqo6e9bXtsBevAa/6y7TIn8AomU8STpPA8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90370F805C5;
	Mon,  4 Jul 2022 13:23:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3240DF80155; Fri,  1 Jul 2022 12:31:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39164F80107
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 12:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39164F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kwBlRyc/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8EBD623F0;
 Fri,  1 Jul 2022 10:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58122C3411E;
 Fri,  1 Jul 2022 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656671480;
 bh=PzSQe20vyGgKjj7bh4FY+eUYxZ15YBI0Skb7DjyLz/8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kwBlRyc/+7zHK/+D1Orop4T33zg2uPrmUjsGkNZAU52FjlKmpsb++xU1wPmV1Sdrw
 k4lB1lGBPqolSXmaVZcNAGFjgST13USJwcNorRHO0OGx/hzi0VABG7ZTo8N7/TuHE2
 HxaECpn986NnZFTn1yzoeBsf+ZI4OSJnoey0UsvUno7oDZ+pMXkeNnXKR1PwQQv7H/
 N9kuWrxo5c2iCitQqKmW068YiY9uPx4FEOea91RPuRZGwW8oY4qU7G4DXYqbe8FC8m
 c/Z3X/cBEeVfPh/ZqshT/s0Jav6xLxcoMGxNTeEs/B5Wuklqf7C6n5RtWyUg6RAJla
 6Gx1v1dJgB63g==
From: Mark Brown <broonie@kernel.org>
To: mail@conchuod.ie, palmer@dabbelt.com, palmer@rivosinc.com,
 lgirdwood@gmail.com, thierry.reding@gmail.com, fancer.lancer@gmail.com,
 daniel.lezcano@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, daniel@ffwll.ch, sam@ravnborg.org, vkoul@kernel.org,
 airlied@linux.ie, Eugeniy.Paltsev@synopsys.com
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
Subject: Re: (subset) [PATCH v3 00/15] Canaan devicetree fixes
Message-Id: <165667147407.1756128.12037224598634241859.b4-ty@kernel.org>
Date: Fri, 01 Jul 2022 11:31:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, conor.dooley@microchip.com, joabreu@synopsys.com,
 geert@linux-m68k.org, paul.walmsley@sifive.com, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, masahiroy@kernel.org, dillon.minfei@gmail.com,
 tglx@linutronix.de
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

On Wed, 29 Jun 2022 19:43:29 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> based boards. To make keeping it that way a little easier, I changed the
> Canaan devicetree Makefile so that it would build all of the devicetrees
> in the directory if SOC_CANAAN.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/15] spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width
        commit: 8b037cabc4966b010c44a76e05a43d276318bc49

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
