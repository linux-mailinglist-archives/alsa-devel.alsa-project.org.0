Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878EC355A92
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 19:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2461E166C;
	Tue,  6 Apr 2021 19:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2461E166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617730915;
	bh=qeca+b4H0nIapO5UzP/YbMsJrZpQiO+jgLRy/koUfyM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SX5r7QMEFgVOA/SZ9602djctJyDlxdiP+3OzbYWhiFAwnp8m+enWxHn6ui2Xvw2zR
	 UZE+eS8YOO8nGoWM6aqKlss2CYF8ls8bpnDmMaABR1UK5rbCf0UHS0vDaQBAw2p5rv
	 ec4Dx3nogqlT/32yXqMvnESxoAsL3e2p0EwyXBUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58CCAF800E3;
	Tue,  6 Apr 2021 19:40:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AFCDF80264; Tue,  6 Apr 2021 19:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62882F8020B
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 19:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62882F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RxlaIqbd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25FB3613D2;
 Tue,  6 Apr 2021 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617730802;
 bh=qeca+b4H0nIapO5UzP/YbMsJrZpQiO+jgLRy/koUfyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RxlaIqbdu+c5tgETxhAEuDDllk3hQ+aY68reEb5SSpf9DHFe7FxoNFKFwM6Xvfx64
 C3Ga3Cm+WHhLRn0EG+q00K7s6kGSN21yau8FsCrKYVJoZ+MspTtj08/QoxLRdWTQUl
 +g9GdMyzLmTmHC485UiU5T69BkLgWvNqbgwQ40gKdR45ia4yoQKH9208wsW+aHJ5h9
 ZHuQMRR/pqjw3jc78ofJiVvOwplPw0TB4xzQx0q6Jfle7F4/RClXkcgEV79WJBTx7m
 ZLKR0HfBTkG9FiVsbdgJQTgLOTSbMO2ZKQwVbq997IpcHVpEiil4ekDy/dxhZmEgB9
 Gft/tBBSFZB0A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] ASoC: ak5558: Fix s/show/slow/ typo
Date: Tue,  6 Apr 2021 18:39:39 +0100
Message-Id: <161773049108.51713.8947694519084093038.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1617458365-23393-1-git-send-email-shengjiu.wang@nxp.com>
References: <1617458365-23393-1-git-send-email-shengjiu.wang@nxp.com>
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

On Sat, 3 Apr 2021 21:59:25 +0800, Shengjiu Wang wrote:
> s/show/slow/

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak5558: Fix s/show/slow/ typo
      commit: a43508995a913893c5f303e56415d06432b15619

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
