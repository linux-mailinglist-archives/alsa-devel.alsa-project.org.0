Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD972760B8
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 21:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD5617A4;
	Wed, 23 Sep 2020 21:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD5617A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600887834;
	bh=yiMx68etmYNKZYyK+lwpe3PrqKGSkAKVStfJBVS2MFs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oW9ZHKO7lTiHRXGR0HKEXvsKfp0pz4Mj8POtrFrRMNa06aji0mjUPGqp9bNud87jQ
	 BaqqMnEEK0viiFZSa6iFTxSmVGVdLGwih1FDE9aJJGKSxTk8NqNH9oM1FFOQeTmY/q
	 CIot8uQTo75PBxlW8xUHqxF4gV1MqxI3ifV3cabY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4336BF8021C;
	Wed, 23 Sep 2020 21:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C404F801EB; Wed, 23 Sep 2020 21:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36E3F800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 21:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36E3F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yuL8j1rC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 429412145D;
 Wed, 23 Sep 2020 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600887678;
 bh=yiMx68etmYNKZYyK+lwpe3PrqKGSkAKVStfJBVS2MFs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yuL8j1rCswv7AO+0agMWAX+7z9Ua2xmPjLswafaSDkiNSzcmjN63c0gAXuD0s+Uoe
 iIJT2GmKxAy4APHXuSaSCK5KdR4B4L+FvrTMukAE3qvZ7Wr/9nTS3cFul1oSS+eklF
 sQLsyPzulSpH94s9r+Y4nKi6aTFBtxGkHs7O40eE=
Date: Wed, 23 Sep 2020 20:00:24 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, Dan Murphy <dmurphy@ti.com>,
 robh+dt@kernel.org
In-Reply-To: <20200923132600.10652-1-dmurphy@ti.com>
References: <20200923132600.10652-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/6] dt-bindings: tas2770: Add shutdown gpio property
Message-Id: <160088761879.35939.9930139156490378021.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Wed, 23 Sep 2020 08:25:55 -0500, Dan Murphy wrote:
> Add the shutdown-gpios property to the yaml to define the GPIO that can
> be used to place the device in shutdown mode or wake the device up.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] dt-bindings: tas2770: Add shutdown gpio property
      commit: 29d7b36ce98eb1bfba2c5c9b2ea0d58ff778a2d4
[2/5] ASoC: tas2770: Add shutdown capability via a GPIO
      commit: 5d0b9dfe0de26b8c4242145cbf7de3a5a2e98293
[3/5] ASoC: tas2770: Set regcache when shutting down and waking device
      commit: c0a30e2e07e35f219666788c8549156eb8d74105
[4/5] ASoC: tas2770: Remove ti,asi-format code
      commit: dd7d9052064b4bda94a89dbc1618927319602366
[5/5] ASoC: tas2770: Remove unused variables
      commit: 3121420cf9b4db7f2bafcdc0e562f60779bf365d

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
