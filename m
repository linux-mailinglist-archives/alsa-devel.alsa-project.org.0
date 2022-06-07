Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3943753FC5D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:53:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB83C17BC;
	Tue,  7 Jun 2022 12:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB83C17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599180;
	bh=AXXJpNaKkdG+7UQKkjCCo3D49fnR3t/hk4qP9P50y44=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tR42XJGOeeFTZadH0bGdLJzKUTrxug7UZ7AxAHMn8calqqls34f2axL0xfMSlooQ7
	 kRr93i6sdvJGy5txqGL2SpXirTY6iOjM2Xldb+/LdsG6OceDStv2oyUiIfMgQR2fCt
	 xgyNLpbAgXyl64tm6xEw4P1Zi1pFOI9EZx7uBc0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4EDF80159;
	Tue,  7 Jun 2022 12:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EED4F804E6; Tue,  7 Jun 2022 12:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D874FF805E4
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D874FF805E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mL7XmWnZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9CD861578;
 Tue,  7 Jun 2022 10:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3142C341C0;
 Tue,  7 Jun 2022 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598768;
 bh=AXXJpNaKkdG+7UQKkjCCo3D49fnR3t/hk4qP9P50y44=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mL7XmWnZ4DH2YT5pHV0wtRdY1iYtU2Sg45NZFMb7kc5J77S4okvTh/kr3wDZDc2T/
 U84TfYl/fQNgPV02O7hzN5U6M3mjRSpryr7aVrC7XEIqtUoVFBGy1JX5M9GGyiE+JT
 6MMcGfiN5TaDNaRm9Pozr3IdI8XOeX64LVQ+mTcyJWYYNxt+sH/NnSIQ2sT9V0gP6z
 mhqbT35K9xd6+7Eq6W4OC7g2IYILBn6FrALqyOBH4guQ9n0v4+KvXhJ18Sqmoy8VqJ
 8/rWZ0ouCSX62snUe6dCLZ60jF0pMYVOJ1tc/j3ocN7LoE1RaI5kbxjLZ4B1qfiu4B
 tUP0UMXh0nCcw==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20220602071809.278134-1-chi.minghao@zte.com.cn>
References: <20220602071809.278134-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: mediatek: remove unnecessary check of
 clk_disable_unprepare
Message-Id: <165459876658.301808.3499982605939074236.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, zealci@zte.com.cn,
 linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Thu, 2 Jun 2022 07:18:09 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Because clk_disable_unprepare already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: remove unnecessary check of clk_disable_unprepare
      commit: 12ba5ceb4a08d5ea776d3eaf83c0cee63fafe952

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
