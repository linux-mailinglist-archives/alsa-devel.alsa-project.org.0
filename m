Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 879E940F9EE
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C38F517AA;
	Fri, 17 Sep 2021 16:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C38F517AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631887590;
	bh=APz1wpNVHY4WtKghQkEC9694tQNhAk28L5fSi57hg9I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=joT0EK5T9fFSnrnOibPrfIHdVAI/Dms/Kxz9Qabb9Ar2nJ9XUI9iUyXqv4m0NWXtJ
	 oTxs+hPa3qrOJIGw/7+g5NUwlRaugwsThlMWmWa7Jd5GuKFad2u546eRuH2YuwhEmj
	 XKiS1eA22TK8CHyDVQKanqe023swsKtau3bqmBbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 764B3F804AB;
	Fri, 17 Sep 2021 16:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50747F8032C; Fri, 17 Sep 2021 16:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE2BFF80227
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE2BFF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GtQclOsn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 997C761248;
 Fri, 17 Sep 2021 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631887481;
 bh=APz1wpNVHY4WtKghQkEC9694tQNhAk28L5fSi57hg9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtQclOsn9OBt9TvB8f0PlRFvVn3Ret7Zi1O83Eqf8miMkknLzX0Sz+/7xeYrSp6mf
 FH4kKqi87Y1nasD3mtws9qij9LarPvS8dPAKHxoD6giNnp2ltlojGw1LW7ozaOIPqs
 HQF0D1i/VmbeXJP1sCVm45ax/NAHU/vPBXUYqolqyLLzLrQYdq8oj/R0z//9UMs+97
 i/cuOpLiEWkM2hR5kKZd5PL2pdKCjwkUIN45dg5i74xQhIjqAtJB13TyvxmiQbpiNB
 wMYK+JJDOiScphkX3O0SXf6krWBuEYgs3nDtX4YVU2Dgwz6sA+8nouspMohygmjNrL
 dGsus3W1mVDQQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: 88pm860x: Update to modern clocking terminology
Date: Fri, 17 Sep 2021 15:03:45 +0100
Message-Id: <163188719815.50326.10832883066129480676.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916140847.50900-1-broonie@kernel.org>
References: <20210916140847.50900-1-broonie@kernel.org>
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

On Thu, 16 Sep 2021 15:08:47 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the 88pm860x driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: 88pm860x: Update to modern clocking terminology
      commit: 703ac1f2a5e5c3b9e8de41a8ad0b202532c0a453

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
