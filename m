Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DDA3CD6C8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 16:39:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F90165E;
	Mon, 19 Jul 2021 16:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F90165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626705574;
	bh=38Jbzd1yQrQWo+mK+beG3N2hWgTIWWiTivl7xHlI60A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oXKODu2yDUD4Ht4zJWz1Hf40xy7mebvjwodELvF0xRInCDVnl9B1pHQcEQiqYnQi1
	 Us9oo5WalC7tZs1kQliCEiqjPEgubnMvNaXI97ytwmN+o1OoAG1F3vIyE3URmjAmW1
	 TSBwVzkZIwfq+8raoepYPYJvZKjf1jy3SRblxZfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA0F6F80256;
	Mon, 19 Jul 2021 16:38:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0552DF80227; Mon, 19 Jul 2021 16:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F269F80169
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 16:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F269F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PDZnwXbm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C26B26113B;
 Mon, 19 Jul 2021 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626705479;
 bh=38Jbzd1yQrQWo+mK+beG3N2hWgTIWWiTivl7xHlI60A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PDZnwXbm+zL8cd4niMrPbTc0eAcKOXuV+Fz4b7nhhiW5kAxJgAnpz9vEMi+kCXwk+
 xEAqF9YTkz/gG5UcefWI4OKWYZsEYMrnh+37BugOc9Jr9LwCOx6Am+tVxAtVWgiu46
 X8OjinTnDQjPFkJNac4KIuuOFYcYwVN4i/qJQUqnSqdk5lk+AYUlx9p8AoUZLrUiNM
 OUjf95LCb8bDYn32nFQsTy9sK6nLl9N83vzphciqd9XqhfhRNF7TWfXTZAE1pDoUE0
 SEu/X0nmzx4do0GzRWLRBRX4kiyqLexITBzolNkxjaS2I2ziNTcIgFX2pNCP8bpDHb
 XTl1nWBnSP9dg==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: ti: j721e-evm: Small fixes and code
 cleanup
Date: Mon, 19 Jul 2021 15:37:44 +0100
Message-Id: <162670491598.20803.9221803957281036232.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717122820.1467-1-peter.ujfalusi@gmail.com>
References: <20210717122820.1467-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Sat, 17 Jul 2021 15:28:17 +0300, Peter Ujfalusi wrote:
> I have found two issues with the machine driver which for some reason did not
> caused errors but they are certainly bugs.
> 
> The last patch is just to convert the IDs from define to enum.
> 
> Regards,
> Peter

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: ti: j721e-evm: Fix unbalanced domain activity tracking during startup
      commit: 78d2a05ef22e7b5863b01e073dd6a06b3979bb00
[2/3] ASoC: ti: j721e-evm: Check for not initialized parent_clk_id
      commit: 82d28b67f780910f816fe1cfb0f676fc38c4cbb3

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
