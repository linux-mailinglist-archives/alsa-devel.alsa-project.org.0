Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 776396079FF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 16:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05227B230;
	Fri, 21 Oct 2022 16:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05227B230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666364215;
	bh=ezvjYc+rhZy26pQ0cAF1QNG1TcfOw/mpocoE4BSrq2s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q3UeNoFl2lfcsjdSxcBEE+HYiykZ6PmMuXo+iK+BJYhQTGpNudwFE6y0WQOU7/hU7
	 EDpQ6yp5Xx/WmFVFZRpnjLM8HK31XOSrq84TCi5yw+v0A23Aj+2wlFdzhvrVLkTxQx
	 z4TFc5xu4I1wV+imMNQxIwBe6+DUvdz8wNKOgQf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B9E0F80134;
	Fri, 21 Oct 2022 16:56:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E13BEF80256; Fri, 21 Oct 2022 16:55:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5644DF800B8
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 16:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5644DF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UjguJfdw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E3DD61EE5;
 Fri, 21 Oct 2022 14:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE27C433C1;
 Fri, 21 Oct 2022 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666364153;
 bh=ezvjYc+rhZy26pQ0cAF1QNG1TcfOw/mpocoE4BSrq2s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UjguJfdw1jBgJ0iv8x+X6JQdKK/eQt8zS1JnqRQ5eST14Hz+A5oQJtq8+s5KVU+dZ
 R3Tp21qD0hS3SUoHTE9K2EJKGHjoOYfJ+aiB19VsTjrjVrMC7oPhDolj6MmHCWibqt
 DtCa/+eDT4AU7yPdKcjXIAKn/XwJsB9FgsQsDOhKttxIUFZ6ojo1s+Wkb5yfeIIclr
 +NrYV2LLOAy01PI39xoZWJWqj7jg7N77ekJw2BdGUQv3UlEEzCrMN2ibF+2oQQ/09x
 KURMXtEAhd7ZKjI0epDDp8qoVDzSaZ4BOurE8mMAfVb4UYiVG/7jsQ3YyLp5lxJ/GG
 xgBswygW4VVrw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Leohearts <leohearts@leohearts.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <26B141B486BEF706+313d1732-e00c-ea41-3123-0d048d40ebb6@leohearts.com>
References: <26B141B486BEF706+313d1732-e00c-ea41-3123-0d048d40ebb6@leohearts.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo Thinkbook 14+ 2022 21D0 to
 quirks table
Message-Id: <166636415149.251337.3450241153034990472.b4-ty@kernel.org>
Date: Fri, 21 Oct 2022 15:55:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Fri, 21 Oct 2022 14:34:32 +0800, Leohearts wrote:
> Lenovo Thinkbook 14+ 2022 (ThinkBook 14 G4+ ARA) uses Ryzen
> 6000 processor, and has the same microphone problem as other
> ThinkPads with AMD Ryzen 6000 series CPUs, which has been
> listed in https://bugzilla.kernel.org/show_bug.cgi?id=216267.
> 
> Adding 21D0 to quirks table solves this microphone problem
> for ThinkBook 14 G4+ ARA.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Lenovo Thinkbook 14+ 2022 21D0 to quirks table
      commit: a75481fa00cc06a8763e1795b93140407948c03a

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
