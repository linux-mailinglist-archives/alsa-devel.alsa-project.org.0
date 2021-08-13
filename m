Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B53EBB78
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 19:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68AB1878;
	Fri, 13 Aug 2021 19:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68AB1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628875697;
	bh=aOqBmh5sZWNm3xPDNpYuAmOxdQby4H5RHJySluzbP5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+uXETWgWQdDRkggVdoo2pcCuhqYtY4Y79YYAIxF5PYQBea8/7z5T36GNggW64ckb
	 RXnMrmJ1sJfWOMTB7LaPFVcXq9Sa++IRd7ny+fpeB6xgimAMJ/xTCZaK3T2oEvJsy9
	 eoiAqyXiRE3qvV5pX24MJiXdrv4XJLoKoZTUDzm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E590EF804B4;
	Fri, 13 Aug 2021 19:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D80F804BB; Fri, 13 Aug 2021 19:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D566AF800AF
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 19:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D566AF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fWsazR2N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BD0D60FC3;
 Fri, 13 Aug 2021 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628875590;
 bh=aOqBmh5sZWNm3xPDNpYuAmOxdQby4H5RHJySluzbP5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fWsazR2NAX1xidpKZN7MEQv9wH2vt03JKbTAz7XXy3fLrHBYA7nBD18r+ydeYhJv/
 HBiuMIx5K2viPzMRl8iTGt0lfbtaDUcrDzwCws+Qalq5189PIRhClu68R3zrWpCtNx
 8pxIifoLCVCQ7139bAnJ24ALaBrhE4LMzhDVH690GsKcJ2X7btNtTSTsAG6HCrxtE9
 bdUMLh54csiyk+m38cTkJh6aKYu0gih1n2H3g5JEHF2mKDduqFZtw3ahKWSZDMkIf1
 NivepE3Hjg4caSAhRKxcIogmcxROFEPvfQBXQsbt8tfL0m8ROYJDAU4DwqRO8DZhwB
 g/PWza4uVTN+w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 0/3] Add RZ/G2L Sound support
Date: Fri, 13 Aug 2021 18:26:02 +0100
Message-Id: <162887455324.19744.6771563830810696575.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
References: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Mark Brown <broonie@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das@bp.renesas.com>
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

On Fri, 13 Aug 2021 10:11:53 +0100, Biju Das wrote:
> This patch series aims to add ASoC support on RZ/G2L SoC's.
> 
> It is based on the work done by Chris Brandt for RZ/A ASoC driver.
> 
> v4->v5
>  * Moved validation of sample bits in hw_params
>  * Removed validation of frame bits as it is redundant
>  * split the rz_ssi_start_stop function into rz_ssi_start and rz_ssi_stop.
>  * remove the spin_lock around rz_ssi_stream_init.
>  * Updated dmas description and removed fixes as it is an enhancement
>    now.
>  * updated ssi_start functions with setting fifo thresholds
>    and ssi_stop function with cancel all dma txn.
> v3->v4:
>  * Updated the subject line as per style for the subsystem.
>  * Removed select SND_SIMPLE_CARD from Kconfig
>  * Added C++ comments for copyright and driver description.
>  * Moved validation of channels in hw_params
>  * removed asm issue reported by bot as well as Mark
>  * replaced master/slave macros with provider/consumer macros
>  * Improved locking and added more null pointer checks.
> v2->v3:
>  * Fixed the dependency on KCONFIG
>  * Merged the binding patch with dma feature added
>  * Updated dt binding example with encoded #dma-cells value.
>  * Improved Error handling in probe function
>  * Removed the passing legacy channel configuration parameters from
>    dmaengine_slave_config function
>  * started using dma_request_chan instead of deprecated
>    dma_request_slave_channel
>  * Removed SoC dtsi and config patches from this series. Will send it later.
> v1->v2:
>  * Rebased to latest rc kernel
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: sh: Add RZ/G2L SSIF-2 driver
      commit: 03e786bd43410fa93e5d2459f7a43e90ff0ae801
[2/3] ASoC: dt-bindings: renesas,rz-ssi: Update slave dma channel configuration parameter
      commit: bed0b1c1e88a27b76c74584128cadebc6fa58622
[3/3] ASoC: sh: rz-ssi: Add SSI DMAC support
      commit: 26ac471c5354583cf4fe0e42537a2c6b84d6d74e

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
