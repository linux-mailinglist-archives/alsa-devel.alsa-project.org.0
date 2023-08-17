Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703DD78012A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 00:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5BD283E;
	Fri, 18 Aug 2023 00:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5BD283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692311973;
	bh=Z+veBRj8TkRaYvhGldqGAJAH25CBsVdPdS/M9njsKW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vGZRsdYXLX3TIjmbMMSZiQ3VX8jpe4Pj+/rdfag2N75jdBeOM3o43KxBXz4AR1mez
	 46rdTUZsUfsg/0LnQ9kYgtVAPouZydiuma+vvlYFzyQlB8EZlk9i2CVX6rHYCeY1yr
	 2cPNPyMgUc/HbwBW3sI/R4sd93UkHxkUZSLLaAzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97DF5F805C6; Fri, 18 Aug 2023 00:36:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DC7F805BE;
	Fri, 18 Aug 2023 00:36:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4BCEF8057A; Fri, 18 Aug 2023 00:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 839E3F80563
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 00:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 839E3F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZWFUHTeq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 674B463B9D;
	Thu, 17 Aug 2023 22:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645F0C433CB;
	Thu, 17 Aug 2023 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692311798;
	bh=Z+veBRj8TkRaYvhGldqGAJAH25CBsVdPdS/M9njsKW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZWFUHTeqHFQQbOXHjtrpxwtkrqiiL1tWVZkVwpSx8FZFLTCuqkcrXv+NMbA5Th1dO
	 EECRtA3ViyNFKyHu1iLiVefusPLsnAAYU4t59OQw1++ggxs/tdduSxV8tL6wHO/2S+
	 xUN8ILU90UOvbqIJL6qmHF3WMSt1DiN6hDRQE4eCGsgQyFwnoA0l+N7qQW/pSEXN4P
	 fedlvUazJSrvNpFvo9m1NWXzfVKRUh9gS8OpjMqJ9+eCRrStwKHRvTpZDOqkAD8Rg8
	 hUmWXtq8Jc/P5jNhe01vVOwa2czFR7F7qTxx/Ri3YVQ/k1UfuCR9wPHK9R4b2Uhfyv
	 jL6hZRX+qIGqA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
References: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
Subject: Re: [PATCH 0/5] ASoC: Convert remaining Realtek codecs to GPIO
 descriptors
Message-Id: <169231179711.153247.17784763872682870421.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 23:36:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: UN47CC2GEAZ2H2G2QD2ST7JBHIOIJIZR
X-Message-ID-Hash: UN47CC2GEAZ2H2G2QD2ST7JBHIOIJIZR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UN47CC2GEAZ2H2G2QD2ST7JBHIOIJIZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Aug 2023 15:30:14 +0200, Linus Walleij wrote:
> After dropping unused headers a few Realtek devices
> actually using the GPIO descriptors remain.
> 
> Converting them to use optional GPIO descriptors is
> pretty straight-forward.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt5640: Convert to just use GPIO descriptors
      commit: a9b5f21073c0c687068f17e23385ec43fc643b08
[2/5] ASoC: rt5665: Convert to use GPIO descriptors
      commit: 647a3c4c33cd2c3902cdc07c50f3129166d715f5
[3/5] ASoC: rt5668: Convert to use GPIO descriptors
      commit: ab2a5d17064436585807f2ece5e6b4b03769a11f
[4/5] ASoC: rt5682: Convert to use GPIO descriptors
      commit: ed11701751d43fb2318c625e65e0507b5234f8a5
[5/5] ASoC: rt5682s: Convert to use GPIO descriptors
      commit: 8793bee716452e5e2f9bf085fbe01f9e3d1e659f

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

