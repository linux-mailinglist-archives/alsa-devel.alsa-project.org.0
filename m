Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C5B49B65E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 15:36:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0BC2079;
	Tue, 25 Jan 2022 15:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0BC2079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643121404;
	bh=Z0/BxPj1f0zGFFhou0DpMjIeUZvUYaF7CHh5vwihvLo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UjkvEYTgfwuAuVvqX2dD4EMLDpNKwSG/YhgLNyaFweRIiwon5fE5RwoqjeF21XPEr
	 ++TVG+SgPULkdfIlQHBpGSeaJD2vAyKL8aYS5jDkGO/pmYALOxdtuvV3WPehY8HyOj
	 QAw5AWW/w2hadvV25JGNaMTqccobXJeXy/17ErVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA584F804D6;
	Tue, 25 Jan 2022 15:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCCFF804D2; Tue, 25 Jan 2022 15:35:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFE50F80161
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 15:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE50F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rrrYkTHg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFEEBB8180A;
 Tue, 25 Jan 2022 14:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65418C340E0;
 Tue, 25 Jan 2022 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643121300;
 bh=Z0/BxPj1f0zGFFhou0DpMjIeUZvUYaF7CHh5vwihvLo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rrrYkTHg+aQl2BGBDEQeU60APeqwLT9THsb7j3lv0VgcGhYpN2yYRUEmI48RNhSrE
 XBHm6apMgn46VFHbiUfv9NA0582AvvsmTQrxTEbbELdHThgsR1bQ/bQWX5j0WNbitK
 i2WulknE9grM1dJfSwT+ia5VeLZ0OmHOR2STNP37cm8FCLLuVug7tsyc6RgmWdccgQ
 R2mzUX0HNlUHvVUX4KHvqlO+Cb3M6xVpL2SBjLz+nU2Iy2DUk8tQZtR8zaDlzUyOPs
 uGsRzINx5Qn75Gm6wmxjFOZ4Wt/NjJvO6BYbTWNgvwadIWKx+ZMtTjRyz6MrTKo1P/
 vrs/V2U5zAYYg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Pavel Machek <pavel@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220125132457.14984-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220125132457.14984-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: sh: rz-ssi: Trivial changes
Message-Id: <164312129811.3598034.12132731428429313313.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 14:34:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org
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

On Tue, 25 Jan 2022 13:24:54 +0000, Lad Prabhakar wrote:
> This patch series has trivial changes for rz-ssi driver. Patches 1
> (partial) & 2 are from series [3].
> 
> patch 1/3 is just a cosmetic change which was part of patch [0] where it
> uses a do-while instead of while-do. Patch 2/3 is from series [1] where a
> helper function is added and patch 3/3 is a new patch which removes
> duplicate macros.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: sh: rz-ssi: Use a do-while loop in rz_ssi_pio_recv()
      commit: 7276d3f329c633340f3c539ce35ed254d2fe467b
[2/3] ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
      commit: 962ff7ecb60b684fe15b135ccbe07628b8bb522a
[3/3] ASoC: sh: rz-ssi: Remove duplicate macros
      commit: acfa1e2c2ff5cd7fb7948b0c5c2057acd9dceb14

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
