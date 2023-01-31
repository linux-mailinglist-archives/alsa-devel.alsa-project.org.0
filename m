Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F0682F58
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 15:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A09E5851;
	Tue, 31 Jan 2023 15:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A09E5851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675175676;
	bh=hGEYxozapv2lFwUHx3F3CpHxfGxtk761b6hTvAin2Jw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kACUJnWCtW055+R2KmAk+utGeloT9IFDWSOczBs2J0PXFfGTyULE/bI9ESFkX6+Wa
	 X9r75pDelAekFIqIrgngHdaTS9/c9n3hy8lTIfyt5KSyWEWLKHLnL+zHLEy0mWm18r
	 34skSl9UJ6x844+Md1j+MAlz/uJN8WpKyTRwAl1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CDC1F80524;
	Tue, 31 Jan 2023 15:33:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA0A0F8055C; Tue, 31 Jan 2023 15:33:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67BA4F80543
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 15:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BA4F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h+2dlPRx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52C61B81D21;
 Tue, 31 Jan 2023 14:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8329C433EF;
 Tue, 31 Jan 2023 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675175561;
 bh=hGEYxozapv2lFwUHx3F3CpHxfGxtk761b6hTvAin2Jw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h+2dlPRx5BQMyuwm+6z+ZRBuys1PqrD5uuuiPK7S+4djDefxBsLTXrYP4OIri8PLg
 nMDrDe+lFKqjoUtF0aR/Xe9N9ibd0K+gPMA1Q/62vzOMyaZcG6h042oC0vkYQ8GFjC
 JmEhmOYbhWEfYOIHDEWv5leUr5dPefJ6BjOrVeRM+L2DoeZMNmf7/GWFlsQ9TfZBK1
 eCLZ/kSR6hC5oeFSWVwlOYvdRiLzVsU+pRnm06Hj/Vbl+DpQTR8ibfzKZ6x48Kdy+p
 rhgjDsrRn4m/3t7lU3wg0F1lt347Wjqa7thN//JnZiyJuWvXN8By+Kh0lfI4K6kzAY
 V9DP/+X1Z/GpQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kiseok Jo <kiseok.jo@irondevice.com>
In-Reply-To: <20230131054526.14653-1-kiseok.jo@irondevice.com>
References: <20230131054526.14653-1-kiseok.jo@irondevice.com>
Subject: Re: [PATCH] MAINTAINERS: add IRON DEVICE AUDIO CODEC DRIVERS
Message-Id: <167517555954.691025.17847273688504869741.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 14:32:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 31 Jan 2023 05:45:27 +0000, Kiseok Jo wrote:
> Add Kiseok Jo as maintainer for Iron Device audio codec drivers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: add IRON DEVICE AUDIO CODEC DRIVERS
      commit: 4a639a757128debbede924736f255680740a4364

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

