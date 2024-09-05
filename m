Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B896DC34
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67B7B65;
	Thu,  5 Sep 2024 16:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67B7B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725547469;
	bh=kn8IWovie9Ztxca1VoLhrlCB8UCzsBhW/erL0/lsOR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z9Dt6JdClWZxvttfPlwRQUOhJmWQgwzb7ucVoyC1F/9Rw9OXgM2PCLte7cIVo3hln
	 toSuuEbTOtrKoK9udsi9Cj7iS6a4Ll1ljWORh2QfyOXydNvsYfqgd7fQz9Ju3s8MGT
	 pJtkPF+VBQRhXh+8z4UALK9GVLFF1uXP3I8KWd2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E14F804F3; Thu,  5 Sep 2024 16:43:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C6D7F80536;
	Thu,  5 Sep 2024 16:43:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E483F8016C; Thu,  5 Sep 2024 16:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EE3CF80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EE3CF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ipggf7NM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AAB5A440A2;
	Thu,  5 Sep 2024 14:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1682C4CEC3;
	Thu,  5 Sep 2024 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725547429;
	bh=kn8IWovie9Ztxca1VoLhrlCB8UCzsBhW/erL0/lsOR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ipggf7NMKyUa/gAxukpHjiOqsOBpLq7Jr6bB/MxdWWIbIOjvD9nncsI3w2WXZdm7n
	 pcHUoUCa8P2rsqn7WTUt4mXns1WL6SK6aj56QutJMsrWjLAbWocqUKHBXwDtNzesRJ
	 7OgGrJTvVOUSbWi1fSSX3KrT5w8y0Z5q2UdSIc02o/ULQk4vFG/6b5ZcK4CH1sHyyd
	 Lc14fSRbkCF8wD9jyfWnYasN7C+crdc/9r8z2xj/u6i6xvEwvMKofNAAcPOa6VmWqv
	 bYaq7tD0I7XOQXDltDwq2OL8rM6emZl+9z0sOlAdBgK4aFTeL4vS0D9rbl/RGq7p8L
	 swC3rjCUEhwzg==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
In-Reply-To: <20240905095633.113784-1-andrei.simion@microchip.com>
References: <20240905095633.113784-1-andrei.simion@microchip.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-i2s-mcc: Improve maxburst
 calculation for better performance
Message-Id: <172554742664.49204.15446673448032504147.b4-ty@kernel.org>
Date: Thu, 05 Sep 2024 15:43:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: FM54M4VPOHYN5LG53YSNYZWMLR5BWJPB
X-Message-ID-Hash: FM54M4VPOHYN5LG53YSNYZWMLR5BWJPB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FM54M4VPOHYN5LG53YSNYZWMLR5BWJPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Sep 2024 12:56:33 +0300, Andrei Simion wrote:
> The period size represents the size of the DMA descriptor. To ensure all
> DMA descriptors start from a well-aligned address, the period size must
> be divided by (sample size * maxburst), not just by maxburst.
> This adjustment allows for computing a higher maxburst value, thereby
> increasing the performance of the DMA transfer.
> Previously, snd_pcm_lib_period_bytes() returned 0 because the runtime HW
> parameters are computed after the hw_params() callbacks are used.
> To address this, we now use params_*() functions to compute the period
> size accurately. This change optimizes the DMA transfer performance by
> ensuring proper alignment and efficient use of maxburst values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: mchp-i2s-mcc: Improve maxburst calculation for better performance
      commit: 03667e3d4fbcaf6228fd642464467366f0b693de

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

