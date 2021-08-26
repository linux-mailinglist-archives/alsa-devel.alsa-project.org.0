Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393C3F89FC
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 16:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0293616BA;
	Thu, 26 Aug 2021 16:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0293616BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629987505;
	bh=Id9hdMS4ZVRLE8sX6tHUAZFHZyYA74j1rQP2S76OPIs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2q4thTOUpELX7ji7CwQ7y2ASnh4vV1A+MM6MT3nRbfEFoo9+XWGK+c23wxphTrk5
	 +F/jF6QlCFww6WTB1DlhND/ooCf2sgpIc4Jqsi6iORrpoz8FpzMbTrMtnacM2BnUi6
	 8f2Pc5Ms3XLcIFY1OymYjZ8Ssex3APkoVhDKrN5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 613F8F804D9;
	Thu, 26 Aug 2021 16:16:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B339F804D6; Thu, 26 Aug 2021 16:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBEDBF80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 16:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBEDBF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h3hLyQPw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4D4260E78;
 Thu, 26 Aug 2021 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629987383;
 bh=Id9hdMS4ZVRLE8sX6tHUAZFHZyYA74j1rQP2S76OPIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h3hLyQPwalKZygt/4rARZPh/L7wWvt3/aLK27jxsyYNxuZ3pe/n4X0J3cF4UWEEMW
 Pu7M3vDvPlvzJEwXitSWmyUJfECA7ej52IPb8x2XXL2+4GAEM2t7H5md29y4lFz5uu
 kik/jTyhhV3+nHwQULaNcssBhRN7DaDHbrJ3wv8gno7FUicqk1D3N5un125cStujUj
 F/cseX3ayQDm2fKaz+WY1PFapnBPus01BocUdoAtTD1g3wyc61wC9yzMtoBANnpkX+
 6qwQBeTiVoArdogg0Iu0JnV+/sIKUiig9bb1q9Jl+FkeAlHn+UnCULPNNJnfGDnRoJ
 Aoqfzfw+EDUHQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH][next] ASoC: mediatek: mt8195: Fix spelling mistake
 "bitwiedh" -> "bitwidth"
Date: Thu, 26 Aug 2021 15:15:45 +0100
Message-Id: <162998707936.5647.1881702741528479360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826112611.10356-1-colin.king@canonical.com>
References: <20210826112611.10356-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Thu, 26 Aug 2021 12:26:11 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix spelling mistake "bitwiedh" -> "bitwidth"
      commit: 11a08e05079a9328023d236b82bd7981bcde0852

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
