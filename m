Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F0750A711
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:26:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FCC316B5;
	Thu, 21 Apr 2022 19:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FCC316B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650562015;
	bh=vhR5HU9aDcrDAbJOy52MenOQ+cdKq7yEMCDh5DXsr34=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnznQZMHUmrSza0W63bib5IQUjtlhtCrg2ICOUoJpLOVYGhpEJtTrqF3y86Iyo6nu
	 +yEdcO2ieUOwjg6GdCIiZ59CqwgL9hzBRs/ATu6lqMradjJkNlBNE+PjKmOyNU16Z4
	 XZ6cw2BUr2DQ//ono294IlmhI1Cj3SdzwZj5VJnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6335DF8050F;
	Thu, 21 Apr 2022 19:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48C64F804FE; Thu, 21 Apr 2022 19:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED7F7F8032D
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED7F7F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rsxKBatq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C13AB82874;
 Thu, 21 Apr 2022 17:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7B2C385A1;
 Thu, 21 Apr 2022 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561892;
 bh=vhR5HU9aDcrDAbJOy52MenOQ+cdKq7yEMCDh5DXsr34=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rsxKBatq1SQC8IaLsZVTjolPqueHDxIYiS9p8peMJWhcSzVrg1eWvdOJqxFr/mrYS
 /QzmTHKsfjXXme75xCYIeQ0Xd+sUJh4HTrg8v9ljZp5dqO+T4b+T8UiAedz9LOXhnr
 K9nQDsFFcbzBJZ5r0lzEqD3FwLqnkZgefUzLicPMHLnkGbWGOKSyr1Vfezx315/+P1
 loctP5ZUljfAkQgjiONWuAx7SLDDoJTUPppC2Ix6sq2s1TBWZ78ys2RwMVidYD9iw0
 ypOLv+y8GmO7Zqw6yyFL7TbYTvZeRcqdbzaRnHLyAndVjssd1rQW5WGRDkwf5r9m5o
 wlNs0/K2wEi/w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o80vgn5a.wl-kuninori.morimoto.gx@renesas.com>
References: <87o80vgn5a.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: audio-graph-card2: indicate "Experimental stage"
 warning only when successed
Message-Id: <165056189137.376935.16441068280224296214.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 18:24:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 21 Apr 2022 02:56:17 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Because Sound Card needs many drivers to probe, current audio-graph-card2
> will indicate "Experimental stage" at top of probe function even though
> in case it gets -EPROBE_DEFER, thus it will be indicated many times.
> 
> This patch indicates it when probe was succeeded.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card2: indicate "Experimental stage" warning only when successed
      commit: c1d97b866100f354c3381c756e8ea7c4d8f0ccbe

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
