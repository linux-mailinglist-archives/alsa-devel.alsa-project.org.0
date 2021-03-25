Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D5349870
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:40:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DAF15E5;
	Thu, 25 Mar 2021 18:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DAF15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616694031;
	bh=FeQb28pNS2AdW2pbIgoRXK1sd/ExR2r66h+k/Zc5vpk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHQX/Hs2czcIazQvKY7mpPamzigpcenf99v4gplLF4N0x8Nj8aaq70mWdd9ITXmUX
	 aq8Xnow6YVk/l0haBk0tZBzCip3Sj7Yqygem260VA/IiNo4ILx2hwr8e/z4SCTwyWf
	 nGtnzywQ5Mu4SGg9xr4qBOUh8RwQuUr4rwXByVa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7781FF80431;
	Thu, 25 Mar 2021 18:37:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A83EF80424; Thu, 25 Mar 2021 18:37:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11866F80257
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11866F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NXuZCDQ5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90FB061A2F;
 Thu, 25 Mar 2021 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693853;
 bh=FeQb28pNS2AdW2pbIgoRXK1sd/ExR2r66h+k/Zc5vpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NXuZCDQ54LwxGOQ65eoPGAjJnEwMR+CEgirer/rQnlUOqG6B8e5zYPaAS76QL/oo6
 F2X58hkbhzi6pFcUrhCnufhUsOL6kj+uG+NNsI+6cn+j12wjQGH/8P8ABYs+z4k7GV
 CsDl9RPSBdzi7NY/1IqJmOuBcVo00ei4EdaGVBbADrS9c520/8/XOawBwc7ZLXxiEX
 MUYZ5S8L8y526cRXV9MN2wmkhW7dJpgVjcy9f9Lb6CpQb7LkW0KaF3k0Q3n7bO8bkm
 Z1z7gspS3viFRgiD6f5MF+tGhUnEceyyWFSRaOvX4o784r+KfdiZfeuf86QF61owZu
 M4O2nCBf8c9AQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, festevam@gmail.com, Xiubo.Lee@gmail.com,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 nicoleotsuka@gmail.com, linux-kernel@vger.kernel.org, timur@kernel.org,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: Add support for WM8958 codec
Date: Thu, 25 Mar 2021 17:37:05 +0000
Message-Id: <161669370551.41585.15951987176621269157.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615986303-27959-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615986303-27959-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Wed, 17 Mar 2021 21:05:02 +0800, Shengjiu Wang wrote:
> WM8958 codec is used on some i.MX based platform.
> So add it support in this generic driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl-asoc-card: Add support for WM8958 codec
      commit: efd0b1660829a987354cea6a446179c7ac7cd0e6
[2/2] ASoC: bindings: fsl-asoc-card: add compatible string for WM8958 codec
      commit: df8077c6fe64fe98c1b1c1f9ecf84afc773e726f

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
