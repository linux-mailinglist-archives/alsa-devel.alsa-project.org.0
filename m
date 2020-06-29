Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D44120D08A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 20:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBB1851;
	Mon, 29 Jun 2020 20:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBB1851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593454674;
	bh=IBzxuR0hFcqeAgG2EU4dUDO26QpO4vvo3eIUQ7aMYKs=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OsfHbKmfw168uJ+kMm+kGA0VtFqe+FIK1vDOYmys+DkRKsf51zgchQmj9eGaesTRz
	 yeNU+gQHzc+tmTw7XLpHH1veElRp5luizDohBc9O1uEZuhDRSFK41Do2m4GU61lykV
	 7XuXYArslvVrqHK9bCtFaqHYoP8SqgvRrswdbc4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C067F80256;
	Mon, 29 Jun 2020 20:15:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF540F8025F; Mon, 29 Jun 2020 20:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7064DF800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 20:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7064DF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HhFbS7Xj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA1A6255C6;
 Mon, 29 Jun 2020 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593454514;
 bh=IBzxuR0hFcqeAgG2EU4dUDO26QpO4vvo3eIUQ7aMYKs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HhFbS7Xj84k5nI21HMV4EP97C8ujn6/pwl4GBB890EsnHh3ZXTOLzkKgzqeZl81WU
 Xijs/8HCFr6FhZk9osR4uMa+tVN+OsJjzUheuC352EhRUC14A0dbpu4dyacGK2brPJ
 ZP7SQkQ9NYQ3oZ7m0FAZXPHq8rzV3OnVtt3UpK/Q=
Date: Mon, 29 Jun 2020 19:15:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <a9f59f30-8cf2-ea82-567c-1706fd64fe62@infradead.org>
References: <a9f59f30-8cf2-ea82-567c-1706fd64fe62@infradead.org>
Subject: Re: [PATCH -next] ASoC: Documentation: fix reference to renamed
 source file
Message-Id: <159345450675.54191.15555131185550091270.b4-ty@kernel.org>
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

On Sun, 28 Jun 2020 20:23:33 -0700, Randy Dunlap wrote:
> sound/soc/soc-io.c was merged into sound/soc/soc-component.c, so fixup
> the Documentation to use the updated file name.
> 
> Error: Cannot open file ../sound/soc/soc-io.c
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno ../sound/soc/soc-io.c' failed with return code 1

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Documentation: fix reference to renamed source file
      commit: 4946cd45ef665d99074796fdd8ce04ba37ce1bdf

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
