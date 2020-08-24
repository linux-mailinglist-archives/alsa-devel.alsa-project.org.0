Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1024FF01
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 15:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 657F5165D;
	Mon, 24 Aug 2020 15:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 657F5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598276101;
	bh=227dtBv6s+osOfbFZGxhSmc7Pp+0HyhRJcvJKsfk/9g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NuiqCyn91pMCByLD0wwuGVjNImvoOVpXWKTjmeYCgOYJWvA3V9SxLDgeqPTvkceu7
	 g1uU1UOubGkNOfkXy3+KSkCMEjXg5tyjZZMuoaRns1JuCAitXnBNqPiIO8ctgCxmJe
	 5/quRSAGtiw1mDVZmZ0nOQ2ZQEZ8jKAqhPNuHlMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFD3F8026A;
	Mon, 24 Aug 2020 15:32:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96091F8013D; Mon, 24 Aug 2020 15:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 604B4F801D9
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 15:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 604B4F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z25Zek48"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8482D21741;
 Mon, 24 Aug 2020 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598275936;
 bh=227dtBv6s+osOfbFZGxhSmc7Pp+0HyhRJcvJKsfk/9g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Z25Zek48M4ObQQW2U6XdS3pJxww3Z1DSNLI8UqjLpwPj7TjLcv9jq/hDBS7TZxXBz
 PwAYzNfPyBe7m3m7hAflDuszz4SPdFZt8uk3/1PvneCwtIgK1oHyPtIOcu5ZXXkRIh
 +gvrqVF80qrTRsXNt3NvpKlh9BukPWX9YazDowiE=
Date: Mon, 24 Aug 2020 14:31:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, tiwai@suse.com, timur@kernel.org,
 alsa-devel@alsa-project.org, festevam@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, perex@perex.cz,
 nicoleotsuka@gmail.com
In-Reply-To: <1598255887-1391-1-git-send-email-shengjiu.wang@nxp.com>
References: <1598255887-1391-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH RESEND] ASoC: fsl_sai: Add -EPROBE_DEFER check for regmap
 init
Message-Id: <159827589162.47809.7720594849042451325.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 24 Aug 2020 15:58:07 +0800, Shengjiu Wang wrote:
> Regmap initialization may return -EPROBE_DEFER for clock
> may not be ready, so check -EPROBE_DEFER error type before
> start another Regmap initialization.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add -EPROBE_DEFER check for regmap init
      commit: c1e47e8919da525c803d1557a30e44441db1e5ee

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
