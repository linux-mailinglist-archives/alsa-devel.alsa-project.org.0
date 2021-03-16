Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D458033DC0C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 19:04:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712BC18DB;
	Tue, 16 Mar 2021 19:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712BC18DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615917855;
	bh=D8loEQ56HKcCKPHpPRZyps50hlJbx9hUfxJrH4kPrUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNzFWjfCw4yoXYeFNf3128HHuEv/3aT6E5vy7lve5yLJc7urTk/LDqQvbJpjSWtt4
	 528Oy3+1wc5tiLbtplhpeppSQJLzphXWNGxarMHPbw5jZjwupYn/LxMriqpnWt8NlH
	 BiAFAOfKIJtp9nqiZUGjj3SOqOMXko1emzFpU7b4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEEEF804D1;
	Tue, 16 Mar 2021 19:00:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59A40F804AF; Tue, 16 Mar 2021 19:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9C16F80430
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 19:00:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C16F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SMS97Ik5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14EC265137;
 Tue, 16 Mar 2021 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917617;
 bh=D8loEQ56HKcCKPHpPRZyps50hlJbx9hUfxJrH4kPrUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SMS97Ik5g11s6ffUhBsithKvysjHc4fPT/p0JQe06lZYIYQFOLlavz6dUWSEA9C3+
 8y9PmCgXCCDaRV4y7XF928vxF7ytuQ7WP3lT0yX0IxmKhaiUyvE2/GVpsDRJzPVJvg
 LnxO/eTPlVJ4RZnB/FIZoCTRTi8m1X1SZpVgDpoT9ba6j33ZUWL1mbRMb9YWUuZVko
 3zhcPR2C2kMBxg0IU9t98QD21KOZwu5oHnixagcbnjMWQYnlvCF0SbI7+PZTkjIXrk
 9Dzn0j7zm+3vPQJOmchITGwXkdnVFWxdlVQDbNvjm+cM4Vvbbtt8M2ad5AA/jThUwn
 o5XNe5Ad8yhPQ==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: mx27vis: Remove unused file
Date: Tue, 16 Mar 2021 17:59:47 +0000
Message-Id: <161591744696.13544.11463160601004848129.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315193842.183042-1-festevam@gmail.com>
References: <20210315193842.183042-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Mon, 15 Mar 2021 16:38:42 -0300, Fabio Estevam wrote:
> i.MX has been converted to a devicetree-only platform and
> asoc-mx27vis.h is no longer used.
> 
> Get rid of this unused file.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mx27vis: Remove unused file
      commit: 1d49439c04792a4a3d8299a32b7673ab7ba13b77

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
