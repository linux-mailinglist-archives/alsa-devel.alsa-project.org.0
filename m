Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915559330F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4411616;
	Mon, 15 Aug 2022 18:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4411616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580641;
	bh=/jQptsa4xgzWZEvnJ9uvP+IDUVWRoipnTaZOjbWZetQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RR77WoXjflA65Kc7EBaMiS1lcXPadAGJBx/bKjznUV16FjAoYt7uWKzYLfcapJIIH
	 F5AzSgrLlOmBWTTzTUlzScqjql7abQjjCvtEYMGsRd0nKbUVVL3qEqQKBSlEcCOXY2
	 lLrSIBoe/ebz8Qq6A31+QFspIkKvqw8dXc+A5+k8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A10F8027C;
	Mon, 15 Aug 2022 18:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32A79F8025A; Mon, 15 Aug 2022 18:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3CDEF80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3CDEF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xkl3G4VV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9544611BF;
 Mon, 15 Aug 2022 16:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38C0C433D6;
 Mon, 15 Aug 2022 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580575;
 bh=/jQptsa4xgzWZEvnJ9uvP+IDUVWRoipnTaZOjbWZetQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Xkl3G4VVfMhFwfVmfm1WItZg6fbzw8NGA3p7MNJexkuVZ0yiz00YqqiL7qvWkySN3
 +bHtQe5pGw7GIiNro5BqEpk5X+ul121rFXYixCzFncS3xHVI1dJFtfGARhS2jBhnll
 IzfCnXPVXUaoUspb24Wr8JpKbH79NqkV0PgrJGYtreeTlkpVUYozX06w4zgtlnQIQa
 H3pqVDZ7mi5hp8LRYpV1HCQQ0YoPQX3GYG1mMrp8gafSO5r2yQJVUoI+pcaKNsRsDv
 3VB5zxhAqP9lViRQatxvXI2V7SJK55WHD9r9uLKOQeo1AgXPWxLO1H38XEivizzhyX
 PQGOlQrRReaAQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, 
 alsa-devel@alsa-project.org, tiwai@suse.com, festevam@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz
In-Reply-To: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
References: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
Message-Id: <166058057263.769843.18204053953176733855.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:22:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 1 Aug 2022 20:26:13 +0800, Shengjiu Wang wrote:
> Some codecs need to configure the sysclk even with slave
> mode, otherwise it may not work properly with some case.
> 
> wm8960 is the one that need sysclk be configured, so add
> late_probe() to call the snd_soc_dai_set_sysclk() of codec
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-rpmsg: Support configure sysclk for codec dai
      commit: 088f115c6ff664c8afe003bd542e1e662a72aaed

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
