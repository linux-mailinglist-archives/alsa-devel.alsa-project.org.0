Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A71494B50BB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 13:55:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 314251DF;
	Mon, 14 Feb 2022 13:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 314251DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644843359;
	bh=wuI1+4Z5X/VTgvDJWRpj82tpujnNvJpdexZA46NI7iE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T71IvO7NecKw/engK8z/lRwGwutZLsdOxZpXHqqVgObYy8QZPavyIFKzKpGBSHjtc
	 xxzZj8JXQkzI2Gb0m4b+neooxIzHzXK6ageoUrHfd6dxDHK15eeY+fsIYV0vnc/ZCC
	 ZIfl1OYPlmkY4thHyMdWLgQB19ncwQOBTu2VLpBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A442CF80430;
	Mon, 14 Feb 2022 13:54:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEBD5F80430; Mon, 14 Feb 2022 13:54:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73E48F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:54:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E48F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S9bSBd8h"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06B8E6145E;
 Mon, 14 Feb 2022 12:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2102C340E9;
 Mon, 14 Feb 2022 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644843283;
 bh=wuI1+4Z5X/VTgvDJWRpj82tpujnNvJpdexZA46NI7iE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=S9bSBd8hQTzVfkq+2DG1Fgz/5NpFQTETQoUg1tV+WwDcHHFcAXFuz4nLtkZj5BgYe
 iE2oS+LjRCnXilGh3vBTvyh/cNGCJfjc0tGIyjZG//Rd8MB/LY6sc2a0uFMLXK5xlv
 GNNPJuR3xldf64AyH4tAM3LWL62k+57E1rvfULRlnXZsImXXvt3FQCKV12KFUkeKz3
 VYgF+NFyZf3qfh15nUI/uIYl1wZloR6QUYk4S6f71wxv06gedSHYwK8xFFQkGZ+N6T
 6jNKbvKhtKanO2qpS+KKud1JuGA1kTA/4qTQ9NhVZeuXoH8yo7TJ2F6i+qtDX114dT
 snWNaZNtEmVKA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
References: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/3] ASoC: wm_adsp: Correct control read size
 when parsing compressed buffer
Message-Id: <164484328249.12994.10698429649837203152.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 12:54:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Vlad.Karpovich@cirrus.com, lgirdwood@gmail.com
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

On Thu, 10 Feb 2022 17:20:51 +0000, Charles Keepax wrote:
> When parsing the compressed stream the whole buffer descriptor is
> now read in a single cs_dsp_coeff_read_ctrl; on older firmwares
> this descriptor is just 4 bytes but on more modern firmwares it is
> 24 bytes. The current code reads the full 24 bytes regardless, this
> was working but reading junk for the last 20 bytes. However commit
> f444da38ac92 ("firmware: cs_dsp: Add offset to cs_dsp read/write")
> added a size check into cs_dsp_coeff_read_ctrl, causing the older
> firmwares to now return an error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: wm_adsp: Make compressed buffers optional
      commit: 0f1d41a85bda6f3502634fe15fa21bfee4c668a4
[3/3] ASoC: wm_adsp: Add trace caps to speaker protection FW
      commit: c55b3e46cb99a8342cad9c1a35485bfe15187832

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
