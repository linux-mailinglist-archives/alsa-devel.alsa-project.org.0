Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454DC512503
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF5C11630;
	Thu, 28 Apr 2022 00:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF5C11630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097150;
	bh=779XAAml1P7LYYjmSE8qDzdFvoLhDHfypjKmhQlkb18=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rgzzhAskUvYYT87MqZlO5hHf/ZKUe5kKP65IsgMERLWl7uyrhMujex9iCj5bw7kQ5
	 CLIyKZAXiIdVeYsMZaqS5qvmQejytyYdhtg9GoHIpMjh/L99Z1+u/MIkvG7VSHQeAY
	 KdnOKLRzqgmxaO0c8/n/qc9vQNvhvu1FFtj/HFcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40AD8F80537;
	Thu, 28 Apr 2022 00:02:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CFA1F80526; Thu, 28 Apr 2022 00:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC22F80526
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC22F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nvj3vMOy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2442F61E13;
 Wed, 27 Apr 2022 22:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BB7C385AE;
 Wed, 27 Apr 2022 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096969;
 bh=779XAAml1P7LYYjmSE8qDzdFvoLhDHfypjKmhQlkb18=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Nvj3vMOyHdOu/t8NlZgWt1JFNpHE3hwPq1nCzT3c4ctQNsJzomK2FAkGdWqOQGjfr
 ITdn56I/7ckabcgWlh6/2VpyhGLkkhFu/jcf+JiIb0NIgrQjkdDDyVJarEfZ42cdFG
 bCxA7sdHb2uYmPKkQhJQE2+hF+FA0af3acLY4rY4kbUk7UALAkK+vqLM8G+r48t7DN
 5luglzoKJ7gpX1jn3hWZzvhCn6DSgj7P1hJzKKK4f+8notzGtSIsHsY3jwAh5d7Eg/
 XPXPRf6a6H9oEkiDCADuP+ghyVcez75cPtmNRdfBCy/cxpY7VsDOwXfs61fMrNkiBA
 z78srTySqhZMg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org
In-Reply-To: <20220426074922.13319-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220426074922.13319-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/3] ASoC: sh: rz-ssi: Trivial fixes
Message-Id: <165109696658.498174.4698247588451201645.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: geert+renesas@glider.be, pavel@denx.de, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, prabhakar.csengg@gmail.com,
 biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp
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

On Tue, 26 Apr 2022 08:49:19 +0100, Lad Prabhakar wrote:
> This patch series aims to fix trivial issues found in rz-ssi driver.
> 
> Cheers,
> Prabhakar
> 
> v1->v2:
> * Updated patch description for patch 1/3
> * Patch 2/3 unchanged
> * For patch 3/3 dropped devers action and instead called
>   rz_ssi_release_dma_channels() in the error path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: sh: rz-ssi: Drop SSIFSR_TDC and SSIFSR_RDC macros
      commit: 17a1fef58c65ec9c9a15dd60386712567ff28d45
[2/3] ASoC: sh: rz-ssi: Propagate error codes returned from platform_get_irq_byname()
      commit: 91686a3984f34df0ab844cdbaa7e4d9621129f5d
[3/3] ASoC: sh: rz-ssi: Release the DMA channels in rz_ssi_probe() error path
      commit: 767e6f26204d3f5406630e86b720d01818b8616d

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
