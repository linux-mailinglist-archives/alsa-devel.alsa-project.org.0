Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38939AA59
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 20:45:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCE95172E;
	Thu,  3 Jun 2021 20:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCE95172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622745920;
	bh=14roOXPcs5DCgt6AKrjuC09a0UVpqCCBpqmcJOOjjOo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKWatInUQVsny0DrGwLY0OECEs/1f5DM1PO+2/KTGcvuhRkEixTqBIjCzOhZ7ZCm3
	 64WkW3p0w7W2smQ/BfgODI4Z6vbB5Ttx5v70f+1vQn42mpy1ppIcK2fuR0ld6W2o4d
	 ix2dYP+sQ1KwYq7BQzVCF7jz5AXdwGQtCh/P0xXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7335F80254;
	Thu,  3 Jun 2021 20:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC50F802E7; Thu,  3 Jun 2021 20:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42986F80103
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 20:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42986F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t8wUNjTc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3CC0613EE;
 Thu,  3 Jun 2021 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745773;
 bh=14roOXPcs5DCgt6AKrjuC09a0UVpqCCBpqmcJOOjjOo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t8wUNjTcGcWkZ5DfqA0kY0P2Izzr820EMwg6e3LAOS6MPs/RLZX6KNbxgAPK5ZMU9
 /NT8Ca669gPagahF46HoK+HiRs3swYgS1UkOhfdQP1BFDAc/K2T+HlsTQZ6pkYzumU
 UXYOh6qs9dj+Y7+qY2xUFPzjGIcIvIHuB+ejKkzdGzzy0Sp5cC5DQt0lyBzm0gvmtR
 Meo1sEhEO4cuKnv6wBFjyugWnYKHf66WegNc8oPaAwK0dK6gGu8IsIfkQj9y629ldR
 lp4gIU6HV+9zlmyCwUwYkWvhw+gtfa4Uod9w9PaBjnIIcPY4otK6xkO2yjgK9V+XWg
 uLyAW46gf6tNg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ASoC: tas2562: Fix TDM_CFG0_SAMPRATE values
Date: Thu,  3 Jun 2021 19:41:58 +0100
Message-Id: <162274557550.14795.17431456709023435037.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210530203446.19022-1-richard@nod.at>
References: <20210530203446.19022-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, dmurphy@ti.com,
 grandmaster@al2klimov.de
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

On Sun, 30 May 2021 22:34:46 +0200, Richard Weinberger wrote:
> TAS2562_TDM_CFG0_SAMPRATE_MASK starts at bit 1, not 0.
> So all values need to be left shifted by 1.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2562: Fix TDM_CFG0_SAMPRATE values
      commit: 8bef925e37bdc9b6554b85eda16ced9a8e3c135f

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
