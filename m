Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7793F2E44
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 16:41:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EB7166F;
	Fri, 20 Aug 2021 16:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EB7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629470513;
	bh=/IvIbEjmgNlx/GdMCvDdzvCPNqaz5dY/N1oaL3ncd7E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SnUp0u3fzF728Rndx/SaPEoAbq3eRTd/yvAXPW+iDyMTp64xjYXnaJj6pfNsosf5b
	 VMPT+UHJGjhuGiWk/rbpgq0XzVSlTuKT3nLJkhzCczkv5Lk9RorKwGXA/WsjnQAPkk
	 NqeniH8qrhfx9DYACF+CnDQQfobCoOIVmfHJ8k5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8E3FF804E1;
	Fri, 20 Aug 2021 16:40:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C53FF800EC; Fri, 20 Aug 2021 16:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78F30F800EC
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 16:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F30F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ekQ8WzRL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FF9B610FF;
 Fri, 20 Aug 2021 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629470383;
 bh=/IvIbEjmgNlx/GdMCvDdzvCPNqaz5dY/N1oaL3ncd7E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ekQ8WzRLiKRxfYfTlpuvJ2/MrSuSEIGdD3YLtZG23FvF4p68XiH9Z976edCKXivXg
 BIi0FdK/f9BG86bUUjJfI022DWlOG1mbX34B9XCm22JidMSdHXMY+tEj1d5PWx/oFM
 I+UwW9tVsBLRAGXu1SyVTfo5TMvLOecHWAQzSqr84Rj7cMET6PEGpOIv5IMl2gBqBn
 zUzfmk58oU6aRk5CXW+oLBWWJNf6OtXJkN3A+z88K6JzuFj01+he4SMbIezNGf/sSv
 AJ7Dzr9Bft5wSewKn1F8WPxD4u4PADQlfTMZnq786bzZ+9Ozi3KE5vkbA9kuq2WCdm
 etIb1K1imXE0w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: core: make some arrays static const,
 makes object smaller
Date: Fri, 20 Aug 2021 15:39:11 +0100
Message-Id: <162947011161.28998.13623392044260734959.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87tujkwydx.wl-kuninori.morimoto.gx@renesas.com>
References: <87tujkwydx.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 20 Aug 2021 13:09:14 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Don't populate arrays on the stack but instead them static const.
> Makes the object code smaller by 48 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>   20938     916     104   21958    55c6 ./sound/soc/sh/rcar/core.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: core: make some arrays static const, makes object smaller
      commit: 28889de643cd14617e28f862e6763754ad28f7c4

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
