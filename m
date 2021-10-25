Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1890C439BE6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9643C16D2;
	Mon, 25 Oct 2021 18:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9643C16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635180152;
	bh=ba9GtGPfNtOwMPCt3kSDkLI8frIBBx2rXSzFjOC3Wko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3J3PrVZqmptAbOKNZpU9lTeda4XoIkBfe3yQKiNmC0LTfQqz+pxu2jANyPhTHiT6
	 d3MFoSJUgTHVxoFVmqgSbKn8AYCjBSzqri+ZWPPbPJGfmxdKTzpvZE8bQyp/HPrcAg
	 +QmfJzyLyX5zl+8Zwl+RIxt1RjEtr5waNpnLV244=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BCBF80506;
	Mon, 25 Oct 2021 18:39:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BCFAF804E7; Mon, 25 Oct 2021 18:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BAD9F8027B
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BAD9F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k5Gwqn5l"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3356160F6F;
 Mon, 25 Oct 2021 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635179985;
 bh=ba9GtGPfNtOwMPCt3kSDkLI8frIBBx2rXSzFjOC3Wko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k5Gwqn5lgSAH2matogN3LILhwEg8zK14FLpzvOwMCN1arYUGxiZ77UprXzwG/BEbg
 wqVJx/Ebmpd2zvi+XyfprGtoi0tFXJLu9NePXUi44OjevycnV933IFblW1/e4lLiQL
 C89ge7jwT9TpgLrbuZTXoivVSJddBj5mWlpYh7gbwD23K2P2hZIpgxCRoU5ClDi35Z
 iJehKwwgf8o3qsRDQf0d31Wy6w2z6j4GgnuNBqxUm8t8Qr3BJBRPRLPh2j29qTA6Cq
 3U8hbYFh/cgjUbTuxLCiOaNS5KSB2Lq9aNo2oDaJpm+1Bktu8ZHipDemZ3QjyYR+jA
 QUYP9rwf0pyAw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Prevent NULL pointer deref in interrupt
 handler
Date: Mon, 25 Oct 2021 17:39:24 +0100
Message-Id: <163517996156.3558038.13466013835438231170.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025112258.9282-1-rf@opensource.cirrus.com>
References: <20211025112258.9282-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Mon, 25 Oct 2021 12:22:58 +0100, Richard Fitzgerald wrote:
> The interrupt handling code was getting the struct device* from a
> struct snd_soc_component* stored in struct cs42l42_private. If the
> interrupt was asserted before ASoC calls component_probe() the
> snd_soc_component* will be NULL.
> 
> The stored snd_soc_component* is not actually used for anything other
> than indirectly getting the struct device*. Remove it, and store the
> struct device* in struct cs42l42_private.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Prevent NULL pointer deref in interrupt handler
      commit: 2003c44e28ac9759200a78dda20c5f695949e3f4

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
