Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081055BBF7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:21:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86ED716CE;
	Mon, 27 Jun 2022 22:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86ED716CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656361286;
	bh=09oLrSH55xaVexD16fggKO/amddysveaHFjHoAtcLmQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXQERskL6ph3gYfZSTcjzIV/q7c1VZ/1uVGW9uOuGNoDFR7qXLYrWQERormAd6NC4
	 ItWi4GkvCloZ9+lDDkuejmU8UbLyAZ0wiW5RorwozYxRPItinO2CPCaMQeFkDvWfiF
	 p1AiQbSTjxyFkdx5BucvdIArosD1I2q2eip3vwtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A43ACF8053D;
	Mon, 27 Jun 2022 22:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C5AAF8053B; Mon, 27 Jun 2022 22:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6FADF8028B
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6FADF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OUDrBEmX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E95E61751;
 Mon, 27 Jun 2022 20:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C99CC36AF3;
 Mon, 27 Jun 2022 20:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656361156;
 bh=09oLrSH55xaVexD16fggKO/amddysveaHFjHoAtcLmQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OUDrBEmXnfvNhiueI+y0rqtmIIFuy+XUFAdc2hQr+VUtAUcu2ep/2UXkHKdQJgbrR
 jvWLzui0Cn48mAWal05dMfRBZVxFESik/pkc2EUrG6qYKVspKn7gLm5reSHpZAudt0
 ZkyDy11P6ELjxKyc5Bmf608CRwdKmcYDJUcoCASUMOUC+dHu9uzd1xyHADoEeU7ezP
 btScmdYDrTKR30A7sk4RlCy6QJAIUIJXkZmSQRBiPcy/8a1dsncnaCPCN6m8w4lSEF
 4etobKwPWgxAUfGyXaDgJ9V+9XFeDf4lw1w9EhDEoo1jzAGUfkuTrtlCTTftLRBR8H
 oaFPP0btkStIg==
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
In-Reply-To: <20220624105716.2579539-1-s.hauer@pengutronix.de>
References: <20220624105716.2579539-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix tx_mask check
Message-Id: <165636115490.3997797.17375091345314852574.b4-ty@kernel.org>
Date: Mon, 27 Jun 2022 21:19:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: dmurphy@ti.com, kernel@pengutronix.de
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

On Fri, 24 Jun 2022 12:57:16 +0200, Sascha Hauer wrote:
> The tx_mask check doesn't reflect what the driver and the chip support.
> 
> The check currently checks for exactly two slots being enabled. The
> tlv320adcx140 supports anything between one and eight channels, so relax
> the check accordingly.
> 
> The tlv320adcx140 supports arbitrary tx_mask settings, but the driver
> currently only supports adjacent slots beginning with the first slot,
> so extend the check to check that the first slot is being used and that
> there are no holes in the tx_mask.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Fix tx_mask check
      commit: 91ff12ec2390a918883145e6c7d96cb10c4fcbd6

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
