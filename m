Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E914750B4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 03:05:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EE521F70;
	Wed, 15 Dec 2021 03:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EE521F70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639533917;
	bh=PdD/kEZz1HcKno0ikxLW4Wk2n8zMwuFkEba7rZMkOVM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPeIe+MZ7VROfcfI/M6dglfeqx4YsE7WE1/C5KuvqjeCGu8vm6+S7PjS5VoldPQSt
	 kKgGMGYEu6z9fGMYJkBa1TyciMY45Ub5qb/xBaJKZJjCbNLxGbkE6wBD/cYjjcgUMj
	 SdIgmbFd8xpbCrvDk0tkfbrU+gRzK71q5WPH4Mk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9913AF8013C;
	Wed, 15 Dec 2021 03:04:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF8ECF80246; Wed, 15 Dec 2021 03:04:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACFA4F800FE
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 03:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACFA4F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VOSydCFm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B69561770;
 Wed, 15 Dec 2021 02:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0352C34601;
 Wed, 15 Dec 2021 02:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639533836;
 bh=PdD/kEZz1HcKno0ikxLW4Wk2n8zMwuFkEba7rZMkOVM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VOSydCFmmkIX1mHbM72BjDB4UO/wlIDrOJTI8OlNA+pRD4KR6piFFovbslivwkaaZ
 H4UBOnUm+bUW0OOip7W1ehPGrP3gmE0LyN+428lLExd2lkORUGA95zBYNsHi5lmd4f
 PgTnGt0tUJ9aTze8Vc6f7/xChq9TgZ3cqpnXhFtlzh12/5ohf4jGO/SEYOFR4axv6W
 VslYBpfcJoEQM7jY/tYzo98pHVh96aibzJp54Dnmclsc2Qhn8RXwvw4369fjnsz9DG
 VNuZvNBPRrIxHcVUDT3vSYlcU/VGFJ/hc1sDv5LgslzQLk0qek5uJMhj0XuXrn2x8C
 Sc1oGsP7GXeUw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, derek.fang@realtek.com
In-Reply-To: <20211214105033.471-1-derek.fang@realtek.com>
References: <20211214105033.471-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: fix the wrong jack type detected
Message-Id: <163953383433.1515230.16703058858277946259.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 02:03:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Tue, 14 Dec 2021 18:50:33 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Some powers were changed during the jack insert detection
> and clk's enable/disable in CCF.
> If in parallel, the influence has a chance to detect
> the wrong jack type, so add a lock.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: rt5682: fix the wrong jack type detected
      commit: 8deb34a90f06374fd26f722c2a79e15160f66be7

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
