Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C18D365F88
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 20:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E986A1696;
	Tue, 20 Apr 2021 20:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E986A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618943867;
	bh=HKbpvXHLAM1t6ElsV1/iQQwWGgvzf7wQs80yEisnqXE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JunvBLftp8Y3mHGgRnhP6inTPylQ9RH+eheNRU1VbzNIKzrNk/GbLaOHNntF2/mIF
	 ntn51QMbuj15gHOZR3hD5dyIGLXXPaYfxHu7r/HFPSsxm1NLxERFjMAM+O+rpO/lJS
	 h5ujUk+IPMLTnD4xn4uiQ28L3KPOPcILSuv/b4Uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 970B0F80168;
	Tue, 20 Apr 2021 20:36:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55251F80273; Tue, 20 Apr 2021 20:36:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36106F8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 20:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36106F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bDvBMfU/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FA5861002;
 Tue, 20 Apr 2021 18:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618943770;
 bh=HKbpvXHLAM1t6ElsV1/iQQwWGgvzf7wQs80yEisnqXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bDvBMfU/nYYjhMV1nzlTSo3wP+ReFOqoM1bWFCM5ZYJ5i8neT7NWtkTqvmS/8MYPq
 c38hXu4fB4EbgZhGNa16tfvSOGC33vwCwRGcwVI1lKa0fcQshaxot6RhHP4xkx2j4A
 DUNVpR3qad+OBffW9RTy8NjEh6DE2B1fB1Z3c8yBjo0PnIcu/cXIM5gO4MynyAwNhD
 2jcG2nl+xDGbJXfuIB3P0FFnlpqowQWa3r7YKTrDmVTnWsi3iuvuRsV8NzVorEYda6
 YpwIzWRcznIKsOVI0620zJDQIbpnCF1dsht5hYI3qU41zgFFdA/kWaxx09v0BPziCr
 BMa7/raGiXO0g==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com
Subject: Re: [PATCH] ASoC: ak4458: enable daisy chain
Date: Tue, 20 Apr 2021 19:35:32 +0100
Message-Id: <161894359362.35105.6842999052342514382.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1618915453-29445-1-git-send-email-shengjiu.wang@nxp.com>
References: <1618915453-29445-1-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, 20 Apr 2021 18:44:13 +0800, Shengjiu Wang wrote:
> Enable Daisy Chain if in TDM mode and the number of played
> channels is bigger than the maximum supported number of channels.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: enable daisy chain
      commit: 7342db3cddcd1d8ff54f4dff8c942e04232f1d6d

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
