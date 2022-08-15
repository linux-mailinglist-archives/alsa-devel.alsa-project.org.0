Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7001D593315
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC901654;
	Mon, 15 Aug 2022 18:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC901654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580695;
	bh=e7z1wZFXKyKTx+/Gp205MIBB5Y2JE/nLNvE5mKdLmXo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QH5e8AN0Ye8tgmP6mkdlIMIyRXDEM3MswRuVIBqvGl5NkRzvcIXBkjMqHDCMc/j8q
	 7bjsKB4HbE1kyRjnRbGMTg44rt+W9tSDqvifaOGB/jGDoKhng7R24VKRzqoGyQZ/CQ
	 KfOAGbsDJai2AdMc6MwTUbYcgRKnzVjoqwY5Ou80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 956EDF8055A;
	Mon, 15 Aug 2022 18:23:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81AFCF80552; Mon, 15 Aug 2022 18:23:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CD9F80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CD9F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="swWLDFdw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83067611B1;
 Mon, 15 Aug 2022 16:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB92EC433C1;
 Mon, 15 Aug 2022 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580581;
 bh=e7z1wZFXKyKTx+/Gp205MIBB5Y2JE/nLNvE5mKdLmXo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=swWLDFdwixRMFnyIcl35ZTLWeedljORzZDGDlFZh3QvDRfNe6/gmdy6t5vNSOUCMs
 cFISGVQPxpedO9pFaxqUTBkVeCBDd9eaI83aFsIZwpehtBo00koo7k2f12NZUZPKvy
 SmcfpEZvylc2uRegQo9l3/Wl6HwIx06MRNmBLp5zar4H1r/mPBQANOCllbgF0Fcjg4
 rT0d8M16VP0HWqCwV24Mced9oCvNfoPV2ciZw7xFBXfBlUr2gZ6FWsB4+60TPboZsH
 wz1ffFFcu69E/UwtwCCJugZM5Nlmb6Q26yx6CJ+t6gFvWkANg89rGPfSdwd30gSBEv
 STpwYIxwladCw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <Yuo7LGPk8KnBW6ac@kili>
References: <Yuo7LGPk8KnBW6ac@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: remove unnecessary NULL check
Message-Id: <166058057968.769843.14245211698253942822.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:22:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Wed, 3 Aug 2022 12:09:00 +0300, Dan Carpenter wrote:
> The "i2s_priv" pointer cannot be NULL.  Some NULL checks were deleted
> in commit d7bffbe9cbd3 ("ASoC: mediatek: mt8186: remove unnecessary
> judgments") but this one was accidentally left behind.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: remove unnecessary NULL check
      commit: b9f0a8ffd6265e7d8c7464a7990330da85ee07ef

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
