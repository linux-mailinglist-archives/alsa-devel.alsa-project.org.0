Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B541DCEF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:03:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2207216EC;
	Thu, 30 Sep 2021 17:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2207216EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014213;
	bh=VB9orFxsY14fyJtvup9liDeJdnBFjZM5Us2Lmk4xzYI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=en5m/JdUyWqW6AWmi/19QZe0zeJ8/07YEOEFr/daZE9KomcGLY2yZvR08wIfXzI/o
	 neyAGGZUUX/KamR6nVDwjRUdrOi/yKI3qpSHSeLZIxc6YX4Zk+gZYiNd+xrpc9Wgv5
	 YloYUGYMXMqfjDzQRl3WNkh2o1M3ZG4ujutKEOMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75905F80510;
	Thu, 30 Sep 2021 17:00:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F66CF804E4; Thu, 30 Sep 2021 17:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C7ABF80113
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 17:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7ABF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M4+8pW4m"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8782B6128E;
 Thu, 30 Sep 2021 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633014003;
 bh=VB9orFxsY14fyJtvup9liDeJdnBFjZM5Us2Lmk4xzYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4+8pW4m1jx70gKS7pi6oS+KPNG4A5y62nZfj3Ny1xE032tj8VKISK1Sr9Cn7I3Wy
 VKZ5sDaqCj2sGcSy9xNMb42hh1o7N1LAFn3b9Yjou4eNHz/rvdtu3hVYeTw7CVC93W
 urXhq7vOnG6FpBLTW0eIq1RWVjdDjbN7tsxo+YYzoT4+Wyw8uAApGKD4j3fWCrnUGY
 r4dk498bxjJJASiUbsfsf8kgEwv/aASN2qNGlkyJ7sc+Vx7P7D6Q84AjF1x/B5lXs2
 PyPKC+JEWIqaW1yhkqc8ZmqHQJaM2j/Ump4SxV7ITcMM57T62RkzOZYM4594anuW2Q
 QlcX3PbLgJySg==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: dt-bindings: rt5682s: fix the device-tree schema
 errors
Date: Thu, 30 Sep 2021 15:58:54 +0100
Message-Id: <163301248178.43045.15903836903409128227.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210929130406.24325-1-derek.fang@realtek.com>
References: <20210929130406.24325-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, jack.yu@realtek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, shumingf@realtek.com, flove@realtek.com
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

On Wed, 29 Sep 2021 21:04:06 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Fix the device-tree schema errors that be reported by using 'make
> dt_binding_check'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rt5682s: fix the device-tree schema errors
      commit: 91cf45595021bd6f6279748aa472de7fc7864084

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
