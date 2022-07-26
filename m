Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC679581910
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 19:51:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFFD9F6;
	Tue, 26 Jul 2022 19:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFFD9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658857888;
	bh=oR+l1h1MF1vN8m78iopGfwp9crpfWIbUSuis05J8Ap4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnkF8C3BE9Ftf6xRKqFnz6YNwJ7BRn5d8M3xsLE+s0VXVeriqLiyCNDSv43ggjCpH
	 kuLZ3qZ14qw8OelDzytP67Q/S96VowERAlyXegwRtskJkD+NfZ+qoKkcrdRT2L9+wI
	 07b/vjuEyq/Ra96YDq83PWG0uZCx4P37Ex9K5sdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 697FFF80271;
	Tue, 26 Jul 2022 19:50:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6362F8025A; Tue, 26 Jul 2022 19:50:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 524F0F80155
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 19:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 524F0F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bgl3T8GB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1846B818D1;
 Tue, 26 Jul 2022 17:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85B6C433D6;
 Tue, 26 Jul 2022 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658857811;
 bh=oR+l1h1MF1vN8m78iopGfwp9crpfWIbUSuis05J8Ap4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bgl3T8GBdM+1bQh2EuhsjginkSwhpoKnkXfBMHDJ7WbakC98g6fT2A1Xg3exBA+NM
 ZbOm7HmbPAmyzge/s7C1/89phrvSnyQQCVj3fjc7O81RrOxOtCT2xo7sks/6gbqlnQ
 fddpTJZ++rYugGepeMBX80j46zd9QRwOSnbKWU7hf/hSy2yNjmSrFEKMEZ5urzYs19
 cp/E9mUklzuMhz6H4uKI6huGJ/VXHS1IhpT2MPSbRj2LdMghvWPSElkurfjemnWoBD
 nYozsqj6v0O4dMaEAt43K8LORu9grkwpRhiwC9K4kcjG8rGbXMqIOkiWfAMtOY2TRA
 eT+GNDerlYfsw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, angelogioacchino.delregno@collabora.com,
 dan.carpenter@oracle.com
In-Reply-To: <20220726153130.27584-1-jiaxin.yu@mediatek.com>
References: <20220726153130.27584-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: set the correct string to
 strncmp()
Message-Id: <165885780832.800364.7549018957037633100.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 18:50:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 26 Jul 2022 23:31:30 +0800, Jiaxin Yu wrote:
> Fix Smatch static checker warning. strncmp() here only needs to compare
> the first seven bytes, so in order to make the code more clear, only the
> first seven bytes of the string used as the comparison are reserved.
> 
> Bug report: https://www.spinics.net/lists/alsa-devel/msg145608.html
> 
> sound/soc/mediatek/mt8186/mt8186-dai-adda.c:78 get_adda_priv_by_name()
> warn: strncmp() with weird length: 17 vs 7
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: set the correct string to strncmp()
      commit: 7df92384c86f36d0452e7abad21c7eaa91aeeef7

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
