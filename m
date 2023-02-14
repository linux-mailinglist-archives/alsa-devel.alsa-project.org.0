Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EA697225
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 00:54:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9061847;
	Wed, 15 Feb 2023 00:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9061847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676418890;
	bh=4WoUrY6Uc2gfAUUAiirWjgNGe99aw9SA4Mtwq7niZ8Y=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uGhXX2EisRNEiHUu4oxOEeY0GHo4pZWunq+X426vmErToZNbZOJvrWXFNn1AIxY/l
	 ZtOSuC6w4PPK/BUJcEKrGy0gRTFFYuDrd+QmWbw1DRtQCaS9DfRMJLGmX3xNCENO5k
	 uaTx0Hwv381Dy06pVq08HTbPcmfOo2GSqP0grCgE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0524FF801C0;
	Wed, 15 Feb 2023 00:54:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B70DF8047C; Wed, 15 Feb 2023 00:53:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E357F800E4
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 00:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E357F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hAQwWbbE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 10FC3CE22E0;
	Tue, 14 Feb 2023 23:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19901C433EF;
	Tue, 14 Feb 2023 23:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676418826;
	bh=4WoUrY6Uc2gfAUUAiirWjgNGe99aw9SA4Mtwq7niZ8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hAQwWbbEXwqIrFrk1LzpQ8yncH41PYW0Vl5UU4NskAVwziw3nipP82lbzG8YwVS93
	 ck9VwDWpwuKSOpLaHRStoftRyIpxZ/N96rkJ8cXyXqjCiC0N/Rb6GG+bZjmmvhq+1O
	 wVgv9OoAJUVtvs40rauAttiqoXxqo8lMuhg29mPyQHmu2eR1yVbB+R0U/9Eq9XT9VU
	 kDu6l+TE7adBGDrFNmaHZIYE8eo+HfcpqLrxAoI1Ezmkawj90NauG76q94nadKZr/t
	 Zomj62SsrgfsODieUYq7BhkwM1Ax/Hyfl0+ryxponk2cCc3Cdh/nzibwd0QuEJNtIt
	 9l2RgJPbuJ85w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230213161713.1450-1-andriy.shevchenko@linux.intel.com>
References: <20230213161713.1450-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: soc-ac97: Convert to agnostic GPIO API
Message-Id: <167641882377.3290120.11896431193482772013.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 23:53:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: HLM5ZNRXEQNQFELCQZXVACRBF35JTM6X
X-Message-ID-Hash: HLM5ZNRXEQNQFELCQZXVACRBF35JTM6X
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLM5ZNRXEQNQFELCQZXVACRBF35JTM6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Feb 2023 18:17:13 +0200, Andy Shevchenko wrote:
> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-ac97: Convert to agnostic GPIO API
      commit: 3ee0d39c50dca18c76941f46a6c57dc9cd2bfb9d

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

