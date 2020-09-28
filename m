Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D427B5C8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10C1D1877;
	Mon, 28 Sep 2020 21:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10C1D1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601323085;
	bh=KH6ZEVkfOXTAWXhHnGrzQMCMMlgk3Uf4o9uZOltZph4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZmlBKsYIgAyvEDR2+C0ooxCno3wgC6xSHVr2gAq9qFkIw3XGQ0LTyKeHl0J+rL5M
	 HG9kUuagL1mb4T+eJwgxz5buEB+0wWNdcEdrlLkUmjT6uQ09GHnaWZk5kMpHE7r+NM
	 nP0ahhFfFM/T7sRdS/sFTHOXa3SNtsM9ZSs4sQcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C07F80228;
	Mon, 28 Sep 2020 21:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 728A1F801F9; Mon, 28 Sep 2020 21:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE22F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE22F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nfewh7dy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 467942076D;
 Mon, 28 Sep 2020 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601322975;
 bh=KH6ZEVkfOXTAWXhHnGrzQMCMMlgk3Uf4o9uZOltZph4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nfewh7dyAvXSXACqLhaejEBL7yBWg4q00iTKDSqUSp7kKud4goR+0NXIWg0dNwWen
 jIqRbiphObmUhrH64xU8lecRsJLA+S/xmmnhPt57vE+yx/utNBzspo+1rRo1fMh3yT
 KKm0tVO8kAsITF5FOLXbn2hkl2qaM3NUKYhaSlLE=
Date: Mon, 28 Sep 2020 20:55:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mu1abwp2.wl-kuninori.morimoto.gx@renesas.com>
References: <87mu1abwp2.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RESEND] ASoC: merge soc_pcm_open() rollback and soc_pcm_close()
Message-Id: <160132291825.3990.11344479903052921582.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 28 Sep 2020 09:00:14 +0900, Kuninori Morimoto wrote:
> 1 month past and nothing happened.
> This is resend of v2 patch-set.
> 
> soc_pcm_open() does rollback when failed (A),
> but, it is almost same as soc_pcm_close().
> 
> 	static int soc_pcm_open(xxx)
> 	{
> 		...
> 		if (ret < 0)
> 			goto xxx_err;
> 		...
> 		return 0;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: soc-dai: add mark for snd_soc_dai_startup/shutdown()
      commit: 00a0b46c99e26b30ea27c1fb4f4dbdfc6f8b1c49
[2/7] ASoC: soc-link: add mark for snd_soc_link_startup/shutdown()
      commit: 6064ed73cd2405d13c252b190ac64c03ab40e4b9
[3/7] ASoC: soc-component: add mark for soc_pcm_components_open/close()
      commit: 51aff91ad123e03d1461ec1d980efd1814dca69e
[4/7] ASoC: soc-component: add mark for snd_soc_pcm_component_pm_runtime_get/put()
      commit: 939a5cfb2a5609d2d6f996b5cd853397a82a92b9
[5/7] ASoC: soc-pcm: add soc_pcm_clean() and call it from soc_pcm_open/close()
      commit: 140a4532cdb8c44a664e7e871ea5dbaa4c2829bc
[6/7] ASoC: soc-pcm: remove unneeded dev_err() for snd_soc_dai_startup()
      commit: ce820145a9ec04797a417fcb01b8ff02dcfd9846
[7/7] ASoC: soc-pcm: remove unneeded dev_err() for snd_soc_component_module/open()
      commit: bcae16317bcfa45f6b767cf59e02e9cc72715d27

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
