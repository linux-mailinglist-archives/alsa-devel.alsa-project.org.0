Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5549D4F2985
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9EC0181D;
	Tue,  5 Apr 2022 11:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9EC0181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151367;
	bh=zrh6vghs2wjpbqTv1tqfq5bENYFMGsSNRdUt0yAWN5c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WKINvPzAad+EQzKg/5uulSj/V3mm6DJwm+pZB+Qd6orLLRTvMVAkIQsafOsSJSxE6
	 CLoJEEMw2Il+31n8KRtPVXiLF+VMo7FLh9pxXg/8luiz2Mpx5nPj5FmWntBkRaAGuw
	 6wK0gIRM6/ewjleti9TQe5H2QSp0z9394FMA0kqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9360BF80570;
	Tue,  5 Apr 2022 11:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BD0AF8057B; Tue,  5 Apr 2022 11:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1421F80566
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1421F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bGg50v7M"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3508B81CBB;
 Tue,  5 Apr 2022 09:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B03AC385A9;
 Tue,  5 Apr 2022 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151099;
 bh=zrh6vghs2wjpbqTv1tqfq5bENYFMGsSNRdUt0yAWN5c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bGg50v7M+Hf+yTXrOrpR1xcsEs5OJK2fKabvNa8pEirakb4/97aDkCW1Wgh/mCGlL
 O8pJ9pKi07pLqC6hwoFSM++DIISgE+5mxC1OW7Lqzb/vsSJUGulcQ0DvlCXE0eNYRm
 eGF8ZZoe0wXed5tY5LLcRmpwM2o6g2DuQGdfIeJrKs2jUccKOZF4eKNtGLvQat75Ps
 zBd1C6RwMZo0owP2Tu5yY7Y2X6MHme+3TsFQZaTjSevPWXmkHEly1V959r+LkklMbs
 EimGHqyDk9fqWuJZ0Ky9F/a1qXKhZQo0sdnCDAxLWB3NAto8mhln7DKNy9gczPHOq+
 Op+Iek2/Dopkg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, christophe.jaillet@wanadoo.fr,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <e740f1930843060e025e3c0f17ec1393cfdafb26.1648757961.git.christophe.jaillet@wanadoo.fr>
References: <e740f1930843060e025e3c0f17ec1393cfdafb26.1648757961.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: soc-pcm: use GFP_KERNEL when the code is sleepable
Message-Id: <164915109789.276574.4185820197463277703.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Thu, 31 Mar 2022 22:19:44 +0200, Christophe JAILLET wrote:
> At the kzalloc() call in dpcm_be_connect(), there is no spin lock involved.
> It's merely protected by card->pcm_mutex, instead.  The spinlock is applied
> at the later call with snd_soc_pcm_stream_lock_irq() only for the list
> manipulations.  (See it's *_irq(), not *_irqsave(); that means the context
> being sleepable at that point.)  So, we can use GFP_KERNEL safely there.
> 
> This patch revert commit d8a9c6e1f676 ("ASoC: soc-pcm: use GFP_ATOMIC for
> dpcm structure") which is no longer needed since commit b7898396f4bb
> ("ASoC: soc-pcm: Fix and cleanup DPCM locking").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: use GFP_KERNEL when the code is sleepable
      commit: fb6d679fee95d272c0a94912c4e534146823ee89

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
