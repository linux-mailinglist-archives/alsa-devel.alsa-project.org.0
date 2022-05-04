Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144151AF6C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 22:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8148175D;
	Wed,  4 May 2022 22:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8148175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651696690;
	bh=qmimBDeRB4bB+AEAXOitKu5QJGWKCNVo/BZKGvVdtVA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PaV9Ba0pwzVFjQGFczTGeqEE87W5xWItLlv3+WCh5vsOem/ydOCZHL1JqGAqiP82L
	 mixSmO8RBmoVrcU7IF/k6klNJ4XAydsU/tpmWcWh+jy/cpiaq/ViYpftYCXDO4ROOq
	 /wBNTNIqlWu/G8l/9qyPtceJbKTWvKtTagZboQSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4457DF80163;
	Wed,  4 May 2022 22:37:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A639F80166; Wed,  4 May 2022 22:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F740F800D3
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 22:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F740F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sjitd1DX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF847617A8;
 Wed,  4 May 2022 20:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FCAC385A5;
 Wed,  4 May 2022 20:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651696624;
 bh=qmimBDeRB4bB+AEAXOitKu5QJGWKCNVo/BZKGvVdtVA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Sjitd1DX16hJEzOOafTZ/yM2kGICPQVsuLAxt3lxQtAAmyVNyFbWHO76ifP4mhsqW
 53KmUBq5IES+7vwcZE+UipR7uqZ6ZNeuaAANBeyHPq+n0BE1knxPChCsLbVusOK2le
 y19UXnxN/coVoDC038Ei+jt7cT4rZ3RiBYXaFOh8v1058BBJQLIenLRCVvQ1dpvaBO
 KDIRnJOwtaZzTCPS4Arv/eLutvzrhy5TxVQtZCUhSbz2xUhevsBQ+vVo61fpJpuS5t
 /0sjRPo7xzCJ9IldtGCqm0CR0mmRb8FCc47pum8dRcq42xMqMCBlCinQkFFPOseGZE
 4RlDOFGXRGy+Q==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com
In-Reply-To: <20220504134458.283780-1-rf@opensource.cirrus.com>
References: <20220504134458.283780-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l45: Enable BOOST
Message-Id: <165169662327.1744642.12027482630196745808.b4-ty@kernel.org>
Date: Wed, 04 May 2022 21:37:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Wed, 4 May 2022 14:44:58 +0100, Richard Fitzgerald wrote:
> Do not disable the boost converter during probe. The silicon
> contains functional default tunings so the boost converter can
> be left at the chip default enabled state.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l45: Enable BOOST
      commit: 6ff98a694cc114fd79f692345a7fbd469f800f8c

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
