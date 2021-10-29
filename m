Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE643FEEB
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 17:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 624B016E9;
	Fri, 29 Oct 2021 17:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 624B016E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635519697;
	bh=aqiYC5SqrqytOj3AgJ9i+2U0QKUjvkgIjN3Y+G2zp3A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aetYqy4tc2Q15xrfhr7iN0RXPI+dvXebpluQUkhdXE1XbNiZk14PCxpNJJCbqKsqc
	 I43IRYOxwCwSzf7NmrXnWvXuxRnEzLw3+Dcu1NpMAHsXDIONAo0LniCBRYu4n0H1gM
	 8764PyVdET2oMbkKyYGGZz1GPiNf/BuA3ubd4ewE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C436EF804EC;
	Fri, 29 Oct 2021 16:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B52EEF800F4; Fri, 29 Oct 2021 16:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86028F800F4
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 16:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86028F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lOiso3Mc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AFE2611C0;
 Fri, 29 Oct 2021 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635519547;
 bh=aqiYC5SqrqytOj3AgJ9i+2U0QKUjvkgIjN3Y+G2zp3A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lOiso3Mc4EaInjABzt9DG0g8lR9/E26BTzW8oRPXFOFQ1beEYsiAJjrk/hvbdc0yB
 u588CF2o4dOTAVaCktSPKPgJD3Y8R6vpIkc+L+F7kznK5/erS2m/esDqihHE/Q81wg
 56HE97RUgltKGpjCKWrTeyU0vKqaEfSL58voMbKEoC9ZS0agJhOO23hoXu4v5cmgCT
 HH4Zn56gfF9a0Z8I1E0ZGpC/mS9tFSErkq/TVCMtjOU2nRV0KvE7AJ/IwPCqsUvMe/
 sa0zOtiuxelFGe8/t8v8db79ooRc/PR1FrAdN2cRE2kQdWclwdr1wFjBJTuOxLfWsf
 DgbCpwUKoz5ug==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20211029113714.966823-1-arnd@kernel.org>
References: <20211029113714.966823-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: select CONFIG_SND_SOC_ACPI
Message-Id: <163551954530.3555751.17998419560489976285.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 15:59:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>
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

On Fri, 29 Oct 2021 13:36:57 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The acp-platform driver now needs the ACPI helpers:
> 
> ld.lld: error: undefined symbol: snd_soc_acpi_find_machine
> >>> referenced by acp-platform.c
> >>>               soc/amd/acp/acp-platform.o:(acp_machine_select) in archive sound/built-in.a
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: select CONFIG_SND_SOC_ACPI
      commit: 62a30322607f120e10ea1a7d07895b5af8049baa

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
