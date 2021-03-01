Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515B329546
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4D0B167D;
	Tue,  2 Mar 2021 00:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4D0B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614641998;
	bh=cZUXtiovZI/tzqijypqjrzq6gBu3W8SMAC9WklSHYws=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1329ucOh/p+/qgRRMxCQCnMqwtllLXYZdtSPW9UoQuEzVXSb4kQhWzBKtUqpsU5R
	 Ltyqq/4+uVtV0QR8t2LpNnsUYxGvWZhhFqyLOX7Cgp1NX75fCPFSvhJMwgF7kjKYFH
	 q+hLGZCkQorpbsETHXtXU9f/sz3WYJkea1hreGwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DA71F804B1;
	Tue,  2 Mar 2021 00:36:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B129F804B0; Tue,  2 Mar 2021 00:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9793CF804AB
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9793CF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dCaF9pF4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85AB661477;
 Mon,  1 Mar 2021 23:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641780;
 bh=cZUXtiovZI/tzqijypqjrzq6gBu3W8SMAC9WklSHYws=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dCaF9pF4GRmEI4DE44lP4QN+Xroxj01DFpBfqqFQgpr3XTZGB6WONfW0O2O9bnEzD
 uURGw8GvAUEEjUqNTlCdWSKQLsTFenL8jaJVuFaoNeU4wNOJaZCsfzwCjcxA+gg9im
 63BvJ22/zLB70SoFZNe2Y/yT3QKw5sTgUm4YU5QaUdfmaCGfsXuJ67WKkTz2fVKiNv
 G3e6UKMTqEjg8E7RQ/NdHVh4gPRbfaAvPdFxZN3NkeiYNk/Q67S1pPPgzU0u/h+z7K
 FvpuvIq5L5l6GpR/79/MDh0tvcVRgsBWiQ7O20spaK1FHP2Ub8DXpV22jmHp19klND
 QgGg6uDcOiyWA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Oder Chiou <oder_chiou@realtek.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210224211918.39109-1-rikard.falkeborn@gmail.com>
References: <20210224211918.39109-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: rt*: Constify static structs
Message-Id: <161464168097.31144.1513145502519193305.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
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

On Wed, 24 Feb 2021 22:19:14 +0100, Rikard Falkeborn wrote:
> Constify a number of static structs that are never modified in RealTek
> codecs. The most important patches are the first two, which constifies
> snd_soc_dai_ops and sdw_slave_ops, both which contain function pointers.
> The other two patches are for good measure, since I was already touching
> the code there.
> 
> When doing this, I discovered sound/soc/codecs/rt1016.c is not in a
> Makefile, so there is not really any way to build it (I added locally to
> the Makefile to compile-test my changes). Is this expected or an oversight?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rt*: Constify static struct sdw_slave_ops
      commit: 3ebb1b951880d3152547ac4018bfcce0fd7810bd
[2/4] ASoC: rt*: Constify static struct snd_soc_dai_ops
      commit: 84732dd4ff3ad28cc65eedfa3061fe3808e8469b
[3/4] ASoC: rt*: Constify static struct acpi_device_id
      commit: c85ca92c716bd04981ebcd2c67cd03f96748859e
[4/4] ASoc: rt5631: Constify static struct coeff_clk_div
      commit: 39f9eb61307061eed197eae651ef56cb3544f9b2

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
