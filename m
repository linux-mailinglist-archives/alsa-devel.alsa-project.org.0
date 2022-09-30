Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E59515F0668
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 10:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CA51662;
	Fri, 30 Sep 2022 10:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CA51662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664526565;
	bh=nrbPkf3qWkyUb7znx0iYm2zgD8kFePTMuzvvp4oP0Dc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vGh3UOBGZS6s0U2e+KGrwy640xNMisSJW8jMz7ojhZ378fyceqfFVkfFLbZl4ZzI5
	 XA/tRLuWp51hbUG3eGu7CYkn5XdeAeaI3KAIIsdcs05MT1vWEbNugHgpMZtLmXQYWI
	 fvzf8Ys0VBJe6/UrmA1D5nXyd8z5rknqGPDyo3iU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 482C8F80543;
	Fri, 30 Sep 2022 10:27:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32737F80542; Fri, 30 Sep 2022 10:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC6B5F8053C
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 10:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC6B5F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z8gy6Y2d"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B22E62265;
 Fri, 30 Sep 2022 08:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5689AC433C1;
 Fri, 30 Sep 2022 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664526460;
 bh=nrbPkf3qWkyUb7znx0iYm2zgD8kFePTMuzvvp4oP0Dc=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Z8gy6Y2ddRUoWB8wswhSIKsQ9WHQk2PsDIQsDWLq1G4h6pjnYJ73sbyMF1CiCgznQ
 y6kRY+ougGvAlw0IEBVywXnTVfbBHPss4fAQolSLBXQDJpDcu5gRLyJIQbhOZIofA9
 TeeDIvAFlldzP6UPQWnshKL4jyHn98CQd6y6guq/4m9AXWuRUdStVqv9naiv4YFlF5
 tpTEj472oRwAMg3clYNh7EeP2IsDB63vMmU7LtdNQWRnxHDVESAjdrTGhkqxblF4fZ
 ZlnnTJ+nY2qM9IPH98rHjks16WD7Lqfbw5OHRiKmk39Bd60ijEL3y1EvZULLHHVqxI
 pNq2u/rk07Ncg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
In-Reply-To: <20220929143754.345144-1-perex@perex.cz>
References: <20220929143754.345144-1-perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Message-Id: <166452646007.46391.17341801502070959820.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 09:27:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Thu, 29 Sep 2022 16:37:54 +0200, Jaroslav Kysela wrote:
> The driver field in the struct snd_ctl_card_info is a valid
> user space identifier. Actually, many ASoC drivers do not care
> and let to initialize this field using a standard wrapping method.
> Unfortunately, in this way, this field becomes unusable and
> unreadable for the drivers with longer card names. Also,
> there is a possibility to have clashes (driver field has
> only limit of 15 characters).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: clarify the driver name initialization
      commit: c8d18e44022518ab026338ae86bf14cdf2e71887

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
