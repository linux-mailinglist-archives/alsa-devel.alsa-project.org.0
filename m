Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2F3DDBD7
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2D51736;
	Mon,  2 Aug 2021 17:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2D51736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627916703;
	bh=nS6WPDPr88n8oDDSgoEL5dgbm9vIRBu7xdEtK4TWgt0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcTGbpIYpLaDlOOdQNKtPKDZOE3gWGpw4Fn9B5Jo6rV3QegP0/bJ0n/VcuL0PFwel
	 HmWe4Tu63NLVcaLu/+SqNpLy7a9pOLM/Imz++iHnmLHDh+GM1s52mmSg2IsEfRqrL/
	 nM1Cj6l8nOrPnmSVslbYtj1V/a1EIidRX1P/mO+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 536E3F80271;
	Mon,  2 Aug 2021 17:03:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 103DBF804E5; Mon,  2 Aug 2021 17:03:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81965F80271
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81965F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qQ5e9oz4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A397F61057;
 Mon,  2 Aug 2021 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627916579;
 bh=nS6WPDPr88n8oDDSgoEL5dgbm9vIRBu7xdEtK4TWgt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQ5e9oz43I9pYmR1Ika1qyA/pz9x1re6Y8/ajUu1oIBvdDX7tHYTyB2KOwmo/PrGO
 GJK4UmJ60B+ccFMLJrxh/8QUy6k1eXVpyI09DGuUAdVvKJKRcQnM4hKGYepsN5wE0v
 Za5fqSHMBAhqcUoZFjBN3s9FIzAzR6ZLzDBhPrZA+f19O5CJ0vvqqSfL1zB37udae3
 tvl0aoDhvWYwD/F3ETLK+rdnBzncSlQX9QJHZOjmidDw/xE0Uq1dsRsn7TNhIWZgun
 jDptCLMST7rlvi+Wl8t6zhAY+ItlgyJ/eSOw5NXAu7CbpvfRWo0elZzb9VRoFhNo33
 9oKvDF7rBkvGg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Colin King <colin.king@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: rsnd: make some arrays static const,
 makes object smaller
Date: Mon,  2 Aug 2021 16:02:35 +0100
Message-Id: <162791613030.1468.1113702427634488424.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210801063237.137998-1-colin.king@canonical.com>
References: <20210801063237.137998-1-colin.king@canonical.com>
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

On Sun, 1 Aug 2021 07:32:37 +0100, Colin King wrote:
> Don't populate arrays on the stack but instead them static const.
> Makes the object code smaller by 242 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>   23827    8764       0   32591    7f4f ./sound/soc/sh/rcar/ssi.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: make some arrays static const, makes object smaller
      commit: 6dfeb70276def839aa605edd274f8e9f6189dba3

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
