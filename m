Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B336C387DB2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05D5E174F;
	Tue, 18 May 2021 18:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05D5E174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621355711;
	bh=0UcIEE3s827wTmWGADjhAl8/9TWOigYmf+X8WRZ5/2w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uMI973X4eOniEVcm2qXU81wPA60rVvlzbSfFRISup/6M58GDSmfvp+7LdqTE13oAT
	 QI4suzya3LBTaqt5jkfhQ+xEVfNV9ctZLqwB3jdFc8Ce/2oN3fkmL6gR6rR7vle5jS
	 lSCB3q+2wMUZ45qH4UjUqTg296lWpEreT5U8wHQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20739F8042F;
	Tue, 18 May 2021 18:32:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A95F80217; Tue, 18 May 2021 18:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540E2F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540E2F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ql9hyvde"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8863A611CE;
 Tue, 18 May 2021 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621355563;
 bh=0UcIEE3s827wTmWGADjhAl8/9TWOigYmf+X8WRZ5/2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ql9hyvdeG0VeCFDvOv7gyhjfvkFx0ofVYOT5B44QYA9+NJlQHOh+VifgqVaR9g0IQ
 3zvg7kW0m97nxHzAXEqVffYBx6UFBha9F6NFcLUYIe9zbc3VqQ/j5kwjoUC0GCx2dB
 D/ec9CpuI3H0qaZcmIJ05Q2mu3dCjDWomIlcZuvFkGRXkALtjTxa1+/7mxkE/8qI+y
 CKVGNlIozp7y/R16YShoo9rlbTZN3KhBFZp5Qtv92JeIHPSyHHE7+yG7c1sXHPRmv2
 qzM0/hM2Caj5AxRAz83NSGx3FRm77Jt9+feRwAPx3mwjRiONaYXu73o/mMofxh6KXk
 S7//VGw+gcBUA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Arnd Bergmann <arnd@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: fsl: fix SND_SOC_IMX_RPMSG dependency
Date: Tue, 18 May 2021 17:31:33 +0100
Message-Id: <162135531445.37831.11488423603905441605.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514213118.630427-1-arnd@kernel.org>
References: <20210514213118.630427-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Arnd Bergmann <arnd@arndb.de>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Viorel Suman <viorel.suman@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
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

On Fri, 14 May 2021 23:31:14 +0200, Arnd Bergmann wrote:
> Kconfig produces a warning with SND_SOC_FSL_RPMSG=y and SND_IMX_SOC=m:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_IMX_RPMSG
>   Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_IMX_SOC [=m] && RPMSG [=y]
>   Selected by [y]:
>   - SND_SOC_FSL_RPMSG [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && COMMON_CLK [=y] && RPMSG [=y] && SND_IMX_SOC [=m]!=n
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fix SND_SOC_IMX_RPMSG dependency
      commit: cdf112d4c65f83065793b73b49363123517fdb71

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
