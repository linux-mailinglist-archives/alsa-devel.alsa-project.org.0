Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84103DBEB9
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 21:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF492114;
	Fri, 30 Jul 2021 21:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF492114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627672028;
	bh=0PaVXE0fKAgciaSbmOSivXJdjAmAJWpo/tWUhvFqfzg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oUe0PRgxuXXAv8susXSbJEUIsEuho1RsEwzUmCjZZM19+EoJsygV7y1HNR0vX6yym
	 omPJl64/GY7eTWqH62n/kfXzUbh247teyOmt/PnR1Z0KEr4TP2mUKnbcaIeUFhNHhi
	 Kkqax4cbcik+u1sS0fTCpDbMf5tyboxV/3iClok0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D095F804FA;
	Fri, 30 Jul 2021 21:04:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9306CF804E3; Fri, 30 Jul 2021 21:04:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8465F804DF
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 21:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8465F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s4dBVKR1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDEE760F46;
 Fri, 30 Jul 2021 19:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627671837;
 bh=0PaVXE0fKAgciaSbmOSivXJdjAmAJWpo/tWUhvFqfzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s4dBVKR1OVJLd82wB0inNF23HNMUe29NBFB3NHN4vosHJe0+YO9I7eDPcGx9TBi4X
 P2xS86Hiv3QxjELCsaEnMbZ7pLWJnKm6+DszmLHaxQoVUr8KGWVrH9kpI9oya3T+nF
 Tv2IoQbUe5hP1bOi1fw94Dnaul/ccc8gKnAZehLv+buyg9CwrnhFb1Z0FKgfOB56hE
 D2BARAq/B3jyIU82n1SOUS1Fu1QnkaWJP5N09qRHYsAIGXFKo07IpajARN7zhBwlEl
 sQC9QakzinfKZP3s3GvSa40Pvli3DjZSVrD5BuX28Nqc5HcEF9KxQKcqDpdtJwt8ZY
 uyy3YzEbjFZRA==
From: Mark Brown <broonie@kernel.org>
To: John Hsu <KCHSU0@nuvoton.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: nau8824: Fix open coded prefix handling
Date: Fri, 30 Jul 2021 20:03:36 +0100
Message-Id: <162767143674.56427.3667607260376022302.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728234729.10135-1-broonie@kernel.org>
References: <20210728234729.10135-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 29 Jul 2021 00:47:29 +0100, Mark Brown wrote:
> As with the component layer code the nau8824 driver had been doing some
> open coded pin manipulation which will have been broken now the core is
> fixed to handle this properly, remove the open coding to avoid the issue.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8824: Fix open coded prefix handling
      commit: 1d25684e22516f1cff77176d288b1da02fff57bb

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
