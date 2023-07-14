Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49F754458
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 23:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684A19F6;
	Fri, 14 Jul 2023 23:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684A19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689370808;
	bh=u6bUZnuPgkiG1mpOveABAcLlLm1ACnoCY1B7/6s6WDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QFOeaPpmiZksu09PqHmIY7I+JcWQuKnSMs9uxF4x+DSBJd6sQeN2sDCBZARfNVEh9
	 f6hQxqdHHlyHtfdl6Li5gnPZD42HOzqw/T/TgXKreofUEKjyrz2bv8V1HbhQ3y4OjB
	 +cagkHt6hK6vVDjAg6xXuF6QqZRB5/3vl249ljxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE7DF80153; Fri, 14 Jul 2023 23:39:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B485F80236;
	Fri, 14 Jul 2023 23:39:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C154F80249; Fri, 14 Jul 2023 23:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FA53F800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 23:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA53F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rcvkijuP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4D5361DF1;
	Fri, 14 Jul 2023 21:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73D4C433C8;
	Fri, 14 Jul 2023 21:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689370740;
	bh=u6bUZnuPgkiG1mpOveABAcLlLm1ACnoCY1B7/6s6WDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rcvkijuPhAZuzcvRJ2vV81HdO5ca2jqbZOkGLvT8GHL+blvFS7gp4PG+KVxRTUQFt
	 oxDKCKHe0G4dMoWJjq57U0kVWsQN+zte4QG0D8e50/eP6EOg0DMIyA7Nzdbl7ScNul
	 12j4e5Q/zx19+ZXr9/93PIrgi1k+XRqd13PzNSS00IKTajTkYKitSi+1Bnjym6mdlM
	 dDYsJUAxryhPzIRmvGverlfg5vCL2fqtyTrqMywAxqEH62TnCDcBP552oe4tGGXN3O
	 06iAy8EZQY3MbNyd330953nUd4axYIMWYWk7KLQEZq/yqawIdwi0vtuw4D9KUnJf+8
	 B1g36lR2zulXA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhu Ning <zhuning0077@gmail.com>
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
 zhuning@everest-semi.com
In-Reply-To: <20230714032453.3334-1-zhuning0077@gmail.com>
References: <20230714032453.3334-1-zhuning0077@gmail.com>
Subject: Re: [PATCH v1 1/5] ASoC: codecs: ES8326: Add es8326_mute function
Message-Id: <168937073863.225112.12552430087021248085.b4-ty@kernel.org>
Date: Fri, 14 Jul 2023 22:38:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: NWYM5EAYYC7Y4FMWO6PZ3M7BCXE6WQVV
X-Message-ID-Hash: NWYM5EAYYC7Y4FMWO6PZ3M7BCXE6WQVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWYM5EAYYC7Y4FMWO6PZ3M7BCXE6WQVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Jul 2023 11:24:49 +0800, Zhu Ning wrote:
> The internal analog power and hp Vref of es8326 should always be on to
> reduce pop noise. The HP_VOL and HP_CAL are moved to es8326_mute function
> so they are turned on at last and turned off at first.
> 
> Also, the calibration should be done manually once during start-up
> to reduce DC offset on headphone.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: ES8326: Add es8326_mute function
      commit: 083912c240de0c5f797da0443f5a99e87b75fcb3
[2/5] ASoC: codecs: ES8326: Change Hp_detect and volatile reg function
      (no commit info)
[3/5] ASoC: codecs: ES8326: Fix power-up sequence
      (no commit info)
[4/5] ASOC: codecs: ES8326: Add calibration support for version_b
      (no commit info)
[5/5] ASoC: codecs: ES8326: Update jact detection function
      (no commit info)

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

