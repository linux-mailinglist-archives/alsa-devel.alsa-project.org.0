Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD03A879C
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 19:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF1F169D;
	Tue, 15 Jun 2021 19:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF1F169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623778445;
	bh=38JelWkBVrb1iUB2+ACoZ3vPaIr4XdmxQrI+4XMqupc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sgTRYRpEmycP3pDEFmTcAZYelLUQUDWc/zrpSSQPgjw81/SjCXm3Ic8reF6Vr7WLE
	 RSqEwUaZLjR40DRL3+Up7zNrxnaLiWYXR3FZ3G+Na3rix7OIf5J2XFzrRC1+CwXOnJ
	 tXKLZpbpFVffwxNTXsWhW1k/cz7cBElXXKG3g1Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 560CAF804ED;
	Tue, 15 Jun 2021 19:30:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F0A0F80165; Tue, 15 Jun 2021 19:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45068F80165
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 19:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45068F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UJt1n0ls"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C47E66140B;
 Tue, 15 Jun 2021 17:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623778191;
 bh=38JelWkBVrb1iUB2+ACoZ3vPaIr4XdmxQrI+4XMqupc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UJt1n0ls189Ad/QEKwY8yffRNrbFNvA299X0mCuS0dchWw3DEmzx4Tn5o8Vd1KZEV
 7AonNI8LZf4voHiR2PmQ5jaFHX6yc6Ger1stDvkPoDdi5iHFlt/uGKCyniGR084MgE
 IzFd5d6zpuqmXeG3iloKzWfmP1XOcvKjtxQQ7kvIEj+dx/MLO2o6i5bV3Y88NsNhio
 yRmny0UtHQRaPswoDSURxQxC6j+9KhWGnNmKXdPNJ+QSueKcQXugGP1OedZzzowFh4
 B7TcRCVgEE304oR4nvHRidUG/Uvu9xeB01t3oIk5EbrjNB3zjsjyKE59GfTJDU6D6O
 01p08OkPBBXEA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: wcd938x: remove incorrect module
 interdependency
Date: Tue, 15 Jun 2021 18:29:19 +0100
Message-Id: <162377763944.21612.1027421204392314156.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615132829.23067-1-srinivas.kandagatla@linaro.org>
References: <20210615132829.23067-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
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

On Tue, 15 Jun 2021 14:28:29 +0100, Srinivas Kandagatla wrote:
> For some reason we ended up with cyclic dependency between snd_soc_wcd938x
> and snd_soc_wcd938x_sdw modules.
> 
> Remove this cyclic dependency by handling them in respective modules.
> Without this below error is reported during make modules_install
> 
> depmod: ERROR: Cycle detected: snd_soc_wcd938x -> snd_soc_wcd938x_sdw -> snd_soc_wcd938x
> depmod: ERROR: Found 2 modules in dependency cycles!

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: remove incorrect module interdependency
      commit: b90d9398d6ff6f518f352c39176450dbaf99e276

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
