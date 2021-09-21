Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB12413630
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 17:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965111616;
	Tue, 21 Sep 2021 17:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965111616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632238067;
	bh=jDRQXGf7gbvv7glyWY+HfhW+JY8gbICqnGlh6IrImGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tVNxEQ5IHBm6yUZl/qfYM7hDe4vwibKH3vz1SMr7q4Mv8I7fzf7+EAi6vAYazFHF7
	 Mk0+C2AcqGpvATm88t2DJAuWePSUzbKeQaknXtgX/8xqgTTx2oKp+YJ3HQvMT6+PVq
	 tkprrS9WflLqZo7r9MGDaJlJQCN3ay8+4+jlneHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C37B0F804BD;
	Tue, 21 Sep 2021 17:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CCFAF804C1; Tue, 21 Sep 2021 17:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951F4F8025F
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 17:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951F4F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CBumJ/Lm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4739061186;
 Tue, 21 Sep 2021 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632237966;
 bh=jDRQXGf7gbvv7glyWY+HfhW+JY8gbICqnGlh6IrImGk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBumJ/LmMXYS/Jzmek/MV0s4+Xwfg0CJ8SyfnLbcsNpGDlsevkr0K99DhGs3Z69dp
 MZrtXjdv4Iij9RLyIvguQObHDWPXZ8XVgr3kTdfYagbQbM+AulWv8mazC/fsN5+//q
 FgzL1cDEPBFRn859E4MboMinZNwQBCuPZ3D1VMhcPL8aylsIlcEfGn2y7UqU34B2f9
 2rJ6AIsAZR5/TW3ZCZMPq0hSLm7OKFaOehrDmUQm7fTHbkSC8A9ptvL4QEFMHeJi+J
 tRfBXErO17G3sP7evr6LTSEMWWvnJHPfEMuF1eSIAlbPAHeBd59Tk6Pmam2mDNHM7b
 d19KCuXHe8UJQ==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, perex@perex.cz,
 alsa-devel@alsa-project.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Fix channel swap issue with ARC
Date: Tue, 21 Sep 2021 16:25:11 +0100
Message-Id: <163223651319.32236.15669372544555545964.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1631265510-27384-1-git-send-email-shengjiu.wang@nxp.com>
References: <1631265510-27384-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

On Fri, 10 Sep 2021 17:18:30 +0800, Shengjiu Wang wrote:
> With pause and resume test for ARC, there is occasionally
> channel swap issue. The reason is that currently driver set
> the DPATH out of reset first, then start the DMA, the first
> data got from FIFO may not be the Left channel.
> 
> Moving DPATH out of reset operation after the dma enablement
> to fix this issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Fix channel swap issue with ARC
      commit: 74b7ee0e7b61838a0a161a84d105aeff0d042646

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
