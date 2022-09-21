Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F95BFE13
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 14:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C5A9F6;
	Wed, 21 Sep 2022 14:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C5A9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663763943;
	bh=supMv855KnyburSSx3KwyTUOX8zU5PSNqbdh6ZA3Vz8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iy7YV7RsepY27EtUjLUjnRFd8k+GyRmAm2kWCkrobQkL+EvN03xzzEzRufbaWiVFj
	 xo45/xXko9xurUAwgLteJX63f6u/1UXnZv9aJ6bdQIjm44i01IPk8H3LGNIIaOblC7
	 j2JhmrnvJHryeypBuRT/b1SoiB1u5Sgd0uT8dN9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D41A5F800C9;
	Wed, 21 Sep 2022 14:38:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03EB7F80169; Wed, 21 Sep 2022 14:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8744AF800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 14:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8744AF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WZDZuujr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A85D6623FE;
 Wed, 21 Sep 2022 12:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FA9C433D7;
 Wed, 21 Sep 2022 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663763877;
 bh=supMv855KnyburSSx3KwyTUOX8zU5PSNqbdh6ZA3Vz8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WZDZuujrMgbAZ0EtjjBEvWI5Ft+3VTLbXG8OKqfuMqpwAuC+EJt8lw4U0viNvEXSD
 qL/3cVIUW/eMV6lPZ46skTL5Q1JyhJ96bXYX73et6xBHYUwdWpaR+ZA/NCBZJ6vk3F
 ls+hA9TbIkQDsJnrDyPceXkkKcm4jnFhwWrgOnMExwJpVt+DonbjhuYXLHqyejPIpB
 V4dQ3uwFBqFGSAkZdrT6eJjabTJtPncSq0B7uTxNikFhokt4aAgGB4f5k2h5G6Hl3Y
 9d2QPW2KO+ZtGJKlCuZ4vteUBI/3mUxE+U3f/+uDxKz41SySBNi4W4lTc99bNeQgcc
 wtMpvwh/RxvPQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, fengzheng923@gmail.com, lgirdwood@gmail.com,
 Zeng Heng <zengheng4@huawei.com>, 
 jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 alsa-devel@alsa-project.org, wens@csie.org, samuel@sholland.org
In-Reply-To: <20220921033819.2188233-1-zengheng4@huawei.com>
References: <20220921033819.2188233-1-zengheng4@huawei.com>
Subject: Re: [PATCH -next] sound: sunxi: fix declaration compile error
Message-Id: <166376386829.569475.6485211079114910926.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 13:37:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: liwei391@huawei.com
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

On Wed, 21 Sep 2022 11:38:19 +0800, Zeng Heng wrote:
> Just fix compile error without any logic changes.
> 
> sound/soc/sunxi/sun50i-dmic.c:62:1: error: ‘static’ is not at beginning of declaration [-Werror=old-style-declaration]
>    62 | const static struct dmic_rate dmic_rate_s[] = {
>       | ^~~~~
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] sound: sunxi: fix declaration compile error
      commit: ee81cfb58286c1aed3263d2fc94b321e7d963f08

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
