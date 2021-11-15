Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A937B451A84
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:36:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC93F1696;
	Tue, 16 Nov 2021 00:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC93F1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019408;
	bh=1OzdwxSFvxwVS6C/YLdAtuX4T43pG75TF2Jjh5ogIq0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hH6zuGuAyyJIO9eKsgMOz7i3Ete4EqyntNy8mJozkg1f4ta9Fm+yAuu5gcihNzdqd
	 ScSYJLLkvtcAd7wycq1OLlBFxc1yGRu05m1en4Jy4MuPInXZU5Vkg1RMd0fS7I+PsN
	 /92tryzT0PqGMG0UVX5whRU8XkwLOya60s9c8+rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7393CF8049C;
	Tue, 16 Nov 2021 00:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1E44F802A0; Tue, 16 Nov 2021 00:35:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 839BBF80134
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 839BBF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TfQIsHWD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D914C63256;
 Mon, 15 Nov 2021 23:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019298;
 bh=1OzdwxSFvxwVS6C/YLdAtuX4T43pG75TF2Jjh5ogIq0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TfQIsHWD+nxwDZ9mF0DKolJzWPO3OkxEILSAyAUun6rmVx2yRLp07vE/NrKuGpF36
 FkMlqg5Ww1PdjFbDkYkequ4PYf8F6e0tKUz/h/9FNYS3LdIhhbPb4zECluItFtkurC
 MvcyskrbyZ7RRPlcKPxQxhKAcB9TOhGA3UenNin2eWGuKvDNPetCz3KSrJuLfBy/pl
 GPbg2RCWWxU2QQEnqvlfSc27GpMNil1jAuzS00Xlt5KBaSVloTt6JP5z8vzQ1VvsiF
 IPJHaUUB+d4QkhuTNwHg3iThGllFX53EyQ6opvzMVs2V2H1hgovmNDuO2CCSimlPcI
 rc/IH8tHP3vZw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20211101101006.13092-1-rf@opensource.cirrus.com>
References: <20211101101006.13092-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: cs42l42: Add control for audio slow-start switch
Message-Id: <163701929762.675370.12528564443192014904.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 23:34:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Mon, 1 Nov 2021 10:10:06 +0000, Richard Fitzgerald wrote:
> This adds an ALSA control so that the slow-start audio ramp feature
> can be disabled. This is useful for high-definition audio applications.
> 
> The register field is unusual in that it is a 3-bit field with only
> two valid values, 000=off and 111=on.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Add control for audio slow-start switch
      commit: 7ec4a058c16f3da9c2c0c66506f45c083198ed30

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
