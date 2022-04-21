Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DA50A70D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:26:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6EB916BF;
	Thu, 21 Apr 2022 19:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6EB916BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650561999;
	bh=vXEGXWcmpcw7VUExikq08Oq9kTSCp/UR4BOeeyQTPwc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NKttACkNRs91QrO9dS4pjJS1OvbFxYa4k13Pxxk1NXag5QSRsjusj1IyI8brgHa8z
	 sFU+pT59nYnZ1cK3iDE94kHNaC/stsdCLvYptkwKN86Ct5uD9mGWJJW+Ouw5ffS3Ts
	 bF3iLlhWltwcQqPiTrm5NCGfrACD7RAkOpQkJk/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E911DF800F4;
	Thu, 21 Apr 2022 19:25:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B3E8F804FD; Thu, 21 Apr 2022 19:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA7D1F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA7D1F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CdJeZKLF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A574861E01;
 Thu, 21 Apr 2022 17:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F6EC385A1;
 Thu, 21 Apr 2022 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561890;
 bh=vXEGXWcmpcw7VUExikq08Oq9kTSCp/UR4BOeeyQTPwc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CdJeZKLFthqIu+m19LEqdRKF7/2K4j86ux4SNyWq+lyR7XrsNG1+ApxSZTr1ZPMpW
 iWO9TJd64QF8z94U/km2EorKEnkXRXEnkQhlJaZkNmkON0uhVHzgVo9nhUVRU6IUXB
 xlX4HVxk5MMYk2xeqNAajuC2gJZKqXk+sfN0bIqmI+vi1tLH7QY5UGVqkB5YTInD/U
 Kulltzj8efvBaZV7481sxIzQIg1/7FyApr0KBUDUlDTy7w4tjWQiNHwBHVLKnCwcbo
 ikBmmZ2rVSDcqI5Q1ZOxW6bKebM64Z4x7uNGEiDTVfOiQwiHoNDRJ+zXRdh+LIwVmz
 VFce3Ro8pgCzQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r15rgn6p.wl-kuninori.morimoto.gx@renesas.com>
References: <87r15rgn6p.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: care default case on
 rsnd_ssiu_busif_err_status_clear()
Message-Id: <165056188911.376935.15892463506853395145.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 18:24:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, dan.carpenter@oracle.com
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

On Thu, 21 Apr 2022 02:55:27 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit cfb7b8bf1e2d66 ("ASoC: rsnd: tidyup
> rsnd_ssiu_busif_err_status_clear()") merged duplicate code, but it didn't
> care about default case, and causes smatch warnings.
> 
> smatch warnings:
> sound/soc/sh/rcar/ssiu.c:112 rsnd_ssiu_busif_err_status_clear() \
> 	error: uninitialized symbol 'offset'.
> sound/soc/sh/rcar/ssiu.c:114 rsnd_ssiu_busif_err_status_clear() \
> 	error: uninitialized symbol 'shift'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: care default case on rsnd_ssiu_busif_err_status_clear()
      commit: b1384d4c95088d01f4266237faabf165d3d605fc

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
