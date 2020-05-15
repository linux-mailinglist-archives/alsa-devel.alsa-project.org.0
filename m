Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE95D1D4C32
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 13:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6381670;
	Fri, 15 May 2020 13:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6381670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589541178;
	bh=hyA2rCdi+4a+Yl9PRpl1xzm4CgKD4uCeLpLvWKN/KEY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ct7OHNZvdP6QYXk1GYHyNPXgKgv3S6IukRZW526ifannJcMbebvbhLsPhurQSpg++
	 RTRYA0qk58MXchW+1OCxPEU9ROB6VGRqj74aDhkrtptupFCPCXe5wMuima4TB9U6Zd
	 vD/r1YpnZ+RU7V7vF6FPMwCCwxGgK//PbTTsE618=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5247DF80274;
	Fri, 15 May 2020 13:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 202F8F80255; Fri, 15 May 2020 13:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF8AFF80247
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 13:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF8AFF80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C3SVCZmq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FD48206B6;
 Fri, 15 May 2020 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589541029;
 bh=hyA2rCdi+4a+Yl9PRpl1xzm4CgKD4uCeLpLvWKN/KEY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=C3SVCZmqKLeO/pso+28FRje+k+Kf36tVhnICeVNIqk1ks4yYIbgdz4EYCSVwmFRhY
 oQ+Bs3vO3yi4UYczQ9ZSkR0fRdTiA42DnRd6BAcL0nYLWLsyB3GP9RXlpMwSOa/y07
 +3M3LmEso4pEwEv4TcFY/dDgML99eCZ6pu48xOac=
Date: Fri, 15 May 2020 12:10:26 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Ard Biesheuvel <ardb@kernel.org>
In-Reply-To: <20200515100309.20795-1-ardb@kernel.org>
References: <20200515100309.20795-1-ardb@kernel.org>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: switch to library API for SHA-256
Message-Id: <158954102051.28239.11891181458509690837.b4-ty@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Tzung-Bi Shih <tzungbi@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, 15 May 2020 12:03:09 +0200, Ard Biesheuvel wrote:
> The CrOS EC codec driver uses SHA-256 explicitly, and not in a
> performance critical manner, so there is really no point in using
> the SHASH crypto API here. Let's switch to the library API instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: cros_ec_codec: switch to library API for SHA-256
      commit: 93fa0af4790abdabf80ca0c4fff3f1629c84a56f

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
