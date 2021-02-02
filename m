Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F830C3EF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:37:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B489176E;
	Tue,  2 Feb 2021 16:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B489176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612280249;
	bh=dmDy+eMZkkSX86v91uXXz8Ta0/63hBrHYxlsE1mEsRg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clgOV0iS6MaXhBKzLMvUB/qCCTisSL7c6CQCKTraSscmW8lyDtCSDZLyxllgIk8Xn
	 ljnYSZD4jGHi+1eMwaIkTpMqHZlr2e3KQA5GNPVe4j3n7OAvwu1Ohd4b9esYabstAS
	 lU45nibPKOpNcPAUAuB/WOqR20cUfFqTB3KTYb7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94416F8023C;
	Tue,  2 Feb 2021 16:35:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734B7F8023C; Tue,  2 Feb 2021 16:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E51D5F80171
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E51D5F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MGEWY95n"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C72C864F64;
 Tue,  2 Feb 2021 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612280136;
 bh=dmDy+eMZkkSX86v91uXXz8Ta0/63hBrHYxlsE1mEsRg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MGEWY95n5vYwbdEqVrAZsGCskvYlsLcJPRejmyPVgMey+xkn/hAZXjzTeFz5lDNW9
 DsMs9P8kGMOIxjwLLbvzuNc9bwzLE55Br9ooA2ZdeNcrhlCWU7TK4Rx82sgc7otzc5
 V3vllo5Zh+mOVONQ94EQluShfv8mp2mXMip/5eyxNTiPPjIS+fkIqaFP4pYOB3pHVs
 slrVCRpE1lDfKsp1hCd/z3tkAbHmw4kqb2DFXMu2tQuk20v8wBEKQKgE2JIMgI8D2o
 8tyLU9J8McS4vjPRs/J9ZzLi5z4o0YnburGiqONvU8kQsqhJWiixtv0U4OnbaJgcNM
 eFLJRJUl0KTIg==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20210202033557.1621029-1-tzungbi@google.com>
References: <20210202033557.1621029-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mt6359: reduce log verbosity for optional DT
 properties
Message-Id: <161228008449.11888.1415113182041058516.b4-ty@kernel.org>
Date: Tue, 02 Feb 2021 15:34:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: matthias.bgg@gmail.com, alsa-devel@alsa-project.org
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

On Tue, 2 Feb 2021 11:35:57 +0800, Tzung-Bi Shih wrote:
> DT properties "dmic-mode" and "mic-type-X" are optional.  Reduces the
> log verbosity and changes the message a bit to avoid misleading.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6359: reduce log verbosity for optional DT properties
      commit: 1ecebae4733d8971059f0c514741868ce19f5d24

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
