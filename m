Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A697D550179
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 02:48:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55B61EDB;
	Sat, 18 Jun 2022 02:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55B61EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655513285;
	bh=4zuLcL1TWVwMXxDPqAn1JCc2VF+UUiD+MEgJhQXw/LE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dLhUOSMu33P9yl+ER1nH2LEF4yYnf5qNXwhfqT7CWW7DBvzu6nRMAx8jHP81SCfZm
	 gXx9oiCAeutJ912onYq5xgs4lCDeue9Js9uJYwZrK+9pibfVUflAtKbjYqm2is8y7K
	 PKTfAPIo+YnTu7yylkJMFQ21XaPFpMhk1KJ+pCrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34801F80528;
	Sat, 18 Jun 2022 02:47:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D14B3F80527; Sat, 18 Jun 2022 02:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E62DBF804BC
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 02:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E62DBF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lxVBcsJ6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0800C61E69;
 Sat, 18 Jun 2022 00:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B963C3411B;
 Sat, 18 Jun 2022 00:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655513218;
 bh=4zuLcL1TWVwMXxDPqAn1JCc2VF+UUiD+MEgJhQXw/LE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lxVBcsJ6i0NXVZlTUV1lURqwAvD3KCAppwOv6bc4TM8qkNoR7GuKkMhHUUyZHhbsw
 5CqxGNMwEBQRhU75YTcbhknxHa9UbFgsW3xm6E2naYH11OFnUPlw+2vRwCZToKIDD8
 RaMzI8bed7MlZjpxjo0J680j/4PFjHSa5xhFIbbdxBvIoNIR2DmsPRK7uk/YfXWHII
 kQHcu/ig4FG7llJbGiaNordJ9x3j0g0h0hixRRZ7HCvuNV02ENcgcqH7GJK5DU5u1Q
 zlx6srFo72iFhUfMHXr1nL2qEcEiifLOibRMz4JUtZtZjNIa6WwZo2uLBfG38/bJ2q
 yElgEmNqKfzaQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF/soundwire: use resume_and_get on component
 probe
Message-Id: <165551321721.1009219.14840787966530660266.b4-ty@kernel.org>
Date: Sat, 18 Jun 2022 01:46:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org
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

On Thu, 16 Jun 2022 16:08:23 -0500, Pierre-Louis Bossart wrote:
> While testing driver bind/unbind sequences, I stumbled on a corner
> case where the SoundWire bus can be suspended before the ASoC card
> registration happens. During the registration, register accesses would
> then lead to timeouts. This does not happen in regular usages where
> the card registration happens within the 3-second time window before
> suspend.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: pcm: use pm_resume_and_get() on component probe
      commit: 4ea3bfd13a2484b5f1c19f60b1dc7494f261f0a4
[2/2] ASoC: codecs: soundwire: call pm_runtime_resume() in component probe
      commit: 011e397f5c9c96e533d4a244af84e74c9caefb83

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
