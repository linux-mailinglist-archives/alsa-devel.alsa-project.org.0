Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC76DDD9C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 16:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC23EEC;
	Tue, 11 Apr 2023 16:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC23EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681222855;
	bh=YFzILxpIYiv63ImDz5bEYdEX92IZXgELxHml31Egi9w=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E+Ze6xekDGLi+e3f2Orf6GVfrGVMXjOhopVLmDc/rLLwyvHy5lmS1KV56n3A8F4XL
	 HFMpsaqxVGESbX1xnHv2xvEJGqVAHzckYUhxtPITl4cMezVZVIASfP2x3NFcnkoUMB
	 WRrZTWBTTsSOS0ZwJEe6Hlv4Z4TOYu0Fouh1X6bg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40AD6F804F2;
	Tue, 11 Apr 2023 16:19:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ACADF80448; Tue, 11 Apr 2023 16:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05DB6F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 16:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05DB6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tYOiw23H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7BE16275F;
	Tue, 11 Apr 2023 14:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77521C4339B;
	Tue, 11 Apr 2023 14:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681222749;
	bh=YFzILxpIYiv63ImDz5bEYdEX92IZXgELxHml31Egi9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tYOiw23H9xCmwv7lxuKfWTY+u4Mr5SGESCD2nPbHJQCm2POY2NGFGv1XyMgGIjBwN
	 RF9vFT9yZeJo8zU+1NLC9D5UiGRuaZ9af5tlexNI0bUYZEicW4ImdNIZIpeM0ZRra8
	 TgOExksGs1nvAIlN1e7AFAXnP6vqMpDI0GImVGOnwKf6mbLagutxCgHiXz1151Wu14
	 6SE+QQNwzDbqIVlUjZFEd/CB39nw5qYURnH5G0CB6AM87y5jsJkefxLhSDlJJqKhsF
	 VK+zn0woJV6CKxrcHQVxILYIvjGTY/+vBj5w88G4w8J9q3rQD8isiPp/w1cpHSXaFW
	 489SQA60dewPg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, Cem Kaya <cemkaya.boun@gmail.com>
In-Reply-To: <20230410183814.260518-1-cemkaya.boun@gmail.com>
References: <20230410183814.260518-1-cemkaya.boun@gmail.com>
Subject: Re: [PATCH v5] ASoC: amd: Add Dell G15 5525 to quirks list
Message-Id: <168122274720.54453.13789305143841583675.b4-ty@kernel.org>
Date: Tue, 11 Apr 2023 15:19:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: NWZ77C7IKYCBICJAD2QEIBP356ITZYZT
X-Message-ID-Hash: NWZ77C7IKYCBICJAD2QEIBP356ITZYZT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: mario.limonciello@amd.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWZ77C7IKYCBICJAD2QEIBP356ITZYZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Apr 2023 20:38:15 +0200, Cem Kaya wrote:
> Add Dell G15 5525 Ryzen Edition to quirks list for acp6x so that
> internal mic works.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Add Dell G15 5525 to quirks list
      commit: faf15233e59052f4d61cad2da6e56daf33124d96

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

