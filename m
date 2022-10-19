Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F1604C25
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 17:51:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F5BADFB;
	Wed, 19 Oct 2022 17:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F5BADFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666194679;
	bh=wScyHxczwHL75RmoXOfql5d13NwOHcmOL0uKxW2svyU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTc8T3YYypWEda80kv+lSWY/dZEshEPOqAaMC5ohXLolRGRew7jvVRC5UidvEalL4
	 +lto/HSYf+Ty2J/g/qv5LH5LOeLfBmfJ3oZNw5JvvbKa4Qo81AhkrQwITjALL3OSIt
	 nvMBTOGbBDgyfvts2ARwaw3uhWq99KlKbYzgMe8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 914A2F804CB;
	Wed, 19 Oct 2022 17:50:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A84B5F804FA; Wed, 19 Oct 2022 17:50:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCC8CF80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 17:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC8CF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D/ZLocZF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D3869CE227D;
 Wed, 19 Oct 2022 15:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EB3C433D7;
 Wed, 19 Oct 2022 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666194615;
 bh=wScyHxczwHL75RmoXOfql5d13NwOHcmOL0uKxW2svyU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=D/ZLocZFqh2oVDNt4qIJijuw6psZZCGYbZq/vMqTpVdAHmJab5OKwDkNJa9FZhS+R
 6U9yEV97Zoz/IEcwhoeRgpoyVELIlzUiofWUpEDoeO/xfuI2W+6opBwCt/2eiA8TLG
 J1a9DdqVaTC1bmqmtJ0hkDgvAe6LBA79wEeuPfrl0em6jFFkI/z+cmjhPouDLSSs/R
 htcs8QqrN7D7r8PspZR8YmDpa+M/VWwrBoaqVICPdvAOs1sLzRPmLKOBMWkTlCZKex
 C+kvGspb0YsLZxErffHZPmGRcPApRb7YMk7FD6zo8S59GfxMd6L9lo8sWLVpu0kL37
 uJEHAzB105RvQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Paul Cercueil <paul@crapouillou.net>,
 Jaroslav Kysela <perex@perex.cz>, 
 Colin Ian King <colin.i.king@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20221019071639.1003730-1-colin.i.king@gmail.com>
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
Message-Id: <166619461311.884966.9257209469691313865.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 16:50:13 +0100
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

On Wed, 19 Oct 2022 08:16:39 +0100, Colin Ian King wrote:
> There are two spelling mistakes in codec routing description. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: jz4725b: Fix spelling mistake "Sourc" -> "Source", "Routee" -> "Route"
      commit: df496157a5afa1b6d1f4c46ad6549c2c346d1e59

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
