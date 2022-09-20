Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C4D5BEF31
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 23:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE57852;
	Tue, 20 Sep 2022 23:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE57852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663709658;
	bh=opp54YdgdUw3pmnZ9FUXDd6Zzip7bJbUuN39p0Dwp0o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KCVUANXD9R0UVEtoj8YKihZwkzgHoJmlr1WtSS+Qs69cr55+KNl2/vYXBHaWNNxRU
	 SeyAdYKtpglOifqtlvrvCyAZnxbusSG27XhmhSCPPyzQjImYCondW/2E3GPyIDt5Yn
	 MGpboFmMdWQnjq3vaJ0X1wNZxK2BSsVKLu8TkApo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 951EDF801D5;
	Tue, 20 Sep 2022 23:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBB9CF80171; Tue, 20 Sep 2022 23:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7936AF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 23:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7936AF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZyxWmwbt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABC8CB81A71;
 Tue, 20 Sep 2022 21:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5A4C433C1;
 Tue, 20 Sep 2022 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663709592;
 bh=opp54YdgdUw3pmnZ9FUXDd6Zzip7bJbUuN39p0Dwp0o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZyxWmwbtFzvCoeDUaSpfFsgdDTO477aNmIc2tFtQmbUwl8L0+OAlJBXgltXoWqiBw
 ClevRYARu4ub1f9/esLpW0hURV6q67pwC9s5x7JvRVTJxBfSM57djw177U6kE5dV3o
 Xuz73u8/OnW8WSD3Gzo5oyU0MCD04b0qv1gX5ayp3tOZ7YVcwd31GQzaCkrNb5UcOy
 w9bR0v3TkUUq9c+uJH0hqf+nZUbY/l2I9SqgHvvdRNVuSBdV+VcGKaoTkqiqk87OhL
 bhZkKLbxADjZLeuGnJJhRs14IAjTqEybxCeH1R93boCZec7lGUwGBFpyESGGDEgUIs
 ocoyEgv1o+6Ww==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: soc.h: random cleanup
Message-Id: <166370959062.476248.7499597459225158192.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 22:33:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Tue, 20 Sep 2022 06:31:47 +0000, Kuninori Morimoto wrote:
> These are random cleanup for soc.h
> 
> Kuninori Morimoto (3):
>   ASoC: soc.h: remove num_cpus/codecs
>   ASoC: soc.h: use defined number instead of direct number
>   ASoC: soc.h: use array instead of playback/capture_widget
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc.h: remove num_cpus/codecs
      commit: 3989ade2d1e7ffc900e3842dc542b9e4bb3618fe
[2/3] ASoC: soc.h: use defined number instead of direct number
      commit: a26ec2acb2043a52c41d2b651b30d2df475f4263
[3/3] ASoC: soc.h: use array instead of playback/capture_widget
      commit: 3289dc026a8cf5d6469eb49d838bc971f4370f9d

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
