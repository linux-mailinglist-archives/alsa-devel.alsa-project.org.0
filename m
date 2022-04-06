Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E43374F6006
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90083170D;
	Wed,  6 Apr 2022 15:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90083170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649251893;
	bh=ZZeh6zTDcFwtbxD5va/nJQyyLywroM+cwhGSFxHPOY8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKbjpBwOOwQrDVIZZIpgnRBKkPRZ0r+38vkpRCvTXMV7NywkNCObOgPgYoXwJbTz+
	 KaP/Ytn/W73TUjRYHoXxKPnlZxqmnDPQxMUVyBGPARh/UFRDmVriD9dfWlxPNFGweU
	 VigwG5wLeZZuTAzMlN5IrXpeWAKZGi9/kgYAVcAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CEABF80534;
	Wed,  6 Apr 2022 15:28:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D2C8F80525; Wed,  6 Apr 2022 15:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE78F8051A
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE78F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e68Neh16"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C479615B6;
 Wed,  6 Apr 2022 13:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA46DC385A7;
 Wed,  6 Apr 2022 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251730;
 bh=ZZeh6zTDcFwtbxD5va/nJQyyLywroM+cwhGSFxHPOY8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=e68Neh16zqsi6ozs7M9q9u+X150Cf/5gO/40+b73FPQow30cPj+GLR2vaPMhC+HTx
 iR6Phw04NsvKelnF7Qy8GKAJFjM8rpn2YuCxKd/CowT7TlB1fMpHOAqkJNSHmZVbFd
 bope+12XR2c6psl5Snqe0Ya1gzfeYw7UcKFo2yGyFVkdjkkmY1vwtNsFpil6teSluu
 B4WCqTprKj9u1ASVzAiAWCL0yUcQpN1JMZe73LSd0A5wj1Zxv/XlETz7e53rUhLzzZ
 Q0EWM94S1iEiM8IclW/la9cg4u/JySJngzoZctx1zEFMrmnCdt6/0DrEdZQC6whVlO
 NrG6vRGqbJ3BQ==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com
In-Reply-To: <20220405135419.1230088-1-rf@opensource.cirrus.com>
References: <20220405135419.1230088-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/5] ASoC: Add a driver for the Cirrus Logic CS35L45
 Smart Amplifier
Message-Id: <164925172848.83821.10687099289112753993.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

On Tue, 5 Apr 2022 14:54:14 +0100, Richard Fitzgerald wrote:
> This adds basic audio support for the Cirrus Logic CS35L45 amplifier.
> 
> The first two patches add two generic helpers to ASoC, and patch 3 is
> a kunit test for patch 2.
> 
> CHANGES SINCE V1:
> Patch #5:
>  - spi .remove callback now has void return
>  - use new I2C .probe_new callback
>  - force boost-bypass mode as default
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc.h: Add SOC_SINGLE_S_TLV() macro
      commit: bc8cb02976cd602b8d7631a6f4a54a9cf305d38c
[2/5] ASoC: soc-utils: Add helper to calculate BCLK from TDM info
      commit: 1ef34dd2b90d78a9830398441801658ef86eee9d
[3/5] ASoC: soc-utils: Add kunit test for snd_soc_tdm_params_to_bclk()
      commit: 89342fa38bbaade51584f255eee5cd43621f4e10
[4/5] ASoC: dt-bindings: cs35l45: Cirrus Logic CS35L45 Smart Amp
      commit: 72661ff7662acc00d51976d4b2d2d13eb5628385
[5/5] ASoC: cs35l45: Add driver for Cirrus Logic CS35L45 Smart Amp
      commit: 0d463d016000d68d7e982720b5e4380b2d83409a

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
