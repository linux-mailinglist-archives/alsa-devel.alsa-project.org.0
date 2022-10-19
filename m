Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC960447D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DFAA75C;
	Wed, 19 Oct 2022 14:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DFAA75C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666181191;
	bh=F/vs8b7abjKQcTaqlC59wWBxEf22jzV2p9r8gJVIZGE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/lV7doDbYg3EUWzCkSlksl0tKc6lnEk3NWuvhePW07oALbwxp2NK8NkBcvlS5jCa
	 wKc3xoBD5BbJYo9B8E6JMqEUFfqajDTGl4ClI0/6x8vaWAa0isqE6iaCYZ41b/zhft
	 bfsRepIdKL/6/G6JvGGxhqHqxHYQ4burFoBfCsCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 306C1F80528;
	Wed, 19 Oct 2022 14:05:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B640AF80517; Wed, 19 Oct 2022 14:05:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43A39F804CC
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A39F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E+NPxH+N"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5495B60F57;
 Wed, 19 Oct 2022 12:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3379FC433D7;
 Wed, 19 Oct 2022 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666181107;
 bh=F/vs8b7abjKQcTaqlC59wWBxEf22jzV2p9r8gJVIZGE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=E+NPxH+NYowTYhFvZA/si/KHWYqSmzmJUZSDAPHP3oaYblp6TcgreK0gD16Sb2KuV
 2yXfcvSM9i/vdsolg6CMdMSqygf3/mTElc7vXfEqyaOs6WCaPEOH+kQjATgDDbPMwI
 ydvoF66VcwKUbmzxRdoEQ1iYoiaCdYfIka0gZg1dzvIR5S/n9miXjFqW/q76rQk6GT
 JapIr8CTHoYjP8t419TzGTskGgJrRwUHXt3yM31BhZEI53aiCPe9x6iVzTTq7XkwmK
 FdkU3nlAOoCCG881txjNg4BGmBdWMSPZsFQO52Y6V7BXAgqyJLZO38F4nEmhY25n6x
 YPunp94YoomwQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Colin Ian King <colin.i.king@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20221018152928.942186-1-colin.i.king@gmail.com>
References: <20221018152928.942186-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: twl4030: make read-only array ramp_base static const
Message-Id: <166618110593.80223.11956786873062777747.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 13:05:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 18 Oct 2022 16:29:28 +0100, Colin Ian King wrote:
> Don't populate the read-only array ramp_base on the stack but
> instead make it static const. Also makes the object code a
> little smaller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: twl4030: make read-only array ramp_base static const
      commit: 67860d2a8e0db7783f680f6f1c1600ed34ed3a97

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
