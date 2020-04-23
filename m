Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA11B60EC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 283AE169E;
	Thu, 23 Apr 2020 18:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 283AE169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587659373;
	bh=ky5iXn5UEpgEUlyZWT7+68OWaubhRbOKsYG2GFRYvWA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=deO1GjGYfwL58TZyR4EeczFIkWE269L6KCpLJWVD1YFr+Ied5hO27UCRbnPDUR3oi
	 +khWD10f62xUR+YpKPbb6+bSnU/xtrLf+eODoB/19OVLqdanBNqN3gnjuReI+MdhR8
	 zEt9fVdMoDgumJjoHTZw4OF7Tsbow/iSrTzzln6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B8B0F800FF;
	Thu, 23 Apr 2020 18:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68CE7F801EC; Thu, 23 Apr 2020 18:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D02EBF800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D02EBF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aP2EYC+l"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBA7320704;
 Thu, 23 Apr 2020 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587659265;
 bh=ky5iXn5UEpgEUlyZWT7+68OWaubhRbOKsYG2GFRYvWA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=aP2EYC+lPMFuUeOSQngeMc+6mufBTSxfrfefsDqZhgV29T1ysrWLRJlfCdqevQau8
 ERH/LJzvuLWRV4ajXbxHi84jR2Lyju/nka0ASTVI+sBymEXGaDtQjKMQuWPff5hHXs
 yAU1G6rvORnd+0jTBxPUPZY26Mwr8bXShQKieymc=
Date: Thu, 23 Apr 2020 17:27:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20200423142805.52757-1-broonie@kernel.org>
References: <20200423142805.52757-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: Add missing dependency on IMX_SCU
Message-Id: <158765926266.52275.12049804642333754117.b4-ty@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org
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

On Thu, 23 Apr 2020 15:28:05 +0100, Mark Brown wrote:
> This broke PowerPC allyesconfig.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/sof/imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: SOF: Add missing dependency on IMX_SCU
      commit: fe57a92c88580ae7894b9c71d2d520ba98eb1591

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
