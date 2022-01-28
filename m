Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D384A0491
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 00:50:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EE9172A;
	Sat, 29 Jan 2022 00:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EE9172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643413800;
	bh=V2hlaQUwVYAhX5sapkiCadueN/CP7V6HFi+LjLl/M4Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGSjvGGJb6tiCQWrc1qQOm90Uc6yMTrLi9abB6Ic0iiZLBqlK9JISU71YOf9TyKXU
	 iiu3R2WwAzMT54/OgbiuFuBkR74fTO2993I4l+vPQ2oDtCm3fBsBIEsD43sJ5j/KJ1
	 WDln0nC2sXdjtyoJ/y8O4B+kwOKS9AzW3NcogSFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0D71F8052D;
	Sat, 29 Jan 2022 00:47:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94988F80518; Sat, 29 Jan 2022 00:47:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A16F80482
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A16F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ankvu6tw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 516EDCE2803;
 Fri, 28 Jan 2022 23:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64791C340E7;
 Fri, 28 Jan 2022 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413617;
 bh=V2hlaQUwVYAhX5sapkiCadueN/CP7V6HFi+LjLl/M4Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ankvu6twiuvg8eygebbnv0pC7E/TI/i8GZKF+HN6mTXa3yMpVLEJ7D1taiIgS/RHn
 2xu1/h1GAPY1wa2aRSQwfvBByI7YvK/+lsALaw803wUp3Krgbm2s2ooQkr4x6sKhG+
 9lhQtUevvCaM4K8Ox6YNpfIIriz11fyAtzNvCHDZva7knG8zyf2OkRF2iT5IS8JxYq
 TzCiAea4mj17JIkGmV2ysRLPhJ0FY+00EWsXrQYyymJKWLWI7GrYjq0M/PdsbpD53g
 ugzjWw85jzlbYnmiDaJVJfH0Vt2E8Yjg4W9faWYWWcS8r9qMzxxMrd1GXTAGwciu2+
 r7xkqJXMnb9iA==
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220117115854.455995-1-AjitKumar.Pandey@amd.com>
References: <20220117115854.455995-1-AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH v3 0/6] ASOC: amd: acp: Add generic PDM and PCI driver
 support for ACP
Message-Id: <164341361612.694709.10584729229948593969.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 23:46:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Vijendar.Mukunda@amd.com
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

On Mon, 17 Jan 2022 17:28:48 +0530, Ajit Kumar Pandey wrote:
> changes since v2:
> 
> - add dmic prepare callback and adopted few nitpicks comments
> - use read_poll_timeout in place of while loop
> - added check for unused variable as pointed out
> - few cleanups
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: amd: acp: Add generic support for PDM controller on ACP
      commit: c32bd332ce5c9eda087dedae2cf5f98bb008e841
[2/6] ASoC: amd: acp: Add PDM controller based dmic dai for Renoir
      commit: def6dc25070342be2eb220cb1650a286ee29734d
[3/6] ASoC: amd: acp: Add generic PCI driver module for ACP device
      commit: 5a9f07a41522e1d16f2a43b1843e266434df0866
[4/6] ASoC: amd: acp: Add ACP init()/deinit() callback for Renoir.
      commit: 6a75585a3d4bc86e7f5f95b131c4e34125c871ba
[5/6] ASoC: amd: acp: acp-legacy: Add DMIC dai link support for Renoir
      commit: 611ba05e8bc55b35690e90bcc6710f422dd72587
[6/6] ASoC: amd: renoir: Add check for acp configuration flags
      commit: 2d7d9f36b567ec44c9a758e1ee6e599b4db3cad8

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
