Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE659C3DE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 18:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87A89161E;
	Mon, 22 Aug 2022 18:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87A89161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661185071;
	bh=n7Tpver0wlHE1YaslCR3Alcl2cXodLRbPnZl+eclhYQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuVAJpv1nuwCQPFAvv0djqxBRSq+LmTfE2x7qMoWytxB2OWKri7ZyaEo5BXixrger
	 MXtgMIUAms8bATSEezIWxUOWjgklnXnjh0T3VwuJh1oo0Lw+jRecN3MvRL6xuDPX51
	 5EB87KiIKECNFI9n3M/BHAXTPMpz38HXrYwlUEaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1BAFF800A7;
	Mon, 22 Aug 2022 18:16:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C485BF800A7; Mon, 22 Aug 2022 18:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84780F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 18:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84780F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dQFGoLa4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 870D6B815F6;
 Mon, 22 Aug 2022 16:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54EAC433B5;
 Mon, 22 Aug 2022 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661185006;
 bh=n7Tpver0wlHE1YaslCR3Alcl2cXodLRbPnZl+eclhYQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dQFGoLa4I/7Pg4+WVIvk6MPByOouURJkVMMW+O0rTaULtjH8KvZHQhi/Ly42aCmv7
 /WOmRqEvbHy2EU9/HVZ8n9RfeX4vvKSdwazsdh1HeCc098bidiTwN65zZ9Q9Jy9JNa
 KzJtVYWyTI4lcDRHMmMjPkKyyAxCsAJBYvX5ZFM54x4oJgusCNKhAP5J8j4SWyAF4Z
 eHyNRyO5uvZlaFvGoL3NV9BiGs0f5GxmtSz6AyhJa4H6m5NcffjmzXDY+93II+XzvW
 sNULCnPdsRItbNEh+4YqHeKnTj3G67cH43pdbIfeAbFgKQc3ttEP6+Jj5JhUXSdKtR
 B51JKcfwsnp4w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bksdgflq.wl-kuninori.morimoto.gx@renesas.com>
References: <87bksdgflq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm.c: summarize related settings at
 soc_new_pcm()
Message-Id: <166118500548.214851.12498019885352073607.b4-ty@kernel.org>
Date: Mon, 22 Aug 2022 17:16:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
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

On Mon, 22 Aug 2022 02:46:25 +0000, Kuninori Morimoto wrote:
> soc_new_pcm() sets pcm->no_device_suspend, but it sets other pcm->xxx
> at the same function with different timing.
> pcm->no_device_suspend setup timing has no effect. This patch tidyup it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm.c: summarize related settings at soc_new_pcm()
      commit: 4d45d944e885e1bf4341a8cbb9b69584477880e3

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
