Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455F280A95
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8921EE9;
	Fri,  2 Oct 2020 00:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8921EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601592850;
	bh=UjbH0ebImJjNuEEUauFvQmSUuTKtzLDzicg7Y+p/3CE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osF8Pebt+nXsdgLD2K6CWyEhSez/Gs9YjP6JtlbHsMdoHgqXCo8eF7EOsYXPnijLc
	 OFScgCCu4II4Bd3IqsoqTM0M15nGVs+5LqXC+P5InZ7Zb2lg8vfYPek7Bk3PAzyxn9
	 x1tIFh0Uu9oVgRrFtXlpKmp/zmZUcn7TE7xyUj40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1779F80323;
	Fri,  2 Oct 2020 00:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C54DF80329; Fri,  2 Oct 2020 00:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 954B3F80329
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 954B3F80329
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ajTgYBsE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EDD02074B;
 Thu,  1 Oct 2020 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592489;
 bh=UjbH0ebImJjNuEEUauFvQmSUuTKtzLDzicg7Y+p/3CE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ajTgYBsELr2xuMH4Ja4BtaWHLyHTDozqgbwqpl5QUHJ8nbFqfl496wVA8ML9tz4ld
 w8iHe91TiDNRW+K9jxk3f6pqckaT2X0+oDPGa23bSzIxj/YJMG+PS8I72klmBtY7Tu
 ef+u1WDZ263l3zvadw9k0C7iSx+Mo9BiLzHwzxY4=
Date: Thu, 01 Oct 2020 23:47:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k0waag44.wl-kuninori.morimoto.gx@renesas.com>
References: <87k0waag44.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: ignore un-needed mutex_unlock() case on
 soc_pcm_open()
Message-Id: <160159237545.44588.17420821509687006346.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On 01 Oct 2020 10:32:48 +0900, Kuninori Morimoto wrote:
> commit 140a4532cdb8c ("ASoC: soc-pcm: add soc_pcm_clean() and call it
> from soc_pcm_open/close()") switch to call soc_pcm_clean() on
> soc_pcm_open() when rollback case.
> 
> But, it uses "goto err" (A) *before* mutex_lock() (B) when error of
> snd_soc_pcm_component_pm_runtime_get().
> The mutex_unlock() (C) is not needed in such case. This patch fix it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: ignore un-needed mutex_unlock() case on soc_pcm_open()
      commit: cb2fce94c84e2c2798dca45aa00d1e03294fab95

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
