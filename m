Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1EC509339
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 00:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B095E1E73;
	Thu, 21 Apr 2022 00:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B095E1E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650495391;
	bh=S08eSAdYrQJga6xYsuWjf8O1Pg3/hVA5TSGnx1sYPuA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hN6qYY8V4EVQ5tLsMjMA6lqSiBNPb4k1SXAch4P/PxUOkE5Na5cjn1Qm67GQquFJF
	 ZExLI2LntYfik7p4xgOMsOVWqPlWoyuxg1AonSCYxai46/yyYU1bNFd8+jhAB3aZqU
	 WNAi3WrMQG7mKTMqHih2lNcB/XBAQXopIdg5QhXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF6AF80116;
	Thu, 21 Apr 2022 00:55:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69866F80128; Thu, 21 Apr 2022 00:55:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBBFFF800F8
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 00:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBBFFF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ldDFE60t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC772B821C7;
 Wed, 20 Apr 2022 22:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD825C385A1;
 Wed, 20 Apr 2022 22:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650495326;
 bh=S08eSAdYrQJga6xYsuWjf8O1Pg3/hVA5TSGnx1sYPuA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ldDFE60tzmaWZdgd74Im2je8yQJ7nFmS/AiD5znPDs/Gte6f4X6CYrWbvftUw4HD1
 tD1bEtq+j6mObay5OfYuLmh5BcXk6LIlTDbzDUTR1NiabMVEXtM+/nx/P6wt+jAMGU
 TVRlCKUP8tvjOcp5fmk0WvkNiefhH5EJSV6qUf5cNgArKRdPyQNcw+3vBC+It6HmvZ
 TSIiAKWKiVPFj461Q7LCpNh0XQLD5f6Ir+PI5DJ7iFQEv08QXx+rn/X1bO0TgkjzOc
 zQ2ZG8ZOzPGilwSEhb71F6Uyj2Blujz7QdyHxydPyfCT8I5d5HtSYYvATlq3xI3wCB
 vVlioIEUiXsBw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, support.opensource@diasemi.com, broonie@kernel.org
In-Reply-To: <20220416125257.197348-1-broonie@kernel.org>
References: <20220416125257.197348-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: da7219: Fix change notifications for tone generator
 frequency
Message-Id: <165049532540.1351794.8166671194335085604.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 23:55:25 +0100
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

On Sat, 16 Apr 2022 13:52:56 +0100, Mark Brown wrote:
> The tone generator frequency control just returns 0 on successful write,
> not a boolean value indicating if there was a change or not.  Compare
> what was written with the value that was there previously so that
> notifications are generated appropraitely when the value changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Fix change notifications for tone generator frequency
      commit: 08ef48404965cfef99343d6bbbcf75b88c74aa0e

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
