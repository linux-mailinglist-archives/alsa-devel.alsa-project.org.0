Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE24089C1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 13:01:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370601670;
	Mon, 13 Sep 2021 13:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370601670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530884;
	bh=hluTCl1b8CAVLGm6NCHHq+/3ObLLuNlVTaShznsi9Fg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L19iuT28BX2+6lPXAX2uG8Zrgo4timsn0i/IzTGf7UHu14qcpMtMqR8RwXFqePiIK
	 UPqib6tS4Jzs9eSYoyRLxAuQNx/LGEaieIpMvkdq6PznQp6k5q8I80FhuUkXZQUSSz
	 cQSmeupWnMLzb52DnxXlRKlcY+Js8Nsw1IlXwt4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1C4F80557;
	Mon, 13 Sep 2021 12:55:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC01CF80538; Mon, 13 Sep 2021 12:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4188F80527
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4188F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pW2HnEZk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 268EF61029;
 Mon, 13 Sep 2021 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530519;
 bh=hluTCl1b8CAVLGm6NCHHq+/3ObLLuNlVTaShznsi9Fg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pW2HnEZkdamvTL2mPZSL4H0L6xqAUZZBDL8Ly+QLGSVEEnh0FqOCkNOeNYgL5WuD2
 PPzwKRrn827kiDwe3AwjNnIHPwLNljHim2PSUYCXJY3kzJcYnIQ71Yw3iF+Fg4raZF
 b6B5X+SOHi7/C8UbJ7SpHkoiV7h2NytraM8SfHJ5d3/DUGPhhj6xueQnLZsp3umbwT
 COnCrM5BFiE7mj/cs+aqyyUg0cRoGXpw0VFxA4XDDUvjwTGE8+vdjk+QxJI6zQ/fH0
 BH+XAWn9ZEVc8xDpoCtiWYcUSqhtWQAyi/QkHNJCBJLPH3rkwzPHICPwrfISkDYVin
 Fs2ibXkTXrMdQ==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com, robh@kernel.org,
 David Rhodes <drhodes@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, brian.austin@cirrus.com,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v7 0/2] Cirrus Logic CS35L41 Amplifier
Date: Mon, 13 Sep 2021 11:53:30 +0100
Message-Id: <163152996585.45703.5868330232661304894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210907225719.2018115-1-drhodes@opensource.cirrus.com>
References: <20210907225719.2018115-1-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Tue, 7 Sep 2021 17:57:17 -0500, David Rhodes wrote:
> ASoC driver and devicetree documentation for a new
> Cirrus Logic amplifier CS35L41
> 
> v7 changes:
> Remove property 'classh-bst-max-limit'
> 
> David Rhodes (2):
>   ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
>   ASoC: cs35l41: Add bindings for CS35L41
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
      commit: 6450ef55905688602175fae4ed1bfbfef6a14dde
[2/2] ASoC: cs35l41: Add bindings for CS35L41
      commit: 8d7ab8800184cc75000dd2e784fe121934482878

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
