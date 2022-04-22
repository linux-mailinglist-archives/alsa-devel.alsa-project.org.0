Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B250B7A0
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 14:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4288A172C;
	Fri, 22 Apr 2022 14:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4288A172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650632071;
	bh=jMqFxIuoT1cqZV1l+rV7YI1X5VmlIyBbAJyV8buDTA0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Muj0Kydx2SijlcaWoi2J2coLd3q/4k1sHMlY83IbcPeCx4DyfHuQisZpRj9dfU39C
	 S4JI56zO7qROhV3KizgglGIe6rAo7VzHRUOrJ6LbmXOe28GAN10G2DxLlOS5Kqk8f8
	 baI2IolqyZqcwqRwTsLW2z1k45fv3CqmuOJ6nlqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCECFF80249;
	Fri, 22 Apr 2022 14:53:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1743F80245; Fri, 22 Apr 2022 14:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1DE9F80134
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 14:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DE9F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mR1i20to"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5EE07B82D1F;
 Fri, 22 Apr 2022 12:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C01C385A4;
 Fri, 22 Apr 2022 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650632003;
 bh=jMqFxIuoT1cqZV1l+rV7YI1X5VmlIyBbAJyV8buDTA0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mR1i20toR3c2UQojmDZbvNBd1EwwCYW7BwW9VImL8FL7TPfZBy7BHbwbdsX1WT6Nc
 ZfQYSljjNaQx6vuHBFmA+m+/LZAPY8LnJ6S8WZ+gfGLfVd1+gkLx7ZQ+K0GJkvr5FY
 PoKpqLmD1MNRomsnXKff+3pBlIX08WsfW0YNjjvZYGar+Zf34iwUswOOk24v6NmQ+s
 MqTUhFnYW0jxT7ZPZJ9uJUjdqBQJievC2qpRdsEaqgoFI/7iGP1pq3nUVCaKT+AX6+
 M/923tscIaMDTp+U2RttxeWGyAT44PQDANDJSuoLGb6/GKBdpdLvXCtGX3S3v3HgXU
 yW044RGV9LcsA==
From: Mark Brown <broonie@kernel.org>
To: u0084500@gmail.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <1650608810-3829-1-git-send-email-u0084500@gmail.com>
References: <1650608810-3829-1-git-send-email-u0084500@gmail.com>
Subject: Re: [PATCH] ASoC: rt9120: Correct the reg 0x09 size to one byte
Message-Id: <165063200120.312964.8713966369243201308.b4-ty@kernel.org>
Date: Fri, 22 Apr 2022 13:53:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, cy_huang@richtek.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Fri, 22 Apr 2022 14:26:50 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Correct the reg 0x09 size to one byte.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt9120: Correct the reg 0x09 size to one byte
      commit: 87c18514bb8477563a61f50b4285da156296edc4

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
